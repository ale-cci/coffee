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
%.tmp940 = getelementptr i8*, i8** %buf.866, i32 0
%.tmp942 = getelementptr [5 x i8], [5 x i8]*@.str941, i32 0, i32 0
%.tmp943 = load i8*, i8** %buf.866
%.tmp944 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp940, i8* %.tmp942, i8* %.tmp943)
%.tmp945 = load i8*, i8** %buf.866
ret i8* %.tmp945
}
define i8* @m296$to_string.cp.m296$.Error.typep(%m296$.Error.type* %.e.arg) {
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp947 = getelementptr [1 x i8], [1 x i8]*@.str946, i32 0, i32 0
%buf.948 = alloca i8*
store i8* %.tmp947, i8** %buf.948
%.tmp949 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp950 = call i8*(%m296$.Error.type*) @m296$_context.cp.m296$.Error.typep(%m296$.Error.type* %.tmp949)
%ctx.951 = alloca i8*
store i8* %.tmp950, i8** %ctx.951
%.tmp952 = getelementptr i8*, i8** %buf.948, i32 0
%.tmp954 = getelementptr [24 x i8], [24 x i8]*@.str953, i32 0, i32 0
%.tmp955 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp956 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp955, i32 0, i32 2
%.tmp957 = load i8*, i8** %.tmp956
%.tmp958 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp959 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp958, i32 0, i32 0
%.tmp960 = load i32, i32* %.tmp959
%.tmp961 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp962 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp961, i32 0, i32 1
%.tmp963 = load i32, i32* %.tmp962
%.tmp964 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp965 = getelementptr %m296$.Error.type, %m296$.Error.type* %.tmp964, i32 0, i32 3
%.tmp966 = load i8*, i8** %.tmp965
%.tmp967 = load i8*, i8** %ctx.951
%.tmp968 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp952, i8* %.tmp954, i8* %.tmp957, i32 %.tmp960, i32 %.tmp963, i8* %.tmp966, i8* %.tmp967)
%.tmp969 = load i8*, i8** %buf.948
ret i8* %.tmp969
}
define void @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.e.arg) {
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp971 = getelementptr [3 x i8], [3 x i8]*@.str970, i32 0, i32 0
%.tmp972 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp973 = call i8*(%m296$.Error.type*) @m296$to_string.cp.m296$.Error.typep(%m296$.Error.type* %.tmp972)
%.tmp974 = call i32(i8*,...) @printf(i8* %.tmp971, i8* %.tmp973)
ret void
}
define void @m296$freport.v.m0$.File.typep.m296$.Error.typep(%m0$.File.type* %.fd.arg, %m296$.Error.type* %.e.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp975 = load %m0$.File.type*, %m0$.File.type** %fd
%.tmp977 = getelementptr [3 x i8], [3 x i8]*@.str976, i32 0, i32 0
%.tmp978 = load %m296$.Error.type*, %m296$.Error.type** %e
%.tmp979 = call i8*(%m296$.Error.type*) @m296$to_string.cp.m296$.Error.typep(%m296$.Error.type* %.tmp978)
%.tmp980 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp975, i8* %.tmp977, i8* %.tmp979)
ret void
}
%m981$.Query.type = type {i8,i8*,%m981$.Query.type*}
%m981$.Matcher.type = type {%m981$.Query.type*,i8,%m981$.Matcher.type*,%m981$.Matcher.type*}
%m981$.Rule.type = type {i8*,i8*,%m981$.Matcher.type*}
%m981$.ParsingContext.type = type {%m297$.Token.type*}
define %m981$.ParsingContext.type* @m981$new_context.m981$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.f.arg) {
%f = alloca %m0$.File.type*
store %m0$.File.type* %.f.arg, %m0$.File.type** %f
%.tmp982 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* null, i32 1
%.tmp983 = ptrtoint %m981$.ParsingContext.type* %.tmp982 to i32
%.tmp984 = call i8*(i32) @malloc(i32 %.tmp983)
%.tmp985 = bitcast i8* %.tmp984 to %m981$.ParsingContext.type*
%ctx.986 = alloca %m981$.ParsingContext.type*
store %m981$.ParsingContext.type* %.tmp985, %m981$.ParsingContext.type** %ctx.986
%.tmp987 = load %m0$.File.type*, %m0$.File.type** %f
%.tmp988 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp987)
%fd.989 = alloca i32
store i32 %.tmp988, i32* %fd.989
%.tmp990 = load i32, i32* %fd.989
%.tmp991 = call %m298$.PeekerInfo.type*(i32) @m298$new.m298$.PeekerInfo.typep.i(i32 %.tmp990)
%p.992 = alloca %m298$.PeekerInfo.type*
store %m298$.PeekerInfo.type* %.tmp991, %m298$.PeekerInfo.type** %p.992
%.tmp993 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.992
%.tmp994 = call %m297$.Token.type*(%m298$.PeekerInfo.type*,i1) @m297$tokenize.m297$.Token.typep.m298$.PeekerInfo.typep.b(%m298$.PeekerInfo.type* %.tmp993, i1 0)
%token_list.995 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp994, %m297$.Token.type** %token_list.995
%.tmp996 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.992
%.tmp997 = bitcast %m298$.PeekerInfo.type* %.tmp996 to i8*
call void(i8*) @free(i8* %.tmp997)
%.tmp998 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx.986
%.tmp999 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp998, i32 0, i32 0
%.tmp1000 = load %m297$.Token.type*, %m297$.Token.type** %token_list.995
store %m297$.Token.type* %.tmp1000, %m297$.Token.type** %.tmp999
%.tmp1001 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx.986
ret %m981$.ParsingContext.type* %.tmp1001
}
define %m981$.Matcher.type* @m981$new_matcher.m981$.Matcher.typep() {
%.tmp1002 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* null, i32 1
%.tmp1003 = ptrtoint %m981$.Matcher.type* %.tmp1002 to i32
%.tmp1004 = call i8*(i32) @malloc(i32 %.tmp1003)
%.tmp1005 = bitcast i8* %.tmp1004 to %m981$.Matcher.type*
%m.1006 = alloca %m981$.Matcher.type*
store %m981$.Matcher.type* %.tmp1005, %m981$.Matcher.type** %m.1006
%.tmp1007 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m.1006
%.tmp1008 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1007, i32 0, i32 1
store i8 49, i8* %.tmp1008
%.tmp1009 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m.1006
%.tmp1010 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1009, i32 0, i32 2
store %m981$.Matcher.type* null, %m981$.Matcher.type** %.tmp1010
%.tmp1011 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m.1006
%.tmp1012 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1011, i32 0, i32 3
store %m981$.Matcher.type* null, %m981$.Matcher.type** %.tmp1012
%.tmp1013 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m.1006
%.tmp1014 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1013, i32 0, i32 0
store %m981$.Query.type* null, %m981$.Query.type** %.tmp1014
%.tmp1015 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m.1006
ret %m981$.Matcher.type* %.tmp1015
}
define %m981$.Matcher.type* @m981$parse_matcher.m981$.Matcher.typep.m981$.ParsingContext.typep(%m981$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m981$.ParsingContext.type*
store %m981$.ParsingContext.type* %.ctx.arg, %m981$.ParsingContext.type** %ctx
%m.1016 = alloca %m981$.Matcher.type*
store %m981$.Matcher.type* null, %m981$.Matcher.type** %m.1016
%.tmp1017 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1018 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1017, i32 0, i32 0
%.tmp1019 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1018
%.tmp1020 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1019, i32 0, i32 1
%.tmp1021 = load i8*, i8** %.tmp1020
%.tmp1023 = getelementptr [2 x i8], [2 x i8]*@.str1022, i32 0, i32 0
%.tmp1024 = call i32(i8*,i8*) @strcmp(i8* %.tmp1021, i8* %.tmp1023)
%.tmp1025 = icmp eq i32 %.tmp1024, 0
br i1 %.tmp1025, label %.if.true.1026, label %.if.false.1026
.if.true.1026:
%.tmp1027 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1028 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1027, i32 0, i32 0
%.tmp1029 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1030 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1029, i32 0, i32 0
%.tmp1031 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1030
%.tmp1032 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1031, i32 0, i32 5
%.tmp1033 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1032
store %m297$.Token.type* %.tmp1033, %m297$.Token.type** %.tmp1028
%max_matchers.1034 = alloca i32
store i32 10, i32* %max_matchers.1034
%.tmp1035 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1036 = call %m981$.Matcher.type*(%m981$.ParsingContext.type*) @m981$parse_matcher.m981$.Matcher.typep.m981$.ParsingContext.typep(%m981$.ParsingContext.type* %.tmp1035)
store %m981$.Matcher.type* %.tmp1036, %m981$.Matcher.type** %m.1016
%.tmp1037 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1038 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1037, i32 0, i32 0
%.tmp1039 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1038
%.tmp1040 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1039, i32 0, i32 1
%.tmp1041 = load i8*, i8** %.tmp1040
%.tmp1043 = getelementptr [2 x i8], [2 x i8]*@.str1042, i32 0, i32 0
%.tmp1044 = call i32(i8*,i8*) @strcmp(i8* %.tmp1041, i8* %.tmp1043)
%.tmp1045 = icmp eq i32 %.tmp1044, 0
br i1 %.tmp1045, label %.if.true.1046, label %.if.false.1046
.if.true.1046:
%.tmp1047 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1048 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1047, i32 0, i32 0
%.tmp1049 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1050 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1049, i32 0, i32 0
%.tmp1051 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1050
%.tmp1052 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1051, i32 0, i32 5
%.tmp1053 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1052
store %m297$.Token.type* %.tmp1053, %m297$.Token.type** %.tmp1048
%.tmp1054 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m.1016
%last_matcher.1055 = alloca %m981$.Matcher.type*
store %m981$.Matcher.type* %.tmp1054, %m981$.Matcher.type** %last_matcher.1055
br label %.for.start.1056
.for.start.1056:
%.tmp1057 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1058 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1057, i32 0, i32 0
%.tmp1059 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1058
%.tmp1060 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1059, i32 0, i32 1
%.tmp1061 = load i8*, i8** %.tmp1060
%.tmp1063 = getelementptr [2 x i8], [2 x i8]*@.str1062, i32 0, i32 0
%.tmp1064 = call i32(i8*,i8*) @strcmp(i8* %.tmp1061, i8* %.tmp1063)
%.tmp1065 = icmp ne i32 %.tmp1064, 0
%.tmp1066 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1067 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1066, i32 0, i32 0
%.tmp1068 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1067
%.tmp1069 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1068, i32 0, i32 0
%.tmp1070 = load i8*, i8** %.tmp1069
%.tmp1072 = getelementptr [4 x i8], [4 x i8]*@.str1071, i32 0, i32 0
%.tmp1073 = call i32(i8*,i8*) @strcmp(i8* %.tmp1070, i8* %.tmp1072)
%.tmp1074 = icmp ne i32 %.tmp1073, 0
%.tmp1075 = and i1 %.tmp1065, %.tmp1074
br i1 %.tmp1075, label %.for.continue.1056, label %.for.end.1056
.for.continue.1056:
%.tmp1076 = load %m981$.Matcher.type*, %m981$.Matcher.type** %last_matcher.1055
%.tmp1077 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1076, i32 0, i32 2
%.tmp1078 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1079 = call %m981$.Matcher.type*(%m981$.ParsingContext.type*) @m981$parse_matcher.m981$.Matcher.typep.m981$.ParsingContext.typep(%m981$.ParsingContext.type* %.tmp1078)
store %m981$.Matcher.type* %.tmp1079, %m981$.Matcher.type** %.tmp1077
%.tmp1080 = load %m981$.Matcher.type*, %m981$.Matcher.type** %last_matcher.1055
%.tmp1081 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1080, i32 0, i32 2
%.tmp1082 = load %m981$.Matcher.type*, %m981$.Matcher.type** %.tmp1081
store %m981$.Matcher.type* %.tmp1082, %m981$.Matcher.type** %last_matcher.1055
%.tmp1083 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1084 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1083, i32 0, i32 0
%.tmp1085 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1084
%.tmp1086 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1085, i32 0, i32 1
%.tmp1087 = load i8*, i8** %.tmp1086
%.tmp1089 = getelementptr [2 x i8], [2 x i8]*@.str1088, i32 0, i32 0
%.tmp1090 = call i32(i8*,i8*) @strcmp(i8* %.tmp1087, i8* %.tmp1089)
%.tmp1091 = icmp ne i32 %.tmp1090, 0
%.tmp1092 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1093 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1092, i32 0, i32 0
%.tmp1094 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1093
%.tmp1095 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1094, i32 0, i32 1
%.tmp1096 = load i8*, i8** %.tmp1095
%.tmp1098 = getelementptr [2 x i8], [2 x i8]*@.str1097, i32 0, i32 0
%.tmp1099 = call i32(i8*,i8*) @strcmp(i8* %.tmp1096, i8* %.tmp1098)
%.tmp1100 = icmp ne i32 %.tmp1099, 0
%.tmp1101 = and i1 %.tmp1091, %.tmp1100
br i1 %.tmp1101, label %.if.true.1102, label %.if.false.1102
.if.true.1102:
%.tmp1104 = getelementptr [48 x i8], [48 x i8]*@.str1103, i32 0, i32 0
%.tmp1105 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1106 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1105, i32 0, i32 0
%.tmp1107 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1106
%.tmp1108 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1107, i32 0, i32 2
%.tmp1109 = load i32, i32* %.tmp1108
%.tmp1110 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1111 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1110, i32 0, i32 0
%.tmp1112 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1111
%.tmp1113 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1112, i32 0, i32 3
%.tmp1114 = load i32, i32* %.tmp1113
%.tmp1115 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1116 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1115, i32 0, i32 0
%.tmp1117 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1116
%.tmp1118 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1117, i32 0, i32 1
%.tmp1119 = load i8*, i8** %.tmp1118
%.tmp1120 = call i32(i8*,...) @printf(i8* %.tmp1104, i32 %.tmp1109, i32 %.tmp1114, i8* %.tmp1119)
call void(i32) @exit(i32 1)
br label %.if.end.1102
.if.false.1102:
br label %.if.end.1102
.if.end.1102:
%.tmp1121 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1122 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1121, i32 0, i32 0
%.tmp1123 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1122
%.tmp1124 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1123, i32 0, i32 1
%.tmp1125 = load i8*, i8** %.tmp1124
%.tmp1127 = getelementptr [2 x i8], [2 x i8]*@.str1126, i32 0, i32 0
%.tmp1128 = call i32(i8*,i8*) @strcmp(i8* %.tmp1125, i8* %.tmp1127)
%.tmp1129 = icmp eq i32 %.tmp1128, 0
br i1 %.tmp1129, label %.if.true.1130, label %.if.false.1130
.if.true.1130:
%.tmp1131 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1132 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1131, i32 0, i32 0
%.tmp1133 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1134 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1133, i32 0, i32 0
%.tmp1135 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1134
%.tmp1136 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1135, i32 0, i32 5
%.tmp1137 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1136
store %m297$.Token.type* %.tmp1137, %m297$.Token.type** %.tmp1132
br label %.if.end.1130
.if.false.1130:
br label %.if.end.1130
.if.end.1130:
br label %.for.start.1056
.for.end.1056:
br label %.if.end.1046
.if.false.1046:
br label %.if.end.1046
.if.end.1046:
%.tmp1138 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1139 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1138, i32 0, i32 0
%.tmp1140 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1139
%.tmp1141 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1140, i32 0, i32 1
%.tmp1142 = load i8*, i8** %.tmp1141
%.tmp1144 = getelementptr [2 x i8], [2 x i8]*@.str1143, i32 0, i32 0
%.tmp1145 = call i32(i8*,i8*) @strcmp(i8* %.tmp1142, i8* %.tmp1144)
%.tmp1146 = icmp ne i32 %.tmp1145, 0
br i1 %.tmp1146, label %.if.true.1147, label %.if.false.1147
.if.true.1147:
%.tmp1148 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1150 = getelementptr [22 x i8], [22 x i8]*@.str1149, i32 0, i32 0
call void(%m981$.ParsingContext.type*,i8*) @m981$parser_error.v.m981$.ParsingContext.typep.cp(%m981$.ParsingContext.type* %.tmp1148, i8* %.tmp1150)
br label %.if.end.1147
.if.false.1147:
br label %.if.end.1147
.if.end.1147:
%.tmp1151 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1152 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1151, i32 0, i32 0
%.tmp1153 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1154 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1153, i32 0, i32 0
%.tmp1155 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1154
%.tmp1156 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1155, i32 0, i32 5
%.tmp1157 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1156
store %m297$.Token.type* %.tmp1157, %m297$.Token.type** %.tmp1152
%.tmp1158 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1159 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1158, i32 0, i32 0
%.tmp1160 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1159
%.tmp1161 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1160, i32 0, i32 1
%.tmp1162 = load i8*, i8** %.tmp1161
%.tmp1164 = getelementptr [2 x i8], [2 x i8]*@.str1163, i32 0, i32 0
%.tmp1165 = call i32(i8*,i8*) @strcmp(i8* %.tmp1162, i8* %.tmp1164)
%.tmp1166 = icmp eq i32 %.tmp1165, 0
br i1 %.tmp1166, label %.if.true.1167, label %.if.false.1167
.if.true.1167:
%.tmp1168 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1169 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1168, i32 0, i32 0
%.tmp1170 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1171 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1170, i32 0, i32 0
%.tmp1172 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1171
%.tmp1173 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1172, i32 0, i32 5
%.tmp1174 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1173
store %m297$.Token.type* %.tmp1174, %m297$.Token.type** %.tmp1169
%.tmp1175 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m.1016
%.tmp1176 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1175, i32 0, i32 1
store i8 43, i8* %.tmp1176
br label %.if.end.1167
.if.false.1167:
%.tmp1177 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1178 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1177, i32 0, i32 0
%.tmp1179 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1178
%.tmp1180 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1179, i32 0, i32 1
%.tmp1181 = load i8*, i8** %.tmp1180
%.tmp1183 = getelementptr [2 x i8], [2 x i8]*@.str1182, i32 0, i32 0
%.tmp1184 = call i32(i8*,i8*) @strcmp(i8* %.tmp1181, i8* %.tmp1183)
%.tmp1185 = icmp eq i32 %.tmp1184, 0
br i1 %.tmp1185, label %.if.true.1186, label %.if.false.1186
.if.true.1186:
%.tmp1187 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1188 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1187, i32 0, i32 0
%.tmp1189 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1190 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1189, i32 0, i32 0
%.tmp1191 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1190
%.tmp1192 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1191, i32 0, i32 5
%.tmp1193 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1192
store %m297$.Token.type* %.tmp1193, %m297$.Token.type** %.tmp1188
%.tmp1194 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m.1016
%.tmp1195 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1194, i32 0, i32 1
store i8 42, i8* %.tmp1195
br label %.if.end.1186
.if.false.1186:
%.tmp1196 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1197 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1196, i32 0, i32 0
%.tmp1198 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1197
%.tmp1199 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1198, i32 0, i32 1
%.tmp1200 = load i8*, i8** %.tmp1199
%.tmp1202 = getelementptr [2 x i8], [2 x i8]*@.str1201, i32 0, i32 0
%.tmp1203 = call i32(i8*,i8*) @strcmp(i8* %.tmp1200, i8* %.tmp1202)
%.tmp1204 = icmp eq i32 %.tmp1203, 0
br i1 %.tmp1204, label %.if.true.1205, label %.if.false.1205
.if.true.1205:
%.tmp1206 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1207 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1206, i32 0, i32 0
%.tmp1208 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1209 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1208, i32 0, i32 0
%.tmp1210 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1209
%.tmp1211 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1210, i32 0, i32 5
%.tmp1212 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1211
store %m297$.Token.type* %.tmp1212, %m297$.Token.type** %.tmp1207
%.tmp1213 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m.1016
%.tmp1214 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1213, i32 0, i32 1
store i8 63, i8* %.tmp1214
br label %.if.end.1205
.if.false.1205:
br label %.if.end.1205
.if.end.1205:
br label %.if.end.1186
.if.end.1186:
br label %.if.end.1167
.if.end.1167:
br label %.if.end.1026
.if.false.1026:
%.tmp1215 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1216 = call %m981$.Matcher.type*(%m981$.ParsingContext.type*) @m981$parse_simple_matcher.m981$.Matcher.typep.m981$.ParsingContext.typep(%m981$.ParsingContext.type* %.tmp1215)
store %m981$.Matcher.type* %.tmp1216, %m981$.Matcher.type** %m.1016
br label %.if.end.1026
.if.end.1026:
%.tmp1217 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1218 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1217, i32 0, i32 0
%.tmp1219 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1218
%.tmp1220 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1219, i32 0, i32 1
%.tmp1221 = load i8*, i8** %.tmp1220
%.tmp1223 = getelementptr [2 x i8], [2 x i8]*@.str1222, i32 0, i32 0
%.tmp1224 = call i32(i8*,i8*) @strcmp(i8* %.tmp1221, i8* %.tmp1223)
%.tmp1225 = icmp eq i32 %.tmp1224, 0
%.tmp1226 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1227 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1226, i32 0, i32 0
%.tmp1228 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1227
%.tmp1229 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1228, i32 0, i32 0
%.tmp1230 = load i8*, i8** %.tmp1229
%.tmp1232 = getelementptr [5 x i8], [5 x i8]*@.str1231, i32 0, i32 0
%.tmp1233 = call i32(i8*,i8*) @strcmp(i8* %.tmp1230, i8* %.tmp1232)
%.tmp1234 = icmp eq i32 %.tmp1233, 0
%.tmp1235 = or i1 %.tmp1225, %.tmp1234
br i1 %.tmp1235, label %.if.true.1236, label %.if.false.1236
.if.true.1236:
%.tmp1237 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m.1016
%.tmp1238 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1237, i32 0, i32 3
%.tmp1239 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1240 = call %m981$.Matcher.type*(%m981$.ParsingContext.type*) @m981$parse_matcher.m981$.Matcher.typep.m981$.ParsingContext.typep(%m981$.ParsingContext.type* %.tmp1239)
store %m981$.Matcher.type* %.tmp1240, %m981$.Matcher.type** %.tmp1238
br label %.if.end.1236
.if.false.1236:
br label %.if.end.1236
.if.end.1236:
%.tmp1241 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m.1016
ret %m981$.Matcher.type* %.tmp1241
}
define %m981$.Matcher.type* @m981$parse_simple_matcher.m981$.Matcher.typep.m981$.ParsingContext.typep(%m981$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m981$.ParsingContext.type*
store %m981$.ParsingContext.type* %.ctx.arg, %m981$.ParsingContext.type** %ctx
%.tmp1242 = call %m981$.Matcher.type*() @m981$new_matcher.m981$.Matcher.typep()
%m.1243 = alloca %m981$.Matcher.type*
store %m981$.Matcher.type* %.tmp1242, %m981$.Matcher.type** %m.1243
%count.1244 = alloca i32
store i32 0, i32* %count.1244
%.tmp1245 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1246 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1245, i32 0, i32 0
%.tmp1247 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1246
%ptr.1248 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1247, %m297$.Token.type** %ptr.1248
store i32 0, i32* %count.1244
br label %.for.start.1249
.for.start.1249:
%.tmp1250 = load %m297$.Token.type*, %m297$.Token.type** %ptr.1248
%.tmp1251 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1250, i32 0, i32 0
%.tmp1252 = load i8*, i8** %.tmp1251
%.tmp1254 = getelementptr [5 x i8], [5 x i8]*@.str1253, i32 0, i32 0
%.tmp1255 = call i32(i8*,i8*) @strcmp(i8* %.tmp1252, i8* %.tmp1254)
%.tmp1256 = icmp eq i32 %.tmp1255, 0
%.tmp1257 = load %m297$.Token.type*, %m297$.Token.type** %ptr.1248
%.tmp1258 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1257, i32 0, i32 0
%.tmp1259 = load i8*, i8** %.tmp1258
%.tmp1261 = getelementptr [7 x i8], [7 x i8]*@.str1260, i32 0, i32 0
%.tmp1262 = call i32(i8*,i8*) @strcmp(i8* %.tmp1259, i8* %.tmp1261)
%.tmp1263 = icmp eq i32 %.tmp1262, 0
%.tmp1264 = or i1 %.tmp1256, %.tmp1263
br i1 %.tmp1264, label %.for.continue.1249, label %.for.end.1249
.for.continue.1249:
%.tmp1265 = load i32, i32* %count.1244
%.tmp1266 = add i32 %.tmp1265, 1
store i32 %.tmp1266, i32* %count.1244
%.tmp1267 = load %m297$.Token.type*, %m297$.Token.type** %ptr.1248
%.tmp1268 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1267, i32 0, i32 5
%.tmp1269 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1268
store %m297$.Token.type* %.tmp1269, %m297$.Token.type** %ptr.1248
br label %.for.start.1249
.for.end.1249:
%.tmp1270 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m.1243
%.tmp1271 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1270, i32 0, i32 0
%.tmp1272 = getelementptr %m981$.Query.type, %m981$.Query.type* null, i32 1
%.tmp1273 = ptrtoint %m981$.Query.type* %.tmp1272 to i32
%.tmp1274 = call i8*(i32) @malloc(i32 %.tmp1273)
%.tmp1275 = bitcast i8* %.tmp1274 to %m981$.Query.type*
store %m981$.Query.type* %.tmp1275, %m981$.Query.type** %.tmp1271
%.tmp1276 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m.1243
%.tmp1277 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1276, i32 0, i32 0
%.tmp1278 = load %m981$.Query.type*, %m981$.Query.type** %.tmp1277
%q.1279 = alloca %m981$.Query.type*
store %m981$.Query.type* %.tmp1278, %m981$.Query.type** %q.1279
%i.1281 = alloca i32
store i32 0, i32* %i.1281
br label %.for.start.1280
.for.start.1280:
%.tmp1282 = load i32, i32* %i.1281
%.tmp1283 = load i32, i32* %count.1244
%.tmp1284 = icmp slt i32 %.tmp1282, %.tmp1283
br i1 %.tmp1284, label %.for.continue.1280, label %.for.end.1280
.for.continue.1280:
%.tmp1285 = load i32, i32* %i.1281
%.tmp1286 = icmp sgt i32 %.tmp1285, 0
br i1 %.tmp1286, label %.if.true.1287, label %.if.false.1287
.if.true.1287:
%.tmp1288 = load %m981$.Query.type*, %m981$.Query.type** %q.1279
%.tmp1289 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1288, i32 0, i32 2
%.tmp1290 = getelementptr %m981$.Query.type, %m981$.Query.type* null, i32 1
%.tmp1291 = ptrtoint %m981$.Query.type* %.tmp1290 to i32
%.tmp1292 = call i8*(i32) @malloc(i32 %.tmp1291)
%.tmp1293 = bitcast i8* %.tmp1292 to %m981$.Query.type*
store %m981$.Query.type* %.tmp1293, %m981$.Query.type** %.tmp1289
%.tmp1294 = load %m981$.Query.type*, %m981$.Query.type** %q.1279
%.tmp1295 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1294, i32 0, i32 2
%.tmp1296 = load %m981$.Query.type*, %m981$.Query.type** %.tmp1295
store %m981$.Query.type* %.tmp1296, %m981$.Query.type** %q.1279
br label %.if.end.1287
.if.false.1287:
br label %.if.end.1287
.if.end.1287:
%.tmp1297 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1298 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1297, i32 0, i32 0
%.tmp1299 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1298
%.tmp1300 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1299, i32 0, i32 0
%.tmp1301 = load i8*, i8** %.tmp1300
%.tmp1303 = getelementptr [7 x i8], [7 x i8]*@.str1302, i32 0, i32 0
%.tmp1304 = call i32(i8*,i8*) @strcmp(i8* %.tmp1301, i8* %.tmp1303)
%.tmp1305 = icmp eq i32 %.tmp1304, 0
br i1 %.tmp1305, label %.if.true.1306, label %.if.false.1306
.if.true.1306:
%.tmp1307 = load %m981$.Query.type*, %m981$.Query.type** %q.1279
%.tmp1308 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1307, i32 0, i32 0
store i8 118, i8* %.tmp1308
br label %.if.end.1306
.if.false.1306:
%.tmp1309 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1310 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1309, i32 0, i32 0
%.tmp1311 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1310
%.tmp1312 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1311, i32 0, i32 1
%.tmp1313 = load i8*, i8** %.tmp1312
%.tmp1314 = call i1(i8*) @m3$is_lower.b.cp(i8* %.tmp1313)
br i1 %.tmp1314, label %.if.true.1315, label %.if.false.1315
.if.true.1315:
%.tmp1316 = load %m981$.Query.type*, %m981$.Query.type** %q.1279
%.tmp1317 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1316, i32 0, i32 0
store i8 97, i8* %.tmp1317
br label %.if.end.1315
.if.false.1315:
%.tmp1318 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1319 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1318, i32 0, i32 0
%.tmp1320 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1319
%.tmp1321 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1320, i32 0, i32 1
%.tmp1322 = load i8*, i8** %.tmp1321
%.tmp1323 = call i1(i8*) @m3$is_upper.b.cp(i8* %.tmp1322)
br i1 %.tmp1323, label %.if.true.1324, label %.if.false.1324
.if.true.1324:
%.tmp1325 = load %m981$.Query.type*, %m981$.Query.type** %q.1279
%.tmp1326 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1325, i32 0, i32 0
store i8 116, i8* %.tmp1326
br label %.if.end.1324
.if.false.1324:
%.tmp1328 = getelementptr [17 x i8], [17 x i8]*@.str1327, i32 0, i32 0
%.tmp1329 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1330 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1329, i32 0, i32 0
%.tmp1331 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1330
%.tmp1332 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1331, i32 0, i32 1
%.tmp1333 = load i8*, i8** %.tmp1332
%.tmp1334 = call i32(i8*,...) @printf(i8* %.tmp1328, i8* %.tmp1333)
%.tmp1335 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1337 = getelementptr [50 x i8], [50 x i8]*@.str1336, i32 0, i32 0
call void(%m981$.ParsingContext.type*,i8*) @m981$parser_error.v.m981$.ParsingContext.typep.cp(%m981$.ParsingContext.type* %.tmp1335, i8* %.tmp1337)
br label %.if.end.1324
.if.end.1324:
br label %.if.end.1315
.if.end.1315:
br label %.if.end.1306
.if.end.1306:
%.tmp1338 = load %m981$.Query.type*, %m981$.Query.type** %q.1279
%.tmp1339 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1338, i32 0, i32 1
%.tmp1340 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1341 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1340, i32 0, i32 0
%.tmp1342 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1341
%.tmp1343 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1342, i32 0, i32 1
%.tmp1344 = load i8*, i8** %.tmp1343
store i8* %.tmp1344, i8** %.tmp1339
%.tmp1345 = load %m981$.Query.type*, %m981$.Query.type** %q.1279
%.tmp1346 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1345, i32 0, i32 2
store %m981$.Query.type* null, %m981$.Query.type** %.tmp1346
%.tmp1347 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1348 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1347, i32 0, i32 0
%.tmp1349 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1350 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1349, i32 0, i32 0
%.tmp1351 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1350
%.tmp1352 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1351, i32 0, i32 5
%.tmp1353 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1352
store %m297$.Token.type* %.tmp1353, %m297$.Token.type** %.tmp1348
%.tmp1354 = load i32, i32* %i.1281
%.tmp1355 = add i32 %.tmp1354, 1
store i32 %.tmp1355, i32* %i.1281
br label %.for.start.1280
.for.end.1280:
%.tmp1356 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m.1243
ret %m981$.Matcher.type* %.tmp1356
}
define %m981$.Rule.type* @m981$parse_rule.m981$.Rule.typep.m981$.ParsingContext.typep(%m981$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m981$.ParsingContext.type*
store %m981$.ParsingContext.type* %.ctx.arg, %m981$.ParsingContext.type** %ctx
%.tmp1357 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1358 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1357, i32 0, i32 0
%.tmp1359 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1358
%.tmp1360 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1359, i32 0, i32 1
%.tmp1361 = load i8*, i8** %.tmp1360
%rule_name.1362 = alloca i8*
store i8* %.tmp1361, i8** %rule_name.1362
%.tmp1363 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1364 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1363, i32 0, i32 0
%.tmp1365 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1364
%.tmp1366 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1365, i32 0, i32 0
%.tmp1367 = load i8*, i8** %.tmp1366
%.tmp1369 = getelementptr [5 x i8], [5 x i8]*@.str1368, i32 0, i32 0
%.tmp1370 = call i32(i8*,i8*) @strcmp(i8* %.tmp1367, i8* %.tmp1369)
%.tmp1371 = icmp ne i32 %.tmp1370, 0
br i1 %.tmp1371, label %.if.true.1372, label %.if.false.1372
.if.true.1372:
%.tmp1374 = getelementptr [37 x i8], [37 x i8]*@.str1373, i32 0, i32 0
%.tmp1375 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1376 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1375, i32 0, i32 0
%.tmp1377 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1376
%.tmp1378 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1377, i32 0, i32 0
%.tmp1379 = load i8*, i8** %.tmp1378
%.tmp1380 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1381 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1380, i32 0, i32 0
%.tmp1382 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1381
%.tmp1383 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1382, i32 0, i32 1
%.tmp1384 = load i8*, i8** %.tmp1383
%.tmp1385 = call i32(i8*,...) @printf(i8* %.tmp1374, i8* %.tmp1379, i8* %.tmp1384)
%.tmp1386 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1388 = getelementptr [31 x i8], [31 x i8]*@.str1387, i32 0, i32 0
call void(%m981$.ParsingContext.type*,i8*) @m981$parser_error.v.m981$.ParsingContext.typep.cp(%m981$.ParsingContext.type* %.tmp1386, i8* %.tmp1388)
br label %.if.end.1372
.if.false.1372:
br label %.if.end.1372
.if.end.1372:
%.tmp1389 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1390 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1389, i32 0, i32 0
%.tmp1391 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1392 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1391, i32 0, i32 0
%.tmp1393 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1392
%.tmp1394 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1393, i32 0, i32 5
%.tmp1395 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1394
store %m297$.Token.type* %.tmp1395, %m297$.Token.type** %.tmp1390
%.tmp1397 = getelementptr [1 x i8], [1 x i8]*@.str1396, i32 0, i32 0
%transformer_name.1398 = alloca i8*
store i8* %.tmp1397, i8** %transformer_name.1398
%.tmp1399 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1400 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1399, i32 0, i32 0
%.tmp1401 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1400
%.tmp1402 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1401, i32 0, i32 1
%.tmp1403 = load i8*, i8** %.tmp1402
%.tmp1405 = getelementptr [2 x i8], [2 x i8]*@.str1404, i32 0, i32 0
%.tmp1406 = call i32(i8*,i8*) @strcmp(i8* %.tmp1403, i8* %.tmp1405)
%.tmp1407 = icmp eq i32 %.tmp1406, 0
br i1 %.tmp1407, label %.if.true.1408, label %.if.false.1408
.if.true.1408:
%.tmp1409 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1410 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1409, i32 0, i32 0
%.tmp1411 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1412 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1411, i32 0, i32 0
%.tmp1413 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1412
%.tmp1414 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1413, i32 0, i32 5
%.tmp1415 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1414
store %m297$.Token.type* %.tmp1415, %m297$.Token.type** %.tmp1410
%.tmp1416 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1417 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1416, i32 0, i32 0
%.tmp1418 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1417
%.tmp1419 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1418, i32 0, i32 1
%.tmp1420 = load i8*, i8** %.tmp1419
store i8* %.tmp1420, i8** %transformer_name.1398
%.tmp1421 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1422 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1421, i32 0, i32 0
%.tmp1423 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1424 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1423, i32 0, i32 0
%.tmp1425 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1424
%.tmp1426 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1425, i32 0, i32 5
%.tmp1427 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1426
%.tmp1428 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1427, i32 0, i32 5
%.tmp1429 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1428
store %m297$.Token.type* %.tmp1429, %m297$.Token.type** %.tmp1422
br label %.if.end.1408
.if.false.1408:
br label %.if.end.1408
.if.end.1408:
%.tmp1430 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1431 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1430, i32 0, i32 0
%.tmp1432 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1431
%.tmp1433 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1432, i32 0, i32 1
%.tmp1434 = load i8*, i8** %.tmp1433
%.tmp1436 = getelementptr [2 x i8], [2 x i8]*@.str1435, i32 0, i32 0
%.tmp1437 = call i32(i8*,i8*) @strcmp(i8* %.tmp1434, i8* %.tmp1436)
%.tmp1438 = icmp ne i32 %.tmp1437, 0
br i1 %.tmp1438, label %.if.true.1439, label %.if.false.1439
.if.true.1439:
%.tmp1440 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1441 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1440, i32 0, i32 0
%.tmp1442 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1441
%.tmp1443 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1442, i32 0, i32 1
%.tmp1444 = load i8*, i8** %.tmp1443
%.tmp1445 = call i32(i8*,...) @printf(i8* %.tmp1444)
%.tmp1447 = getelementptr [1 x i8], [1 x i8]*@.str1446, i32 0, i32 0
%err.1448 = alloca i8*
store i8* %.tmp1447, i8** %err.1448
%.tmp1449 = getelementptr i8*, i8** %err.1448, i32 0
%.tmp1451 = getelementptr [35 x i8], [35 x i8]*@.str1450, i32 0, i32 0
%.tmp1452 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1453 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1452, i32 0, i32 0
%.tmp1454 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1453
%.tmp1455 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1454, i32 0, i32 1
%.tmp1456 = load i8*, i8** %.tmp1455
%.tmp1457 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1449, i8* %.tmp1451, i8* %.tmp1456)
%.tmp1458 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1459 = load i8*, i8** %err.1448
call void(%m981$.ParsingContext.type*,i8*) @m981$parser_error.v.m981$.ParsingContext.typep.cp(%m981$.ParsingContext.type* %.tmp1458, i8* %.tmp1459)
br label %.if.end.1439
.if.false.1439:
br label %.if.end.1439
.if.end.1439:
%.tmp1460 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1461 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1460, i32 0, i32 0
%.tmp1462 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1463 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1462, i32 0, i32 0
%.tmp1464 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1463
%.tmp1465 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1464, i32 0, i32 5
%.tmp1466 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1465
store %m297$.Token.type* %.tmp1466, %m297$.Token.type** %.tmp1461
%.tmp1467 = getelementptr %m981$.Rule.type, %m981$.Rule.type* null, i32 1
%.tmp1468 = ptrtoint %m981$.Rule.type* %.tmp1467 to i32
%.tmp1469 = call i8*(i32) @malloc(i32 %.tmp1468)
%.tmp1470 = bitcast i8* %.tmp1469 to %m981$.Rule.type*
%rule.1471 = alloca %m981$.Rule.type*
store %m981$.Rule.type* %.tmp1470, %m981$.Rule.type** %rule.1471
%.tmp1472 = load %m981$.Rule.type*, %m981$.Rule.type** %rule.1471
%.tmp1473 = getelementptr %m981$.Rule.type, %m981$.Rule.type* %.tmp1472, i32 0, i32 0
%.tmp1474 = load i8*, i8** %rule_name.1362
store i8* %.tmp1474, i8** %.tmp1473
%.tmp1475 = load %m981$.Rule.type*, %m981$.Rule.type** %rule.1471
%.tmp1476 = getelementptr %m981$.Rule.type, %m981$.Rule.type* %.tmp1475, i32 0, i32 1
%.tmp1477 = load i8*, i8** %transformer_name.1398
store i8* %.tmp1477, i8** %.tmp1476
%.tmp1478 = load %m981$.Rule.type*, %m981$.Rule.type** %rule.1471
%.tmp1479 = getelementptr %m981$.Rule.type, %m981$.Rule.type* %.tmp1478, i32 0, i32 2
%.tmp1480 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1481 = call %m981$.Matcher.type*(%m981$.ParsingContext.type*) @m981$parse_matcher.m981$.Matcher.typep.m981$.ParsingContext.typep(%m981$.ParsingContext.type* %.tmp1480)
store %m981$.Matcher.type* %.tmp1481, %m981$.Matcher.type** %.tmp1479
%.tmp1482 = load %m981$.Rule.type*, %m981$.Rule.type** %rule.1471
ret %m981$.Rule.type* %.tmp1482
}
define void @m981$parser_error.v.m981$.ParsingContext.typep.cp(%m981$.ParsingContext.type* %.ctx.arg, i8* %.error.arg) {
%ctx = alloca %m981$.ParsingContext.type*
store %m981$.ParsingContext.type* %.ctx.arg, %m981$.ParsingContext.type** %ctx
%error = alloca i8*
store i8* %.error.arg, i8** %error
%.tmp1483 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1484 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1483, i32 0, i32 0
%.tmp1485 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1484
%.tmp1486 = load i8*, i8** %error
%.tmp1487 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1485, i8* %.tmp1486)
%e.1488 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1487, %m296$.Error.type** %e.1488
%.tmp1489 = load %m296$.Error.type*, %m296$.Error.type** %e.1488
call void(%m296$.Error.type*) @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.tmp1489)
call void(i32) @exit(i32 1)
ret void
}
define %m981$.Rule.type** @m981$parse_grammar.m981$.Rule.typepp.m981$.ParsingContext.typep(%m981$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m981$.ParsingContext.type*
store %m981$.ParsingContext.type* %.ctx.arg, %m981$.ParsingContext.type** %ctx
%max_rules.1490 = alloca i32
store i32 40, i32* %max_rules.1490
%.tmp1491 = load i32, i32* @ptr_size
%.tmp1492 = load i32, i32* %max_rules.1490
%.tmp1493 = mul i32 %.tmp1491, %.tmp1492
%.tmp1494 = call i8*(i32) @malloc(i32 %.tmp1493)
%.tmp1495 = bitcast i8* %.tmp1494 to %m981$.Rule.type**
%grammar.1496 = alloca %m981$.Rule.type**
store %m981$.Rule.type** %.tmp1495, %m981$.Rule.type*** %grammar.1496
%i.1498 = alloca i32
store i32 0, i32* %i.1498
br label %.for.start.1497
.for.start.1497:
%.tmp1499 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1500 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1499, i32 0, i32 0
%.tmp1501 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1500
%.tmp1502 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1501, i32 0, i32 0
%.tmp1503 = load i8*, i8** %.tmp1502
%.tmp1505 = getelementptr [4 x i8], [4 x i8]*@.str1504, i32 0, i32 0
%.tmp1506 = call i32(i8*,i8*) @strcmp(i8* %.tmp1503, i8* %.tmp1505)
%.tmp1507 = icmp ne i32 %.tmp1506, 0
br i1 %.tmp1507, label %.for.continue.1497, label %.for.end.1497
.for.continue.1497:
%.tmp1508 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1509 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1508, i32 0, i32 0
%.tmp1510 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1509
%.tmp1511 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1510, i32 0, i32 0
%.tmp1512 = load i8*, i8** %.tmp1511
%.tmp1514 = getelementptr [3 x i8], [3 x i8]*@.str1513, i32 0, i32 0
%.tmp1515 = call i32(i8*,i8*) @strcmp(i8* %.tmp1512, i8* %.tmp1514)
%.tmp1516 = icmp ne i32 %.tmp1515, 0
br i1 %.tmp1516, label %.if.true.1517, label %.if.false.1517
.if.true.1517:
%.tmp1518 = load i32, i32* %i.1498
%.tmp1519 = load %m981$.Rule.type**, %m981$.Rule.type*** %grammar.1496
%.tmp1520 = getelementptr %m981$.Rule.type*, %m981$.Rule.type** %.tmp1519, i32 %.tmp1518
%.tmp1521 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1522 = call %m981$.Rule.type*(%m981$.ParsingContext.type*) @m981$parse_rule.m981$.Rule.typep.m981$.ParsingContext.typep(%m981$.ParsingContext.type* %.tmp1521)
store %m981$.Rule.type* %.tmp1522, %m981$.Rule.type** %.tmp1520
%.tmp1523 = load i32, i32* %i.1498
%.tmp1524 = add i32 %.tmp1523, 1
store i32 %.tmp1524, i32* %i.1498
br label %.if.end.1517
.if.false.1517:
%.tmp1525 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1526 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1525, i32 0, i32 0
%.tmp1527 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %ctx
%.tmp1528 = getelementptr %m981$.ParsingContext.type, %m981$.ParsingContext.type* %.tmp1527, i32 0, i32 0
%.tmp1529 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1528
%.tmp1530 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1529, i32 0, i32 5
%.tmp1531 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1530
store %m297$.Token.type* %.tmp1531, %m297$.Token.type** %.tmp1526
br label %.if.end.1517
.if.end.1517:
br label %.for.start.1497
.for.end.1497:
%.tmp1532 = load %m981$.Rule.type**, %m981$.Rule.type*** %grammar.1496
%.tmp1533 = bitcast %m981$.Rule.type** %.tmp1532 to %m981$.Rule.type**
ret %m981$.Rule.type** %.tmp1533
}
%m981$.Node.type = type {i8*,i8*,i8*,i32,i32,%m981$.Node.type*,%m981$.Node.type*,%m981$.Node.type*}
define %m981$.Node.type* @m981$new_node.m981$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.t.arg, i8* %.type.arg, i8* %.value.arg) {
%t = alloca %m297$.Token.type*
store %m297$.Token.type* %.t.arg, %m297$.Token.type** %t
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp1534 = getelementptr %m981$.Node.type, %m981$.Node.type* null, i32 1
%.tmp1535 = ptrtoint %m981$.Node.type* %.tmp1534 to i32
%.tmp1536 = call i8*(i32) @malloc(i32 %.tmp1535)
%.tmp1537 = bitcast i8* %.tmp1536 to %m981$.Node.type*
%node.1538 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp1537, %m981$.Node.type** %node.1538
%.tmp1539 = load %m981$.Node.type*, %m981$.Node.type** %node.1538
%.tmp1540 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1539, i32 0, i32 0
%.tmp1541 = load i8*, i8** %type
store i8* %.tmp1541, i8** %.tmp1540
%.tmp1542 = load %m981$.Node.type*, %m981$.Node.type** %node.1538
%.tmp1543 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1542, i32 0, i32 1
%.tmp1544 = load i8*, i8** %value
store i8* %.tmp1544, i8** %.tmp1543
%.tmp1545 = load %m981$.Node.type*, %m981$.Node.type** %node.1538
%.tmp1546 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1545, i32 0, i32 3
%.tmp1547 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1548 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1547, i32 0, i32 2
%.tmp1549 = load i32, i32* %.tmp1548
store i32 %.tmp1549, i32* %.tmp1546
%.tmp1550 = load %m981$.Node.type*, %m981$.Node.type** %node.1538
%.tmp1551 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1550, i32 0, i32 2
%.tmp1552 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1553 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1552, i32 0, i32 4
%.tmp1554 = load i8*, i8** %.tmp1553
store i8* %.tmp1554, i8** %.tmp1551
%.tmp1555 = load %m981$.Node.type*, %m981$.Node.type** %node.1538
%.tmp1556 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1555, i32 0, i32 4
%.tmp1557 = load %m297$.Token.type*, %m297$.Token.type** %t
%.tmp1558 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1557, i32 0, i32 3
%.tmp1559 = load i32, i32* %.tmp1558
store i32 %.tmp1559, i32* %.tmp1556
%.tmp1560 = load %m981$.Node.type*, %m981$.Node.type** %node.1538
%.tmp1561 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1560, i32 0, i32 5
store %m981$.Node.type* null, %m981$.Node.type** %.tmp1561
%.tmp1562 = load %m981$.Node.type*, %m981$.Node.type** %node.1538
%.tmp1563 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1562, i32 0, i32 7
store %m981$.Node.type* null, %m981$.Node.type** %.tmp1563
%.tmp1564 = load %m981$.Node.type*, %m981$.Node.type** %node.1538
%.tmp1565 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1564, i32 0, i32 6
store %m981$.Node.type* null, %m981$.Node.type** %.tmp1565
%.tmp1566 = load %m981$.Node.type*, %m981$.Node.type** %node.1538
ret %m981$.Node.type* %.tmp1566
}
define void @m981$child_append.v.m981$.Node.typep.m981$.Node.typep(%m981$.Node.type* %.parent.arg, %m981$.Node.type* %.child.arg) {
%parent = alloca %m981$.Node.type*
store %m981$.Node.type* %.parent.arg, %m981$.Node.type** %parent
%child = alloca %m981$.Node.type*
store %m981$.Node.type* %.child.arg, %m981$.Node.type** %child
%.tmp1567 = load %m981$.Node.type*, %m981$.Node.type** %parent
%.tmp1568 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1567, i32 0, i32 6
%.tmp1569 = load %m981$.Node.type*, %m981$.Node.type** %.tmp1568
%.tmp1570 = icmp eq %m981$.Node.type* %.tmp1569, null
br i1 %.tmp1570, label %.if.true.1571, label %.if.false.1571
.if.true.1571:
%.tmp1572 = load %m981$.Node.type*, %m981$.Node.type** %parent
%.tmp1573 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1572, i32 0, i32 6
%.tmp1574 = load %m981$.Node.type*, %m981$.Node.type** %child
store %m981$.Node.type* %.tmp1574, %m981$.Node.type** %.tmp1573
br label %.if.end.1571
.if.false.1571:
%.tmp1575 = load %m981$.Node.type*, %m981$.Node.type** %parent
%.tmp1576 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1575, i32 0, i32 6
%.tmp1577 = load %m981$.Node.type*, %m981$.Node.type** %.tmp1576
%c.1578 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp1577, %m981$.Node.type** %c.1578
br label %.for.start.1579
.for.start.1579:
%.tmp1580 = load %m981$.Node.type*, %m981$.Node.type** %c.1578
%.tmp1581 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1580, i32 0, i32 7
%.tmp1582 = load %m981$.Node.type*, %m981$.Node.type** %.tmp1581
%.tmp1583 = icmp ne %m981$.Node.type* %.tmp1582, null
br i1 %.tmp1583, label %.for.continue.1579, label %.for.end.1579
.for.continue.1579:
%.tmp1584 = load %m981$.Node.type*, %m981$.Node.type** %c.1578
%.tmp1585 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1584, i32 0, i32 7
%.tmp1586 = load %m981$.Node.type*, %m981$.Node.type** %.tmp1585
store %m981$.Node.type* %.tmp1586, %m981$.Node.type** %c.1578
br label %.for.start.1579
.for.end.1579:
%.tmp1587 = load %m981$.Node.type*, %m981$.Node.type** %c.1578
%.tmp1588 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1587, i32 0, i32 7
%.tmp1589 = load %m981$.Node.type*, %m981$.Node.type** %child
store %m981$.Node.type* %.tmp1589, %m981$.Node.type** %.tmp1588
br label %.if.end.1571
.if.end.1571:
%.tmp1590 = load %m981$.Node.type*, %m981$.Node.type** %child
%.tmp1591 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1590, i32 0, i32 7
store %m981$.Node.type* null, %m981$.Node.type** %.tmp1591
ret void
}
define void @m981$child_pop.v.m981$.Node.typep(%m981$.Node.type* %.parent.arg) {
%parent = alloca %m981$.Node.type*
store %m981$.Node.type* %.parent.arg, %m981$.Node.type** %parent
%.tmp1592 = load %m981$.Node.type*, %m981$.Node.type** %parent
%.tmp1593 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1592, i32 0, i32 6
%.tmp1594 = load %m981$.Node.type*, %m981$.Node.type** %.tmp1593
%.tmp1595 = icmp eq %m981$.Node.type* %.tmp1594, null
br i1 %.tmp1595, label %.if.true.1596, label %.if.false.1596
.if.true.1596:
ret void
br label %.if.end.1596
.if.false.1596:
br label %.if.end.1596
.if.end.1596:
%.tmp1597 = load %m981$.Node.type*, %m981$.Node.type** %parent
%.tmp1598 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1597, i32 0, i32 6
%.tmp1599 = load %m981$.Node.type*, %m981$.Node.type** %.tmp1598
%c.1600 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp1599, %m981$.Node.type** %c.1600
%.tmp1601 = load %m981$.Node.type*, %m981$.Node.type** %c.1600
%.tmp1602 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1601, i32 0, i32 7
%.tmp1603 = load %m981$.Node.type*, %m981$.Node.type** %.tmp1602
%.tmp1604 = icmp eq %m981$.Node.type* %.tmp1603, null
br i1 %.tmp1604, label %.if.true.1605, label %.if.false.1605
.if.true.1605:
%.tmp1606 = load %m981$.Node.type*, %m981$.Node.type** %c.1600
%.tmp1607 = bitcast %m981$.Node.type* %.tmp1606 to i8*
call void(i8*) @free(i8* %.tmp1607)
%.tmp1608 = load %m981$.Node.type*, %m981$.Node.type** %parent
%.tmp1609 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1608, i32 0, i32 6
store %m981$.Node.type* null, %m981$.Node.type** %.tmp1609
ret void
br label %.if.end.1605
.if.false.1605:
br label %.if.end.1605
.if.end.1605:
br label %.for.start.1610
.for.start.1610:
%.tmp1611 = load %m981$.Node.type*, %m981$.Node.type** %c.1600
%.tmp1612 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1611, i32 0, i32 7
%.tmp1613 = load %m981$.Node.type*, %m981$.Node.type** %.tmp1612
%.tmp1614 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1613, i32 0, i32 7
%.tmp1615 = load %m981$.Node.type*, %m981$.Node.type** %.tmp1614
%.tmp1616 = icmp ne %m981$.Node.type* %.tmp1615, null
br i1 %.tmp1616, label %.for.continue.1610, label %.for.end.1610
.for.continue.1610:
%.tmp1617 = load %m981$.Node.type*, %m981$.Node.type** %c.1600
%.tmp1618 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1617, i32 0, i32 7
%.tmp1619 = load %m981$.Node.type*, %m981$.Node.type** %.tmp1618
store %m981$.Node.type* %.tmp1619, %m981$.Node.type** %c.1600
br label %.for.start.1610
.for.end.1610:
%.tmp1620 = load %m981$.Node.type*, %m981$.Node.type** %c.1600
%.tmp1621 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1620, i32 0, i32 7
%.tmp1622 = load %m981$.Node.type*, %m981$.Node.type** %.tmp1621
%.tmp1623 = bitcast %m981$.Node.type* %.tmp1622 to i8*
call void(i8*) @free(i8* %.tmp1623)
%.tmp1624 = load %m981$.Node.type*, %m981$.Node.type** %c.1600
%.tmp1625 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp1624, i32 0, i32 7
store %m981$.Node.type* null, %m981$.Node.type** %.tmp1625
ret void
}
%m981$.AstContext.type = type {%m297$.Token.type*,%m981$.Rule.type**}
define %m981$.Rule.type* @m981$find_rule.m981$.Rule.typep.m981$.Rule.typepp.cp(%m981$.Rule.type** %.grammar.arg, i8* %.rule_name.arg) {
%grammar = alloca %m981$.Rule.type**
store %m981$.Rule.type** %.grammar.arg, %m981$.Rule.type*** %grammar
%rule_name = alloca i8*
store i8* %.rule_name.arg, i8** %rule_name
%i.1627 = alloca i32
store i32 0, i32* %i.1627
br label %.for.start.1626
.for.start.1626:
br i1 1, label %.for.continue.1626, label %.for.end.1626
.for.continue.1626:
%.tmp1628 = load i32, i32* %i.1627
%.tmp1629 = load %m981$.Rule.type**, %m981$.Rule.type*** %grammar
%.tmp1630 = getelementptr %m981$.Rule.type*, %m981$.Rule.type** %.tmp1629, i32 %.tmp1628
%.tmp1631 = load %m981$.Rule.type*, %m981$.Rule.type** %.tmp1630
%rule.1632 = alloca %m981$.Rule.type*
store %m981$.Rule.type* %.tmp1631, %m981$.Rule.type** %rule.1632
%.tmp1633 = load %m981$.Rule.type*, %m981$.Rule.type** %rule.1632
%.tmp1634 = getelementptr %m981$.Rule.type, %m981$.Rule.type* %.tmp1633, i32 0, i32 0
%.tmp1635 = load i8*, i8** %.tmp1634
%.tmp1636 = load i8*, i8** %rule_name
%.tmp1637 = call i32(i8*,i8*) @strcmp(i8* %.tmp1635, i8* %.tmp1636)
%.tmp1638 = icmp eq i32 %.tmp1637, 0
br i1 %.tmp1638, label %.if.true.1639, label %.if.false.1639
.if.true.1639:
%.tmp1640 = load %m981$.Rule.type*, %m981$.Rule.type** %rule.1632
ret %m981$.Rule.type* %.tmp1640
br label %.if.end.1639
.if.false.1639:
br label %.if.end.1639
.if.end.1639:
%.tmp1641 = load i32, i32* %i.1627
%.tmp1642 = add i32 %.tmp1641, 1
store i32 %.tmp1642, i32* %i.1627
br label %.for.start.1626
.for.end.1626:
%.tmp1643 = bitcast ptr null to %m981$.Rule.type*
ret %m981$.Rule.type* %.tmp1643
}
%m981$.ParseResult.type = type {%m296$.Error.type*,%m981$.Node.type*}
define %m296$.Error.type* @m981$parse_query.m296$.Error.typep.m981$.AstContext.typep.m981$.Matcher.typep.m981$.Node.typep(%m981$.AstContext.type* %.c.arg, %m981$.Matcher.type* %.m.arg, %m981$.Node.type* %.base.arg) {
%c = alloca %m981$.AstContext.type*
store %m981$.AstContext.type* %.c.arg, %m981$.AstContext.type** %c
%m = alloca %m981$.Matcher.type*
store %m981$.Matcher.type* %.m.arg, %m981$.Matcher.type** %m
%base = alloca %m981$.Node.type*
store %m981$.Node.type* %.base.arg, %m981$.Node.type** %base
%child.1644 = alloca %m981$.Node.type*
store %m981$.Node.type* null, %m981$.Node.type** %child.1644
%.tmp1645 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1646 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1645, i32 0, i32 0
%.tmp1647 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1646
%start_token.1648 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp1647, %m297$.Token.type** %start_token.1648
%new_children.1649 = alloca i32
store i32 0, i32* %new_children.1649
%.tmp1650 = bitcast ptr null to %m296$.Error.type*
%err.1651 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1650, %m296$.Error.type** %err.1651
%.tmp1653 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m
%.tmp1654 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1653, i32 0, i32 0
%.tmp1655 = load %m981$.Query.type*, %m981$.Query.type** %.tmp1654
%q.1656 = alloca %m981$.Query.type*
store %m981$.Query.type* %.tmp1655, %m981$.Query.type** %q.1656
br label %.for.start.1652
.for.start.1652:
%.tmp1657 = load %m981$.Query.type*, %m981$.Query.type** %q.1656
%.tmp1658 = icmp ne %m981$.Query.type* %.tmp1657, null
%.tmp1659 = load %m296$.Error.type*, %m296$.Error.type** %err.1651
%.tmp1660 = icmp eq %m296$.Error.type* %.tmp1659, null
%.tmp1661 = and i1 %.tmp1658, %.tmp1660
br i1 %.tmp1661, label %.for.continue.1652, label %.for.end.1652
.for.continue.1652:
%.tmp1662 = load %m981$.Query.type*, %m981$.Query.type** %q.1656
%.tmp1663 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1662, i32 0, i32 0
%.tmp1664 = load i8, i8* %.tmp1663
%.tmp1665 = icmp eq i8 %.tmp1664, 118
br i1 %.tmp1665, label %.if.true.1666, label %.if.false.1666
.if.true.1666:
%.tmp1667 = load %m981$.Query.type*, %m981$.Query.type** %q.1656
%.tmp1668 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1667, i32 0, i32 1
%.tmp1669 = load i8*, i8** %.tmp1668
%.tmp1670 = call i32(i8*) @strlen(i8* %.tmp1669)
%.tmp1671 = sub i32 %.tmp1670, 2
%qv_len.1672 = alloca i32
store i32 %.tmp1671, i32* %qv_len.1672
%.tmp1673 = load i32, i32* %qv_len.1672
%.tmp1674 = add i32 %.tmp1673, 1
%.tmp1675 = call i8*(i32) @malloc(i32 %.tmp1674)
%tmp_buff.1676 = alloca i8*
store i8* %.tmp1675, i8** %tmp_buff.1676
%.tmp1677 = load %m981$.Query.type*, %m981$.Query.type** %q.1656
%.tmp1678 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1677, i32 0, i32 1
%.tmp1679 = load i8*, i8** %.tmp1678
%.tmp1681 = getelementptr [8 x i8], [8 x i8]*@.str1680, i32 0, i32 0
%.tmp1682 = load i8*, i8** %tmp_buff.1676
%.tmp1683 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp1679, i8* %.tmp1681, i8* %.tmp1682)
%.tmp1684 = load i8*, i8** %tmp_buff.1676
%.tmp1685 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1686 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1685, i32 0, i32 0
%.tmp1687 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1686
%.tmp1688 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1687, i32 0, i32 1
%.tmp1689 = load i8*, i8** %.tmp1688
%.tmp1690 = load i32, i32* %qv_len.1672
%.tmp1691 = call i32(i8*,i8*,i32) @strncmp(i8* %.tmp1684, i8* %.tmp1689, i32 %.tmp1690)
%.tmp1692 = icmp eq i32 %.tmp1691, 0
%.tmp1693 = load i32, i32* %qv_len.1672
%.tmp1694 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1695 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1694, i32 0, i32 0
%.tmp1696 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1695
%.tmp1697 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1696, i32 0, i32 1
%.tmp1698 = load i8*, i8** %.tmp1697
%.tmp1699 = call i32(i8*) @strlen(i8* %.tmp1698)
%.tmp1700 = icmp eq i32 %.tmp1693, %.tmp1699
%.tmp1701 = and i1 %.tmp1692, %.tmp1700
br i1 %.tmp1701, label %.if.true.1702, label %.if.false.1702
.if.true.1702:
%.tmp1703 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1704 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1703, i32 0, i32 0
%.tmp1705 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1704
%.tmp1706 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1707 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1706, i32 0, i32 0
%.tmp1708 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1707
%.tmp1709 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1708, i32 0, i32 0
%.tmp1710 = load i8*, i8** %.tmp1709
%.tmp1711 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1712 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1711, i32 0, i32 0
%.tmp1713 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1712
%.tmp1714 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1713, i32 0, i32 1
%.tmp1715 = load i8*, i8** %.tmp1714
%.tmp1716 = call %m981$.Node.type*(%m297$.Token.type*,i8*,i8*) @m981$new_node.m981$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.tmp1705, i8* %.tmp1710, i8* %.tmp1715)
store %m981$.Node.type* %.tmp1716, %m981$.Node.type** %child.1644
%.tmp1717 = load %m981$.Node.type*, %m981$.Node.type** %base
%.tmp1718 = load %m981$.Node.type*, %m981$.Node.type** %child.1644
call void(%m981$.Node.type*,%m981$.Node.type*) @m981$child_append.v.m981$.Node.typep.m981$.Node.typep(%m981$.Node.type* %.tmp1717, %m981$.Node.type* %.tmp1718)
%.tmp1719 = load i32, i32* %new_children.1649
%.tmp1720 = add i32 %.tmp1719, 1
store i32 %.tmp1720, i32* %new_children.1649
%.tmp1721 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1722 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1721, i32 0, i32 0
%.tmp1723 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1724 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1723, i32 0, i32 0
%.tmp1725 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1724
%.tmp1726 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1725, i32 0, i32 5
%.tmp1727 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1726
store %m297$.Token.type* %.tmp1727, %m297$.Token.type** %.tmp1722
br label %.if.end.1702
.if.false.1702:
%.tmp1728 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1729 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1728, i32 0, i32 0
%.tmp1730 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1729
%.tmp1731 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1730, i32 0, i32 1
%.tmp1732 = load i8*, i8** %.tmp1731
%token_value.1733 = alloca i8*
store i8* %.tmp1732, i8** %token_value.1733
%.tmp1734 = load i8*, i8** %token_value.1733
%.tmp1735 = icmp eq i8* %.tmp1734, null
br i1 %.tmp1735, label %.if.true.1736, label %.if.false.1736
.if.true.1736:
%.tmp1738 = getelementptr [7 x i8], [7 x i8]*@.str1737, i32 0, i32 0
store i8* %.tmp1738, i8** %token_value.1733
br label %.if.end.1736
.if.false.1736:
br label %.if.end.1736
.if.end.1736:
%.tmp1740 = getelementptr [1 x i8], [1 x i8]*@.str1739, i32 0, i32 0
%err_buf.1741 = alloca i8*
store i8* %.tmp1740, i8** %err_buf.1741
%.tmp1742 = getelementptr i8*, i8** %err_buf.1741, i32 0
%.tmp1744 = getelementptr [43 x i8], [43 x i8]*@.str1743, i32 0, i32 0
%.tmp1745 = load %m981$.Query.type*, %m981$.Query.type** %q.1656
%.tmp1746 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1745, i32 0, i32 1
%.tmp1747 = load i8*, i8** %.tmp1746
%.tmp1748 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1749 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1748, i32 0, i32 0
%.tmp1750 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1749
%.tmp1751 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1750, i32 0, i32 1
%.tmp1752 = load i8*, i8** %.tmp1751
%.tmp1753 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1742, i8* %.tmp1744, i8* %.tmp1747, i8* %.tmp1752)
%.tmp1754 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1755 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1754, i32 0, i32 0
%.tmp1756 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1755
%.tmp1757 = load i8*, i8** %err_buf.1741
%.tmp1758 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1756, i8* %.tmp1757)
store %m296$.Error.type* %.tmp1758, %m296$.Error.type** %err.1651
br label %.if.end.1702
.if.end.1702:
%.tmp1759 = load i8*, i8** %tmp_buff.1676
call void(i8*) @free(i8* %.tmp1759)
br label %.if.end.1666
.if.false.1666:
%.tmp1760 = load %m981$.Query.type*, %m981$.Query.type** %q.1656
%.tmp1761 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1760, i32 0, i32 0
%.tmp1762 = load i8, i8* %.tmp1761
%.tmp1763 = icmp eq i8 %.tmp1762, 116
br i1 %.tmp1763, label %.if.true.1764, label %.if.false.1764
.if.true.1764:
%.tmp1765 = load %m981$.Query.type*, %m981$.Query.type** %q.1656
%.tmp1766 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1765, i32 0, i32 1
%.tmp1767 = load i8*, i8** %.tmp1766
%.tmp1768 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1769 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1768, i32 0, i32 0
%.tmp1770 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1769
%.tmp1771 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1770, i32 0, i32 0
%.tmp1772 = load i8*, i8** %.tmp1771
%.tmp1773 = call i32(i8*,i8*) @strcmp(i8* %.tmp1767, i8* %.tmp1772)
%.tmp1774 = icmp eq i32 %.tmp1773, 0
br i1 %.tmp1774, label %.if.true.1775, label %.if.false.1775
.if.true.1775:
%.tmp1776 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1777 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1776, i32 0, i32 0
%.tmp1778 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1777
%.tmp1779 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1780 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1779, i32 0, i32 0
%.tmp1781 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1780
%.tmp1782 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1781, i32 0, i32 0
%.tmp1783 = load i8*, i8** %.tmp1782
%.tmp1784 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1785 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1784, i32 0, i32 0
%.tmp1786 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1785
%.tmp1787 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1786, i32 0, i32 1
%.tmp1788 = load i8*, i8** %.tmp1787
%.tmp1789 = call %m981$.Node.type*(%m297$.Token.type*,i8*,i8*) @m981$new_node.m981$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.tmp1778, i8* %.tmp1783, i8* %.tmp1788)
store %m981$.Node.type* %.tmp1789, %m981$.Node.type** %child.1644
%.tmp1790 = load %m981$.Node.type*, %m981$.Node.type** %base
%.tmp1791 = load %m981$.Node.type*, %m981$.Node.type** %child.1644
call void(%m981$.Node.type*,%m981$.Node.type*) @m981$child_append.v.m981$.Node.typep.m981$.Node.typep(%m981$.Node.type* %.tmp1790, %m981$.Node.type* %.tmp1791)
%.tmp1792 = load i32, i32* %new_children.1649
%.tmp1793 = add i32 %.tmp1792, 1
store i32 %.tmp1793, i32* %new_children.1649
%.tmp1794 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1795 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1794, i32 0, i32 0
%.tmp1796 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1797 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1796, i32 0, i32 0
%.tmp1798 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1797
%.tmp1799 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1798, i32 0, i32 5
%.tmp1800 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1799
store %m297$.Token.type* %.tmp1800, %m297$.Token.type** %.tmp1795
br label %.if.end.1775
.if.false.1775:
%.tmp1802 = getelementptr [13 x i8], [13 x i8]*@.str1801, i32 0, i32 0
%err_fmt_t.1803 = alloca i8*
store i8* %.tmp1802, i8** %err_fmt_t.1803
%.tmp1805 = getelementptr [30 x i8], [30 x i8]*@.str1804, i32 0, i32 0
%err_msg_t.1806 = alloca i8*
store i8* %.tmp1805, i8** %err_msg_t.1806
%.tmp1807 = load i8*, i8** %err_fmt_t.1803
%.tmp1808 = call i32(i8*) @strlen(i8* %.tmp1807)
%.tmp1809 = load i8*, i8** %err_msg_t.1806
%.tmp1810 = call i32(i8*) @strlen(i8* %.tmp1809)
%.tmp1811 = add i32 %.tmp1808, %.tmp1810
%.tmp1812 = load %m981$.Query.type*, %m981$.Query.type** %q.1656
%.tmp1813 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1812, i32 0, i32 1
%.tmp1814 = load i8*, i8** %.tmp1813
%.tmp1815 = call i32(i8*) @strlen(i8* %.tmp1814)
%.tmp1816 = add i32 %.tmp1811, %.tmp1815
%.tmp1817 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1818 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1817, i32 0, i32 0
%.tmp1819 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1818
%.tmp1820 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1819, i32 0, i32 0
%.tmp1821 = load i8*, i8** %.tmp1820
%.tmp1822 = call i32(i8*) @strlen(i8* %.tmp1821)
%.tmp1823 = add i32 %.tmp1816, %.tmp1822
%err_len_t.1824 = alloca i32
store i32 %.tmp1823, i32* %err_len_t.1824
%.tmp1825 = load i32, i32* %err_len_t.1824
%.tmp1826 = call i8*(i32) @malloc(i32 %.tmp1825)
%err_buf_t.1827 = alloca i8*
store i8* %.tmp1826, i8** %err_buf_t.1827
%.tmp1828 = load i8*, i8** %err_buf_t.1827
%.tmp1829 = load i32, i32* %err_len_t.1824
%.tmp1830 = load i8*, i8** %err_fmt_t.1803
%.tmp1831 = load i8*, i8** %err_msg_t.1806
%.tmp1832 = load %m981$.Query.type*, %m981$.Query.type** %q.1656
%.tmp1833 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1832, i32 0, i32 1
%.tmp1834 = load i8*, i8** %.tmp1833
%.tmp1835 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1836 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1835, i32 0, i32 0
%.tmp1837 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1836
%.tmp1838 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp1837, i32 0, i32 0
%.tmp1839 = load i8*, i8** %.tmp1838
%.tmp1840 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1828, i32 %.tmp1829, i8* %.tmp1830, i8* %.tmp1831, i8* %.tmp1834, i8* %.tmp1839)
%.tmp1841 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1842 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1841, i32 0, i32 0
%.tmp1843 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1842
%.tmp1844 = load i8*, i8** %err_buf_t.1827
%.tmp1845 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1843, i8* %.tmp1844)
store %m296$.Error.type* %.tmp1845, %m296$.Error.type** %err.1651
br label %.if.end.1775
.if.end.1775:
br label %.if.end.1764
.if.false.1764:
%.tmp1846 = load %m981$.Query.type*, %m981$.Query.type** %q.1656
%.tmp1847 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1846, i32 0, i32 0
%.tmp1848 = load i8, i8* %.tmp1847
%.tmp1849 = icmp eq i8 %.tmp1848, 97
br i1 %.tmp1849, label %.if.true.1850, label %.if.false.1850
.if.true.1850:
%.tmp1851 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1852 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1851, i32 0, i32 1
%.tmp1853 = load %m981$.Rule.type**, %m981$.Rule.type*** %.tmp1852
%.tmp1854 = load %m981$.Query.type*, %m981$.Query.type** %q.1656
%.tmp1855 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1854, i32 0, i32 1
%.tmp1856 = load i8*, i8** %.tmp1855
%.tmp1857 = call %m981$.Rule.type*(%m981$.Rule.type**,i8*) @m981$find_rule.m981$.Rule.typep.m981$.Rule.typepp.cp(%m981$.Rule.type** %.tmp1853, i8* %.tmp1856)
%alias_rule.1858 = alloca %m981$.Rule.type*
store %m981$.Rule.type* %.tmp1857, %m981$.Rule.type** %alias_rule.1858
%.tmp1859 = load %m981$.Rule.type*, %m981$.Rule.type** %alias_rule.1858
%.tmp1860 = icmp eq %m981$.Rule.type* %.tmp1859, null
br i1 %.tmp1860, label %.if.true.1861, label %.if.false.1861
.if.true.1861:
%.tmp1862 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1863 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1862, i32 0, i32 0
%.tmp1864 = load %m297$.Token.type*, %m297$.Token.type** %.tmp1863
%.tmp1866 = getelementptr [30 x i8], [30 x i8]*@.str1865, i32 0, i32 0
%.tmp1867 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp1864, i8* %.tmp1866)
store %m296$.Error.type* %.tmp1867, %m296$.Error.type** %err.1651
br label %.if.end.1861
.if.false.1861:
%.tmp1868 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1869 = load %m981$.Rule.type*, %m981$.Rule.type** %alias_rule.1858
%.tmp1870 = call %m981$.ParseResult.type*(%m981$.AstContext.type*,%m981$.Rule.type*) @m981$parse_to_ast.m981$.ParseResult.typep.m981$.AstContext.typep.m981$.Rule.typep(%m981$.AstContext.type* %.tmp1868, %m981$.Rule.type* %.tmp1869)
%parse_result.1871 = alloca %m981$.ParseResult.type*
store %m981$.ParseResult.type* %.tmp1870, %m981$.ParseResult.type** %parse_result.1871
%.tmp1872 = load %m981$.ParseResult.type*, %m981$.ParseResult.type** %parse_result.1871
%.tmp1873 = getelementptr %m981$.ParseResult.type, %m981$.ParseResult.type* %.tmp1872, i32 0, i32 0
%.tmp1874 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1873
%.tmp1875 = icmp ne %m296$.Error.type* %.tmp1874, null
br i1 %.tmp1875, label %.if.true.1876, label %.if.false.1876
.if.true.1876:
%.tmp1877 = load %m981$.ParseResult.type*, %m981$.ParseResult.type** %parse_result.1871
%.tmp1878 = getelementptr %m981$.ParseResult.type, %m981$.ParseResult.type* %.tmp1877, i32 0, i32 0
%.tmp1879 = load %m296$.Error.type*, %m296$.Error.type** %.tmp1878
store %m296$.Error.type* %.tmp1879, %m296$.Error.type** %err.1651
br label %.if.end.1876
.if.false.1876:
%.tmp1880 = load %m981$.Node.type*, %m981$.Node.type** %base
%.tmp1881 = load %m981$.ParseResult.type*, %m981$.ParseResult.type** %parse_result.1871
%.tmp1882 = getelementptr %m981$.ParseResult.type, %m981$.ParseResult.type* %.tmp1881, i32 0, i32 1
%.tmp1883 = load %m981$.Node.type*, %m981$.Node.type** %.tmp1882
call void(%m981$.Node.type*,%m981$.Node.type*) @m981$child_append.v.m981$.Node.typep.m981$.Node.typep(%m981$.Node.type* %.tmp1880, %m981$.Node.type* %.tmp1883)
%.tmp1884 = load i32, i32* %new_children.1649
%.tmp1885 = add i32 %.tmp1884, 1
store i32 %.tmp1885, i32* %new_children.1649
br label %.if.end.1876
.if.end.1876:
%.tmp1886 = load %m981$.ParseResult.type*, %m981$.ParseResult.type** %parse_result.1871
%.tmp1887 = bitcast %m981$.ParseResult.type* %.tmp1886 to i8*
call void(i8*) @free(i8* %.tmp1887)
br label %.if.end.1861
.if.end.1861:
br label %.if.end.1850
.if.false.1850:
%.tmp1889 = getelementptr [41 x i8], [41 x i8]*@.str1888, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp1889)
br label %.if.end.1850
.if.end.1850:
br label %.if.end.1764
.if.end.1764:
br label %.if.end.1666
.if.end.1666:
%.tmp1890 = load %m981$.Query.type*, %m981$.Query.type** %q.1656
%.tmp1891 = getelementptr %m981$.Query.type, %m981$.Query.type* %.tmp1890, i32 0, i32 2
%.tmp1892 = load %m981$.Query.type*, %m981$.Query.type** %.tmp1891
store %m981$.Query.type* %.tmp1892, %m981$.Query.type** %q.1656
br label %.for.start.1652
.for.end.1652:
%.tmp1893 = load %m296$.Error.type*, %m296$.Error.type** %err.1651
%.tmp1894 = icmp ne %m296$.Error.type* %.tmp1893, null
br i1 %.tmp1894, label %.if.true.1895, label %.if.false.1895
.if.true.1895:
%.tmp1896 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1897 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1896, i32 0, i32 0
%.tmp1898 = load %m297$.Token.type*, %m297$.Token.type** %start_token.1648
store %m297$.Token.type* %.tmp1898, %m297$.Token.type** %.tmp1897
%i.1900 = alloca i32
store i32 0, i32* %i.1900
br label %.for.start.1899
.for.start.1899:
%.tmp1901 = load i32, i32* %i.1900
%.tmp1902 = load i32, i32* %new_children.1649
%.tmp1903 = icmp slt i32 %.tmp1901, %.tmp1902
br i1 %.tmp1903, label %.for.continue.1899, label %.for.end.1899
.for.continue.1899:
%.tmp1904 = load %m981$.Node.type*, %m981$.Node.type** %base
call void(%m981$.Node.type*) @m981$child_pop.v.m981$.Node.typep(%m981$.Node.type* %.tmp1904)
%.tmp1905 = load i32, i32* %i.1900
%.tmp1906 = add i32 %.tmp1905, 1
store i32 %.tmp1906, i32* %i.1900
br label %.for.start.1899
.for.end.1899:
br label %.if.end.1895
.if.false.1895:
br label %.if.end.1895
.if.end.1895:
%.tmp1907 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m
%.tmp1908 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1907, i32 0, i32 2
%.tmp1909 = load %m981$.Matcher.type*, %m981$.Matcher.type** %.tmp1908
%.tmp1910 = icmp ne %m981$.Matcher.type* %.tmp1909, null
%.tmp1911 = load %m296$.Error.type*, %m296$.Error.type** %err.1651
%.tmp1912 = icmp ne %m296$.Error.type* %.tmp1911, null
%.tmp1913 = and i1 %.tmp1910, %.tmp1912
br i1 %.tmp1913, label %.if.true.1914, label %.if.false.1914
.if.true.1914:
%.tmp1915 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1916 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m
%.tmp1917 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1916, i32 0, i32 2
%.tmp1918 = load %m981$.Matcher.type*, %m981$.Matcher.type** %.tmp1917
%.tmp1919 = load %m981$.Node.type*, %m981$.Node.type** %base
%.tmp1920 = call %m296$.Error.type*(%m981$.AstContext.type*,%m981$.Matcher.type*,%m981$.Node.type*) @m981$parse_query.m296$.Error.typep.m981$.AstContext.typep.m981$.Matcher.typep.m981$.Node.typep(%m981$.AstContext.type* %.tmp1915, %m981$.Matcher.type* %.tmp1918, %m981$.Node.type* %.tmp1919)
%new_err.1921 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp1920, %m296$.Error.type** %new_err.1921
%.tmp1922 = load %m296$.Error.type*, %m296$.Error.type** %new_err.1921
%.tmp1923 = icmp eq %m296$.Error.type* %.tmp1922, null
br i1 %.tmp1923, label %.if.true.1924, label %.if.false.1924
.if.true.1924:
store %m296$.Error.type* null, %m296$.Error.type** %err.1651
br label %.if.end.1924
.if.false.1924:
%.tmp1925 = load %m296$.Error.type*, %m296$.Error.type** %new_err.1921
%.tmp1926 = bitcast %m296$.Error.type* %.tmp1925 to i8*
call void(i8*) @free(i8* %.tmp1926)
br label %.if.end.1924
.if.end.1924:
br label %.if.end.1914
.if.false.1914:
br label %.if.end.1914
.if.end.1914:
%.tmp1927 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m
%.tmp1928 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1927, i32 0, i32 1
%.tmp1929 = load i8, i8* %.tmp1928
%.tmp1930 = icmp eq i8 %.tmp1929, 49
br i1 %.tmp1930, label %.if.true.1931, label %.if.false.1931
.if.true.1931:
br label %.if.end.1931
.if.false.1931:
%.tmp1932 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m
%.tmp1933 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1932, i32 0, i32 1
%.tmp1934 = load i8, i8* %.tmp1933
%.tmp1935 = icmp eq i8 %.tmp1934, 43
%.tmp1936 = load %m296$.Error.type*, %m296$.Error.type** %err.1651
%.tmp1937 = icmp eq %m296$.Error.type* %.tmp1936, null
%.tmp1938 = and i1 %.tmp1935, %.tmp1937
br i1 %.tmp1938, label %.if.true.1939, label %.if.false.1939
.if.true.1939:
%.tmp1940 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1941 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m
%.tmp1942 = load %m981$.Node.type*, %m981$.Node.type** %base
%.tmp1943 = call %m296$.Error.type*(%m981$.AstContext.type*,%m981$.Matcher.type*,%m981$.Node.type*) @m981$parse_query.m296$.Error.typep.m981$.AstContext.typep.m981$.Matcher.typep.m981$.Node.typep(%m981$.AstContext.type* %.tmp1940, %m981$.Matcher.type* %.tmp1941, %m981$.Node.type* %.tmp1942)
store %m296$.Error.type* %.tmp1943, %m296$.Error.type** %err.1651
%.tmp1944 = load %m296$.Error.type*, %m296$.Error.type** %err.1651
%.tmp1945 = icmp ne %m296$.Error.type* %.tmp1944, null
br i1 %.tmp1945, label %.if.true.1946, label %.if.false.1946
.if.true.1946:
%.tmp1947 = load %m296$.Error.type*, %m296$.Error.type** %err.1651
%.tmp1948 = bitcast %m296$.Error.type* %.tmp1947 to i8*
call void(i8*) @free(i8* %.tmp1948)
store %m296$.Error.type* null, %m296$.Error.type** %err.1651
br label %.if.end.1946
.if.false.1946:
%.tmp1949 = bitcast ptr null to %m296$.Error.type*
ret %m296$.Error.type* %.tmp1949
br label %.if.end.1946
.if.end.1946:
br label %.if.end.1939
.if.false.1939:
%.tmp1950 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m
%.tmp1951 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1950, i32 0, i32 1
%.tmp1952 = load i8, i8* %.tmp1951
%.tmp1953 = icmp eq i8 %.tmp1952, 63
%.tmp1954 = load %m296$.Error.type*, %m296$.Error.type** %err.1651
%.tmp1955 = icmp ne %m296$.Error.type* %.tmp1954, null
%.tmp1956 = and i1 %.tmp1953, %.tmp1955
br i1 %.tmp1956, label %.if.true.1957, label %.if.false.1957
.if.true.1957:
%.tmp1958 = load %m296$.Error.type*, %m296$.Error.type** %err.1651
%.tmp1959 = bitcast %m296$.Error.type* %.tmp1958 to i8*
call void(i8*) @free(i8* %.tmp1959)
store %m296$.Error.type* null, %m296$.Error.type** %err.1651
br label %.if.end.1957
.if.false.1957:
%.tmp1960 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m
%.tmp1961 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1960, i32 0, i32 1
%.tmp1962 = load i8, i8* %.tmp1961
%.tmp1963 = icmp eq i8 %.tmp1962, 42
br i1 %.tmp1963, label %.if.true.1964, label %.if.false.1964
.if.true.1964:
%.tmp1965 = load %m296$.Error.type*, %m296$.Error.type** %err.1651
%.tmp1966 = icmp ne %m296$.Error.type* %.tmp1965, null
br i1 %.tmp1966, label %.if.true.1967, label %.if.false.1967
.if.true.1967:
%.tmp1968 = load %m296$.Error.type*, %m296$.Error.type** %err.1651
%.tmp1969 = bitcast %m296$.Error.type* %.tmp1968 to i8*
call void(i8*) @free(i8* %.tmp1969)
store %m296$.Error.type* null, %m296$.Error.type** %err.1651
br label %.if.end.1967
.if.false.1967:
%.tmp1970 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1971 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m
%.tmp1972 = load %m981$.Node.type*, %m981$.Node.type** %base
%.tmp1973 = call %m296$.Error.type*(%m981$.AstContext.type*,%m981$.Matcher.type*,%m981$.Node.type*) @m981$parse_query.m296$.Error.typep.m981$.AstContext.typep.m981$.Matcher.typep.m981$.Node.typep(%m981$.AstContext.type* %.tmp1970, %m981$.Matcher.type* %.tmp1971, %m981$.Node.type* %.tmp1972)
ret %m296$.Error.type* %.tmp1973
br label %.if.end.1967
.if.end.1967:
br label %.if.end.1964
.if.false.1964:
br label %.if.end.1964
.if.end.1964:
br label %.if.end.1957
.if.end.1957:
br label %.if.end.1939
.if.end.1939:
br label %.if.end.1931
.if.end.1931:
%.tmp1974 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m
%.tmp1975 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1974, i32 0, i32 3
%.tmp1976 = load %m981$.Matcher.type*, %m981$.Matcher.type** %.tmp1975
%.tmp1977 = icmp ne %m981$.Matcher.type* %.tmp1976, null
%.tmp1978 = load %m296$.Error.type*, %m296$.Error.type** %err.1651
%.tmp1979 = icmp eq %m296$.Error.type* %.tmp1978, null
%.tmp1980 = and i1 %.tmp1977, %.tmp1979
br i1 %.tmp1980, label %.if.true.1981, label %.if.false.1981
.if.true.1981:
%.tmp1982 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp1983 = load %m981$.Matcher.type*, %m981$.Matcher.type** %m
%.tmp1984 = getelementptr %m981$.Matcher.type, %m981$.Matcher.type* %.tmp1983, i32 0, i32 3
%.tmp1985 = load %m981$.Matcher.type*, %m981$.Matcher.type** %.tmp1984
%.tmp1986 = load %m981$.Node.type*, %m981$.Node.type** %base
%.tmp1987 = call %m296$.Error.type*(%m981$.AstContext.type*,%m981$.Matcher.type*,%m981$.Node.type*) @m981$parse_query.m296$.Error.typep.m981$.AstContext.typep.m981$.Matcher.typep.m981$.Node.typep(%m981$.AstContext.type* %.tmp1982, %m981$.Matcher.type* %.tmp1985, %m981$.Node.type* %.tmp1986)
store %m296$.Error.type* %.tmp1987, %m296$.Error.type** %err.1651
br label %.if.end.1981
.if.false.1981:
br label %.if.end.1981
.if.end.1981:
%.tmp1988 = load %m296$.Error.type*, %m296$.Error.type** %err.1651
%.tmp1989 = bitcast %m296$.Error.type* %.tmp1988 to %m296$.Error.type*
ret %m296$.Error.type* %.tmp1989
}
define %m981$.ParseResult.type* @m981$parse_to_ast.m981$.ParseResult.typep.m981$.AstContext.typep.m981$.Rule.typep(%m981$.AstContext.type* %.c.arg, %m981$.Rule.type* %.rule.arg) {
%c = alloca %m981$.AstContext.type*
store %m981$.AstContext.type* %.c.arg, %m981$.AstContext.type** %c
%rule = alloca %m981$.Rule.type*
store %m981$.Rule.type* %.rule.arg, %m981$.Rule.type** %rule
%.tmp1990 = getelementptr %m981$.ParseResult.type, %m981$.ParseResult.type* null, i32 1
%.tmp1991 = ptrtoint %m981$.ParseResult.type* %.tmp1990 to i32
%.tmp1992 = call i8*(i32) @malloc(i32 %.tmp1991)
%.tmp1993 = bitcast i8* %.tmp1992 to %m981$.ParseResult.type*
%res.1994 = alloca %m981$.ParseResult.type*
store %m981$.ParseResult.type* %.tmp1993, %m981$.ParseResult.type** %res.1994
%.tmp1995 = load %m981$.ParseResult.type*, %m981$.ParseResult.type** %res.1994
%.tmp1996 = getelementptr %m981$.ParseResult.type, %m981$.ParseResult.type* %.tmp1995, i32 0, i32 0
store %m296$.Error.type* null, %m296$.Error.type** %.tmp1996
%.tmp1997 = load %m981$.ParseResult.type*, %m981$.ParseResult.type** %res.1994
%.tmp1998 = getelementptr %m981$.ParseResult.type, %m981$.ParseResult.type* %.tmp1997, i32 0, i32 1
%.tmp1999 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp2000 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp1999, i32 0, i32 0
%.tmp2001 = load %m297$.Token.type*, %m297$.Token.type** %.tmp2000
%.tmp2002 = load %m981$.Rule.type*, %m981$.Rule.type** %rule
%.tmp2003 = getelementptr %m981$.Rule.type, %m981$.Rule.type* %.tmp2002, i32 0, i32 0
%.tmp2004 = load i8*, i8** %.tmp2003
%.tmp2005 = bitcast ptr null to i8*
%.tmp2006 = call %m981$.Node.type*(%m297$.Token.type*,i8*,i8*) @m981$new_node.m981$.Node.typep.m297$.Token.typep.cp.cp(%m297$.Token.type* %.tmp2001, i8* %.tmp2004, i8* %.tmp2005)
store %m981$.Node.type* %.tmp2006, %m981$.Node.type** %.tmp1998
%.tmp2007 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp2008 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %.tmp2007, i32 0, i32 0
%.tmp2009 = load %m297$.Token.type*, %m297$.Token.type** %.tmp2008
%start_match.2010 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp2009, %m297$.Token.type** %start_match.2010
%.tmp2011 = load %m981$.ParseResult.type*, %m981$.ParseResult.type** %res.1994
%.tmp2012 = getelementptr %m981$.ParseResult.type, %m981$.ParseResult.type* %.tmp2011, i32 0, i32 0
%.tmp2013 = load %m981$.AstContext.type*, %m981$.AstContext.type** %c
%.tmp2014 = load %m981$.Rule.type*, %m981$.Rule.type** %rule
%.tmp2015 = getelementptr %m981$.Rule.type, %m981$.Rule.type* %.tmp2014, i32 0, i32 2
%.tmp2016 = load %m981$.Matcher.type*, %m981$.Matcher.type** %.tmp2015
%.tmp2017 = load %m981$.ParseResult.type*, %m981$.ParseResult.type** %res.1994
%.tmp2018 = getelementptr %m981$.ParseResult.type, %m981$.ParseResult.type* %.tmp2017, i32 0, i32 1
%.tmp2019 = load %m981$.Node.type*, %m981$.Node.type** %.tmp2018
%.tmp2020 = call %m296$.Error.type*(%m981$.AstContext.type*,%m981$.Matcher.type*,%m981$.Node.type*) @m981$parse_query.m296$.Error.typep.m981$.AstContext.typep.m981$.Matcher.typep.m981$.Node.typep(%m981$.AstContext.type* %.tmp2013, %m981$.Matcher.type* %.tmp2016, %m981$.Node.type* %.tmp2019)
store %m296$.Error.type* %.tmp2020, %m296$.Error.type** %.tmp2012
%.tmp2021 = load %m981$.ParseResult.type*, %m981$.ParseResult.type** %res.1994
ret %m981$.ParseResult.type* %.tmp2021
}
define %m981$.ParseResult.type* @m981$ast.m981$.ParseResult.typep.m981$.Rule.typepp.cp.m297$.Token.typep(%m981$.Rule.type** %.grammar.arg, i8* %.start.arg, %m297$.Token.type* %.tokens.arg) {
%grammar = alloca %m981$.Rule.type**
store %m981$.Rule.type** %.grammar.arg, %m981$.Rule.type*** %grammar
%start = alloca i8*
store i8* %.start.arg, i8** %start
%tokens = alloca %m297$.Token.type*
store %m297$.Token.type* %.tokens.arg, %m297$.Token.type** %tokens
%.tmp2022 = load %m981$.Rule.type**, %m981$.Rule.type*** %grammar
%.tmp2023 = load i8*, i8** %start
%.tmp2024 = call %m981$.Rule.type*(%m981$.Rule.type**,i8*) @m981$find_rule.m981$.Rule.typep.m981$.Rule.typepp.cp(%m981$.Rule.type** %.tmp2022, i8* %.tmp2023)
%start_matcher.2025 = alloca %m981$.Rule.type*
store %m981$.Rule.type* %.tmp2024, %m981$.Rule.type** %start_matcher.2025
%.tmp2026 = load %m981$.Rule.type*, %m981$.Rule.type** %start_matcher.2025
%.tmp2027 = icmp ne %m981$.Rule.type* %.tmp2026, null
%.tmp2029 = getelementptr [44 x i8], [44 x i8]*@.str2028, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2027, i8* %.tmp2029)
%c.2030 = alloca %m981$.AstContext.type
%.tmp2031 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %c.2030, i32 0, i32 0
store %m297$.Token.type* null, %m297$.Token.type** %.tmp2031
%.tmp2032 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %c.2030, i32 0, i32 1
store %m981$.Rule.type** null, %m981$.Rule.type*** %.tmp2032
%.tmp2033 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %c.2030, i32 0, i32 0
%.tmp2034 = load %m297$.Token.type*, %m297$.Token.type** %tokens
store %m297$.Token.type* %.tmp2034, %m297$.Token.type** %.tmp2033
%.tmp2035 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %c.2030, i32 0, i32 1
%.tmp2036 = load %m981$.Rule.type**, %m981$.Rule.type*** %grammar
store %m981$.Rule.type** %.tmp2036, %m981$.Rule.type*** %.tmp2035
%.tmp2037 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %c.2030, i32 0
%.tmp2038 = load %m981$.Rule.type*, %m981$.Rule.type** %start_matcher.2025
%.tmp2039 = call %m981$.ParseResult.type*(%m981$.AstContext.type*,%m981$.Rule.type*) @m981$parse_to_ast.m981$.ParseResult.typep.m981$.AstContext.typep.m981$.Rule.typep(%m981$.AstContext.type* %.tmp2037, %m981$.Rule.type* %.tmp2038)
%res.2040 = alloca %m981$.ParseResult.type*
store %m981$.ParseResult.type* %.tmp2039, %m981$.ParseResult.type** %res.2040
%.tmp2041 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %c.2030, i32 0, i32 0
%.tmp2042 = load %m297$.Token.type*, %m297$.Token.type** %.tmp2041
%.tmp2043 = getelementptr %m297$.Token.type, %m297$.Token.type* %.tmp2042, i32 0, i32 0
%.tmp2044 = load i8*, i8** %.tmp2043
%.tmp2046 = getelementptr [4 x i8], [4 x i8]*@.str2045, i32 0, i32 0
%.tmp2047 = call i32(i8*,i8*) @strcmp(i8* %.tmp2044, i8* %.tmp2046)
%.tmp2048 = icmp ne i32 %.tmp2047, 0
%.tmp2049 = load %m981$.ParseResult.type*, %m981$.ParseResult.type** %res.2040
%.tmp2050 = getelementptr %m981$.ParseResult.type, %m981$.ParseResult.type* %.tmp2049, i32 0, i32 0
%.tmp2051 = load %m296$.Error.type*, %m296$.Error.type** %.tmp2050
%.tmp2052 = icmp eq %m296$.Error.type* %.tmp2051, null
%.tmp2053 = and i1 %.tmp2048, %.tmp2052
br i1 %.tmp2053, label %.if.true.2054, label %.if.false.2054
.if.true.2054:
%.tmp2055 = load %m981$.ParseResult.type*, %m981$.ParseResult.type** %res.2040
%.tmp2056 = getelementptr %m981$.ParseResult.type, %m981$.ParseResult.type* %.tmp2055, i32 0, i32 0
%.tmp2057 = getelementptr %m981$.AstContext.type, %m981$.AstContext.type* %c.2030, i32 0, i32 0
%.tmp2058 = load %m297$.Token.type*, %m297$.Token.type** %.tmp2057
%.tmp2060 = getelementptr [26 x i8], [26 x i8]*@.str2059, i32 0, i32 0
%.tmp2061 = call %m296$.Error.type*(%m297$.Token.type*,i8*) @m296$from.m296$.Error.typep.m297$.Token.typep.cp(%m297$.Token.type* %.tmp2058, i8* %.tmp2060)
store %m296$.Error.type* %.tmp2061, %m296$.Error.type** %.tmp2056
br label %.if.end.2054
.if.false.2054:
br label %.if.end.2054
.if.end.2054:
%.tmp2062 = load %m981$.ParseResult.type*, %m981$.ParseResult.type** %res.2040
ret %m981$.ParseResult.type* %.tmp2062
}
define i8* @m2063$node_to_string.cp.m981$.Node.typep(%m981$.Node.type* %.n.arg) {
%n = alloca %m981$.Node.type*
store %m981$.Node.type* %.n.arg, %m981$.Node.type** %n
%.tmp2064 = call %m0$.File.type*() @tmpfile()
%tmp.2065 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2064, %m0$.File.type** %tmp.2065
%.tmp2066 = load %m981$.Node.type*, %m981$.Node.type** %n
%.tmp2067 = load %m0$.File.type*, %m0$.File.type** %tmp.2065
call void(%m981$.Node.type*,%m0$.File.type*,i32) @m2063$_node_to_string.v.m981$.Node.typep.m0$.File.typep.i(%m981$.Node.type* %.tmp2066, %m0$.File.type* %.tmp2067, i32 1)
%.tmp2068 = load %m0$.File.type*, %m0$.File.type** %tmp.2065
%.tmp2069 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp2068)
%.tmp2070 = load %m0$.File.type*, %m0$.File.type** %tmp.2065
%.tmp2071 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp2070)
%str_len.2072 = alloca i32
store i32 %.tmp2071, i32* %str_len.2072
%.tmp2073 = load %m0$.File.type*, %m0$.File.type** %tmp.2065
%.tmp2074 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp2073)
%tmp_fd.2075 = alloca i32
store i32 %.tmp2074, i32* %tmp_fd.2075
%.tmp2076 = load i32, i32* %tmp_fd.2075
%.tmp2077 = load i32, i32* @SEEK_SET
%.tmp2078 = call i32(i32,i32,i32) @lseek(i32 %.tmp2076, i32 0, i32 %.tmp2077)
%.tmp2079 = load i32, i32* %str_len.2072
%.tmp2080 = call i8*(i32) @malloc(i32 %.tmp2079)
%buf.2081 = alloca i8*
store i8* %.tmp2080, i8** %buf.2081
%.tmp2082 = load i32, i32* %tmp_fd.2075
%.tmp2083 = load i8*, i8** %buf.2081
%.tmp2084 = load i32, i32* %str_len.2072
%.tmp2085 = call i32(i32,i8*,i32) @read(i32 %.tmp2082, i8* %.tmp2083, i32 %.tmp2084)
%read.2086 = alloca i32
store i32 %.tmp2085, i32* %read.2086
%.tmp2087 = load i32, i32* %read.2086
%.tmp2088 = load i32, i32* %str_len.2072
%.tmp2089 = icmp ne i32 %.tmp2087, %.tmp2088
br i1 %.tmp2089, label %.if.true.2090, label %.if.false.2090
.if.true.2090:
%.tmp2091 = load i8*, i8** %buf.2081
call void(i8*) @free(i8* %.tmp2091)
store i8* null, i8** %buf.2081
br label %.if.end.2090
.if.false.2090:
br label %.if.end.2090
.if.end.2090:
%.tmp2092 = load i8*, i8** %buf.2081
ret i8* %.tmp2092
}
define void @m2063$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp2093 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2095 = getelementptr [2 x i8], [2 x i8]*@.str2094, i32 0, i32 0
%.tmp2096 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2093, i8* %.tmp2095)
%i.2098 = alloca i32
store i32 0, i32* %i.2098
br label %.for.start.2097
.for.start.2097:
%.tmp2099 = load i32, i32* %i.2098
%.tmp2100 = load i32, i32* %indent
%.tmp2101 = icmp slt i32 %.tmp2099, %.tmp2100
br i1 %.tmp2101, label %.for.continue.2097, label %.for.end.2097
.for.continue.2097:
%.tmp2102 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2104 = getelementptr [3 x i8], [3 x i8]*@.str2103, i32 0, i32 0
%.tmp2105 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2102, i8* %.tmp2104)
%.tmp2106 = load i32, i32* %i.2098
%.tmp2107 = add i32 %.tmp2106, 1
store i32 %.tmp2107, i32* %i.2098
br label %.for.start.2097
.for.end.2097:
ret void
}
define void @m2063$_node_to_string.v.m981$.Node.typep.m0$.File.typep.i(%m981$.Node.type* %.node.arg, %m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%node = alloca %m981$.Node.type*
store %m981$.Node.type* %.node.arg, %m981$.Node.type** %node
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp2108 = load %m981$.Node.type*, %m981$.Node.type** %node
%.tmp2109 = icmp eq %m981$.Node.type* %.tmp2108, null
br i1 %.tmp2109, label %.if.true.2110, label %.if.false.2110
.if.true.2110:
%.tmp2111 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2113 = getelementptr [7 x i8], [7 x i8]*@.str2112, i32 0, i32 0
%.tmp2114 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2111, i8* %.tmp2113)
ret void
br label %.if.end.2110
.if.false.2110:
br label %.if.end.2110
.if.end.2110:
%.tmp2115 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2117 = getelementptr [2 x i8], [2 x i8]*@.str2116, i32 0, i32 0
%.tmp2118 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2115, i8* %.tmp2117)
%.tmp2119 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2120 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2063$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2119, i32 %.tmp2120)
%.tmp2121 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2123 = getelementptr [13 x i8], [13 x i8]*@.str2122, i32 0, i32 0
%.tmp2124 = load %m981$.Node.type*, %m981$.Node.type** %node
%.tmp2125 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2124, i32 0, i32 0
%.tmp2126 = load i8*, i8** %.tmp2125
%.tmp2127 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2121, i8* %.tmp2123, i8* %.tmp2126)
%.tmp2128 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2129 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2063$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2128, i32 %.tmp2129)
%.tmp2130 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2132 = getelementptr [12 x i8], [12 x i8]*@.str2131, i32 0, i32 0
%.tmp2133 = load %m981$.Node.type*, %m981$.Node.type** %node
%.tmp2134 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2133, i32 0, i32 1
%.tmp2135 = load i8*, i8** %.tmp2134
%.tmp2136 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2130, i8* %.tmp2132, i8* %.tmp2135)
%.tmp2137 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2138 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2063$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2137, i32 %.tmp2138)
%.tmp2139 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2141 = getelementptr [11 x i8], [11 x i8]*@.str2140, i32 0, i32 0
%.tmp2142 = load %m981$.Node.type*, %m981$.Node.type** %node
%.tmp2143 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2142, i32 0, i32 3
%.tmp2144 = load i32, i32* %.tmp2143
%.tmp2145 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2139, i8* %.tmp2141, i32 %.tmp2144)
%.tmp2146 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2147 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2063$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2146, i32 %.tmp2147)
%.tmp2148 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2150 = getelementptr [19 x i8], [19 x i8]*@.str2149, i32 0, i32 0
%.tmp2151 = load %m981$.Node.type*, %m981$.Node.type** %node
%.tmp2152 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2151, i32 0, i32 4
%.tmp2153 = load i32, i32* %.tmp2152
%.tmp2154 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2148, i8* %.tmp2150, i32 %.tmp2153)
%.tmp2155 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2156 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2063$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2155, i32 %.tmp2156)
%.tmp2157 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2159 = getelementptr [9 x i8], [9 x i8]*@.str2158, i32 0, i32 0
%.tmp2160 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2157, i8* %.tmp2159)
%.tmp2161 = load %m981$.Node.type*, %m981$.Node.type** %node
%.tmp2162 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2161, i32 0, i32 7
%.tmp2163 = load %m981$.Node.type*, %m981$.Node.type** %.tmp2162
%.tmp2164 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2165 = load i32, i32* %indent
%.tmp2166 = add i32 %.tmp2165, 1
call void(%m981$.Node.type*,%m0$.File.type*,i32) @m2063$_node_to_string.v.m981$.Node.typep.m0$.File.typep.i(%m981$.Node.type* %.tmp2163, %m0$.File.type* %.tmp2164, i32 %.tmp2166)
%.tmp2167 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2168 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2063$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2167, i32 %.tmp2168)
%.tmp2169 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2171 = getelementptr [13 x i8], [13 x i8]*@.str2170, i32 0, i32 0
%.tmp2172 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2169, i8* %.tmp2171)
%.tmp2173 = load %m981$.Node.type*, %m981$.Node.type** %node
%.tmp2174 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2173, i32 0, i32 6
%.tmp2175 = load %m981$.Node.type*, %m981$.Node.type** %.tmp2174
%.tmp2176 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2177 = load i32, i32* %indent
%.tmp2178 = add i32 %.tmp2177, 1
call void(%m981$.Node.type*,%m0$.File.type*,i32) @m2063$_node_to_string.v.m981$.Node.typep.m0$.File.typep.i(%m981$.Node.type* %.tmp2175, %m0$.File.type* %.tmp2176, i32 %.tmp2178)
%.tmp2179 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2180 = load i32, i32* %indent
%.tmp2181 = sub i32 %.tmp2180, 1
call void(%m0$.File.type*,i32) @m2063$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2179, i32 %.tmp2181)
%.tmp2182 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2184 = getelementptr [2 x i8], [2 x i8]*@.str2183, i32 0, i32 0
%.tmp2185 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2182, i8* %.tmp2184)
ret void
}
define i8* @m2186$grammar.cp() {
%.tmp2188 = getelementptr [1886 x i8], [1886 x i8]*@.str2187, i32 0, i32 0
ret i8* %.tmp2188
}
define i8* @m2189$append_tmpl.cp() {
%.tmp2191 = getelementptr [1885 x i8], [1885 x i8]*@.str2190, i32 0, i32 0
ret i8* %.tmp2191
}
define i8* @m2192$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp2193 = load i8*, i8** %text
%.tmp2194 = call i32(i8*) @strlen(i8* %.tmp2193)
%str_len.2195 = alloca i32
store i32 %.tmp2194, i32* %str_len.2195
%.tmp2197 = getelementptr [1 x i8], [1 x i8]*@.str2196, i32 0, i32 0
%buf.2198 = alloca i8*
store i8* %.tmp2197, i8** %buf.2198
%i.2200 = alloca i32
store i32 1, i32* %i.2200
br label %.for.start.2199
.for.start.2199:
%.tmp2201 = load i32, i32* %i.2200
%.tmp2202 = load i32, i32* %str_len.2195
%.tmp2203 = sub i32 %.tmp2202, 1
%.tmp2204 = icmp slt i32 %.tmp2201, %.tmp2203
br i1 %.tmp2204, label %.for.continue.2199, label %.for.end.2199
.for.continue.2199:
%.tmp2205 = load i32, i32* %i.2200
%.tmp2206 = load i8*, i8** %text
%.tmp2207 = getelementptr i8, i8* %.tmp2206, i32 %.tmp2205
%.tmp2208 = load i8, i8* %.tmp2207
%.tmp2209 = icmp eq i8 %.tmp2208, 34
br i1 %.tmp2209, label %.if.true.2210, label %.if.false.2210
.if.true.2210:
%.tmp2211 = getelementptr i8*, i8** %buf.2198, i32 0
%.tmp2213 = getelementptr [6 x i8], [6 x i8]*@.str2212, i32 0, i32 0
%.tmp2214 = load i8*, i8** %buf.2198
%.tmp2215 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2211, i8* %.tmp2213, i8* %.tmp2214)
br label %.if.end.2210
.if.false.2210:
%.tmp2216 = load i32, i32* %i.2200
%.tmp2217 = load i8*, i8** %text
%.tmp2218 = getelementptr i8, i8* %.tmp2217, i32 %.tmp2216
%.tmp2219 = load i8, i8* %.tmp2218
%.tmp2220 = icmp eq i8 %.tmp2219, 92
br i1 %.tmp2220, label %.if.true.2221, label %.if.false.2221
.if.true.2221:
%.tmp2222 = load i32, i32* %i.2200
%.tmp2223 = add i32 %.tmp2222, 1
%.tmp2224 = load i8*, i8** %text
%.tmp2225 = getelementptr i8, i8* %.tmp2224, i32 %.tmp2223
%.tmp2226 = load i8, i8* %.tmp2225
%.tmp2227 = icmp eq i8 %.tmp2226, 110
%.tmp2228 = load i32, i32* %i.2200
%.tmp2229 = add i32 %.tmp2228, 1
%.tmp2230 = load i8*, i8** %text
%.tmp2231 = getelementptr i8, i8* %.tmp2230, i32 %.tmp2229
%.tmp2232 = load i8, i8* %.tmp2231
%.tmp2233 = icmp eq i8 %.tmp2232, 78
%.tmp2234 = or i1 %.tmp2227, %.tmp2233
br i1 %.tmp2234, label %.if.true.2235, label %.if.false.2235
.if.true.2235:
%.tmp2236 = getelementptr i8*, i8** %buf.2198, i32 0
%.tmp2238 = getelementptr [6 x i8], [6 x i8]*@.str2237, i32 0, i32 0
%.tmp2239 = load i8*, i8** %buf.2198
%.tmp2240 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2236, i8* %.tmp2238, i8* %.tmp2239)
%.tmp2241 = load i32, i32* %i.2200
%.tmp2242 = add i32 %.tmp2241, 1
store i32 %.tmp2242, i32* %i.2200
br label %.if.end.2235
.if.false.2235:
%.tmp2243 = load i32, i32* %i.2200
%.tmp2244 = add i32 %.tmp2243, 1
%.tmp2245 = load i8*, i8** %text
%.tmp2246 = getelementptr i8, i8* %.tmp2245, i32 %.tmp2244
%.tmp2247 = load i8, i8* %.tmp2246
%.tmp2248 = icmp eq i8 %.tmp2247, 92
br i1 %.tmp2248, label %.if.true.2249, label %.if.false.2249
.if.true.2249:
%.tmp2250 = getelementptr i8*, i8** %buf.2198, i32 0
%.tmp2252 = getelementptr [6 x i8], [6 x i8]*@.str2251, i32 0, i32 0
%.tmp2253 = load i8*, i8** %buf.2198
%.tmp2254 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2250, i8* %.tmp2252, i8* %.tmp2253)
%.tmp2255 = load i32, i32* %i.2200
%.tmp2256 = add i32 %.tmp2255, 1
store i32 %.tmp2256, i32* %i.2200
br label %.if.end.2249
.if.false.2249:
%.tmp2257 = load i32, i32* %i.2200
%.tmp2258 = add i32 %.tmp2257, 1
%.tmp2259 = load i8*, i8** %text
%.tmp2260 = getelementptr i8, i8* %.tmp2259, i32 %.tmp2258
%.tmp2261 = load i8, i8* %.tmp2260
%.tmp2262 = icmp eq i8 %.tmp2261, 120
br i1 %.tmp2262, label %.if.true.2263, label %.if.false.2263
.if.true.2263:
%.tmp2264 = load i32, i32* %i.2200
%.tmp2265 = add i32 %.tmp2264, 2
store i32 %.tmp2265, i32* %i.2200
%.tmp2266 = getelementptr i8*, i8** %buf.2198, i32 0
%.tmp2268 = getelementptr [8 x i8], [8 x i8]*@.str2267, i32 0, i32 0
%.tmp2269 = load i8*, i8** %buf.2198
%.tmp2270 = load i32, i32* %i.2200
%.tmp2271 = load i8*, i8** %text
%.tmp2272 = getelementptr i8, i8* %.tmp2271, i32 %.tmp2270
%.tmp2273 = load i8, i8* %.tmp2272
%.tmp2274 = call i8(i8) @toupper(i8 %.tmp2273)
%.tmp2275 = load i32, i32* %i.2200
%.tmp2276 = add i32 %.tmp2275, 1
%.tmp2277 = load i8*, i8** %text
%.tmp2278 = getelementptr i8, i8* %.tmp2277, i32 %.tmp2276
%.tmp2279 = load i8, i8* %.tmp2278
%.tmp2280 = call i8(i8) @toupper(i8 %.tmp2279)
%.tmp2281 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2266, i8* %.tmp2268, i8* %.tmp2269, i8 %.tmp2274, i8 %.tmp2280)
%.tmp2282 = load i32, i32* %i.2200
%.tmp2283 = add i32 %.tmp2282, 1
store i32 %.tmp2283, i32* %i.2200
br label %.if.end.2263
.if.false.2263:
%.tmp2284 = getelementptr i8*, i8** %buf.2198, i32 0
%.tmp2286 = getelementptr [5 x i8], [5 x i8]*@.str2285, i32 0, i32 0
%.tmp2287 = load i8*, i8** %buf.2198
%.tmp2288 = load i32, i32* %i.2200
%.tmp2289 = load i8*, i8** %text
%.tmp2290 = getelementptr i8, i8* %.tmp2289, i32 %.tmp2288
%.tmp2291 = load i8, i8* %.tmp2290
%.tmp2292 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2284, i8* %.tmp2286, i8* %.tmp2287, i8 %.tmp2291)
br label %.if.end.2263
.if.end.2263:
br label %.if.end.2249
.if.end.2249:
br label %.if.end.2235
.if.end.2235:
br label %.if.end.2221
.if.false.2221:
%.tmp2293 = getelementptr i8*, i8** %buf.2198, i32 0
%.tmp2295 = getelementptr [5 x i8], [5 x i8]*@.str2294, i32 0, i32 0
%.tmp2296 = load i8*, i8** %buf.2198
%.tmp2297 = load i32, i32* %i.2200
%.tmp2298 = load i8*, i8** %text
%.tmp2299 = getelementptr i8, i8* %.tmp2298, i32 %.tmp2297
%.tmp2300 = load i8, i8* %.tmp2299
%.tmp2301 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2293, i8* %.tmp2295, i8* %.tmp2296, i8 %.tmp2300)
br label %.if.end.2221
.if.end.2221:
br label %.if.end.2210
.if.end.2210:
%.tmp2302 = load i32, i32* %i.2200
%.tmp2303 = add i32 %.tmp2302, 1
store i32 %.tmp2303, i32* %i.2200
br label %.for.start.2199
.for.end.2199:
%.tmp2304 = getelementptr i8*, i8** %buf.2198, i32 0
%.tmp2306 = getelementptr [9 x i8], [9 x i8]*@.str2305, i32 0, i32 0
%.tmp2307 = load i8*, i8** %buf.2198
%.tmp2308 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2304, i8* %.tmp2306, i8* %.tmp2307)
%.tmp2309 = load i8*, i8** %buf.2198
ret i8* %.tmp2309
}
define i32 @m2192$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len.2310 = alloca i32
store i32 0, i32* %len.2310
%i.2312 = alloca i32
store i32 2, i32* %i.2312
br label %.for.start.2311
.for.start.2311:
%.tmp2313 = load i32, i32* %i.2312
%.tmp2314 = load i8*, i8** %text
%.tmp2315 = getelementptr i8, i8* %.tmp2314, i32 %.tmp2313
%.tmp2316 = load i8, i8* %.tmp2315
%.tmp2317 = icmp ne i8 %.tmp2316, 0
br i1 %.tmp2317, label %.for.continue.2311, label %.for.end.2311
.for.continue.2311:
%.tmp2318 = load i32, i32* %i.2312
%.tmp2319 = load i8*, i8** %text
%.tmp2320 = getelementptr i8, i8* %.tmp2319, i32 %.tmp2318
%.tmp2321 = load i8, i8* %.tmp2320
%.tmp2322 = icmp eq i8 %.tmp2321, 92
br i1 %.tmp2322, label %.if.true.2323, label %.if.false.2323
.if.true.2323:
%.tmp2324 = load i32, i32* %i.2312
%.tmp2325 = add i32 %.tmp2324, 2
store i32 %.tmp2325, i32* %i.2312
br label %.if.end.2323
.if.false.2323:
br label %.if.end.2323
.if.end.2323:
%.tmp2326 = load i32, i32* %len.2310
%.tmp2327 = add i32 %.tmp2326, 1
store i32 %.tmp2327, i32* %len.2310
%.tmp2328 = load i32, i32* %i.2312
%.tmp2329 = add i32 %.tmp2328, 1
store i32 %.tmp2329, i32* %i.2312
br label %.for.start.2311
.for.end.2311:
%.tmp2330 = load i32, i32* %len.2310
%.tmp2331 = sub i32 %.tmp2330, 1
ret i32 %.tmp2331
}
define i8* @m2192$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval.2332 = alloca i32
store i32 0, i32* %intval.2332
%buf.2333 = alloca i8*
store i8* null, i8** %buf.2333
%chrval.2334 = alloca i8
store i8 0, i8* %chrval.2334
%.tmp2335 = load i8*, i8** %chr_repr
%.tmp2336 = call i32(i8*) @strlen(i8* %.tmp2335)
%chr_len.2337 = alloca i32
store i32 %.tmp2336, i32* %chr_len.2337
%.tmp2338 = load i32, i32* %chr_len.2337
%.tmp2339 = icmp eq i32 %.tmp2338, 6
br i1 %.tmp2339, label %.if.true.2340, label %.if.false.2340
.if.true.2340:
%.tmp2341 = load i8*, i8** %chr_repr
%.tmp2343 = getelementptr [7 x i8], [7 x i8]*@.str2342, i32 0, i32 0
%.tmp2344 = getelementptr i32, i32* %intval.2332, i32 0
%.tmp2345 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2341, i8* %.tmp2343, i32* %.tmp2344)
%.tmp2346 = getelementptr i8*, i8** %buf.2333, i32 0
%.tmp2348 = getelementptr [3 x i8], [3 x i8]*@.str2347, i32 0, i32 0
%.tmp2349 = load i32, i32* %intval.2332
%.tmp2350 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2346, i8* %.tmp2348, i32 %.tmp2349)
br label %.if.end.2340
.if.false.2340:
%.tmp2351 = load i32, i32* %chr_len.2337
%.tmp2352 = icmp eq i32 %.tmp2351, 5
br i1 %.tmp2352, label %.if.true.2353, label %.if.false.2353
.if.true.2353:
%.tmp2354 = load i8*, i8** %chr_repr
%.tmp2356 = getelementptr [6 x i8], [6 x i8]*@.str2355, i32 0, i32 0
%.tmp2357 = getelementptr i32, i32* %intval.2332, i32 0
%.tmp2358 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2354, i8* %.tmp2356, i32* %.tmp2357)
%.tmp2359 = getelementptr i8*, i8** %buf.2333, i32 0
%.tmp2361 = getelementptr [3 x i8], [3 x i8]*@.str2360, i32 0, i32 0
%.tmp2362 = load i32, i32* %intval.2332
%.tmp2363 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2359, i8* %.tmp2361, i32 %.tmp2362)
br label %.if.end.2353
.if.false.2353:
%.tmp2364 = load i32, i32* %chr_len.2337
%.tmp2365 = icmp eq i32 %.tmp2364, 4
br i1 %.tmp2365, label %.if.true.2366, label %.if.false.2366
.if.true.2366:
%.tmp2367 = load i8*, i8** %chr_repr
%.tmp2369 = getelementptr [6 x i8], [6 x i8]*@.str2368, i32 0, i32 0
%.tmp2370 = getelementptr i8, i8* %chrval.2334, i32 0
%.tmp2371 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2367, i8* %.tmp2369, i8* %.tmp2370)
%.tmp2372 = load i8, i8* %chrval.2334
%.tmp2373 = icmp eq i8 %.tmp2372, 110
br i1 %.tmp2373, label %.if.true.2374, label %.if.false.2374
.if.true.2374:
%.tmp2376 = getelementptr [3 x i8], [3 x i8]*@.str2375, i32 0, i32 0
store i8* %.tmp2376, i8** %buf.2333
br label %.if.end.2374
.if.false.2374:
%.tmp2377 = bitcast ptr null to i8*
ret i8* %.tmp2377
br label %.if.end.2374
.if.end.2374:
br label %.if.end.2366
.if.false.2366:
%.tmp2378 = load i32, i32* %chr_len.2337
%.tmp2379 = icmp eq i32 %.tmp2378, 3
br i1 %.tmp2379, label %.if.true.2380, label %.if.false.2380
.if.true.2380:
%.tmp2381 = load i8*, i8** %chr_repr
%.tmp2383 = getelementptr [5 x i8], [5 x i8]*@.str2382, i32 0, i32 0
%.tmp2384 = getelementptr i32, i32* %intval.2332, i32 0
%.tmp2385 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2381, i8* %.tmp2383, i32* %.tmp2384)
%.tmp2386 = getelementptr i8*, i8** %buf.2333, i32 0
%.tmp2388 = getelementptr [3 x i8], [3 x i8]*@.str2387, i32 0, i32 0
%.tmp2389 = load i32, i32* %intval.2332
%.tmp2390 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2386, i8* %.tmp2388, i32 %.tmp2389)
br label %.if.end.2380
.if.false.2380:
%.tmp2391 = bitcast ptr null to i8*
ret i8* %.tmp2391
br label %.if.end.2380
.if.end.2380:
br label %.if.end.2366
.if.end.2366:
br label %.if.end.2353
.if.end.2353:
br label %.if.end.2340
.if.end.2340:
%.tmp2392 = load i8*, i8** %buf.2333
ret i8* %.tmp2392
}
%m2393$.SYStack.type = type {%m981$.Node.type*,%m2393$.SYStack.type*}
@SYStack_size = constant i32 16
define %m2393$.SYStack.type* @m2393$stack_new.m2393$.SYStack.typep() {
%.tmp2394 = load i32, i32* @SYStack_size
%.tmp2395 = call i8*(i32) @malloc(i32 %.tmp2394)
%.tmp2396 = bitcast i8* %.tmp2395 to %m2393$.SYStack.type*
%s.2397 = alloca %m2393$.SYStack.type*
store %m2393$.SYStack.type* %.tmp2396, %m2393$.SYStack.type** %s.2397
%.tmp2398 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %s.2397
%.tmp2399 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp2398, i32 0, i32 0
store %m981$.Node.type* null, %m981$.Node.type** %.tmp2399
%.tmp2400 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %s.2397
%.tmp2401 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp2400, i32 0, i32 1
store %m2393$.SYStack.type* null, %m2393$.SYStack.type** %.tmp2401
%.tmp2402 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %s.2397
ret %m2393$.SYStack.type* %.tmp2402
}
define %m2393$.SYStack.type* @m2393$sy_algorithm.m2393$.SYStack.typep.m981$.Node.typep(%m981$.Node.type* %.assignable.arg) {
%assignable = alloca %m981$.Node.type*
store %m981$.Node.type* %.assignable.arg, %m981$.Node.type** %assignable
%.tmp2403 = call %m2393$.SYStack.type*() @m2393$stack_new.m2393$.SYStack.typep()
%out_stack.2404 = alloca %m2393$.SYStack.type*
store %m2393$.SYStack.type* %.tmp2403, %m2393$.SYStack.type** %out_stack.2404
%.tmp2405 = call %m2393$.SYStack.type*() @m2393$stack_new.m2393$.SYStack.typep()
%op_stack.2406 = alloca %m2393$.SYStack.type*
store %m2393$.SYStack.type* %.tmp2405, %m2393$.SYStack.type** %op_stack.2406
%.tmp2407 = call %m2393$.SYStack.type*() @m2393$stack_new.m2393$.SYStack.typep()
%token_stack.2408 = alloca %m2393$.SYStack.type*
store %m2393$.SYStack.type* %.tmp2407, %m2393$.SYStack.type** %token_stack.2408
%ptr.2409 = alloca %m981$.Node.type*
store %m981$.Node.type* null, %m981$.Node.type** %ptr.2409
%.tmp2411 = load %m981$.Node.type*, %m981$.Node.type** %assignable
store %m981$.Node.type* %.tmp2411, %m981$.Node.type** %ptr.2409
br label %.for.start.2410
.for.start.2410:
%.tmp2412 = load %m981$.Node.type*, %m981$.Node.type** %ptr.2409
%.tmp2413 = icmp ne %m981$.Node.type* %.tmp2412, null
br i1 %.tmp2413, label %.for.continue.2410, label %.for.end.2410
.for.continue.2410:
%.tmp2414 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %token_stack.2408
%.tmp2415 = load %m981$.Node.type*, %m981$.Node.type** %ptr.2409
%.tmp2416 = call %m2393$.SYStack.type*(%m2393$.SYStack.type*,%m981$.Node.type*) @m2393$stack_push.m2393$.SYStack.typep.m2393$.SYStack.typep.m981$.Node.typep(%m2393$.SYStack.type* %.tmp2414, %m981$.Node.type* %.tmp2415)
store %m2393$.SYStack.type* %.tmp2416, %m2393$.SYStack.type** %token_stack.2408
%.tmp2417 = load %m981$.Node.type*, %m981$.Node.type** %ptr.2409
%.tmp2418 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2417, i32 0, i32 7
%.tmp2419 = load %m981$.Node.type*, %m981$.Node.type** %.tmp2418
store %m981$.Node.type* %.tmp2419, %m981$.Node.type** %ptr.2409
br label %.for.start.2410
.for.end.2410:
%.tmp2421 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %token_stack.2408
%.tmp2422 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp2421, i32 0, i32 0
%.tmp2423 = load %m981$.Node.type*, %m981$.Node.type** %.tmp2422
store %m981$.Node.type* %.tmp2423, %m981$.Node.type** %ptr.2409
br label %.for.start.2420
.for.start.2420:
%.tmp2424 = load %m981$.Node.type*, %m981$.Node.type** %ptr.2409
%.tmp2425 = icmp ne %m981$.Node.type* %.tmp2424, null
br i1 %.tmp2425, label %.for.continue.2420, label %.for.end.2420
.for.continue.2420:
%.tmp2426 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %token_stack.2408
%cs.2427 = alloca %m2393$.SYStack.type*
store %m2393$.SYStack.type* %.tmp2426, %m2393$.SYStack.type** %cs.2427
%.tmp2428 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %token_stack.2408
%.tmp2429 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp2428, i32 0, i32 1
%.tmp2430 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %.tmp2429
store %m2393$.SYStack.type* %.tmp2430, %m2393$.SYStack.type** %token_stack.2408
%.tmp2431 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %cs.2427
%.tmp2432 = bitcast %m2393$.SYStack.type* %.tmp2431 to i8*
call void(i8*) @free(i8* %.tmp2432)
%.tmp2433 = load %m981$.Node.type*, %m981$.Node.type** %ptr.2409
%.tmp2434 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2433, i32 0, i32 0
%.tmp2435 = load i8*, i8** %.tmp2434
%.tmp2437 = getelementptr [16 x i8], [16 x i8]*@.str2436, i32 0, i32 0
%.tmp2438 = call i32(i8*,i8*) @strcmp(i8* %.tmp2435, i8* %.tmp2437)
%.tmp2439 = icmp eq i32 %.tmp2438, 0
br i1 %.tmp2439, label %.if.true.2440, label %.if.false.2440
.if.true.2440:
%.tmp2441 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %out_stack.2404
%.tmp2442 = load %m981$.Node.type*, %m981$.Node.type** %ptr.2409
%.tmp2443 = call %m2393$.SYStack.type*(%m2393$.SYStack.type*,%m981$.Node.type*) @m2393$stack_push.m2393$.SYStack.typep.m2393$.SYStack.typep.m981$.Node.typep(%m2393$.SYStack.type* %.tmp2441, %m981$.Node.type* %.tmp2442)
store %m2393$.SYStack.type* %.tmp2443, %m2393$.SYStack.type** %out_stack.2404
br label %.if.end.2440
.if.false.2440:
%.tmp2444 = load %m981$.Node.type*, %m981$.Node.type** %ptr.2409
%.tmp2445 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2444, i32 0, i32 0
%.tmp2446 = load i8*, i8** %.tmp2445
%.tmp2448 = getelementptr [9 x i8], [9 x i8]*@.str2447, i32 0, i32 0
%.tmp2449 = call i32(i8*,i8*) @strcmp(i8* %.tmp2446, i8* %.tmp2448)
%.tmp2450 = icmp eq i32 %.tmp2449, 0
br i1 %.tmp2450, label %.if.true.2451, label %.if.false.2451
.if.true.2451:
%quit.2452 = alloca i1
store i1 0, i1* %quit.2452
br label %.for.start.2453
.for.start.2453:
%.tmp2454 = load i1, i1* %quit.2452
%.tmp2455 = icmp eq i1 %.tmp2454, 0
br i1 %.tmp2455, label %.for.continue.2453, label %.for.end.2453
.for.continue.2453:
%.tmp2456 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %op_stack.2406
%.tmp2457 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp2456, i32 0, i32 0
%.tmp2458 = load %m981$.Node.type*, %m981$.Node.type** %.tmp2457
%.tmp2459 = icmp eq %m981$.Node.type* %.tmp2458, null
br i1 %.tmp2459, label %.if.true.2460, label %.if.false.2460
.if.true.2460:
store i1 1, i1* %quit.2452
br label %.if.end.2460
.if.false.2460:
%.tmp2461 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %op_stack.2406
%.tmp2462 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp2461, i32 0, i32 0
%.tmp2463 = load %m981$.Node.type*, %m981$.Node.type** %.tmp2462
%.tmp2464 = call i32(%m981$.Node.type*) @m2393$op_precedence.i.m981$.Node.typep(%m981$.Node.type* %.tmp2463)
%.tmp2465 = load %m981$.Node.type*, %m981$.Node.type** %ptr.2409
%.tmp2466 = call i32(%m981$.Node.type*) @m2393$op_precedence.i.m981$.Node.typep(%m981$.Node.type* %.tmp2465)
%.tmp2467 = icmp slt i32 %.tmp2464, %.tmp2466
br i1 %.tmp2467, label %.if.true.2468, label %.if.false.2468
.if.true.2468:
%.tmp2469 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %op_stack.2406
%top.2470 = alloca %m2393$.SYStack.type*
store %m2393$.SYStack.type* %.tmp2469, %m2393$.SYStack.type** %top.2470
%.tmp2471 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %op_stack.2406
%.tmp2472 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp2471, i32 0, i32 1
%.tmp2473 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %.tmp2472
store %m2393$.SYStack.type* %.tmp2473, %m2393$.SYStack.type** %op_stack.2406
%.tmp2474 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %out_stack.2404
%.tmp2475 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %top.2470
%.tmp2476 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp2475, i32 0, i32 0
%.tmp2477 = load %m981$.Node.type*, %m981$.Node.type** %.tmp2476
%.tmp2478 = call %m2393$.SYStack.type*(%m2393$.SYStack.type*,%m981$.Node.type*) @m2393$stack_push.m2393$.SYStack.typep.m2393$.SYStack.typep.m981$.Node.typep(%m2393$.SYStack.type* %.tmp2474, %m981$.Node.type* %.tmp2477)
store %m2393$.SYStack.type* %.tmp2478, %m2393$.SYStack.type** %out_stack.2404
%.tmp2479 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %top.2470
%.tmp2480 = bitcast %m2393$.SYStack.type* %.tmp2479 to i8*
call void(i8*) @free(i8* %.tmp2480)
br label %.if.end.2468
.if.false.2468:
store i1 1, i1* %quit.2452
br label %.if.end.2468
.if.end.2468:
br label %.if.end.2460
.if.end.2460:
br label %.for.start.2453
.for.end.2453:
%.tmp2481 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %op_stack.2406
%.tmp2482 = load %m981$.Node.type*, %m981$.Node.type** %ptr.2409
%.tmp2483 = call %m2393$.SYStack.type*(%m2393$.SYStack.type*,%m981$.Node.type*) @m2393$stack_push.m2393$.SYStack.typep.m2393$.SYStack.typep.m981$.Node.typep(%m2393$.SYStack.type* %.tmp2481, %m981$.Node.type* %.tmp2482)
store %m2393$.SYStack.type* %.tmp2483, %m2393$.SYStack.type** %op_stack.2406
br label %.if.end.2451
.if.false.2451:
%.tmp2485 = getelementptr [68 x i8], [68 x i8]*@.str2484, i32 0, i32 0
%.tmp2486 = load %m981$.Node.type*, %m981$.Node.type** %ptr.2409
%.tmp2487 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2486, i32 0, i32 0
%.tmp2488 = load i8*, i8** %.tmp2487
%.tmp2489 = call i32(i8*,...) @printf(i8* %.tmp2485, i8* %.tmp2488)
br label %.if.end.2451
.if.end.2451:
br label %.if.end.2440
.if.end.2440:
%.tmp2490 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %token_stack.2408
%.tmp2491 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp2490, i32 0, i32 0
%.tmp2492 = load %m981$.Node.type*, %m981$.Node.type** %.tmp2491
store %m981$.Node.type* %.tmp2492, %m981$.Node.type** %ptr.2409
br label %.for.start.2420
.for.end.2420:
br label %.for.start.2493
.for.start.2493:
%.tmp2494 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %op_stack.2406
%.tmp2495 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp2494, i32 0, i32 0
%.tmp2496 = load %m981$.Node.type*, %m981$.Node.type** %.tmp2495
%.tmp2497 = icmp ne %m981$.Node.type* %.tmp2496, null
br i1 %.tmp2497, label %.for.continue.2493, label %.for.end.2493
.for.continue.2493:
%.tmp2498 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %op_stack.2406
%.tmp2499 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp2498, i32 0, i32 0
%.tmp2500 = load %m981$.Node.type*, %m981$.Node.type** %.tmp2499
%node.2501 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp2500, %m981$.Node.type** %node.2501
%.tmp2502 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %op_stack.2406
%s.2503 = alloca %m2393$.SYStack.type*
store %m2393$.SYStack.type* %.tmp2502, %m2393$.SYStack.type** %s.2503
%.tmp2504 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %op_stack.2406
%.tmp2505 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp2504, i32 0, i32 1
%.tmp2506 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %.tmp2505
store %m2393$.SYStack.type* %.tmp2506, %m2393$.SYStack.type** %op_stack.2406
%.tmp2507 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %s.2503
%.tmp2508 = bitcast %m2393$.SYStack.type* %.tmp2507 to i8*
call void(i8*) @free(i8* %.tmp2508)
%.tmp2509 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %out_stack.2404
%.tmp2510 = load %m981$.Node.type*, %m981$.Node.type** %node.2501
%.tmp2511 = call %m2393$.SYStack.type*(%m2393$.SYStack.type*,%m981$.Node.type*) @m2393$stack_push.m2393$.SYStack.typep.m2393$.SYStack.typep.m981$.Node.typep(%m2393$.SYStack.type* %.tmp2509, %m981$.Node.type* %.tmp2510)
store %m2393$.SYStack.type* %.tmp2511, %m2393$.SYStack.type** %out_stack.2404
br label %.for.start.2493
.for.end.2493:
%.tmp2512 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %out_stack.2404
ret %m2393$.SYStack.type* %.tmp2512
}
define %m2393$.SYStack.type* @m2393$stack_push.m2393$.SYStack.typep.m2393$.SYStack.typep.m981$.Node.typep(%m2393$.SYStack.type* %.curr_stack.arg, %m981$.Node.type* %.node.arg) {
%curr_stack = alloca %m2393$.SYStack.type*
store %m2393$.SYStack.type* %.curr_stack.arg, %m2393$.SYStack.type** %curr_stack
%node = alloca %m981$.Node.type*
store %m981$.Node.type* %.node.arg, %m981$.Node.type** %node
%.tmp2513 = load i32, i32* @SYStack_size
%.tmp2514 = call i8*(i32) @malloc(i32 %.tmp2513)
%.tmp2515 = bitcast i8* %.tmp2514 to %m2393$.SYStack.type*
%s.2516 = alloca %m2393$.SYStack.type*
store %m2393$.SYStack.type* %.tmp2515, %m2393$.SYStack.type** %s.2516
%.tmp2517 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %s.2516
%.tmp2518 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp2517, i32 0, i32 0
%.tmp2519 = load %m981$.Node.type*, %m981$.Node.type** %node
store %m981$.Node.type* %.tmp2519, %m981$.Node.type** %.tmp2518
%.tmp2520 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %s.2516
%.tmp2521 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp2520, i32 0, i32 1
%.tmp2522 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %curr_stack
store %m2393$.SYStack.type* %.tmp2522, %m2393$.SYStack.type** %.tmp2521
%.tmp2523 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %s.2516
ret %m2393$.SYStack.type* %.tmp2523
}
define i32 @m2393$op_precedence.i.m981$.Node.typep(%m981$.Node.type* %.n.arg) {
%n = alloca %m981$.Node.type*
store %m981$.Node.type* %.n.arg, %m981$.Node.type** %n
%.tmp2524 = load %m981$.Node.type*, %m981$.Node.type** %n
%.tmp2525 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2524, i32 0, i32 6
%.tmp2526 = load %m981$.Node.type*, %m981$.Node.type** %.tmp2525
%op.2527 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp2526, %m981$.Node.type** %op.2527
%.tmp2528 = load %m981$.Node.type*, %m981$.Node.type** %op.2527
%.tmp2529 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2528, i32 0, i32 1
%.tmp2530 = load i8*, i8** %.tmp2529
%.tmp2532 = getelementptr [2 x i8], [2 x i8]*@.str2531, i32 0, i32 0
%.tmp2533 = call i32(i8*,i8*) @strcmp(i8* %.tmp2530, i8* %.tmp2532)
%.tmp2534 = icmp eq i32 %.tmp2533, 0
%.tmp2535 = load %m981$.Node.type*, %m981$.Node.type** %op.2527
%.tmp2536 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2535, i32 0, i32 1
%.tmp2537 = load i8*, i8** %.tmp2536
%.tmp2539 = getelementptr [2 x i8], [2 x i8]*@.str2538, i32 0, i32 0
%.tmp2540 = call i32(i8*,i8*) @strcmp(i8* %.tmp2537, i8* %.tmp2539)
%.tmp2541 = icmp eq i32 %.tmp2540, 0
%.tmp2542 = or i1 %.tmp2534, %.tmp2541
br i1 %.tmp2542, label %.if.true.2543, label %.if.false.2543
.if.true.2543:
ret i32 4
br label %.if.end.2543
.if.false.2543:
%.tmp2544 = load %m981$.Node.type*, %m981$.Node.type** %op.2527
%.tmp2545 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2544, i32 0, i32 1
%.tmp2546 = load i8*, i8** %.tmp2545
%.tmp2548 = getelementptr [2 x i8], [2 x i8]*@.str2547, i32 0, i32 0
%.tmp2549 = call i32(i8*,i8*) @strcmp(i8* %.tmp2546, i8* %.tmp2548)
%.tmp2550 = icmp eq i32 %.tmp2549, 0
%.tmp2551 = load %m981$.Node.type*, %m981$.Node.type** %op.2527
%.tmp2552 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2551, i32 0, i32 1
%.tmp2553 = load i8*, i8** %.tmp2552
%.tmp2555 = getelementptr [2 x i8], [2 x i8]*@.str2554, i32 0, i32 0
%.tmp2556 = call i32(i8*,i8*) @strcmp(i8* %.tmp2553, i8* %.tmp2555)
%.tmp2557 = icmp eq i32 %.tmp2556, 0
%.tmp2558 = or i1 %.tmp2550, %.tmp2557
%.tmp2559 = load %m981$.Node.type*, %m981$.Node.type** %op.2527
%.tmp2560 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2559, i32 0, i32 1
%.tmp2561 = load i8*, i8** %.tmp2560
%.tmp2563 = getelementptr [2 x i8], [2 x i8]*@.str2562, i32 0, i32 0
%.tmp2564 = call i32(i8*,i8*) @strcmp(i8* %.tmp2561, i8* %.tmp2563)
%.tmp2565 = icmp eq i32 %.tmp2564, 0
%.tmp2566 = or i1 %.tmp2558, %.tmp2565
br i1 %.tmp2566, label %.if.true.2567, label %.if.false.2567
.if.true.2567:
ret i32 3
br label %.if.end.2567
.if.false.2567:
%.tmp2568 = load %m981$.Node.type*, %m981$.Node.type** %op.2527
%.tmp2569 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2568, i32 0, i32 1
%.tmp2570 = load i8*, i8** %.tmp2569
%.tmp2572 = getelementptr [3 x i8], [3 x i8]*@.str2571, i32 0, i32 0
%.tmp2573 = call i32(i8*,i8*) @strcmp(i8* %.tmp2570, i8* %.tmp2572)
%.tmp2574 = icmp eq i32 %.tmp2573, 0
%.tmp2575 = load %m981$.Node.type*, %m981$.Node.type** %op.2527
%.tmp2576 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2575, i32 0, i32 1
%.tmp2577 = load i8*, i8** %.tmp2576
%.tmp2579 = getelementptr [3 x i8], [3 x i8]*@.str2578, i32 0, i32 0
%.tmp2580 = call i32(i8*,i8*) @strcmp(i8* %.tmp2577, i8* %.tmp2579)
%.tmp2581 = icmp eq i32 %.tmp2580, 0
%.tmp2582 = or i1 %.tmp2574, %.tmp2581
br i1 %.tmp2582, label %.if.true.2583, label %.if.false.2583
.if.true.2583:
ret i32 7
br label %.if.end.2583
.if.false.2583:
%.tmp2584 = load %m981$.Node.type*, %m981$.Node.type** %op.2527
%.tmp2585 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2584, i32 0, i32 1
%.tmp2586 = load i8*, i8** %.tmp2585
%.tmp2588 = getelementptr [3 x i8], [3 x i8]*@.str2587, i32 0, i32 0
%.tmp2589 = call i32(i8*,i8*) @strcmp(i8* %.tmp2586, i8* %.tmp2588)
%.tmp2590 = icmp eq i32 %.tmp2589, 0
%.tmp2591 = load %m981$.Node.type*, %m981$.Node.type** %op.2527
%.tmp2592 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2591, i32 0, i32 1
%.tmp2593 = load i8*, i8** %.tmp2592
%.tmp2595 = getelementptr [3 x i8], [3 x i8]*@.str2594, i32 0, i32 0
%.tmp2596 = call i32(i8*,i8*) @strcmp(i8* %.tmp2593, i8* %.tmp2595)
%.tmp2597 = icmp eq i32 %.tmp2596, 0
%.tmp2598 = or i1 %.tmp2590, %.tmp2597
br i1 %.tmp2598, label %.if.true.2599, label %.if.false.2599
.if.true.2599:
ret i32 6
br label %.if.end.2599
.if.false.2599:
%.tmp2600 = load %m981$.Node.type*, %m981$.Node.type** %op.2527
%.tmp2601 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2600, i32 0, i32 1
%.tmp2602 = load i8*, i8** %.tmp2601
%.tmp2604 = getelementptr [2 x i8], [2 x i8]*@.str2603, i32 0, i32 0
%.tmp2605 = call i32(i8*,i8*) @strcmp(i8* %.tmp2602, i8* %.tmp2604)
%.tmp2606 = icmp eq i32 %.tmp2605, 0
%.tmp2607 = load %m981$.Node.type*, %m981$.Node.type** %op.2527
%.tmp2608 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2607, i32 0, i32 1
%.tmp2609 = load i8*, i8** %.tmp2608
%.tmp2611 = getelementptr [2 x i8], [2 x i8]*@.str2610, i32 0, i32 0
%.tmp2612 = call i32(i8*,i8*) @strcmp(i8* %.tmp2609, i8* %.tmp2611)
%.tmp2613 = icmp eq i32 %.tmp2612, 0
%.tmp2614 = or i1 %.tmp2606, %.tmp2613
br i1 %.tmp2614, label %.if.true.2615, label %.if.false.2615
.if.true.2615:
ret i32 6
br label %.if.end.2615
.if.false.2615:
%.tmp2616 = load %m981$.Node.type*, %m981$.Node.type** %op.2527
%.tmp2617 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2616, i32 0, i32 1
%.tmp2618 = load i8*, i8** %.tmp2617
%.tmp2620 = getelementptr [2 x i8], [2 x i8]*@.str2619, i32 0, i32 0
%.tmp2621 = call i32(i8*,i8*) @strcmp(i8* %.tmp2618, i8* %.tmp2620)
%.tmp2622 = icmp eq i32 %.tmp2621, 0
br i1 %.tmp2622, label %.if.true.2623, label %.if.false.2623
.if.true.2623:
ret i32 11
br label %.if.end.2623
.if.false.2623:
%.tmp2624 = load %m981$.Node.type*, %m981$.Node.type** %op.2527
%.tmp2625 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2624, i32 0, i32 1
%.tmp2626 = load i8*, i8** %.tmp2625
%.tmp2628 = getelementptr [2 x i8], [2 x i8]*@.str2627, i32 0, i32 0
%.tmp2629 = call i32(i8*,i8*) @strcmp(i8* %.tmp2626, i8* %.tmp2628)
%.tmp2630 = icmp eq i32 %.tmp2629, 0
br i1 %.tmp2630, label %.if.true.2631, label %.if.false.2631
.if.true.2631:
ret i32 12
br label %.if.end.2631
.if.false.2631:
br label %.if.end.2631
.if.end.2631:
br label %.if.end.2623
.if.end.2623:
br label %.if.end.2615
.if.end.2615:
br label %.if.end.2599
.if.end.2599:
br label %.if.end.2583
.if.end.2583:
br label %.if.end.2567
.if.end.2567:
br label %.if.end.2543
.if.end.2543:
%.tmp2633 = getelementptr [65 x i8], [65 x i8]*@.str2632, i32 0, i32 0
%.tmp2634 = load %m981$.Node.type*, %m981$.Node.type** %op.2527
%.tmp2635 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp2634, i32 0, i32 1
%.tmp2636 = load i8*, i8** %.tmp2635
%.tmp2637 = call i32(i8*,...) @printf(i8* %.tmp2633, i8* %.tmp2636)
ret i32 4
}
%m2638$.Type.type = type {i8*,i8*,i8*,%m2638$.Type.type*,%m2638$.Type.type*}
%m2638$.ErrorList.type = type {%m296$.Error.type*,%m2638$.ErrorList.type*,i1}
%m2638$.AssignableInfo.type = type {i8*,i8,i8*,i8*,%m2638$.Type.type*,i32,i32,i8*}
%m2638$.ScopeItem.type = type {i8*,%m2638$.AssignableInfo.type*,%m2638$.ScopeItem.type*}
%m2638$.Scope.type = type {i8*,%m2638$.ScopeItem.type*,i8*,i8*,i8*,%m2638$.Scope.type*,%m2638$.Type.type*}
%m2638$.GlobalName.type = type {i8*,i8*,i1,i1,%m2638$.AssignableInfo.type*,%m2638$.GlobalName.type*}
%m2638$.ModuleLookup.type = type {i8*,i8*,%m2638$.ModuleLookup.type*,%m2638$.Scope.type*}
%m2638$.AnonFn.type = type {i8*,%m2638$.AnonFn.type*}
%m2638$.CompilerCtx.type = type {%m981$.Node.type*,%m0$.File.type*,%m2638$.ErrorList.type*,%m2638$.GlobalName.type*,%m981$.Rule.type**,i32,%m2638$.ModuleLookup.type*,i8*,%m2638$.AnonFn.type*}
define i8* @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.Type.type* %.type.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%type = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.type.arg, %m2638$.Type.type** %type
%.tmp2640 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2641 = icmp eq %m2638$.Type.type* %.tmp2640, null
br i1 %.tmp2641, label %.if.true.2642, label %.if.false.2642
.if.true.2642:
%.tmp2644 = getelementptr [2 x i8], [2 x i8]*@.str2643, i32 0, i32 0
ret i8* %.tmp2644
br label %.if.end.2642
.if.false.2642:
br label %.if.end.2642
.if.end.2642:
%.tmp2645 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2646 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2645, i32 0, i32 0
%.tmp2647 = load i8*, i8** %.tmp2646
%.tmp2648 = icmp ne i8* %.tmp2647, null
%.tmp2650 = getelementptr [54 x i8], [54 x i8]*@.str2649, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2648, i8* %.tmp2650)
%buf.2651 = alloca i8*
store i8* null, i8** %buf.2651
%.tmp2652 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2653 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2652, i32 0, i32 0
%.tmp2654 = load i8*, i8** %.tmp2653
%.tmp2656 = getelementptr [4 x i8], [4 x i8]*@.str2655, i32 0, i32 0
%.tmp2657 = call i32(i8*,i8*) @strcmp(i8* %.tmp2654, i8* %.tmp2656)
%.tmp2658 = icmp eq i32 %.tmp2657, 0
br i1 %.tmp2658, label %.if.true.2659, label %.if.false.2659
.if.true.2659:
%.tmp2661 = getelementptr [4 x i8], [4 x i8]*@.str2660, i32 0, i32 0
ret i8* %.tmp2661
br label %.if.end.2659
.if.false.2659:
%.tmp2662 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2663 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2662, i32 0, i32 0
%.tmp2664 = load i8*, i8** %.tmp2663
%.tmp2666 = getelementptr [5 x i8], [5 x i8]*@.str2665, i32 0, i32 0
%.tmp2667 = call i32(i8*,i8*) @strcmp(i8* %.tmp2664, i8* %.tmp2666)
%.tmp2668 = icmp eq i32 %.tmp2667, 0
br i1 %.tmp2668, label %.if.true.2669, label %.if.false.2669
.if.true.2669:
%.tmp2671 = getelementptr [5 x i8], [5 x i8]*@.str2670, i32 0, i32 0
ret i8* %.tmp2671
br label %.if.end.2669
.if.false.2669:
%.tmp2672 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2673 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2672, i32 0, i32 0
%.tmp2674 = load i8*, i8** %.tmp2673
%.tmp2676 = getelementptr [5 x i8], [5 x i8]*@.str2675, i32 0, i32 0
%.tmp2677 = call i32(i8*,i8*) @strcmp(i8* %.tmp2674, i8* %.tmp2676)
%.tmp2678 = icmp eq i32 %.tmp2677, 0
br i1 %.tmp2678, label %.if.true.2679, label %.if.false.2679
.if.true.2679:
%.tmp2681 = getelementptr [3 x i8], [3 x i8]*@.str2680, i32 0, i32 0
ret i8* %.tmp2681
br label %.if.end.2679
.if.false.2679:
%.tmp2682 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2683 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2682, i32 0, i32 0
%.tmp2684 = load i8*, i8** %.tmp2683
%.tmp2686 = getelementptr [8 x i8], [8 x i8]*@.str2685, i32 0, i32 0
%.tmp2687 = call i32(i8*,i8*) @strcmp(i8* %.tmp2684, i8* %.tmp2686)
%.tmp2688 = icmp eq i32 %.tmp2687, 0
br i1 %.tmp2688, label %.if.true.2689, label %.if.false.2689
.if.true.2689:
%.tmp2691 = getelementptr [4 x i8], [4 x i8]*@.str2690, i32 0, i32 0
ret i8* %.tmp2691
br label %.if.end.2689
.if.false.2689:
%.tmp2692 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2693 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2692, i32 0, i32 0
%.tmp2694 = load i8*, i8** %.tmp2693
%.tmp2696 = getelementptr [4 x i8], [4 x i8]*@.str2695, i32 0, i32 0
%.tmp2697 = call i32(i8*,i8*) @strcmp(i8* %.tmp2694, i8* %.tmp2696)
%.tmp2698 = icmp eq i32 %.tmp2697, 0
br i1 %.tmp2698, label %.if.true.2699, label %.if.false.2699
.if.true.2699:
%.tmp2701 = getelementptr [3 x i8], [3 x i8]*@.str2700, i32 0, i32 0
ret i8* %.tmp2701
br label %.if.end.2699
.if.false.2699:
%.tmp2702 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2703 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2702, i32 0, i32 0
%.tmp2704 = load i8*, i8** %.tmp2703
%.tmp2706 = getelementptr [9 x i8], [9 x i8]*@.str2705, i32 0, i32 0
%.tmp2707 = call i32(i8*,i8*) @strcmp(i8* %.tmp2704, i8* %.tmp2706)
%.tmp2708 = icmp eq i32 %.tmp2707, 0
br i1 %.tmp2708, label %.if.true.2709, label %.if.false.2709
.if.true.2709:
%.tmp2710 = getelementptr i8*, i8** %buf.2651, i32 0
%.tmp2712 = getelementptr [4 x i8], [4 x i8]*@.str2711, i32 0, i32 0
%.tmp2713 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp2714 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2715 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2714, i32 0, i32 3
%.tmp2716 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2715
%.tmp2717 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp2713, %m2638$.Type.type* %.tmp2716)
%.tmp2718 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2710, i8* %.tmp2712, i8* %.tmp2717)
%.tmp2720 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2721 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2720, i32 0, i32 3
%.tmp2722 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2721
%.tmp2723 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2722, i32 0, i32 4
%.tmp2724 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2723
%p.2725 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp2724, %m2638$.Type.type** %p.2725
br label %.for.start.2719
.for.start.2719:
%.tmp2726 = load %m2638$.Type.type*, %m2638$.Type.type** %p.2725
%.tmp2727 = icmp ne %m2638$.Type.type* %.tmp2726, null
br i1 %.tmp2727, label %.for.continue.2719, label %.for.end.2719
.for.continue.2719:
%.tmp2728 = load %m2638$.Type.type*, %m2638$.Type.type** %p.2725
%.tmp2729 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2730 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2729, i32 0, i32 3
%.tmp2731 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2730
%.tmp2732 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2731, i32 0, i32 4
%.tmp2733 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2732
%.tmp2734 = icmp ne %m2638$.Type.type* %.tmp2728, %.tmp2733
br i1 %.tmp2734, label %.if.true.2735, label %.if.false.2735
.if.true.2735:
%.tmp2736 = getelementptr i8*, i8** %buf.2651, i32 0
%.tmp2738 = getelementptr [4 x i8], [4 x i8]*@.str2737, i32 0, i32 0
%.tmp2739 = load i8*, i8** %buf.2651
%.tmp2740 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2736, i8* %.tmp2738, i8* %.tmp2739)
br label %.if.end.2735
.if.false.2735:
br label %.if.end.2735
.if.end.2735:
%.tmp2741 = getelementptr i8*, i8** %buf.2651, i32 0
%.tmp2743 = getelementptr [5 x i8], [5 x i8]*@.str2742, i32 0, i32 0
%.tmp2744 = load i8*, i8** %buf.2651
%.tmp2745 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp2746 = load %m2638$.Type.type*, %m2638$.Type.type** %p.2725
%.tmp2747 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp2745, %m2638$.Type.type* %.tmp2746)
%.tmp2748 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2741, i8* %.tmp2743, i8* %.tmp2744, i8* %.tmp2747)
%.tmp2749 = load %m2638$.Type.type*, %m2638$.Type.type** %p.2725
%.tmp2750 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2749, i32 0, i32 4
%.tmp2751 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2750
store %m2638$.Type.type* %.tmp2751, %m2638$.Type.type** %p.2725
br label %.for.start.2719
.for.end.2719:
%.tmp2752 = getelementptr i8*, i8** %buf.2651, i32 0
%.tmp2754 = getelementptr [4 x i8], [4 x i8]*@.str2753, i32 0, i32 0
%.tmp2755 = load i8*, i8** %buf.2651
%.tmp2756 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2752, i8* %.tmp2754, i8* %.tmp2755)
%.tmp2757 = load i8*, i8** %buf.2651
ret i8* %.tmp2757
br label %.if.end.2709
.if.false.2709:
%.tmp2758 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2759 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2758, i32 0, i32 0
%.tmp2760 = load i8*, i8** %.tmp2759
%.tmp2762 = getelementptr [4 x i8], [4 x i8]*@.str2761, i32 0, i32 0
%.tmp2763 = call i32(i8*,i8*) @strcmp(i8* %.tmp2760, i8* %.tmp2762)
%.tmp2764 = icmp eq i32 %.tmp2763, 0
br i1 %.tmp2764, label %.if.true.2765, label %.if.false.2765
.if.true.2765:
%.tmp2766 = getelementptr i8*, i8** %buf.2651, i32 0
%.tmp2768 = getelementptr [4 x i8], [4 x i8]*@.str2767, i32 0, i32 0
%.tmp2769 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp2770 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2771 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2770, i32 0, i32 3
%.tmp2772 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2771
%.tmp2773 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp2769, %m2638$.Type.type* %.tmp2772)
%.tmp2774 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2766, i8* %.tmp2768, i8* %.tmp2773)
%.tmp2775 = load i8*, i8** %buf.2651
ret i8* %.tmp2775
br label %.if.end.2765
.if.false.2765:
%.tmp2776 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2777 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2776, i32 0, i32 0
%.tmp2778 = load i8*, i8** %.tmp2777
%.tmp2780 = getelementptr [7 x i8], [7 x i8]*@.str2779, i32 0, i32 0
%.tmp2781 = call i32(i8*,i8*) @strcmp(i8* %.tmp2778, i8* %.tmp2780)
%.tmp2782 = icmp eq i32 %.tmp2781, 0
br i1 %.tmp2782, label %.if.true.2783, label %.if.false.2783
.if.true.2783:
%.tmp2784 = getelementptr i8*, i8** %buf.2651, i32 0
%.tmp2786 = getelementptr [2 x i8], [2 x i8]*@.str2785, i32 0, i32 0
%.tmp2787 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2784, i8* %.tmp2786)
%.tmp2789 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2790 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2789, i32 0, i32 3
%.tmp2791 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2790
%t.2792 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp2791, %m2638$.Type.type** %t.2792
br label %.for.start.2788
.for.start.2788:
%.tmp2793 = load %m2638$.Type.type*, %m2638$.Type.type** %t.2792
%.tmp2794 = icmp ne %m2638$.Type.type* %.tmp2793, null
br i1 %.tmp2794, label %.for.continue.2788, label %.for.end.2788
.for.continue.2788:
%.tmp2795 = load %m2638$.Type.type*, %m2638$.Type.type** %t.2792
%.tmp2796 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2797 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2796, i32 0, i32 3
%.tmp2798 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2797
%.tmp2799 = icmp ne %m2638$.Type.type* %.tmp2795, %.tmp2798
br i1 %.tmp2799, label %.if.true.2800, label %.if.false.2800
.if.true.2800:
%.tmp2801 = getelementptr i8*, i8** %buf.2651, i32 0
%.tmp2803 = getelementptr [4 x i8], [4 x i8]*@.str2802, i32 0, i32 0
%.tmp2804 = load i8*, i8** %buf.2651
%.tmp2805 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2801, i8* %.tmp2803, i8* %.tmp2804)
br label %.if.end.2800
.if.false.2800:
br label %.if.end.2800
.if.end.2800:
%.tmp2806 = getelementptr i8*, i8** %buf.2651, i32 0
%.tmp2808 = getelementptr [5 x i8], [5 x i8]*@.str2807, i32 0, i32 0
%.tmp2809 = load i8*, i8** %buf.2651
%.tmp2810 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp2811 = load %m2638$.Type.type*, %m2638$.Type.type** %t.2792
%.tmp2812 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp2810, %m2638$.Type.type* %.tmp2811)
%.tmp2813 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2806, i8* %.tmp2808, i8* %.tmp2809, i8* %.tmp2812)
%.tmp2814 = load %m2638$.Type.type*, %m2638$.Type.type** %t.2792
%.tmp2815 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2814, i32 0, i32 4
%.tmp2816 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2815
store %m2638$.Type.type* %.tmp2816, %m2638$.Type.type** %t.2792
br label %.for.start.2788
.for.end.2788:
%.tmp2817 = getelementptr i8*, i8** %buf.2651, i32 0
%.tmp2819 = getelementptr [4 x i8], [4 x i8]*@.str2818, i32 0, i32 0
%.tmp2820 = load i8*, i8** %buf.2651
%.tmp2821 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2817, i8* %.tmp2819, i8* %.tmp2820)
%.tmp2822 = load i8*, i8** %buf.2651
ret i8* %.tmp2822
br label %.if.end.2783
.if.false.2783:
%.tmp2823 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2824 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2823, i32 0, i32 0
%.tmp2825 = load i8*, i8** %.tmp2824
%.tmp2827 = getelementptr [6 x i8], [6 x i8]*@.str2826, i32 0, i32 0
%.tmp2828 = call i32(i8*,i8*) @strcmp(i8* %.tmp2825, i8* %.tmp2827)
%.tmp2829 = icmp eq i32 %.tmp2828, 0
br i1 %.tmp2829, label %.if.true.2830, label %.if.false.2830
.if.true.2830:
%.tmp2831 = getelementptr i8*, i8** %buf.2651, i32 0
%.tmp2833 = getelementptr [10 x i8], [10 x i8]*@.str2832, i32 0, i32 0
%.tmp2834 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2835 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2834, i32 0, i32 3
%.tmp2836 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2835
%.tmp2837 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2836, i32 0, i32 4
%.tmp2838 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2837
%.tmp2839 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2838, i32 0, i32 0
%.tmp2840 = load i8*, i8** %.tmp2839
%.tmp2841 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp2842 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2843 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2842, i32 0, i32 3
%.tmp2844 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2843
%.tmp2845 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp2841, %m2638$.Type.type* %.tmp2844)
%.tmp2846 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2831, i8* %.tmp2833, i8* %.tmp2840, i8* %.tmp2845)
%.tmp2847 = load i8*, i8** %buf.2651
ret i8* %.tmp2847
br label %.if.end.2830
.if.false.2830:
%.tmp2848 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2849 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2848, i32 0, i32 0
%.tmp2850 = load i8*, i8** %.tmp2849
%.tmp2852 = getelementptr [10 x i8], [10 x i8]*@.str2851, i32 0, i32 0
%.tmp2853 = call i32(i8*,i8*) @strcmp(i8* %.tmp2850, i8* %.tmp2852)
%.tmp2854 = icmp eq i32 %.tmp2853, 0
br i1 %.tmp2854, label %.if.true.2855, label %.if.false.2855
.if.true.2855:
%.tmp2856 = getelementptr i8*, i8** %buf.2651, i32 0
%.tmp2858 = getelementptr [5 x i8], [5 x i8]*@.str2857, i32 0, i32 0
%.tmp2859 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2860 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2859, i32 0, i32 2
%.tmp2861 = load i8*, i8** %.tmp2860
%.tmp2862 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2856, i8* %.tmp2858, i8* %.tmp2861)
%.tmp2863 = load i8*, i8** %buf.2651
ret i8* %.tmp2863
br label %.if.end.2855
.if.false.2855:
%.tmp2864 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2865 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2864, i32 0, i32 0
%.tmp2866 = load i8*, i8** %.tmp2865
%.tmp2868 = getelementptr [7 x i8], [7 x i8]*@.str2867, i32 0, i32 0
%.tmp2869 = call i32(i8*,i8*) @strcmp(i8* %.tmp2866, i8* %.tmp2868)
%.tmp2870 = icmp eq i32 %.tmp2869, 0
br i1 %.tmp2870, label %.if.true.2871, label %.if.false.2871
.if.true.2871:
%.tmp2873 = getelementptr [4 x i8], [4 x i8]*@.str2872, i32 0, i32 0
ret i8* %.tmp2873
br label %.if.end.2871
.if.false.2871:
%.tmp2874 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2875 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2874, i32 0, i32 0
%.tmp2876 = load i8*, i8** %.tmp2875
%.tmp2878 = getelementptr [6 x i8], [6 x i8]*@.str2877, i32 0, i32 0
%.tmp2879 = call i32(i8*,i8*) @strcmp(i8* %.tmp2876, i8* %.tmp2878)
%.tmp2880 = icmp eq i32 %.tmp2879, 0
br i1 %.tmp2880, label %.if.true.2881, label %.if.false.2881
.if.true.2881:
br label %.if.end.2881
.if.false.2881:
%.tmp2883 = getelementptr [53 x i8], [53 x i8]*@.str2882, i32 0, i32 0
%.tmp2884 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp2885 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2884, i32 0, i32 0
%.tmp2886 = load i8*, i8** %.tmp2885
%.tmp2887 = call i32(i8*,...) @printf(i8* %.tmp2883, i8* %.tmp2886)
br label %.if.end.2881
.if.end.2881:
br label %.if.end.2871
.if.end.2871:
br label %.if.end.2855
.if.end.2855:
br label %.if.end.2830
.if.end.2830:
br label %.if.end.2783
.if.end.2783:
br label %.if.end.2765
.if.end.2765:
br label %.if.end.2709
.if.end.2709:
br label %.if.end.2699
.if.end.2699:
br label %.if.end.2689
.if.end.2689:
br label %.if.end.2679
.if.end.2679:
br label %.if.end.2669
.if.end.2669:
br label %.if.end.2659
.if.end.2659:
%.tmp2888 = bitcast ptr null to i8*
ret i8* %.tmp2888
}
define i1 @m2639$cmp.b.m2638$.CompilerCtx.typep.m2638$.Type.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.Type.type* %.a.arg, %m2638$.Type.type* %.b.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%a = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.a.arg, %m2638$.Type.type** %a
%b = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.b.arg, %m2638$.Type.type** %b
%.tmp2889 = load %m2638$.Type.type*, %m2638$.Type.type** %a
%.tmp2890 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2889, i32 0, i32 0
%.tmp2891 = load i8*, i8** %.tmp2890
%.tmp2893 = getelementptr [8 x i8], [8 x i8]*@.str2892, i32 0, i32 0
%.tmp2894 = call i32(i8*,i8*) @strcmp(i8* %.tmp2891, i8* %.tmp2893)
%.tmp2895 = icmp eq i32 %.tmp2894, 0
%.tmp2896 = load %m2638$.Type.type*, %m2638$.Type.type** %b
%.tmp2897 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2896, i32 0, i32 0
%.tmp2898 = load i8*, i8** %.tmp2897
%.tmp2900 = getelementptr [8 x i8], [8 x i8]*@.str2899, i32 0, i32 0
%.tmp2901 = call i32(i8*,i8*) @strcmp(i8* %.tmp2898, i8* %.tmp2900)
%.tmp2902 = icmp eq i32 %.tmp2901, 0
%.tmp2903 = or i1 %.tmp2895, %.tmp2902
br i1 %.tmp2903, label %.if.true.2904, label %.if.false.2904
.if.true.2904:
%.tmp2905 = load %m2638$.Type.type*, %m2638$.Type.type** %a
%.tmp2906 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2905, i32 0, i32 0
%.tmp2907 = load i8*, i8** %.tmp2906
%.tmp2909 = getelementptr [4 x i8], [4 x i8]*@.str2908, i32 0, i32 0
%.tmp2910 = call i32(i8*,i8*) @strcmp(i8* %.tmp2907, i8* %.tmp2909)
%.tmp2911 = icmp eq i32 %.tmp2910, 0
%.tmp2912 = load %m2638$.Type.type*, %m2638$.Type.type** %b
%.tmp2913 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2912, i32 0, i32 0
%.tmp2914 = load i8*, i8** %.tmp2913
%.tmp2916 = getelementptr [4 x i8], [4 x i8]*@.str2915, i32 0, i32 0
%.tmp2917 = call i32(i8*,i8*) @strcmp(i8* %.tmp2914, i8* %.tmp2916)
%.tmp2918 = icmp eq i32 %.tmp2917, 0
%.tmp2919 = or i1 %.tmp2911, %.tmp2918
ret i1 %.tmp2919
br label %.if.end.2904
.if.false.2904:
br label %.if.end.2904
.if.end.2904:
%.tmp2920 = load %m2638$.Type.type*, %m2638$.Type.type** %a
%.tmp2921 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2920, i32 0, i32 0
%.tmp2922 = load i8*, i8** %.tmp2921
%.tmp2924 = getelementptr [10 x i8], [10 x i8]*@.str2923, i32 0, i32 0
%.tmp2925 = call i32(i8*,i8*) @strcmp(i8* %.tmp2922, i8* %.tmp2924)
%.tmp2926 = icmp eq i32 %.tmp2925, 0
br i1 %.tmp2926, label %.if.true.2927, label %.if.false.2927
.if.true.2927:
%.tmp2928 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp2929 = load %m2638$.Type.type*, %m2638$.Type.type** %a
%.tmp2930 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2929, i32 0, i32 3
%.tmp2931 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2930
%.tmp2932 = load %m2638$.Type.type*, %m2638$.Type.type** %b
%.tmp2933 = call i1(%m2638$.CompilerCtx.type*,%m2638$.Type.type*,%m2638$.Type.type*) @m2639$cmp.b.m2638$.CompilerCtx.typep.m2638$.Type.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp2928, %m2638$.Type.type* %.tmp2931, %m2638$.Type.type* %.tmp2932)
ret i1 %.tmp2933
br label %.if.end.2927
.if.false.2927:
br label %.if.end.2927
.if.end.2927:
%.tmp2934 = load %m2638$.Type.type*, %m2638$.Type.type** %b
%.tmp2935 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2934, i32 0, i32 0
%.tmp2936 = load i8*, i8** %.tmp2935
%.tmp2938 = getelementptr [10 x i8], [10 x i8]*@.str2937, i32 0, i32 0
%.tmp2939 = call i32(i8*,i8*) @strcmp(i8* %.tmp2936, i8* %.tmp2938)
%.tmp2940 = icmp eq i32 %.tmp2939, 0
br i1 %.tmp2940, label %.if.true.2941, label %.if.false.2941
.if.true.2941:
%.tmp2942 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp2943 = load %m2638$.Type.type*, %m2638$.Type.type** %a
%.tmp2944 = load %m2638$.Type.type*, %m2638$.Type.type** %b
%.tmp2945 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2944, i32 0, i32 3
%.tmp2946 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2945
%.tmp2947 = call i1(%m2638$.CompilerCtx.type*,%m2638$.Type.type*,%m2638$.Type.type*) @m2639$cmp.b.m2638$.CompilerCtx.typep.m2638$.Type.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp2942, %m2638$.Type.type* %.tmp2943, %m2638$.Type.type* %.tmp2946)
ret i1 %.tmp2947
br label %.if.end.2941
.if.false.2941:
br label %.if.end.2941
.if.end.2941:
%.tmp2948 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp2949 = load %m2638$.Type.type*, %m2638$.Type.type** %a
%.tmp2950 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp2948, %m2638$.Type.type* %.tmp2949)
%a_repr.2951 = alloca i8*
store i8* %.tmp2950, i8** %a_repr.2951
%.tmp2952 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp2953 = load %m2638$.Type.type*, %m2638$.Type.type** %b
%.tmp2954 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp2952, %m2638$.Type.type* %.tmp2953)
%b_repr.2955 = alloca i8*
store i8* %.tmp2954, i8** %b_repr.2955
%.tmp2956 = load i8*, i8** %a_repr.2951
%.tmp2957 = load i8*, i8** %b_repr.2955
%.tmp2958 = call i32(i8*,i8*) @strcmp(i8* %.tmp2956, i8* %.tmp2957)
%.tmp2959 = icmp eq i32 %.tmp2958, 0
ret i1 %.tmp2959
}
@DEBUG_INTERNALS = constant i1 0
define %m2638$.Type.type* @m295$type_clone.m2638$.Type.typep.m2638$.Type.typep(%m2638$.Type.type* %.t.arg) {
%t = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.t.arg, %m2638$.Type.type** %t
%.tmp2960 = load %m2638$.Type.type*, %m2638$.Type.type** %t
%.tmp2961 = icmp eq %m2638$.Type.type* %.tmp2960, null
br i1 %.tmp2961, label %.if.true.2962, label %.if.false.2962
.if.true.2962:
%.tmp2963 = bitcast ptr null to %m2638$.Type.type*
ret %m2638$.Type.type* %.tmp2963
br label %.if.end.2962
.if.false.2962:
br label %.if.end.2962
.if.end.2962:
%.tmp2964 = getelementptr %m2638$.Type.type, %m2638$.Type.type* null, i32 1
%.tmp2965 = ptrtoint %m2638$.Type.type* %.tmp2964 to i32
%.tmp2966 = call i8*(i32) @malloc(i32 %.tmp2965)
%.tmp2967 = bitcast i8* %.tmp2966 to %m2638$.Type.type*
%clone.2968 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp2967, %m2638$.Type.type** %clone.2968
%.tmp2969 = load %m2638$.Type.type*, %m2638$.Type.type** %clone.2968
%.tmp2970 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2969, i32 0, i32 3
%.tmp2971 = load %m2638$.Type.type*, %m2638$.Type.type** %t
%.tmp2972 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2971, i32 0, i32 3
%.tmp2973 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2972
store %m2638$.Type.type* %.tmp2973, %m2638$.Type.type** %.tmp2970
%.tmp2974 = load %m2638$.Type.type*, %m2638$.Type.type** %clone.2968
%.tmp2975 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2974, i32 0, i32 4
%.tmp2976 = load %m2638$.Type.type*, %m2638$.Type.type** %t
%.tmp2977 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2976, i32 0, i32 4
%.tmp2978 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp2977
%.tmp2979 = call %m2638$.Type.type*(%m2638$.Type.type*) @m295$type_clone.m2638$.Type.typep.m2638$.Type.typep(%m2638$.Type.type* %.tmp2978)
store %m2638$.Type.type* %.tmp2979, %m2638$.Type.type** %.tmp2975
%.tmp2980 = load %m2638$.Type.type*, %m2638$.Type.type** %clone.2968
%.tmp2981 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2980, i32 0, i32 2
%.tmp2982 = load %m2638$.Type.type*, %m2638$.Type.type** %t
%.tmp2983 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2982, i32 0, i32 2
%.tmp2984 = load i8*, i8** %.tmp2983
store i8* %.tmp2984, i8** %.tmp2981
%.tmp2985 = load %m2638$.Type.type*, %m2638$.Type.type** %clone.2968
%.tmp2986 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2985, i32 0, i32 0
%.tmp2987 = load %m2638$.Type.type*, %m2638$.Type.type** %t
%.tmp2988 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2987, i32 0, i32 0
%.tmp2989 = load i8*, i8** %.tmp2988
store i8* %.tmp2989, i8** %.tmp2986
%.tmp2990 = load %m2638$.Type.type*, %m2638$.Type.type** %clone.2968
%.tmp2991 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2990, i32 0, i32 1
%.tmp2992 = load %m2638$.Type.type*, %m2638$.Type.type** %t
%.tmp2993 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp2992, i32 0, i32 1
%.tmp2994 = load i8*, i8** %.tmp2993
store i8* %.tmp2994, i8** %.tmp2991
%.tmp2995 = load %m2638$.Type.type*, %m2638$.Type.type** %clone.2968
ret %m2638$.Type.type* %.tmp2995
}
define i8* @m295$get_root.cp() {
%.tmp2997 = getelementptr [12 x i8], [12 x i8]*@.str2996, i32 0, i32 0
%.tmp2998 = call i8*(i8*) @getenv(i8* %.tmp2997)
%project_root.2999 = alloca i8*
store i8* %.tmp2998, i8** %project_root.2999
%.tmp3000 = load i8*, i8** %project_root.2999
%.tmp3001 = icmp eq i8* %.tmp3000, null
br i1 %.tmp3001, label %.if.true.3002, label %.if.false.3002
.if.true.3002:
%.tmp3004 = getelementptr [5 x i8], [5 x i8]*@.str3003, i32 0, i32 0
%.tmp3005 = call i8*(i8*) @getenv(i8* %.tmp3004)
%home.3006 = alloca i8*
store i8* %.tmp3005, i8** %home.3006
%.tmp3007 = getelementptr i8*, i8** %project_root.2999, i32 0
%.tmp3009 = getelementptr [11 x i8], [11 x i8]*@.str3008, i32 0, i32 0
%.tmp3010 = load i8*, i8** %home.3006
%.tmp3011 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3007, i8* %.tmp3009, i8* %.tmp3010)
br label %.if.end.3002
.if.false.3002:
br label %.if.end.3002
.if.end.3002:
%.tmp3012 = load i8*, i8** %project_root.2999
ret i8* %.tmp3012
}
define %m2638$.Type.type* @m295$new_type.m2638$.Type.typep() {
%.tmp3013 = getelementptr %m2638$.Type.type, %m2638$.Type.type* null, i32 1
%.tmp3014 = ptrtoint %m2638$.Type.type* %.tmp3013 to i32
%.tmp3015 = call i8*(i32) @malloc(i32 %.tmp3014)
%.tmp3016 = bitcast i8* %.tmp3015 to %m2638$.Type.type*
%type.3017 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp3016, %m2638$.Type.type** %type.3017
%.tmp3018 = load %m2638$.Type.type*, %m2638$.Type.type** %type.3017
%.tmp3019 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3018, i32 0, i32 1
store i8* null, i8** %.tmp3019
%.tmp3020 = load %m2638$.Type.type*, %m2638$.Type.type** %type.3017
%.tmp3021 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3020, i32 0, i32 2
store i8* null, i8** %.tmp3021
%.tmp3022 = load %m2638$.Type.type*, %m2638$.Type.type** %type.3017
%.tmp3023 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3022, i32 0, i32 0
store i8* null, i8** %.tmp3023
%.tmp3024 = load %m2638$.Type.type*, %m2638$.Type.type** %type.3017
%.tmp3025 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3024, i32 0, i32 3
store %m2638$.Type.type* null, %m2638$.Type.type** %.tmp3025
%.tmp3026 = load %m2638$.Type.type*, %m2638$.Type.type** %type.3017
%.tmp3027 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3026, i32 0, i32 4
store %m2638$.Type.type* null, %m2638$.Type.type** %.tmp3027
%.tmp3028 = load %m2638$.Type.type*, %m2638$.Type.type** %type.3017
ret %m2638$.Type.type* %.tmp3028
}
define void @m295$copy_type.v.m2638$.Type.typep.m2638$.Type.typep(%m2638$.Type.type* %.dest.arg, %m2638$.Type.type* %.src.arg) {
%dest = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.dest.arg, %m2638$.Type.type** %dest
%src = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.src.arg, %m2638$.Type.type** %src
%.tmp3029 = load %m2638$.Type.type*, %m2638$.Type.type** %dest
%.tmp3030 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3029, i32 0, i32 0
%.tmp3031 = load %m2638$.Type.type*, %m2638$.Type.type** %src
%.tmp3032 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3031, i32 0, i32 0
%.tmp3033 = load i8*, i8** %.tmp3032
store i8* %.tmp3033, i8** %.tmp3030
%.tmp3034 = load %m2638$.Type.type*, %m2638$.Type.type** %dest
%.tmp3035 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3034, i32 0, i32 1
%.tmp3036 = load %m2638$.Type.type*, %m2638$.Type.type** %src
%.tmp3037 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3036, i32 0, i32 1
%.tmp3038 = load i8*, i8** %.tmp3037
store i8* %.tmp3038, i8** %.tmp3035
%.tmp3039 = load %m2638$.Type.type*, %m2638$.Type.type** %dest
%.tmp3040 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3039, i32 0, i32 2
%.tmp3041 = load %m2638$.Type.type*, %m2638$.Type.type** %src
%.tmp3042 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3041, i32 0, i32 2
%.tmp3043 = load i8*, i8** %.tmp3042
store i8* %.tmp3043, i8** %.tmp3040
%.tmp3044 = load %m2638$.Type.type*, %m2638$.Type.type** %dest
%.tmp3045 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3044, i32 0, i32 3
%.tmp3046 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3045
%.tmp3047 = load %m2638$.Type.type*, %m2638$.Type.type** %src
%.tmp3048 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3047, i32 0, i32 3
%.tmp3049 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3048
%.tmp3050 = icmp ne %m2638$.Type.type* %.tmp3046, %.tmp3049
br i1 %.tmp3050, label %.if.true.3051, label %.if.false.3051
.if.true.3051:
%.tmp3052 = load %m2638$.Type.type*, %m2638$.Type.type** %dest
%.tmp3053 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3052, i32 0, i32 3
%.tmp3054 = load %m2638$.Type.type*, %m2638$.Type.type** %src
%.tmp3055 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3054, i32 0, i32 3
%.tmp3056 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3055
store %m2638$.Type.type* %.tmp3056, %m2638$.Type.type** %.tmp3053
%.tmp3057 = load %m2638$.Type.type*, %m2638$.Type.type** %dest
%.tmp3058 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3057, i32 0, i32 3
%.tmp3059 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3058
%.tmp3060 = load %m2638$.Type.type*, %m2638$.Type.type** %src
%.tmp3061 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3060, i32 0, i32 3
%.tmp3062 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3061
call void(%m2638$.Type.type*,%m2638$.Type.type*) @m295$copy_type.v.m2638$.Type.typep.m2638$.Type.typep(%m2638$.Type.type* %.tmp3059, %m2638$.Type.type* %.tmp3062)
br label %.if.end.3051
.if.false.3051:
br label %.if.end.3051
.if.end.3051:
%.tmp3063 = load %m2638$.Type.type*, %m2638$.Type.type** %dest
%.tmp3064 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3063, i32 0, i32 4
%.tmp3065 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3064
%.tmp3066 = load %m2638$.Type.type*, %m2638$.Type.type** %src
%.tmp3067 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3066, i32 0, i32 4
%.tmp3068 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3067
%.tmp3069 = icmp ne %m2638$.Type.type* %.tmp3065, %.tmp3068
br i1 %.tmp3069, label %.if.true.3070, label %.if.false.3070
.if.true.3070:
%.tmp3071 = load %m2638$.Type.type*, %m2638$.Type.type** %dest
%.tmp3072 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3071, i32 0, i32 4
%.tmp3073 = load %m2638$.Type.type*, %m2638$.Type.type** %src
%.tmp3074 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3073, i32 0, i32 4
%.tmp3075 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3074
store %m2638$.Type.type* %.tmp3075, %m2638$.Type.type** %.tmp3072
%.tmp3076 = load %m2638$.Type.type*, %m2638$.Type.type** %dest
%.tmp3077 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3076, i32 0, i32 4
%.tmp3078 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3077
%.tmp3079 = load %m2638$.Type.type*, %m2638$.Type.type** %src
%.tmp3080 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3079, i32 0, i32 4
%.tmp3081 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3080
call void(%m2638$.Type.type*,%m2638$.Type.type*) @m295$copy_type.v.m2638$.Type.typep.m2638$.Type.typep(%m2638$.Type.type* %.tmp3078, %m2638$.Type.type* %.tmp3081)
br label %.if.end.3070
.if.false.3070:
br label %.if.end.3070
.if.end.3070:
ret void
}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m2638$.AssignableInfo.type* @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.node.arg) {
%node = alloca %m981$.Node.type*
store %m981$.Node.type* %.node.arg, %m981$.Node.type** %node
%.tmp3082 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* null, i32 1
%.tmp3083 = ptrtoint %m2638$.AssignableInfo.type* %.tmp3082 to i32
%.tmp3084 = call i8*(i32) @malloc(i32 %.tmp3083)
%.tmp3085 = bitcast i8* %.tmp3084 to %m2638$.AssignableInfo.type*
%ptr.3086 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp3085, %m2638$.AssignableInfo.type** %ptr.3086
%.tmp3087 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %ptr.3086
%.tmp3088 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3087, i32 0, i32 1
%.tmp3089 = load i8, i8* @SCOPE_CONST
store i8 %.tmp3089, i8* %.tmp3088
%.tmp3090 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %ptr.3086
%.tmp3091 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3090, i32 0, i32 0
store i8* null, i8** %.tmp3091
%.tmp3092 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %ptr.3086
%.tmp3093 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3092, i32 0, i32 3
store i8* null, i8** %.tmp3093
%.tmp3094 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %ptr.3086
%.tmp3095 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3094, i32 0, i32 2
%.tmp3097 = getelementptr [1 x i8], [1 x i8]*@.str3096, i32 0, i32 0
store i8* %.tmp3097, i8** %.tmp3095
%.tmp3098 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %ptr.3086
%.tmp3099 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3098, i32 0, i32 4
store %m2638$.Type.type* null, %m2638$.Type.type** %.tmp3099
%.tmp3100 = load %m981$.Node.type*, %m981$.Node.type** %node
%.tmp3101 = icmp ne %m981$.Node.type* %.tmp3100, null
br i1 %.tmp3101, label %.if.true.3102, label %.if.false.3102
.if.true.3102:
%.tmp3103 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %ptr.3086
%.tmp3104 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3103, i32 0, i32 5
%.tmp3105 = load %m981$.Node.type*, %m981$.Node.type** %node
%.tmp3106 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3105, i32 0, i32 3
%.tmp3107 = load i32, i32* %.tmp3106
store i32 %.tmp3107, i32* %.tmp3104
%.tmp3108 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %ptr.3086
%.tmp3109 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3108, i32 0, i32 6
%.tmp3110 = load %m981$.Node.type*, %m981$.Node.type** %node
%.tmp3111 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3110, i32 0, i32 4
%.tmp3112 = load i32, i32* %.tmp3111
store i32 %.tmp3112, i32* %.tmp3109
%.tmp3113 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %ptr.3086
%.tmp3114 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3113, i32 0, i32 7
%.tmp3115 = load %m981$.Node.type*, %m981$.Node.type** %node
%.tmp3116 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3115, i32 0, i32 2
%.tmp3117 = load i8*, i8** %.tmp3116
store i8* %.tmp3117, i8** %.tmp3114
br label %.if.end.3102
.if.false.3102:
%.tmp3118 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %ptr.3086
%.tmp3119 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3118, i32 0, i32 5
store i32 0, i32* %.tmp3119
%.tmp3120 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %ptr.3086
%.tmp3121 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3120, i32 0, i32 6
store i32 0, i32* %.tmp3121
%.tmp3122 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %ptr.3086
%.tmp3123 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3122, i32 0, i32 7
store i8* null, i8** %.tmp3123
br label %.if.end.3102
.if.end.3102:
%.tmp3124 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %ptr.3086
ret %m2638$.AssignableInfo.type* %.tmp3124
}
define void @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.info.arg, %m2638$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp3125 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp3126 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3125, i32 0, i32 0
%.tmp3127 = load i8*, i8** %id
store i8* %.tmp3127, i8** %.tmp3126
%.tmp3128 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp3129 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3128, i32 0, i32 1
%.tmp3130 = load i8, i8* %scope
store i8 %.tmp3130, i8* %.tmp3129
ret void
}
define i8* @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.info.arg) {
%info = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.info.arg, %m2638$.AssignableInfo.type** %info
%.tmp3131 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp3132 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3131, i32 0, i32 1
%.tmp3133 = load i8, i8* %.tmp3132
%.tmp3134 = load i8, i8* @SCOPE_CONST
%.tmp3135 = icmp eq i8 %.tmp3133, %.tmp3134
br i1 %.tmp3135, label %.if.true.3136, label %.if.false.3136
.if.true.3136:
%.tmp3137 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp3138 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3137, i32 0, i32 0
%.tmp3139 = load i8*, i8** %.tmp3138
ret i8* %.tmp3139
br label %.if.end.3136
.if.false.3136:
br label %.if.end.3136
.if.end.3136:
%buf.3140 = alloca i8*
store i8* null, i8** %buf.3140
%.tmp3141 = getelementptr i8*, i8** %buf.3140, i32 0
%.tmp3143 = getelementptr [5 x i8], [5 x i8]*@.str3142, i32 0, i32 0
%.tmp3144 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp3145 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3144, i32 0, i32 1
%.tmp3146 = load i8, i8* %.tmp3145
%.tmp3147 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp3148 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3147, i32 0, i32 0
%.tmp3149 = load i8*, i8** %.tmp3148
%.tmp3150 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3141, i8* %.tmp3143, i8 %.tmp3146, i8* %.tmp3149)
%.tmp3151 = load i8*, i8** %buf.3140
ret i8* %.tmp3151
}
define void @m295$set_assignable_tmp_id.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%info = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.info.arg, %m2638$.AssignableInfo.type** %info
%tmp_buff.3152 = alloca i8*
store i8* null, i8** %tmp_buff.3152
%.tmp3153 = getelementptr i8*, i8** %tmp_buff.3152, i32 0
%.tmp3155 = getelementptr [7 x i8], [7 x i8]*@.str3154, i32 0, i32 0
%.tmp3156 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3157 = call i32(%m2638$.CompilerCtx.type*) @m295$new_uid.i.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp3156)
%.tmp3158 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3153, i8* %.tmp3155, i32 %.tmp3157)
%.tmp3159 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp3160 = load i8, i8* @SCOPE_LOCAL
%.tmp3161 = load i8*, i8** %tmp_buff.3152
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp3159, i8 %.tmp3160, i8* %.tmp3161)
ret void
}
define %m2638$.ModuleLookup.type* @m295$get_module.m2638$.ModuleLookup.typep.m2638$.CompilerCtx.typep.cp(%m2638$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp3163 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3164 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3163, i32 0, i32 6
%.tmp3165 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %.tmp3164
%m.3166 = alloca %m2638$.ModuleLookup.type*
store %m2638$.ModuleLookup.type* %.tmp3165, %m2638$.ModuleLookup.type** %m.3166
br label %.for.start.3162
.for.start.3162:
%.tmp3167 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.3166
%.tmp3168 = icmp ne %m2638$.ModuleLookup.type* %.tmp3167, null
br i1 %.tmp3168, label %.for.continue.3162, label %.for.end.3162
.for.continue.3162:
%.tmp3169 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.3166
%.tmp3170 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp3169, i32 0, i32 0
%.tmp3171 = load i8*, i8** %.tmp3170
%.tmp3172 = load i8*, i8** %filename
%.tmp3173 = call i32(i8*,i8*) @strcmp(i8* %.tmp3171, i8* %.tmp3172)
%.tmp3174 = icmp eq i32 %.tmp3173, 0
br i1 %.tmp3174, label %.if.true.3175, label %.if.false.3175
.if.true.3175:
%.tmp3176 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.3166
ret %m2638$.ModuleLookup.type* %.tmp3176
br label %.if.end.3175
.if.false.3175:
br label %.if.end.3175
.if.end.3175:
%.tmp3177 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.3166
%.tmp3178 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp3177, i32 0, i32 2
%.tmp3179 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %.tmp3178
store %m2638$.ModuleLookup.type* %.tmp3179, %m2638$.ModuleLookup.type** %m.3166
br label %.for.start.3162
.for.end.3162:
%.tmp3180 = bitcast ptr null to %m2638$.ModuleLookup.type*
ret %m2638$.ModuleLookup.type* %.tmp3180
}
define %m2638$.ModuleLookup.type* @m295$get_current_module.m2638$.ModuleLookup.typep.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%.tmp3181 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3182 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3183 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3182, i32 0, i32 7
%.tmp3184 = load i8*, i8** %.tmp3183
%.tmp3185 = call %m2638$.ModuleLookup.type*(%m2638$.CompilerCtx.type*,i8*) @m295$get_module.m2638$.ModuleLookup.typep.m2638$.CompilerCtx.typep.cp(%m2638$.CompilerCtx.type* %.tmp3181, i8* %.tmp3184)
ret %m2638$.ModuleLookup.type* %.tmp3185
}
define i32 @m295$new_uid.i.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%.tmp3186 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3187 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3186, i32 0, i32 5
%.tmp3188 = load i32, i32* %.tmp3187
%uid.3189 = alloca i32
store i32 %.tmp3188, i32* %uid.3189
%.tmp3190 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3191 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3190, i32 0, i32 5
%.tmp3192 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3193 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3192, i32 0, i32 5
%.tmp3194 = load i32, i32* %.tmp3193
%.tmp3195 = add i32 %.tmp3194, 1
store i32 %.tmp3195, i32* %.tmp3191
%.tmp3196 = load i32, i32* %uid.3189
ret i32 %.tmp3196
}
define %m2638$.CompilerCtx.type* @m295$new_context.m2638$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp3197 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* null, i32 1
%.tmp3198 = ptrtoint %m2638$.CompilerCtx.type* %.tmp3197 to i32
%.tmp3199 = call i8*(i32) @malloc(i32 %.tmp3198)
%.tmp3200 = bitcast i8* %.tmp3199 to %m2638$.CompilerCtx.type*
%ctx.3201 = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.tmp3200, %m2638$.CompilerCtx.type** %ctx.3201
%.tmp3202 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx.3201
%.tmp3203 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3202, i32 0, i32 1
%.tmp3204 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp3204, %m0$.File.type** %.tmp3203
%.tmp3205 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx.3201
%.tmp3206 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3205, i32 0, i32 0
%.tmp3207 = bitcast ptr null to %m981$.Node.type*
store %m981$.Node.type* %.tmp3207, %m981$.Node.type** %.tmp3206
%.tmp3208 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx.3201
%.tmp3209 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3208, i32 0, i32 2
store %m2638$.ErrorList.type* null, %m2638$.ErrorList.type** %.tmp3209
%.tmp3210 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx.3201
%.tmp3211 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3210, i32 0, i32 5
store i32 0, i32* %.tmp3211
%.tmp3212 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx.3201
%.tmp3213 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3212, i32 0, i32 3
store %m2638$.GlobalName.type* null, %m2638$.GlobalName.type** %.tmp3213
%.tmp3214 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx.3201
%.tmp3215 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3214, i32 0, i32 8
store %m2638$.AnonFn.type* null, %m2638$.AnonFn.type** %.tmp3215
%.tmp3216 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx.3201
%.tmp3217 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3216, i32 0, i32 7
%.tmp3218 = load i8*, i8** %filename
store i8* %.tmp3218, i8** %.tmp3217
%.tmp3219 = call i8*() @m2186$grammar.cp()
%.tmp3220 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp3219)
%grammar_file.3221 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp3220, %m0$.File.type** %grammar_file.3221
%.tmp3222 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3221
%.tmp3223 = icmp eq %m0$.File.type* %.tmp3222, null
br i1 %.tmp3223, label %.if.true.3224, label %.if.false.3224
.if.true.3224:
%.tmp3225 = bitcast ptr null to %m2638$.CompilerCtx.type*
ret %m2638$.CompilerCtx.type* %.tmp3225
br label %.if.end.3224
.if.false.3224:
br label %.if.end.3224
.if.end.3224:
%.tmp3226 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3221
%.tmp3227 = call %m981$.ParsingContext.type*(%m0$.File.type*) @m981$new_context.m981$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp3226)
%grammar_ctx.3228 = alloca %m981$.ParsingContext.type*
store %m981$.ParsingContext.type* %.tmp3227, %m981$.ParsingContext.type** %grammar_ctx.3228
%.tmp3229 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3221
%.tmp3230 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp3229)
%.tmp3231 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx.3201
%.tmp3232 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3231, i32 0, i32 4
%.tmp3233 = load %m981$.ParsingContext.type*, %m981$.ParsingContext.type** %grammar_ctx.3228
%.tmp3234 = call %m981$.Rule.type**(%m981$.ParsingContext.type*) @m981$parse_grammar.m981$.Rule.typepp.m981$.ParsingContext.typep(%m981$.ParsingContext.type* %.tmp3233)
store %m981$.Rule.type** %.tmp3234, %m981$.Rule.type*** %.tmp3232
%.tmp3235 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx.3201
%.tmp3236 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3235, i32 0, i32 6
%.tmp3237 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* null, i32 1
%.tmp3238 = ptrtoint %m2638$.ModuleLookup.type* %.tmp3237 to i32
%.tmp3239 = call i8*(i32) @malloc(i32 %.tmp3238)
%.tmp3240 = bitcast i8* %.tmp3239 to %m2638$.ModuleLookup.type*
store %m2638$.ModuleLookup.type* %.tmp3240, %m2638$.ModuleLookup.type** %.tmp3236
%.tmp3241 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx.3201
%.tmp3242 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3241, i32 0, i32 6
%.tmp3243 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %.tmp3242
%.tmp3244 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp3243, i32 0, i32 0
%.tmp3245 = load i8*, i8** %filename
store i8* %.tmp3245, i8** %.tmp3244
%.tmp3246 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx.3201
%.tmp3247 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3246, i32 0, i32 6
%.tmp3248 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %.tmp3247
%.tmp3249 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp3248, i32 0, i32 3
store %m2638$.Scope.type* null, %m2638$.Scope.type** %.tmp3249
%.tmp3250 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx.3201
%.tmp3251 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3250, i32 0, i32 6
%.tmp3252 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %.tmp3251
%.tmp3253 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp3252, i32 0, i32 1
%.tmp3255 = getelementptr [1 x i8], [1 x i8]*@.str3254, i32 0, i32 0
store i8* %.tmp3255, i8** %.tmp3253
%.tmp3256 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx.3201
%.tmp3257 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3256, i32 0, i32 6
%.tmp3258 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %.tmp3257
%.tmp3259 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp3258, i32 0, i32 2
store %m2638$.ModuleLookup.type* null, %m2638$.ModuleLookup.type** %.tmp3259
%.tmp3260 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx.3201
%.tmp3261 = bitcast %m2638$.CompilerCtx.type* %.tmp3260 to %m2638$.CompilerCtx.type*
ret %m2638$.CompilerCtx.type* %.tmp3261
}
define void @m295$push_scope.v.m2638$.CompilerCtx.typep.cp.cp.cp.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.ctx.arg, i8* %.type.arg, i8* %.begin_id.arg, i8* %.end_id.arg, %m2638$.Type.type* %.t.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%type = alloca i8*
store i8* %.type.arg, i8** %type
%begin_id = alloca i8*
store i8* %.begin_id.arg, i8** %begin_id
%end_id = alloca i8*
store i8* %.end_id.arg, i8** %end_id
%t = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.t.arg, %m2638$.Type.type** %t
%.tmp3262 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* null, i32 1
%.tmp3263 = ptrtoint %m2638$.Scope.type* %.tmp3262 to i32
%.tmp3264 = call i8*(i32) @malloc(i32 %.tmp3263)
%.tmp3265 = bitcast i8* %.tmp3264 to %m2638$.Scope.type*
%s.3266 = alloca %m2638$.Scope.type*
store %m2638$.Scope.type* %.tmp3265, %m2638$.Scope.type** %s.3266
%.tmp3267 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3268 = call %m2638$.ModuleLookup.type*(%m2638$.CompilerCtx.type*) @m295$get_current_module.m2638$.ModuleLookup.typep.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp3267)
%m.3269 = alloca %m2638$.ModuleLookup.type*
store %m2638$.ModuleLookup.type* %.tmp3268, %m2638$.ModuleLookup.type** %m.3269
%.tmp3270 = load %m2638$.Scope.type*, %m2638$.Scope.type** %s.3266
%.tmp3271 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp3270, i32 0, i32 5
%.tmp3272 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.3269
%.tmp3273 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp3272, i32 0, i32 3
%.tmp3274 = load %m2638$.Scope.type*, %m2638$.Scope.type** %.tmp3273
store %m2638$.Scope.type* %.tmp3274, %m2638$.Scope.type** %.tmp3271
%.tmp3275 = load %m2638$.Scope.type*, %m2638$.Scope.type** %s.3266
%.tmp3276 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp3275, i32 0, i32 1
store %m2638$.ScopeItem.type* null, %m2638$.ScopeItem.type** %.tmp3276
%.tmp3277 = load %m2638$.Scope.type*, %m2638$.Scope.type** %s.3266
%.tmp3278 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp3277, i32 0, i32 2
%.tmp3279 = load i8*, i8** %type
store i8* %.tmp3279, i8** %.tmp3278
%.tmp3280 = load %m2638$.Scope.type*, %m2638$.Scope.type** %s.3266
%.tmp3281 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp3280, i32 0, i32 3
%.tmp3282 = load i8*, i8** %begin_id
store i8* %.tmp3282, i8** %.tmp3281
%.tmp3283 = load %m2638$.Scope.type*, %m2638$.Scope.type** %s.3266
%.tmp3284 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp3283, i32 0, i32 4
%.tmp3285 = load i8*, i8** %end_id
store i8* %.tmp3285, i8** %.tmp3284
%.tmp3286 = load %m2638$.Scope.type*, %m2638$.Scope.type** %s.3266
%.tmp3287 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp3286, i32 0, i32 6
%.tmp3288 = load %m2638$.Type.type*, %m2638$.Type.type** %t
store %m2638$.Type.type* %.tmp3288, %m2638$.Type.type** %.tmp3287
%.tmp3289 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.3269
%.tmp3290 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp3289, i32 0, i32 3
%.tmp3291 = load %m2638$.Scope.type*, %m2638$.Scope.type** %s.3266
store %m2638$.Scope.type* %.tmp3291, %m2638$.Scope.type** %.tmp3290
ret void
}
define void @m295$pop_scope.v.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%.tmp3292 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3293 = call %m2638$.ModuleLookup.type*(%m2638$.CompilerCtx.type*) @m295$get_current_module.m2638$.ModuleLookup.typep.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp3292)
%m.3294 = alloca %m2638$.ModuleLookup.type*
store %m2638$.ModuleLookup.type* %.tmp3293, %m2638$.ModuleLookup.type** %m.3294
%.tmp3295 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.3294
%.tmp3296 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp3295, i32 0, i32 3
%.tmp3297 = load %m2638$.Scope.type*, %m2638$.Scope.type** %.tmp3296
%.tmp3298 = icmp ne %m2638$.Scope.type* %.tmp3297, null
%.tmp3300 = getelementptr [61 x i8], [61 x i8]*@.str3299, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp3298, i8* %.tmp3300)
%.tmp3301 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.3294
%.tmp3302 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp3301, i32 0, i32 3
%.tmp3303 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.3294
%.tmp3304 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp3303, i32 0, i32 3
%.tmp3305 = load %m2638$.Scope.type*, %m2638$.Scope.type** %.tmp3304
%.tmp3306 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp3305, i32 0, i32 5
%.tmp3307 = load %m2638$.Scope.type*, %m2638$.Scope.type** %.tmp3306
store %m2638$.Scope.type* %.tmp3307, %m2638$.Scope.type** %.tmp3302
ret void
}
define i1 @m295$compile_file.b.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg, i8* %.filepath.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp3308 = load i8*, i8** %filepath
%.tmp3309 = load i32, i32* @O_RDONLY
%.tmp3310 = call i32(i8*,i32) @open(i8* %.tmp3308, i32 %.tmp3309)
%input_fd.3311 = alloca i32
store i32 %.tmp3310, i32* %input_fd.3311
%.tmp3312 = load i32, i32* %input_fd.3311
%.tmp3313 = icmp sle i32 %.tmp3312, 0
br i1 %.tmp3313, label %.if.true.3314, label %.if.false.3314
.if.true.3314:
%err_msg.3315 = alloca i8*
store i8* null, i8** %err_msg.3315
%.tmp3316 = getelementptr i8*, i8** %err_msg.3315, i32 0
%.tmp3318 = getelementptr [26 x i8], [26 x i8]*@.str3317, i32 0, i32 0
%.tmp3319 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3320 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3316, i8* %.tmp3318, %m981$.Node.type* %.tmp3319)
%.tmp3321 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3322 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3323 = load i8*, i8** %err_msg.3315
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp3321, %m981$.Node.type* %.tmp3322, i8* %.tmp3323)
ret i1 0
br label %.if.end.3314
.if.false.3314:
br label %.if.end.3314
.if.end.3314:
%.tmp3324 = load i32, i32* %input_fd.3311
%.tmp3325 = call %m298$.PeekerInfo.type*(i32) @m298$new.m298$.PeekerInfo.typep.i(i32 %.tmp3324)
%p.3326 = alloca %m298$.PeekerInfo.type*
store %m298$.PeekerInfo.type* %.tmp3325, %m298$.PeekerInfo.type** %p.3326
%.tmp3327 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.3326
%.tmp3328 = getelementptr %m298$.PeekerInfo.type, %m298$.PeekerInfo.type* %.tmp3327, i32 0, i32 6
%.tmp3329 = load i8*, i8** %filepath
store i8* %.tmp3329, i8** %.tmp3328
%.tmp3330 = load %m298$.PeekerInfo.type*, %m298$.PeekerInfo.type** %p.3326
%.tmp3331 = call %m297$.Token.type*(%m298$.PeekerInfo.type*,i1) @m297$tokenize.m297$.Token.typep.m298$.PeekerInfo.typep.b(%m298$.PeekerInfo.type* %.tmp3330, i1 0)
%tokens.3332 = alloca %m297$.Token.type*
store %m297$.Token.type* %.tmp3331, %m297$.Token.type** %tokens.3332
%.tmp3333 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3334 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3333, i32 0, i32 4
%.tmp3335 = load %m981$.Rule.type**, %m981$.Rule.type*** %.tmp3334
%.tmp3337 = getelementptr [6 x i8], [6 x i8]*@.str3336, i32 0, i32 0
%.tmp3338 = load %m297$.Token.type*, %m297$.Token.type** %tokens.3332
%.tmp3339 = call %m981$.ParseResult.type*(%m981$.Rule.type**,i8*,%m297$.Token.type*) @m981$ast.m981$.ParseResult.typep.m981$.Rule.typepp.cp.m297$.Token.typep(%m981$.Rule.type** %.tmp3335, i8* %.tmp3337, %m297$.Token.type* %.tmp3338)
%ast.3340 = alloca %m981$.ParseResult.type*
store %m981$.ParseResult.type* %.tmp3339, %m981$.ParseResult.type** %ast.3340
%.tmp3341 = load %m981$.ParseResult.type*, %m981$.ParseResult.type** %ast.3340
%.tmp3342 = getelementptr %m981$.ParseResult.type, %m981$.ParseResult.type* %.tmp3341, i32 0, i32 0
%.tmp3343 = load %m296$.Error.type*, %m296$.Error.type** %.tmp3342
%.tmp3344 = icmp ne %m296$.Error.type* %.tmp3343, null
br i1 %.tmp3344, label %.if.true.3345, label %.if.false.3345
.if.true.3345:
%.tmp3346 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3347 = load %m981$.ParseResult.type*, %m981$.ParseResult.type** %ast.3340
%.tmp3348 = getelementptr %m981$.ParseResult.type, %m981$.ParseResult.type* %.tmp3347, i32 0, i32 0
%.tmp3349 = load %m296$.Error.type*, %m296$.Error.type** %.tmp3348
call void(%m2638$.CompilerCtx.type*,%m296$.Error.type*) @m295$append_error.v.m2638$.CompilerCtx.typep.m296$.Error.typep(%m2638$.CompilerCtx.type* %.tmp3346, %m296$.Error.type* %.tmp3349)
br label %.if.end.3345
.if.false.3345:
br label %.if.end.3345
.if.end.3345:
%.tmp3350 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3351 = load %m981$.ParseResult.type*, %m981$.ParseResult.type** %ast.3340
%.tmp3352 = getelementptr %m981$.ParseResult.type, %m981$.ParseResult.type* %.tmp3351, i32 0, i32 1
%.tmp3353 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3352
%.tmp3354 = call i1(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile.b.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp3350, %m981$.Node.type* %.tmp3353)
ret i1 %.tmp3354
}
define i1 @m295$compile.b.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.ast.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%ast = alloca %m981$.Node.type*
store %m981$.Node.type* %.ast.arg, %m981$.Node.type** %ast
%.tmp3355 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3356 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3355, i32 0, i32 2
%.tmp3357 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %.tmp3356
%.tmp3358 = icmp eq %m2638$.ErrorList.type* %.tmp3357, null
br i1 %.tmp3358, label %.if.true.3359, label %.if.false.3359
.if.true.3359:
%.tmp3360 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3361 = load %m981$.Node.type*, %m981$.Node.type** %ast
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_ast.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp3360, %m981$.Node.type* %.tmp3361)
br label %.if.end.3359
.if.false.3359:
br label %.if.end.3359
.if.end.3359:
%.tmp3362 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3363 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3362, i32 0, i32 2
%.tmp3364 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %.tmp3363
%.tmp3365 = icmp ne %m2638$.ErrorList.type* %.tmp3364, null
br i1 %.tmp3365, label %.if.true.3366, label %.if.false.3366
.if.true.3366:
%.tmp3368 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3369 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3368, i32 0, i32 2
%.tmp3370 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %.tmp3369
%err.3371 = alloca %m2638$.ErrorList.type*
store %m2638$.ErrorList.type* %.tmp3370, %m2638$.ErrorList.type** %err.3371
br label %.for.start.3367
.for.start.3367:
%.tmp3372 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %err.3371
%.tmp3373 = icmp ne %m2638$.ErrorList.type* %.tmp3372, null
br i1 %.tmp3373, label %.for.continue.3367, label %.for.end.3367
.for.continue.3367:
%.tmp3374 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %err.3371
%.tmp3375 = getelementptr %m2638$.ErrorList.type, %m2638$.ErrorList.type* %.tmp3374, i32 0, i32 2
%.tmp3376 = load i1, i1* %.tmp3375
%.tmp3377 = icmp eq i1 %.tmp3376, 0
br i1 %.tmp3377, label %.if.true.3378, label %.if.false.3378
.if.true.3378:
%.tmp3379 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %err.3371
%.tmp3380 = getelementptr %m2638$.ErrorList.type, %m2638$.ErrorList.type* %.tmp3379, i32 0, i32 0
%.tmp3381 = load %m296$.Error.type*, %m296$.Error.type** %.tmp3380
call void(%m296$.Error.type*) @m296$report.v.m296$.Error.typep(%m296$.Error.type* %.tmp3381)
%.tmp3382 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %err.3371
%.tmp3383 = getelementptr %m2638$.ErrorList.type, %m2638$.ErrorList.type* %.tmp3382, i32 0, i32 2
store i1 1, i1* %.tmp3383
br label %.if.end.3378
.if.false.3378:
br label %.if.end.3378
.if.end.3378:
%.tmp3384 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %err.3371
%.tmp3385 = getelementptr %m2638$.ErrorList.type, %m2638$.ErrorList.type* %.tmp3384, i32 0, i32 1
%.tmp3386 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %.tmp3385
store %m2638$.ErrorList.type* %.tmp3386, %m2638$.ErrorList.type** %err.3371
br label %.for.start.3367
.for.end.3367:
ret i1 1
br label %.if.end.3366
.if.false.3366:
br label %.if.end.3366
.if.end.3366:
ret i1 0
}
define void @m295$mark_weak_global.v.m2638$.CompilerCtx.typep.cp(%m2638$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp3388 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3389 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3388, i32 0, i32 3
%.tmp3390 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %.tmp3389
%g.3391 = alloca %m2638$.GlobalName.type*
store %m2638$.GlobalName.type* %.tmp3390, %m2638$.GlobalName.type** %g.3391
br label %.for.start.3387
.for.start.3387:
%.tmp3392 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g.3391
%.tmp3393 = icmp ne %m2638$.GlobalName.type* %.tmp3392, null
br i1 %.tmp3393, label %.for.continue.3387, label %.for.end.3387
.for.continue.3387:
%.tmp3394 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g.3391
%.tmp3395 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp3394, i32 0, i32 3
%.tmp3396 = load i1, i1* %.tmp3395
%.tmp3397 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g.3391
%.tmp3398 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp3397, i32 0, i32 0
%.tmp3399 = load i8*, i8** %.tmp3398
%.tmp3400 = load i8*, i8** %id
%.tmp3401 = call i32(i8*,i8*) @strcmp(i8* %.tmp3399, i8* %.tmp3400)
%.tmp3402 = icmp eq i32 %.tmp3401, 0
%.tmp3403 = and i1 %.tmp3396, %.tmp3402
br i1 %.tmp3403, label %.if.true.3404, label %.if.false.3404
.if.true.3404:
%.tmp3405 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g.3391
%.tmp3406 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp3405, i32 0, i32 2
store i1 1, i1* %.tmp3406
br label %.for.end.3387
br label %.if.end.3404
.if.false.3404:
br label %.if.end.3404
.if.end.3404:
%.tmp3407 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g.3391
%.tmp3408 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp3407, i32 0, i32 5
%.tmp3409 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %.tmp3408
store %m2638$.GlobalName.type* %.tmp3409, %m2638$.GlobalName.type** %g.3391
br label %.for.start.3387
.for.end.3387:
ret void
}
define void @m295$compile_ast.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.ast.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%ast = alloca %m981$.Node.type*
store %m981$.Node.type* %.ast.arg, %m981$.Node.type** %ast
%.tmp3410 = load %m981$.Node.type*, %m981$.Node.type** %ast
%.tmp3411 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3410, i32 0, i32 0
%.tmp3412 = load i8*, i8** %.tmp3411
%.tmp3414 = getelementptr [6 x i8], [6 x i8]*@.str3413, i32 0, i32 0
%.tmp3415 = call i32(i8*,i8*) @strcmp(i8* %.tmp3412, i8* %.tmp3414)
%.tmp3416 = icmp ne i32 %.tmp3415, 0
br i1 %.tmp3416, label %.if.true.3417, label %.if.false.3417
.if.true.3417:
%.tmp3418 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3419 = load %m981$.Node.type*, %m981$.Node.type** %ast
%.tmp3421 = getelementptr [29 x i8], [29 x i8]*@.str3420, i32 0, i32 0
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp3418, %m981$.Node.type* %.tmp3419, i8* %.tmp3421)
ret void
br label %.if.end.3417
.if.false.3417:
br label %.if.end.3417
.if.end.3417:
%.tmp3422 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3424 = getelementptr [7 x i8], [7 x i8]*@.str3423, i32 0, i32 0
%.tmp3425 = bitcast ptr null to i8*
%.tmp3426 = bitcast ptr null to i8*
%.tmp3427 = bitcast ptr null to %m2638$.Type.type*
call void(%m2638$.CompilerCtx.type*,i8*,i8*,i8*,%m2638$.Type.type*) @m295$push_scope.v.m2638$.CompilerCtx.typep.cp.cp.cp.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp3422, i8* %.tmp3424, i8* %.tmp3425, i8* %.tmp3426, %m2638$.Type.type* %.tmp3427)
%.tmp3428 = load %m981$.Node.type*, %m981$.Node.type** %ast
%.tmp3429 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3428, i32 0, i32 6
%.tmp3430 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3429
%start.3431 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp3430, %m981$.Node.type** %start.3431
%.tmp3432 = load %m981$.Node.type*, %m981$.Node.type** %start.3431
%.tmp3433 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3432, i32 0, i32 0
%.tmp3434 = load i8*, i8** %.tmp3433
%.tmp3436 = getelementptr [13 x i8], [13 x i8]*@.str3435, i32 0, i32 0
%.tmp3437 = call i32(i8*,i8*) @strcmp(i8* %.tmp3434, i8* %.tmp3436)
%.tmp3438 = icmp eq i32 %.tmp3437, 0
br i1 %.tmp3438, label %.if.true.3439, label %.if.false.3439
.if.true.3439:
%.tmp3440 = load %m981$.Node.type*, %m981$.Node.type** %start.3431
%.tmp3441 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3440, i32 0, i32 7
%.tmp3442 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3441
store %m981$.Node.type* %.tmp3442, %m981$.Node.type** %start.3431
br label %.if.end.3439
.if.false.3439:
br label %.if.end.3439
.if.end.3439:
%.tmp3444 = load %m981$.Node.type*, %m981$.Node.type** %start.3431
%stmt.3445 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp3444, %m981$.Node.type** %stmt.3445
br label %.for.start.3443
.for.start.3443:
%.tmp3446 = load %m981$.Node.type*, %m981$.Node.type** %stmt.3445
%.tmp3447 = icmp ne %m981$.Node.type* %.tmp3446, null
br i1 %.tmp3447, label %.for.continue.3443, label %.for.end.3443
.for.continue.3443:
%.tmp3448 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3449 = load %m981$.Node.type*, %m981$.Node.type** %stmt.3445
%.tmp3450 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3449, i32 0, i32 6
%.tmp3451 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3450
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i1) @m295$compile_statement.v.m2638$.CompilerCtx.typep.m981$.Node.typep.b(%m2638$.CompilerCtx.type* %.tmp3448, %m981$.Node.type* %.tmp3451, i1 1)
%.tmp3452 = load %m981$.Node.type*, %m981$.Node.type** %stmt.3445
%.tmp3453 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3452, i32 0, i32 7
%.tmp3454 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3453
store %m981$.Node.type* %.tmp3454, %m981$.Node.type** %stmt.3445
br label %.for.start.3443
.for.end.3443:
%.tmp3455 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3456 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3455, i32 0, i32 2
%.tmp3457 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %.tmp3456
%.tmp3458 = icmp ne %m2638$.ErrorList.type* %.tmp3457, null
br i1 %.tmp3458, label %.if.true.3459, label %.if.false.3459
.if.true.3459:
ret void
br label %.if.end.3459
.if.false.3459:
br label %.if.end.3459
.if.end.3459:
%.tmp3461 = load %m981$.Node.type*, %m981$.Node.type** %start.3431
%s.3462 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp3461, %m981$.Node.type** %s.3462
br label %.for.start.3460
.for.start.3460:
%.tmp3463 = load %m981$.Node.type*, %m981$.Node.type** %s.3462
%.tmp3464 = icmp ne %m981$.Node.type* %.tmp3463, null
br i1 %.tmp3464, label %.for.continue.3460, label %.for.end.3460
.for.continue.3460:
%.tmp3465 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3466 = load %m981$.Node.type*, %m981$.Node.type** %s.3462
%.tmp3467 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3466, i32 0, i32 6
%.tmp3468 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3467
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i1) @m295$compile_statement.v.m2638$.CompilerCtx.typep.m981$.Node.typep.b(%m2638$.CompilerCtx.type* %.tmp3465, %m981$.Node.type* %.tmp3468, i1 0)
%.tmp3469 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
call void(%m2638$.CompilerCtx.type*) @m295$compile_anon_fn.v.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp3469)
%.tmp3470 = load %m981$.Node.type*, %m981$.Node.type** %s.3462
%.tmp3471 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3470, i32 0, i32 7
%.tmp3472 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3471
store %m981$.Node.type* %.tmp3472, %m981$.Node.type** %s.3462
br label %.for.start.3460
.for.end.3460:
%.tmp3473 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3474 = call %m2638$.ModuleLookup.type*(%m2638$.CompilerCtx.type*) @m295$get_current_module.m2638$.ModuleLookup.typep.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp3473)
%mod.3475 = alloca %m2638$.ModuleLookup.type*
store %m2638$.ModuleLookup.type* %.tmp3474, %m2638$.ModuleLookup.type** %mod.3475
%.tmp3476 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.3475
%.tmp3477 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp3476, i32 0, i32 1
%.tmp3478 = load i8*, i8** %.tmp3477
%.tmp3480 = getelementptr [1 x i8], [1 x i8]*@.str3479, i32 0, i32 0
%.tmp3481 = call i32(i8*,i8*) @strcmp(i8* %.tmp3478, i8* %.tmp3480)
%.tmp3482 = icmp eq i32 %.tmp3481, 0
br i1 %.tmp3482, label %.if.true.3483, label %.if.false.3483
.if.true.3483:
%.tmp3485 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3486 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3485, i32 0, i32 3
%.tmp3487 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %.tmp3486
%g.3488 = alloca %m2638$.GlobalName.type*
store %m2638$.GlobalName.type* %.tmp3487, %m2638$.GlobalName.type** %g.3488
br label %.for.start.3484
.for.start.3484:
%.tmp3489 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g.3488
%.tmp3490 = icmp ne %m2638$.GlobalName.type* %.tmp3489, null
br i1 %.tmp3490, label %.for.continue.3484, label %.for.end.3484
.for.continue.3484:
%.tmp3491 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3492 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g.3488
call void(%m2638$.CompilerCtx.type*,%m2638$.GlobalName.type*) @m295$compile_global.v.m2638$.CompilerCtx.typep.m2638$.GlobalName.typep(%m2638$.CompilerCtx.type* %.tmp3491, %m2638$.GlobalName.type* %.tmp3492)
%.tmp3493 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g.3488
%.tmp3494 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp3493, i32 0, i32 5
%.tmp3495 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %.tmp3494
store %m2638$.GlobalName.type* %.tmp3495, %m2638$.GlobalName.type** %g.3488
br label %.for.start.3484
.for.end.3484:
br label %.if.end.3483
.if.false.3483:
br label %.if.end.3483
.if.end.3483:
ret void
}
define void @m295$compile_global.v.m2638$.CompilerCtx.typep.m2638$.GlobalName.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%g = alloca %m2638$.GlobalName.type*
store %m2638$.GlobalName.type* %.g.arg, %m2638$.GlobalName.type** %g
%.tmp3496 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g
%.tmp3497 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp3496, i32 0, i32 2
%.tmp3498 = load i1, i1* %.tmp3497
br i1 %.tmp3498, label %.if.true.3499, label %.if.false.3499
.if.true.3499:
ret void
br label %.if.end.3499
.if.false.3499:
br label %.if.end.3499
.if.end.3499:
%.tmp3500 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g
%.tmp3501 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp3500, i32 0, i32 1
%.tmp3502 = load i8*, i8** %.tmp3501
%.tmp3504 = getelementptr [7 x i8], [7 x i8]*@.str3503, i32 0, i32 0
%.tmp3505 = call i32(i8*,i8*) @strcmp(i8* %.tmp3502, i8* %.tmp3504)
%.tmp3506 = icmp eq i32 %.tmp3505, 0
br i1 %.tmp3506, label %.if.true.3507, label %.if.false.3507
.if.true.3507:
%.tmp3508 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3509 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3508, i32 0, i32 1
%.tmp3510 = load %m0$.File.type*, %m0$.File.type** %.tmp3509
%.tmp3512 = getelementptr [21 x i8], [21 x i8]*@.str3511, i32 0, i32 0
%.tmp3513 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g
%.tmp3514 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp3513, i32 0, i32 4
%.tmp3515 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %.tmp3514
%.tmp3516 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp3515)
%.tmp3517 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3518 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g
%.tmp3519 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp3518, i32 0, i32 4
%.tmp3520 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %.tmp3519
%.tmp3521 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3520, i32 0, i32 4
%.tmp3522 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3521
%.tmp3523 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp3517, %m2638$.Type.type* %.tmp3522)
%.tmp3524 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g
%.tmp3525 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp3524, i32 0, i32 0
%.tmp3526 = load i8*, i8** %.tmp3525
%.tmp3527 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3510, i8* %.tmp3512, i8* %.tmp3516, i8* %.tmp3523, i8* %.tmp3526)
br label %.if.end.3507
.if.false.3507:
%.tmp3528 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g
%.tmp3529 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp3528, i32 0, i32 1
%.tmp3530 = load i8*, i8** %.tmp3529
%.tmp3532 = getelementptr [7 x i8], [7 x i8]*@.str3531, i32 0, i32 0
%.tmp3533 = call i32(i8*,i8*) @strcmp(i8* %.tmp3530, i8* %.tmp3532)
%.tmp3534 = icmp eq i32 %.tmp3533, 0
br i1 %.tmp3534, label %.if.true.3535, label %.if.false.3535
.if.true.3535:
%.tmp3536 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3537 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g
%.tmp3538 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp3537, i32 0, i32 4
%.tmp3539 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %.tmp3538
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$compile_extern.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp3536, %m2638$.AssignableInfo.type* %.tmp3539)
br label %.if.end.3535
.if.false.3535:
br label %.if.end.3535
.if.end.3535:
br label %.if.end.3507
.if.end.3507:
%.tmp3540 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g
%.tmp3541 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp3540, i32 0, i32 2
store i1 1, i1* %.tmp3541
ret void
}
define void @m295$compile_extern.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%info = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.info.arg, %m2638$.AssignableInfo.type** %info
%.tmp3542 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3543 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3542, i32 0, i32 1
%.tmp3544 = load %m0$.File.type*, %m0$.File.type** %.tmp3543
%.tmp3546 = getelementptr [15 x i8], [15 x i8]*@.str3545, i32 0, i32 0
%.tmp3547 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3548 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp3549 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3548, i32 0, i32 4
%.tmp3550 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3549
%.tmp3551 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3550, i32 0, i32 3
%.tmp3552 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3551
%.tmp3553 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp3547, %m2638$.Type.type* %.tmp3552)
%.tmp3554 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp3555 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp3554)
%.tmp3556 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3544, i8* %.tmp3546, i8* %.tmp3553, i8* %.tmp3555)
%.tmp3558 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp3559 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3558, i32 0, i32 4
%.tmp3560 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3559
%.tmp3561 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3560, i32 0, i32 3
%.tmp3562 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3561
%.tmp3563 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3562, i32 0, i32 4
%.tmp3564 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3563
%pt.3565 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp3564, %m2638$.Type.type** %pt.3565
br label %.for.start.3557
.for.start.3557:
%.tmp3566 = load %m2638$.Type.type*, %m2638$.Type.type** %pt.3565
%.tmp3567 = icmp ne %m2638$.Type.type* %.tmp3566, null
br i1 %.tmp3567, label %.for.continue.3557, label %.for.end.3557
.for.continue.3557:
%.tmp3568 = load %m2638$.Type.type*, %m2638$.Type.type** %pt.3565
%.tmp3569 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp3570 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3569, i32 0, i32 4
%.tmp3571 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3570
%.tmp3572 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3571, i32 0, i32 3
%.tmp3573 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3572
%.tmp3574 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3573, i32 0, i32 4
%.tmp3575 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3574
%.tmp3576 = icmp ne %m2638$.Type.type* %.tmp3568, %.tmp3575
br i1 %.tmp3576, label %.if.true.3577, label %.if.false.3577
.if.true.3577:
%.tmp3578 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3579 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3578, i32 0, i32 1
%.tmp3580 = load %m0$.File.type*, %m0$.File.type** %.tmp3579
%.tmp3582 = getelementptr [3 x i8], [3 x i8]*@.str3581, i32 0, i32 0
%.tmp3583 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3580, i8* %.tmp3582)
br label %.if.end.3577
.if.false.3577:
br label %.if.end.3577
.if.end.3577:
%.tmp3584 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3585 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3584, i32 0, i32 1
%.tmp3586 = load %m0$.File.type*, %m0$.File.type** %.tmp3585
%.tmp3588 = getelementptr [3 x i8], [3 x i8]*@.str3587, i32 0, i32 0
%.tmp3589 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3590 = load %m2638$.Type.type*, %m2638$.Type.type** %pt.3565
%.tmp3591 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp3589, %m2638$.Type.type* %.tmp3590)
%.tmp3592 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3586, i8* %.tmp3588, i8* %.tmp3591)
%.tmp3593 = load %m2638$.Type.type*, %m2638$.Type.type** %pt.3565
%.tmp3594 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3593, i32 0, i32 4
%.tmp3595 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3594
store %m2638$.Type.type* %.tmp3595, %m2638$.Type.type** %pt.3565
br label %.for.start.3557
.for.end.3557:
%.tmp3596 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3597 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3596, i32 0, i32 1
%.tmp3598 = load %m0$.File.type*, %m0$.File.type** %.tmp3597
%.tmp3600 = getelementptr [3 x i8], [3 x i8]*@.str3599, i32 0, i32 0
%.tmp3601 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3598, i8* %.tmp3600)
ret void
}
define i8* @m295$get_mod_prefix.cp.m2638$.CompilerCtx.typep.cp(%m2638$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp3602 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3603 = call %m2638$.ModuleLookup.type*(%m2638$.CompilerCtx.type*) @m295$get_current_module.m2638$.ModuleLookup.typep.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp3602)
%m.3604 = alloca %m2638$.ModuleLookup.type*
store %m2638$.ModuleLookup.type* %.tmp3603, %m2638$.ModuleLookup.type** %m.3604
%.tmp3605 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.3604
%.tmp3606 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp3605, i32 0, i32 1
%.tmp3607 = load i8*, i8** %.tmp3606
ret i8* %.tmp3607
}
define i8* @m295$name_mangle.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.fn.arg, i8* %.original_name.arg, %m2638$.Type.type* %.type.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%fn = alloca %m981$.Node.type*
store %m981$.Node.type* %.fn.arg, %m981$.Node.type** %fn
%original_name = alloca i8*
store i8* %.original_name.arg, i8** %original_name
%type = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.type.arg, %m2638$.Type.type** %type
%mangled_name.3608 = alloca i8*
store i8* null, i8** %mangled_name.3608
%.tmp3609 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3610 = load %m981$.Node.type*, %m981$.Node.type** %fn
%.tmp3611 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3610, i32 0, i32 2
%.tmp3612 = load i8*, i8** %.tmp3611
%.tmp3613 = call i8*(%m2638$.CompilerCtx.type*,i8*) @m295$get_mod_prefix.cp.m2638$.CompilerCtx.typep.cp(%m2638$.CompilerCtx.type* %.tmp3609, i8* %.tmp3612)
%prefix.3614 = alloca i8*
store i8* %.tmp3613, i8** %prefix.3614
%.tmp3615 = getelementptr i8*, i8** %mangled_name.3608, i32 0
%.tmp3617 = getelementptr [5 x i8], [5 x i8]*@.str3616, i32 0, i32 0
%.tmp3618 = load i8*, i8** %prefix.3614
%.tmp3619 = load i8*, i8** %original_name
%.tmp3620 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3615, i8* %.tmp3617, i8* %.tmp3618, i8* %.tmp3619)
%.tmp3621 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp3622 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3621, i32 0, i32 0
%.tmp3623 = load i8*, i8** %.tmp3622
%.tmp3625 = getelementptr [9 x i8], [9 x i8]*@.str3624, i32 0, i32 0
%.tmp3626 = call i32(i8*,i8*) @strcmp(i8* %.tmp3623, i8* %.tmp3625)
%.tmp3627 = icmp eq i32 %.tmp3626, 0
br i1 %.tmp3627, label %.if.true.3628, label %.if.false.3628
.if.true.3628:
%.tmp3629 = load i8*, i8** %mangled_name.3608
%.tmp3631 = getelementptr [5 x i8], [5 x i8]*@.str3630, i32 0, i32 0
%.tmp3632 = call i32(i8*,i8*) @strcmp(i8* %.tmp3629, i8* %.tmp3631)
%.tmp3633 = icmp ne i32 %.tmp3632, 0
br i1 %.tmp3633, label %.if.true.3634, label %.if.false.3634
.if.true.3634:
%tmp_buff.3635 = alloca i8*
store i8* null, i8** %tmp_buff.3635
%swap_var.3636 = alloca i8*
store i8* null, i8** %swap_var.3636
%.tmp3638 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp3639 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3638, i32 0, i32 3
%.tmp3640 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3639
%tp.3641 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp3640, %m2638$.Type.type** %tp.3641
br label %.for.start.3637
.for.start.3637:
%.tmp3642 = load %m2638$.Type.type*, %m2638$.Type.type** %tp.3641
%.tmp3643 = icmp ne %m2638$.Type.type* %.tmp3642, null
br i1 %.tmp3643, label %.for.continue.3637, label %.for.end.3637
.for.continue.3637:
%.tmp3644 = getelementptr i8*, i8** %tmp_buff.3635, i32 0
%.tmp3646 = getelementptr [6 x i8], [6 x i8]*@.str3645, i32 0, i32 0
%.tmp3647 = load i8*, i8** %mangled_name.3608
%.tmp3648 = load %m2638$.Type.type*, %m2638$.Type.type** %tp.3641
%.tmp3649 = call i8*(%m2638$.Type.type*) @m295$type_abbr.cp.m2638$.Type.typep(%m2638$.Type.type* %.tmp3648)
%.tmp3650 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3644, i8* %.tmp3646, i8* %.tmp3647, i8* %.tmp3649)
%.tmp3651 = load i8*, i8** %tmp_buff.3635
store i8* %.tmp3651, i8** %swap_var.3636
%.tmp3652 = load i8*, i8** %mangled_name.3608
store i8* %.tmp3652, i8** %tmp_buff.3635
%.tmp3653 = load i8*, i8** %swap_var.3636
store i8* %.tmp3653, i8** %mangled_name.3608
%.tmp3654 = load i8*, i8** %tmp_buff.3635
call void(i8*) @free(i8* %.tmp3654)
%.tmp3655 = load %m2638$.Type.type*, %m2638$.Type.type** %tp.3641
%.tmp3656 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3655, i32 0, i32 4
%.tmp3657 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3656
store %m2638$.Type.type* %.tmp3657, %m2638$.Type.type** %tp.3641
br label %.for.start.3637
.for.end.3637:
br label %.if.end.3634
.if.false.3634:
br label %.if.end.3634
.if.end.3634:
br label %.if.end.3628
.if.false.3628:
br label %.if.end.3628
.if.end.3628:
%.tmp3658 = load i8*, i8** %mangled_name.3608
ret i8* %.tmp3658
}
define void @m295$compile_statement.v.m2638$.CompilerCtx.typep.m981$.Node.typep.b(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info.3659 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* null, %m2638$.AssignableInfo.type** %info.3659
%return_type.3660 = alloca %m2638$.Type.type*
store %m2638$.Type.type* null, %m2638$.Type.type** %return_type.3660
%err_buf.3661 = alloca i8*
store i8* null, i8** %err_buf.3661
%tmp_buff.3662 = alloca i8*
store i8* null, i8** %tmp_buff.3662
%.tmp3663 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3664 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3663, i32 0, i32 0
%.tmp3665 = load i8*, i8** %.tmp3664
%.tmp3667 = getelementptr [3 x i8], [3 x i8]*@.str3666, i32 0, i32 0
%.tmp3668 = call i32(i8*,i8*) @strcmp(i8* %.tmp3665, i8* %.tmp3667)
%.tmp3669 = icmp eq i32 %.tmp3668, 0
br i1 %.tmp3669, label %.if.true.3670, label %.if.false.3670
.if.true.3670:
ret void
br label %.if.end.3670
.if.false.3670:
%.tmp3671 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3672 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3671, i32 0, i32 0
%.tmp3673 = load i8*, i8** %.tmp3672
%.tmp3675 = getelementptr [7 x i8], [7 x i8]*@.str3674, i32 0, i32 0
%.tmp3676 = call i32(i8*,i8*) @strcmp(i8* %.tmp3673, i8* %.tmp3675)
%.tmp3677 = icmp eq i32 %.tmp3676, 0
br i1 %.tmp3677, label %.if.true.3678, label %.if.false.3678
.if.true.3678:
%.tmp3679 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3680 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3679, i32 0, i32 6
%.tmp3681 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3680
%.tmp3683 = getelementptr [11 x i8], [11 x i8]*@.str3682, i32 0, i32 0
%.tmp3684 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp3681, i8* %.tmp3683)
%assignable.3685 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp3684, %m981$.Node.type** %assignable.3685
%.tmp3686 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3687 = load %m981$.Node.type*, %m981$.Node.type** %assignable.3685
%.tmp3688 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_assignable.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp3686, %m981$.Node.type* %.tmp3687)
%a_info.3689 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp3688, %m2638$.AssignableInfo.type** %a_info.3689
%.tmp3690 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.3689
%.tmp3691 = icmp eq %m2638$.AssignableInfo.type* %.tmp3690, null
br i1 %.tmp3691, label %.if.true.3692, label %.if.false.3692
.if.true.3692:
ret void
br label %.if.end.3692
.if.false.3692:
br label %.if.end.3692
.if.end.3692:
%.tmp3693 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3694 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp3693)
store %m2638$.AssignableInfo.type* %.tmp3694, %m2638$.AssignableInfo.type** %info.3659
%.tmp3695 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3696 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3695, i32 0, i32 6
%.tmp3697 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3696
%.tmp3698 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3697, i32 0, i32 7
%.tmp3699 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3698
%.tmp3700 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3699, i32 0, i32 1
%.tmp3701 = load i8*, i8** %.tmp3700
%global_name.3702 = alloca i8*
store i8* %.tmp3701, i8** %global_name.3702
%.tmp3703 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3704 = load i8, i8* @SCOPE_GLOBAL
%.tmp3705 = load i8*, i8** %global_name.3702
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp3703, i8 %.tmp3704, i8* %.tmp3705)
%.tmp3706 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3707 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3706, i32 0, i32 4
%.tmp3708 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.3689
%.tmp3709 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3708, i32 0, i32 4
%.tmp3710 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3709
store %m2638$.Type.type* %.tmp3710, %m2638$.Type.type** %.tmp3707
%.tmp3711 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3712 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3711, i32 0, i32 3
%.tmp3714 = getelementptr [9 x i8], [9 x i8]*@.str3713, i32 0, i32 0
store i8* %.tmp3714, i8** %.tmp3712
%.tmp3715 = load i1, i1* %shallow
%.tmp3716 = icmp eq i1 %.tmp3715, 1
br i1 %.tmp3716, label %.if.true.3717, label %.if.false.3717
.if.true.3717:
%.tmp3718 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3719 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3720 = load i8*, i8** %global_name.3702
%.tmp3721 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*,%m2638$.AssignableInfo.type*) @m295$define_assignable.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp3718, %m981$.Node.type* %.tmp3719, i8* %.tmp3720, %m2638$.AssignableInfo.type* %.tmp3721)
br label %.if.end.3717
.if.false.3717:
%.tmp3722 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3723 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3722, i32 0, i32 1
%.tmp3724 = load %m0$.File.type*, %m0$.File.type** %.tmp3723
%.tmp3726 = getelementptr [21 x i8], [21 x i8]*@.str3725, i32 0, i32 0
%.tmp3727 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3728 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp3727)
%.tmp3729 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3730 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3731 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3730, i32 0, i32 4
%.tmp3732 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3731
%.tmp3733 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp3729, %m2638$.Type.type* %.tmp3732)
%.tmp3734 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.3689
%.tmp3735 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp3734)
%.tmp3736 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3724, i8* %.tmp3726, i8* %.tmp3728, i8* %.tmp3733, i8* %.tmp3735)
br label %.if.end.3717
.if.end.3717:
br label %.if.end.3678
.if.false.3678:
%.tmp3737 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3738 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3737, i32 0, i32 0
%.tmp3739 = load i8*, i8** %.tmp3738
%.tmp3741 = getelementptr [10 x i8], [10 x i8]*@.str3740, i32 0, i32 0
%.tmp3742 = call i32(i8*,i8*) @strcmp(i8* %.tmp3739, i8* %.tmp3741)
%.tmp3743 = icmp eq i32 %.tmp3742, 0
br i1 %.tmp3743, label %.if.true.3744, label %.if.false.3744
.if.true.3744:
%.tmp3745 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3746 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3745, i32 0, i32 6
%.tmp3747 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3746
%.tmp3748 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3747, i32 0, i32 7
%.tmp3749 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3748
%.tmp3750 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3749, i32 0, i32 1
%.tmp3751 = load i8*, i8** %.tmp3750
%type_name.3752 = alloca i8*
store i8* %.tmp3751, i8** %type_name.3752
%.tmp3753 = load i1, i1* %shallow
%.tmp3754 = icmp eq i1 %.tmp3753, 1
br i1 %.tmp3754, label %.if.true.3755, label %.if.false.3755
.if.true.3755:
%.tmp3756 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3757 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp3756)
store %m2638$.AssignableInfo.type* %.tmp3757, %m2638$.AssignableInfo.type** %info.3659
%.tmp3758 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3759 = call %m2638$.ModuleLookup.type*(%m2638$.CompilerCtx.type*) @m295$get_current_module.m2638$.ModuleLookup.typep.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp3758)
%mod_from.3760 = alloca %m2638$.ModuleLookup.type*
store %m2638$.ModuleLookup.type* %.tmp3759, %m2638$.ModuleLookup.type** %mod_from.3760
%.tmp3761 = getelementptr i8*, i8** %tmp_buff.3662, i32 0
%.tmp3763 = getelementptr [11 x i8], [11 x i8]*@.str3762, i32 0, i32 0
%.tmp3764 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod_from.3760
%.tmp3765 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp3764, i32 0, i32 1
%.tmp3766 = load i8*, i8** %.tmp3765
%.tmp3767 = load i8*, i8** %type_name.3752
%.tmp3768 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3761, i8* %.tmp3763, i8* %.tmp3766, i8* %.tmp3767)
%.tmp3769 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3770 = load i8, i8* @SCOPE_LOCAL
%.tmp3771 = load i8*, i8** %tmp_buff.3662
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp3769, i8 %.tmp3770, i8* %.tmp3771)
%.tmp3772 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3773 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3772, i32 0, i32 3
%.tmp3775 = getelementptr [10 x i8], [10 x i8]*@.str3774, i32 0, i32 0
store i8* %.tmp3775, i8** %.tmp3773
%.tmp3776 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3777 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3776, i32 0, i32 5
%.tmp3778 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3779 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3778, i32 0, i32 3
%.tmp3780 = load i32, i32* %.tmp3779
store i32 %.tmp3780, i32* %.tmp3777
%.tmp3781 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3782 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3781, i32 0, i32 6
%.tmp3783 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3784 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3783, i32 0, i32 4
%.tmp3785 = load i32, i32* %.tmp3784
store i32 %.tmp3785, i32* %.tmp3782
%.tmp3786 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3787 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3786, i32 0, i32 4
%.tmp3788 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp3788, %m2638$.Type.type** %.tmp3787
%.tmp3789 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3790 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3791 = load i8*, i8** %type_name.3752
%.tmp3792 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*,%m2638$.AssignableInfo.type*) @m295$define_assignable.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp3789, %m981$.Node.type* %.tmp3790, i8* %.tmp3791, %m2638$.AssignableInfo.type* %.tmp3792)
%.tmp3793 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3794 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3793, i32 0, i32 6
%.tmp3795 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3794
%.tmp3797 = getelementptr [5 x i8], [5 x i8]*@.str3796, i32 0, i32 0
%.tmp3798 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp3795, i8* %.tmp3797)
%type_decl.3799 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp3798, %m981$.Node.type** %type_decl.3799
%.tmp3800 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3801 = load %m981$.Node.type*, %m981$.Node.type** %type_decl.3799
%.tmp3802 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3801, i32 0, i32 6
%.tmp3803 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3802
%.tmp3804 = call %m2638$.Type.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$node_to_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp3800, %m981$.Node.type* %.tmp3803)
%type_struct.3805 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp3804, %m2638$.Type.type** %type_struct.3805
%.tmp3806 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3807 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3806, i32 0, i32 4
%.tmp3808 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3807
%.tmp3809 = load %m2638$.Type.type*, %m2638$.Type.type** %type_struct.3805
call void(%m2638$.Type.type*,%m2638$.Type.type*) @m295$copy_type.v.m2638$.Type.typep.m2638$.Type.typep(%m2638$.Type.type* %.tmp3808, %m2638$.Type.type* %.tmp3809)
%.tmp3810 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3811 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3810, i32 0, i32 4
%.tmp3812 = load %m2638$.Type.type*, %m2638$.Type.type** %type_struct.3805
store %m2638$.Type.type* %.tmp3812, %m2638$.Type.type** %.tmp3811
br label %.if.end.3755
.if.false.3755:
%.tmp3813 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3814 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3815 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3814, i32 0, i32 7
%.tmp3816 = load i8*, i8** %.tmp3815
%.tmp3817 = load i8*, i8** %type_name.3752
%.tmp3818 = call %m2638$.ScopeItem.type*(%m2638$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2638$.ScopeItem.typep.m2638$.CompilerCtx.typep.cp.cp(%m2638$.CompilerCtx.type* %.tmp3813, i8* %.tmp3816, i8* %.tmp3817)
%scope.3819 = alloca %m2638$.ScopeItem.type*
store %m2638$.ScopeItem.type* %.tmp3818, %m2638$.ScopeItem.type** %scope.3819
%.tmp3820 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %scope.3819
%.tmp3821 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp3820, i32 0, i32 1
%.tmp3822 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %.tmp3821
store %m2638$.AssignableInfo.type* %.tmp3822, %m2638$.AssignableInfo.type** %info.3659
%.tmp3823 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3824 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3823, i32 0, i32 1
%.tmp3825 = load %m0$.File.type*, %m0$.File.type** %.tmp3824
%.tmp3827 = getelementptr [14 x i8], [14 x i8]*@.str3826, i32 0, i32 0
%.tmp3828 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3829 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp3828)
%.tmp3830 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3831 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3832 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3831, i32 0, i32 4
%.tmp3833 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3832
%.tmp3834 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp3830, %m2638$.Type.type* %.tmp3833)
%.tmp3835 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3825, i8* %.tmp3827, i8* %.tmp3829, i8* %.tmp3834)
br label %.if.end.3755
.if.end.3755:
br label %.if.end.3744
.if.false.3744:
%.tmp3836 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3837 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3836, i32 0, i32 0
%.tmp3838 = load i8*, i8** %.tmp3837
%.tmp3840 = getelementptr [7 x i8], [7 x i8]*@.str3839, i32 0, i32 0
%.tmp3841 = call i32(i8*,i8*) @strcmp(i8* %.tmp3838, i8* %.tmp3840)
%.tmp3842 = icmp eq i32 %.tmp3841, 0
br i1 %.tmp3842, label %.if.true.3843, label %.if.false.3843
.if.true.3843:
%.tmp3844 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3845 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp3844)
store %m2638$.AssignableInfo.type* %.tmp3845, %m2638$.AssignableInfo.type** %info.3659
%.tmp3846 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3847 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3846, i32 0, i32 4
%.tmp3848 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3849 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3850 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3849, i32 0, i32 6
%.tmp3851 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3850
%.tmp3852 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3851, i32 0, i32 7
%.tmp3853 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3852
%.tmp3854 = call %m2638$.Type.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$syn_function_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp3848, %m981$.Node.type* %.tmp3853)
store %m2638$.Type.type* %.tmp3854, %m2638$.Type.type** %.tmp3847
%.tmp3855 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3856 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3855, i32 0, i32 3
%.tmp3858 = getelementptr [7 x i8], [7 x i8]*@.str3857, i32 0, i32 0
store i8* %.tmp3858, i8** %.tmp3856
%.tmp3859 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3860 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3859, i32 0, i32 6
%.tmp3861 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3860
%.tmp3862 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3861, i32 0, i32 7
%.tmp3863 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3862
%.tmp3864 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3863, i32 0, i32 7
%.tmp3865 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3864
%.tmp3866 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3865, i32 0, i32 1
%.tmp3867 = load i8*, i8** %.tmp3866
%fn_name.3868 = alloca i8*
store i8* %.tmp3867, i8** %fn_name.3868
%.tmp3869 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3870 = load i8, i8* @SCOPE_GLOBAL
%.tmp3871 = load i8*, i8** %fn_name.3868
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp3869, i8 %.tmp3870, i8* %.tmp3871)
%.tmp3872 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp3872, %m2638$.Type.type** %return_type.3660
%.tmp3873 = load %m2638$.Type.type*, %m2638$.Type.type** %return_type.3660
%.tmp3874 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3873, i32 0, i32 0
%.tmp3875 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3876 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3875, i32 0, i32 4
%.tmp3877 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3876
%.tmp3878 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3877, i32 0, i32 3
%.tmp3879 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3878
%.tmp3880 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3879, i32 0, i32 0
%.tmp3881 = load i8*, i8** %.tmp3880
store i8* %.tmp3881, i8** %.tmp3874
%.tmp3882 = load %m2638$.Type.type*, %m2638$.Type.type** %return_type.3660
%.tmp3883 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3882, i32 0, i32 3
%.tmp3884 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3885 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3884, i32 0, i32 4
%.tmp3886 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3885
%.tmp3887 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3886, i32 0, i32 3
%.tmp3888 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3887
%.tmp3889 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3888, i32 0, i32 3
%.tmp3890 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3889
store %m2638$.Type.type* %.tmp3890, %m2638$.Type.type** %.tmp3883
%.tmp3891 = load i1, i1* %shallow
%.tmp3892 = icmp eq i1 %.tmp3891, 0
br i1 %.tmp3892, label %.if.true.3893, label %.if.false.3893
.if.true.3893:
%.tmp3894 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3895 = load i8*, i8** %fn_name.3868
call void(%m2638$.CompilerCtx.type*,i8*) @m295$mark_weak_global.v.m2638$.CompilerCtx.typep.cp(%m2638$.CompilerCtx.type* %.tmp3894, i8* %.tmp3895)
%.tmp3896 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3897 = load i8*, i8** %fn_name.3868
%.tmp3899 = getelementptr [7 x i8], [7 x i8]*@.str3898, i32 0, i32 0
%.tmp3900 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
call void(%m2638$.CompilerCtx.type*,i8*,i8*,%m2638$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2638$.CompilerCtx.typep.cp.cp.m2638$.AssignableInfo.typep.b.b(%m2638$.CompilerCtx.type* %.tmp3896, i8* %.tmp3897, i8* %.tmp3899, %m2638$.AssignableInfo.type* %.tmp3900, i1 1, i1 1)
%.tmp3901 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3902 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$compile_extern.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp3901, %m2638$.AssignableInfo.type* %.tmp3902)
br label %.if.end.3893
.if.false.3893:
%.tmp3903 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3904 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3905 = load i8*, i8** %fn_name.3868
%.tmp3906 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*,%m2638$.AssignableInfo.type*) @m295$define_assignable.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp3903, %m981$.Node.type* %.tmp3904, i8* %.tmp3905, %m2638$.AssignableInfo.type* %.tmp3906)
br label %.if.end.3893
.if.end.3893:
br label %.if.end.3843
.if.false.3843:
%.tmp3907 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3908 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3907, i32 0, i32 0
%.tmp3909 = load i8*, i8** %.tmp3908
%.tmp3911 = getelementptr [9 x i8], [9 x i8]*@.str3910, i32 0, i32 0
%.tmp3912 = call i32(i8*,i8*) @strcmp(i8* %.tmp3909, i8* %.tmp3911)
%.tmp3913 = icmp eq i32 %.tmp3912, 0
br i1 %.tmp3913, label %.if.true.3914, label %.if.false.3914
.if.true.3914:
%.tmp3915 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3916 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp3915)
store %m2638$.AssignableInfo.type* %.tmp3916, %m2638$.AssignableInfo.type** %info.3659
%.tmp3917 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3918 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3917, i32 0, i32 3
%.tmp3920 = getelementptr [9 x i8], [9 x i8]*@.str3919, i32 0, i32 0
store i8* %.tmp3920, i8** %.tmp3918
%.tmp3921 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3922 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3921, i32 0, i32 4
%.tmp3923 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3924 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3925 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3924, i32 0, i32 6
%.tmp3926 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3925
%.tmp3927 = call %m2638$.Type.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$syn_function_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp3923, %m981$.Node.type* %.tmp3926)
store %m2638$.Type.type* %.tmp3927, %m2638$.Type.type** %.tmp3922
%.tmp3928 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3929 = call i8*(%m981$.Node.type*) @m295$syn_function_name.cp.m981$.Node.typep(%m981$.Node.type* %.tmp3928)
%name.3930 = alloca i8*
store i8* %.tmp3929, i8** %name.3930
%.tmp3931 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3932 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3933 = load i8*, i8** %name.3930
%.tmp3934 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3935 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3934, i32 0, i32 4
%.tmp3936 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3935
%.tmp3937 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*,%m2638$.Type.type*) @m295$name_mangle.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp3931, %m981$.Node.type* %.tmp3932, i8* %.tmp3933, %m2638$.Type.type* %.tmp3936)
store i8* %.tmp3937, i8** %tmp_buff.3662
%.tmp3938 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3939 = load i8, i8* @SCOPE_GLOBAL
%.tmp3940 = load i8*, i8** %tmp_buff.3662
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp3938, i8 %.tmp3939, i8* %.tmp3940)
%.tmp3941 = load i1, i1* %shallow
%.tmp3942 = icmp eq i1 %.tmp3941, 1
br i1 %.tmp3942, label %.if.true.3943, label %.if.false.3943
.if.true.3943:
%.tmp3944 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3945 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3946 = load i8*, i8** %name.3930
%.tmp3947 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*,%m2638$.AssignableInfo.type*) @m295$define_assignable.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp3944, %m981$.Node.type* %.tmp3945, i8* %.tmp3946, %m2638$.AssignableInfo.type* %.tmp3947)
br label %.if.end.3943
.if.false.3943:
%.tmp3948 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp3948, %m2638$.Type.type** %return_type.3660
%.tmp3949 = load %m2638$.Type.type*, %m2638$.Type.type** %return_type.3660
%.tmp3950 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3951 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp3950, i32 0, i32 4
%.tmp3952 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3951
%.tmp3953 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp3952, i32 0, i32 3
%.tmp3954 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp3953
call void(%m2638$.Type.type*,%m2638$.Type.type*) @m295$copy_type.v.m2638$.Type.typep.m2638$.Type.typep(%m2638$.Type.type* %.tmp3949, %m2638$.Type.type* %.tmp3954)
%.tmp3955 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3956 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3955, i32 0, i32 1
%.tmp3957 = load %m0$.File.type*, %m0$.File.type** %.tmp3956
%.tmp3959 = getelementptr [14 x i8], [14 x i8]*@.str3958, i32 0, i32 0
%.tmp3960 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3961 = load %m2638$.Type.type*, %m2638$.Type.type** %return_type.3660
%.tmp3962 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp3960, %m2638$.Type.type* %.tmp3961)
%.tmp3963 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.3659
%.tmp3964 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp3963)
%.tmp3965 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3957, i8* %.tmp3959, i8* %.tmp3962, i8* %.tmp3964)
%.tmp3966 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp3967 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3966, i32 0, i32 6
%.tmp3968 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3967
%.tmp3969 = call %m981$.Node.type*(%m981$.Node.type*) @m295$syn_function_params.m981$.Node.typep.m981$.Node.typep(%m981$.Node.type* %.tmp3968)
%params.3970 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp3969, %m981$.Node.type** %params.3970
%param_type.3971 = alloca %m2638$.Type.type*
store %m2638$.Type.type* null, %m2638$.Type.type** %param_type.3971
%.tmp3973 = load %m981$.Node.type*, %m981$.Node.type** %params.3970
%param_ptr.3974 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp3973, %m981$.Node.type** %param_ptr.3974
br label %.for.start.3972
.for.start.3972:
%.tmp3975 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.3974
%.tmp3976 = icmp ne %m981$.Node.type* %.tmp3975, null
br i1 %.tmp3976, label %.for.continue.3972, label %.for.end.3972
.for.continue.3972:
%.tmp3977 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.3974
%.tmp3978 = load %m981$.Node.type*, %m981$.Node.type** %params.3970
%.tmp3979 = icmp ne %m981$.Node.type* %.tmp3977, %.tmp3978
br i1 %.tmp3979, label %.if.true.3980, label %.if.false.3980
.if.true.3980:
%.tmp3981 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.3974
%.tmp3982 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3981, i32 0, i32 7
%.tmp3983 = load %m981$.Node.type*, %m981$.Node.type** %.tmp3982
store %m981$.Node.type* %.tmp3983, %m981$.Node.type** %param_ptr.3974
%.tmp3984 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3985 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp3984, i32 0, i32 1
%.tmp3986 = load %m0$.File.type*, %m0$.File.type** %.tmp3985
%.tmp3988 = getelementptr [3 x i8], [3 x i8]*@.str3987, i32 0, i32 0
%.tmp3989 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3986, i8* %.tmp3988)
br label %.if.end.3980
.if.false.3980:
br label %.if.end.3980
.if.end.3980:
%.tmp3990 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.3974
%.tmp3991 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3990, i32 0, i32 0
%.tmp3992 = load i8*, i8** %.tmp3991
%.tmp3994 = getelementptr [5 x i8], [5 x i8]*@.str3993, i32 0, i32 0
%.tmp3995 = call i32(i8*,i8*) @strcmp(i8* %.tmp3992, i8* %.tmp3994)
%.tmp3996 = icmp eq i32 %.tmp3995, 0
br i1 %.tmp3996, label %.if.true.3997, label %.if.false.3997
.if.true.3997:
%.tmp3998 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp3999 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.3974
%.tmp4000 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp3999, i32 0, i32 6
%.tmp4001 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4000
%.tmp4002 = call %m2638$.Type.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$node_to_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp3998, %m981$.Node.type* %.tmp4001)
store %m2638$.Type.type* %.tmp4002, %m2638$.Type.type** %param_type.3971
%.tmp4003 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.3974
%.tmp4004 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4003, i32 0, i32 7
%.tmp4005 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4004
store %m981$.Node.type* %.tmp4005, %m981$.Node.type** %param_ptr.3974
br label %.if.end.3997
.if.false.3997:
br label %.if.end.3997
.if.end.3997:
%.tmp4006 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4007 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4006, i32 0, i32 1
%.tmp4008 = load %m0$.File.type*, %m0$.File.type** %.tmp4007
%.tmp4010 = getelementptr [13 x i8], [13 x i8]*@.str4009, i32 0, i32 0
%.tmp4011 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4012 = load %m2638$.Type.type*, %m2638$.Type.type** %param_type.3971
%.tmp4013 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp4011, %m2638$.Type.type* %.tmp4012)
%.tmp4014 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.3974
%.tmp4015 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4014, i32 0, i32 1
%.tmp4016 = load i8*, i8** %.tmp4015
%.tmp4017 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4008, i8* %.tmp4010, i8* %.tmp4013, i8* %.tmp4016)
%.tmp4018 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.3974
%.tmp4019 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4018, i32 0, i32 7
%.tmp4020 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4019
store %m981$.Node.type* %.tmp4020, %m981$.Node.type** %param_ptr.3974
br label %.for.start.3972
.for.end.3972:
%.tmp4021 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4022 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4021, i32 0, i32 1
%.tmp4023 = load %m0$.File.type*, %m0$.File.type** %.tmp4022
%.tmp4025 = getelementptr [5 x i8], [5 x i8]*@.str4024, i32 0, i32 0
%.tmp4026 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4023, i8* %.tmp4025)
%.tmp4027 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4029 = getelementptr [9 x i8], [9 x i8]*@.str4028, i32 0, i32 0
%.tmp4030 = bitcast ptr null to i8*
%.tmp4031 = bitcast ptr null to i8*
%.tmp4032 = load %m2638$.Type.type*, %m2638$.Type.type** %return_type.3660
call void(%m2638$.CompilerCtx.type*,i8*,i8*,i8*,%m2638$.Type.type*) @m295$push_scope.v.m2638$.CompilerCtx.typep.cp.cp.cp.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp4027, i8* %.tmp4029, i8* %.tmp4030, i8* %.tmp4031, %m2638$.Type.type* %.tmp4032)
%.tmp4033 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4034 = load %m981$.Node.type*, %m981$.Node.type** %params.3970
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_fn_params.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp4033, %m981$.Node.type* %.tmp4034)
%.tmp4035 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4036 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4035, i32 0, i32 6
%.tmp4037 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4036
%.tmp4039 = getelementptr [6 x i8], [6 x i8]*@.str4038, i32 0, i32 0
%.tmp4040 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp4037, i8* %.tmp4039)
%fn_block.4041 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4040, %m981$.Node.type** %fn_block.4041
%.tmp4042 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4043 = load %m981$.Node.type*, %m981$.Node.type** %fn_block.4041
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_block.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp4042, %m981$.Node.type* %.tmp4043)
%.tmp4044 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
call void(%m2638$.CompilerCtx.type*) @m295$pop_scope.v.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp4044)
%.tmp4045 = bitcast ptr null to %m981$.Node.type*
%last_valid_instruction.4046 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4045, %m981$.Node.type** %last_valid_instruction.4046
%.tmp4047 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4048 = load %m981$.Node.type*, %m981$.Node.type** %fn_block.4041
%.tmp4049 = load %m2638$.Type.type*, %m2638$.Type.type** %return_type.3660
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,%m2638$.Type.type*) @m295$check_n_add_implicit_return.v.m2638$.CompilerCtx.typep.m981$.Node.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp4047, %m981$.Node.type* %.tmp4048, %m2638$.Type.type* %.tmp4049)
%.tmp4050 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4051 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4050, i32 0, i32 1
%.tmp4052 = load %m0$.File.type*, %m0$.File.type** %.tmp4051
%.tmp4054 = getelementptr [3 x i8], [3 x i8]*@.str4053, i32 0, i32 0
%.tmp4055 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4052, i8* %.tmp4054)
br label %.if.end.3943
.if.end.3943:
br label %.if.end.3914
.if.false.3914:
%.tmp4056 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4057 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4056, i32 0, i32 0
%.tmp4058 = load i8*, i8** %.tmp4057
%.tmp4060 = getelementptr [7 x i8], [7 x i8]*@.str4059, i32 0, i32 0
%.tmp4061 = call i32(i8*,i8*) @strcmp(i8* %.tmp4058, i8* %.tmp4060)
%.tmp4062 = icmp eq i32 %.tmp4061, 0
br i1 %.tmp4062, label %.if.true.4063, label %.if.false.4063
.if.true.4063:
%.tmp4064 = load i1, i1* %shallow
%.tmp4065 = icmp eq i1 %.tmp4064, 1
br i1 %.tmp4065, label %.if.true.4066, label %.if.false.4066
.if.true.4066:
%.tmp4067 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4068 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4067, i32 0, i32 6
%.tmp4069 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4068
%.tmp4070 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4069, i32 0, i32 7
%.tmp4071 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4070
%.tmp4072 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4071, i32 0, i32 1
%.tmp4073 = load i8*, i8** %.tmp4072
%mod_name.4074 = alloca i8*
store i8* %.tmp4073, i8** %mod_name.4074
%.tmp4075 = load i8*, i8** %mod_name.4074
%.tmp4076 = call i32(i8*) @strlen(i8* %.tmp4075)
%mod_name_len.4077 = alloca i32
store i32 %.tmp4076, i32* %mod_name_len.4077
%.tmp4078 = load i32, i32* %mod_name_len.4077
%.tmp4079 = sub i32 %.tmp4078, 1
%.tmp4080 = call i8*(i32) @malloc(i32 %.tmp4079)
%trimmed_path.4081 = alloca i8*
store i8* %.tmp4080, i8** %trimmed_path.4081
%i.4083 = alloca i32
store i32 1, i32* %i.4083
br label %.for.start.4082
.for.start.4082:
%.tmp4084 = load i32, i32* %i.4083
%.tmp4085 = load i32, i32* %mod_name_len.4077
%.tmp4086 = sub i32 %.tmp4085, 1
%.tmp4087 = icmp slt i32 %.tmp4084, %.tmp4086
br i1 %.tmp4087, label %.for.continue.4082, label %.for.end.4082
.for.continue.4082:
%.tmp4088 = load i32, i32* %i.4083
%.tmp4089 = sub i32 %.tmp4088, 1
%.tmp4090 = load i8*, i8** %trimmed_path.4081
%.tmp4091 = getelementptr i8, i8* %.tmp4090, i32 %.tmp4089
%.tmp4092 = load i32, i32* %i.4083
%.tmp4093 = load i8*, i8** %mod_name.4074
%.tmp4094 = getelementptr i8, i8* %.tmp4093, i32 %.tmp4092
%.tmp4095 = load i8, i8* %.tmp4094
store i8 %.tmp4095, i8* %.tmp4091
%.tmp4096 = load i32, i32* %i.4083
%.tmp4097 = add i32 %.tmp4096, 1
store i32 %.tmp4097, i32* %i.4083
br label %.for.start.4082
.for.end.4082:
%.tmp4098 = load i32, i32* %mod_name_len.4077
%.tmp4099 = sub i32 %.tmp4098, 2
%.tmp4100 = load i8*, i8** %trimmed_path.4081
%.tmp4101 = getelementptr i8, i8* %.tmp4100, i32 %.tmp4099
store i8 0, i8* %.tmp4101
%.tmp4102 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4103 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4104 = load i8*, i8** %trimmed_path.4081
%.tmp4105 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$resolve_import_path.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp4102, %m981$.Node.type* %.tmp4103, i8* %.tmp4104)
%mod_abspath.4106 = alloca i8*
store i8* %.tmp4105, i8** %mod_abspath.4106
%.tmp4107 = load i8*, i8** %mod_abspath.4106
%.tmp4108 = call i8*(i32) @malloc(i32 4096)
%.tmp4109 = call i8*(i8*,i8*) @realpath(i8* %.tmp4107, i8* %.tmp4108)
%relpath.4110 = alloca i8*
store i8* %.tmp4109, i8** %relpath.4110
%.tmp4111 = load i8*, i8** %relpath.4110
%.tmp4112 = icmp eq i8* %.tmp4111, null
br i1 %.tmp4112, label %.if.true.4113, label %.if.false.4113
.if.true.4113:
%.tmp4114 = getelementptr i8*, i8** %err_buf.3661, i32 0
%.tmp4116 = getelementptr [54 x i8], [54 x i8]*@.str4115, i32 0, i32 0
%.tmp4117 = load i8*, i8** %mod_name.4074
%.tmp4118 = load i8*, i8** %mod_abspath.4106
%.tmp4119 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4114, i8* %.tmp4116, i8* %.tmp4117, i8* %.tmp4118)
%.tmp4120 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4121 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4122 = load i8*, i8** %err_buf.3661
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp4120, %m981$.Node.type* %.tmp4121, i8* %.tmp4122)
ret void
br label %.if.end.4113
.if.false.4113:
br label %.if.end.4113
.if.end.4113:
%.tmp4123 = load i8*, i8** %relpath.4110
store i8* %.tmp4123, i8** %mod_abspath.4106
%m.4124 = alloca %m2638$.ModuleLookup.type*
store %m2638$.ModuleLookup.type* null, %m2638$.ModuleLookup.type** %m.4124
%.tmp4125 = bitcast ptr null to %m2638$.ModuleLookup.type*
%mod.4126 = alloca %m2638$.ModuleLookup.type*
store %m2638$.ModuleLookup.type* %.tmp4125, %m2638$.ModuleLookup.type** %mod.4126
%.tmp4128 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4129 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4128, i32 0, i32 6
%.tmp4130 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %.tmp4129
store %m2638$.ModuleLookup.type* %.tmp4130, %m2638$.ModuleLookup.type** %m.4124
br label %.for.start.4127
.for.start.4127:
%.tmp4131 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.4124
%.tmp4132 = icmp ne %m2638$.ModuleLookup.type* %.tmp4131, null
%.tmp4133 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.4126
%.tmp4134 = icmp eq %m2638$.ModuleLookup.type* %.tmp4133, null
%.tmp4135 = and i1 %.tmp4132, %.tmp4134
br i1 %.tmp4135, label %.for.continue.4127, label %.for.end.4127
.for.continue.4127:
%.tmp4136 = load i8*, i8** %mod_abspath.4106
%.tmp4137 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.4124
%.tmp4138 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp4137, i32 0, i32 0
%.tmp4139 = load i8*, i8** %.tmp4138
%.tmp4140 = call i32(i8*,i8*) @strcmp(i8* %.tmp4136, i8* %.tmp4139)
%.tmp4141 = icmp eq i32 %.tmp4140, 0
br i1 %.tmp4141, label %.if.true.4142, label %.if.false.4142
.if.true.4142:
%.tmp4143 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.4124
store %m2638$.ModuleLookup.type* %.tmp4143, %m2638$.ModuleLookup.type** %mod.4126
br label %.if.end.4142
.if.false.4142:
br label %.if.end.4142
.if.end.4142:
%.tmp4144 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.4124
%.tmp4145 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp4144, i32 0, i32 2
%.tmp4146 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %.tmp4145
store %m2638$.ModuleLookup.type* %.tmp4146, %m2638$.ModuleLookup.type** %m.4124
br label %.for.start.4127
.for.end.4127:
%.tmp4147 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4148 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4147, i32 0, i32 6
%.tmp4149 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4148
%.tmp4150 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4149, i32 0, i32 7
%.tmp4151 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4150
%.tmp4152 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4151, i32 0, i32 7
%.tmp4153 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4152
%.tmp4154 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4153, i32 0, i32 7
%.tmp4155 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4154
%.tmp4156 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4155, i32 0, i32 1
%.tmp4157 = load i8*, i8** %.tmp4156
%asname.4158 = alloca i8*
store i8* %.tmp4157, i8** %asname.4158
%.tmp4159 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.4126
%.tmp4160 = icmp eq %m2638$.ModuleLookup.type* %.tmp4159, null
br i1 %.tmp4160, label %.if.true.4161, label %.if.false.4161
.if.true.4161:
%.tmp4162 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* null, i32 1
%.tmp4163 = ptrtoint %m2638$.ModuleLookup.type* %.tmp4162 to i32
%.tmp4164 = call i8*(i32) @malloc(i32 %.tmp4163)
%.tmp4165 = bitcast i8* %.tmp4164 to %m2638$.ModuleLookup.type*
store %m2638$.ModuleLookup.type* %.tmp4165, %m2638$.ModuleLookup.type** %mod.4126
%.tmp4166 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.4126
%.tmp4167 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp4166, i32 0, i32 0
%.tmp4168 = load i8*, i8** %mod_abspath.4106
store i8* %.tmp4168, i8** %.tmp4167
%.tmp4169 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.4126
%.tmp4170 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp4169, i32 0, i32 2
store %m2638$.ModuleLookup.type* null, %m2638$.ModuleLookup.type** %.tmp4170
%.tmp4171 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.4126
%.tmp4172 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp4171, i32 0, i32 3
store %m2638$.Scope.type* null, %m2638$.Scope.type** %.tmp4172
%.tmp4173 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.4126
%.tmp4174 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp4173, i32 0, i32 1
%.tmp4175 = getelementptr i8*, i8** %.tmp4174, i32 0
%.tmp4177 = getelementptr [5 x i8], [5 x i8]*@.str4176, i32 0, i32 0
%.tmp4178 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4179 = call i32(%m2638$.CompilerCtx.type*) @m295$new_uid.i.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp4178)
%.tmp4180 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4175, i8* %.tmp4177, i32 %.tmp4179)
%.tmp4182 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4183 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4182, i32 0, i32 6
%.tmp4184 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %.tmp4183
store %m2638$.ModuleLookup.type* %.tmp4184, %m2638$.ModuleLookup.type** %m.4124
br label %.for.start.4181
.for.start.4181:
%.tmp4185 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.4124
%.tmp4186 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp4185, i32 0, i32 2
%.tmp4187 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %.tmp4186
%.tmp4188 = icmp ne %m2638$.ModuleLookup.type* %.tmp4187, null
br i1 %.tmp4188, label %.for.continue.4181, label %.for.end.4181
.for.continue.4181:
%.tmp4189 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.4124
%.tmp4190 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp4189, i32 0, i32 2
%.tmp4191 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %.tmp4190
store %m2638$.ModuleLookup.type* %.tmp4191, %m2638$.ModuleLookup.type** %m.4124
br label %.for.start.4181
.for.end.4181:
%.tmp4192 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %m.4124
%.tmp4193 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp4192, i32 0, i32 2
%.tmp4194 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.4126
store %m2638$.ModuleLookup.type* %.tmp4194, %m2638$.ModuleLookup.type** %.tmp4193
%.tmp4195 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4196 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4197 = load i8*, i8** %asname.4158
%.tmp4198 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.4126
%.tmp4199 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp4198, i32 0, i32 0
%.tmp4200 = load i8*, i8** %.tmp4199
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*,i8*) @m295$define_module.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp.cp(%m2638$.CompilerCtx.type* %.tmp4195, %m981$.Node.type* %.tmp4196, i8* %.tmp4197, i8* %.tmp4200)
%.tmp4201 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4202 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4201, i32 0, i32 7
%.tmp4203 = load i8*, i8** %.tmp4202
%curr_mod.4204 = alloca i8*
store i8* %.tmp4203, i8** %curr_mod.4204
%.tmp4205 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4206 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4205, i32 0, i32 7
%.tmp4207 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.4126
%.tmp4208 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp4207, i32 0, i32 0
%.tmp4209 = load i8*, i8** %.tmp4208
store i8* %.tmp4209, i8** %.tmp4206
%.tmp4210 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4211 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4212 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.4126
%.tmp4213 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp4212, i32 0, i32 0
%.tmp4214 = load i8*, i8** %.tmp4213
%.tmp4215 = call i1(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$compile_file.b.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp4210, %m981$.Node.type* %.tmp4211, i8* %.tmp4214)
%.tmp4216 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4217 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4216, i32 0, i32 7
%.tmp4218 = load i8*, i8** %curr_mod.4204
store i8* %.tmp4218, i8** %.tmp4217
br label %.if.end.4161
.if.false.4161:
%.tmp4219 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4220 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4221 = load i8*, i8** %asname.4158
%.tmp4222 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.4126
%.tmp4223 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp4222, i32 0, i32 0
%.tmp4224 = load i8*, i8** %.tmp4223
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*,i8*) @m295$define_module.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp.cp(%m2638$.CompilerCtx.type* %.tmp4219, %m981$.Node.type* %.tmp4220, i8* %.tmp4221, i8* %.tmp4224)
br label %.if.end.4161
.if.end.4161:
br label %.if.end.4066
.if.false.4066:
br label %.if.end.4066
.if.end.4066:
br label %.if.end.4063
.if.false.4063:
%.tmp4225 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4226 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4228 = getelementptr [40 x i8], [40 x i8]*@.str4227, i32 0, i32 0
%.tmp4229 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$err_tmpl.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp4225, %m981$.Node.type* %.tmp4226, i8* %.tmp4228)
%.tmp4230 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4231 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4230, i32 0, i32 0
%.tmp4232 = load i8*, i8** %.tmp4231
%.tmp4233 = call i32(i8*,...) @printf(i8* %.tmp4229, i8* %.tmp4232)
br label %.if.end.4063
.if.end.4063:
br label %.if.end.3914
.if.end.3914:
br label %.if.end.3843
.if.end.3843:
br label %.if.end.3744
.if.end.3744:
br label %.if.end.3678
.if.end.3678:
br label %.if.end.3670
.if.end.3670:
ret void
}
define i8* @m295$err_tmpl.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf.4234 = alloca i8*
store i8* null, i8** %buf.4234
%.tmp4235 = getelementptr i8*, i8** %buf.4234, i32 0
%.tmp4237 = getelementptr [31 x i8], [31 x i8]*@.str4236, i32 0, i32 0
%.tmp4238 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4239 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4238, i32 0, i32 7
%.tmp4240 = load i8*, i8** %.tmp4239
%.tmp4241 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4242 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4241, i32 0, i32 3
%.tmp4243 = load i32, i32* %.tmp4242
%.tmp4244 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4245 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4244, i32 0, i32 4
%.tmp4246 = load i32, i32* %.tmp4245
%.tmp4247 = load i8*, i8** %msg
%.tmp4248 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4235, i8* %.tmp4237, i8* %.tmp4240, i32 %.tmp4243, i32 %.tmp4246, i8* %.tmp4247)
%.tmp4249 = load i8*, i8** %buf.4234
ret i8* %.tmp4249
}
define void @m295$compile_fn_params.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.fn_params.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%fn_params = alloca %m981$.Node.type*
store %m981$.Node.type* %.fn_params.arg, %m981$.Node.type** %fn_params
%param_type.4250 = alloca %m2638$.Type.type*
store %m2638$.Type.type* null, %m2638$.Type.type** %param_type.4250
%.tmp4252 = load %m981$.Node.type*, %m981$.Node.type** %fn_params
%param_ptr.4253 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4252, %m981$.Node.type** %param_ptr.4253
br label %.for.start.4251
.for.start.4251:
%.tmp4254 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.4253
%.tmp4255 = icmp ne %m981$.Node.type* %.tmp4254, null
br i1 %.tmp4255, label %.for.continue.4251, label %.for.end.4251
.for.continue.4251:
%.tmp4256 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.4253
%.tmp4257 = load %m981$.Node.type*, %m981$.Node.type** %fn_params
%.tmp4258 = icmp ne %m981$.Node.type* %.tmp4256, %.tmp4257
br i1 %.tmp4258, label %.if.true.4259, label %.if.false.4259
.if.true.4259:
%.tmp4260 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.4253
%.tmp4261 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4260, i32 0, i32 7
%.tmp4262 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4261
store %m981$.Node.type* %.tmp4262, %m981$.Node.type** %param_ptr.4253
br label %.if.end.4259
.if.false.4259:
br label %.if.end.4259
.if.end.4259:
%.tmp4263 = load %m981$.Node.type*, %m981$.Node.type** %fn_params
%.tmp4264 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp4263)
%param_info.4265 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp4264, %m2638$.AssignableInfo.type** %param_info.4265
%.tmp4266 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %param_info.4265
%.tmp4267 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4266, i32 0, i32 3
%.tmp4269 = getelementptr [9 x i8], [9 x i8]*@.str4268, i32 0, i32 0
store i8* %.tmp4269, i8** %.tmp4267
%.tmp4270 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.4253
%.tmp4271 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4270, i32 0, i32 0
%.tmp4272 = load i8*, i8** %.tmp4271
%.tmp4274 = getelementptr [5 x i8], [5 x i8]*@.str4273, i32 0, i32 0
%.tmp4275 = call i32(i8*,i8*) @strcmp(i8* %.tmp4272, i8* %.tmp4274)
%.tmp4276 = icmp eq i32 %.tmp4275, 0
br i1 %.tmp4276, label %.if.true.4277, label %.if.false.4277
.if.true.4277:
%.tmp4278 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4279 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.4253
%.tmp4280 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4279, i32 0, i32 6
%.tmp4281 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4280
%.tmp4282 = call %m2638$.Type.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$node_to_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp4278, %m981$.Node.type* %.tmp4281)
store %m2638$.Type.type* %.tmp4282, %m2638$.Type.type** %param_type.4250
%.tmp4283 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.4253
%.tmp4284 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4283, i32 0, i32 7
%.tmp4285 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4284
store %m981$.Node.type* %.tmp4285, %m981$.Node.type** %param_ptr.4253
br label %.if.end.4277
.if.false.4277:
br label %.if.end.4277
.if.end.4277:
%.tmp4286 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %param_info.4265
%.tmp4287 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4286, i32 0, i32 4
%.tmp4288 = load %m2638$.Type.type*, %m2638$.Type.type** %param_type.4250
store %m2638$.Type.type* %.tmp4288, %m2638$.Type.type** %.tmp4287
%.tmp4289 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.4253
%.tmp4290 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4289, i32 0, i32 1
%.tmp4291 = load i8*, i8** %.tmp4290
%var_name.4292 = alloca i8*
store i8* %.tmp4291, i8** %var_name.4292
%.tmp4293 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %param_info.4265
%.tmp4294 = load i8, i8* @SCOPE_LOCAL
%.tmp4295 = load i8*, i8** %var_name.4292
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp4293, i8 %.tmp4294, i8* %.tmp4295)
%.tmp4296 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4297 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %param_info.4265
%.tmp4298 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4297, i32 0, i32 4
%.tmp4299 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4298
%.tmp4300 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp4296, %m2638$.Type.type* %.tmp4299)
%param_info_tr.4301 = alloca i8*
store i8* %.tmp4300, i8** %param_info_tr.4301
%.tmp4302 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4303 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4302, i32 0, i32 1
%.tmp4304 = load %m0$.File.type*, %m0$.File.type** %.tmp4303
%.tmp4306 = getelementptr [16 x i8], [16 x i8]*@.str4305, i32 0, i32 0
%.tmp4307 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %param_info.4265
%.tmp4308 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp4307)
%.tmp4309 = load i8*, i8** %param_info_tr.4301
%.tmp4310 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4304, i8* %.tmp4306, i8* %.tmp4308, i8* %.tmp4309)
%.tmp4311 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4312 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.4253
%.tmp4313 = load i8*, i8** %var_name.4292
%.tmp4314 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %param_info.4265
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*,%m2638$.AssignableInfo.type*) @m295$define_assignable.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp4311, %m981$.Node.type* %.tmp4312, i8* %.tmp4313, %m2638$.AssignableInfo.type* %.tmp4314)
%.tmp4315 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4316 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4315, i32 0, i32 1
%.tmp4317 = load %m0$.File.type*, %m0$.File.type** %.tmp4316
%.tmp4319 = getelementptr [28 x i8], [28 x i8]*@.str4318, i32 0, i32 0
%.tmp4320 = load i8*, i8** %param_info_tr.4301
%.tmp4321 = load i8*, i8** %var_name.4292
%.tmp4322 = load i8*, i8** %param_info_tr.4301
%.tmp4323 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %param_info.4265
%.tmp4324 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp4323)
%.tmp4325 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4317, i8* %.tmp4319, i8* %.tmp4320, i8* %.tmp4321, i8* %.tmp4322, i8* %.tmp4324)
%.tmp4326 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.4253
%.tmp4327 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4326, i32 0, i32 7
%.tmp4328 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4327
store %m981$.Node.type* %.tmp4328, %m981$.Node.type** %param_ptr.4253
br label %.for.start.4251
.for.end.4251:
ret void
}
define void @m295$compile_block.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%.tmp4329 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4331 = getelementptr [6 x i8], [6 x i8]*@.str4330, i32 0, i32 0
%.tmp4332 = bitcast ptr null to i8*
%.tmp4333 = bitcast ptr null to i8*
%.tmp4334 = bitcast ptr null to %m2638$.Type.type*
call void(%m2638$.CompilerCtx.type*,i8*,i8*,i8*,%m2638$.Type.type*) @m295$push_scope.v.m2638$.CompilerCtx.typep.cp.cp.cp.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp4329, i8* %.tmp4331, i8* %.tmp4332, i8* %.tmp4333, %m2638$.Type.type* %.tmp4334)
%.tmp4335 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4336 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4335, i32 0, i32 6
%.tmp4337 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4336
%.tmp4339 = getelementptr [12 x i8], [12 x i8]*@.str4338, i32 0, i32 0
%.tmp4340 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp4337, i8* %.tmp4339)
%exprs.4341 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4340, %m981$.Node.type** %exprs.4341
%.tmp4342 = load %m981$.Node.type*, %m981$.Node.type** %exprs.4341
%.tmp4343 = icmp ne %m981$.Node.type* %.tmp4342, null
br i1 %.tmp4343, label %.if.true.4344, label %.if.false.4344
.if.true.4344:
%.tmp4346 = load %m981$.Node.type*, %m981$.Node.type** %exprs.4341
%.tmp4347 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4346, i32 0, i32 6
%.tmp4348 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4347
%b.4349 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4348, %m981$.Node.type** %b.4349
br label %.for.start.4345
.for.start.4345:
%.tmp4350 = load %m981$.Node.type*, %m981$.Node.type** %b.4349
%.tmp4351 = icmp ne %m981$.Node.type* %.tmp4350, null
br i1 %.tmp4351, label %.for.continue.4345, label %.for.end.4345
.for.continue.4345:
%.tmp4352 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4353 = load %m981$.Node.type*, %m981$.Node.type** %b.4349
%.tmp4354 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4353, i32 0, i32 6
%.tmp4355 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4354
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_expression.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp4352, %m981$.Node.type* %.tmp4355)
%.tmp4356 = load %m981$.Node.type*, %m981$.Node.type** %b.4349
%.tmp4357 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4356, i32 0, i32 7
%.tmp4358 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4357
store %m981$.Node.type* %.tmp4358, %m981$.Node.type** %b.4349
br label %.for.start.4345
.for.end.4345:
br label %.if.end.4344
.if.false.4344:
br label %.if.end.4344
.if.end.4344:
%.tmp4359 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
call void(%m2638$.CompilerCtx.type*) @m295$pop_scope.v.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp4359)
ret void
}
define %m2638$.AssignableInfo.type* @m295$get_struct_attr.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep.i(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp4360 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4361 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4362 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_addr.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp4360, %m981$.Node.type* %.tmp4361)
%val.4363 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp4362, %m2638$.AssignableInfo.type** %val.4363
%.tmp4364 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %val.4363
%.tmp4365 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4364, i32 0, i32 4
%.tmp4366 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4365
%.tmp4367 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4366, i32 0, i32 0
%.tmp4368 = load i8*, i8** %.tmp4367
%.tmp4370 = getelementptr [7 x i8], [7 x i8]*@.str4369, i32 0, i32 0
%.tmp4371 = call i32(i8*,i8*) @strcmp(i8* %.tmp4368, i8* %.tmp4370)
%.tmp4372 = icmp ne i32 %.tmp4371, 0
br i1 %.tmp4372, label %.if.true.4373, label %.if.false.4373
.if.true.4373:
%.tmp4375 = getelementptr [7 x i8], [7 x i8]*@.str4374, i32 0, i32 0
%.tmp4376 = call i32(i8*,...) @printf(i8* %.tmp4375)
%.tmp4377 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp4377
br label %.if.end.4373
.if.false.4373:
br label %.if.end.4373
.if.end.4373:
%.tmp4378 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %val.4363
%.tmp4379 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4378, i32 0, i32 4
%.tmp4380 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4379
%.tmp4381 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4380, i32 0, i32 3
%.tmp4382 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4381
%node_type.4383 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp4382, %m2638$.Type.type** %node_type.4383
%i.4385 = alloca i32
store i32 0, i32* %i.4385
br label %.for.start.4384
.for.start.4384:
%.tmp4386 = load i32, i32* %i.4385
%.tmp4387 = load i32, i32* %attr_id
%.tmp4388 = icmp slt i32 %.tmp4386, %.tmp4387
br i1 %.tmp4388, label %.for.continue.4384, label %.for.end.4384
.for.continue.4384:
%.tmp4389 = load %m2638$.Type.type*, %m2638$.Type.type** %node_type.4383
%.tmp4390 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4389, i32 0, i32 4
%.tmp4391 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4390
store %m2638$.Type.type* %.tmp4391, %m2638$.Type.type** %node_type.4383
%.tmp4392 = load i32, i32* %i.4385
%.tmp4393 = add i32 %.tmp4392, 1
store i32 %.tmp4393, i32* %i.4385
br label %.for.start.4384
.for.end.4384:
%.tmp4394 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4395 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp4394)
%info.4396 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp4395, %m2638$.AssignableInfo.type** %info.4396
%.tmp4397 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4396
%.tmp4398 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4397, i32 0, i32 4
%.tmp4399 = load %m2638$.Type.type*, %m2638$.Type.type** %node_type.4383
store %m2638$.Type.type* %.tmp4399, %m2638$.Type.type** %.tmp4398
%.tmp4400 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4401 = call i32(%m2638$.CompilerCtx.type*) @m295$new_uid.i.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp4400)
%tmp_id.4402 = alloca i32
store i32 %.tmp4401, i32* %tmp_id.4402
%.tmp4403 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4404 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %val.4363
%.tmp4405 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4404, i32 0, i32 4
%.tmp4406 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4405
%.tmp4407 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp4403, %m2638$.Type.type* %.tmp4406)
%type_as_str.4408 = alloca i8*
store i8* %.tmp4407, i8** %type_as_str.4408
%.tmp4409 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4410 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4396
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp4409, %m2638$.AssignableInfo.type* %.tmp4410)
%.tmp4411 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4412 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4411, i32 0, i32 1
%.tmp4413 = load %m0$.File.type*, %m0$.File.type** %.tmp4412
%.tmp4415 = getelementptr [52 x i8], [52 x i8]*@.str4414, i32 0, i32 0
%.tmp4416 = load i32, i32* %tmp_id.4402
%.tmp4417 = load i8*, i8** %type_as_str.4408
%.tmp4418 = load i8*, i8** %type_as_str.4408
%.tmp4419 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %val.4363
%.tmp4420 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp4419)
%.tmp4421 = load i32, i32* %attr_id
%.tmp4422 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4413, i8* %.tmp4415, i32 %.tmp4416, i8* %.tmp4417, i8* %.tmp4418, i8* %.tmp4420, i32 %.tmp4421)
%.tmp4423 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4424 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4423, i32 0, i32 1
%.tmp4425 = load %m0$.File.type*, %m0$.File.type** %.tmp4424
%.tmp4427 = getelementptr [28 x i8], [28 x i8]*@.str4426, i32 0, i32 0
%.tmp4428 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4396
%.tmp4429 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp4428)
%.tmp4430 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4431 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4396
%.tmp4432 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4431, i32 0, i32 4
%.tmp4433 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4432
%.tmp4434 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp4430, %m2638$.Type.type* %.tmp4433)
%.tmp4435 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4436 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4396
%.tmp4437 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4436, i32 0, i32 4
%.tmp4438 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4437
%.tmp4439 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp4435, %m2638$.Type.type* %.tmp4438)
%.tmp4440 = load i32, i32* %tmp_id.4402
%.tmp4441 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4425, i8* %.tmp4427, i8* %.tmp4429, i8* %.tmp4434, i8* %.tmp4439, i32 %.tmp4440)
%.tmp4442 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4396
ret %m2638$.AssignableInfo.type* %.tmp4442
}
define void @m295$set_struct_attr.v.m2638$.CompilerCtx.typep.m981$.Node.typep.i.cp(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg, i32 %.attr_id.arg, i8* %.attr.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%attr = alloca i8*
store i8* %.attr.arg, i8** %attr
%.tmp4443 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4444 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4445 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_addr.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp4443, %m981$.Node.type* %.tmp4444)
%val.4446 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp4445, %m2638$.AssignableInfo.type** %val.4446
%.tmp4447 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %val.4446
%.tmp4448 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4447, i32 0, i32 4
%.tmp4449 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4448
%.tmp4450 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4449, i32 0, i32 0
%.tmp4451 = load i8*, i8** %.tmp4450
%.tmp4453 = getelementptr [7 x i8], [7 x i8]*@.str4452, i32 0, i32 0
%.tmp4454 = call i32(i8*,i8*) @strcmp(i8* %.tmp4451, i8* %.tmp4453)
%.tmp4455 = icmp ne i32 %.tmp4454, 0
br i1 %.tmp4455, label %.if.true.4456, label %.if.false.4456
.if.true.4456:
%.tmp4458 = getelementptr [7 x i8], [7 x i8]*@.str4457, i32 0, i32 0
%.tmp4459 = call i32(i8*,...) @printf(i8* %.tmp4458)
ret void
br label %.if.end.4456
.if.false.4456:
br label %.if.end.4456
.if.end.4456:
%.tmp4460 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %val.4446
%.tmp4461 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4460, i32 0, i32 4
%.tmp4462 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4461
%.tmp4463 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4462, i32 0, i32 3
%.tmp4464 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4463
%node_type.4465 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp4464, %m2638$.Type.type** %node_type.4465
%i.4467 = alloca i32
store i32 0, i32* %i.4467
br label %.for.start.4466
.for.start.4466:
%.tmp4468 = load i32, i32* %i.4467
%.tmp4469 = load i32, i32* %attr_id
%.tmp4470 = icmp slt i32 %.tmp4468, %.tmp4469
br i1 %.tmp4470, label %.for.continue.4466, label %.for.end.4466
.for.continue.4466:
%.tmp4471 = load %m2638$.Type.type*, %m2638$.Type.type** %node_type.4465
%.tmp4472 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4471, i32 0, i32 4
%.tmp4473 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4472
store %m2638$.Type.type* %.tmp4473, %m2638$.Type.type** %node_type.4465
%.tmp4474 = load i32, i32* %i.4467
%.tmp4475 = add i32 %.tmp4474, 1
store i32 %.tmp4475, i32* %i.4467
br label %.for.start.4466
.for.end.4466:
%.tmp4476 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4477 = call i32(%m2638$.CompilerCtx.type*) @m295$new_uid.i.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp4476)
%tmp_id.4478 = alloca i32
store i32 %.tmp4477, i32* %tmp_id.4478
%.tmp4479 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4480 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %val.4446
%.tmp4481 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4480, i32 0, i32 4
%.tmp4482 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4481
%.tmp4483 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp4479, %m2638$.Type.type* %.tmp4482)
%type_as_str.4484 = alloca i8*
store i8* %.tmp4483, i8** %type_as_str.4484
%.tmp4485 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4486 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4485, i32 0, i32 1
%.tmp4487 = load %m0$.File.type*, %m0$.File.type** %.tmp4486
%.tmp4489 = getelementptr [52 x i8], [52 x i8]*@.str4488, i32 0, i32 0
%.tmp4490 = load i32, i32* %tmp_id.4478
%.tmp4491 = load i8*, i8** %type_as_str.4484
%.tmp4492 = load i8*, i8** %type_as_str.4484
%.tmp4493 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %val.4446
%.tmp4494 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp4493)
%.tmp4495 = load i32, i32* %attr_id
%.tmp4496 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4487, i8* %.tmp4489, i32 %.tmp4490, i8* %.tmp4491, i8* %.tmp4492, i8* %.tmp4494, i32 %.tmp4495)
%.tmp4497 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4498 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4497, i32 0, i32 1
%.tmp4499 = load %m0$.File.type*, %m0$.File.type** %.tmp4498
%.tmp4501 = getelementptr [18 x i8], [18 x i8]*@.str4500, i32 0, i32 0
%.tmp4502 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4503 = load %m2638$.Type.type*, %m2638$.Type.type** %node_type.4465
%.tmp4504 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp4502, %m2638$.Type.type* %.tmp4503)
%.tmp4505 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4506 = load %m2638$.Type.type*, %m2638$.Type.type** %node_type.4465
%.tmp4507 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp4505, %m2638$.Type.type* %.tmp4506)
%.tmp4508 = load i8*, i8** %attr
%.tmp4509 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4499, i8* %.tmp4501, i8* %.tmp4504, i8* %.tmp4507, i8* %.tmp4508)
ret void
}
define %m2638$.AssignableInfo.type* @m295$compile_builtin.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%.tmp4510 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4511 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4510, i32 0, i32 6
%.tmp4512 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4511
%.tmp4513 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4512, i32 0, i32 6
%.tmp4514 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4513
%dotted.4515 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4514, %m981$.Node.type** %dotted.4515
%.tmp4516 = load %m981$.Node.type*, %m981$.Node.type** %dotted.4515
%.tmp4517 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4516, i32 0, i32 7
%.tmp4518 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4517
%.tmp4519 = icmp ne %m981$.Node.type* %.tmp4518, null
br i1 %.tmp4519, label %.if.true.4520, label %.if.false.4520
.if.true.4520:
%.tmp4521 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp4521
br label %.if.end.4520
.if.false.4520:
br label %.if.end.4520
.if.end.4520:
%.tmp4522 = load %m981$.Node.type*, %m981$.Node.type** %dotted.4515
%.tmp4523 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4522, i32 0, i32 1
%.tmp4524 = load i8*, i8** %.tmp4523
%.tmp4526 = getelementptr [7 x i8], [7 x i8]*@.str4525, i32 0, i32 0
%.tmp4527 = call i32(i8*,i8*) @strcmp(i8* %.tmp4524, i8* %.tmp4526)
%.tmp4528 = icmp eq i32 %.tmp4527, 0
br i1 %.tmp4528, label %.if.true.4529, label %.if.false.4529
.if.true.4529:
%.tmp4530 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4532 = getelementptr [8 x i8], [8 x i8]*@.str4531, i32 0, i32 0
%.tmp4533 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp4530, i8* %.tmp4532)
%args.4534 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4533, %m981$.Node.type** %args.4534
%.tmp4535 = load %m981$.Node.type*, %m981$.Node.type** %args.4534
%.tmp4536 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4535, i32 0, i32 6
%.tmp4537 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4536
%.tmp4539 = getelementptr [11 x i8], [11 x i8]*@.str4538, i32 0, i32 0
%.tmp4540 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp4537, i8* %.tmp4539)
%value.4541 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4540, %m981$.Node.type** %value.4541
%.tmp4542 = load %m981$.Node.type*, %m981$.Node.type** %value.4541
%.tmp4543 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4542, i32 0, i32 6
%.tmp4544 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4543
%.tmp4545 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4544, i32 0, i32 6
%.tmp4546 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4545
%.tmp4547 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4546, i32 0, i32 6
%.tmp4548 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4547
%.tmp4549 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4548, i32 0, i32 6
%.tmp4550 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4549
store %m981$.Node.type* %.tmp4550, %m981$.Node.type** %value.4541
%.tmp4551 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4552 = call i32(%m2638$.CompilerCtx.type*) @m295$new_uid.i.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp4551)
%tmp_id.4553 = alloca i32
store i32 %.tmp4552, i32* %tmp_id.4553
%.tmp4554 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4555 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp4554)
%info.4556 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp4555, %m2638$.AssignableInfo.type** %info.4556
%.tmp4557 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4558 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4556
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp4557, %m2638$.AssignableInfo.type* %.tmp4558)
%.tmp4559 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4556
%.tmp4560 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4559, i32 0, i32 4
%.tmp4561 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp4561, %m2638$.Type.type** %.tmp4560
%.tmp4562 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4556
%.tmp4563 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4562, i32 0, i32 4
%.tmp4564 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4563
%.tmp4565 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4564, i32 0, i32 0
%.tmp4567 = getelementptr [4 x i8], [4 x i8]*@.str4566, i32 0, i32 0
store i8* %.tmp4567, i8** %.tmp4565
%.tmp4568 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4569 = load %m981$.Node.type*, %m981$.Node.type** %value.4541
%.tmp4570 = call %m2638$.Type.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$node_to_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp4568, %m981$.Node.type* %.tmp4569)
%inspected_type.4571 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp4570, %m2638$.Type.type** %inspected_type.4571
%.tmp4572 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4573 = load %m2638$.Type.type*, %m2638$.Type.type** %inspected_type.4571
%.tmp4574 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp4572, %m2638$.Type.type* %.tmp4573)
%type_as_str.4575 = alloca i8*
store i8* %.tmp4574, i8** %type_as_str.4575
%.tmp4576 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4577 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4576, i32 0, i32 1
%.tmp4578 = load %m0$.File.type*, %m0$.File.type** %.tmp4577
%.tmp4580 = getelementptr [46 x i8], [46 x i8]*@.str4579, i32 0, i32 0
%.tmp4581 = load i32, i32* %tmp_id.4553
%.tmp4582 = load i8*, i8** %type_as_str.4575
%.tmp4583 = load i8*, i8** %type_as_str.4575
%.tmp4584 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4578, i8* %.tmp4580, i32 %.tmp4581, i8* %.tmp4582, i8* %.tmp4583)
%.tmp4585 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4586 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4585, i32 0, i32 1
%.tmp4587 = load %m0$.File.type*, %m0$.File.type** %.tmp4586
%.tmp4589 = getelementptr [35 x i8], [35 x i8]*@.str4588, i32 0, i32 0
%.tmp4590 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4556
%.tmp4591 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp4590)
%.tmp4592 = load i8*, i8** %type_as_str.4575
%.tmp4593 = load i32, i32* %tmp_id.4553
%.tmp4594 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4587, i8* %.tmp4589, i8* %.tmp4591, i8* %.tmp4592, i32 %.tmp4593)
%.tmp4595 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4556
ret %m2638$.AssignableInfo.type* %.tmp4595
br label %.if.end.4529
.if.false.4529:
%.tmp4596 = load %m981$.Node.type*, %m981$.Node.type** %dotted.4515
%.tmp4597 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4596, i32 0, i32 1
%.tmp4598 = load i8*, i8** %.tmp4597
%.tmp4600 = getelementptr [7 x i8], [7 x i8]*@.str4599, i32 0, i32 0
%.tmp4601 = call i32(i8*,i8*) @strcmp(i8* %.tmp4598, i8* %.tmp4600)
%.tmp4602 = icmp eq i32 %.tmp4601, 0
br i1 %.tmp4602, label %.if.true.4603, label %.if.false.4603
.if.true.4603:
%.tmp4604 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4606 = getelementptr [8 x i8], [8 x i8]*@.str4605, i32 0, i32 0
%.tmp4607 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp4604, i8* %.tmp4606)
%args.4608 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4607, %m981$.Node.type** %args.4608
%.tmp4609 = load %m981$.Node.type*, %m981$.Node.type** %args.4608
%.tmp4610 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4609, i32 0, i32 6
%.tmp4611 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4610
%.tmp4613 = getelementptr [11 x i8], [11 x i8]*@.str4612, i32 0, i32 0
%.tmp4614 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp4611, i8* %.tmp4613)
%array.4615 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4614, %m981$.Node.type** %array.4615
%.tmp4616 = load %m981$.Node.type*, %m981$.Node.type** %array.4615
%.tmp4617 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4616, i32 0, i32 7
%.tmp4618 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4617
%.tmp4620 = getelementptr [11 x i8], [11 x i8]*@.str4619, i32 0, i32 0
%.tmp4621 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp4618, i8* %.tmp4620)
%value.4622 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4621, %m981$.Node.type** %value.4622
%.tmp4623 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4624 = load %m981$.Node.type*, %m981$.Node.type** %value.4622
%.tmp4625 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_assignable.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp4623, %m981$.Node.type* %.tmp4624)
%value_info.4626 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp4625, %m2638$.AssignableInfo.type** %value_info.4626
%.tmp4627 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4628 = load %m981$.Node.type*, %m981$.Node.type** %array.4615
%.tmp4629 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_addr.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp4627, %m981$.Node.type* %.tmp4628)
%array_info.4630 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp4629, %m2638$.AssignableInfo.type** %array_info.4630
%.tmp4631 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4632 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp4631)
%info.4633 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp4632, %m2638$.AssignableInfo.type** %info.4633
%.tmp4634 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4635 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4633
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp4634, %m2638$.AssignableInfo.type* %.tmp4635)
%.tmp4636 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4633
%.tmp4637 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4636, i32 0, i32 4
%.tmp4638 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %array_info.4630
%.tmp4639 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4638, i32 0, i32 4
%.tmp4640 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4639
store %m2638$.Type.type* %.tmp4640, %m2638$.Type.type** %.tmp4637
%builtin_prefix.4641 = alloca i8*
store i8* null, i8** %builtin_prefix.4641
%.tmp4642 = getelementptr i8*, i8** %builtin_prefix.4641, i32 0
%.tmp4644 = getelementptr [5 x i8], [5 x i8]*@.str4643, i32 0, i32 0
%.tmp4645 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4646 = call i32(%m2638$.CompilerCtx.type*) @m295$new_uid.i.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp4645)
%.tmp4647 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4642, i8* %.tmp4644, i32 %.tmp4646)
%.tmp4648 = call i8*() @m2189$append_tmpl.cp()
%tmpl.4649 = alloca i8*
store i8* %.tmp4648, i8** %tmpl.4649
%.tmp4650 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4651 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4650, i32 0, i32 1
%.tmp4652 = load %m0$.File.type*, %m0$.File.type** %.tmp4651
%.tmp4653 = load i8*, i8** %tmpl.4649
%.tmp4654 = load i8*, i8** %builtin_prefix.4641
%.tmp4655 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4656 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %array_info.4630
%.tmp4657 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4656, i32 0, i32 4
%.tmp4658 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4657
%.tmp4659 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp4655, %m2638$.Type.type* %.tmp4658)
%.tmp4660 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %array_info.4630
%.tmp4661 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp4660)
%.tmp4662 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4663 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %value_info.4626
%.tmp4664 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4663, i32 0, i32 4
%.tmp4665 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4664
%.tmp4666 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp4662, %m2638$.Type.type* %.tmp4665)
%.tmp4667 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %value_info.4626
%.tmp4668 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp4667)
%.tmp4669 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4633
%.tmp4670 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp4669)
%.tmp4671 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4652, i8* %.tmp4653, i8* %.tmp4654, i8* %.tmp4659, i8* %.tmp4661, i8* %.tmp4666, i8* %.tmp4668, i8* %.tmp4670)
%.tmp4672 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4673 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp4672)
%info_g.4674 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp4673, %m2638$.AssignableInfo.type** %info_g.4674
%.tmp4675 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_g.4674
%.tmp4676 = load i8, i8* @SCOPE_GLOBAL
%.tmp4678 = getelementptr [8 x i8], [8 x i8]*@.str4677, i32 0, i32 0
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp4675, i8 %.tmp4676, i8* %.tmp4678)
%.tmp4679 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_g.4674
%.tmp4680 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4679, i32 0, i32 4
%.tmp4681 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp4681, %m2638$.Type.type** %.tmp4680
%.tmp4682 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_g.4674
%.tmp4683 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4682, i32 0, i32 4
%.tmp4684 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4683
%.tmp4685 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4684, i32 0, i32 0
%.tmp4687 = getelementptr [9 x i8], [9 x i8]*@.str4686, i32 0, i32 0
store i8* %.tmp4687, i8** %.tmp4685
%.tmp4688 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_g.4674
%.tmp4689 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4688, i32 0, i32 4
%.tmp4690 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4689
%.tmp4691 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4690, i32 0, i32 3
%.tmp4692 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp4692, %m2638$.Type.type** %.tmp4691
%.tmp4693 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_g.4674
%.tmp4694 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4693, i32 0, i32 4
%.tmp4695 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4694
%.tmp4696 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4695, i32 0, i32 3
%.tmp4697 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4696
%.tmp4698 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4697, i32 0, i32 0
%.tmp4700 = getelementptr [4 x i8], [4 x i8]*@.str4699, i32 0, i32 0
store i8* %.tmp4700, i8** %.tmp4698
%.tmp4701 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_g.4674
%.tmp4702 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4701, i32 0, i32 4
%.tmp4703 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4702
%.tmp4704 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4703, i32 0, i32 3
%.tmp4705 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4704
%.tmp4706 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4705, i32 0, i32 3
%.tmp4707 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp4707, %m2638$.Type.type** %.tmp4706
%.tmp4708 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_g.4674
%.tmp4709 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4708, i32 0, i32 4
%.tmp4710 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4709
%.tmp4711 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4710, i32 0, i32 3
%.tmp4712 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4711
%.tmp4713 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4712, i32 0, i32 3
%.tmp4714 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4713
%.tmp4715 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4714, i32 0, i32 0
%.tmp4717 = getelementptr [4 x i8], [4 x i8]*@.str4716, i32 0, i32 0
store i8* %.tmp4717, i8** %.tmp4715
%.tmp4718 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_g.4674
%.tmp4719 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4718, i32 0, i32 4
%.tmp4720 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4719
%.tmp4721 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4720, i32 0, i32 3
%.tmp4722 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4721
%.tmp4723 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4722, i32 0, i32 4
%.tmp4724 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp4724, %m2638$.Type.type** %.tmp4723
%.tmp4725 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_g.4674
%.tmp4726 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4725, i32 0, i32 4
%.tmp4727 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4726
%.tmp4728 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4727, i32 0, i32 3
%.tmp4729 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4728
%.tmp4730 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4729, i32 0, i32 4
%.tmp4731 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4730
%.tmp4732 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4731, i32 0, i32 0
%.tmp4734 = getelementptr [4 x i8], [4 x i8]*@.str4733, i32 0, i32 0
store i8* %.tmp4734, i8** %.tmp4732
%.tmp4735 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_g.4674
%.tmp4736 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4735, i32 0, i32 4
%.tmp4737 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4736
%.tmp4738 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4737, i32 0, i32 3
%.tmp4739 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4738
%.tmp4740 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4739, i32 0, i32 4
%.tmp4741 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4740
%.tmp4742 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4741, i32 0, i32 3
%.tmp4743 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp4743, %m2638$.Type.type** %.tmp4742
%.tmp4744 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_g.4674
%.tmp4745 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4744, i32 0, i32 4
%.tmp4746 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4745
%.tmp4747 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4746, i32 0, i32 3
%.tmp4748 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4747
%.tmp4749 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4748, i32 0, i32 4
%.tmp4750 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4749
%.tmp4751 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4750, i32 0, i32 3
%.tmp4752 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4751
%.tmp4753 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4752, i32 0, i32 0
%.tmp4755 = getelementptr [4 x i8], [4 x i8]*@.str4754, i32 0, i32 0
store i8* %.tmp4755, i8** %.tmp4753
%.tmp4756 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_g.4674
%.tmp4757 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4756, i32 0, i32 4
%.tmp4758 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4757
%.tmp4759 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4758, i32 0, i32 3
%.tmp4760 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4759
%.tmp4761 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4760, i32 0, i32 4
%.tmp4762 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4761
%.tmp4763 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4762, i32 0, i32 4
%.tmp4764 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp4764, %m2638$.Type.type** %.tmp4763
%.tmp4765 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_g.4674
%.tmp4766 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4765, i32 0, i32 4
%.tmp4767 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4766
%.tmp4768 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4767, i32 0, i32 3
%.tmp4769 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4768
%.tmp4770 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4769, i32 0, i32 4
%.tmp4771 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4770
%.tmp4772 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4771, i32 0, i32 4
%.tmp4773 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4772
%.tmp4774 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4773, i32 0, i32 0
%.tmp4776 = getelementptr [4 x i8], [4 x i8]*@.str4775, i32 0, i32 0
store i8* %.tmp4776, i8** %.tmp4774
%.tmp4777 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4779 = getelementptr [8 x i8], [8 x i8]*@.str4778, i32 0, i32 0
%.tmp4781 = getelementptr [7 x i8], [7 x i8]*@.str4780, i32 0, i32 0
%.tmp4782 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_g.4674
call void(%m2638$.CompilerCtx.type*,i8*,i8*,%m2638$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2638$.CompilerCtx.typep.cp.cp.m2638$.AssignableInfo.typep.b.b(%m2638$.CompilerCtx.type* %.tmp4777, i8* %.tmp4779, i8* %.tmp4781, %m2638$.AssignableInfo.type* %.tmp4782, i1 1, i1 0)
%.tmp4783 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4633
ret %m2638$.AssignableInfo.type* %.tmp4783
br label %.if.end.4603
.if.false.4603:
%.tmp4784 = load %m981$.Node.type*, %m981$.Node.type** %dotted.4515
%.tmp4785 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4784, i32 0, i32 1
%.tmp4786 = load i8*, i8** %.tmp4785
%.tmp4788 = getelementptr [4 x i8], [4 x i8]*@.str4787, i32 0, i32 0
%.tmp4789 = call i32(i8*,i8*) @strcmp(i8* %.tmp4786, i8* %.tmp4788)
%.tmp4790 = icmp eq i32 %.tmp4789, 0
br i1 %.tmp4790, label %.if.true.4791, label %.if.false.4791
.if.true.4791:
%.tmp4792 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4794 = getelementptr [8 x i8], [8 x i8]*@.str4793, i32 0, i32 0
%.tmp4795 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp4792, i8* %.tmp4794)
%args.4796 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4795, %m981$.Node.type** %args.4796
%.tmp4797 = load %m981$.Node.type*, %m981$.Node.type** %args.4796
%.tmp4798 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4797, i32 0, i32 6
%.tmp4799 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4798
%.tmp4801 = getelementptr [11 x i8], [11 x i8]*@.str4800, i32 0, i32 0
%.tmp4802 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp4799, i8* %.tmp4801)
%value.4803 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4802, %m981$.Node.type** %value.4803
%.tmp4804 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4805 = load %m981$.Node.type*, %m981$.Node.type** %value.4803
%.tmp4806 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i32) @m295$get_struct_attr.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep.i(%m2638$.CompilerCtx.type* %.tmp4804, %m981$.Node.type* %.tmp4805, i32 1)
ret %m2638$.AssignableInfo.type* %.tmp4806
br label %.if.end.4791
.if.false.4791:
br label %.if.end.4791
.if.end.4791:
br label %.if.end.4603
.if.end.4603:
br label %.if.end.4529
.if.end.4529:
%.tmp4807 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp4807
}
define i8* @m295$resolve_import_path.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg, i8* %.import_str.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%import_str = alloca i8*
store i8* %.import_str.arg, i8** %import_str
%.tmp4809 = getelementptr [1 x i8], [1 x i8]*@.str4808, i32 0, i32 0
%err_buf.4810 = alloca i8*
store i8* %.tmp4809, i8** %err_buf.4810
%.tmp4811 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4812 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4811, i32 0, i32 7
%.tmp4813 = load i8*, i8** %.tmp4812
%mod_abspath.4814 = alloca i8*
store i8* %.tmp4813, i8** %mod_abspath.4814
%.tmp4815 = load i8*, i8** %mod_abspath.4814
%.tmp4816 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp4815)
%dirname.4817 = alloca i8*
store i8* %.tmp4816, i8** %dirname.4817
%.tmp4818 = load i8*, i8** %import_str
%.tmp4819 = getelementptr i8, i8* %.tmp4818, i32 0
%.tmp4820 = load i8, i8* %.tmp4819
%.tmp4821 = icmp eq i8 %.tmp4820, 47
br i1 %.tmp4821, label %.if.true.4822, label %.if.false.4822
.if.true.4822:
%.tmp4823 = getelementptr i8*, i8** %err_buf.4810, i32 0
%.tmp4825 = getelementptr [46 x i8], [46 x i8]*@.str4824, i32 0, i32 0
%.tmp4826 = load i8*, i8** %import_str
%.tmp4827 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4823, i8* %.tmp4825, i8* %.tmp4826)
%.tmp4828 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4829 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4830 = load i8*, i8** %err_buf.4810
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp4828, %m981$.Node.type* %.tmp4829, i8* %.tmp4830)
%.tmp4831 = bitcast ptr null to i8*
ret i8* %.tmp4831
br label %.if.end.4822
.if.false.4822:
br label %.if.end.4822
.if.end.4822:
%.tmp4832 = load i8*, i8** %import_str
%.tmp4833 = getelementptr i8, i8* %.tmp4832, i32 0
%.tmp4834 = load i8, i8* %.tmp4833
%.tmp4835 = icmp ne i8 %.tmp4834, 46
%.tmp4836 = load i8*, i8** %import_str
%.tmp4837 = getelementptr i8, i8* %.tmp4836, i32 1
%.tmp4838 = load i8, i8* %.tmp4837
%.tmp4839 = icmp ne i8 %.tmp4838, 47
%.tmp4840 = and i1 %.tmp4835, %.tmp4839
br i1 %.tmp4840, label %.if.true.4841, label %.if.false.4841
.if.true.4841:
%.tmp4842 = call i8*() @m295$get_root.cp()
%root.4843 = alloca i8*
store i8* %.tmp4842, i8** %root.4843
%.tmp4844 = getelementptr i8*, i8** %mod_abspath.4814, i32 0
%.tmp4846 = getelementptr [13 x i8], [13 x i8]*@.str4845, i32 0, i32 0
%.tmp4847 = load i8*, i8** %root.4843
%.tmp4848 = load i8*, i8** %import_str
%.tmp4849 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4844, i8* %.tmp4846, i8* %.tmp4847, i8* %.tmp4848)
br label %.if.end.4841
.if.false.4841:
%.tmp4850 = load i8*, i8** %dirname.4817
%.tmp4852 = getelementptr [1 x i8], [1 x i8]*@.str4851, i32 0, i32 0
%.tmp4853 = call i32(i8*,i8*) @strcmp(i8* %.tmp4850, i8* %.tmp4852)
%.tmp4854 = icmp eq i32 %.tmp4853, 0
br i1 %.tmp4854, label %.if.true.4855, label %.if.false.4855
.if.true.4855:
%.tmp4856 = getelementptr i8*, i8** %mod_abspath.4814, i32 0
%.tmp4858 = getelementptr [6 x i8], [6 x i8]*@.str4857, i32 0, i32 0
%.tmp4859 = load i8*, i8** %import_str
%.tmp4860 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4856, i8* %.tmp4858, i8* %.tmp4859)
br label %.if.end.4855
.if.false.4855:
%.tmp4861 = getelementptr i8*, i8** %mod_abspath.4814, i32 0
%.tmp4863 = getelementptr [9 x i8], [9 x i8]*@.str4862, i32 0, i32 0
%.tmp4864 = load i8*, i8** %dirname.4817
%.tmp4865 = load i8*, i8** %import_str
%.tmp4866 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4861, i8* %.tmp4863, i8* %.tmp4864, i8* %.tmp4865)
br label %.if.end.4855
.if.end.4855:
br label %.if.end.4841
.if.end.4841:
%.tmp4867 = load i8*, i8** %mod_abspath.4814
ret i8* %.tmp4867
}
define %m2638$.AssignableInfo.type* @m295$compile_fn_call.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%.tmp4868 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4869 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4870 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_builtin.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp4868, %m981$.Node.type* %.tmp4869)
%info.4871 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp4870, %m2638$.AssignableInfo.type** %info.4871
%.tmp4872 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp4873 = icmp ne %m2638$.AssignableInfo.type* %.tmp4872, null
br i1 %.tmp4873, label %.if.true.4874, label %.if.false.4874
.if.true.4874:
%.tmp4875 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
ret %m2638$.AssignableInfo.type* %.tmp4875
br label %.if.end.4874
.if.false.4874:
br label %.if.end.4874
.if.end.4874:
%.tmp4876 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4877 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4878 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_addr.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp4876, %m981$.Node.type* %.tmp4877)
store %m2638$.AssignableInfo.type* %.tmp4878, %m2638$.AssignableInfo.type** %info.4871
%.tmp4879 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp4880 = icmp eq %m2638$.AssignableInfo.type* %.tmp4879, null
br i1 %.tmp4880, label %.if.true.4881, label %.if.false.4881
.if.true.4881:
%.tmp4882 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp4882, label %.if.true.4883, label %.if.false.4883
.if.true.4883:
%.tmp4884 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4885 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4887 = getelementptr [35 x i8], [35 x i8]*@.str4886, i32 0, i32 0
%.tmp4888 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$err_tmpl.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp4884, %m981$.Node.type* %.tmp4885, i8* %.tmp4887)
%.tmp4889 = call i32(i8*,...) @printf(i8* %.tmp4888)
br label %.if.end.4883
.if.false.4883:
br label %.if.end.4883
.if.end.4883:
%.tmp4890 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp4890
br label %.if.end.4881
.if.false.4881:
br label %.if.end.4881
.if.end.4881:
%.tmp4891 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4893 = getelementptr [8 x i8], [8 x i8]*@.str4892, i32 0, i32 0
%.tmp4894 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp4891, i8* %.tmp4893)
%args.4895 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4894, %m981$.Node.type** %args.4895
%.tmp4897 = getelementptr [1 x i8], [1 x i8]*@.str4896, i32 0, i32 0
%params_buff.4898 = alloca i8*
store i8* %.tmp4897, i8** %params_buff.4898
%tmp.4899 = alloca i8*
store i8* null, i8** %tmp.4899
%.tmp4900 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp4901 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4900, i32 0, i32 4
%.tmp4902 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4901
%.tmp4903 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4902, i32 0, i32 0
%.tmp4904 = load i8*, i8** %.tmp4903
%.tmp4906 = getelementptr [4 x i8], [4 x i8]*@.str4905, i32 0, i32 0
%.tmp4907 = call i32(i8*,i8*) @strcmp(i8* %.tmp4904, i8* %.tmp4906)
%.tmp4908 = icmp eq i32 %.tmp4907, 0
br i1 %.tmp4908, label %.if.true.4909, label %.if.false.4909
.if.true.4909:
%.tmp4910 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4911 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp4910)
%new_info.4912 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp4911, %m2638$.AssignableInfo.type** %new_info.4912
%.tmp4913 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4914 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_info.4912
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp4913, %m2638$.AssignableInfo.type* %.tmp4914)
%.tmp4915 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_info.4912
%.tmp4916 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4915, i32 0, i32 4
%.tmp4917 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp4918 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4917, i32 0, i32 4
%.tmp4919 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4918
%.tmp4920 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4919, i32 0, i32 3
%.tmp4921 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4920
store %m2638$.Type.type* %.tmp4921, %m2638$.Type.type** %.tmp4916
%.tmp4922 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4923 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp4922, i32 0, i32 1
%.tmp4924 = load %m0$.File.type*, %m0$.File.type** %.tmp4923
%.tmp4926 = getelementptr [22 x i8], [22 x i8]*@.str4925, i32 0, i32 0
%.tmp4927 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_info.4912
%.tmp4928 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp4927)
%.tmp4929 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4930 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp4931 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4930, i32 0, i32 4
%.tmp4932 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4931
%.tmp4933 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp4929, %m2638$.Type.type* %.tmp4932)
%.tmp4934 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4935 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp4936 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4935, i32 0, i32 4
%.tmp4937 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4936
%.tmp4938 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp4934, %m2638$.Type.type* %.tmp4937)
%.tmp4939 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp4940 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp4939)
%.tmp4941 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4924, i8* %.tmp4926, i8* %.tmp4928, i8* %.tmp4933, i8* %.tmp4938, i8* %.tmp4940)
%.tmp4942 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_info.4912
store %m2638$.AssignableInfo.type* %.tmp4942, %m2638$.AssignableInfo.type** %info.4871
br label %.if.end.4909
.if.false.4909:
br label %.if.end.4909
.if.end.4909:
%.tmp4943 = load %m981$.Node.type*, %m981$.Node.type** %args.4895
%.tmp4944 = icmp ne %m981$.Node.type* %.tmp4943, null
br i1 %.tmp4944, label %.if.true.4945, label %.if.false.4945
.if.true.4945:
%.tmp4946 = load %m981$.Node.type*, %m981$.Node.type** %args.4895
%.tmp4947 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4946, i32 0, i32 6
%.tmp4948 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4947
%.tmp4950 = getelementptr [11 x i8], [11 x i8]*@.str4949, i32 0, i32 0
%.tmp4951 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp4948, i8* %.tmp4950)
%start.4952 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4951, %m981$.Node.type** %start.4952
%argno.4953 = alloca i32
store i32 1, i32* %argno.4953
%.tmp4954 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp4955 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4954, i32 0, i32 4
%.tmp4956 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4955
%.tmp4957 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4956, i32 0, i32 3
%.tmp4958 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4957
%.tmp4959 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp4958, i32 0, i32 4
%.tmp4960 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp4959
%expect_type.4961 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp4960, %m2638$.Type.type** %expect_type.4961
%provided_args.4962 = alloca i32
store i32 0, i32* %provided_args.4962
%.tmp4964 = load %m981$.Node.type*, %m981$.Node.type** %start.4952
%pp.4965 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4964, %m981$.Node.type** %pp.4965
br label %.for.start.4963
.for.start.4963:
%.tmp4966 = load %m981$.Node.type*, %m981$.Node.type** %pp.4965
%.tmp4967 = icmp ne %m981$.Node.type* %.tmp4966, null
br i1 %.tmp4967, label %.for.continue.4963, label %.for.end.4963
.for.continue.4963:
%.tmp4968 = load i32, i32* %provided_args.4962
%.tmp4969 = add i32 %.tmp4968, 1
store i32 %.tmp4969, i32* %provided_args.4962
%.tmp4970 = load %m981$.Node.type*, %m981$.Node.type** %pp.4965
%.tmp4971 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp4970, i32 0, i32 7
%.tmp4972 = load %m981$.Node.type*, %m981$.Node.type** %.tmp4971
%.tmp4974 = getelementptr [11 x i8], [11 x i8]*@.str4973, i32 0, i32 0
%.tmp4975 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp4972, i8* %.tmp4974)
store %m981$.Node.type* %.tmp4975, %m981$.Node.type** %pp.4965
br label %.for.start.4963
.for.end.4963:
%.tmp4977 = load %m981$.Node.type*, %m981$.Node.type** %start.4952
%pp.4978 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp4977, %m981$.Node.type** %pp.4978
br label %.for.start.4976
.for.start.4976:
%.tmp4979 = load %m981$.Node.type*, %m981$.Node.type** %pp.4978
%.tmp4980 = icmp ne %m981$.Node.type* %.tmp4979, null
br i1 %.tmp4980, label %.for.continue.4976, label %.for.end.4976
.for.continue.4976:
%.tmp4981 = load %m2638$.Type.type*, %m2638$.Type.type** %expect_type.4961
%.tmp4982 = icmp eq %m2638$.Type.type* %.tmp4981, null
br i1 %.tmp4982, label %.if.true.4983, label %.if.false.4983
.if.true.4983:
%.tmp4984 = getelementptr i8*, i8** %tmp.4899, i32 0
%.tmp4986 = getelementptr [43 x i8], [43 x i8]*@.str4985, i32 0, i32 0
%.tmp4987 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp4988 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp4987, i32 0, i32 2
%.tmp4989 = load i8*, i8** %.tmp4988
%.tmp4990 = load i32, i32* %argno.4953
%.tmp4991 = sub i32 %.tmp4990, 1
%.tmp4992 = load i32, i32* %provided_args.4962
%.tmp4993 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4984, i8* %.tmp4986, i8* %.tmp4989, i32 %.tmp4991, i32 %.tmp4992)
%.tmp4994 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp4995 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp4996 = load i8*, i8** %tmp.4899
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp4994, %m981$.Node.type* %.tmp4995, i8* %.tmp4996)
%.tmp4997 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp4997
br label %.if.end.4983
.if.false.4983:
br label %.if.end.4983
.if.end.4983:
%.tmp4998 = load %m981$.Node.type*, %m981$.Node.type** %pp.4978
%.tmp4999 = load %m981$.Node.type*, %m981$.Node.type** %start.4952
%.tmp5000 = icmp ne %m981$.Node.type* %.tmp4998, %.tmp4999
br i1 %.tmp5000, label %.if.true.5001, label %.if.false.5001
.if.true.5001:
%.tmp5002 = getelementptr i8*, i8** %tmp.4899, i32 0
%.tmp5004 = getelementptr [5 x i8], [5 x i8]*@.str5003, i32 0, i32 0
%.tmp5005 = load i8*, i8** %params_buff.4898
%.tmp5006 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5002, i8* %.tmp5004, i8* %.tmp5005)
%.tmp5007 = load i8*, i8** %params_buff.4898
%tmp_buff.5008 = alloca i8*
store i8* %.tmp5007, i8** %tmp_buff.5008
%.tmp5009 = load i8*, i8** %tmp.4899
store i8* %.tmp5009, i8** %params_buff.4898
%.tmp5010 = load i8*, i8** %tmp_buff.5008
store i8* %.tmp5010, i8** %tmp.4899
%.tmp5011 = load i8*, i8** %tmp.4899
call void(i8*) @free(i8* %.tmp5011)
br label %.if.end.5001
.if.false.5001:
br label %.if.end.5001
.if.end.5001:
%.tmp5012 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5013 = load %m981$.Node.type*, %m981$.Node.type** %pp.4978
%.tmp5014 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_assignable.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp5012, %m981$.Node.type* %.tmp5013)
%a_info.5015 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp5014, %m2638$.AssignableInfo.type** %a_info.5015
%.tmp5016 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.5015
%.tmp5017 = icmp eq %m2638$.AssignableInfo.type* %.tmp5016, null
br i1 %.tmp5017, label %.if.true.5018, label %.if.false.5018
.if.true.5018:
%.tmp5019 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp5019
br label %.if.end.5018
.if.false.5018:
br label %.if.end.5018
.if.end.5018:
%.tmp5020 = load %m2638$.Type.type*, %m2638$.Type.type** %expect_type.4961
%.tmp5021 = call %m2638$.Type.type*(%m2638$.Type.type*) @m295$type_clone.m2638$.Type.typep.m2638$.Type.typep(%m2638$.Type.type* %.tmp5020)
%exp.5022 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp5021, %m2638$.Type.type** %exp.5022
%.tmp5023 = load %m2638$.Type.type*, %m2638$.Type.type** %exp.5022
%.tmp5024 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5023, i32 0, i32 4
store %m2638$.Type.type* null, %m2638$.Type.type** %.tmp5024
%.tmp5025 = load %m2638$.Type.type*, %m2638$.Type.type** %expect_type.4961
%.tmp5026 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5025, i32 0, i32 0
%.tmp5027 = load i8*, i8** %.tmp5026
%.tmp5029 = getelementptr [7 x i8], [7 x i8]*@.str5028, i32 0, i32 0
%.tmp5030 = call i32(i8*,i8*) @strcmp(i8* %.tmp5027, i8* %.tmp5029)
%.tmp5031 = icmp ne i32 %.tmp5030, 0
%.tmp5032 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5033 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.5015
%.tmp5034 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5033, i32 0, i32 4
%.tmp5035 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5034
%.tmp5036 = load %m2638$.Type.type*, %m2638$.Type.type** %exp.5022
%.tmp5037 = call i1(%m2638$.CompilerCtx.type*,%m2638$.Type.type*,%m2638$.Type.type*) @m2639$cmp.b.m2638$.CompilerCtx.typep.m2638$.Type.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5032, %m2638$.Type.type* %.tmp5035, %m2638$.Type.type* %.tmp5036)
%.tmp5038 = icmp eq i1 %.tmp5037, 0
%.tmp5039 = and i1 %.tmp5031, %.tmp5038
br i1 %.tmp5039, label %.if.true.5040, label %.if.false.5040
.if.true.5040:
%.tmp5042 = getelementptr [1 x i8], [1 x i8]*@.str5041, i32 0, i32 0
%err_buf.5043 = alloca i8*
store i8* %.tmp5042, i8** %err_buf.5043
%.tmp5044 = getelementptr i8*, i8** %err_buf.5043, i32 0
%.tmp5046 = getelementptr [58 x i8], [58 x i8]*@.str5045, i32 0, i32 0
%.tmp5047 = load i32, i32* %argno.4953
%.tmp5048 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5049 = load %m2638$.Type.type*, %m2638$.Type.type** %exp.5022
%.tmp5050 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5048, %m2638$.Type.type* %.tmp5049)
%.tmp5051 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5052 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.5015
%.tmp5053 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5052, i32 0, i32 4
%.tmp5054 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5053
%.tmp5055 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5051, %m2638$.Type.type* %.tmp5054)
%.tmp5056 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5044, i8* %.tmp5046, i32 %.tmp5047, i8* %.tmp5050, i8* %.tmp5055)
%.tmp5057 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5058 = load %m981$.Node.type*, %m981$.Node.type** %pp.4978
%.tmp5059 = load i8*, i8** %err_buf.5043
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp5057, %m981$.Node.type* %.tmp5058, i8* %.tmp5059)
%.tmp5060 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp5060
br label %.if.end.5040
.if.false.5040:
br label %.if.end.5040
.if.end.5040:
%.tmp5061 = getelementptr i8*, i8** %params_buff.4898, i32 0
%.tmp5063 = getelementptr [8 x i8], [8 x i8]*@.str5062, i32 0, i32 0
%.tmp5064 = load i8*, i8** %params_buff.4898
%.tmp5065 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5066 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.5015
%.tmp5067 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5066, i32 0, i32 4
%.tmp5068 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5067
%.tmp5069 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5065, %m2638$.Type.type* %.tmp5068)
%.tmp5070 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.5015
%.tmp5071 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp5070)
%.tmp5072 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5061, i8* %.tmp5063, i8* %.tmp5064, i8* %.tmp5069, i8* %.tmp5071)
%.tmp5073 = load %m981$.Node.type*, %m981$.Node.type** %pp.4978
%.tmp5074 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5073, i32 0, i32 7
%.tmp5075 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5074
store %m981$.Node.type* %.tmp5075, %m981$.Node.type** %pp.4978
%.tmp5076 = load %m2638$.Type.type*, %m2638$.Type.type** %expect_type.4961
%.tmp5077 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5076, i32 0, i32 0
%.tmp5078 = load i8*, i8** %.tmp5077
%.tmp5080 = getelementptr [7 x i8], [7 x i8]*@.str5079, i32 0, i32 0
%.tmp5081 = call i32(i8*,i8*) @strcmp(i8* %.tmp5078, i8* %.tmp5080)
%.tmp5082 = icmp ne i32 %.tmp5081, 0
br i1 %.tmp5082, label %.if.true.5083, label %.if.false.5083
.if.true.5083:
%.tmp5084 = load %m2638$.Type.type*, %m2638$.Type.type** %expect_type.4961
%.tmp5085 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5084, i32 0, i32 4
%.tmp5086 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5085
store %m2638$.Type.type* %.tmp5086, %m2638$.Type.type** %expect_type.4961
br label %.if.end.5083
.if.false.5083:
br label %.if.end.5083
.if.end.5083:
%.tmp5087 = load i32, i32* %argno.4953
%.tmp5088 = add i32 %.tmp5087, 1
store i32 %.tmp5088, i32* %argno.4953
%.tmp5089 = load %m981$.Node.type*, %m981$.Node.type** %pp.4978
%.tmp5091 = getelementptr [11 x i8], [11 x i8]*@.str5090, i32 0, i32 0
%.tmp5092 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp5089, i8* %.tmp5091)
store %m981$.Node.type* %.tmp5092, %m981$.Node.type** %pp.4978
br label %.for.start.4976
.for.end.4976:
%.tmp5093 = load %m2638$.Type.type*, %m2638$.Type.type** %expect_type.4961
%.tmp5094 = icmp ne %m2638$.Type.type* %.tmp5093, null
br i1 %.tmp5094, label %.if.true.5095, label %.if.false.5095
.if.true.5095:
%.tmp5096 = load %m2638$.Type.type*, %m2638$.Type.type** %expect_type.4961
%.tmp5097 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5096, i32 0, i32 0
%.tmp5098 = load i8*, i8** %.tmp5097
%.tmp5100 = getelementptr [7 x i8], [7 x i8]*@.str5099, i32 0, i32 0
%.tmp5101 = call i32(i8*,i8*) @strcmp(i8* %.tmp5098, i8* %.tmp5100)
%.tmp5102 = icmp ne i32 %.tmp5101, 0
br i1 %.tmp5102, label %.if.true.5103, label %.if.false.5103
.if.true.5103:
%.tmp5104 = getelementptr i8*, i8** %tmp.4899, i32 0
%.tmp5106 = getelementptr [43 x i8], [43 x i8]*@.str5105, i32 0, i32 0
%.tmp5107 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp5108 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5107, i32 0, i32 2
%.tmp5109 = load i8*, i8** %.tmp5108
%.tmp5110 = load i32, i32* %argno.4953
%.tmp5111 = load i32, i32* %provided_args.4962
%.tmp5112 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5104, i8* %.tmp5106, i8* %.tmp5109, i32 %.tmp5110, i32 %.tmp5111)
%.tmp5113 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5114 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5115 = load i8*, i8** %tmp.4899
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp5113, %m981$.Node.type* %.tmp5114, i8* %.tmp5115)
%.tmp5116 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp5116
br label %.if.end.5103
.if.false.5103:
br label %.if.end.5103
.if.end.5103:
br label %.if.end.5095
.if.false.5095:
br label %.if.end.5095
.if.end.5095:
br label %.if.end.4945
.if.false.4945:
%.tmp5117 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp5118 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5117, i32 0, i32 4
%.tmp5119 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5118
%.tmp5120 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5119, i32 0, i32 3
%.tmp5121 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5120
%.tmp5122 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5121, i32 0, i32 4
%.tmp5123 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5122
%.tmp5124 = icmp ne %m2638$.Type.type* %.tmp5123, null
br i1 %.tmp5124, label %.if.true.5125, label %.if.false.5125
.if.true.5125:
%args_required.5126 = alloca i32
store i32 0, i32* %args_required.5126
%.tmp5128 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp5129 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5128, i32 0, i32 4
%.tmp5130 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5129
%.tmp5131 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5130, i32 0, i32 3
%.tmp5132 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5131
%.tmp5133 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5132, i32 0, i32 4
%.tmp5134 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5133
%pp.5135 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp5134, %m2638$.Type.type** %pp.5135
br label %.for.start.5127
.for.start.5127:
%.tmp5136 = load %m2638$.Type.type*, %m2638$.Type.type** %pp.5135
%.tmp5137 = icmp ne %m2638$.Type.type* %.tmp5136, null
br i1 %.tmp5137, label %.for.continue.5127, label %.for.else.5127
.for.continue.5127:
%.tmp5138 = load %m2638$.Type.type*, %m2638$.Type.type** %pp.5135
%.tmp5139 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5138, i32 0, i32 0
%.tmp5140 = load i8*, i8** %.tmp5139
%.tmp5142 = getelementptr [7 x i8], [7 x i8]*@.str5141, i32 0, i32 0
%.tmp5143 = call i32(i8*,i8*) @strcmp(i8* %.tmp5140, i8* %.tmp5142)
%.tmp5144 = icmp eq i32 %.tmp5143, 0
br i1 %.tmp5144, label %.if.true.5145, label %.if.false.5145
.if.true.5145:
br label %.for.end.5127
br label %.if.end.5145
.if.false.5145:
br label %.if.end.5145
.if.end.5145:
%.tmp5146 = load i32, i32* %args_required.5126
%.tmp5147 = add i32 %.tmp5146, 1
store i32 %.tmp5147, i32* %args_required.5126
%.tmp5148 = load %m2638$.Type.type*, %m2638$.Type.type** %pp.5135
%.tmp5149 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5148, i32 0, i32 4
%.tmp5150 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5149
store %m2638$.Type.type* %.tmp5150, %m2638$.Type.type** %pp.5135
br label %.for.start.5127
.for.else.5127:
%.tmp5151 = getelementptr i8*, i8** %tmp.4899, i32 0
%.tmp5153 = getelementptr [42 x i8], [42 x i8]*@.str5152, i32 0, i32 0
%.tmp5154 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp5155 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5154, i32 0, i32 2
%.tmp5156 = load i8*, i8** %.tmp5155
%.tmp5157 = load i32, i32* %args_required.5126
%.tmp5158 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5151, i8* %.tmp5153, i8* %.tmp5156, i32 %.tmp5157)
%.tmp5159 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5160 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5161 = load i8*, i8** %tmp.4899
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp5159, %m981$.Node.type* %.tmp5160, i8* %.tmp5161)
%.tmp5162 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp5162
br label %.for.end.5127
.for.end.5127:
br label %.if.end.5125
.if.false.5125:
br label %.if.end.5125
.if.end.5125:
br label %.if.end.4945
.if.end.4945:
%.tmp5163 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5164 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp5165 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5164, i32 0, i32 4
%.tmp5166 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5165
%.tmp5167 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5166, i32 0, i32 3
%.tmp5168 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5167
%.tmp5169 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5163, %m2638$.Type.type* %.tmp5168)
%.tmp5171 = getelementptr [5 x i8], [5 x i8]*@.str5170, i32 0, i32 0
%.tmp5172 = call i32(i8*,i8*) @strcmp(i8* %.tmp5169, i8* %.tmp5171)
%.tmp5173 = icmp eq i32 %.tmp5172, 0
br i1 %.tmp5173, label %.if.true.5174, label %.if.false.5174
.if.true.5174:
%.tmp5175 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5176 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5175, i32 0, i32 1
%.tmp5177 = load %m0$.File.type*, %m0$.File.type** %.tmp5176
%.tmp5179 = getelementptr [16 x i8], [16 x i8]*@.str5178, i32 0, i32 0
%.tmp5180 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5181 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp5182 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5181, i32 0, i32 4
%.tmp5183 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5182
%.tmp5184 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5180, %m2638$.Type.type* %.tmp5183)
%.tmp5185 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp5186 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp5185)
%.tmp5187 = load i8*, i8** %params_buff.4898
%.tmp5188 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5177, i8* %.tmp5179, i8* %.tmp5184, i8* %.tmp5186, i8* %.tmp5187)
%.tmp5189 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp5189
br label %.if.end.5174
.if.false.5174:
br label %.if.end.5174
.if.end.5174:
%.tmp5190 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5191 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp5190)
%call_info.5192 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp5191, %m2638$.AssignableInfo.type** %call_info.5192
%.tmp5193 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5194 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %call_info.5192
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp5193, %m2638$.AssignableInfo.type* %.tmp5194)
%.tmp5195 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %call_info.5192
%.tmp5196 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5195, i32 0, i32 4
%.tmp5197 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp5198 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5197, i32 0, i32 4
%.tmp5199 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5198
%.tmp5200 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5199, i32 0, i32 3
%.tmp5201 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5200
%.tmp5202 = call %m2638$.Type.type*(%m2638$.Type.type*) @m295$type_clone.m2638$.Type.typep.m2638$.Type.typep(%m2638$.Type.type* %.tmp5201)
store %m2638$.Type.type* %.tmp5202, %m2638$.Type.type** %.tmp5196
%.tmp5203 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %call_info.5192
%.tmp5204 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5203, i32 0, i32 4
%.tmp5205 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5204
%.tmp5206 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5205, i32 0, i32 4
store %m2638$.Type.type* null, %m2638$.Type.type** %.tmp5206
%.tmp5207 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5208 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5207, i32 0, i32 1
%.tmp5209 = load %m0$.File.type*, %m0$.File.type** %.tmp5208
%.tmp5211 = getelementptr [21 x i8], [21 x i8]*@.str5210, i32 0, i32 0
%.tmp5212 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %call_info.5192
%.tmp5213 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp5212)
%.tmp5214 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5215 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp5216 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5215, i32 0, i32 4
%.tmp5217 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5216
%.tmp5218 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5214, %m2638$.Type.type* %.tmp5217)
%.tmp5219 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.4871
%.tmp5220 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp5219)
%.tmp5221 = load i8*, i8** %params_buff.4898
%.tmp5222 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5209, i8* %.tmp5211, i8* %.tmp5213, i8* %.tmp5218, i8* %.tmp5220, i8* %.tmp5221)
%.tmp5223 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %call_info.5192
%.tmp5224 = bitcast %m2638$.AssignableInfo.type* %.tmp5223 to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp5224
}
define void @m295$compile_expression.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%err_msg.5225 = alloca i8*
store i8* null, i8** %err_msg.5225
%.tmp5226 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5227 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5226, i32 0, i32 0
%.tmp5228 = load i8*, i8** %.tmp5227
%expr_type.5229 = alloca i8*
store i8* %.tmp5228, i8** %expr_type.5229
%.tmp5230 = bitcast ptr null to %m2638$.AssignableInfo.type*
%info.5231 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp5230, %m2638$.AssignableInfo.type** %info.5231
%assignable.5232 = alloca %m981$.Node.type*
store %m981$.Node.type* null, %m981$.Node.type** %assignable.5232
%.tmp5233 = bitcast ptr null to %m2638$.AssignableInfo.type*
%a_info.5234 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp5233, %m2638$.AssignableInfo.type** %a_info.5234
%.tmp5235 = load i8*, i8** %expr_type.5229
%.tmp5237 = getelementptr [7 x i8], [7 x i8]*@.str5236, i32 0, i32 0
%.tmp5238 = call i32(i8*,i8*) @strcmp(i8* %.tmp5235, i8* %.tmp5237)
%.tmp5239 = icmp eq i32 %.tmp5238, 0
br i1 %.tmp5239, label %.if.true.5240, label %.if.false.5240
.if.true.5240:
%.tmp5241 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5243 = getelementptr [9 x i8], [9 x i8]*@.str5242, i32 0, i32 0
%.tmp5244 = call %m2638$.Scope.type*(%m2638$.CompilerCtx.type*,i8*) @m295$get_scope.m2638$.Scope.typep.m2638$.CompilerCtx.typep.cp(%m2638$.CompilerCtx.type* %.tmp5241, i8* %.tmp5243)
%fn_scope.5245 = alloca %m2638$.Scope.type*
store %m2638$.Scope.type* %.tmp5244, %m2638$.Scope.type** %fn_scope.5245
%.tmp5246 = load %m2638$.Scope.type*, %m2638$.Scope.type** %fn_scope.5245
%.tmp5247 = icmp eq %m2638$.Scope.type* %.tmp5246, null
br i1 %.tmp5247, label %.if.true.5248, label %.if.false.5248
.if.true.5248:
%.tmp5249 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5250 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5252 = getelementptr [40 x i8], [40 x i8]*@.str5251, i32 0, i32 0
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp5249, %m981$.Node.type* %.tmp5250, i8* %.tmp5252)
ret void
br label %.if.end.5248
.if.false.5248:
br label %.if.end.5248
.if.end.5248:
%.tmp5253 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5254 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5253, i32 0, i32 6
%.tmp5255 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5254
%.tmp5256 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5255, i32 0, i32 7
%.tmp5257 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5256
%.tmp5258 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5257, i32 0, i32 0
%.tmp5259 = load i8*, i8** %.tmp5258
%.tmp5261 = getelementptr [3 x i8], [3 x i8]*@.str5260, i32 0, i32 0
%.tmp5262 = call i32(i8*,i8*) @strcmp(i8* %.tmp5259, i8* %.tmp5261)
%.tmp5263 = icmp ne i32 %.tmp5262, 0
br i1 %.tmp5263, label %.if.true.5264, label %.if.false.5264
.if.true.5264:
%.tmp5265 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5266 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5267 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5266, i32 0, i32 6
%.tmp5268 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5267
%.tmp5269 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5268, i32 0, i32 7
%.tmp5270 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5269
%.tmp5271 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_assignable.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp5265, %m981$.Node.type* %.tmp5270)
store %m2638$.AssignableInfo.type* %.tmp5271, %m2638$.AssignableInfo.type** %info.5231
%.tmp5272 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.5231
%.tmp5273 = icmp eq %m2638$.AssignableInfo.type* %.tmp5272, null
br i1 %.tmp5273, label %.if.true.5274, label %.if.false.5274
.if.true.5274:
ret void
br label %.if.end.5274
.if.false.5274:
br label %.if.end.5274
.if.end.5274:
%.tmp5275 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5276 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.5231
%.tmp5277 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5276, i32 0, i32 4
%.tmp5278 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5277
%.tmp5279 = load %m2638$.Scope.type*, %m2638$.Scope.type** %fn_scope.5245
%.tmp5280 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp5279, i32 0, i32 6
%.tmp5281 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5280
%.tmp5282 = call i1(%m2638$.CompilerCtx.type*,%m2638$.Type.type*,%m2638$.Type.type*) @m2639$cmp.b.m2638$.CompilerCtx.typep.m2638$.Type.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5275, %m2638$.Type.type* %.tmp5278, %m2638$.Type.type* %.tmp5281)
%.tmp5283 = icmp eq i1 %.tmp5282, 0
br i1 %.tmp5283, label %.if.true.5284, label %.if.false.5284
.if.true.5284:
%.tmp5286 = getelementptr [1 x i8], [1 x i8]*@.str5285, i32 0, i32 0
%buf.5287 = alloca i8*
store i8* %.tmp5286, i8** %buf.5287
%.tmp5288 = getelementptr i8*, i8** %buf.5287, i32 0
%.tmp5290 = getelementptr [67 x i8], [67 x i8]*@.str5289, i32 0, i32 0
%.tmp5291 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5292 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.5231
%.tmp5293 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5292, i32 0, i32 4
%.tmp5294 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5293
%.tmp5295 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5291, %m2638$.Type.type* %.tmp5294)
%.tmp5296 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5297 = load %m2638$.Scope.type*, %m2638$.Scope.type** %fn_scope.5245
%.tmp5298 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp5297, i32 0, i32 6
%.tmp5299 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5298
%.tmp5300 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5296, %m2638$.Type.type* %.tmp5299)
%.tmp5301 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5288, i8* %.tmp5290, i8* %.tmp5295, i8* %.tmp5300)
%.tmp5302 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5303 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5304 = load i8*, i8** %buf.5287
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp5302, %m981$.Node.type* %.tmp5303, i8* %.tmp5304)
ret void
br label %.if.end.5284
.if.false.5284:
br label %.if.end.5284
.if.end.5284:
%.tmp5305 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5306 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5305, i32 0, i32 1
%.tmp5307 = load %m0$.File.type*, %m0$.File.type** %.tmp5306
%.tmp5309 = getelementptr [11 x i8], [11 x i8]*@.str5308, i32 0, i32 0
%.tmp5310 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5311 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.5231
%.tmp5312 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5311, i32 0, i32 4
%.tmp5313 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5312
%.tmp5314 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5310, %m2638$.Type.type* %.tmp5313)
%.tmp5315 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.5231
%.tmp5316 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp5315)
%.tmp5317 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5307, i8* %.tmp5309, i8* %.tmp5314, i8* %.tmp5316)
br label %.if.end.5264
.if.false.5264:
%.tmp5318 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5319 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5318, i32 0, i32 1
%.tmp5320 = load %m0$.File.type*, %m0$.File.type** %.tmp5319
%.tmp5322 = getelementptr [10 x i8], [10 x i8]*@.str5321, i32 0, i32 0
%.tmp5323 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5320, i8* %.tmp5322)
br label %.if.end.5264
.if.end.5264:
br label %.if.end.5240
.if.false.5240:
%.tmp5324 = load i8*, i8** %expr_type.5229
%.tmp5326 = getelementptr [3 x i8], [3 x i8]*@.str5325, i32 0, i32 0
%.tmp5327 = call i32(i8*,i8*) @strcmp(i8* %.tmp5324, i8* %.tmp5326)
%.tmp5328 = icmp eq i32 %.tmp5327, 0
br i1 %.tmp5328, label %.if.true.5329, label %.if.false.5329
.if.true.5329:
br label %.if.end.5329
.if.false.5329:
%.tmp5330 = load i8*, i8** %expr_type.5229
%.tmp5332 = getelementptr [8 x i8], [8 x i8]*@.str5331, i32 0, i32 0
%.tmp5333 = call i32(i8*,i8*) @strcmp(i8* %.tmp5330, i8* %.tmp5332)
%.tmp5334 = icmp eq i32 %.tmp5333, 0
br i1 %.tmp5334, label %.if.true.5335, label %.if.false.5335
.if.true.5335:
%.tmp5336 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5337 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5338 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5337, i32 0, i32 6
%.tmp5339 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5338
%.tmp5340 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_fn_call.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp5336, %m981$.Node.type* %.tmp5339)
br label %.if.end.5335
.if.false.5335:
%.tmp5341 = load i8*, i8** %expr_type.5229
%.tmp5343 = getelementptr [12 x i8], [12 x i8]*@.str5342, i32 0, i32 0
%.tmp5344 = call i32(i8*,i8*) @strcmp(i8* %.tmp5341, i8* %.tmp5343)
%.tmp5345 = icmp eq i32 %.tmp5344, 0
br i1 %.tmp5345, label %.if.true.5346, label %.if.false.5346
.if.true.5346:
%.tmp5347 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5348 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5349 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_declaration.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp5347, %m981$.Node.type* %.tmp5348)
br label %.if.end.5346
.if.false.5346:
%.tmp5350 = load i8*, i8** %expr_type.5229
%.tmp5352 = getelementptr [11 x i8], [11 x i8]*@.str5351, i32 0, i32 0
%.tmp5353 = call i32(i8*,i8*) @strcmp(i8* %.tmp5350, i8* %.tmp5352)
%.tmp5354 = icmp eq i32 %.tmp5353, 0
br i1 %.tmp5354, label %.if.true.5355, label %.if.false.5355
.if.true.5355:
%.tmp5356 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5357 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5356, i32 0, i32 6
%.tmp5358 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5357
%.tmp5360 = getelementptr [11 x i8], [11 x i8]*@.str5359, i32 0, i32 0
%.tmp5361 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp5358, i8* %.tmp5360)
store %m981$.Node.type* %.tmp5361, %m981$.Node.type** %assignable.5232
%.tmp5362 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5363 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5364 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5363, i32 0, i32 6
%.tmp5365 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5364
%.tmp5366 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_addr.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp5362, %m981$.Node.type* %.tmp5365)
%dest.5367 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp5366, %m2638$.AssignableInfo.type** %dest.5367
%.tmp5368 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %dest.5367
%.tmp5369 = icmp eq %m2638$.AssignableInfo.type* %.tmp5368, null
br i1 %.tmp5369, label %.if.true.5370, label %.if.false.5370
.if.true.5370:
ret void
br label %.if.end.5370
.if.false.5370:
br label %.if.end.5370
.if.end.5370:
%.tmp5371 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5372 = load %m981$.Node.type*, %m981$.Node.type** %assignable.5232
%.tmp5373 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_assignable.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp5371, %m981$.Node.type* %.tmp5372)
store %m2638$.AssignableInfo.type* %.tmp5373, %m2638$.AssignableInfo.type** %a_info.5234
%.tmp5374 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.5234
%.tmp5375 = icmp eq %m2638$.AssignableInfo.type* %.tmp5374, null
br i1 %.tmp5375, label %.if.true.5376, label %.if.false.5376
.if.true.5376:
ret void
br label %.if.end.5376
.if.false.5376:
br label %.if.end.5376
.if.end.5376:
%.tmp5377 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5378 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.5234
%.tmp5379 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5378, i32 0, i32 4
%.tmp5380 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5379
%.tmp5381 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %dest.5367
%.tmp5382 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5381, i32 0, i32 4
%.tmp5383 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5382
%.tmp5384 = call i1(%m2638$.CompilerCtx.type*,%m2638$.Type.type*,%m2638$.Type.type*) @m2639$cmp.b.m2638$.CompilerCtx.typep.m2638$.Type.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5377, %m2638$.Type.type* %.tmp5380, %m2638$.Type.type* %.tmp5383)
%.tmp5385 = icmp eq i1 %.tmp5384, 0
br i1 %.tmp5385, label %.if.true.5386, label %.if.false.5386
.if.true.5386:
%.tmp5388 = getelementptr [1 x i8], [1 x i8]*@.str5387, i32 0, i32 0
%err_buf.5389 = alloca i8*
store i8* %.tmp5388, i8** %err_buf.5389
%.tmp5390 = getelementptr i8*, i8** %err_buf.5389, i32 0
%.tmp5392 = getelementptr [37 x i8], [37 x i8]*@.str5391, i32 0, i32 0
%.tmp5393 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5394 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.5234
%.tmp5395 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5394, i32 0, i32 4
%.tmp5396 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5395
%.tmp5397 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5393, %m2638$.Type.type* %.tmp5396)
%.tmp5398 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5399 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %dest.5367
%.tmp5400 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5399, i32 0, i32 4
%.tmp5401 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5400
%.tmp5402 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5398, %m2638$.Type.type* %.tmp5401)
%.tmp5403 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5390, i8* %.tmp5392, i8* %.tmp5397, i8* %.tmp5402)
%.tmp5404 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5405 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5406 = load i8*, i8** %err_buf.5389
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp5404, %m981$.Node.type* %.tmp5405, i8* %.tmp5406)
br label %.if.end.5386
.if.false.5386:
br label %.if.end.5386
.if.end.5386:
%.tmp5407 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5408 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %dest.5367
%.tmp5409 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5408, i32 0, i32 4
%.tmp5410 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5409
%.tmp5411 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5407, %m2638$.Type.type* %.tmp5410)
%dest_tr.5412 = alloca i8*
store i8* %.tmp5411, i8** %dest_tr.5412
%.tmp5413 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5414 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.5234
%.tmp5415 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5414, i32 0, i32 4
%.tmp5416 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5415
%.tmp5417 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5413, %m2638$.Type.type* %.tmp5416)
%src_tr.5418 = alloca i8*
store i8* %.tmp5417, i8** %src_tr.5418
%.tmp5419 = load i8*, i8** %src_tr.5418
%.tmp5421 = getelementptr [4 x i8], [4 x i8]*@.str5420, i32 0, i32 0
%.tmp5422 = call i32(i8*,i8*) @strcmp(i8* %.tmp5419, i8* %.tmp5421)
%.tmp5423 = icmp eq i32 %.tmp5422, 0
br i1 %.tmp5423, label %.if.true.5424, label %.if.false.5424
.if.true.5424:
%.tmp5425 = load i8*, i8** %dest_tr.5412
store i8* %.tmp5425, i8** %src_tr.5418
br label %.if.end.5424
.if.false.5424:
br label %.if.end.5424
.if.end.5424:
%.tmp5426 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5427 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5426, i32 0, i32 1
%.tmp5428 = load %m0$.File.type*, %m0$.File.type** %.tmp5427
%.tmp5430 = getelementptr [21 x i8], [21 x i8]*@.str5429, i32 0, i32 0
%.tmp5431 = load i8*, i8** %src_tr.5418
%.tmp5432 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.5234
%.tmp5433 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp5432)
%.tmp5434 = load i8*, i8** %dest_tr.5412
%.tmp5435 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %dest.5367
%.tmp5436 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp5435)
%.tmp5437 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5428, i8* %.tmp5430, i8* %.tmp5431, i8* %.tmp5433, i8* %.tmp5434, i8* %.tmp5436)
br label %.if.end.5355
.if.false.5355:
%.tmp5438 = load i8*, i8** %expr_type.5229
%.tmp5440 = getelementptr [9 x i8], [9 x i8]*@.str5439, i32 0, i32 0
%.tmp5441 = call i32(i8*,i8*) @strcmp(i8* %.tmp5438, i8* %.tmp5440)
%.tmp5442 = icmp eq i32 %.tmp5441, 0
br i1 %.tmp5442, label %.if.true.5443, label %.if.false.5443
.if.true.5443:
%.tmp5444 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5445 = load %m981$.Node.type*, %m981$.Node.type** %stmt
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_if_block.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp5444, %m981$.Node.type* %.tmp5445)
br label %.if.end.5443
.if.false.5443:
%.tmp5446 = load i8*, i8** %expr_type.5229
%.tmp5448 = getelementptr [9 x i8], [9 x i8]*@.str5447, i32 0, i32 0
%.tmp5449 = call i32(i8*,i8*) @strcmp(i8* %.tmp5446, i8* %.tmp5448)
%.tmp5450 = icmp eq i32 %.tmp5449, 0
br i1 %.tmp5450, label %.if.true.5451, label %.if.false.5451
.if.true.5451:
%.tmp5452 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5453 = load %m981$.Node.type*, %m981$.Node.type** %stmt
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_for_loop.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp5452, %m981$.Node.type* %.tmp5453)
br label %.if.end.5451
.if.false.5451:
%.tmp5454 = load i8*, i8** %expr_type.5229
%.tmp5456 = getelementptr [8 x i8], [8 x i8]*@.str5455, i32 0, i32 0
%.tmp5457 = call i32(i8*,i8*) @strcmp(i8* %.tmp5454, i8* %.tmp5456)
%.tmp5458 = icmp eq i32 %.tmp5457, 0
br i1 %.tmp5458, label %.if.true.5459, label %.if.false.5459
.if.true.5459:
%.tmp5460 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5462 = getelementptr [4 x i8], [4 x i8]*@.str5461, i32 0, i32 0
%.tmp5463 = call %m2638$.Scope.type*(%m2638$.CompilerCtx.type*,i8*) @m295$get_scope.m2638$.Scope.typep.m2638$.CompilerCtx.typep.cp(%m2638$.CompilerCtx.type* %.tmp5460, i8* %.tmp5462)
%for_scope.5464 = alloca %m2638$.Scope.type*
store %m2638$.Scope.type* %.tmp5463, %m2638$.Scope.type** %for_scope.5464
%.tmp5465 = load %m2638$.Scope.type*, %m2638$.Scope.type** %for_scope.5464
%.tmp5466 = icmp eq %m2638$.Scope.type* %.tmp5465, null
br i1 %.tmp5466, label %.if.true.5467, label %.if.false.5467
.if.true.5467:
%.tmp5469 = getelementptr [1 x i8], [1 x i8]*@.str5468, i32 0, i32 0
%buf.5470 = alloca i8*
store i8* %.tmp5469, i8** %buf.5470
%.tmp5471 = getelementptr i8*, i8** %buf.5470, i32 0
%.tmp5473 = getelementptr [42 x i8], [42 x i8]*@.str5472, i32 0, i32 0
%.tmp5474 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5475 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5474, i32 0, i32 6
%.tmp5476 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5475
%.tmp5477 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5476, i32 0, i32 1
%.tmp5478 = load i8*, i8** %.tmp5477
%.tmp5479 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5471, i8* %.tmp5473, i8* %.tmp5478)
%.tmp5480 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5481 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5482 = load i8*, i8** %buf.5470
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp5480, %m981$.Node.type* %.tmp5481, i8* %.tmp5482)
ret void
br label %.if.end.5467
.if.false.5467:
br label %.if.end.5467
.if.end.5467:
%.tmp5483 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5484 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5483, i32 0, i32 6
%.tmp5485 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5484
%.tmp5486 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5485, i32 0, i32 1
%.tmp5487 = load i8*, i8** %.tmp5486
%.tmp5489 = getelementptr [6 x i8], [6 x i8]*@.str5488, i32 0, i32 0
%.tmp5490 = call i32(i8*,i8*) @strcmp(i8* %.tmp5487, i8* %.tmp5489)
%.tmp5491 = icmp eq i32 %.tmp5490, 0
br i1 %.tmp5491, label %.if.true.5492, label %.if.false.5492
.if.true.5492:
%.tmp5493 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5494 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5493, i32 0, i32 1
%.tmp5495 = load %m0$.File.type*, %m0$.File.type** %.tmp5494
%.tmp5497 = getelementptr [15 x i8], [15 x i8]*@.str5496, i32 0, i32 0
%.tmp5498 = load %m2638$.Scope.type*, %m2638$.Scope.type** %for_scope.5464
%.tmp5499 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp5498, i32 0, i32 4
%.tmp5500 = load i8*, i8** %.tmp5499
%.tmp5501 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5495, i8* %.tmp5497, i8* %.tmp5500)
br label %.if.end.5492
.if.false.5492:
%.tmp5502 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5503 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5502, i32 0, i32 6
%.tmp5504 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5503
%.tmp5505 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5504, i32 0, i32 1
%.tmp5506 = load i8*, i8** %.tmp5505
%.tmp5508 = getelementptr [9 x i8], [9 x i8]*@.str5507, i32 0, i32 0
%.tmp5509 = call i32(i8*,i8*) @strcmp(i8* %.tmp5506, i8* %.tmp5508)
%.tmp5510 = icmp eq i32 %.tmp5509, 0
br i1 %.tmp5510, label %.if.true.5511, label %.if.false.5511
.if.true.5511:
%.tmp5512 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5513 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5512, i32 0, i32 1
%.tmp5514 = load %m0$.File.type*, %m0$.File.type** %.tmp5513
%.tmp5516 = getelementptr [15 x i8], [15 x i8]*@.str5515, i32 0, i32 0
%.tmp5517 = load %m2638$.Scope.type*, %m2638$.Scope.type** %for_scope.5464
%.tmp5518 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp5517, i32 0, i32 3
%.tmp5519 = load i8*, i8** %.tmp5518
%.tmp5520 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5514, i8* %.tmp5516, i8* %.tmp5519)
br label %.if.end.5511
.if.false.5511:
br label %.if.end.5511
.if.end.5511:
br label %.if.end.5492
.if.end.5492:
br label %.if.end.5459
.if.false.5459:
%.tmp5521 = load i8*, i8** %expr_type.5229
%.tmp5523 = getelementptr [9 x i8], [9 x i8]*@.str5522, i32 0, i32 0
%.tmp5524 = call i32(i8*,i8*) @strcmp(i8* %.tmp5521, i8* %.tmp5523)
%.tmp5525 = icmp eq i32 %.tmp5524, 0
br i1 %.tmp5525, label %.if.true.5526, label %.if.false.5526
.if.true.5526:
%.tmp5527 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5528 = load %m981$.Node.type*, %m981$.Node.type** %stmt
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_closure.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp5527, %m981$.Node.type* %.tmp5528)
br label %.if.end.5526
.if.false.5526:
%.tmp5529 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5530 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5532 = getelementptr [34 x i8], [34 x i8]*@.str5531, i32 0, i32 0
%.tmp5533 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$err_tmpl.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp5529, %m981$.Node.type* %.tmp5530, i8* %.tmp5532)
%.tmp5534 = load i8*, i8** %expr_type.5229
%.tmp5535 = call i32(i8*,...) @printf(i8* %.tmp5533, i8* %.tmp5534)
br label %.if.end.5526
.if.end.5526:
br label %.if.end.5459
.if.end.5459:
br label %.if.end.5451
.if.end.5451:
br label %.if.end.5443
.if.end.5443:
br label %.if.end.5355
.if.end.5355:
br label %.if.end.5346
.if.end.5346:
br label %.if.end.5335
.if.end.5335:
br label %.if.end.5329
.if.end.5329:
br label %.if.end.5240
.if.end.5240:
ret void
}
define %m2638$.Scope.type* @m295$get_scope.m2638$.Scope.typep.m2638$.CompilerCtx.typep.cp(%m2638$.CompilerCtx.type* %.ctx.arg, i8* %.scope_type.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%scope_type = alloca i8*
store i8* %.scope_type.arg, i8** %scope_type
%.tmp5536 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5537 = call %m2638$.ModuleLookup.type*(%m2638$.CompilerCtx.type*) @m295$get_current_module.m2638$.ModuleLookup.typep.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp5536)
%mod.5538 = alloca %m2638$.ModuleLookup.type*
store %m2638$.ModuleLookup.type* %.tmp5537, %m2638$.ModuleLookup.type** %mod.5538
%.tmp5540 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.5538
%.tmp5541 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp5540, i32 0, i32 3
%.tmp5542 = load %m2638$.Scope.type*, %m2638$.Scope.type** %.tmp5541
%s.5543 = alloca %m2638$.Scope.type*
store %m2638$.Scope.type* %.tmp5542, %m2638$.Scope.type** %s.5543
br label %.for.start.5539
.for.start.5539:
%.tmp5544 = load %m2638$.Scope.type*, %m2638$.Scope.type** %s.5543
%.tmp5545 = icmp ne %m2638$.Scope.type* %.tmp5544, null
br i1 %.tmp5545, label %.for.continue.5539, label %.for.end.5539
.for.continue.5539:
%.tmp5546 = load %m2638$.Scope.type*, %m2638$.Scope.type** %s.5543
%.tmp5547 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp5546, i32 0, i32 2
%.tmp5548 = load i8*, i8** %.tmp5547
%.tmp5549 = load i8*, i8** %scope_type
%.tmp5550 = call i32(i8*,i8*) @strcmp(i8* %.tmp5548, i8* %.tmp5549)
%.tmp5551 = icmp eq i32 %.tmp5550, 0
br i1 %.tmp5551, label %.if.true.5552, label %.if.false.5552
.if.true.5552:
%.tmp5553 = load %m2638$.Scope.type*, %m2638$.Scope.type** %s.5543
ret %m2638$.Scope.type* %.tmp5553
br label %.if.end.5552
.if.false.5552:
br label %.if.end.5552
.if.end.5552:
%.tmp5554 = load %m2638$.Scope.type*, %m2638$.Scope.type** %s.5543
%.tmp5555 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp5554, i32 0, i32 5
%.tmp5556 = load %m2638$.Scope.type*, %m2638$.Scope.type** %.tmp5555
store %m2638$.Scope.type* %.tmp5556, %m2638$.Scope.type** %s.5543
br label %.for.start.5539
.for.end.5539:
%.tmp5557 = bitcast ptr null to %m2638$.Scope.type*
ret %m2638$.Scope.type* %.tmp5557
}
define %m2638$.Type.type* @m295$type_ptr_of_chr.m2638$.Type.typep() {
%.tmp5558 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
%t.5559 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp5558, %m2638$.Type.type** %t.5559
%.tmp5560 = load %m2638$.Type.type*, %m2638$.Type.type** %t.5559
%.tmp5561 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5560, i32 0, i32 0
%.tmp5563 = getelementptr [4 x i8], [4 x i8]*@.str5562, i32 0, i32 0
store i8* %.tmp5563, i8** %.tmp5561
%.tmp5564 = load %m2638$.Type.type*, %m2638$.Type.type** %t.5559
%.tmp5565 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5564, i32 0, i32 3
%.tmp5566 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5566, %m2638$.Type.type** %.tmp5565
%.tmp5567 = load %m2638$.Type.type*, %m2638$.Type.type** %t.5559
%.tmp5568 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5567, i32 0, i32 3
%.tmp5569 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5568
%.tmp5570 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5569, i32 0, i32 0
%.tmp5572 = getelementptr [4 x i8], [4 x i8]*@.str5571, i32 0, i32 0
store i8* %.tmp5572, i8** %.tmp5570
%.tmp5573 = load %m2638$.Type.type*, %m2638$.Type.type** %t.5559
ret %m2638$.Type.type* %.tmp5573
}
define void @m295$compile_closure.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%.tmp5574 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5575 = call i32(%m2638$.CompilerCtx.type*) @m295$new_uid.i.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp5574)
%cj_id.5576 = alloca i32
store i32 %.tmp5575, i32* %cj_id.5576
%.tmp5577 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5578 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp5577)
%info_lit.5579 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp5578, %m2638$.AssignableInfo.type** %info_lit.5579
%.tmp5580 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_lit.5579
%.tmp5581 = load i8, i8* @SCOPE_GLOBAL
%.tmp5583 = getelementptr [21 x i8], [21 x i8]*@.str5582, i32 0, i32 0
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp5580, i8 %.tmp5581, i8* %.tmp5583)
%.tmp5584 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_lit.5579
%.tmp5585 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5584, i32 0, i32 4
%.tmp5586 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5586, %m2638$.Type.type** %.tmp5585
%.tmp5587 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_lit.5579
%.tmp5588 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5587, i32 0, i32 4
%.tmp5589 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5588
%.tmp5590 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5589, i32 0, i32 0
%.tmp5592 = getelementptr [9 x i8], [9 x i8]*@.str5591, i32 0, i32 0
store i8* %.tmp5592, i8** %.tmp5590
%.tmp5593 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_lit.5579
%.tmp5594 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5593, i32 0, i32 4
%.tmp5595 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5594
%.tmp5596 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5595, i32 0, i32 3
%.tmp5597 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5597, %m2638$.Type.type** %.tmp5596
%.tmp5598 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_lit.5579
%.tmp5599 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5598, i32 0, i32 4
%.tmp5600 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5599
%.tmp5601 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5600, i32 0, i32 3
%.tmp5602 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5601
%.tmp5603 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5602, i32 0, i32 0
%.tmp5605 = getelementptr [5 x i8], [5 x i8]*@.str5604, i32 0, i32 0
store i8* %.tmp5605, i8** %.tmp5603
%.tmp5606 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_lit.5579
%.tmp5607 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5606, i32 0, i32 4
%.tmp5608 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5607
%.tmp5609 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5608, i32 0, i32 3
%.tmp5610 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5609
%.tmp5611 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5610, i32 0, i32 4
%.tmp5612 = call %m2638$.Type.type*() @m295$type_ptr_of_chr.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5612, %m2638$.Type.type** %.tmp5611
%.tmp5613 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_lit.5579
%.tmp5614 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5613, i32 0, i32 4
%.tmp5615 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5614
%.tmp5616 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5615, i32 0, i32 3
%.tmp5617 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5616
%.tmp5618 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5617, i32 0, i32 4
%.tmp5619 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5618
%.tmp5620 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5619, i32 0, i32 4
%.tmp5621 = call %m2638$.Type.type*() @m295$type_ptr_of_chr.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5621, %m2638$.Type.type** %.tmp5620
%.tmp5622 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_lit.5579
%.tmp5623 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5622, i32 0, i32 4
%.tmp5624 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5623
%.tmp5625 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5624, i32 0, i32 3
%.tmp5626 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5625
%.tmp5627 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5626, i32 0, i32 4
%.tmp5628 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5627
%.tmp5629 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5628, i32 0, i32 4
%.tmp5630 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5629
%.tmp5631 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5630, i32 0, i32 4
%.tmp5632 = call %m2638$.Type.type*() @m295$type_ptr_of_chr.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5632, %m2638$.Type.type** %.tmp5631
%.tmp5633 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5635 = getelementptr [21 x i8], [21 x i8]*@.str5634, i32 0, i32 0
%.tmp5637 = getelementptr [7 x i8], [7 x i8]*@.str5636, i32 0, i32 0
%.tmp5638 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_lit.5579
call void(%m2638$.CompilerCtx.type*,i8*,i8*,%m2638$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2638$.CompilerCtx.typep.cp.cp.m2638$.AssignableInfo.typep.b.b(%m2638$.CompilerCtx.type* %.tmp5633, i8* %.tmp5635, i8* %.tmp5637, %m2638$.AssignableInfo.type* %.tmp5638, i1 1, i1 0)
%.tmp5639 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5640 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp5639)
%info_lat.5641 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp5640, %m2638$.AssignableInfo.type** %info_lat.5641
%.tmp5642 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_lat.5641
%.tmp5643 = load i8, i8* @SCOPE_GLOBAL
%.tmp5645 = getelementptr [23 x i8], [23 x i8]*@.str5644, i32 0, i32 0
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp5642, i8 %.tmp5643, i8* %.tmp5645)
%.tmp5646 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_lat.5641
%.tmp5647 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5646, i32 0, i32 4
%.tmp5648 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5648, %m2638$.Type.type** %.tmp5647
%.tmp5649 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_lat.5641
%.tmp5650 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5649, i32 0, i32 4
%.tmp5651 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5650
%.tmp5652 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5651, i32 0, i32 0
%.tmp5654 = getelementptr [9 x i8], [9 x i8]*@.str5653, i32 0, i32 0
store i8* %.tmp5654, i8** %.tmp5652
%.tmp5655 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_lat.5641
%.tmp5656 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5655, i32 0, i32 4
%.tmp5657 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5656
%.tmp5658 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5657, i32 0, i32 3
%.tmp5659 = call %m2638$.Type.type*() @m295$type_ptr_of_chr.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5659, %m2638$.Type.type** %.tmp5658
%.tmp5660 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_lat.5641
%.tmp5661 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5660, i32 0, i32 4
%.tmp5662 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5661
%.tmp5663 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5662, i32 0, i32 3
%.tmp5664 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5663
%.tmp5665 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5664, i32 0, i32 4
%.tmp5666 = call %m2638$.Type.type*() @m295$type_ptr_of_chr.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5666, %m2638$.Type.type** %.tmp5665
%.tmp5667 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5669 = getelementptr [23 x i8], [23 x i8]*@.str5668, i32 0, i32 0
%.tmp5671 = getelementptr [7 x i8], [7 x i8]*@.str5670, i32 0, i32 0
%.tmp5672 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_lat.5641
call void(%m2638$.CompilerCtx.type*,i8*,i8*,%m2638$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2638$.CompilerCtx.typep.cp.cp.m2638$.AssignableInfo.typep.b.b(%m2638$.CompilerCtx.type* %.tmp5667, i8* %.tmp5669, i8* %.tmp5671, %m2638$.AssignableInfo.type* %.tmp5672, i1 1, i1 0)
%.tmp5673 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5674 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp5673)
%info_mmap.5675 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp5674, %m2638$.AssignableInfo.type** %info_mmap.5675
%.tmp5676 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_mmap.5675
%.tmp5677 = load i8, i8* @SCOPE_GLOBAL
%.tmp5679 = getelementptr [5 x i8], [5 x i8]*@.str5678, i32 0, i32 0
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp5676, i8 %.tmp5677, i8* %.tmp5679)
%.tmp5680 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_mmap.5675
%.tmp5681 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5680, i32 0, i32 4
%.tmp5682 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5682, %m2638$.Type.type** %.tmp5681
%.tmp5683 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_mmap.5675
%.tmp5684 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5683, i32 0, i32 4
%.tmp5685 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5684
%.tmp5686 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5685, i32 0, i32 0
%.tmp5688 = getelementptr [9 x i8], [9 x i8]*@.str5687, i32 0, i32 0
store i8* %.tmp5688, i8** %.tmp5686
%.tmp5689 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_mmap.5675
%.tmp5690 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5689, i32 0, i32 4
%.tmp5691 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5690
%.tmp5692 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5691, i32 0, i32 3
%.tmp5693 = call %m2638$.Type.type*() @m295$type_ptr_of_chr.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5693, %m2638$.Type.type** %.tmp5692
%.tmp5694 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_mmap.5675
%.tmp5695 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5694, i32 0, i32 4
%.tmp5696 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5695
%.tmp5697 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5696, i32 0, i32 3
%.tmp5698 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5697
%lt.5699 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp5698, %m2638$.Type.type** %lt.5699
%.tmp5700 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5701 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5700, i32 0, i32 4
%.tmp5702 = call %m2638$.Type.type*() @m295$type_ptr_of_chr.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5702, %m2638$.Type.type** %.tmp5701
%.tmp5703 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5704 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5703, i32 0, i32 4
%.tmp5705 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5704
store %m2638$.Type.type* %.tmp5705, %m2638$.Type.type** %lt.5699
%.tmp5706 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5707 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5706, i32 0, i32 4
%.tmp5708 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5708, %m2638$.Type.type** %.tmp5707
%.tmp5709 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5710 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5709, i32 0, i32 4
%.tmp5711 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5710
%.tmp5712 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5711, i32 0, i32 0
%.tmp5714 = getelementptr [4 x i8], [4 x i8]*@.str5713, i32 0, i32 0
store i8* %.tmp5714, i8** %.tmp5712
%.tmp5715 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5716 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5715, i32 0, i32 4
%.tmp5717 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5716
store %m2638$.Type.type* %.tmp5717, %m2638$.Type.type** %lt.5699
%.tmp5718 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5719 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5718, i32 0, i32 4
%.tmp5720 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5720, %m2638$.Type.type** %.tmp5719
%.tmp5721 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5722 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5721, i32 0, i32 4
%.tmp5723 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5722
%.tmp5724 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5723, i32 0, i32 0
%.tmp5726 = getelementptr [4 x i8], [4 x i8]*@.str5725, i32 0, i32 0
store i8* %.tmp5726, i8** %.tmp5724
%.tmp5727 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5728 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5727, i32 0, i32 4
%.tmp5729 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5728
store %m2638$.Type.type* %.tmp5729, %m2638$.Type.type** %lt.5699
%.tmp5730 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5731 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5730, i32 0, i32 4
%.tmp5732 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5732, %m2638$.Type.type** %.tmp5731
%.tmp5733 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5734 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5733, i32 0, i32 4
%.tmp5735 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5734
%.tmp5736 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5735, i32 0, i32 0
%.tmp5738 = getelementptr [4 x i8], [4 x i8]*@.str5737, i32 0, i32 0
store i8* %.tmp5738, i8** %.tmp5736
%.tmp5739 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5740 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5739, i32 0, i32 4
%.tmp5741 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5740
store %m2638$.Type.type* %.tmp5741, %m2638$.Type.type** %lt.5699
%.tmp5742 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5743 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5742, i32 0, i32 4
%.tmp5744 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5744, %m2638$.Type.type** %.tmp5743
%.tmp5745 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5746 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5745, i32 0, i32 4
%.tmp5747 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5746
%.tmp5748 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5747, i32 0, i32 0
%.tmp5750 = getelementptr [4 x i8], [4 x i8]*@.str5749, i32 0, i32 0
store i8* %.tmp5750, i8** %.tmp5748
%.tmp5751 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5752 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5751, i32 0, i32 4
%.tmp5753 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5752
store %m2638$.Type.type* %.tmp5753, %m2638$.Type.type** %lt.5699
%.tmp5754 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5755 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5754, i32 0, i32 4
%.tmp5756 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5756, %m2638$.Type.type** %.tmp5755
%.tmp5757 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5758 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5757, i32 0, i32 4
%.tmp5759 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5758
%.tmp5760 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5759, i32 0, i32 0
%.tmp5762 = getelementptr [4 x i8], [4 x i8]*@.str5761, i32 0, i32 0
store i8* %.tmp5762, i8** %.tmp5760
%.tmp5763 = load %m2638$.Type.type*, %m2638$.Type.type** %lt.5699
%.tmp5764 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5763, i32 0, i32 4
%.tmp5765 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5764
store %m2638$.Type.type* %.tmp5765, %m2638$.Type.type** %lt.5699
%.tmp5766 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5768 = getelementptr [5 x i8], [5 x i8]*@.str5767, i32 0, i32 0
%.tmp5770 = getelementptr [7 x i8], [7 x i8]*@.str5769, i32 0, i32 0
%.tmp5771 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info_mmap.5675
call void(%m2638$.CompilerCtx.type*,i8*,i8*,%m2638$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2638$.CompilerCtx.typep.cp.cp.m2638$.AssignableInfo.typep.b.b(%m2638$.CompilerCtx.type* %.tmp5766, i8* %.tmp5768, i8* %.tmp5770, %m2638$.AssignableInfo.type* %.tmp5771, i1 1, i1 0)
%.tmp5772 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5773 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5772, i32 0, i32 6
%.tmp5774 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5773
%.tmp5776 = getelementptr [5 x i8], [5 x i8]*@.str5775, i32 0, i32 0
%.tmp5777 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp5774, i8* %.tmp5776)
%fn_name_node.5778 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp5777, %m981$.Node.type** %fn_name_node.5778
%.tmp5779 = load %m981$.Node.type*, %m981$.Node.type** %fn_name_node.5778
%.tmp5780 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5779, i32 0, i32 1
%.tmp5781 = load i8*, i8** %.tmp5780
%fn_name.5782 = alloca i8*
store i8* %.tmp5781, i8** %fn_name.5782
%.tmp5783 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5784 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp5783)
%info.5785 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp5784, %m2638$.AssignableInfo.type** %info.5785
%.tmp5786 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.5785
%.tmp5787 = load i8, i8* @SCOPE_LOCAL
%.tmp5788 = load i8*, i8** %fn_name.5782
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp5786, i8 %.tmp5787, i8* %.tmp5788)
%.tmp5789 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.5785
%.tmp5790 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5789, i32 0, i32 4
%.tmp5791 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5792 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5793 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5792, i32 0, i32 6
%.tmp5794 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5793
%.tmp5795 = call %m2638$.Type.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$syn_function_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp5791, %m981$.Node.type* %.tmp5794)
store %m2638$.Type.type* %.tmp5795, %m2638$.Type.type** %.tmp5790
%.tmp5796 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.5785
%.tmp5797 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5796, i32 0, i32 3
%.tmp5799 = getelementptr [9 x i8], [9 x i8]*@.str5798, i32 0, i32 0
store i8* %.tmp5799, i8** %.tmp5797
%.tmp5800 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5801 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5802 = load i8*, i8** %fn_name.5782
%.tmp5803 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.5785
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*,%m2638$.AssignableInfo.type*) @m295$define_assignable.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp5800, %m981$.Node.type* %.tmp5801, i8* %.tmp5802, %m2638$.AssignableInfo.type* %.tmp5803)
%.tmp5804 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5805 = call i32(%m2638$.CompilerCtx.type*) @m295$new_uid.i.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp5804)
%closure_id.5806 = alloca i32
store i32 %.tmp5805, i32* %closure_id.5806
%.tmp5807 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.5785
%.tmp5808 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5807, i32 0, i32 4
%.tmp5809 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5808
%.tmp5810 = call %m2638$.Type.type*(%m2638$.Type.type*) @m295$type_clone.m2638$.Type.typep.m2638$.Type.typep(%m2638$.Type.type* %.tmp5809)
%closure_type.5811 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp5810, %m2638$.Type.type** %closure_type.5811
%.tmp5812 = load %m2638$.Type.type*, %m2638$.Type.type** %closure_type.5811
%.tmp5813 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5812, i32 0, i32 3
%.tmp5814 = load %m2638$.Type.type*, %m2638$.Type.type** %closure_type.5811
%.tmp5815 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5814, i32 0, i32 3
%.tmp5816 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5815
%.tmp5817 = call %m2638$.Type.type*(%m2638$.Type.type*) @m295$type_clone.m2638$.Type.typep.m2638$.Type.typep(%m2638$.Type.type* %.tmp5816)
store %m2638$.Type.type* %.tmp5817, %m2638$.Type.type** %.tmp5813
%.tmp5818 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
%ctx_param.5819 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp5818, %m2638$.Type.type** %ctx_param.5819
%.tmp5820 = load %m2638$.Type.type*, %m2638$.Type.type** %ctx_param.5819
%.tmp5821 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5820, i32 0, i32 0
%.tmp5823 = getelementptr [4 x i8], [4 x i8]*@.str5822, i32 0, i32 0
store i8* %.tmp5823, i8** %.tmp5821
%.tmp5824 = load %m2638$.Type.type*, %m2638$.Type.type** %ctx_param.5819
%.tmp5825 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5824, i32 0, i32 3
%.tmp5826 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp5826, %m2638$.Type.type** %.tmp5825
%.tmp5827 = load %m2638$.Type.type*, %m2638$.Type.type** %ctx_param.5819
%.tmp5828 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5827, i32 0, i32 3
%.tmp5829 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5828
%.tmp5830 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5829, i32 0, i32 0
%.tmp5832 = getelementptr [7 x i8], [7 x i8]*@.str5831, i32 0, i32 0
store i8* %.tmp5832, i8** %.tmp5830
%.tmp5833 = load %m2638$.Type.type*, %m2638$.Type.type** %ctx_param.5819
%.tmp5834 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5833, i32 0, i32 4
%.tmp5835 = load %m2638$.Type.type*, %m2638$.Type.type** %closure_type.5811
%.tmp5836 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5835, i32 0, i32 3
%.tmp5837 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5836
%.tmp5838 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5837, i32 0, i32 4
%.tmp5839 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5838
store %m2638$.Type.type* %.tmp5839, %m2638$.Type.type** %.tmp5834
%.tmp5840 = load %m2638$.Type.type*, %m2638$.Type.type** %closure_type.5811
%.tmp5841 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5840, i32 0, i32 3
%.tmp5842 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5841
%.tmp5843 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5842, i32 0, i32 4
%.tmp5844 = load %m2638$.Type.type*, %m2638$.Type.type** %ctx_param.5819
store %m2638$.Type.type* %.tmp5844, %m2638$.Type.type** %.tmp5843
%.tmp5846 = getelementptr [1 x i8], [1 x i8]*@.str5845, i32 0, i32 0
%closure_name.5847 = alloca i8*
store i8* %.tmp5846, i8** %closure_name.5847
%.tmp5848 = getelementptr i8*, i8** %closure_name.5847, i32 0
%.tmp5850 = getelementptr [5 x i8], [5 x i8]*@.str5849, i32 0, i32 0
%.tmp5851 = load i32, i32* %closure_id.5806
%.tmp5852 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5848, i8* %.tmp5850, i32 %.tmp5851)
%.tmp5853 = load %m2638$.Type.type*, %m2638$.Type.type** %closure_type.5811
%.tmp5854 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5853, i32 0, i32 3
%.tmp5855 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5854
%.tmp5856 = call %m2638$.Type.type*(%m2638$.Type.type*) @m295$type_clone.m2638$.Type.typep.m2638$.Type.typep(%m2638$.Type.type* %.tmp5855)
%ret_type.5857 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp5856, %m2638$.Type.type** %ret_type.5857
%.tmp5858 = load %m2638$.Type.type*, %m2638$.Type.type** %ret_type.5857
%.tmp5859 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp5858, i32 0, i32 3
store %m2638$.Type.type* null, %m2638$.Type.type** %.tmp5859
%.tmp5860 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5861 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5860, i32 0, i32 1
%.tmp5862 = load %m0$.File.type*, %m0$.File.type** %.tmp5861
%.tmp5864 = getelementptr [101 x i8], [101 x i8]*@.str5863, i32 0, i32 0
%.tmp5865 = load i32, i32* %closure_id.5806
%.tmp5866 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5862, i8* %.tmp5864, i32 %.tmp5865)
%.tmp5867 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5868 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5867, i32 0, i32 1
%.tmp5869 = load %m0$.File.type*, %m0$.File.type** %.tmp5868
%.tmp5871 = getelementptr [100 x i8], [100 x i8]*@.str5870, i32 0, i32 0
%.tmp5872 = load i32, i32* %closure_id.5806
%.tmp5873 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5874 = load %m2638$.Type.type*, %m2638$.Type.type** %closure_type.5811
%.tmp5875 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5873, %m2638$.Type.type* %.tmp5874)
%.tmp5876 = load i8*, i8** %closure_name.5847
%.tmp5877 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5869, i8* %.tmp5871, i32 %.tmp5872, i8* %.tmp5875, i8* %.tmp5876)
%.tmp5878 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5879 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5878, i32 0, i32 1
%.tmp5880 = load %m0$.File.type*, %m0$.File.type** %.tmp5879
%.tmp5882 = getelementptr [66 x i8], [66 x i8]*@.str5881, i32 0, i32 0
%.tmp5883 = load i32, i32* %closure_id.5806
%.tmp5884 = load i32, i32* %closure_id.5806
%.tmp5885 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5880, i8* %.tmp5882, i32 %.tmp5883, i32 %.tmp5884)
%.tmp5886 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5887 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5886, i32 0, i32 1
%.tmp5888 = load %m0$.File.type*, %m0$.File.type** %.tmp5887
%.tmp5890 = getelementptr [35 x i8], [35 x i8]*@.str5889, i32 0, i32 0
%.tmp5891 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.5785
%.tmp5892 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp5891)
%.tmp5893 = load i32, i32* %closure_id.5806
%.tmp5894 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5895 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.5785
%.tmp5896 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp5895, i32 0, i32 4
%.tmp5897 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp5896
%.tmp5898 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5894, %m2638$.Type.type* %.tmp5897)
%.tmp5899 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5888, i8* %.tmp5890, i8* %.tmp5892, i32 %.tmp5893, i8* %.tmp5898)
%.tmp5900 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5901 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5900, i32 0, i32 1
%.tmp5902 = load %m0$.File.type*, %m0$.File.type** %.tmp5901
%bkp_ctx.5903 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp5902, %m0$.File.type** %bkp_ctx.5903
%.tmp5904 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5905 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5904, i32 0, i32 1
%.tmp5906 = call %m0$.File.type*() @tmpfile()
store %m0$.File.type* %.tmp5906, %m0$.File.type** %.tmp5905
%.tmp5907 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5908 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5907, i32 0, i32 1
%.tmp5909 = load %m0$.File.type*, %m0$.File.type** %.tmp5908
%.tmp5911 = getelementptr [14 x i8], [14 x i8]*@.str5910, i32 0, i32 0
%.tmp5912 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5913 = load %m2638$.Type.type*, %m2638$.Type.type** %ret_type.5857
%.tmp5914 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5912, %m2638$.Type.type* %.tmp5913)
%.tmp5915 = load i8*, i8** %closure_name.5847
%.tmp5916 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5909, i8* %.tmp5911, i8* %.tmp5914, i8* %.tmp5915)
%.tmp5917 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5919 = getelementptr [9 x i8], [9 x i8]*@.str5918, i32 0, i32 0
%.tmp5920 = bitcast ptr null to i8*
%.tmp5921 = bitcast ptr null to i8*
%.tmp5922 = load %m2638$.Type.type*, %m2638$.Type.type** %ret_type.5857
call void(%m2638$.CompilerCtx.type*,i8*,i8*,i8*,%m2638$.Type.type*) @m295$push_scope.v.m2638$.CompilerCtx.typep.cp.cp.cp.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5917, i8* %.tmp5919, i8* %.tmp5920, i8* %.tmp5921, %m2638$.Type.type* %.tmp5922)
%.tmp5923 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5924 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5923, i32 0, i32 1
%.tmp5925 = load %m0$.File.type*, %m0$.File.type** %.tmp5924
%.tmp5927 = getelementptr [13 x i8], [13 x i8]*@.str5926, i32 0, i32 0
%.tmp5928 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5929 = load %m2638$.Type.type*, %m2638$.Type.type** %ctx_param.5819
%.tmp5930 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5928, %m2638$.Type.type* %.tmp5929)
%.tmp5931 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5925, i8* %.tmp5927, i8* %.tmp5930)
%.tmp5932 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5933 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5932, i32 0, i32 6
%.tmp5934 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5933
%.tmp5935 = call %m981$.Node.type*(%m981$.Node.type*) @m295$syn_function_params.m981$.Node.typep.m981$.Node.typep(%m981$.Node.type* %.tmp5934)
%params.5936 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp5935, %m981$.Node.type** %params.5936
%param_type.5937 = alloca %m2638$.Type.type*
store %m2638$.Type.type* null, %m2638$.Type.type** %param_type.5937
%.tmp5939 = load %m981$.Node.type*, %m981$.Node.type** %params.5936
%param_ptr.5940 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp5939, %m981$.Node.type** %param_ptr.5940
br label %.for.start.5938
.for.start.5938:
%.tmp5941 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.5940
%.tmp5942 = icmp ne %m981$.Node.type* %.tmp5941, null
br i1 %.tmp5942, label %.for.continue.5938, label %.for.end.5938
.for.continue.5938:
%.tmp5943 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.5940
%.tmp5944 = load %m981$.Node.type*, %m981$.Node.type** %params.5936
%.tmp5945 = icmp ne %m981$.Node.type* %.tmp5943, %.tmp5944
br i1 %.tmp5945, label %.if.true.5946, label %.if.false.5946
.if.true.5946:
%.tmp5947 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.5940
%.tmp5948 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5947, i32 0, i32 7
%.tmp5949 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5948
store %m981$.Node.type* %.tmp5949, %m981$.Node.type** %param_ptr.5940
br label %.if.end.5946
.if.false.5946:
br label %.if.end.5946
.if.end.5946:
%.tmp5950 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5951 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5950, i32 0, i32 1
%.tmp5952 = load %m0$.File.type*, %m0$.File.type** %.tmp5951
%.tmp5954 = getelementptr [3 x i8], [3 x i8]*@.str5953, i32 0, i32 0
%.tmp5955 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5952, i8* %.tmp5954)
%.tmp5956 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.5940
%.tmp5957 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5956, i32 0, i32 0
%.tmp5958 = load i8*, i8** %.tmp5957
%.tmp5960 = getelementptr [5 x i8], [5 x i8]*@.str5959, i32 0, i32 0
%.tmp5961 = call i32(i8*,i8*) @strcmp(i8* %.tmp5958, i8* %.tmp5960)
%.tmp5962 = icmp eq i32 %.tmp5961, 0
br i1 %.tmp5962, label %.if.true.5963, label %.if.false.5963
.if.true.5963:
%.tmp5964 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5965 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.5940
%.tmp5966 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5965, i32 0, i32 6
%.tmp5967 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5966
%.tmp5968 = call %m2638$.Type.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$node_to_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp5964, %m981$.Node.type* %.tmp5967)
store %m2638$.Type.type* %.tmp5968, %m2638$.Type.type** %param_type.5937
%.tmp5969 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.5940
%.tmp5970 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5969, i32 0, i32 7
%.tmp5971 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5970
store %m981$.Node.type* %.tmp5971, %m981$.Node.type** %param_ptr.5940
br label %.if.end.5963
.if.false.5963:
br label %.if.end.5963
.if.end.5963:
%.tmp5972 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5973 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5972, i32 0, i32 1
%.tmp5974 = load %m0$.File.type*, %m0$.File.type** %.tmp5973
%.tmp5976 = getelementptr [13 x i8], [13 x i8]*@.str5975, i32 0, i32 0
%.tmp5977 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5978 = load %m2638$.Type.type*, %m2638$.Type.type** %param_type.5937
%.tmp5979 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp5977, %m2638$.Type.type* %.tmp5978)
%.tmp5980 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.5940
%.tmp5981 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5980, i32 0, i32 1
%.tmp5982 = load i8*, i8** %.tmp5981
%.tmp5983 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5974, i8* %.tmp5976, i8* %.tmp5979, i8* %.tmp5982)
%.tmp5984 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.5940
%.tmp5985 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5984, i32 0, i32 7
%.tmp5986 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5985
store %m981$.Node.type* %.tmp5986, %m981$.Node.type** %param_ptr.5940
br label %.for.start.5938
.for.end.5938:
%.tmp5987 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5988 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp5987, i32 0, i32 1
%.tmp5989 = load %m0$.File.type*, %m0$.File.type** %.tmp5988
%.tmp5991 = getelementptr [5 x i8], [5 x i8]*@.str5990, i32 0, i32 0
%.tmp5992 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5989, i8* %.tmp5991)
%.tmp5993 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp5994 = load %m981$.Node.type*, %m981$.Node.type** %params.5936
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_fn_params.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp5993, %m981$.Node.type* %.tmp5994)
%.tmp5995 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp5996 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp5995, i32 0, i32 6
%.tmp5997 = load %m981$.Node.type*, %m981$.Node.type** %.tmp5996
%.tmp5999 = getelementptr [6 x i8], [6 x i8]*@.str5998, i32 0, i32 0
%.tmp6000 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp5997, i8* %.tmp5999)
%block.6001 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6000, %m981$.Node.type** %block.6001
%.tmp6002 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6003 = load %m981$.Node.type*, %m981$.Node.type** %block.6001
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_block.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp6002, %m981$.Node.type* %.tmp6003)
%.tmp6004 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6005 = load %m981$.Node.type*, %m981$.Node.type** %block.6001
%.tmp6006 = load %m2638$.Type.type*, %m2638$.Type.type** %ret_type.5857
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,%m2638$.Type.type*) @m295$check_n_add_implicit_return.v.m2638$.CompilerCtx.typep.m981$.Node.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp6004, %m981$.Node.type* %.tmp6005, %m2638$.Type.type* %.tmp6006)
%.tmp6007 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
call void(%m2638$.CompilerCtx.type*) @m295$pop_scope.v.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp6007)
%.tmp6008 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6009 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6008, i32 0, i32 1
%.tmp6010 = load %m0$.File.type*, %m0$.File.type** %.tmp6009
%.tmp6012 = getelementptr [3 x i8], [3 x i8]*@.str6011, i32 0, i32 0
%.tmp6013 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6010, i8* %.tmp6012)
%.tmp6014 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6015 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6014, i32 0, i32 1
%.tmp6016 = load %m0$.File.type*, %m0$.File.type** %.tmp6015
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp6016)
%.tmp6017 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6018 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6017, i32 0, i32 1
%.tmp6019 = load %m0$.File.type*, %m0$.File.type** %.tmp6018
%.tmp6020 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6019)
%.tmp6021 = call i8*(i32) @m1$readall.cp.i(i32 %.tmp6020)
%code.6022 = alloca i8*
store i8* %.tmp6021, i8** %code.6022
%.tmp6023 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6024 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6023, i32 0, i32 1
%.tmp6025 = load %m0$.File.type*, %m0$.File.type** %.tmp6024
%.tmp6026 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp6025)
%.tmp6027 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6028 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6027, i32 0, i32 1
%.tmp6029 = load %m0$.File.type*, %m0$.File.type** %bkp_ctx.5903
store %m0$.File.type* %.tmp6029, %m0$.File.type** %.tmp6028
%.tmp6030 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6031 = load i8*, i8** %code.6022
call void(%m2638$.CompilerCtx.type*,i8*) @m295$append_anon_fn.v.m2638$.CompilerCtx.typep.cp(%m2638$.CompilerCtx.type* %.tmp6030, i8* %.tmp6031)
ret void
}
define void @m295$check_n_add_implicit_return.v.m2638$.CompilerCtx.typep.m981$.Node.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg, %m2638$.Type.type* %.return_type.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%return_type = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.return_type.arg, %m2638$.Type.type** %return_type
%.tmp6032 = bitcast ptr null to %m981$.Node.type*
%li.6033 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6032, %m981$.Node.type** %li.6033
%.tmp6034 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6035 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6034, i32 0, i32 6
%.tmp6036 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6035
%.tmp6038 = getelementptr [12 x i8], [12 x i8]*@.str6037, i32 0, i32 0
%.tmp6039 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp6036, i8* %.tmp6038)
%exprs.6040 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6039, %m981$.Node.type** %exprs.6040
%.tmp6042 = load %m981$.Node.type*, %m981$.Node.type** %exprs.6040
%.tmp6043 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6042, i32 0, i32 6
%.tmp6044 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6043
%ci.6045 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6044, %m981$.Node.type** %ci.6045
br label %.for.start.6041
.for.start.6041:
%.tmp6046 = load %m981$.Node.type*, %m981$.Node.type** %ci.6045
%.tmp6047 = icmp ne %m981$.Node.type* %.tmp6046, null
br i1 %.tmp6047, label %.for.continue.6041, label %.for.end.6041
.for.continue.6041:
%.tmp6048 = load %m981$.Node.type*, %m981$.Node.type** %ci.6045
%.tmp6049 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6048, i32 0, i32 0
%.tmp6050 = load i8*, i8** %.tmp6049
%.tmp6052 = getelementptr [3 x i8], [3 x i8]*@.str6051, i32 0, i32 0
%.tmp6053 = call i32(i8*,i8*) @strcmp(i8* %.tmp6050, i8* %.tmp6052)
%.tmp6054 = icmp ne i32 %.tmp6053, 0
br i1 %.tmp6054, label %.if.true.6055, label %.if.false.6055
.if.true.6055:
%.tmp6056 = load %m981$.Node.type*, %m981$.Node.type** %ci.6045
store %m981$.Node.type* %.tmp6056, %m981$.Node.type** %li.6033
br label %.if.end.6055
.if.false.6055:
br label %.if.end.6055
.if.end.6055:
%.tmp6057 = load %m981$.Node.type*, %m981$.Node.type** %ci.6045
%.tmp6058 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6057, i32 0, i32 7
%.tmp6059 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6058
store %m981$.Node.type* %.tmp6059, %m981$.Node.type** %ci.6045
br label %.for.start.6041
.for.end.6041:
%.tmp6060 = load %m981$.Node.type*, %m981$.Node.type** %li.6033
%.tmp6061 = icmp ne %m981$.Node.type* %.tmp6060, null
br i1 %.tmp6061, label %.if.true.6062, label %.if.false.6062
.if.true.6062:
%.tmp6063 = load %m981$.Node.type*, %m981$.Node.type** %li.6033
%.tmp6064 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6063, i32 0, i32 6
%.tmp6065 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6064
%.tmp6066 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6065, i32 0, i32 0
%.tmp6067 = load i8*, i8** %.tmp6066
%.tmp6069 = getelementptr [7 x i8], [7 x i8]*@.str6068, i32 0, i32 0
%.tmp6070 = call i32(i8*,i8*) @strcmp(i8* %.tmp6067, i8* %.tmp6069)
%.tmp6071 = icmp eq i32 %.tmp6070, 0
br i1 %.tmp6071, label %.if.true.6072, label %.if.false.6072
.if.true.6072:
ret void
br label %.if.end.6072
.if.false.6072:
br label %.if.end.6072
.if.end.6072:
br label %.if.end.6062
.if.false.6062:
br label %.if.end.6062
.if.end.6062:
%.tmp6073 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6074 = load %m2638$.Type.type*, %m2638$.Type.type** %return_type
%.tmp6075 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp6073, %m2638$.Type.type* %.tmp6074)
%.tmp6077 = getelementptr [5 x i8], [5 x i8]*@.str6076, i32 0, i32 0
%.tmp6078 = call i32(i8*,i8*) @strcmp(i8* %.tmp6075, i8* %.tmp6077)
%.tmp6079 = icmp ne i32 %.tmp6078, 0
br i1 %.tmp6079, label %.if.true.6080, label %.if.false.6080
.if.true.6080:
%.tmp6081 = load %m981$.Node.type*, %m981$.Node.type** %li.6033
%.tmp6082 = icmp ne %m981$.Node.type* %.tmp6081, null
br i1 %.tmp6082, label %.if.true.6083, label %.if.false.6083
.if.true.6083:
%.tmp6084 = load %m981$.Node.type*, %m981$.Node.type** %li.6033
store %m981$.Node.type* %.tmp6084, %m981$.Node.type** %stmt
br label %.if.end.6083
.if.false.6083:
br label %.if.end.6083
.if.end.6083:
%.tmp6085 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6086 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6088 = getelementptr [21 x i8], [21 x i8]*@.str6087, i32 0, i32 0
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp6085, %m981$.Node.type* %.tmp6086, i8* %.tmp6088)
br label %.if.end.6080
.if.false.6080:
%.tmp6089 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6090 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6089, i32 0, i32 1
%.tmp6091 = load %m0$.File.type*, %m0$.File.type** %.tmp6090
%.tmp6093 = getelementptr [10 x i8], [10 x i8]*@.str6092, i32 0, i32 0
%.tmp6094 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6091, i8* %.tmp6093)
br label %.if.end.6080
.if.end.6080:
ret void
}
define void @m295$compile_for_loop.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%.tmp6095 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6096 = call i32(%m2638$.CompilerCtx.type*) @m295$new_uid.i.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp6095)
%for_id.6097 = alloca i32
store i32 %.tmp6096, i32* %for_id.6097
%.tmp6098 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6099 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6098, i32 0, i32 6
%.tmp6100 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6099
%.tmp6101 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6100, i32 0, i32 7
%.tmp6102 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6101
%init_stmt.6103 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6102, %m981$.Node.type** %init_stmt.6103
%.tmp6104 = bitcast ptr null to i8*
%begin_lbl.6105 = alloca i8*
store i8* %.tmp6104, i8** %begin_lbl.6105
%.tmp6106 = bitcast ptr null to i8*
%end_lbl.6107 = alloca i8*
store i8* %.tmp6106, i8** %end_lbl.6107
%.tmp6108 = getelementptr i8*, i8** %begin_lbl.6105, i32 0
%.tmp6110 = getelementptr [14 x i8], [14 x i8]*@.str6109, i32 0, i32 0
%.tmp6111 = load i32, i32* %for_id.6097
%.tmp6112 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6108, i8* %.tmp6110, i32 %.tmp6111)
%.tmp6113 = getelementptr i8*, i8** %end_lbl.6107, i32 0
%.tmp6115 = getelementptr [12 x i8], [12 x i8]*@.str6114, i32 0, i32 0
%.tmp6116 = load i32, i32* %for_id.6097
%.tmp6117 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6113, i8* %.tmp6115, i32 %.tmp6116)
%.tmp6118 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6120 = getelementptr [4 x i8], [4 x i8]*@.str6119, i32 0, i32 0
%.tmp6121 = load i8*, i8** %begin_lbl.6105
%.tmp6122 = load i8*, i8** %end_lbl.6107
%.tmp6123 = bitcast ptr null to %m2638$.Type.type*
call void(%m2638$.CompilerCtx.type*,i8*,i8*,i8*,%m2638$.Type.type*) @m295$push_scope.v.m2638$.CompilerCtx.typep.cp.cp.cp.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp6118, i8* %.tmp6120, i8* %.tmp6121, i8* %.tmp6122, %m2638$.Type.type* %.tmp6123)
%.tmp6124 = load %m981$.Node.type*, %m981$.Node.type** %init_stmt.6103
%.tmp6125 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6124, i32 0, i32 0
%.tmp6126 = load i8*, i8** %.tmp6125
%.tmp6128 = getelementptr [12 x i8], [12 x i8]*@.str6127, i32 0, i32 0
%.tmp6129 = call i32(i8*,i8*) @strcmp(i8* %.tmp6126, i8* %.tmp6128)
%.tmp6130 = icmp eq i32 %.tmp6129, 0
br i1 %.tmp6130, label %.if.true.6131, label %.if.false.6131
.if.true.6131:
%.tmp6132 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6133 = load %m981$.Node.type*, %m981$.Node.type** %init_stmt.6103
%.tmp6134 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_declaration.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp6132, %m981$.Node.type* %.tmp6133)
br label %.if.end.6131
.if.false.6131:
%.tmp6135 = load %m981$.Node.type*, %m981$.Node.type** %init_stmt.6103
%.tmp6136 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6135, i32 0, i32 0
%.tmp6137 = load i8*, i8** %.tmp6136
%.tmp6139 = getelementptr [11 x i8], [11 x i8]*@.str6138, i32 0, i32 0
%.tmp6140 = call i32(i8*,i8*) @strcmp(i8* %.tmp6137, i8* %.tmp6139)
%.tmp6141 = icmp eq i32 %.tmp6140, 0
br i1 %.tmp6141, label %.if.true.6142, label %.if.false.6142
.if.true.6142:
%.tmp6143 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6144 = load %m981$.Node.type*, %m981$.Node.type** %init_stmt.6103
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_expression.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp6143, %m981$.Node.type* %.tmp6144)
br label %.if.end.6142
.if.false.6142:
%.tmp6145 = load %m981$.Node.type*, %m981$.Node.type** %init_stmt.6103
%.tmp6146 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6145, i32 0, i32 0
%.tmp6147 = load i8*, i8** %.tmp6146
%.tmp6149 = getelementptr [9 x i8], [9 x i8]*@.str6148, i32 0, i32 0
%.tmp6150 = call i32(i8*,i8*) @strcmp(i8* %.tmp6147, i8* %.tmp6149)
%.tmp6151 = icmp eq i32 %.tmp6150, 0
br i1 %.tmp6151, label %.if.true.6152, label %.if.false.6152
.if.true.6152:
br label %.if.end.6152
.if.false.6152:
%.tmp6153 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6154 = load %m981$.Node.type*, %m981$.Node.type** %init_stmt.6103
%.tmp6156 = getelementptr [66 x i8], [66 x i8]*@.str6155, i32 0, i32 0
%.tmp6157 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$err_tmpl.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp6153, %m981$.Node.type* %.tmp6154, i8* %.tmp6156)
%.tmp6158 = load %m981$.Node.type*, %m981$.Node.type** %init_stmt.6103
%.tmp6159 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6158, i32 0, i32 0
%.tmp6160 = load i8*, i8** %.tmp6159
%.tmp6161 = call i32(i8*,...) @printf(i8* %.tmp6157, i8* %.tmp6160)
%.tmp6162 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
call void(%m2638$.CompilerCtx.type*) @m295$pop_scope.v.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp6162)
ret void
br label %.if.end.6152
.if.end.6152:
br label %.if.end.6142
.if.end.6142:
br label %.if.end.6131
.if.end.6131:
%.tmp6163 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6164 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6163, i32 0, i32 1
%.tmp6165 = load %m0$.File.type*, %m0$.File.type** %.tmp6164
%.tmp6167 = getelementptr [26 x i8], [26 x i8]*@.str6166, i32 0, i32 0
%.tmp6168 = load i32, i32* %for_id.6097
%.tmp6169 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6165, i8* %.tmp6167, i32 %.tmp6168)
%.tmp6170 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6171 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6170, i32 0, i32 1
%.tmp6172 = load %m0$.File.type*, %m0$.File.type** %.tmp6171
%.tmp6174 = getelementptr [16 x i8], [16 x i8]*@.str6173, i32 0, i32 0
%.tmp6175 = load i32, i32* %for_id.6097
%.tmp6176 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6172, i8* %.tmp6174, i32 %.tmp6175)
%.tmp6177 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6178 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6177, i32 0, i32 6
%.tmp6179 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6178
%.tmp6181 = getelementptr [9 x i8], [9 x i8]*@.str6180, i32 0, i32 0
%.tmp6182 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp6179, i8* %.tmp6181)
%fst_colon.6183 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6182, %m981$.Node.type** %fst_colon.6183
%.tmp6184 = load %m981$.Node.type*, %m981$.Node.type** %fst_colon.6183
%.tmp6185 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6184, i32 0, i32 7
%.tmp6186 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6185
%condition.6187 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6186, %m981$.Node.type** %condition.6187
%.tmp6188 = load %m981$.Node.type*, %m981$.Node.type** %condition.6187
%.tmp6189 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6188, i32 0, i32 0
%.tmp6190 = load i8*, i8** %.tmp6189
%.tmp6192 = getelementptr [9 x i8], [9 x i8]*@.str6191, i32 0, i32 0
%.tmp6193 = call i32(i8*,i8*) @strcmp(i8* %.tmp6190, i8* %.tmp6192)
%.tmp6194 = icmp eq i32 %.tmp6193, 0
br i1 %.tmp6194, label %.if.true.6195, label %.if.false.6195
.if.true.6195:
%.tmp6196 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6197 = load %m981$.Node.type*, %m981$.Node.type** %condition.6187
%.tmp6199 = getelementptr [39 x i8], [39 x i8]*@.str6198, i32 0, i32 0
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp6196, %m981$.Node.type* %.tmp6197, i8* %.tmp6199)
ret void
br label %.if.end.6195
.if.false.6195:
br label %.if.end.6195
.if.end.6195:
%.tmp6200 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6201 = load %m981$.Node.type*, %m981$.Node.type** %condition.6187
%.tmp6202 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_assignable.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp6200, %m981$.Node.type* %.tmp6201)
%condition_info.6203 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp6202, %m2638$.AssignableInfo.type** %condition_info.6203
%.tmp6204 = load %m981$.Node.type*, %m981$.Node.type** %fst_colon.6183
%.tmp6205 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6204, i32 0, i32 7
%.tmp6206 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6205
%.tmp6208 = getelementptr [9 x i8], [9 x i8]*@.str6207, i32 0, i32 0
%.tmp6209 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp6206, i8* %.tmp6208)
%snd_colon.6210 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6209, %m981$.Node.type** %snd_colon.6210
%.tmp6211 = load %m981$.Node.type*, %m981$.Node.type** %snd_colon.6210
%.tmp6213 = getelementptr [6 x i8], [6 x i8]*@.str6212, i32 0, i32 0
%.tmp6214 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp6211, i8* %.tmp6213)
%for_body.6215 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6214, %m981$.Node.type** %for_body.6215
%.tmp6216 = load %m981$.Node.type*, %m981$.Node.type** %for_body.6215
%.tmp6218 = getelementptr [11 x i8], [11 x i8]*@.str6217, i32 0, i32 0
%.tmp6219 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp6216, i8* %.tmp6218)
%else_block.6220 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6219, %m981$.Node.type** %else_block.6220
%.tmp6221 = load i8*, i8** %end_lbl.6107
%on_end.6222 = alloca i8*
store i8* %.tmp6221, i8** %on_end.6222
%.tmp6223 = load %m981$.Node.type*, %m981$.Node.type** %else_block.6220
%.tmp6224 = icmp ne %m981$.Node.type* %.tmp6223, null
br i1 %.tmp6224, label %.if.true.6225, label %.if.false.6225
.if.true.6225:
%.tmp6226 = getelementptr i8*, i8** %on_end.6222, i32 0
%.tmp6228 = getelementptr [13 x i8], [13 x i8]*@.str6227, i32 0, i32 0
%.tmp6229 = load i32, i32* %for_id.6097
%.tmp6230 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6226, i8* %.tmp6228, i32 %.tmp6229)
br label %.if.end.6225
.if.false.6225:
br label %.if.end.6225
.if.end.6225:
%.tmp6231 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6232 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6231, i32 0, i32 1
%.tmp6233 = load %m0$.File.type*, %m0$.File.type** %.tmp6232
%.tmp6235 = getelementptr [48 x i8], [48 x i8]*@.str6234, i32 0, i32 0
%.tmp6236 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6237 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %condition_info.6203
%.tmp6238 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6237, i32 0, i32 4
%.tmp6239 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6238
%.tmp6240 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp6236, %m2638$.Type.type* %.tmp6239)
%.tmp6241 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %condition_info.6203
%.tmp6242 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp6241)
%.tmp6243 = load i32, i32* %for_id.6097
%.tmp6244 = load i8*, i8** %on_end.6222
%.tmp6245 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6233, i8* %.tmp6235, i8* %.tmp6240, i8* %.tmp6242, i32 %.tmp6243, i8* %.tmp6244)
%.tmp6246 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6247 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6246, i32 0, i32 1
%.tmp6248 = load %m0$.File.type*, %m0$.File.type** %.tmp6247
%.tmp6250 = getelementptr [19 x i8], [19 x i8]*@.str6249, i32 0, i32 0
%.tmp6251 = load i32, i32* %for_id.6097
%.tmp6252 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6248, i8* %.tmp6250, i32 %.tmp6251)
%.tmp6253 = load %m981$.Node.type*, %m981$.Node.type** %snd_colon.6210
%.tmp6254 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6253, i32 0, i32 7
%.tmp6255 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6254
%increment.6256 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6255, %m981$.Node.type** %increment.6256
%.tmp6257 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6258 = load %m981$.Node.type*, %m981$.Node.type** %for_body.6215
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_block.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp6257, %m981$.Node.type* %.tmp6258)
%.tmp6259 = load %m981$.Node.type*, %m981$.Node.type** %increment.6256
%.tmp6260 = load %m981$.Node.type*, %m981$.Node.type** %for_body.6215
%.tmp6261 = icmp ne %m981$.Node.type* %.tmp6259, %.tmp6260
br i1 %.tmp6261, label %.if.true.6262, label %.if.false.6262
.if.true.6262:
%.tmp6263 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6264 = load %m981$.Node.type*, %m981$.Node.type** %increment.6256
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_expression.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp6263, %m981$.Node.type* %.tmp6264)
br label %.if.end.6262
.if.false.6262:
br label %.if.end.6262
.if.end.6262:
%.tmp6265 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6266 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6265, i32 0, i32 1
%.tmp6267 = load %m0$.File.type*, %m0$.File.type** %.tmp6266
%.tmp6269 = getelementptr [15 x i8], [15 x i8]*@.str6268, i32 0, i32 0
%.tmp6270 = load i8*, i8** %begin_lbl.6105
%.tmp6271 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6267, i8* %.tmp6269, i8* %.tmp6270)
%.tmp6272 = load %m981$.Node.type*, %m981$.Node.type** %else_block.6220
%.tmp6273 = icmp ne %m981$.Node.type* %.tmp6272, null
br i1 %.tmp6273, label %.if.true.6274, label %.if.false.6274
.if.true.6274:
%.tmp6275 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6276 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6275, i32 0, i32 1
%.tmp6277 = load %m0$.File.type*, %m0$.File.type** %.tmp6276
%.tmp6279 = getelementptr [15 x i8], [15 x i8]*@.str6278, i32 0, i32 0
%.tmp6280 = load i32, i32* %for_id.6097
%.tmp6281 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6277, i8* %.tmp6279, i32 %.tmp6280)
%.tmp6282 = load %m981$.Node.type*, %m981$.Node.type** %else_block.6220
%.tmp6283 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6282, i32 0, i32 6
%.tmp6284 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6283
%.tmp6286 = getelementptr [6 x i8], [6 x i8]*@.str6285, i32 0, i32 0
%.tmp6287 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp6284, i8* %.tmp6286)
%block.6288 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6287, %m981$.Node.type** %block.6288
%.tmp6289 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6290 = load %m981$.Node.type*, %m981$.Node.type** %block.6288
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_block.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp6289, %m981$.Node.type* %.tmp6290)
%.tmp6291 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6292 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6291, i32 0, i32 1
%.tmp6293 = load %m0$.File.type*, %m0$.File.type** %.tmp6292
%.tmp6295 = getelementptr [15 x i8], [15 x i8]*@.str6294, i32 0, i32 0
%.tmp6296 = load i8*, i8** %end_lbl.6107
%.tmp6297 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6293, i8* %.tmp6295, i8* %.tmp6296)
br label %.if.end.6274
.if.false.6274:
br label %.if.end.6274
.if.end.6274:
%.tmp6298 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6299 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6298, i32 0, i32 1
%.tmp6300 = load %m0$.File.type*, %m0$.File.type** %.tmp6299
%.tmp6302 = getelementptr [5 x i8], [5 x i8]*@.str6301, i32 0, i32 0
%.tmp6303 = load i8*, i8** %end_lbl.6107
%.tmp6304 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6300, i8* %.tmp6302, i8* %.tmp6303)
%.tmp6305 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
call void(%m2638$.CompilerCtx.type*) @m295$pop_scope.v.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp6305)
ret void
}
define %m2638$.AssignableInfo.type* @m295$compile_declaration.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%.tmp6306 = bitcast ptr null to %m2638$.Type.type*
%decl_type.6307 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp6306, %m2638$.Type.type** %decl_type.6307
%.tmp6308 = bitcast ptr null to %m2638$.AssignableInfo.type*
%a_info.6309 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp6308, %m2638$.AssignableInfo.type** %a_info.6309
%.tmp6310 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6311 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6310, i32 0, i32 6
%.tmp6312 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6311
%.tmp6313 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6312, i32 0, i32 0
%.tmp6314 = load i8*, i8** %.tmp6313
%.tmp6316 = getelementptr [5 x i8], [5 x i8]*@.str6315, i32 0, i32 0
%.tmp6317 = call i32(i8*,i8*) @strcmp(i8* %.tmp6314, i8* %.tmp6316)
%.tmp6318 = icmp eq i32 %.tmp6317, 0
br i1 %.tmp6318, label %.if.true.6319, label %.if.false.6319
.if.true.6319:
%.tmp6320 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6321 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6322 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6321, i32 0, i32 6
%.tmp6323 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6322
%.tmp6324 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6323, i32 0, i32 6
%.tmp6325 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6324
%.tmp6326 = call %m2638$.Type.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$node_to_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp6320, %m981$.Node.type* %.tmp6325)
store %m2638$.Type.type* %.tmp6326, %m2638$.Type.type** %decl_type.6307
br label %.if.end.6319
.if.false.6319:
br label %.if.end.6319
.if.end.6319:
%.tmp6327 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6328 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6327, i32 0, i32 6
%.tmp6329 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6328
%.tmp6331 = getelementptr [11 x i8], [11 x i8]*@.str6330, i32 0, i32 0
%.tmp6332 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp6329, i8* %.tmp6331)
%assignable.6333 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6332, %m981$.Node.type** %assignable.6333
%.tmp6334 = load %m981$.Node.type*, %m981$.Node.type** %assignable.6333
%.tmp6335 = icmp ne %m981$.Node.type* %.tmp6334, null
br i1 %.tmp6335, label %.if.true.6336, label %.if.false.6336
.if.true.6336:
%.tmp6337 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6338 = load %m981$.Node.type*, %m981$.Node.type** %assignable.6333
%.tmp6339 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_assignable.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp6337, %m981$.Node.type* %.tmp6338)
store %m2638$.AssignableInfo.type* %.tmp6339, %m2638$.AssignableInfo.type** %a_info.6309
br label %.if.end.6336
.if.false.6336:
br label %.if.end.6336
.if.end.6336:
%.tmp6340 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6341 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp6340)
%info.6342 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp6341, %m2638$.AssignableInfo.type** %info.6342
%.tmp6343 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.6342
%.tmp6344 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6343, i32 0, i32 3
%.tmp6346 = getelementptr [9 x i8], [9 x i8]*@.str6345, i32 0, i32 0
store i8* %.tmp6346, i8** %.tmp6344
%.tmp6347 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6348 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6347, i32 0, i32 6
%.tmp6349 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6348
%.tmp6351 = getelementptr [5 x i8], [5 x i8]*@.str6350, i32 0, i32 0
%.tmp6352 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp6349, i8* %.tmp6351)
%var_name.6353 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6352, %m981$.Node.type** %var_name.6353
%.tmp6354 = load %m981$.Node.type*, %m981$.Node.type** %var_name.6353
%.tmp6355 = icmp eq %m981$.Node.type* %.tmp6354, null
br i1 %.tmp6355, label %.if.true.6356, label %.if.false.6356
.if.true.6356:
%.tmp6357 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6358 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6360 = getelementptr [31 x i8], [31 x i8]*@.str6359, i32 0, i32 0
%.tmp6361 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$err_tmpl.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp6357, %m981$.Node.type* %.tmp6358, i8* %.tmp6360)
%.tmp6362 = call i32(i8*,...) @printf(i8* %.tmp6361)
%.tmp6363 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp6363
br label %.if.end.6356
.if.false.6356:
br label %.if.end.6356
.if.end.6356:
%.tmp6364 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6365 = call %m2638$.ModuleLookup.type*(%m2638$.CompilerCtx.type*) @m295$get_current_module.m2638$.ModuleLookup.typep.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp6364)
%mod.6366 = alloca %m2638$.ModuleLookup.type*
store %m2638$.ModuleLookup.type* %.tmp6365, %m2638$.ModuleLookup.type** %mod.6366
%.tmp6367 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6368 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.6366
%.tmp6369 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp6368, i32 0, i32 3
%.tmp6370 = load %m2638$.Scope.type*, %m2638$.Scope.type** %.tmp6369
%.tmp6371 = load %m981$.Node.type*, %m981$.Node.type** %var_name.6353
%.tmp6372 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6371, i32 0, i32 1
%.tmp6373 = load i8*, i8** %.tmp6372
%.tmp6374 = call %m2638$.ScopeItem.type*(%m2638$.CompilerCtx.type*,%m2638$.Scope.type*,i8*) @m295$find_defined_here.m2638$.ScopeItem.typep.m2638$.CompilerCtx.typep.m2638$.Scope.typep.cp(%m2638$.CompilerCtx.type* %.tmp6367, %m2638$.Scope.type* %.tmp6370, i8* %.tmp6373)
%.tmp6375 = icmp ne %m2638$.ScopeItem.type* %.tmp6374, null
br i1 %.tmp6375, label %.if.true.6376, label %.if.false.6376
.if.true.6376:
%err_buf.6377 = alloca i8*
store i8* null, i8** %err_buf.6377
%.tmp6378 = getelementptr i8*, i8** %err_buf.6377, i32 0
%.tmp6380 = getelementptr [43 x i8], [43 x i8]*@.str6379, i32 0, i32 0
%.tmp6381 = load %m981$.Node.type*, %m981$.Node.type** %var_name.6353
%.tmp6382 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6381, i32 0, i32 1
%.tmp6383 = load i8*, i8** %.tmp6382
%.tmp6384 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6378, i8* %.tmp6380, i8* %.tmp6383)
%.tmp6385 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6386 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6387 = load i8*, i8** %err_buf.6377
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp6385, %m981$.Node.type* %.tmp6386, i8* %.tmp6387)
%.tmp6388 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp6388
br label %.if.end.6376
.if.false.6376:
br label %.if.end.6376
.if.end.6376:
%var_id.6389 = alloca i8*
store i8* null, i8** %var_id.6389
%.tmp6390 = getelementptr i8*, i8** %var_id.6389, i32 0
%.tmp6392 = getelementptr [6 x i8], [6 x i8]*@.str6391, i32 0, i32 0
%.tmp6393 = load %m981$.Node.type*, %m981$.Node.type** %var_name.6353
%.tmp6394 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6393, i32 0, i32 1
%.tmp6395 = load i8*, i8** %.tmp6394
%.tmp6396 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6397 = call i32(%m2638$.CompilerCtx.type*) @m295$new_uid.i.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp6396)
%.tmp6398 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6390, i8* %.tmp6392, i8* %.tmp6395, i32 %.tmp6397)
%.tmp6399 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.6342
%.tmp6400 = load i8, i8* @SCOPE_LOCAL
%.tmp6401 = load i8*, i8** %var_id.6389
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp6399, i8 %.tmp6400, i8* %.tmp6401)
%.tmp6402 = load %m2638$.Type.type*, %m2638$.Type.type** %decl_type.6307
%.tmp6403 = icmp ne %m2638$.Type.type* %.tmp6402, null
br i1 %.tmp6403, label %.if.true.6404, label %.if.false.6404
.if.true.6404:
%.tmp6405 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.6342
%.tmp6406 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6405, i32 0, i32 4
%.tmp6407 = load %m2638$.Type.type*, %m2638$.Type.type** %decl_type.6307
store %m2638$.Type.type* %.tmp6407, %m2638$.Type.type** %.tmp6406
br label %.if.end.6404
.if.false.6404:
%.tmp6408 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.6309
%.tmp6409 = icmp ne %m2638$.AssignableInfo.type* %.tmp6408, null
br i1 %.tmp6409, label %.if.true.6410, label %.if.false.6410
.if.true.6410:
%.tmp6411 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.6342
%.tmp6412 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6411, i32 0, i32 4
%.tmp6413 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.6309
%.tmp6414 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6413, i32 0, i32 4
%.tmp6415 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6414
store %m2638$.Type.type* %.tmp6415, %m2638$.Type.type** %.tmp6412
br label %.if.end.6410
.if.false.6410:
br label %.if.end.6410
.if.end.6410:
br label %.if.end.6404
.if.end.6404:
%.tmp6416 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6417 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.6342
%.tmp6418 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6417, i32 0, i32 4
%.tmp6419 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6418
%.tmp6420 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp6416, %m2638$.Type.type* %.tmp6419)
%var_type_repr.6421 = alloca i8*
store i8* %.tmp6420, i8** %var_type_repr.6421
%.tmp6422 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.6309
%.tmp6423 = icmp ne %m2638$.AssignableInfo.type* %.tmp6422, null
br i1 %.tmp6423, label %.if.true.6424, label %.if.false.6424
.if.true.6424:
%.tmp6425 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6426 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.6309
%.tmp6427 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6426, i32 0, i32 4
%.tmp6428 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6427
%.tmp6429 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp6425, %m2638$.Type.type* %.tmp6428)
%a_type_repr.6430 = alloca i8*
store i8* %.tmp6429, i8** %a_type_repr.6430
%.tmp6431 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6432 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.6309
%.tmp6433 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6432, i32 0, i32 4
%.tmp6434 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6433
%.tmp6435 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.6342
%.tmp6436 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6435, i32 0, i32 4
%.tmp6437 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6436
%.tmp6438 = call i1(%m2638$.CompilerCtx.type*,%m2638$.Type.type*,%m2638$.Type.type*) @m2639$cmp.b.m2638$.CompilerCtx.typep.m2638$.Type.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp6431, %m2638$.Type.type* %.tmp6434, %m2638$.Type.type* %.tmp6437)
%.tmp6439 = icmp eq i1 %.tmp6438, 0
br i1 %.tmp6439, label %.if.true.6440, label %.if.false.6440
.if.true.6440:
%.tmp6441 = bitcast ptr null to i8*
%err_msg.6442 = alloca i8*
store i8* %.tmp6441, i8** %err_msg.6442
%.tmp6443 = getelementptr i8*, i8** %err_msg.6442, i32 0
%.tmp6445 = getelementptr [49 x i8], [49 x i8]*@.str6444, i32 0, i32 0
%.tmp6446 = load i8*, i8** %a_type_repr.6430
%.tmp6447 = load i8*, i8** %var_type_repr.6421
%.tmp6448 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6443, i8* %.tmp6445, i8* %.tmp6446, i8* %.tmp6447)
%.tmp6449 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6450 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6451 = load i8*, i8** %err_msg.6442
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp6449, %m981$.Node.type* %.tmp6450, i8* %.tmp6451)
br label %.if.end.6440
.if.false.6440:
br label %.if.end.6440
.if.end.6440:
br label %.if.end.6424
.if.false.6424:
br label %.if.end.6424
.if.end.6424:
%.tmp6452 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6453 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6454 = load %m981$.Node.type*, %m981$.Node.type** %var_name.6353
%.tmp6455 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6454, i32 0, i32 1
%.tmp6456 = load i8*, i8** %.tmp6455
%.tmp6457 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.6342
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*,%m2638$.AssignableInfo.type*) @m295$define_assignable.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp6452, %m981$.Node.type* %.tmp6453, i8* %.tmp6456, %m2638$.AssignableInfo.type* %.tmp6457)
%.tmp6458 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6459 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6458, i32 0, i32 1
%.tmp6460 = load %m0$.File.type*, %m0$.File.type** %.tmp6459
%.tmp6462 = getelementptr [16 x i8], [16 x i8]*@.str6461, i32 0, i32 0
%.tmp6463 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.6342
%.tmp6464 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp6463)
%.tmp6465 = load i8*, i8** %var_type_repr.6421
%.tmp6466 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6460, i8* %.tmp6462, i8* %.tmp6464, i8* %.tmp6465)
%.tmp6467 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.6309
%.tmp6468 = icmp ne %m2638$.AssignableInfo.type* %.tmp6467, null
br i1 %.tmp6468, label %.if.true.6469, label %.if.false.6469
.if.true.6469:
%.tmp6470 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6471 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6470, i32 0, i32 1
%.tmp6472 = load %m0$.File.type*, %m0$.File.type** %.tmp6471
%.tmp6474 = getelementptr [21 x i8], [21 x i8]*@.str6473, i32 0, i32 0
%.tmp6475 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6476 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.6309
%.tmp6477 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6476, i32 0, i32 4
%.tmp6478 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6477
%.tmp6479 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp6475, %m2638$.Type.type* %.tmp6478)
%.tmp6480 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.6309
%.tmp6481 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp6480)
%.tmp6482 = load i8*, i8** %var_type_repr.6421
%.tmp6483 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.6342
%.tmp6484 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp6483)
%.tmp6485 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6472, i8* %.tmp6474, i8* %.tmp6479, i8* %.tmp6481, i8* %.tmp6482, i8* %.tmp6484)
br label %.if.end.6469
.if.false.6469:
%.tmp6486 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6487 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6488 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.6342
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,%m2638$.AssignableInfo.type*) @m295$compile_zero_value.v.m2638$.CompilerCtx.typep.m981$.Node.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp6486, %m981$.Node.type* %.tmp6487, %m2638$.AssignableInfo.type* %.tmp6488)
br label %.if.end.6469
.if.end.6469:
%.tmp6489 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.6342
ret %m2638$.AssignableInfo.type* %.tmp6489
}
define void @m295$compile_zero_value.v.m2638$.CompilerCtx.typep.m981$.Node.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg, %m2638$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%info = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.info.arg, %m2638$.AssignableInfo.type** %info
%.tmp6490 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp6491 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6490, i32 0, i32 4
%.tmp6492 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6491
%.tmp6493 = icmp eq %m2638$.Type.type* %.tmp6492, null
br i1 %.tmp6493, label %.if.true.6494, label %.if.false.6494
.if.true.6494:
ret void
br label %.if.end.6494
.if.false.6494:
br label %.if.end.6494
.if.end.6494:
%.tmp6495 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6496 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp6497 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6496, i32 0, i32 4
%.tmp6498 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6497
%.tmp6499 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp6495, %m2638$.Type.type* %.tmp6498)
%t_repr.6500 = alloca i8*
store i8* %.tmp6499, i8** %t_repr.6500
%.tmp6501 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp6502 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp6501)
%id.6503 = alloca i8*
store i8* %.tmp6502, i8** %id.6503
%field_id.6504 = alloca i32
store i32 0, i32* %field_id.6504
%field.6505 = alloca %m2638$.Type.type*
store %m2638$.Type.type* null, %m2638$.Type.type** %field.6505
%field_info.6506 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* null, %m2638$.AssignableInfo.type** %field_info.6506
%.tmp6507 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp6508 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6507, i32 0, i32 4
%.tmp6509 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6508
%t.6510 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp6509, %m2638$.Type.type** %t.6510
%.tmp6511 = load %m2638$.Type.type*, %m2638$.Type.type** %t.6510
%.tmp6512 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp6511, i32 0, i32 0
%.tmp6513 = load i8*, i8** %.tmp6512
%.tmp6515 = getelementptr [4 x i8], [4 x i8]*@.str6514, i32 0, i32 0
%.tmp6516 = call i32(i8*,i8*) @strcmp(i8* %.tmp6513, i8* %.tmp6515)
%.tmp6517 = icmp eq i32 %.tmp6516, 0
%.tmp6518 = load %m2638$.Type.type*, %m2638$.Type.type** %t.6510
%.tmp6519 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp6518, i32 0, i32 0
%.tmp6520 = load i8*, i8** %.tmp6519
%.tmp6522 = getelementptr [4 x i8], [4 x i8]*@.str6521, i32 0, i32 0
%.tmp6523 = call i32(i8*,i8*) @strcmp(i8* %.tmp6520, i8* %.tmp6522)
%.tmp6524 = icmp eq i32 %.tmp6523, 0
%.tmp6525 = or i1 %.tmp6517, %.tmp6524
%.tmp6526 = load %m2638$.Type.type*, %m2638$.Type.type** %t.6510
%.tmp6527 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp6526, i32 0, i32 0
%.tmp6528 = load i8*, i8** %.tmp6527
%.tmp6530 = getelementptr [5 x i8], [5 x i8]*@.str6529, i32 0, i32 0
%.tmp6531 = call i32(i8*,i8*) @strcmp(i8* %.tmp6528, i8* %.tmp6530)
%.tmp6532 = icmp eq i32 %.tmp6531, 0
%.tmp6533 = or i1 %.tmp6525, %.tmp6532
br i1 %.tmp6533, label %.if.true.6534, label %.if.false.6534
.if.true.6534:
%.tmp6535 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6536 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6535, i32 0, i32 1
%.tmp6537 = load %m0$.File.type*, %m0$.File.type** %.tmp6536
%.tmp6539 = getelementptr [21 x i8], [21 x i8]*@.str6538, i32 0, i32 0
%.tmp6540 = load i8*, i8** %t_repr.6500
%.tmp6541 = load i8*, i8** %t_repr.6500
%.tmp6542 = load i8*, i8** %id.6503
%.tmp6543 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6537, i8* %.tmp6539, i8* %.tmp6540, i32 0, i8* %.tmp6541, i8* %.tmp6542)
br label %.if.end.6534
.if.false.6534:
%.tmp6544 = load %m2638$.Type.type*, %m2638$.Type.type** %t.6510
%.tmp6545 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp6544, i32 0, i32 0
%.tmp6546 = load i8*, i8** %.tmp6545
%.tmp6548 = getelementptr [4 x i8], [4 x i8]*@.str6547, i32 0, i32 0
%.tmp6549 = call i32(i8*,i8*) @strcmp(i8* %.tmp6546, i8* %.tmp6548)
%.tmp6550 = icmp eq i32 %.tmp6549, 0
br i1 %.tmp6550, label %.if.true.6551, label %.if.false.6551
.if.true.6551:
%.tmp6552 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6553 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6552, i32 0, i32 1
%.tmp6554 = load %m0$.File.type*, %m0$.File.type** %.tmp6553
%.tmp6556 = getelementptr [21 x i8], [21 x i8]*@.str6555, i32 0, i32 0
%.tmp6557 = load i8*, i8** %t_repr.6500
%.tmp6559 = getelementptr [5 x i8], [5 x i8]*@.str6558, i32 0, i32 0
%.tmp6560 = load i8*, i8** %t_repr.6500
%.tmp6561 = load i8*, i8** %id.6503
%.tmp6562 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6554, i8* %.tmp6556, i8* %.tmp6557, i8* %.tmp6559, i8* %.tmp6560, i8* %.tmp6561)
br label %.if.end.6551
.if.false.6551:
%.tmp6563 = load %m2638$.Type.type*, %m2638$.Type.type** %t.6510
%.tmp6564 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp6563, i32 0, i32 0
%.tmp6565 = load i8*, i8** %.tmp6564
%.tmp6567 = getelementptr [7 x i8], [7 x i8]*@.str6566, i32 0, i32 0
%.tmp6568 = call i32(i8*,i8*) @strcmp(i8* %.tmp6565, i8* %.tmp6567)
%.tmp6569 = icmp eq i32 %.tmp6568, 0
br i1 %.tmp6569, label %.if.true.6570, label %.if.false.6570
.if.true.6570:
%.tmp6572 = load %m2638$.Type.type*, %m2638$.Type.type** %t.6510
%.tmp6573 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp6572, i32 0, i32 3
%.tmp6574 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6573
store %m2638$.Type.type* %.tmp6574, %m2638$.Type.type** %field.6505
br label %.for.start.6571
.for.start.6571:
%.tmp6575 = load %m2638$.Type.type*, %m2638$.Type.type** %field.6505
%.tmp6576 = icmp ne %m2638$.Type.type* %.tmp6575, null
br i1 %.tmp6576, label %.for.continue.6571, label %.for.end.6571
.for.continue.6571:
%.tmp6577 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6578 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp6577)
store %m2638$.AssignableInfo.type* %.tmp6578, %m2638$.AssignableInfo.type** %field_info.6506
%.tmp6579 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6580 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %field_info.6506
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp6579, %m2638$.AssignableInfo.type* %.tmp6580)
%.tmp6581 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %field_info.6506
%.tmp6582 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6581, i32 0, i32 4
%.tmp6583 = load %m2638$.Type.type*, %m2638$.Type.type** %field.6505
store %m2638$.Type.type* %.tmp6583, %m2638$.Type.type** %.tmp6582
%.tmp6584 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6585 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6584, i32 0, i32 1
%.tmp6586 = load %m0$.File.type*, %m0$.File.type** %.tmp6585
%.tmp6588 = getelementptr [46 x i8], [46 x i8]*@.str6587, i32 0, i32 0
%.tmp6589 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %field_info.6506
%.tmp6590 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp6589)
%.tmp6591 = load i8*, i8** %t_repr.6500
%.tmp6592 = load i8*, i8** %t_repr.6500
%.tmp6593 = load i8*, i8** %id.6503
%.tmp6594 = load i32, i32* %field_id.6504
%.tmp6595 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6586, i8* %.tmp6588, i8* %.tmp6590, i8* %.tmp6591, i8* %.tmp6592, i8* %.tmp6593, i32 %.tmp6594)
%.tmp6596 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6597 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6598 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %field_info.6506
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,%m2638$.AssignableInfo.type*) @m295$compile_zero_value.v.m2638$.CompilerCtx.typep.m981$.Node.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp6596, %m981$.Node.type* %.tmp6597, %m2638$.AssignableInfo.type* %.tmp6598)
%.tmp6599 = load i32, i32* %field_id.6504
%.tmp6600 = add i32 %.tmp6599, 1
store i32 %.tmp6600, i32* %field_id.6504
%.tmp6601 = load %m2638$.Type.type*, %m2638$.Type.type** %field.6505
%.tmp6602 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp6601, i32 0, i32 4
%.tmp6603 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6602
store %m2638$.Type.type* %.tmp6603, %m2638$.Type.type** %field.6505
br label %.for.start.6571
.for.end.6571:
br label %.if.end.6570
.if.false.6570:
%.tmp6604 = load %m2638$.Type.type*, %m2638$.Type.type** %t.6510
%.tmp6605 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp6604, i32 0, i32 0
%.tmp6606 = load i8*, i8** %.tmp6605
%.tmp6608 = getelementptr [10 x i8], [10 x i8]*@.str6607, i32 0, i32 0
%.tmp6609 = call i32(i8*,i8*) @strcmp(i8* %.tmp6606, i8* %.tmp6608)
%.tmp6610 = icmp eq i32 %.tmp6609, 0
br i1 %.tmp6610, label %.if.true.6611, label %.if.false.6611
.if.true.6611:
%.tmp6613 = load %m2638$.Type.type*, %m2638$.Type.type** %t.6510
%.tmp6614 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp6613, i32 0, i32 3
%.tmp6615 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6614
%.tmp6616 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp6615, i32 0, i32 3
%.tmp6617 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6616
store %m2638$.Type.type* %.tmp6617, %m2638$.Type.type** %field.6505
br label %.for.start.6612
.for.start.6612:
%.tmp6618 = load %m2638$.Type.type*, %m2638$.Type.type** %field.6505
%.tmp6619 = icmp ne %m2638$.Type.type* %.tmp6618, null
br i1 %.tmp6619, label %.for.continue.6612, label %.for.end.6612
.for.continue.6612:
%.tmp6620 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6621 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp6620)
store %m2638$.AssignableInfo.type* %.tmp6621, %m2638$.AssignableInfo.type** %field_info.6506
%.tmp6622 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6623 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %field_info.6506
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp6622, %m2638$.AssignableInfo.type* %.tmp6623)
%.tmp6624 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %field_info.6506
%.tmp6625 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6624, i32 0, i32 4
%.tmp6626 = load %m2638$.Type.type*, %m2638$.Type.type** %field.6505
store %m2638$.Type.type* %.tmp6626, %m2638$.Type.type** %.tmp6625
%.tmp6627 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6628 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6627, i32 0, i32 1
%.tmp6629 = load %m0$.File.type*, %m0$.File.type** %.tmp6628
%.tmp6631 = getelementptr [46 x i8], [46 x i8]*@.str6630, i32 0, i32 0
%.tmp6632 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %field_info.6506
%.tmp6633 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp6632)
%.tmp6634 = load i8*, i8** %t_repr.6500
%.tmp6635 = load i8*, i8** %t_repr.6500
%.tmp6636 = load i8*, i8** %id.6503
%.tmp6637 = load i32, i32* %field_id.6504
%.tmp6638 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6629, i8* %.tmp6631, i8* %.tmp6633, i8* %.tmp6634, i8* %.tmp6635, i8* %.tmp6636, i32 %.tmp6637)
%.tmp6639 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6640 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6641 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %field_info.6506
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,%m2638$.AssignableInfo.type*) @m295$compile_zero_value.v.m2638$.CompilerCtx.typep.m981$.Node.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp6639, %m981$.Node.type* %.tmp6640, %m2638$.AssignableInfo.type* %.tmp6641)
%.tmp6642 = load i32, i32* %field_id.6504
%.tmp6643 = add i32 %.tmp6642, 1
store i32 %.tmp6643, i32* %field_id.6504
%.tmp6644 = load %m2638$.Type.type*, %m2638$.Type.type** %field.6505
%.tmp6645 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp6644, i32 0, i32 4
%.tmp6646 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6645
store %m2638$.Type.type* %.tmp6646, %m2638$.Type.type** %field.6505
br label %.for.start.6612
.for.end.6612:
br label %.if.end.6611
.if.false.6611:
%.tmp6647 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6648 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6650 = getelementptr [44 x i8], [44 x i8]*@.str6649, i32 0, i32 0
%.tmp6651 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$err_tmpl.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp6647, %m981$.Node.type* %.tmp6648, i8* %.tmp6650)
%.tmp6652 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp6653 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6652, i32 0, i32 4
%.tmp6654 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6653
%.tmp6655 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp6654, i32 0, i32 0
%.tmp6656 = load i8*, i8** %.tmp6655
%.tmp6657 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6658 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp6659 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6658, i32 0, i32 4
%.tmp6660 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6659
%.tmp6661 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp6657, %m2638$.Type.type* %.tmp6660)
%.tmp6662 = call i32(i8*,...) @printf(i8* %.tmp6651, i8* %.tmp6656, i8* %.tmp6661)
ret void
br label %.if.end.6611
.if.end.6611:
br label %.if.end.6570
.if.end.6570:
br label %.if.end.6551
.if.end.6551:
br label %.if.end.6534
.if.end.6534:
ret void
}
define void @m295$compile_if_block.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%.tmp6663 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6664 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6663, i32 0, i32 6
%.tmp6665 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6664
%.tmp6667 = getelementptr [11 x i8], [11 x i8]*@.str6666, i32 0, i32 0
%.tmp6668 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp6665, i8* %.tmp6667)
%assignable.6669 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6668, %m981$.Node.type** %assignable.6669
%.tmp6670 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6671 = load %m981$.Node.type*, %m981$.Node.type** %assignable.6669
%.tmp6672 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_assignable.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp6670, %m981$.Node.type* %.tmp6671)
%a_info.6673 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp6672, %m2638$.AssignableInfo.type** %a_info.6673
%.tmp6674 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.6673
%.tmp6675 = icmp eq %m2638$.AssignableInfo.type* %.tmp6674, null
br i1 %.tmp6675, label %.if.true.6676, label %.if.false.6676
.if.true.6676:
ret void
br label %.if.end.6676
.if.false.6676:
br label %.if.end.6676
.if.end.6676:
%.tmp6677 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6678 = call i32(%m2638$.CompilerCtx.type*) @m295$new_uid.i.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp6677)
%if_id.6679 = alloca i32
store i32 %.tmp6678, i32* %if_id.6679
%.tmp6680 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6681 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6680, i32 0, i32 1
%.tmp6682 = load %m0$.File.type*, %m0$.File.type** %.tmp6681
%.tmp6684 = getelementptr [53 x i8], [53 x i8]*@.str6683, i32 0, i32 0
%.tmp6685 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6686 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.6673
%.tmp6687 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6686, i32 0, i32 4
%.tmp6688 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp6687
%.tmp6689 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp6685, %m2638$.Type.type* %.tmp6688)
%.tmp6690 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %a_info.6673
%.tmp6691 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp6690)
%.tmp6692 = load i32, i32* %if_id.6679
%.tmp6693 = load i32, i32* %if_id.6679
%.tmp6694 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6682, i8* %.tmp6684, i8* %.tmp6689, i8* %.tmp6691, i32 %.tmp6692, i32 %.tmp6693)
%.tmp6695 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6696 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6695, i32 0, i32 1
%.tmp6697 = load %m0$.File.type*, %m0$.File.type** %.tmp6696
%.tmp6699 = getelementptr [14 x i8], [14 x i8]*@.str6698, i32 0, i32 0
%.tmp6700 = load i32, i32* %if_id.6679
%.tmp6701 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6697, i8* %.tmp6699, i32 %.tmp6700)
%.tmp6702 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6703 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6702, i32 0, i32 6
%.tmp6704 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6703
%.tmp6706 = getelementptr [6 x i8], [6 x i8]*@.str6705, i32 0, i32 0
%.tmp6707 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp6704, i8* %.tmp6706)
%block.6708 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6707, %m981$.Node.type** %block.6708
%.tmp6709 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6710 = load %m981$.Node.type*, %m981$.Node.type** %block.6708
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_block.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp6709, %m981$.Node.type* %.tmp6710)
%.tmp6711 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6712 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6711, i32 0, i32 1
%.tmp6713 = load %m0$.File.type*, %m0$.File.type** %.tmp6712
%.tmp6715 = getelementptr [23 x i8], [23 x i8]*@.str6714, i32 0, i32 0
%.tmp6716 = load i32, i32* %if_id.6679
%.tmp6717 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6713, i8* %.tmp6715, i32 %.tmp6716)
%.tmp6718 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6719 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6718, i32 0, i32 1
%.tmp6720 = load %m0$.File.type*, %m0$.File.type** %.tmp6719
%.tmp6722 = getelementptr [15 x i8], [15 x i8]*@.str6721, i32 0, i32 0
%.tmp6723 = load i32, i32* %if_id.6679
%.tmp6724 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6720, i8* %.tmp6722, i32 %.tmp6723)
%.tmp6725 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6726 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6725, i32 0, i32 6
%.tmp6727 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6726
%.tmp6729 = getelementptr [11 x i8], [11 x i8]*@.str6728, i32 0, i32 0
%.tmp6730 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp6727, i8* %.tmp6729)
%else_block.6731 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp6730, %m981$.Node.type** %else_block.6731
%.tmp6732 = load %m981$.Node.type*, %m981$.Node.type** %else_block.6731
%.tmp6733 = icmp ne %m981$.Node.type* %.tmp6732, null
br i1 %.tmp6733, label %.if.true.6734, label %.if.false.6734
.if.true.6734:
%.tmp6735 = load %m981$.Node.type*, %m981$.Node.type** %else_block.6731
%.tmp6736 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6735, i32 0, i32 6
%.tmp6737 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6736
%.tmp6738 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6737, i32 0, i32 0
%.tmp6739 = load i8*, i8** %.tmp6738
%.tmp6741 = getelementptr [11 x i8], [11 x i8]*@.str6740, i32 0, i32 0
%.tmp6742 = call i32(i8*,i8*) @strcmp(i8* %.tmp6739, i8* %.tmp6741)
%.tmp6743 = icmp eq i32 %.tmp6742, 0
br i1 %.tmp6743, label %.if.true.6744, label %.if.false.6744
.if.true.6744:
%.tmp6745 = load %m981$.Node.type*, %m981$.Node.type** %else_block.6731
%.tmp6746 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6745, i32 0, i32 6
%.tmp6747 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6746
%.tmp6748 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6747, i32 0, i32 6
%.tmp6749 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6748
%.tmp6751 = getelementptr [6 x i8], [6 x i8]*@.str6750, i32 0, i32 0
%.tmp6752 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp6749, i8* %.tmp6751)
store %m981$.Node.type* %.tmp6752, %m981$.Node.type** %block.6708
%.tmp6753 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6754 = load %m981$.Node.type*, %m981$.Node.type** %block.6708
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_block.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp6753, %m981$.Node.type* %.tmp6754)
br label %.if.end.6744
.if.false.6744:
%.tmp6755 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6756 = load %m981$.Node.type*, %m981$.Node.type** %else_block.6731
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_if_block.v.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp6755, %m981$.Node.type* %.tmp6756)
br label %.if.end.6744
.if.end.6744:
br label %.if.end.6734
.if.false.6734:
br label %.if.end.6734
.if.end.6734:
%.tmp6757 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6758 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6757, i32 0, i32 1
%.tmp6759 = load %m0$.File.type*, %m0$.File.type** %.tmp6758
%.tmp6761 = getelementptr [23 x i8], [23 x i8]*@.str6760, i32 0, i32 0
%.tmp6762 = load i32, i32* %if_id.6679
%.tmp6763 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6759, i8* %.tmp6761, i32 %.tmp6762)
%.tmp6764 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6765 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6764, i32 0, i32 1
%.tmp6766 = load %m0$.File.type*, %m0$.File.type** %.tmp6765
%.tmp6768 = getelementptr [13 x i8], [13 x i8]*@.str6767, i32 0, i32 0
%.tmp6769 = load i32, i32* %if_id.6679
%.tmp6770 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6766, i8* %.tmp6768, i32 %.tmp6769)
ret void
}
define void @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%curr_node = alloca %m981$.Node.type*
store %m981$.Node.type* %.curr_node.arg, %m981$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp6771 = load %m981$.Node.type*, %m981$.Node.type** %curr_node
%.tmp6772 = icmp ne %m981$.Node.type* %.tmp6771, null
br i1 %.tmp6772, label %.if.true.6773, label %.if.false.6773
.if.true.6773:
%.tmp6774 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6775 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6774, i32 0, i32 7
%.tmp6776 = load i8*, i8** %.tmp6775
%.tmp6777 = load %m981$.Node.type*, %m981$.Node.type** %curr_node
%.tmp6778 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6777, i32 0, i32 3
%.tmp6779 = load i32, i32* %.tmp6778
%.tmp6780 = load %m981$.Node.type*, %m981$.Node.type** %curr_node
%.tmp6781 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6780, i32 0, i32 4
%.tmp6782 = load i32, i32* %.tmp6781
%.tmp6783 = load i8*, i8** %msg
%.tmp6784 = call %m296$.Error.type*(i8*,i32,i32,i8*) @m296$new.m296$.Error.typep.cp.i.i.cp(i8* %.tmp6776, i32 %.tmp6779, i32 %.tmp6782, i8* %.tmp6783)
%err.6785 = alloca %m296$.Error.type*
store %m296$.Error.type* %.tmp6784, %m296$.Error.type** %err.6785
%.tmp6786 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6787 = load %m296$.Error.type*, %m296$.Error.type** %err.6785
call void(%m2638$.CompilerCtx.type*,%m296$.Error.type*) @m295$append_error.v.m2638$.CompilerCtx.typep.m296$.Error.typep(%m2638$.CompilerCtx.type* %.tmp6786, %m296$.Error.type* %.tmp6787)
br label %.if.end.6773
.if.false.6773:
%.tmp6789 = getelementptr [61 x i8], [61 x i8]*@.str6788, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp6789)
br label %.if.end.6773
.if.end.6773:
ret void
}
define void @m295$define_assignable.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg, i8* %.name.arg, %m2638$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.info.arg, %m2638$.AssignableInfo.type** %info
%.tmp6790 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6791 = call %m2638$.ModuleLookup.type*(%m2638$.CompilerCtx.type*) @m295$get_current_module.m2638$.ModuleLookup.typep.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp6790)
%mod.6792 = alloca %m2638$.ModuleLookup.type*
store %m2638$.ModuleLookup.type* %.tmp6791, %m2638$.ModuleLookup.type** %mod.6792
%.tmp6793 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.6792
%.tmp6794 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp6793, i32 0, i32 3
%.tmp6795 = load %m2638$.Scope.type*, %m2638$.Scope.type** %.tmp6794
%.tmp6796 = icmp ne %m2638$.Scope.type* %.tmp6795, null
%.tmp6798 = getelementptr [82 x i8], [82 x i8]*@.str6797, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6796, i8* %.tmp6798)
%.tmp6799 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.6792
%.tmp6800 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp6799, i32 0, i32 3
%.tmp6801 = load %m2638$.Scope.type*, %m2638$.Scope.type** %.tmp6800
%current_scope.6802 = alloca %m2638$.Scope.type*
store %m2638$.Scope.type* %.tmp6801, %m2638$.Scope.type** %current_scope.6802
%.tmp6803 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* null, i32 1
%.tmp6804 = ptrtoint %m2638$.ScopeItem.type* %.tmp6803 to i32
%.tmp6805 = call i8*(i32) @malloc(i32 %.tmp6804)
%.tmp6806 = bitcast i8* %.tmp6805 to %m2638$.ScopeItem.type*
%newitem.6807 = alloca %m2638$.ScopeItem.type*
store %m2638$.ScopeItem.type* %.tmp6806, %m2638$.ScopeItem.type** %newitem.6807
%.tmp6808 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %newitem.6807
%.tmp6809 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp6808, i32 0, i32 0
%.tmp6810 = load i8*, i8** %name
store i8* %.tmp6810, i8** %.tmp6809
%.tmp6811 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %newitem.6807
%.tmp6812 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp6811, i32 0, i32 1
%.tmp6813 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
store %m2638$.AssignableInfo.type* %.tmp6813, %m2638$.AssignableInfo.type** %.tmp6812
%.tmp6814 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %newitem.6807
%.tmp6815 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp6814, i32 0, i32 2
store %m2638$.ScopeItem.type* null, %m2638$.ScopeItem.type** %.tmp6815
%.tmp6816 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp6817 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6816, i32 0, i32 2
%.tmp6818 = load i8*, i8** %name
store i8* %.tmp6818, i8** %.tmp6817
%.tmp6819 = load %m2638$.Scope.type*, %m2638$.Scope.type** %current_scope.6802
%.tmp6820 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp6819, i32 0, i32 1
%.tmp6821 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %.tmp6820
%.tmp6822 = icmp eq %m2638$.ScopeItem.type* %.tmp6821, null
br i1 %.tmp6822, label %.if.true.6823, label %.if.false.6823
.if.true.6823:
%.tmp6824 = load %m2638$.Scope.type*, %m2638$.Scope.type** %current_scope.6802
%.tmp6825 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp6824, i32 0, i32 1
%.tmp6826 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %newitem.6807
store %m2638$.ScopeItem.type* %.tmp6826, %m2638$.ScopeItem.type** %.tmp6825
ret void
br label %.if.end.6823
.if.false.6823:
br label %.if.end.6823
.if.end.6823:
%.tmp6827 = load %m2638$.Scope.type*, %m2638$.Scope.type** %current_scope.6802
%.tmp6828 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp6827, i32 0, i32 1
%.tmp6829 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %.tmp6828
%last_item.6830 = alloca %m2638$.ScopeItem.type*
store %m2638$.ScopeItem.type* %.tmp6829, %m2638$.ScopeItem.type** %last_item.6830
%.tmp6832 = getelementptr [1 x i8], [1 x i8]*@.str6831, i32 0, i32 0
%err_buf.6833 = alloca i8*
store i8* %.tmp6832, i8** %err_buf.6833
%.tmp6834 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %last_item.6830
%.tmp6835 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp6834, i32 0, i32 0
%.tmp6836 = load i8*, i8** %.tmp6835
%.tmp6837 = load i8*, i8** %name
%.tmp6838 = call i32(i8*,i8*) @strcmp(i8* %.tmp6836, i8* %.tmp6837)
%.tmp6839 = icmp eq i32 %.tmp6838, 0
br i1 %.tmp6839, label %.if.true.6840, label %.if.false.6840
.if.true.6840:
%.tmp6841 = getelementptr i8*, i8** %err_buf.6833, i32 0
%.tmp6843 = getelementptr [43 x i8], [43 x i8]*@.str6842, i32 0, i32 0
%.tmp6844 = load i8*, i8** %name
%.tmp6845 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6841, i8* %.tmp6843, i8* %.tmp6844)
%.tmp6846 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6847 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6848 = load i8*, i8** %err_buf.6833
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp6846, %m981$.Node.type* %.tmp6847, i8* %.tmp6848)
br label %.if.end.6840
.if.false.6840:
br label %.if.end.6840
.if.end.6840:
br label %.for.start.6849
.for.start.6849:
%.tmp6850 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %last_item.6830
%.tmp6851 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp6850, i32 0, i32 2
%.tmp6852 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %.tmp6851
%.tmp6853 = icmp ne %m2638$.ScopeItem.type* %.tmp6852, null
br i1 %.tmp6853, label %.for.continue.6849, label %.for.else.6849
.for.continue.6849:
%.tmp6854 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %last_item.6830
%.tmp6855 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp6854, i32 0, i32 0
%.tmp6856 = load i8*, i8** %.tmp6855
%.tmp6857 = load i8*, i8** %name
%.tmp6858 = call i32(i8*,i8*) @strcmp(i8* %.tmp6856, i8* %.tmp6857)
%.tmp6859 = icmp eq i32 %.tmp6858, 0
br i1 %.tmp6859, label %.if.true.6860, label %.if.false.6860
.if.true.6860:
%.tmp6861 = getelementptr i8*, i8** %err_buf.6833, i32 0
%.tmp6863 = getelementptr [43 x i8], [43 x i8]*@.str6862, i32 0, i32 0
%.tmp6864 = load i8*, i8** %name
%.tmp6865 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6861, i8* %.tmp6863, i8* %.tmp6864)
%.tmp6866 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6867 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp6868 = load i8*, i8** %err_buf.6833
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp6866, %m981$.Node.type* %.tmp6867, i8* %.tmp6868)
br label %.for.end.6849
br label %.if.end.6860
.if.false.6860:
br label %.if.end.6860
.if.end.6860:
%.tmp6869 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %last_item.6830
%.tmp6870 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp6869, i32 0, i32 2
%.tmp6871 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %.tmp6870
store %m2638$.ScopeItem.type* %.tmp6871, %m2638$.ScopeItem.type** %last_item.6830
br label %.for.start.6849
.for.else.6849:
%.tmp6872 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %last_item.6830
%.tmp6873 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp6872, i32 0, i32 2
%.tmp6874 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %newitem.6807
store %m2638$.ScopeItem.type* %.tmp6874, %m2638$.ScopeItem.type** %.tmp6873
br label %.for.end.6849
.for.end.6849:
ret void
}
define %m2638$.ScopeItem.type* @m295$find_defined_in.m2638$.ScopeItem.typep.m2638$.CompilerCtx.typep.cp.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m981$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m981$.Node.type*
store %m981$.Node.type* %.dotted_name.arg, %m981$.Node.type** %dotted_name
%err_buf.6875 = alloca i8*
store i8* null, i8** %err_buf.6875
%.tmp6876 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6877 = load i8*, i8** %module
%.tmp6878 = load %m981$.Node.type*, %m981$.Node.type** %dotted_name
%.tmp6879 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6878, i32 0, i32 1
%.tmp6880 = load i8*, i8** %.tmp6879
%.tmp6881 = call %m2638$.ScopeItem.type*(%m2638$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2638$.ScopeItem.typep.m2638$.CompilerCtx.typep.cp.cp(%m2638$.CompilerCtx.type* %.tmp6876, i8* %.tmp6877, i8* %.tmp6880)
%found.6882 = alloca %m2638$.ScopeItem.type*
store %m2638$.ScopeItem.type* %.tmp6881, %m2638$.ScopeItem.type** %found.6882
%.tmp6883 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %found.6882
%.tmp6884 = icmp eq %m2638$.ScopeItem.type* %.tmp6883, null
br i1 %.tmp6884, label %.if.true.6885, label %.if.false.6885
.if.true.6885:
%.tmp6886 = bitcast ptr null to %m2638$.ScopeItem.type*
ret %m2638$.ScopeItem.type* %.tmp6886
br label %.if.end.6885
.if.false.6885:
br label %.if.end.6885
.if.end.6885:
br label %.for.start.6887
.for.start.6887:
%.tmp6888 = load %m981$.Node.type*, %m981$.Node.type** %dotted_name
%.tmp6889 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6888, i32 0, i32 7
%.tmp6890 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6889
%.tmp6891 = icmp ne %m981$.Node.type* %.tmp6890, null
%.tmp6892 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %found.6882
%.tmp6893 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp6892, i32 0, i32 1
%.tmp6894 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %.tmp6893
%.tmp6895 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6894, i32 0, i32 3
%.tmp6896 = load i8*, i8** %.tmp6895
%.tmp6898 = getelementptr [7 x i8], [7 x i8]*@.str6897, i32 0, i32 0
%.tmp6899 = call i32(i8*,i8*) @strcmp(i8* %.tmp6896, i8* %.tmp6898)
%.tmp6900 = icmp eq i32 %.tmp6899, 0
%.tmp6901 = and i1 %.tmp6891, %.tmp6900
br i1 %.tmp6901, label %.for.continue.6887, label %.for.end.6887
.for.continue.6887:
%.tmp6902 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6903 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %found.6882
%.tmp6904 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp6903, i32 0, i32 1
%.tmp6905 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %.tmp6904
%.tmp6906 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6905, i32 0, i32 0
%.tmp6907 = load i8*, i8** %.tmp6906
%.tmp6908 = load %m981$.Node.type*, %m981$.Node.type** %dotted_name
%.tmp6909 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6908, i32 0, i32 7
%.tmp6910 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6909
%.tmp6911 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6910, i32 0, i32 7
%.tmp6912 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6911
%.tmp6913 = call %m2638$.ScopeItem.type*(%m2638$.CompilerCtx.type*,i8*,%m981$.Node.type*) @m295$find_defined_in.m2638$.ScopeItem.typep.m2638$.CompilerCtx.typep.cp.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp6902, i8* %.tmp6907, %m981$.Node.type* %.tmp6912)
store %m2638$.ScopeItem.type* %.tmp6913, %m2638$.ScopeItem.type** %found.6882
%.tmp6914 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %found.6882
%.tmp6915 = icmp eq %m2638$.ScopeItem.type* %.tmp6914, null
br i1 %.tmp6915, label %.if.true.6916, label %.if.false.6916
.if.true.6916:
%.tmp6917 = bitcast ptr null to %m2638$.ScopeItem.type*
ret %m2638$.ScopeItem.type* %.tmp6917
br label %.if.end.6916
.if.false.6916:
br label %.if.end.6916
.if.end.6916:
br label %.for.start.6887
.for.end.6887:
%.tmp6918 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %found.6882
ret %m2638$.ScopeItem.type* %.tmp6918
}
define %m2638$.ScopeItem.type* @m295$find_defined_here.m2638$.ScopeItem.typep.m2638$.CompilerCtx.typep.m2638$.Scope.typep.cp(%m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%s = alloca %m2638$.Scope.type*
store %m2638$.Scope.type* %.s.arg, %m2638$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp6919 = load %m2638$.Scope.type*, %m2638$.Scope.type** %s
%.tmp6920 = icmp eq %m2638$.Scope.type* %.tmp6919, null
br i1 %.tmp6920, label %.if.true.6921, label %.if.false.6921
.if.true.6921:
%.tmp6922 = bitcast ptr null to %m2638$.ScopeItem.type*
ret %m2638$.ScopeItem.type* %.tmp6922
br label %.if.end.6921
.if.false.6921:
br label %.if.end.6921
.if.end.6921:
%.tmp6924 = load %m2638$.Scope.type*, %m2638$.Scope.type** %s
%.tmp6925 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp6924, i32 0, i32 1
%.tmp6926 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %.tmp6925
%item.6927 = alloca %m2638$.ScopeItem.type*
store %m2638$.ScopeItem.type* %.tmp6926, %m2638$.ScopeItem.type** %item.6927
br label %.for.start.6923
.for.start.6923:
%.tmp6928 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %item.6927
%.tmp6929 = icmp ne %m2638$.ScopeItem.type* %.tmp6928, null
br i1 %.tmp6929, label %.for.continue.6923, label %.for.end.6923
.for.continue.6923:
%.tmp6930 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %item.6927
%.tmp6931 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp6930, i32 0, i32 0
%.tmp6932 = load i8*, i8** %.tmp6931
%.tmp6933 = load i8*, i8** %name
%.tmp6934 = call i32(i8*,i8*) @strcmp(i8* %.tmp6932, i8* %.tmp6933)
%.tmp6935 = icmp eq i32 %.tmp6934, 0
br i1 %.tmp6935, label %.if.true.6936, label %.if.false.6936
.if.true.6936:
%.tmp6937 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %item.6927
ret %m2638$.ScopeItem.type* %.tmp6937
br label %.if.end.6936
.if.false.6936:
br label %.if.end.6936
.if.end.6936:
%.tmp6938 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %item.6927
%.tmp6939 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp6938, i32 0, i32 2
%.tmp6940 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %.tmp6939
store %m2638$.ScopeItem.type* %.tmp6940, %m2638$.ScopeItem.type** %item.6927
br label %.for.start.6923
.for.end.6923:
%.tmp6941 = bitcast ptr null to %m2638$.ScopeItem.type*
ret %m2638$.ScopeItem.type* %.tmp6941
}
define %m2638$.ScopeItem.type* @m295$find_defined_str.m2638$.ScopeItem.typep.m2638$.CompilerCtx.typep.cp.cp(%m2638$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp6942 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6943 = load i8*, i8** %module
%.tmp6944 = call %m2638$.ModuleLookup.type*(%m2638$.CompilerCtx.type*,i8*) @m295$get_module.m2638$.ModuleLookup.typep.m2638$.CompilerCtx.typep.cp(%m2638$.CompilerCtx.type* %.tmp6942, i8* %.tmp6943)
%mod.6945 = alloca %m2638$.ModuleLookup.type*
store %m2638$.ModuleLookup.type* %.tmp6944, %m2638$.ModuleLookup.type** %mod.6945
%.tmp6946 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.6945
%.tmp6947 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp6946, i32 0, i32 3
%.tmp6948 = load %m2638$.Scope.type*, %m2638$.Scope.type** %.tmp6947
%.tmp6949 = icmp ne %m2638$.Scope.type* %.tmp6948, null
%.tmp6951 = getelementptr [77 x i8], [77 x i8]*@.str6950, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6949, i8* %.tmp6951)
%.tmp6953 = load %m2638$.ModuleLookup.type*, %m2638$.ModuleLookup.type** %mod.6945
%.tmp6954 = getelementptr %m2638$.ModuleLookup.type, %m2638$.ModuleLookup.type* %.tmp6953, i32 0, i32 3
%.tmp6955 = load %m2638$.Scope.type*, %m2638$.Scope.type** %.tmp6954
%s.6956 = alloca %m2638$.Scope.type*
store %m2638$.Scope.type* %.tmp6955, %m2638$.Scope.type** %s.6956
br label %.for.start.6952
.for.start.6952:
%.tmp6957 = load %m2638$.Scope.type*, %m2638$.Scope.type** %s.6956
%.tmp6958 = icmp ne %m2638$.Scope.type* %.tmp6957, null
br i1 %.tmp6958, label %.for.continue.6952, label %.for.end.6952
.for.continue.6952:
%.tmp6959 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6960 = load %m2638$.Scope.type*, %m2638$.Scope.type** %s.6956
%.tmp6961 = load i8*, i8** %assignable_name
%.tmp6962 = call %m2638$.ScopeItem.type*(%m2638$.CompilerCtx.type*,%m2638$.Scope.type*,i8*) @m295$find_defined_here.m2638$.ScopeItem.typep.m2638$.CompilerCtx.typep.m2638$.Scope.typep.cp(%m2638$.CompilerCtx.type* %.tmp6959, %m2638$.Scope.type* %.tmp6960, i8* %.tmp6961)
%item.6963 = alloca %m2638$.ScopeItem.type*
store %m2638$.ScopeItem.type* %.tmp6962, %m2638$.ScopeItem.type** %item.6963
%.tmp6964 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %item.6963
%.tmp6965 = icmp ne %m2638$.ScopeItem.type* %.tmp6964, null
br i1 %.tmp6965, label %.if.true.6966, label %.if.false.6966
.if.true.6966:
%.tmp6967 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %item.6963
ret %m2638$.ScopeItem.type* %.tmp6967
br label %.if.end.6966
.if.false.6966:
br label %.if.end.6966
.if.end.6966:
%.tmp6968 = load %m2638$.Scope.type*, %m2638$.Scope.type** %s.6956
%.tmp6969 = getelementptr %m2638$.Scope.type, %m2638$.Scope.type* %.tmp6968, i32 0, i32 5
%.tmp6970 = load %m2638$.Scope.type*, %m2638$.Scope.type** %.tmp6969
store %m2638$.Scope.type* %.tmp6970, %m2638$.Scope.type** %s.6956
br label %.for.start.6952
.for.end.6952:
%.tmp6971 = bitcast ptr null to %m2638$.ScopeItem.type*
ret %m2638$.ScopeItem.type* %.tmp6971
}
define %m2638$.ScopeItem.type* @m295$find_defined.m2638$.ScopeItem.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%dotted_name = alloca %m981$.Node.type*
store %m981$.Node.type* %.dotted_name.arg, %m981$.Node.type** %dotted_name
%.tmp6972 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6973 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6974 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp6973, i32 0, i32 7
%.tmp6975 = load i8*, i8** %.tmp6974
%.tmp6976 = load %m981$.Node.type*, %m981$.Node.type** %dotted_name
%.tmp6977 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp6976, i32 0, i32 6
%.tmp6978 = load %m981$.Node.type*, %m981$.Node.type** %.tmp6977
%.tmp6979 = call %m2638$.ScopeItem.type*(%m2638$.CompilerCtx.type*,i8*,%m981$.Node.type*) @m295$find_defined_in.m2638$.ScopeItem.typep.m2638$.CompilerCtx.typep.cp.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp6972, i8* %.tmp6975, %m981$.Node.type* %.tmp6978)
ret %m2638$.ScopeItem.type* %.tmp6979
}
define %m2638$.AssignableInfo.type* @m295$get_dotted_name.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.dot_name_ptr.arg, %m2638$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m981$.Node.type*
store %m981$.Node.type* %.dot_name_ptr.arg, %m981$.Node.type** %dot_name_ptr
%info = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.info.arg, %m2638$.AssignableInfo.type** %info
%err_msg.6980 = alloca i8*
store i8* null, i8** %err_msg.6980
%buf.6981 = alloca i8*
store i8* null, i8** %buf.6981
%.tmp6982 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp6983 = icmp eq %m2638$.AssignableInfo.type* %.tmp6982, null
br i1 %.tmp6983, label %.if.true.6984, label %.if.false.6984
.if.true.6984:
%.tmp6985 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp6986 = load %m981$.Node.type*, %m981$.Node.type** %dot_name_ptr
%.tmp6988 = getelementptr [54 x i8], [54 x i8]*@.str6987, i32 0, i32 0
%.tmp6989 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$err_tmpl.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp6985, %m981$.Node.type* %.tmp6986, i8* %.tmp6988)
%.tmp6990 = call i32(i8*,...) @printf(i8* %.tmp6989)
%.tmp6991 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp6991
br label %.if.end.6984
.if.false.6984:
br label %.if.end.6984
.if.end.6984:
%.tmp6992 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp6993 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6992, i32 0, i32 3
%.tmp6994 = load i8*, i8** %.tmp6993
%.tmp6996 = getelementptr [9 x i8], [9 x i8]*@.str6995, i32 0, i32 0
%.tmp6997 = call i32(i8*,i8*) @strcmp(i8* %.tmp6994, i8* %.tmp6996)
%.tmp6998 = icmp eq i32 %.tmp6997, 0
%.tmp6999 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp7000 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp6999, i32 0, i32 3
%.tmp7001 = load i8*, i8** %.tmp7000
%.tmp7003 = getelementptr [7 x i8], [7 x i8]*@.str7002, i32 0, i32 0
%.tmp7004 = call i32(i8*,i8*) @strcmp(i8* %.tmp7001, i8* %.tmp7003)
%.tmp7005 = icmp eq i32 %.tmp7004, 0
%.tmp7006 = or i1 %.tmp6998, %.tmp7005
br i1 %.tmp7006, label %.if.true.7007, label %.if.false.7007
.if.true.7007:
%.tmp7008 = load %m981$.Node.type*, %m981$.Node.type** %dot_name_ptr
%.tmp7009 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7008, i32 0, i32 7
%.tmp7010 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7009
%.tmp7011 = icmp ne %m981$.Node.type* %.tmp7010, null
br i1 %.tmp7011, label %.if.true.7012, label %.if.false.7012
.if.true.7012:
%.tmp7013 = getelementptr i8*, i8** %err_msg.6980, i32 0
%.tmp7015 = getelementptr [46 x i8], [46 x i8]*@.str7014, i32 0, i32 0
%.tmp7016 = load %m981$.Node.type*, %m981$.Node.type** %dot_name_ptr
%.tmp7017 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7016, i32 0, i32 7
%.tmp7018 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7017
%.tmp7019 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7018, i32 0, i32 7
%.tmp7020 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7019
%.tmp7021 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7020, i32 0, i32 1
%.tmp7022 = load i8*, i8** %.tmp7021
%.tmp7023 = load %m981$.Node.type*, %m981$.Node.type** %dot_name_ptr
%.tmp7024 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7023, i32 0, i32 1
%.tmp7025 = load i8*, i8** %.tmp7024
%.tmp7026 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7013, i8* %.tmp7015, i8* %.tmp7022, i8* %.tmp7025)
%.tmp7027 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7028 = load %m981$.Node.type*, %m981$.Node.type** %dot_name_ptr
%.tmp7029 = load i8*, i8** %err_msg.6980
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp7027, %m981$.Node.type* %.tmp7028, i8* %.tmp7029)
%.tmp7030 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp7030
br label %.if.end.7012
.if.false.7012:
br label %.if.end.7012
.if.end.7012:
%.tmp7031 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
ret %m2638$.AssignableInfo.type* %.tmp7031
br label %.if.end.7007
.if.false.7007:
%.tmp7032 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp7033 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7032, i32 0, i32 3
%.tmp7034 = load i8*, i8** %.tmp7033
%.tmp7036 = getelementptr [9 x i8], [9 x i8]*@.str7035, i32 0, i32 0
%.tmp7037 = call i32(i8*,i8*) @strcmp(i8* %.tmp7034, i8* %.tmp7036)
%.tmp7038 = icmp eq i32 %.tmp7037, 0
%.tmp7039 = load %m981$.Node.type*, %m981$.Node.type** %dot_name_ptr
%.tmp7040 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7039, i32 0, i32 7
%.tmp7041 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7040
%.tmp7042 = icmp ne %m981$.Node.type* %.tmp7041, null
%.tmp7043 = and i1 %.tmp7038, %.tmp7042
br i1 %.tmp7043, label %.if.true.7044, label %.if.false.7044
.if.true.7044:
%.tmp7045 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%base_var.7046 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp7045, %m2638$.AssignableInfo.type** %base_var.7046
%.tmp7047 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base_var.7046
%.tmp7048 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7047, i32 0, i32 4
%.tmp7049 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7048
%struct_info.7050 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp7049, %m2638$.Type.type** %struct_info.7050
br label %.for.start.7051
.for.start.7051:
%.tmp7052 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base_var.7046
%.tmp7053 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7052, i32 0, i32 4
%.tmp7054 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7053
%.tmp7055 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7054, i32 0, i32 0
%.tmp7056 = load i8*, i8** %.tmp7055
%.tmp7058 = getelementptr [4 x i8], [4 x i8]*@.str7057, i32 0, i32 0
%.tmp7059 = call i32(i8*,i8*) @strcmp(i8* %.tmp7056, i8* %.tmp7058)
%.tmp7060 = icmp eq i32 %.tmp7059, 0
br i1 %.tmp7060, label %.for.continue.7051, label %.for.end.7051
.for.continue.7051:
%.tmp7061 = load %m981$.Node.type*, %m981$.Node.type** %dot_name_ptr
%.tmp7062 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp7061)
%new_base.7063 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp7062, %m2638$.AssignableInfo.type** %new_base.7063
%.tmp7064 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7065 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_base.7063
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp7064, %m2638$.AssignableInfo.type* %.tmp7065)
%.tmp7066 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_base.7063
%.tmp7067 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7066, i32 0, i32 4
%.tmp7068 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base_var.7046
%.tmp7069 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7068, i32 0, i32 4
%.tmp7070 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7069
%.tmp7071 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7070, i32 0, i32 3
%.tmp7072 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7071
store %m2638$.Type.type* %.tmp7072, %m2638$.Type.type** %.tmp7067
%.tmp7073 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7074 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp7073, i32 0, i32 1
%.tmp7075 = load %m0$.File.type*, %m0$.File.type** %.tmp7074
%.tmp7077 = getelementptr [23 x i8], [23 x i8]*@.str7076, i32 0, i32 0
%.tmp7078 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_base.7063
%.tmp7079 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp7078)
%.tmp7080 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7081 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_base.7063
%.tmp7082 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7081, i32 0, i32 4
%.tmp7083 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7082
%.tmp7084 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp7080, %m2638$.Type.type* %.tmp7083)
%.tmp7085 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7086 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base_var.7046
%.tmp7087 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7086, i32 0, i32 4
%.tmp7088 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7087
%.tmp7089 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp7085, %m2638$.Type.type* %.tmp7088)
%.tmp7090 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base_var.7046
%.tmp7091 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp7090)
%.tmp7092 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7075, i8* %.tmp7077, i8* %.tmp7079, i8* %.tmp7084, i8* %.tmp7089, i8* %.tmp7091)
%.tmp7093 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_base.7063
store %m2638$.AssignableInfo.type* %.tmp7093, %m2638$.AssignableInfo.type** %base_var.7046
%.tmp7094 = load %m2638$.Type.type*, %m2638$.Type.type** %struct_info.7050
%.tmp7095 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7094, i32 0, i32 3
%.tmp7096 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7095
store %m2638$.Type.type* %.tmp7096, %m2638$.Type.type** %struct_info.7050
br label %.for.start.7051
.for.end.7051:
%.tmp7097 = load %m2638$.Type.type*, %m2638$.Type.type** %struct_info.7050
%.tmp7098 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7097, i32 0, i32 0
%.tmp7099 = load i8*, i8** %.tmp7098
%.tmp7101 = getelementptr [10 x i8], [10 x i8]*@.str7100, i32 0, i32 0
%.tmp7102 = call i32(i8*,i8*) @strcmp(i8* %.tmp7099, i8* %.tmp7101)
%.tmp7103 = icmp eq i32 %.tmp7102, 0
br i1 %.tmp7103, label %.if.true.7104, label %.if.false.7104
.if.true.7104:
%.tmp7105 = load %m2638$.Type.type*, %m2638$.Type.type** %struct_info.7050
%.tmp7106 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7105, i32 0, i32 3
%.tmp7107 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7106
store %m2638$.Type.type* %.tmp7107, %m2638$.Type.type** %struct_info.7050
br label %.if.end.7104
.if.false.7104:
br label %.if.end.7104
.if.end.7104:
%.tmp7108 = load %m2638$.Type.type*, %m2638$.Type.type** %struct_info.7050
%.tmp7109 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7108, i32 0, i32 0
%.tmp7110 = load i8*, i8** %.tmp7109
%.tmp7112 = getelementptr [7 x i8], [7 x i8]*@.str7111, i32 0, i32 0
%.tmp7113 = call i32(i8*,i8*) @strcmp(i8* %.tmp7110, i8* %.tmp7112)
%.tmp7114 = icmp ne i32 %.tmp7113, 0
br i1 %.tmp7114, label %.if.true.7115, label %.if.false.7115
.if.true.7115:
%.tmp7116 = getelementptr i8*, i8** %err_msg.6980, i32 0
%.tmp7118 = getelementptr [48 x i8], [48 x i8]*@.str7117, i32 0, i32 0
%.tmp7119 = load %m981$.Node.type*, %m981$.Node.type** %dot_name_ptr
%.tmp7120 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7119, i32 0, i32 7
%.tmp7121 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7120
%.tmp7122 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7121, i32 0, i32 7
%.tmp7123 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7122
%.tmp7124 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7123, i32 0, i32 1
%.tmp7125 = load i8*, i8** %.tmp7124
%.tmp7126 = load %m981$.Node.type*, %m981$.Node.type** %dot_name_ptr
%.tmp7127 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7126, i32 0, i32 1
%.tmp7128 = load i8*, i8** %.tmp7127
%.tmp7129 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7116, i8* %.tmp7118, i8* %.tmp7125, i8* %.tmp7128)
%.tmp7130 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7131 = load %m981$.Node.type*, %m981$.Node.type** %dot_name_ptr
%.tmp7132 = load i8*, i8** %err_msg.6980
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp7130, %m981$.Node.type* %.tmp7131, i8* %.tmp7132)
%.tmp7133 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp7133
br label %.if.end.7115
.if.false.7115:
br label %.if.end.7115
.if.end.7115:
%.tmp7134 = load %m981$.Node.type*, %m981$.Node.type** %dot_name_ptr
%.tmp7135 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7134, i32 0, i32 7
%.tmp7136 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7135
%.tmp7137 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7136, i32 0, i32 7
%.tmp7138 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7137
%.tmp7139 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7138, i32 0, i32 1
%.tmp7140 = load i8*, i8** %.tmp7139
%field_name.7141 = alloca i8*
store i8* %.tmp7140, i8** %field_name.7141
%field_id.7142 = alloca i32
store i32 0, i32* %field_id.7142
%.tmp7143 = bitcast ptr null to %m2638$.Type.type*
%found_field.7144 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp7143, %m2638$.Type.type** %found_field.7144
%.tmp7146 = load %m2638$.Type.type*, %m2638$.Type.type** %struct_info.7050
%.tmp7147 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7146, i32 0, i32 3
%.tmp7148 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7147
%field.7149 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp7148, %m2638$.Type.type** %field.7149
br label %.for.start.7145
.for.start.7145:
%.tmp7150 = load %m2638$.Type.type*, %m2638$.Type.type** %field.7149
%.tmp7151 = icmp ne %m2638$.Type.type* %.tmp7150, null
br i1 %.tmp7151, label %.for.continue.7145, label %.for.end.7145
.for.continue.7145:
%.tmp7152 = load %m2638$.Type.type*, %m2638$.Type.type** %field.7149
%.tmp7153 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7152, i32 0, i32 1
%.tmp7154 = load i8*, i8** %.tmp7153
%.tmp7155 = load i8*, i8** %field_name.7141
%.tmp7156 = call i32(i8*,i8*) @strcmp(i8* %.tmp7154, i8* %.tmp7155)
%.tmp7157 = icmp eq i32 %.tmp7156, 0
br i1 %.tmp7157, label %.if.true.7158, label %.if.false.7158
.if.true.7158:
%.tmp7159 = load %m2638$.Type.type*, %m2638$.Type.type** %field.7149
store %m2638$.Type.type* %.tmp7159, %m2638$.Type.type** %found_field.7144
br label %.for.end.7145
br label %.if.end.7158
.if.false.7158:
%.tmp7160 = load i32, i32* %field_id.7142
%.tmp7161 = add i32 %.tmp7160, 1
store i32 %.tmp7161, i32* %field_id.7142
br label %.if.end.7158
.if.end.7158:
%.tmp7162 = load %m2638$.Type.type*, %m2638$.Type.type** %field.7149
%.tmp7163 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7162, i32 0, i32 4
%.tmp7164 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7163
store %m2638$.Type.type* %.tmp7164, %m2638$.Type.type** %field.7149
br label %.for.start.7145
.for.end.7145:
%.tmp7165 = load %m2638$.Type.type*, %m2638$.Type.type** %found_field.7144
%.tmp7166 = icmp eq %m2638$.Type.type* %.tmp7165, null
br i1 %.tmp7166, label %.if.true.7167, label %.if.false.7167
.if.true.7167:
%.tmp7168 = getelementptr i8*, i8** %err_msg.6980, i32 0
%.tmp7170 = getelementptr [34 x i8], [34 x i8]*@.str7169, i32 0, i32 0
%.tmp7171 = load i8*, i8** %field_name.7141
%.tmp7172 = load %m981$.Node.type*, %m981$.Node.type** %dot_name_ptr
%.tmp7173 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7172, i32 0, i32 1
%.tmp7174 = load i8*, i8** %.tmp7173
%.tmp7175 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7168, i8* %.tmp7170, i8* %.tmp7171, i8* %.tmp7174)
%.tmp7176 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7177 = load %m981$.Node.type*, %m981$.Node.type** %dot_name_ptr
%.tmp7178 = load i8*, i8** %err_msg.6980
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp7176, %m981$.Node.type* %.tmp7177, i8* %.tmp7178)
%.tmp7179 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp7179
br label %.if.end.7167
.if.false.7167:
br label %.if.end.7167
.if.end.7167:
%.tmp7180 = load %m981$.Node.type*, %m981$.Node.type** %dot_name_ptr
%.tmp7181 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp7180)
%new_info.7182 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp7181, %m2638$.AssignableInfo.type** %new_info.7182
%.tmp7183 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_info.7182
%.tmp7184 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7183, i32 0, i32 4
%.tmp7185 = load %m2638$.Type.type*, %m2638$.Type.type** %found_field.7144
store %m2638$.Type.type* %.tmp7185, %m2638$.Type.type** %.tmp7184
%.tmp7186 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7187 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_info.7182
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp7186, %m2638$.AssignableInfo.type* %.tmp7187)
%.tmp7188 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_info.7182
%.tmp7189 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7188, i32 0, i32 3
%.tmp7191 = getelementptr [9 x i8], [9 x i8]*@.str7190, i32 0, i32 0
store i8* %.tmp7191, i8** %.tmp7189
%.tmp7192 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7193 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base_var.7046
%.tmp7194 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7193, i32 0, i32 4
%.tmp7195 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7194
%.tmp7196 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp7192, %m2638$.Type.type* %.tmp7195)
%info_tr.7197 = alloca i8*
store i8* %.tmp7196, i8** %info_tr.7197
%.tmp7198 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7199 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp7198, i32 0, i32 1
%.tmp7200 = load %m0$.File.type*, %m0$.File.type** %.tmp7199
%.tmp7202 = getelementptr [46 x i8], [46 x i8]*@.str7201, i32 0, i32 0
%.tmp7203 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_info.7182
%.tmp7204 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp7203)
%.tmp7205 = load i8*, i8** %info_tr.7197
%.tmp7206 = load i8*, i8** %info_tr.7197
%.tmp7207 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base_var.7046
%.tmp7208 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp7207)
%.tmp7209 = load i32, i32* %field_id.7142
%.tmp7210 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7200, i8* %.tmp7202, i8* %.tmp7204, i8* %.tmp7205, i8* %.tmp7206, i8* %.tmp7208, i32 %.tmp7209)
%.tmp7211 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7212 = load %m981$.Node.type*, %m981$.Node.type** %dot_name_ptr
%.tmp7213 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7212, i32 0, i32 7
%.tmp7214 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7213
%.tmp7215 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7214, i32 0, i32 7
%.tmp7216 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7215
%.tmp7217 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_info.7182
%.tmp7218 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,%m2638$.AssignableInfo.type*) @m295$get_dotted_name.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp7211, %m981$.Node.type* %.tmp7216, %m2638$.AssignableInfo.type* %.tmp7217)
ret %m2638$.AssignableInfo.type* %.tmp7218
br label %.if.end.7044
.if.false.7044:
%.tmp7219 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp7220 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7219, i32 0, i32 3
%.tmp7221 = load i8*, i8** %.tmp7220
%.tmp7223 = getelementptr [9 x i8], [9 x i8]*@.str7222, i32 0, i32 0
%.tmp7224 = call i32(i8*,i8*) @strcmp(i8* %.tmp7221, i8* %.tmp7223)
%.tmp7225 = icmp eq i32 %.tmp7224, 0
br i1 %.tmp7225, label %.if.true.7226, label %.if.false.7226
.if.true.7226:
%.tmp7227 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
ret %m2638$.AssignableInfo.type* %.tmp7227
br label %.if.end.7226
.if.false.7226:
br label %.if.end.7226
.if.end.7226:
br label %.if.end.7044
.if.end.7044:
br label %.if.end.7007
.if.end.7007:
%.tmp7228 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7229 = load %m981$.Node.type*, %m981$.Node.type** %dot_name_ptr
%.tmp7231 = getelementptr [43 x i8], [43 x i8]*@.str7230, i32 0, i32 0
%.tmp7232 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$err_tmpl.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp7228, %m981$.Node.type* %.tmp7229, i8* %.tmp7231)
%.tmp7233 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
%.tmp7234 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7233, i32 0, i32 3
%.tmp7235 = load i8*, i8** %.tmp7234
%.tmp7236 = call i32(i8*,...) @printf(i8* %.tmp7232, i8* %.tmp7235)
%.tmp7237 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp7237
}
define %m2638$.AssignableInfo.type* @m295$compile_addr.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%err_msg.7238 = alloca i8*
store i8* null, i8** %err_msg.7238
%.tmp7239 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%curr_node.7240 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp7239, %m981$.Node.type** %curr_node.7240
%.tmp7241 = load %m981$.Node.type*, %m981$.Node.type** %curr_node.7240
%.tmp7242 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7241, i32 0, i32 0
%.tmp7243 = load i8*, i8** %.tmp7242
%.tmp7245 = getelementptr [17 x i8], [17 x i8]*@.str7244, i32 0, i32 0
%.tmp7246 = call i32(i8*,i8*) @strcmp(i8* %.tmp7243, i8* %.tmp7245)
%.tmp7247 = icmp eq i32 %.tmp7246, 0
%.tmp7248 = load %m981$.Node.type*, %m981$.Node.type** %curr_node.7240
%.tmp7249 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7248, i32 0, i32 0
%.tmp7250 = load i8*, i8** %.tmp7249
%.tmp7252 = getelementptr [16 x i8], [16 x i8]*@.str7251, i32 0, i32 0
%.tmp7253 = call i32(i8*,i8*) @strcmp(i8* %.tmp7250, i8* %.tmp7252)
%.tmp7254 = icmp eq i32 %.tmp7253, 0
%.tmp7255 = or i1 %.tmp7247, %.tmp7254
%.tmp7256 = load %m981$.Node.type*, %m981$.Node.type** %curr_node.7240
%.tmp7257 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7256, i32 0, i32 0
%.tmp7258 = load i8*, i8** %.tmp7257
%.tmp7260 = getelementptr [11 x i8], [11 x i8]*@.str7259, i32 0, i32 0
%.tmp7261 = call i32(i8*,i8*) @strcmp(i8* %.tmp7258, i8* %.tmp7260)
%.tmp7262 = icmp eq i32 %.tmp7261, 0
%.tmp7263 = or i1 %.tmp7255, %.tmp7262
br i1 %.tmp7263, label %.if.true.7264, label %.if.false.7264
.if.true.7264:
%.tmp7265 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7266 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp7267 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7266, i32 0, i32 6
%.tmp7268 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7267
%.tmp7269 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_addr.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp7265, %m981$.Node.type* %.tmp7268)
ret %m2638$.AssignableInfo.type* %.tmp7269
br label %.if.end.7264
.if.false.7264:
br label %.if.end.7264
.if.end.7264:
%.tmp7270 = load %m981$.Node.type*, %m981$.Node.type** %curr_node.7240
%.tmp7271 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7270, i32 0, i32 0
%.tmp7272 = load i8*, i8** %.tmp7271
%.tmp7274 = getelementptr [12 x i8], [12 x i8]*@.str7273, i32 0, i32 0
%.tmp7275 = call i32(i8*,i8*) @strcmp(i8* %.tmp7272, i8* %.tmp7274)
%.tmp7276 = icmp ne i32 %.tmp7275, 0
br i1 %.tmp7276, label %.if.true.7277, label %.if.false.7277
.if.true.7277:
%.tmp7279 = getelementptr [92 x i8], [92 x i8]*@.str7278, i32 0, i32 0
%.tmp7280 = load %m981$.Node.type*, %m981$.Node.type** %curr_node.7240
%.tmp7281 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7280, i32 0, i32 0
%.tmp7282 = load i8*, i8** %.tmp7281
%.tmp7283 = call i32(i8*,...) @printf(i8* %.tmp7279, i8* %.tmp7282)
%.tmp7284 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp7285 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7284, i32 0, i32 6
%.tmp7286 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7285
store %m981$.Node.type* %.tmp7286, %m981$.Node.type** %curr_node.7240
br label %.if.end.7277
.if.false.7277:
br label %.if.end.7277
.if.end.7277:
%.tmp7287 = load %m981$.Node.type*, %m981$.Node.type** %curr_node.7240
%.tmp7288 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7287, i32 0, i32 6
%.tmp7289 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7288
%assignable_name.7290 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp7289, %m981$.Node.type** %assignable_name.7290
%.tmp7291 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7292 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7293 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp7292, i32 0, i32 7
%.tmp7294 = load i8*, i8** %.tmp7293
%.tmp7295 = load %m981$.Node.type*, %m981$.Node.type** %assignable_name.7290
%.tmp7296 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7295, i32 0, i32 6
%.tmp7297 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7296
%.tmp7298 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7297, i32 0, i32 1
%.tmp7299 = load i8*, i8** %.tmp7298
%.tmp7300 = call %m2638$.ScopeItem.type*(%m2638$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2638$.ScopeItem.typep.m2638$.CompilerCtx.typep.cp.cp(%m2638$.CompilerCtx.type* %.tmp7291, i8* %.tmp7294, i8* %.tmp7299)
%scope_info.7301 = alloca %m2638$.ScopeItem.type*
store %m2638$.ScopeItem.type* %.tmp7300, %m2638$.ScopeItem.type** %scope_info.7301
%.tmp7302 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %scope_info.7301
%.tmp7303 = icmp eq %m2638$.ScopeItem.type* %.tmp7302, null
br i1 %.tmp7303, label %.if.true.7304, label %.if.false.7304
.if.true.7304:
%.tmp7305 = getelementptr i8*, i8** %err_msg.7238, i32 0
%.tmp7307 = getelementptr [41 x i8], [41 x i8]*@.str7306, i32 0, i32 0
%.tmp7308 = load %m981$.Node.type*, %m981$.Node.type** %assignable_name.7290
%.tmp7309 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7308, i32 0, i32 6
%.tmp7310 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7309
%.tmp7311 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7310, i32 0, i32 1
%.tmp7312 = load i8*, i8** %.tmp7311
%.tmp7313 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7305, i8* %.tmp7307, i8* %.tmp7312)
%.tmp7314 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7315 = load %m981$.Node.type*, %m981$.Node.type** %assignable_name.7290
%.tmp7316 = load i8*, i8** %err_msg.7238
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp7314, %m981$.Node.type* %.tmp7315, i8* %.tmp7316)
%.tmp7317 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp7317
br label %.if.end.7304
.if.false.7304:
br label %.if.end.7304
.if.end.7304:
%.tmp7318 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %scope_info.7301
%.tmp7319 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp7318, i32 0, i32 1
%.tmp7320 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %.tmp7319
%info.7321 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp7320, %m2638$.AssignableInfo.type** %info.7321
%.tmp7322 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.7321
%.tmp7323 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7322, i32 0, i32 3
%.tmp7324 = load i8*, i8** %.tmp7323
%.tmp7326 = getelementptr [7 x i8], [7 x i8]*@.str7325, i32 0, i32 0
%.tmp7327 = call i32(i8*,i8*) @strcmp(i8* %.tmp7324, i8* %.tmp7326)
%.tmp7328 = icmp eq i32 %.tmp7327, 0
br i1 %.tmp7328, label %.if.true.7329, label %.if.false.7329
.if.true.7329:
%.tmp7330 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7331 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.7321
%.tmp7332 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp7331)
%.tmp7333 = load %m981$.Node.type*, %m981$.Node.type** %assignable_name.7290
%.tmp7334 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7333, i32 0, i32 6
%.tmp7335 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7334
%.tmp7336 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7335, i32 0, i32 7
%.tmp7337 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7336
%.tmp7338 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7337, i32 0, i32 7
%.tmp7339 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7338
%.tmp7340 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7339, i32 0, i32 1
%.tmp7341 = load i8*, i8** %.tmp7340
%.tmp7342 = call %m2638$.ScopeItem.type*(%m2638$.CompilerCtx.type*,i8*,i8*) @m295$find_defined_str.m2638$.ScopeItem.typep.m2638$.CompilerCtx.typep.cp.cp(%m2638$.CompilerCtx.type* %.tmp7330, i8* %.tmp7332, i8* %.tmp7341)
store %m2638$.ScopeItem.type* %.tmp7342, %m2638$.ScopeItem.type** %scope_info.7301
%.tmp7343 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %scope_info.7301
%.tmp7344 = icmp eq %m2638$.ScopeItem.type* %.tmp7343, null
br i1 %.tmp7344, label %.if.true.7345, label %.if.false.7345
.if.true.7345:
%.tmp7346 = getelementptr i8*, i8** %err_msg.7238, i32 0
%.tmp7348 = getelementptr [31 x i8], [31 x i8]*@.str7347, i32 0, i32 0
%.tmp7349 = load %m981$.Node.type*, %m981$.Node.type** %assignable_name.7290
%.tmp7350 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7349, i32 0, i32 6
%.tmp7351 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7350
%.tmp7352 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7351, i32 0, i32 7
%.tmp7353 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7352
%.tmp7354 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7353, i32 0, i32 7
%.tmp7355 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7354
%.tmp7356 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7355, i32 0, i32 1
%.tmp7357 = load i8*, i8** %.tmp7356
%.tmp7358 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.7321
%.tmp7359 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp7358)
%.tmp7360 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7346, i8* %.tmp7348, i8* %.tmp7357, i8* %.tmp7359)
%.tmp7361 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7362 = load %m981$.Node.type*, %m981$.Node.type** %curr_node.7240
%.tmp7363 = load i8*, i8** %err_msg.7238
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp7361, %m981$.Node.type* %.tmp7362, i8* %.tmp7363)
%.tmp7364 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp7364
br label %.if.end.7345
.if.false.7345:
br label %.if.end.7345
.if.end.7345:
%.tmp7365 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %scope_info.7301
%.tmp7366 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp7365, i32 0, i32 1
%.tmp7367 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %.tmp7366
store %m2638$.AssignableInfo.type* %.tmp7367, %m2638$.AssignableInfo.type** %info.7321
%.tmp7368 = load %m981$.Node.type*, %m981$.Node.type** %assignable_name.7290
%.tmp7369 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7368, i32 0, i32 6
%.tmp7370 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7369
%.tmp7371 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7370, i32 0, i32 7
%.tmp7372 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7371
%.tmp7373 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7372, i32 0, i32 7
%.tmp7374 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7373
store %m981$.Node.type* %.tmp7374, %m981$.Node.type** %assignable_name.7290
br label %.if.end.7329
.if.false.7329:
%.tmp7375 = load %m981$.Node.type*, %m981$.Node.type** %assignable_name.7290
%.tmp7376 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7375, i32 0, i32 6
%.tmp7377 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7376
store %m981$.Node.type* %.tmp7377, %m981$.Node.type** %assignable_name.7290
br label %.if.end.7329
.if.end.7329:
%.tmp7378 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7379 = load %m981$.Node.type*, %m981$.Node.type** %assignable_name.7290
%.tmp7380 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.7321
%.tmp7381 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,%m2638$.AssignableInfo.type*) @m295$get_dotted_name.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp7378, %m981$.Node.type* %.tmp7379, %m2638$.AssignableInfo.type* %.tmp7380)
%base.7382 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp7381, %m2638$.AssignableInfo.type** %base.7382
%.tmp7384 = load %m981$.Node.type*, %m981$.Node.type** %curr_node.7240
%.tmp7385 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7384, i32 0, i32 6
%.tmp7386 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7385
%.tmp7387 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7386, i32 0, i32 7
%.tmp7388 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7387
%addr.7389 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp7388, %m981$.Node.type** %addr.7389
br label %.for.start.7383
.for.start.7383:
%.tmp7390 = load %m981$.Node.type*, %m981$.Node.type** %addr.7389
%.tmp7391 = icmp ne %m981$.Node.type* %.tmp7390, null
br i1 %.tmp7391, label %.for.continue.7383, label %.for.end.7383
.for.continue.7383:
%.tmp7392 = load %m981$.Node.type*, %m981$.Node.type** %addr.7389
%.tmp7393 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7392, i32 0, i32 7
%.tmp7394 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7393
%index.7395 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp7394, %m981$.Node.type** %index.7395
%.tmp7396 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7397 = load %m981$.Node.type*, %m981$.Node.type** %index.7395
%.tmp7398 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_assignable.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp7396, %m981$.Node.type* %.tmp7397)
%index_info.7399 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp7398, %m2638$.AssignableInfo.type** %index_info.7399
%.tmp7400 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7401 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %index_info.7399
%.tmp7402 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7401, i32 0, i32 4
%.tmp7403 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7402
%.tmp7404 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp7400, %m2638$.Type.type* %.tmp7403)
%index_type.7405 = alloca i8*
store i8* %.tmp7404, i8** %index_type.7405
%.tmp7406 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base.7382
%.tmp7407 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7406, i32 0, i32 4
%.tmp7408 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7407
%.tmp7409 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7408, i32 0, i32 1
%.tmp7410 = load i8*, i8** %.tmp7409
%.tmp7411 = icmp ne i8* %.tmp7410, null
br i1 %.tmp7411, label %.if.true.7412, label %.if.false.7412
.if.true.7412:
%.tmp7413 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base.7382
%.tmp7414 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7413, i32 0, i32 4
%.tmp7415 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7414
%.tmp7416 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7415, i32 0, i32 1
%.tmp7417 = load i8*, i8** %.tmp7416
%.tmp7419 = getelementptr [6 x i8], [6 x i8]*@.str7418, i32 0, i32 0
%.tmp7420 = call i32(i8*,i8*) @strcmp(i8* %.tmp7417, i8* %.tmp7419)
%.tmp7421 = icmp eq i32 %.tmp7420, 0
br i1 %.tmp7421, label %.if.true.7422, label %.if.false.7422
.if.true.7422:
%.tmp7423 = load %m981$.Node.type*, %m981$.Node.type** %curr_node.7240
%.tmp7424 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp7423)
%new_base.7425 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp7424, %m2638$.AssignableInfo.type** %new_base.7425
%.tmp7426 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7427 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_base.7425
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp7426, %m2638$.AssignableInfo.type* %.tmp7427)
%.tmp7428 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7429 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp7428, i32 0, i32 1
%.tmp7430 = load %m0$.File.type*, %m0$.File.type** %.tmp7429
%.tmp7432 = getelementptr [45 x i8], [45 x i8]*@.str7431, i32 0, i32 0
%.tmp7433 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_base.7425
%.tmp7434 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp7433)
%.tmp7435 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7436 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base.7382
%.tmp7437 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7436, i32 0, i32 4
%.tmp7438 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7437
%.tmp7439 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp7435, %m2638$.Type.type* %.tmp7438)
%.tmp7440 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7441 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base.7382
%.tmp7442 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7441, i32 0, i32 4
%.tmp7443 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7442
%.tmp7444 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp7440, %m2638$.Type.type* %.tmp7443)
%.tmp7445 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base.7382
%.tmp7446 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp7445)
%.tmp7447 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7430, i8* %.tmp7432, i8* %.tmp7434, i8* %.tmp7439, i8* %.tmp7444, i8* %.tmp7446)
%.tmp7448 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_base.7425
%.tmp7449 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7448, i32 0, i32 4
%.tmp7450 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base.7382
%.tmp7451 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7450, i32 0, i32 4
%.tmp7452 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7451
%.tmp7453 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7452, i32 0, i32 3
%.tmp7454 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7453
%.tmp7455 = call %m2638$.Type.type*(%m2638$.Type.type*) @m295$type_clone.m2638$.Type.typep.m2638$.Type.typep(%m2638$.Type.type* %.tmp7454)
store %m2638$.Type.type* %.tmp7455, %m2638$.Type.type** %.tmp7449
%.tmp7456 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_base.7425
%.tmp7457 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7456, i32 0, i32 4
%.tmp7458 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7457
%.tmp7459 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7458, i32 0, i32 4
store %m2638$.Type.type* null, %m2638$.Type.type** %.tmp7459
%.tmp7460 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_base.7425
store %m2638$.AssignableInfo.type* %.tmp7460, %m2638$.AssignableInfo.type** %base.7382
br label %.if.end.7422
.if.false.7422:
br label %.if.end.7422
.if.end.7422:
br label %.if.end.7412
.if.false.7412:
br label %.if.end.7412
.if.end.7412:
%.tmp7461 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7462 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base.7382
%.tmp7463 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7462, i32 0, i32 4
%.tmp7464 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7463
%.tmp7465 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp7461, %m2638$.Type.type* %.tmp7464)
%base_type.7466 = alloca i8*
store i8* %.tmp7465, i8** %base_type.7466
%.tmp7467 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7468 = call i32(%m2638$.CompilerCtx.type*) @m295$new_uid.i.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp7467)
%tmp_id.7469 = alloca i32
store i32 %.tmp7468, i32* %tmp_id.7469
%.tmp7470 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7471 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp7470, i32 0, i32 1
%.tmp7472 = load %m0$.File.type*, %m0$.File.type** %.tmp7471
%.tmp7474 = getelementptr [28 x i8], [28 x i8]*@.str7473, i32 0, i32 0
%.tmp7475 = load i32, i32* %tmp_id.7469
%.tmp7476 = load i8*, i8** %base_type.7466
%.tmp7477 = load i8*, i8** %base_type.7466
%.tmp7478 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base.7382
%.tmp7479 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp7478)
%.tmp7480 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7472, i8* %.tmp7474, i32 %.tmp7475, i8* %.tmp7476, i8* %.tmp7477, i8* %.tmp7479)
%.tmp7481 = load %m981$.Node.type*, %m981$.Node.type** %curr_node.7240
%.tmp7482 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp7481)
%new_base.7483 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp7482, %m2638$.AssignableInfo.type** %new_base.7483
%.tmp7484 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7485 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_base.7483
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp7484, %m2638$.AssignableInfo.type* %.tmp7485)
%.tmp7486 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base.7382
%.tmp7487 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7486, i32 0, i32 4
%.tmp7488 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7487
%.tmp7489 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7488, i32 0, i32 3
%.tmp7490 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7489
%.tmp7491 = icmp eq %m2638$.Type.type* %.tmp7490, null
br i1 %.tmp7491, label %.if.true.7492, label %.if.false.7492
.if.true.7492:
%.tmp7493 = getelementptr i8*, i8** %err_msg.7238, i32 0
%.tmp7495 = getelementptr [35 x i8], [35 x i8]*@.str7494, i32 0, i32 0
%.tmp7496 = load i8*, i8** %base_type.7466
%.tmp7497 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7493, i8* %.tmp7495, i8* %.tmp7496)
%.tmp7498 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7499 = load %m981$.Node.type*, %m981$.Node.type** %addr.7389
%.tmp7500 = load i8*, i8** %err_msg.7238
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp7498, %m981$.Node.type* %.tmp7499, i8* %.tmp7500)
%.tmp7501 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base.7382
ret %m2638$.AssignableInfo.type* %.tmp7501
br label %.if.end.7492
.if.false.7492:
br label %.if.end.7492
.if.end.7492:
%.tmp7502 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_base.7483
%.tmp7503 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7502, i32 0, i32 4
%.tmp7504 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base.7382
%.tmp7505 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7504, i32 0, i32 4
%.tmp7506 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7505
%.tmp7507 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7506, i32 0, i32 3
%.tmp7508 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7507
store %m2638$.Type.type* %.tmp7508, %m2638$.Type.type** %.tmp7503
%.tmp7509 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7510 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_base.7483
%.tmp7511 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7510, i32 0, i32 4
%.tmp7512 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7511
%.tmp7513 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp7509, %m2638$.Type.type* %.tmp7512)
%base_type_2.7514 = alloca i8*
store i8* %.tmp7513, i8** %base_type_2.7514
%.tmp7515 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7516 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp7515, i32 0, i32 1
%.tmp7517 = load %m0$.File.type*, %m0$.File.type** %.tmp7516
%.tmp7519 = getelementptr [44 x i8], [44 x i8]*@.str7518, i32 0, i32 0
%.tmp7520 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_base.7483
%.tmp7521 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp7520)
%.tmp7522 = load i8*, i8** %base_type_2.7514
%.tmp7523 = load i8*, i8** %base_type_2.7514
%.tmp7524 = load i32, i32* %tmp_id.7469
%.tmp7525 = load i8*, i8** %index_type.7405
%.tmp7526 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %index_info.7399
%.tmp7527 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp7526)
%.tmp7528 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7517, i8* %.tmp7519, i8* %.tmp7521, i8* %.tmp7522, i8* %.tmp7523, i32 %.tmp7524, i8* %.tmp7525, i8* %.tmp7527)
%.tmp7529 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %new_base.7483
store %m2638$.AssignableInfo.type* %.tmp7529, %m2638$.AssignableInfo.type** %base.7382
%.tmp7530 = load %m981$.Node.type*, %m981$.Node.type** %addr.7389
%.tmp7531 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7530, i32 0, i32 7
%.tmp7532 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7531
%.tmp7533 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7532, i32 0, i32 7
%.tmp7534 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7533
%.tmp7535 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7534, i32 0, i32 7
%.tmp7536 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7535
store %m981$.Node.type* %.tmp7536, %m981$.Node.type** %addr.7389
br label %.for.start.7383
.for.end.7383:
%.tmp7537 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %base.7382
ret %m2638$.AssignableInfo.type* %.tmp7537
}
%m295$.StackHead.type = type {%m2393$.SYStack.type*}
define %m2638$.AssignableInfo.type* @m295$compile_assignable.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%curr_node = alloca %m981$.Node.type*
store %m981$.Node.type* %.curr_node.arg, %m981$.Node.type** %curr_node
%.tmp7538 = load %m981$.Node.type*, %m981$.Node.type** %curr_node
%.tmp7539 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7538, i32 0, i32 6
%.tmp7540 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7539
%.tmp7542 = getelementptr [16 x i8], [16 x i8]*@.str7541, i32 0, i32 0
%.tmp7543 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp7540, i8* %.tmp7542)
%assignable_start.7544 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp7543, %m981$.Node.type** %assignable_start.7544
%.tmp7545 = load %m981$.Node.type*, %m981$.Node.type** %assignable_start.7544
%.tmp7546 = call %m2393$.SYStack.type*(%m981$.Node.type*) @m2393$sy_algorithm.m2393$.SYStack.typep.m981$.Node.typep(%m981$.Node.type* %.tmp7545)
%operator_stack.7547 = alloca %m2393$.SYStack.type*
store %m2393$.SYStack.type* %.tmp7546, %m2393$.SYStack.type** %operator_stack.7547
%.tmp7548 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* null, i32 1
%.tmp7549 = ptrtoint %m295$.StackHead.type* %.tmp7548 to i32
%.tmp7550 = call i8*(i32) @malloc(i32 %.tmp7549)
%.tmp7551 = bitcast i8* %.tmp7550 to %m295$.StackHead.type*
%stack.7552 = alloca %m295$.StackHead.type*
store %m295$.StackHead.type* %.tmp7551, %m295$.StackHead.type** %stack.7552
%.tmp7553 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack.7552
%.tmp7554 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7553, i32 0, i32 0
%.tmp7555 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %operator_stack.7547
store %m2393$.SYStack.type* %.tmp7555, %m2393$.SYStack.type** %.tmp7554
%.tmp7556 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7557 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack.7552
%.tmp7558 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m295$.StackHead.typep(%m2638$.CompilerCtx.type* %.tmp7556, %m295$.StackHead.type* %.tmp7557)
%info.7559 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp7558, %m2638$.AssignableInfo.type** %info.7559
%.tmp7560 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.7559
%.tmp7561 = icmp eq %m2638$.AssignableInfo.type* %.tmp7560, null
br i1 %.tmp7561, label %.if.true.7562, label %.if.false.7562
.if.true.7562:
%.tmp7563 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.7559
ret %m2638$.AssignableInfo.type* %.tmp7563
br label %.if.end.7562
.if.false.7562:
br label %.if.end.7562
.if.end.7562:
%.tmp7564 = load %m981$.Node.type*, %m981$.Node.type** %curr_node
%.tmp7565 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7564, i32 0, i32 6
%.tmp7566 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7565
%.tmp7568 = getelementptr [5 x i8], [5 x i8]*@.str7567, i32 0, i32 0
%.tmp7569 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp7566, i8* %.tmp7568)
%cast.7570 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp7569, %m981$.Node.type** %cast.7570
%.tmp7571 = load %m981$.Node.type*, %m981$.Node.type** %cast.7570
%.tmp7572 = icmp ne %m981$.Node.type* %.tmp7571, null
br i1 %.tmp7572, label %.if.true.7573, label %.if.false.7573
.if.true.7573:
%.tmp7574 = load %m981$.Node.type*, %m981$.Node.type** %cast.7570
%.tmp7575 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7574, i32 0, i32 6
%.tmp7576 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7575
%.tmp7578 = getelementptr [5 x i8], [5 x i8]*@.str7577, i32 0, i32 0
%.tmp7579 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp7576, i8* %.tmp7578)
%cast_type.7580 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp7579, %m981$.Node.type** %cast_type.7580
%.tmp7581 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7582 = load %m981$.Node.type*, %m981$.Node.type** %cast_type.7580
%.tmp7583 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7582, i32 0, i32 6
%.tmp7584 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7583
%.tmp7585 = call %m2638$.Type.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$node_to_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp7581, %m981$.Node.type* %.tmp7584)
%type.7586 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp7585, %m2638$.Type.type** %type.7586
%.tmp7587 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.7559
%.tmp7588 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp7587)
%prev_id.7589 = alloca i8*
store i8* %.tmp7588, i8** %prev_id.7589
%.tmp7590 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7591 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.7559
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp7590, %m2638$.AssignableInfo.type* %.tmp7591)
%.tmp7592 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7593 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.7559
%.tmp7594 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7593, i32 0, i32 4
%.tmp7595 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7594
%.tmp7596 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp7592, %m2638$.Type.type* %.tmp7595)
%from_type.7597 = alloca i8*
store i8* %.tmp7596, i8** %from_type.7597
%.tmp7598 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7599 = load %m2638$.Type.type*, %m2638$.Type.type** %type.7586
%.tmp7600 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp7598, %m2638$.Type.type* %.tmp7599)
%to_type.7601 = alloca i8*
store i8* %.tmp7600, i8** %to_type.7601
%.tmp7603 = getelementptr [8 x i8], [8 x i8]*@.str7602, i32 0, i32 0
%cast_fn.7604 = alloca i8*
store i8* %.tmp7603, i8** %cast_fn.7604
%.tmp7605 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.7559
%.tmp7606 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7605, i32 0, i32 4
%.tmp7607 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7606
%.tmp7608 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7607, i32 0, i32 1
%.tmp7609 = load i8*, i8** %.tmp7608
%.tmp7610 = icmp ne i8* %.tmp7609, null
br i1 %.tmp7610, label %.if.true.7611, label %.if.false.7611
.if.true.7611:
%.tmp7612 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.7559
%.tmp7613 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7612, i32 0, i32 4
%.tmp7614 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7613
%.tmp7615 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7614, i32 0, i32 1
%.tmp7616 = load i8*, i8** %.tmp7615
%.tmp7618 = getelementptr [6 x i8], [6 x i8]*@.str7617, i32 0, i32 0
%.tmp7619 = call i32(i8*,i8*) @strcmp(i8* %.tmp7616, i8* %.tmp7618)
%.tmp7620 = icmp eq i32 %.tmp7619, 0
br i1 %.tmp7620, label %.if.true.7621, label %.if.false.7621
.if.true.7621:
%.tmp7623 = getelementptr [48 x i8], [48 x i8]*@.str7622, i32 0, i32 0
%.tmp7624 = call i32(i8*,...) @printf(i8* %.tmp7623)
br label %.if.end.7621
.if.false.7621:
br label %.if.end.7621
.if.end.7621:
br label %.if.end.7611
.if.false.7611:
br label %.if.end.7611
.if.end.7611:
%.tmp7625 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.7559
%.tmp7626 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7625, i32 0, i32 4
%.tmp7627 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7626
%.tmp7628 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7627, i32 0, i32 0
%.tmp7629 = load i8*, i8** %.tmp7628
%.tmp7631 = getelementptr [4 x i8], [4 x i8]*@.str7630, i32 0, i32 0
%.tmp7632 = call i32(i8*,i8*) @strcmp(i8* %.tmp7629, i8* %.tmp7631)
%.tmp7633 = icmp ne i32 %.tmp7632, 0
%.tmp7634 = load %m2638$.Type.type*, %m2638$.Type.type** %type.7586
%.tmp7635 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7634, i32 0, i32 0
%.tmp7636 = load i8*, i8** %.tmp7635
%.tmp7638 = getelementptr [4 x i8], [4 x i8]*@.str7637, i32 0, i32 0
%.tmp7639 = call i32(i8*,i8*) @strcmp(i8* %.tmp7636, i8* %.tmp7638)
%.tmp7640 = icmp ne i32 %.tmp7639, 0
%.tmp7641 = and i1 %.tmp7633, %.tmp7640
br i1 %.tmp7641, label %.if.true.7642, label %.if.false.7642
.if.true.7642:
%.tmp7643 = load i8*, i8** %from_type.7597
%.tmp7644 = getelementptr i8, i8* %.tmp7643, i32 0
%.tmp7645 = load i8, i8* %.tmp7644
%.tmp7646 = icmp eq i8 %.tmp7645, 105
%.tmp7647 = load i8*, i8** %to_type.7601
%.tmp7648 = getelementptr i8, i8* %.tmp7647, i32 0
%.tmp7649 = load i8, i8* %.tmp7648
%.tmp7650 = icmp eq i8 %.tmp7649, 105
%.tmp7651 = and i1 %.tmp7646, %.tmp7650
br i1 %.tmp7651, label %.if.true.7652, label %.if.false.7652
.if.true.7652:
%from_size.7653 = alloca i32
store i32 0, i32* %from_size.7653
%to_size.7654 = alloca i32
store i32 0, i32* %to_size.7654
%.tmp7655 = load i8*, i8** %from_type.7597
%.tmp7657 = getelementptr [4 x i8], [4 x i8]*@.str7656, i32 0, i32 0
%.tmp7658 = getelementptr i32, i32* %from_size.7653, i32 0
%.tmp7659 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7655, i8* %.tmp7657, i32* %.tmp7658)
%.tmp7660 = load i8*, i8** %to_type.7601
%.tmp7662 = getelementptr [4 x i8], [4 x i8]*@.str7661, i32 0, i32 0
%.tmp7663 = getelementptr i32, i32* %to_size.7654, i32 0
%.tmp7664 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7660, i8* %.tmp7662, i32* %.tmp7663)
%.tmp7665 = load i32, i32* %from_size.7653
%.tmp7666 = load i32, i32* %to_size.7654
%.tmp7667 = icmp slt i32 %.tmp7665, %.tmp7666
br i1 %.tmp7667, label %.if.true.7668, label %.if.false.7668
.if.true.7668:
%.tmp7670 = getelementptr [5 x i8], [5 x i8]*@.str7669, i32 0, i32 0
store i8* %.tmp7670, i8** %cast_fn.7604
br label %.if.end.7668
.if.false.7668:
%.tmp7672 = getelementptr [6 x i8], [6 x i8]*@.str7671, i32 0, i32 0
store i8* %.tmp7672, i8** %cast_fn.7604
br label %.if.end.7668
.if.end.7668:
br label %.if.end.7652
.if.false.7652:
br label %.if.end.7652
.if.end.7652:
br label %.if.end.7642
.if.false.7642:
br label %.if.end.7642
.if.end.7642:
%.tmp7673 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7674 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp7673, i32 0, i32 1
%.tmp7675 = load %m0$.File.type*, %m0$.File.type** %.tmp7674
%.tmp7677 = getelementptr [21 x i8], [21 x i8]*@.str7676, i32 0, i32 0
%.tmp7678 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.7559
%.tmp7679 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp7678)
%.tmp7680 = load i8*, i8** %cast_fn.7604
%.tmp7681 = load i8*, i8** %from_type.7597
%.tmp7682 = load i8*, i8** %prev_id.7589
%.tmp7683 = load i8*, i8** %to_type.7601
%.tmp7684 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7675, i8* %.tmp7677, i8* %.tmp7679, i8* %.tmp7680, i8* %.tmp7681, i8* %.tmp7682, i8* %.tmp7683)
%.tmp7685 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.7559
%.tmp7686 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7685, i32 0, i32 4
%.tmp7687 = load %m2638$.Type.type*, %m2638$.Type.type** %type.7586
store %m2638$.Type.type* %.tmp7687, %m2638$.Type.type** %.tmp7686
br label %.if.end.7573
.if.false.7573:
br label %.if.end.7573
.if.end.7573:
%.tmp7688 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.7559
ret %m2638$.AssignableInfo.type* %.tmp7688
}
define %m2638$.AssignableInfo.type* @m295$compile_assignable_stack.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m295$.StackHead.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m295$.StackHead.type* %.stack.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stack = alloca %m295$.StackHead.type*
store %m295$.StackHead.type* %.stack.arg, %m295$.StackHead.type** %stack
%.tmp7689 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7690 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7689, i32 0, i32 0
%.tmp7691 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %.tmp7690
%.tmp7692 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp7691, i32 0, i32 0
%.tmp7693 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7692
%.tmp7694 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7693, i32 0, i32 0
%.tmp7695 = load i8*, i8** %.tmp7694
%.tmp7697 = getelementptr [16 x i8], [16 x i8]*@.str7696, i32 0, i32 0
%.tmp7698 = call i32(i8*,i8*) @strcmp(i8* %.tmp7695, i8* %.tmp7697)
%.tmp7699 = icmp eq i32 %.tmp7698, 0
br i1 %.tmp7699, label %.if.true.7700, label %.if.false.7700
.if.true.7700:
%.tmp7701 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7702 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7703 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7702, i32 0, i32 0
%.tmp7704 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %.tmp7703
%.tmp7705 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp7704, i32 0, i32 0
%.tmp7706 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7705
%.tmp7707 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_mono_assignable.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp7701, %m981$.Node.type* %.tmp7706)
ret %m2638$.AssignableInfo.type* %.tmp7707
br label %.if.end.7700
.if.false.7700:
br label %.if.end.7700
.if.end.7700:
%.tmp7708 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7709 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7708, i32 0, i32 0
%.tmp7710 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %.tmp7709
%.tmp7711 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp7710, i32 0, i32 0
%.tmp7712 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7711
%.tmp7713 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7712, i32 0, i32 6
%.tmp7714 = load %m981$.Node.type*, %m981$.Node.type** %.tmp7713
%operator.7715 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp7714, %m981$.Node.type** %operator.7715
%.tmp7716 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7717 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7716, i32 0, i32 0
%.tmp7718 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7719 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7718, i32 0, i32 0
%.tmp7720 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %.tmp7719
%.tmp7721 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp7720, i32 0, i32 1
%.tmp7722 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %.tmp7721
store %m2393$.SYStack.type* %.tmp7722, %m2393$.SYStack.type** %.tmp7717
%.tmp7723 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7724 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7725 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m295$.StackHead.typep(%m2638$.CompilerCtx.type* %.tmp7723, %m295$.StackHead.type* %.tmp7724)
%A.7726 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp7725, %m2638$.AssignableInfo.type** %A.7726
%.tmp7727 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %A.7726
%.tmp7728 = icmp eq %m2638$.AssignableInfo.type* %.tmp7727, null
br i1 %.tmp7728, label %.if.true.7729, label %.if.false.7729
.if.true.7729:
%.tmp7730 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %A.7726
ret %m2638$.AssignableInfo.type* %.tmp7730
br label %.if.end.7729
.if.false.7729:
br label %.if.end.7729
.if.end.7729:
%.tmp7731 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7732 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7731, i32 0, i32 0
%.tmp7733 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7734 = getelementptr %m295$.StackHead.type, %m295$.StackHead.type* %.tmp7733, i32 0, i32 0
%.tmp7735 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %.tmp7734
%.tmp7736 = getelementptr %m2393$.SYStack.type, %m2393$.SYStack.type* %.tmp7735, i32 0, i32 1
%.tmp7737 = load %m2393$.SYStack.type*, %m2393$.SYStack.type** %.tmp7736
store %m2393$.SYStack.type* %.tmp7737, %m2393$.SYStack.type** %.tmp7732
%.tmp7738 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7739 = load %m295$.StackHead.type*, %m295$.StackHead.type** %stack
%.tmp7740 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m295$.StackHead.type*) @m295$compile_assignable_stack.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m295$.StackHead.typep(%m2638$.CompilerCtx.type* %.tmp7738, %m295$.StackHead.type* %.tmp7739)
%B.7741 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp7740, %m2638$.AssignableInfo.type** %B.7741
%.tmp7742 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %B.7741
%.tmp7743 = icmp eq %m2638$.AssignableInfo.type* %.tmp7742, null
br i1 %.tmp7743, label %.if.true.7744, label %.if.false.7744
.if.true.7744:
%.tmp7745 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %B.7741
ret %m2638$.AssignableInfo.type* %.tmp7745
br label %.if.end.7744
.if.false.7744:
br label %.if.end.7744
.if.end.7744:
%.tmp7746 = bitcast ptr null to %m981$.Node.type*
%.tmp7747 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp7746)
%op_info.7748 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp7747, %m2638$.AssignableInfo.type** %op_info.7748
%.tmp7749 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %op_info.7748
%.tmp7750 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7749, i32 0, i32 4
%.tmp7751 = load %m981$.Node.type*, %m981$.Node.type** %operator.7715
%.tmp7752 = call %m2638$.Type.type*(%m981$.Node.type*) @m295$operator_type.m2638$.Type.typep.m981$.Node.typep(%m981$.Node.type* %.tmp7751)
store %m2638$.Type.type* %.tmp7752, %m2638$.Type.type** %.tmp7750
%.tmp7753 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7754 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %op_info.7748
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp7753, %m2638$.AssignableInfo.type* %.tmp7754)
%.tmp7755 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7756 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp7755, i32 0, i32 1
%.tmp7757 = load %m0$.File.type*, %m0$.File.type** %.tmp7756
%.tmp7759 = getelementptr [19 x i8], [19 x i8]*@.str7758, i32 0, i32 0
%.tmp7760 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %op_info.7748
%.tmp7761 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp7760)
%.tmp7762 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7763 = load %m981$.Node.type*, %m981$.Node.type** %operator.7715
%.tmp7764 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$operator_op.cp.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp7762, %m981$.Node.type* %.tmp7763)
%.tmp7765 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7766 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %A.7726
%.tmp7767 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp7766, i32 0, i32 4
%.tmp7768 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp7767
%.tmp7769 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp7765, %m2638$.Type.type* %.tmp7768)
%.tmp7770 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %A.7726
%.tmp7771 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp7770)
%.tmp7772 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %B.7741
%.tmp7773 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp7772)
%.tmp7774 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7757, i8* %.tmp7759, i8* %.tmp7761, i8* %.tmp7764, i8* %.tmp7769, i8* %.tmp7771, i8* %.tmp7773)
%.tmp7775 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %op_info.7748
ret %m2638$.AssignableInfo.type* %.tmp7775
}
define i8* @m295$operator_op.cp.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.op.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%op = alloca %m981$.Node.type*
store %m981$.Node.type* %.op.arg, %m981$.Node.type** %op
%.tmp7776 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7777 = icmp eq %m981$.Node.type* %.tmp7776, null
br i1 %.tmp7777, label %.if.true.7778, label %.if.false.7778
.if.true.7778:
%.tmp7779 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7780 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7782 = getelementptr [31 x i8], [31 x i8]*@.str7781, i32 0, i32 0
%.tmp7783 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$err_tmpl.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp7779, %m981$.Node.type* %.tmp7780, i8* %.tmp7782)
%.tmp7784 = call i32(i8*,...) @printf(i8* %.tmp7783)
br label %.if.end.7778
.if.false.7778:
br label %.if.end.7778
.if.end.7778:
%.tmp7785 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7786 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7785, i32 0, i32 1
%.tmp7787 = load i8*, i8** %.tmp7786
%.tmp7789 = getelementptr [2 x i8], [2 x i8]*@.str7788, i32 0, i32 0
%.tmp7790 = call i32(i8*,i8*) @strcmp(i8* %.tmp7787, i8* %.tmp7789)
%.tmp7791 = icmp eq i32 %.tmp7790, 0
br i1 %.tmp7791, label %.if.true.7792, label %.if.false.7792
.if.true.7792:
%.tmp7794 = getelementptr [4 x i8], [4 x i8]*@.str7793, i32 0, i32 0
ret i8* %.tmp7794
br label %.if.end.7792
.if.false.7792:
%.tmp7795 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7796 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7795, i32 0, i32 1
%.tmp7797 = load i8*, i8** %.tmp7796
%.tmp7799 = getelementptr [2 x i8], [2 x i8]*@.str7798, i32 0, i32 0
%.tmp7800 = call i32(i8*,i8*) @strcmp(i8* %.tmp7797, i8* %.tmp7799)
%.tmp7801 = icmp eq i32 %.tmp7800, 0
br i1 %.tmp7801, label %.if.true.7802, label %.if.false.7802
.if.true.7802:
%.tmp7804 = getelementptr [4 x i8], [4 x i8]*@.str7803, i32 0, i32 0
ret i8* %.tmp7804
br label %.if.end.7802
.if.false.7802:
%.tmp7805 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7806 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7805, i32 0, i32 1
%.tmp7807 = load i8*, i8** %.tmp7806
%.tmp7809 = getelementptr [2 x i8], [2 x i8]*@.str7808, i32 0, i32 0
%.tmp7810 = call i32(i8*,i8*) @strcmp(i8* %.tmp7807, i8* %.tmp7809)
%.tmp7811 = icmp eq i32 %.tmp7810, 0
br i1 %.tmp7811, label %.if.true.7812, label %.if.false.7812
.if.true.7812:
%.tmp7814 = getelementptr [4 x i8], [4 x i8]*@.str7813, i32 0, i32 0
ret i8* %.tmp7814
br label %.if.end.7812
.if.false.7812:
%.tmp7815 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7816 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7815, i32 0, i32 1
%.tmp7817 = load i8*, i8** %.tmp7816
%.tmp7819 = getelementptr [2 x i8], [2 x i8]*@.str7818, i32 0, i32 0
%.tmp7820 = call i32(i8*,i8*) @strcmp(i8* %.tmp7817, i8* %.tmp7819)
%.tmp7821 = icmp eq i32 %.tmp7820, 0
br i1 %.tmp7821, label %.if.true.7822, label %.if.false.7822
.if.true.7822:
%.tmp7824 = getelementptr [5 x i8], [5 x i8]*@.str7823, i32 0, i32 0
ret i8* %.tmp7824
br label %.if.end.7822
.if.false.7822:
%.tmp7825 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7826 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7825, i32 0, i32 1
%.tmp7827 = load i8*, i8** %.tmp7826
%.tmp7829 = getelementptr [3 x i8], [3 x i8]*@.str7828, i32 0, i32 0
%.tmp7830 = call i32(i8*,i8*) @strcmp(i8* %.tmp7827, i8* %.tmp7829)
%.tmp7831 = icmp eq i32 %.tmp7830, 0
br i1 %.tmp7831, label %.if.true.7832, label %.if.false.7832
.if.true.7832:
%.tmp7834 = getelementptr [8 x i8], [8 x i8]*@.str7833, i32 0, i32 0
ret i8* %.tmp7834
br label %.if.end.7832
.if.false.7832:
%.tmp7835 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7836 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7835, i32 0, i32 1
%.tmp7837 = load i8*, i8** %.tmp7836
%.tmp7839 = getelementptr [3 x i8], [3 x i8]*@.str7838, i32 0, i32 0
%.tmp7840 = call i32(i8*,i8*) @strcmp(i8* %.tmp7837, i8* %.tmp7839)
%.tmp7841 = icmp eq i32 %.tmp7840, 0
br i1 %.tmp7841, label %.if.true.7842, label %.if.false.7842
.if.true.7842:
%.tmp7844 = getelementptr [8 x i8], [8 x i8]*@.str7843, i32 0, i32 0
ret i8* %.tmp7844
br label %.if.end.7842
.if.false.7842:
%.tmp7845 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7846 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7845, i32 0, i32 1
%.tmp7847 = load i8*, i8** %.tmp7846
%.tmp7849 = getelementptr [2 x i8], [2 x i8]*@.str7848, i32 0, i32 0
%.tmp7850 = call i32(i8*,i8*) @strcmp(i8* %.tmp7847, i8* %.tmp7849)
%.tmp7851 = icmp eq i32 %.tmp7850, 0
br i1 %.tmp7851, label %.if.true.7852, label %.if.false.7852
.if.true.7852:
%.tmp7854 = getelementptr [9 x i8], [9 x i8]*@.str7853, i32 0, i32 0
ret i8* %.tmp7854
br label %.if.end.7852
.if.false.7852:
%.tmp7855 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7856 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7855, i32 0, i32 1
%.tmp7857 = load i8*, i8** %.tmp7856
%.tmp7859 = getelementptr [2 x i8], [2 x i8]*@.str7858, i32 0, i32 0
%.tmp7860 = call i32(i8*,i8*) @strcmp(i8* %.tmp7857, i8* %.tmp7859)
%.tmp7861 = icmp eq i32 %.tmp7860, 0
br i1 %.tmp7861, label %.if.true.7862, label %.if.false.7862
.if.true.7862:
%.tmp7864 = getelementptr [9 x i8], [9 x i8]*@.str7863, i32 0, i32 0
ret i8* %.tmp7864
br label %.if.end.7862
.if.false.7862:
%.tmp7865 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7866 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7865, i32 0, i32 1
%.tmp7867 = load i8*, i8** %.tmp7866
%.tmp7869 = getelementptr [2 x i8], [2 x i8]*@.str7868, i32 0, i32 0
%.tmp7870 = call i32(i8*,i8*) @strcmp(i8* %.tmp7867, i8* %.tmp7869)
%.tmp7871 = icmp eq i32 %.tmp7870, 0
br i1 %.tmp7871, label %.if.true.7872, label %.if.false.7872
.if.true.7872:
%.tmp7874 = getelementptr [4 x i8], [4 x i8]*@.str7873, i32 0, i32 0
ret i8* %.tmp7874
br label %.if.end.7872
.if.false.7872:
%.tmp7875 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7876 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7875, i32 0, i32 1
%.tmp7877 = load i8*, i8** %.tmp7876
%.tmp7879 = getelementptr [2 x i8], [2 x i8]*@.str7878, i32 0, i32 0
%.tmp7880 = call i32(i8*,i8*) @strcmp(i8* %.tmp7877, i8* %.tmp7879)
%.tmp7881 = icmp eq i32 %.tmp7880, 0
br i1 %.tmp7881, label %.if.true.7882, label %.if.false.7882
.if.true.7882:
%.tmp7884 = getelementptr [3 x i8], [3 x i8]*@.str7883, i32 0, i32 0
ret i8* %.tmp7884
br label %.if.end.7882
.if.false.7882:
%.tmp7885 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7886 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7885, i32 0, i32 1
%.tmp7887 = load i8*, i8** %.tmp7886
%.tmp7889 = getelementptr [3 x i8], [3 x i8]*@.str7888, i32 0, i32 0
%.tmp7890 = call i32(i8*,i8*) @strcmp(i8* %.tmp7887, i8* %.tmp7889)
%.tmp7891 = icmp eq i32 %.tmp7890, 0
br i1 %.tmp7891, label %.if.true.7892, label %.if.false.7892
.if.true.7892:
%.tmp7894 = getelementptr [9 x i8], [9 x i8]*@.str7893, i32 0, i32 0
ret i8* %.tmp7894
br label %.if.end.7892
.if.false.7892:
%.tmp7895 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7896 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7895, i32 0, i32 1
%.tmp7897 = load i8*, i8** %.tmp7896
%.tmp7899 = getelementptr [3 x i8], [3 x i8]*@.str7898, i32 0, i32 0
%.tmp7900 = call i32(i8*,i8*) @strcmp(i8* %.tmp7897, i8* %.tmp7899)
%.tmp7901 = icmp eq i32 %.tmp7900, 0
br i1 %.tmp7901, label %.if.true.7902, label %.if.false.7902
.if.true.7902:
%.tmp7904 = getelementptr [9 x i8], [9 x i8]*@.str7903, i32 0, i32 0
ret i8* %.tmp7904
br label %.if.end.7902
.if.false.7902:
%.tmp7905 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7906 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7905, i32 0, i32 1
%.tmp7907 = load i8*, i8** %.tmp7906
%.tmp7909 = getelementptr [2 x i8], [2 x i8]*@.str7908, i32 0, i32 0
%.tmp7910 = call i32(i8*,i8*) @strcmp(i8* %.tmp7907, i8* %.tmp7909)
%.tmp7911 = icmp eq i32 %.tmp7910, 0
br i1 %.tmp7911, label %.if.true.7912, label %.if.false.7912
.if.true.7912:
%.tmp7914 = getelementptr [5 x i8], [5 x i8]*@.str7913, i32 0, i32 0
ret i8* %.tmp7914
br label %.if.end.7912
.if.false.7912:
%.tmp7915 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp7916 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7918 = getelementptr [30 x i8], [30 x i8]*@.str7917, i32 0, i32 0
%.tmp7919 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$err_tmpl.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp7915, %m981$.Node.type* %.tmp7916, i8* %.tmp7918)
%.tmp7920 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7921 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7920, i32 0, i32 1
%.tmp7922 = load i8*, i8** %.tmp7921
%.tmp7923 = call i32(i8*,...) @printf(i8* %.tmp7919, i8* %.tmp7922)
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
br label %.if.end.7822
.if.end.7822:
br label %.if.end.7812
.if.end.7812:
br label %.if.end.7802
.if.end.7802:
br label %.if.end.7792
.if.end.7792:
%.tmp7925 = getelementptr [4 x i8], [4 x i8]*@.str7924, i32 0, i32 0
ret i8* %.tmp7925
}
define %m2638$.Type.type* @m295$operator_type.m2638$.Type.typep.m981$.Node.typep(%m981$.Node.type* %.op.arg) {
%op = alloca %m981$.Node.type*
store %m981$.Node.type* %.op.arg, %m981$.Node.type** %op
%.tmp7926 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
%type.7927 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp7926, %m2638$.Type.type** %type.7927
%.tmp7928 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7929 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7928, i32 0, i32 1
%.tmp7930 = load i8*, i8** %.tmp7929
%.tmp7932 = getelementptr [3 x i8], [3 x i8]*@.str7931, i32 0, i32 0
%.tmp7933 = call i32(i8*,i8*) @strcmp(i8* %.tmp7930, i8* %.tmp7932)
%.tmp7934 = icmp eq i32 %.tmp7933, 0
%.tmp7935 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7936 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7935, i32 0, i32 1
%.tmp7937 = load i8*, i8** %.tmp7936
%.tmp7939 = getelementptr [3 x i8], [3 x i8]*@.str7938, i32 0, i32 0
%.tmp7940 = call i32(i8*,i8*) @strcmp(i8* %.tmp7937, i8* %.tmp7939)
%.tmp7941 = icmp eq i32 %.tmp7940, 0
%.tmp7942 = or i1 %.tmp7934, %.tmp7941
%.tmp7943 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7944 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7943, i32 0, i32 1
%.tmp7945 = load i8*, i8** %.tmp7944
%.tmp7947 = getelementptr [2 x i8], [2 x i8]*@.str7946, i32 0, i32 0
%.tmp7948 = call i32(i8*,i8*) @strcmp(i8* %.tmp7945, i8* %.tmp7947)
%.tmp7949 = icmp eq i32 %.tmp7948, 0
%.tmp7950 = or i1 %.tmp7942, %.tmp7949
%.tmp7951 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7952 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7951, i32 0, i32 1
%.tmp7953 = load i8*, i8** %.tmp7952
%.tmp7955 = getelementptr [2 x i8], [2 x i8]*@.str7954, i32 0, i32 0
%.tmp7956 = call i32(i8*,i8*) @strcmp(i8* %.tmp7953, i8* %.tmp7955)
%.tmp7957 = icmp eq i32 %.tmp7956, 0
%.tmp7958 = or i1 %.tmp7950, %.tmp7957
%.tmp7959 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7960 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7959, i32 0, i32 1
%.tmp7961 = load i8*, i8** %.tmp7960
%.tmp7963 = getelementptr [2 x i8], [2 x i8]*@.str7962, i32 0, i32 0
%.tmp7964 = call i32(i8*,i8*) @strcmp(i8* %.tmp7961, i8* %.tmp7963)
%.tmp7965 = icmp eq i32 %.tmp7964, 0
%.tmp7966 = or i1 %.tmp7958, %.tmp7965
%.tmp7967 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7968 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7967, i32 0, i32 1
%.tmp7969 = load i8*, i8** %.tmp7968
%.tmp7971 = getelementptr [2 x i8], [2 x i8]*@.str7970, i32 0, i32 0
%.tmp7972 = call i32(i8*,i8*) @strcmp(i8* %.tmp7969, i8* %.tmp7971)
%.tmp7973 = icmp eq i32 %.tmp7972, 0
%.tmp7974 = or i1 %.tmp7966, %.tmp7973
%.tmp7975 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7976 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7975, i32 0, i32 1
%.tmp7977 = load i8*, i8** %.tmp7976
%.tmp7979 = getelementptr [3 x i8], [3 x i8]*@.str7978, i32 0, i32 0
%.tmp7980 = call i32(i8*,i8*) @strcmp(i8* %.tmp7977, i8* %.tmp7979)
%.tmp7981 = icmp eq i32 %.tmp7980, 0
%.tmp7982 = or i1 %.tmp7974, %.tmp7981
%.tmp7983 = load %m981$.Node.type*, %m981$.Node.type** %op
%.tmp7984 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp7983, i32 0, i32 1
%.tmp7985 = load i8*, i8** %.tmp7984
%.tmp7987 = getelementptr [3 x i8], [3 x i8]*@.str7986, i32 0, i32 0
%.tmp7988 = call i32(i8*,i8*) @strcmp(i8* %.tmp7985, i8* %.tmp7987)
%.tmp7989 = icmp eq i32 %.tmp7988, 0
%.tmp7990 = or i1 %.tmp7982, %.tmp7989
br i1 %.tmp7990, label %.if.true.7991, label %.if.false.7991
.if.true.7991:
%.tmp7992 = load %m2638$.Type.type*, %m2638$.Type.type** %type.7927
%.tmp7993 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7992, i32 0, i32 0
%.tmp7995 = getelementptr [5 x i8], [5 x i8]*@.str7994, i32 0, i32 0
store i8* %.tmp7995, i8** %.tmp7993
br label %.if.end.7991
.if.false.7991:
%.tmp7996 = load %m2638$.Type.type*, %m2638$.Type.type** %type.7927
%.tmp7997 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp7996, i32 0, i32 0
%.tmp7999 = getelementptr [4 x i8], [4 x i8]*@.str7998, i32 0, i32 0
store i8* %.tmp7999, i8** %.tmp7997
br label %.if.end.7991
.if.end.7991:
%.tmp8000 = load %m2638$.Type.type*, %m2638$.Type.type** %type.7927
ret %m2638$.Type.type* %.tmp8000
}
define %m2638$.AssignableInfo.type* @m295$compile_mono_assignable.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%curr_node = alloca %m981$.Node.type*
store %m981$.Node.type* %.curr_node.arg, %m981$.Node.type** %curr_node
%.tmp8001 = bitcast ptr null to %m2638$.AssignableInfo.type*
%assignable_info.8002 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp8001, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8003 = load %m981$.Node.type*, %m981$.Node.type** %curr_node
%mono.8004 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp8003, %m981$.Node.type** %mono.8004
%err_buf.8005 = alloca i8*
store i8* null, i8** %err_buf.8005
%buf.8006 = alloca i8*
store i8* null, i8** %buf.8006
%.tmp8007 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8008 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8007, i32 0, i32 6
%.tmp8009 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8008
%.tmp8010 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8009, i32 0, i32 0
%.tmp8011 = load i8*, i8** %.tmp8010
%.tmp8013 = getelementptr [7 x i8], [7 x i8]*@.str8012, i32 0, i32 0
%.tmp8014 = call i32(i8*,i8*) @strcmp(i8* %.tmp8011, i8* %.tmp8013)
%.tmp8015 = icmp eq i32 %.tmp8014, 0
br i1 %.tmp8015, label %.if.true.8016, label %.if.false.8016
.if.true.8016:
%.tmp8017 = load %m981$.Node.type*, %m981$.Node.type** %curr_node
%.tmp8018 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp8017)
store %m2638$.AssignableInfo.type* %.tmp8018, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8019 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8020 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8019, i32 0, i32 4
%.tmp8021 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp8021, %m2638$.Type.type** %.tmp8020
%.tmp8022 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8023 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8022, i32 0, i32 4
%.tmp8024 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8023
%.tmp8025 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8024, i32 0, i32 0
%.tmp8027 = getelementptr [4 x i8], [4 x i8]*@.str8026, i32 0, i32 0
store i8* %.tmp8027, i8** %.tmp8025
%.tmp8028 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8029 = load i8, i8* @SCOPE_CONST
%.tmp8030 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8031 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8030, i32 0, i32 6
%.tmp8032 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8031
%.tmp8033 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8032, i32 0, i32 1
%.tmp8034 = load i8*, i8** %.tmp8033
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp8028, i8 %.tmp8029, i8* %.tmp8034)
br label %.if.end.8016
.if.false.8016:
%.tmp8035 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8036 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8035, i32 0, i32 6
%.tmp8037 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8036
%.tmp8038 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8037, i32 0, i32 0
%.tmp8039 = load i8*, i8** %.tmp8038
%.tmp8041 = getelementptr [5 x i8], [5 x i8]*@.str8040, i32 0, i32 0
%.tmp8042 = call i32(i8*,i8*) @strcmp(i8* %.tmp8039, i8* %.tmp8041)
%.tmp8043 = icmp eq i32 %.tmp8042, 0
br i1 %.tmp8043, label %.if.true.8044, label %.if.false.8044
.if.true.8044:
%.tmp8045 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8046 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8045, i32 0, i32 6
%.tmp8047 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8046
%.tmp8048 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8047, i32 0, i32 1
%.tmp8049 = load i8*, i8** %.tmp8048
%.tmp8051 = getelementptr [5 x i8], [5 x i8]*@.str8050, i32 0, i32 0
%.tmp8052 = call i32(i8*,i8*) @strcmp(i8* %.tmp8049, i8* %.tmp8051)
%.tmp8053 = icmp ne i32 %.tmp8052, 0
br i1 %.tmp8053, label %.if.true.8054, label %.if.false.8054
.if.true.8054:
%.tmp8055 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8056 = load %m981$.Node.type*, %m981$.Node.type** %curr_node
%.tmp8058 = getelementptr [42 x i8], [42 x i8]*@.str8057, i32 0, i32 0
%.tmp8059 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$err_tmpl.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp8055, %m981$.Node.type* %.tmp8056, i8* %.tmp8058)
%.tmp8060 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8061 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8060, i32 0, i32 6
%.tmp8062 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8061
%.tmp8063 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8062, i32 0, i32 1
%.tmp8064 = load i8*, i8** %.tmp8063
%.tmp8065 = call i32(i8*,...) @printf(i8* %.tmp8059, i8* %.tmp8064)
%.tmp8066 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp8066
br label %.if.end.8054
.if.false.8054:
br label %.if.end.8054
.if.end.8054:
%.tmp8067 = load %m981$.Node.type*, %m981$.Node.type** %curr_node
%.tmp8068 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp8067)
store %m2638$.AssignableInfo.type* %.tmp8068, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8069 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8070 = load i8, i8* @SCOPE_CONST
%.tmp8072 = getelementptr [5 x i8], [5 x i8]*@.str8071, i32 0, i32 0
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp8069, i8 %.tmp8070, i8* %.tmp8072)
%.tmp8073 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8074 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8073, i32 0, i32 4
%.tmp8075 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp8075, %m2638$.Type.type** %.tmp8074
%.tmp8076 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8077 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8076, i32 0, i32 4
%.tmp8078 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8077
%.tmp8079 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8078, i32 0, i32 0
%.tmp8081 = getelementptr [8 x i8], [8 x i8]*@.str8080, i32 0, i32 0
store i8* %.tmp8081, i8** %.tmp8079
br label %.if.end.8044
.if.false.8044:
%.tmp8082 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8083 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8082, i32 0, i32 6
%.tmp8084 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8083
%.tmp8085 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8084, i32 0, i32 0
%.tmp8086 = load i8*, i8** %.tmp8085
%.tmp8088 = getelementptr [17 x i8], [17 x i8]*@.str8087, i32 0, i32 0
%.tmp8089 = call i32(i8*,i8*) @strcmp(i8* %.tmp8086, i8* %.tmp8088)
%.tmp8090 = icmp eq i32 %.tmp8089, 0
br i1 %.tmp8090, label %.if.true.8091, label %.if.false.8091
.if.true.8091:
%.tmp8092 = load %m981$.Node.type*, %m981$.Node.type** %curr_node
%.tmp8093 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp8092)
store %m2638$.AssignableInfo.type* %.tmp8093, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8094 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8095 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8094, i32 0, i32 6
%.tmp8096 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8095
%.tmp8097 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8096, i32 0, i32 6
%.tmp8098 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8097
%.tmp8100 = getelementptr [12 x i8], [12 x i8]*@.str8099, i32 0, i32 0
%.tmp8101 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp8098, i8* %.tmp8100)
%dest.8102 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp8101, %m981$.Node.type** %dest.8102
%.tmp8103 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8104 = load %m981$.Node.type*, %m981$.Node.type** %dest.8102
%.tmp8105 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_addr.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp8103, %m981$.Node.type* %.tmp8104)
%var_info.8106 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp8105, %m2638$.AssignableInfo.type** %var_info.8106
%.tmp8107 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %var_info.8106
%.tmp8108 = icmp eq %m2638$.AssignableInfo.type* %.tmp8107, null
br i1 %.tmp8108, label %.if.true.8109, label %.if.false.8109
.if.true.8109:
%.tmp8110 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp8110
br label %.if.end.8109
.if.false.8109:
br label %.if.end.8109
.if.end.8109:
%.tmp8111 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8112 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %var_info.8106
%.tmp8113 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8112, i32 0, i32 4
%.tmp8114 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8113
%.tmp8115 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp8111, %m2638$.Type.type* %.tmp8114)
%var_type_repr.8116 = alloca i8*
store i8* %.tmp8115, i8** %var_type_repr.8116
%.tmp8117 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8118 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp8117, %m2638$.AssignableInfo.type* %.tmp8118)
%.tmp8119 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8120 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8119, i32 0, i32 4
%.tmp8121 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %var_info.8106
%.tmp8122 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8121, i32 0, i32 4
%.tmp8123 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8122
store %m2638$.Type.type* %.tmp8123, %m2638$.Type.type** %.tmp8120
%.tmp8125 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8126 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8125, i32 0, i32 6
%.tmp8127 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8126
%.tmp8128 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8127, i32 0, i32 6
%.tmp8129 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8128
%ptr.8130 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp8129, %m981$.Node.type** %ptr.8130
br label %.for.start.8124
.for.start.8124:
%.tmp8131 = load %m981$.Node.type*, %m981$.Node.type** %ptr.8130
%.tmp8132 = load %m981$.Node.type*, %m981$.Node.type** %dest.8102
%.tmp8133 = icmp ne %m981$.Node.type* %.tmp8131, %.tmp8132
br i1 %.tmp8133, label %.for.continue.8124, label %.for.end.8124
.for.continue.8124:
%.tmp8134 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
%type.8135 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp8134, %m2638$.Type.type** %type.8135
%.tmp8136 = load %m2638$.Type.type*, %m2638$.Type.type** %type.8135
%.tmp8137 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8136, i32 0, i32 3
%.tmp8138 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8139 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8138, i32 0, i32 4
%.tmp8140 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8139
store %m2638$.Type.type* %.tmp8140, %m2638$.Type.type** %.tmp8137
%.tmp8141 = load %m2638$.Type.type*, %m2638$.Type.type** %type.8135
%.tmp8142 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8141, i32 0, i32 0
%.tmp8144 = getelementptr [4 x i8], [4 x i8]*@.str8143, i32 0, i32 0
store i8* %.tmp8144, i8** %.tmp8142
%.tmp8145 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8146 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8145, i32 0, i32 4
%.tmp8147 = load %m2638$.Type.type*, %m2638$.Type.type** %type.8135
store %m2638$.Type.type* %.tmp8147, %m2638$.Type.type** %.tmp8146
%.tmp8148 = load %m981$.Node.type*, %m981$.Node.type** %ptr.8130
%.tmp8149 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8148, i32 0, i32 7
%.tmp8150 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8149
store %m981$.Node.type* %.tmp8150, %m981$.Node.type** %ptr.8130
br label %.for.start.8124
.for.end.8124:
%.tmp8151 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8152 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8151, i32 0, i32 6
%.tmp8153 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8152
%.tmp8154 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8153, i32 0, i32 6
%.tmp8155 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8154
%.tmp8156 = load %m981$.Node.type*, %m981$.Node.type** %dest.8102
%.tmp8157 = icmp ne %m981$.Node.type* %.tmp8155, %.tmp8156
br i1 %.tmp8157, label %.if.true.8158, label %.if.false.8158
.if.true.8158:
%.tmp8159 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8160 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp8159, i32 0, i32 1
%.tmp8161 = load %m0$.File.type*, %m0$.File.type** %.tmp8160
%.tmp8163 = getelementptr [38 x i8], [38 x i8]*@.str8162, i32 0, i32 0
%.tmp8164 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8165 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp8164)
%.tmp8166 = load i8*, i8** %var_type_repr.8116
%.tmp8167 = load i8*, i8** %var_type_repr.8116
%.tmp8168 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %var_info.8106
%.tmp8169 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp8168)
%.tmp8170 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8161, i8* %.tmp8163, i8* %.tmp8165, i8* %.tmp8166, i8* %.tmp8167, i8* %.tmp8169)
br label %.if.end.8158
.if.false.8158:
%.tmp8171 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8172 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8171, i32 0, i32 4
%.tmp8173 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8172
%.tmp8174 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8173, i32 0, i32 0
%.tmp8175 = load i8*, i8** %.tmp8174
%.tmp8177 = getelementptr [9 x i8], [9 x i8]*@.str8176, i32 0, i32 0
%.tmp8178 = call i32(i8*,i8*) @strcmp(i8* %.tmp8175, i8* %.tmp8177)
%.tmp8179 = icmp eq i32 %.tmp8178, 0
br i1 %.tmp8179, label %.if.true.8180, label %.if.false.8180
.if.true.8180:
%.tmp8181 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %var_info.8106
store %m2638$.AssignableInfo.type* %.tmp8181, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8182 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
%type.8183 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp8182, %m2638$.Type.type** %type.8183
%.tmp8184 = load %m2638$.Type.type*, %m2638$.Type.type** %type.8183
%.tmp8185 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8184, i32 0, i32 3
%.tmp8186 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8187 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8186, i32 0, i32 4
%.tmp8188 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8187
store %m2638$.Type.type* %.tmp8188, %m2638$.Type.type** %.tmp8185
%.tmp8189 = load %m2638$.Type.type*, %m2638$.Type.type** %type.8183
%.tmp8190 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8189, i32 0, i32 0
%.tmp8192 = getelementptr [4 x i8], [4 x i8]*@.str8191, i32 0, i32 0
store i8* %.tmp8192, i8** %.tmp8190
%.tmp8193 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8194 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8193, i32 0, i32 4
%.tmp8195 = load %m2638$.Type.type*, %m2638$.Type.type** %type.8183
store %m2638$.Type.type* %.tmp8195, %m2638$.Type.type** %.tmp8194
br label %.if.end.8180
.if.false.8180:
%.tmp8196 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8197 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp8196, i32 0, i32 1
%.tmp8198 = load %m0$.File.type*, %m0$.File.type** %.tmp8197
%.tmp8200 = getelementptr [22 x i8], [22 x i8]*@.str8199, i32 0, i32 0
%.tmp8201 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8202 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp8201)
%.tmp8203 = load i8*, i8** %var_type_repr.8116
%.tmp8204 = load i8*, i8** %var_type_repr.8116
%.tmp8205 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %var_info.8106
%.tmp8206 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp8205)
%.tmp8207 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8198, i8* %.tmp8200, i8* %.tmp8202, i8* %.tmp8203, i8* %.tmp8204, i8* %.tmp8206)
br label %.if.end.8180
.if.end.8180:
br label %.if.end.8158
.if.end.8158:
br label %.if.end.8091
.if.false.8091:
%.tmp8208 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8209 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8208, i32 0, i32 6
%.tmp8210 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8209
%.tmp8211 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8210, i32 0, i32 0
%.tmp8212 = load i8*, i8** %.tmp8211
%.tmp8214 = getelementptr [8 x i8], [8 x i8]*@.str8213, i32 0, i32 0
%.tmp8215 = call i32(i8*,i8*) @strcmp(i8* %.tmp8212, i8* %.tmp8214)
%.tmp8216 = icmp eq i32 %.tmp8215, 0
br i1 %.tmp8216, label %.if.true.8217, label %.if.false.8217
.if.true.8217:
%.tmp8218 = load %m981$.Node.type*, %m981$.Node.type** %curr_node
%.tmp8219 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp8218)
store %m2638$.AssignableInfo.type* %.tmp8219, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8220 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8221 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8220, i32 0, i32 4
%.tmp8222 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp8222, %m2638$.Type.type** %.tmp8221
%.tmp8223 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8224 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8223, i32 0, i32 4
%.tmp8225 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8224
%.tmp8226 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8225, i32 0, i32 0
%.tmp8228 = getelementptr [5 x i8], [5 x i8]*@.str8227, i32 0, i32 0
store i8* %.tmp8228, i8** %.tmp8226
%.tmp8229 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8230 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8229, i32 0, i32 6
%.tmp8231 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8230
%.tmp8232 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8231, i32 0, i32 6
%.tmp8233 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8232
%.tmp8234 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8233, i32 0, i32 1
%.tmp8235 = load i8*, i8** %.tmp8234
%.tmp8237 = getelementptr [6 x i8], [6 x i8]*@.str8236, i32 0, i32 0
%.tmp8238 = call i32(i8*,i8*) @strcmp(i8* %.tmp8235, i8* %.tmp8237)
%.tmp8239 = icmp eq i32 %.tmp8238, 0
br i1 %.tmp8239, label %.if.true.8240, label %.if.false.8240
.if.true.8240:
%.tmp8241 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8242 = load i8, i8* @SCOPE_CONST
%.tmp8244 = getelementptr [2 x i8], [2 x i8]*@.str8243, i32 0, i32 0
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp8241, i8 %.tmp8242, i8* %.tmp8244)
br label %.if.end.8240
.if.false.8240:
%.tmp8245 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8246 = load i8, i8* @SCOPE_CONST
%.tmp8248 = getelementptr [2 x i8], [2 x i8]*@.str8247, i32 0, i32 0
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp8245, i8 %.tmp8246, i8* %.tmp8248)
br label %.if.end.8240
.if.end.8240:
br label %.if.end.8217
.if.false.8217:
%.tmp8249 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8250 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8249, i32 0, i32 6
%.tmp8251 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8250
%.tmp8252 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8251, i32 0, i32 0
%.tmp8253 = load i8*, i8** %.tmp8252
%.tmp8255 = getelementptr [8 x i8], [8 x i8]*@.str8254, i32 0, i32 0
%.tmp8256 = call i32(i8*,i8*) @strcmp(i8* %.tmp8253, i8* %.tmp8255)
%.tmp8257 = icmp eq i32 %.tmp8256, 0
br i1 %.tmp8257, label %.if.true.8258, label %.if.false.8258
.if.true.8258:
%.tmp8259 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8260 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8261 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8260, i32 0, i32 6
%.tmp8262 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8261
%.tmp8263 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8262, i32 0, i32 6
%.tmp8264 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8263
%.tmp8265 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$compile_fn_call.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp8259, %m981$.Node.type* %.tmp8264)
store %m2638$.AssignableInfo.type* %.tmp8265, %m2638$.AssignableInfo.type** %assignable_info.8002
br label %.if.end.8258
.if.false.8258:
%.tmp8266 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8267 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8266, i32 0, i32 6
%.tmp8268 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8267
%.tmp8269 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8268, i32 0, i32 0
%.tmp8270 = load i8*, i8** %.tmp8269
%.tmp8272 = getelementptr [7 x i8], [7 x i8]*@.str8271, i32 0, i32 0
%.tmp8273 = call i32(i8*,i8*) @strcmp(i8* %.tmp8270, i8* %.tmp8272)
%.tmp8274 = icmp eq i32 %.tmp8273, 0
br i1 %.tmp8274, label %.if.true.8275, label %.if.false.8275
.if.true.8275:
%.tmp8276 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8277 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8278 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8277, i32 0, i32 6
%.tmp8279 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8278
%.tmp8280 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8279, i32 0, i32 1
%.tmp8281 = load i8*, i8** %.tmp8280
%.tmp8282 = call %m2638$.AssignableInfo.type*(%m2638$.CompilerCtx.type*,i8*) @m295$define_string.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.cp(%m2638$.CompilerCtx.type* %.tmp8276, i8* %.tmp8281)
%string_info.8283 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp8282, %m2638$.AssignableInfo.type** %string_info.8283
%.tmp8284 = load %m981$.Node.type*, %m981$.Node.type** %curr_node
%.tmp8285 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp8284)
store %m2638$.AssignableInfo.type* %.tmp8285, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8286 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8287 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
call void(%m2638$.CompilerCtx.type*,%m2638$.AssignableInfo.type*) @m295$set_assignable_tmp_id.v.m2638$.CompilerCtx.typep.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp8286, %m2638$.AssignableInfo.type* %.tmp8287)
%.tmp8288 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8289 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %string_info.8283
%.tmp8290 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8289, i32 0, i32 4
%.tmp8291 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8290
%.tmp8292 = call i8*(%m2638$.CompilerCtx.type*,%m2638$.Type.type*) @m2639$repr.cp.m2638$.CompilerCtx.typep.m2638$.Type.typep(%m2638$.CompilerCtx.type* %.tmp8288, %m2638$.Type.type* %.tmp8291)
%str_tr.8293 = alloca i8*
store i8* %.tmp8292, i8** %str_tr.8293
%.tmp8294 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8295 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp8294, i32 0, i32 1
%.tmp8296 = load %m0$.File.type*, %m0$.File.type** %.tmp8295
%.tmp8298 = getelementptr [44 x i8], [44 x i8]*@.str8297, i32 0, i32 0
%.tmp8299 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8300 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp8299)
%.tmp8301 = load i8*, i8** %str_tr.8293
%.tmp8302 = load i8*, i8** %str_tr.8293
%.tmp8303 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %string_info.8283
%.tmp8304 = call i8*(%m2638$.AssignableInfo.type*) @m295$repr_assignable_id.cp.m2638$.AssignableInfo.typep(%m2638$.AssignableInfo.type* %.tmp8303)
%.tmp8305 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8296, i8* %.tmp8298, i8* %.tmp8300, i8* %.tmp8301, i8* %.tmp8302, i8* %.tmp8304)
%.tmp8306 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8307 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8306, i32 0, i32 4
%.tmp8308 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp8308, %m2638$.Type.type** %.tmp8307
%.tmp8309 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8310 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8309, i32 0, i32 4
%.tmp8311 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8310
%.tmp8312 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8311, i32 0, i32 0
%.tmp8314 = getelementptr [4 x i8], [4 x i8]*@.str8313, i32 0, i32 0
store i8* %.tmp8314, i8** %.tmp8312
%.tmp8315 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8316 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8315, i32 0, i32 4
%.tmp8317 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8316
%.tmp8318 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8317, i32 0, i32 3
%.tmp8319 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp8319, %m2638$.Type.type** %.tmp8318
%.tmp8320 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8321 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8320, i32 0, i32 4
%.tmp8322 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8321
%.tmp8323 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8322, i32 0, i32 3
%.tmp8324 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8323
%.tmp8325 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8324, i32 0, i32 0
%.tmp8327 = getelementptr [4 x i8], [4 x i8]*@.str8326, i32 0, i32 0
store i8* %.tmp8327, i8** %.tmp8325
br label %.if.end.8275
.if.false.8275:
%.tmp8328 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8329 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8328, i32 0, i32 6
%.tmp8330 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8329
%.tmp8331 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8330, i32 0, i32 0
%.tmp8332 = load i8*, i8** %.tmp8331
%.tmp8334 = getelementptr [4 x i8], [4 x i8]*@.str8333, i32 0, i32 0
%.tmp8335 = call i32(i8*,i8*) @strcmp(i8* %.tmp8332, i8* %.tmp8334)
%.tmp8336 = icmp eq i32 %.tmp8335, 0
br i1 %.tmp8336, label %.if.true.8337, label %.if.false.8337
.if.true.8337:
%.tmp8338 = load %m981$.Node.type*, %m981$.Node.type** %curr_node
%.tmp8339 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp8338)
store %m2638$.AssignableInfo.type* %.tmp8339, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8340 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8341 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8340, i32 0, i32 6
%.tmp8342 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8341
%.tmp8343 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8342, i32 0, i32 1
%.tmp8344 = load i8*, i8** %.tmp8343
%.tmp8345 = call i32(i8*) @strlen(i8* %.tmp8344)
%chr_len.8346 = alloca i32
store i32 %.tmp8345, i32* %chr_len.8346
%.tmp8347 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8348 = load i8, i8* @SCOPE_CONST
%.tmp8350 = getelementptr [2 x i8], [2 x i8]*@.str8349, i32 0, i32 0
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp8347, i8 %.tmp8348, i8* %.tmp8350)
%.tmp8351 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8352 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8351, i32 0, i32 0
%.tmp8353 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8354 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8353, i32 0, i32 6
%.tmp8355 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8354
%.tmp8356 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8355, i32 0, i32 1
%.tmp8357 = load i8*, i8** %.tmp8356
%.tmp8358 = call i8*(i8*) @m2192$chr_to_llvm.cp.cp(i8* %.tmp8357)
store i8* %.tmp8358, i8** %.tmp8352
%.tmp8359 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8360 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8359, i32 0, i32 0
%.tmp8361 = load i8*, i8** %.tmp8360
%.tmp8362 = icmp eq i8* %.tmp8361, null
br i1 %.tmp8362, label %.if.true.8363, label %.if.false.8363
.if.true.8363:
%.tmp8364 = getelementptr i8*, i8** %err_buf.8005, i32 0
%.tmp8366 = getelementptr [22 x i8], [22 x i8]*@.str8365, i32 0, i32 0
%.tmp8367 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8368 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8367, i32 0, i32 6
%.tmp8369 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8368
%.tmp8370 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8369, i32 0, i32 1
%.tmp8371 = load i8*, i8** %.tmp8370
%.tmp8372 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8364, i8* %.tmp8366, i8* %.tmp8371)
%.tmp8373 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp8373
br label %.if.end.8363
.if.false.8363:
br label %.if.end.8363
.if.end.8363:
%.tmp8374 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8375 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8374, i32 0, i32 4
%.tmp8376 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp8376, %m2638$.Type.type** %.tmp8375
%.tmp8377 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8378 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8377, i32 0, i32 4
%.tmp8379 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8378
%.tmp8380 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8379, i32 0, i32 0
%.tmp8382 = getelementptr [4 x i8], [4 x i8]*@.str8381, i32 0, i32 0
store i8* %.tmp8382, i8** %.tmp8380
br label %.if.end.8337
.if.false.8337:
%.tmp8383 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8384 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8386 = getelementptr [40 x i8], [40 x i8]*@.str8385, i32 0, i32 0
%.tmp8387 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$err_tmpl.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp8383, %m981$.Node.type* %.tmp8384, i8* %.tmp8386)
%.tmp8388 = load %m981$.Node.type*, %m981$.Node.type** %mono.8004
%.tmp8389 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8388, i32 0, i32 6
%.tmp8390 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8389
%.tmp8391 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8390, i32 0, i32 0
%.tmp8392 = load i8*, i8** %.tmp8391
%.tmp8393 = call i32(i8*,...) @printf(i8* %.tmp8387, i8* %.tmp8392)
%.tmp8394 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp8394
br label %.if.end.8337
.if.end.8337:
br label %.if.end.8275
.if.end.8275:
br label %.if.end.8258
.if.end.8258:
br label %.if.end.8217
.if.end.8217:
br label %.if.end.8091
.if.end.8091:
br label %.if.end.8044
.if.end.8044:
br label %.if.end.8016
.if.end.8016:
%.tmp8395 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8396 = icmp eq %m2638$.AssignableInfo.type* %.tmp8395, null
br i1 %.tmp8396, label %.if.true.8397, label %.if.false.8397
.if.true.8397:
%.tmp8398 = bitcast ptr null to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp8398
br label %.if.end.8397
.if.false.8397:
br label %.if.end.8397
.if.end.8397:
%.tmp8399 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8400 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8399, i32 0, i32 5
%.tmp8401 = load %m981$.Node.type*, %m981$.Node.type** %curr_node
%.tmp8402 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8401, i32 0, i32 3
%.tmp8403 = load i32, i32* %.tmp8402
store i32 %.tmp8403, i32* %.tmp8400
%.tmp8404 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8405 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8404, i32 0, i32 6
%.tmp8406 = load %m981$.Node.type*, %m981$.Node.type** %curr_node
%.tmp8407 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8406, i32 0, i32 4
%.tmp8408 = load i32, i32* %.tmp8407
store i32 %.tmp8408, i32* %.tmp8405
%.tmp8409 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %assignable_info.8002
%.tmp8410 = bitcast %m2638$.AssignableInfo.type* %.tmp8409 to %m2638$.AssignableInfo.type*
ret %m2638$.AssignableInfo.type* %.tmp8410
}
define i8* @m295$type_abbr.cp.m2638$.Type.typep(%m2638$.Type.type* %.type.arg) {
%type = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.type.arg, %m2638$.Type.type** %type
%.tmp8411 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp8412 = icmp ne %m2638$.Type.type* %.tmp8411, null
%.tmp8414 = getelementptr [22 x i8], [22 x i8]*@.str8413, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp8412, i8* %.tmp8414)
%.tmp8415 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp8416 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8415, i32 0, i32 0
%.tmp8417 = load i8*, i8** %.tmp8416
%.tmp8418 = icmp ne i8* %.tmp8417, null
%.tmp8420 = getelementptr [59 x i8], [59 x i8]*@.str8419, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp8418, i8* %.tmp8420)
%.tmp8421 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp8422 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8421, i32 0, i32 0
%.tmp8423 = load i8*, i8** %.tmp8422
%.tmp8425 = getelementptr [4 x i8], [4 x i8]*@.str8424, i32 0, i32 0
%.tmp8426 = call i32(i8*,i8*) @strcmp(i8* %.tmp8423, i8* %.tmp8425)
%.tmp8427 = icmp eq i32 %.tmp8426, 0
br i1 %.tmp8427, label %.if.true.8428, label %.if.false.8428
.if.true.8428:
%.tmp8430 = getelementptr [2 x i8], [2 x i8]*@.str8429, i32 0, i32 0
ret i8* %.tmp8430
br label %.if.end.8428
.if.false.8428:
%.tmp8431 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp8432 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8431, i32 0, i32 0
%.tmp8433 = load i8*, i8** %.tmp8432
%.tmp8435 = getelementptr [5 x i8], [5 x i8]*@.str8434, i32 0, i32 0
%.tmp8436 = call i32(i8*,i8*) @strcmp(i8* %.tmp8433, i8* %.tmp8435)
%.tmp8437 = icmp eq i32 %.tmp8436, 0
br i1 %.tmp8437, label %.if.true.8438, label %.if.false.8438
.if.true.8438:
%.tmp8440 = getelementptr [2 x i8], [2 x i8]*@.str8439, i32 0, i32 0
ret i8* %.tmp8440
br label %.if.end.8438
.if.false.8438:
%.tmp8441 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp8442 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8441, i32 0, i32 0
%.tmp8443 = load i8*, i8** %.tmp8442
%.tmp8445 = getelementptr [5 x i8], [5 x i8]*@.str8444, i32 0, i32 0
%.tmp8446 = call i32(i8*,i8*) @strcmp(i8* %.tmp8443, i8* %.tmp8445)
%.tmp8447 = icmp eq i32 %.tmp8446, 0
br i1 %.tmp8447, label %.if.true.8448, label %.if.false.8448
.if.true.8448:
%.tmp8450 = getelementptr [2 x i8], [2 x i8]*@.str8449, i32 0, i32 0
ret i8* %.tmp8450
br label %.if.end.8448
.if.false.8448:
%.tmp8451 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp8452 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8451, i32 0, i32 0
%.tmp8453 = load i8*, i8** %.tmp8452
%.tmp8455 = getelementptr [4 x i8], [4 x i8]*@.str8454, i32 0, i32 0
%.tmp8456 = call i32(i8*,i8*) @strcmp(i8* %.tmp8453, i8* %.tmp8455)
%.tmp8457 = icmp eq i32 %.tmp8456, 0
br i1 %.tmp8457, label %.if.true.8458, label %.if.false.8458
.if.true.8458:
%.tmp8460 = getelementptr [2 x i8], [2 x i8]*@.str8459, i32 0, i32 0
ret i8* %.tmp8460
br label %.if.end.8458
.if.false.8458:
%.tmp8461 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp8462 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8461, i32 0, i32 0
%.tmp8463 = load i8*, i8** %.tmp8462
%.tmp8465 = getelementptr [4 x i8], [4 x i8]*@.str8464, i32 0, i32 0
%.tmp8466 = call i32(i8*,i8*) @strcmp(i8* %.tmp8463, i8* %.tmp8465)
%.tmp8467 = icmp eq i32 %.tmp8466, 0
br i1 %.tmp8467, label %.if.true.8468, label %.if.false.8468
.if.true.8468:
%buf.8469 = alloca i8*
store i8* null, i8** %buf.8469
%.tmp8470 = getelementptr i8*, i8** %buf.8469, i32 0
%.tmp8472 = getelementptr [4 x i8], [4 x i8]*@.str8471, i32 0, i32 0
%.tmp8473 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp8474 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8473, i32 0, i32 3
%.tmp8475 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8474
%.tmp8476 = call i8*(%m2638$.Type.type*) @m295$type_abbr.cp.m2638$.Type.typep(%m2638$.Type.type* %.tmp8475)
%.tmp8477 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8470, i8* %.tmp8472, i8* %.tmp8476)
%.tmp8478 = load i8*, i8** %buf.8469
ret i8* %.tmp8478
br label %.if.end.8468
.if.false.8468:
%.tmp8479 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp8480 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8479, i32 0, i32 0
%.tmp8481 = load i8*, i8** %.tmp8480
%.tmp8483 = getelementptr [10 x i8], [10 x i8]*@.str8482, i32 0, i32 0
%.tmp8484 = call i32(i8*,i8*) @strcmp(i8* %.tmp8481, i8* %.tmp8483)
%.tmp8485 = icmp eq i32 %.tmp8484, 0
br i1 %.tmp8485, label %.if.true.8486, label %.if.false.8486
.if.true.8486:
%.tmp8487 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp8488 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8487, i32 0, i32 2
%.tmp8489 = load i8*, i8** %.tmp8488
ret i8* %.tmp8489
br label %.if.end.8486
.if.false.8486:
%.tmp8490 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp8491 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8490, i32 0, i32 0
%.tmp8492 = load i8*, i8** %.tmp8491
%.tmp8494 = getelementptr [7 x i8], [7 x i8]*@.str8493, i32 0, i32 0
%.tmp8495 = call i32(i8*,i8*) @strcmp(i8* %.tmp8492, i8* %.tmp8494)
%.tmp8496 = icmp eq i32 %.tmp8495, 0
br i1 %.tmp8496, label %.if.true.8497, label %.if.false.8497
.if.true.8497:
%.tmp8499 = getelementptr [2 x i8], [2 x i8]*@.str8498, i32 0, i32 0
%buf.8500 = alloca i8*
store i8* %.tmp8499, i8** %buf.8500
%.tmp8502 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp8503 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8502, i32 0, i32 3
%.tmp8504 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8503
%t.8505 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp8504, %m2638$.Type.type** %t.8505
br label %.for.start.8501
.for.start.8501:
%.tmp8506 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8505
%.tmp8507 = icmp ne %m2638$.Type.type* %.tmp8506, null
br i1 %.tmp8507, label %.for.continue.8501, label %.for.end.8501
.for.continue.8501:
%.tmp8508 = getelementptr i8*, i8** %buf.8500, i32 0
%.tmp8510 = getelementptr [5 x i8], [5 x i8]*@.str8509, i32 0, i32 0
%.tmp8511 = load i8*, i8** %buf.8500
%.tmp8512 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8505
%.tmp8513 = call i8*(%m2638$.Type.type*) @m295$type_abbr.cp.m2638$.Type.typep(%m2638$.Type.type* %.tmp8512)
%.tmp8514 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8508, i8* %.tmp8510, i8* %.tmp8511, i8* %.tmp8513)
%.tmp8515 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8505
%.tmp8516 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8515, i32 0, i32 4
%.tmp8517 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8516
store %m2638$.Type.type* %.tmp8517, %m2638$.Type.type** %t.8505
br label %.for.start.8501
.for.end.8501:
%.tmp8518 = load i8*, i8** %buf.8500
ret i8* %.tmp8518
br label %.if.end.8497
.if.false.8497:
%.tmp8519 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp8520 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8519, i32 0, i32 0
%.tmp8521 = load i8*, i8** %.tmp8520
%.tmp8523 = getelementptr [9 x i8], [9 x i8]*@.str8522, i32 0, i32 0
%.tmp8524 = call i32(i8*,i8*) @strcmp(i8* %.tmp8521, i8* %.tmp8523)
%.tmp8525 = icmp eq i32 %.tmp8524, 0
br i1 %.tmp8525, label %.if.true.8526, label %.if.false.8526
.if.true.8526:
%.tmp8528 = getelementptr [2 x i8], [2 x i8]*@.str8527, i32 0, i32 0
ret i8* %.tmp8528
br label %.if.end.8526
.if.false.8526:
%.tmp8529 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp8530 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8529, i32 0, i32 0
%.tmp8531 = load i8*, i8** %.tmp8530
%.tmp8533 = getelementptr [6 x i8], [6 x i8]*@.str8532, i32 0, i32 0
%.tmp8534 = call i32(i8*,i8*) @strcmp(i8* %.tmp8531, i8* %.tmp8533)
%.tmp8535 = icmp eq i32 %.tmp8534, 0
br i1 %.tmp8535, label %.if.true.8536, label %.if.false.8536
.if.true.8536:
%.tmp8538 = getelementptr [2 x i8], [2 x i8]*@.str8537, i32 0, i32 0
ret i8* %.tmp8538
br label %.if.end.8536
.if.false.8536:
%.tmp8540 = getelementptr [45 x i8], [45 x i8]*@.str8539, i32 0, i32 0
%.tmp8541 = load %m2638$.Type.type*, %m2638$.Type.type** %type
%.tmp8542 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8541, i32 0, i32 0
%.tmp8543 = load i8*, i8** %.tmp8542
%.tmp8544 = call i32(i8*,...) @printf(i8* %.tmp8540, i8* %.tmp8543)
br label %.if.end.8536
.if.end.8536:
br label %.if.end.8526
.if.end.8526:
br label %.if.end.8497
.if.end.8497:
br label %.if.end.8486
.if.end.8486:
br label %.if.end.8468
.if.end.8468:
br label %.if.end.8458
.if.end.8458:
br label %.if.end.8448
.if.end.8448:
br label %.if.end.8438
.if.end.8438:
br label %.if.end.8428
.if.end.8428:
%.tmp8545 = bitcast ptr null to i8*
ret i8* %.tmp8545
}
define %m2638$.AssignableInfo.type* @m295$define_string.m2638$.AssignableInfo.typep.m2638$.CompilerCtx.typep.cp(%m2638$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp8546 = bitcast ptr null to %m981$.Node.type*
%.tmp8547 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp8546)
%info.8548 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp8547, %m2638$.AssignableInfo.type** %info.8548
%tmp_buff.8549 = alloca i8*
store i8* null, i8** %tmp_buff.8549
%.tmp8550 = getelementptr i8*, i8** %tmp_buff.8549, i32 0
%.tmp8552 = getelementptr [7 x i8], [7 x i8]*@.str8551, i32 0, i32 0
%.tmp8553 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8554 = call i32(%m2638$.CompilerCtx.type*) @m295$new_uid.i.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.tmp8553)
%.tmp8555 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8550, i8* %.tmp8552, i32 %.tmp8554)
%.tmp8556 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.8548
%.tmp8557 = load i8, i8* @SCOPE_GLOBAL
%.tmp8558 = load i8*, i8** %tmp_buff.8549
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp8556, i8 %.tmp8557, i8* %.tmp8558)
%.tmp8559 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.8548
%.tmp8560 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8559, i32 0, i32 4
%.tmp8561 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp8561, %m2638$.Type.type** %.tmp8560
%.tmp8562 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.8548
%.tmp8563 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8562, i32 0, i32 4
%.tmp8564 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8563
%.tmp8565 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8564, i32 0, i32 0
%.tmp8567 = getelementptr [6 x i8], [6 x i8]*@.str8566, i32 0, i32 0
store i8* %.tmp8567, i8** %.tmp8565
%.tmp8568 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.8548
%.tmp8569 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8568, i32 0, i32 4
%.tmp8570 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8569
%.tmp8571 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8570, i32 0, i32 3
%.tmp8572 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp8572, %m2638$.Type.type** %.tmp8571
%.tmp8573 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.8548
%.tmp8574 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8573, i32 0, i32 4
%.tmp8575 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8574
%.tmp8576 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8575, i32 0, i32 3
%.tmp8577 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8576
%.tmp8578 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8577, i32 0, i32 0
%.tmp8580 = getelementptr [4 x i8], [4 x i8]*@.str8579, i32 0, i32 0
store i8* %.tmp8580, i8** %.tmp8578
%.tmp8581 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.8548
%.tmp8582 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8581, i32 0, i32 4
%.tmp8583 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8582
%.tmp8584 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8583, i32 0, i32 3
%.tmp8585 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8584
%.tmp8586 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8585, i32 0, i32 4
%.tmp8587 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp8587, %m2638$.Type.type** %.tmp8586
%.tmp8588 = load i8*, i8** %text
%.tmp8589 = call i8*(i8*) @m2192$string_to_llvm.cp.cp(i8* %.tmp8588)
%identifier.8590 = alloca i8*
store i8* %.tmp8589, i8** %identifier.8590
%.tmp8591 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.8548
%.tmp8592 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8591, i32 0, i32 4
%.tmp8593 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8592
%.tmp8594 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8593, i32 0, i32 3
%.tmp8595 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8594
%.tmp8596 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8595, i32 0, i32 4
%.tmp8597 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8596
%.tmp8598 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8597, i32 0, i32 0
%.tmp8599 = getelementptr i8*, i8** %.tmp8598, i32 0
%.tmp8601 = getelementptr [3 x i8], [3 x i8]*@.str8600, i32 0, i32 0
%.tmp8602 = load i8*, i8** %identifier.8590
%.tmp8603 = call i32(i8*) @m2192$llvm_str_len.i.cp(i8* %.tmp8602)
%.tmp8604 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8599, i8* %.tmp8601, i32 %.tmp8603)
%.tmp8605 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8606 = load i8*, i8** %identifier.8590
%.tmp8608 = getelementptr [7 x i8], [7 x i8]*@.str8607, i32 0, i32 0
%.tmp8609 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.8548
call void(%m2638$.CompilerCtx.type*,i8*,i8*,%m2638$.AssignableInfo.type*,i1,i1) @m295$define_global.v.m2638$.CompilerCtx.typep.cp.cp.m2638$.AssignableInfo.typep.b.b(%m2638$.CompilerCtx.type* %.tmp8605, i8* %.tmp8606, i8* %.tmp8608, %m2638$.AssignableInfo.type* %.tmp8609, i1 0, i1 0)
%.tmp8610 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.8548
ret %m2638$.AssignableInfo.type* %.tmp8610
}
define void @m295$define_global.v.m2638$.CompilerCtx.typep.cp.cp.m2638$.AssignableInfo.typep.b.b(%m2638$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg, i8* %.type.arg, %m2638$.AssignableInfo.type* %.info.arg, i1 %.weak.arg, i1 %.compiled.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%type = alloca i8*
store i8* %.type.arg, i8** %type
%info = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.info.arg, %m2638$.AssignableInfo.type** %info
%weak = alloca i1
store i1 %.weak.arg, i1* %weak
%compiled = alloca i1
store i1 %.compiled.arg, i1* %compiled
%.tmp8611 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* null, i32 1
%.tmp8612 = ptrtoint %m2638$.GlobalName.type* %.tmp8611 to i32
%.tmp8613 = call i8*(i32) @malloc(i32 %.tmp8612)
%.tmp8614 = bitcast i8* %.tmp8613 to %m2638$.GlobalName.type*
%global.8615 = alloca %m2638$.GlobalName.type*
store %m2638$.GlobalName.type* %.tmp8614, %m2638$.GlobalName.type** %global.8615
%.tmp8616 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %global.8615
%.tmp8617 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp8616, i32 0, i32 0
%.tmp8618 = load i8*, i8** %id
store i8* %.tmp8618, i8** %.tmp8617
%.tmp8619 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %global.8615
%.tmp8620 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp8619, i32 0, i32 1
%.tmp8621 = load i8*, i8** %type
store i8* %.tmp8621, i8** %.tmp8620
%.tmp8622 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %global.8615
%.tmp8623 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp8622, i32 0, i32 4
%.tmp8624 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info
store %m2638$.AssignableInfo.type* %.tmp8624, %m2638$.AssignableInfo.type** %.tmp8623
%.tmp8625 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %global.8615
%.tmp8626 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp8625, i32 0, i32 2
%.tmp8627 = load i1, i1* %compiled
store i1 %.tmp8627, i1* %.tmp8626
%.tmp8628 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %global.8615
%.tmp8629 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp8628, i32 0, i32 5
store %m2638$.GlobalName.type* null, %m2638$.GlobalName.type** %.tmp8629
%.tmp8630 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %global.8615
%.tmp8631 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp8630, i32 0, i32 3
%.tmp8632 = load i1, i1* %weak
store i1 %.tmp8632, i1* %.tmp8631
%.tmp8633 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8634 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %global.8615
call void(%m2638$.CompilerCtx.type*,%m2638$.GlobalName.type*) @m295$append_global.v.m2638$.CompilerCtx.typep.m2638$.GlobalName.typep(%m2638$.CompilerCtx.type* %.tmp8633, %m2638$.GlobalName.type* %.tmp8634)
ret void
}
define void @m295$define_module.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp.cp(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.mod.arg, i8* %.as_name.arg, i8* %.abspath.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%mod = alloca %m981$.Node.type*
store %m981$.Node.type* %.mod.arg, %m981$.Node.type** %mod
%as_name = alloca i8*
store i8* %.as_name.arg, i8** %as_name
%abspath = alloca i8*
store i8* %.abspath.arg, i8** %abspath
%.tmp8635 = load %m981$.Node.type*, %m981$.Node.type** %mod
%.tmp8636 = call %m2638$.AssignableInfo.type*(%m981$.Node.type*) @m295$new_assignable_info.m2638$.AssignableInfo.typep.m981$.Node.typep(%m981$.Node.type* %.tmp8635)
%info.8637 = alloca %m2638$.AssignableInfo.type*
store %m2638$.AssignableInfo.type* %.tmp8636, %m2638$.AssignableInfo.type** %info.8637
%.tmp8638 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.8637
%.tmp8639 = load i8, i8* @SCOPE_CONST
%.tmp8640 = load i8*, i8** %abspath
call void(%m2638$.AssignableInfo.type*,i8,i8*) @m295$set_assignable_id.v.m2638$.AssignableInfo.typep.c.cp(%m2638$.AssignableInfo.type* %.tmp8638, i8 %.tmp8639, i8* %.tmp8640)
%.tmp8641 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.8637
%.tmp8642 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8641, i32 0, i32 3
%.tmp8644 = getelementptr [7 x i8], [7 x i8]*@.str8643, i32 0, i32 0
store i8* %.tmp8644, i8** %.tmp8642
%.tmp8645 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.8637
%.tmp8646 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8645, i32 0, i32 4
store %m2638$.Type.type* null, %m2638$.Type.type** %.tmp8646
%.tmp8647 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8648 = load %m981$.Node.type*, %m981$.Node.type** %mod
%.tmp8649 = load i8*, i8** %as_name
%.tmp8650 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %info.8637
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*,%m2638$.AssignableInfo.type*) @m295$define_assignable.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp.m2638$.AssignableInfo.typep(%m2638$.CompilerCtx.type* %.tmp8647, %m981$.Node.type* %.tmp8648, i8* %.tmp8649, %m2638$.AssignableInfo.type* %.tmp8650)
ret void
}
define void @m295$append_anon_fn.v.m2638$.CompilerCtx.typep.cp(%m2638$.CompilerCtx.type* %.ctx.arg, i8* %.code.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%code = alloca i8*
store i8* %.code.arg, i8** %code
%.tmp8651 = getelementptr %m2638$.AnonFn.type, %m2638$.AnonFn.type* null, i32 1
%.tmp8652 = ptrtoint %m2638$.AnonFn.type* %.tmp8651 to i32
%.tmp8653 = call i8*(i32) @malloc(i32 %.tmp8652)
%.tmp8654 = bitcast i8* %.tmp8653 to %m2638$.AnonFn.type*
%fn.8655 = alloca %m2638$.AnonFn.type*
store %m2638$.AnonFn.type* %.tmp8654, %m2638$.AnonFn.type** %fn.8655
%.tmp8656 = load %m2638$.AnonFn.type*, %m2638$.AnonFn.type** %fn.8655
%.tmp8657 = getelementptr %m2638$.AnonFn.type, %m2638$.AnonFn.type* %.tmp8656, i32 0, i32 0
%.tmp8658 = load i8*, i8** %code
store i8* %.tmp8658, i8** %.tmp8657
%.tmp8659 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8660 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp8659, i32 0, i32 8
%.tmp8661 = load %m2638$.AnonFn.type*, %m2638$.AnonFn.type** %.tmp8660
%.tmp8662 = icmp eq %m2638$.AnonFn.type* %.tmp8661, null
br i1 %.tmp8662, label %.if.true.8663, label %.if.false.8663
.if.true.8663:
%.tmp8664 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8665 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp8664, i32 0, i32 8
%.tmp8666 = load %m2638$.AnonFn.type*, %m2638$.AnonFn.type** %fn.8655
store %m2638$.AnonFn.type* %.tmp8666, %m2638$.AnonFn.type** %.tmp8665
%.tmp8667 = load %m2638$.AnonFn.type*, %m2638$.AnonFn.type** %fn.8655
%.tmp8668 = getelementptr %m2638$.AnonFn.type, %m2638$.AnonFn.type* %.tmp8667, i32 0, i32 1
store %m2638$.AnonFn.type* null, %m2638$.AnonFn.type** %.tmp8668
br label %.if.end.8663
.if.false.8663:
%.tmp8669 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8670 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp8669, i32 0, i32 8
%.tmp8671 = load %m2638$.AnonFn.type*, %m2638$.AnonFn.type** %.tmp8670
%last.8672 = alloca %m2638$.AnonFn.type*
store %m2638$.AnonFn.type* %.tmp8671, %m2638$.AnonFn.type** %last.8672
br label %.for.start.8673
.for.start.8673:
%.tmp8674 = load %m2638$.AnonFn.type*, %m2638$.AnonFn.type** %last.8672
%.tmp8675 = getelementptr %m2638$.AnonFn.type, %m2638$.AnonFn.type* %.tmp8674, i32 0, i32 1
%.tmp8676 = load %m2638$.AnonFn.type*, %m2638$.AnonFn.type** %.tmp8675
%.tmp8677 = icmp ne %m2638$.AnonFn.type* %.tmp8676, null
br i1 %.tmp8677, label %.for.continue.8673, label %.for.end.8673
.for.continue.8673:
%.tmp8678 = load %m2638$.AnonFn.type*, %m2638$.AnonFn.type** %last.8672
%.tmp8679 = getelementptr %m2638$.AnonFn.type, %m2638$.AnonFn.type* %.tmp8678, i32 0, i32 1
%.tmp8680 = load %m2638$.AnonFn.type*, %m2638$.AnonFn.type** %.tmp8679
store %m2638$.AnonFn.type* %.tmp8680, %m2638$.AnonFn.type** %last.8672
br label %.for.start.8673
.for.end.8673:
%.tmp8681 = load %m2638$.AnonFn.type*, %m2638$.AnonFn.type** %last.8672
%.tmp8682 = getelementptr %m2638$.AnonFn.type, %m2638$.AnonFn.type* %.tmp8681, i32 0, i32 1
%.tmp8683 = load %m2638$.AnonFn.type*, %m2638$.AnonFn.type** %fn.8655
store %m2638$.AnonFn.type* %.tmp8683, %m2638$.AnonFn.type** %.tmp8682
br label %.if.end.8663
.if.end.8663:
ret void
}
define void @m295$compile_anon_fn.v.m2638$.CompilerCtx.typep(%m2638$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%.tmp8685 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8686 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp8685, i32 0, i32 8
%.tmp8687 = load %m2638$.AnonFn.type*, %m2638$.AnonFn.type** %.tmp8686
%fn.8688 = alloca %m2638$.AnonFn.type*
store %m2638$.AnonFn.type* %.tmp8687, %m2638$.AnonFn.type** %fn.8688
br label %.for.start.8684
.for.start.8684:
%.tmp8689 = load %m2638$.AnonFn.type*, %m2638$.AnonFn.type** %fn.8688
%.tmp8690 = icmp ne %m2638$.AnonFn.type* %.tmp8689, null
br i1 %.tmp8690, label %.for.continue.8684, label %.for.end.8684
.for.continue.8684:
%.tmp8691 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8692 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp8691, i32 0, i32 1
%.tmp8693 = load %m0$.File.type*, %m0$.File.type** %.tmp8692
%.tmp8695 = getelementptr [4 x i8], [4 x i8]*@.str8694, i32 0, i32 0
%.tmp8696 = load %m2638$.AnonFn.type*, %m2638$.AnonFn.type** %fn.8688
%.tmp8697 = getelementptr %m2638$.AnonFn.type, %m2638$.AnonFn.type* %.tmp8696, i32 0, i32 0
%.tmp8698 = load i8*, i8** %.tmp8697
%.tmp8699 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8693, i8* %.tmp8695, i8* %.tmp8698)
%.tmp8700 = load %m2638$.AnonFn.type*, %m2638$.AnonFn.type** %fn.8688
%.tmp8701 = getelementptr %m2638$.AnonFn.type, %m2638$.AnonFn.type* %.tmp8700, i32 0, i32 1
%.tmp8702 = load %m2638$.AnonFn.type*, %m2638$.AnonFn.type** %.tmp8701
store %m2638$.AnonFn.type* %.tmp8702, %m2638$.AnonFn.type** %fn.8688
br label %.for.start.8684
.for.end.8684:
%.tmp8703 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8704 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp8703, i32 0, i32 8
store %m2638$.AnonFn.type* null, %m2638$.AnonFn.type** %.tmp8704
ret void
}
define void @m295$append_global.v.m2638$.CompilerCtx.typep.m2638$.GlobalName.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%g = alloca %m2638$.GlobalName.type*
store %m2638$.GlobalName.type* %.g.arg, %m2638$.GlobalName.type** %g
%.tmp8705 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8706 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp8705, i32 0, i32 3
%.tmp8707 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %.tmp8706
%.tmp8708 = icmp eq %m2638$.GlobalName.type* %.tmp8707, null
br i1 %.tmp8708, label %.if.true.8709, label %.if.false.8709
.if.true.8709:
%.tmp8710 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8711 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp8710, i32 0, i32 3
%.tmp8712 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g
store %m2638$.GlobalName.type* %.tmp8712, %m2638$.GlobalName.type** %.tmp8711
ret void
br label %.if.end.8709
.if.false.8709:
br label %.if.end.8709
.if.end.8709:
%.tmp8713 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8714 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp8713, i32 0, i32 3
%.tmp8715 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %.tmp8714
%last_global.8716 = alloca %m2638$.GlobalName.type*
store %m2638$.GlobalName.type* %.tmp8715, %m2638$.GlobalName.type** %last_global.8716
%.tmp8718 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8719 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp8718, i32 0, i32 3
%.tmp8720 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %.tmp8719
%curr_global.8721 = alloca %m2638$.GlobalName.type*
store %m2638$.GlobalName.type* %.tmp8720, %m2638$.GlobalName.type** %curr_global.8721
br label %.for.start.8717
.for.start.8717:
%.tmp8722 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %curr_global.8721
%.tmp8723 = icmp ne %m2638$.GlobalName.type* %.tmp8722, null
br i1 %.tmp8723, label %.for.continue.8717, label %.for.end.8717
.for.continue.8717:
%.tmp8724 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %curr_global.8721
%.tmp8725 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp8724, i32 0, i32 4
%.tmp8726 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %.tmp8725
%.tmp8727 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8726, i32 0, i32 0
%.tmp8728 = load i8*, i8** %.tmp8727
%.tmp8729 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g
%.tmp8730 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp8729, i32 0, i32 4
%.tmp8731 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %.tmp8730
%.tmp8732 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp8731, i32 0, i32 0
%.tmp8733 = load i8*, i8** %.tmp8732
%.tmp8734 = call i32(i8*,i8*) @strcmp(i8* %.tmp8728, i8* %.tmp8733)
%.tmp8735 = icmp eq i32 %.tmp8734, 0
br i1 %.tmp8735, label %.if.true.8736, label %.if.false.8736
.if.true.8736:
ret void
br label %.if.end.8736
.if.false.8736:
br label %.if.end.8736
.if.end.8736:
%.tmp8737 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %curr_global.8721
store %m2638$.GlobalName.type* %.tmp8737, %m2638$.GlobalName.type** %last_global.8716
%.tmp8738 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %curr_global.8721
%.tmp8739 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp8738, i32 0, i32 5
%.tmp8740 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %.tmp8739
store %m2638$.GlobalName.type* %.tmp8740, %m2638$.GlobalName.type** %curr_global.8721
br label %.for.start.8717
.for.end.8717:
%.tmp8741 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %last_global.8716
%.tmp8742 = getelementptr %m2638$.GlobalName.type, %m2638$.GlobalName.type* %.tmp8741, i32 0, i32 5
%.tmp8743 = load %m2638$.GlobalName.type*, %m2638$.GlobalName.type** %g
store %m2638$.GlobalName.type* %.tmp8743, %m2638$.GlobalName.type** %.tmp8742
ret void
}
define void @m295$append_error.v.m2638$.CompilerCtx.typep.m296$.Error.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m296$.Error.type* %.e.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%e = alloca %m296$.Error.type*
store %m296$.Error.type* %.e.arg, %m296$.Error.type** %e
%.tmp8744 = getelementptr %m2638$.ErrorList.type, %m2638$.ErrorList.type* null, i32 1
%.tmp8745 = ptrtoint %m2638$.ErrorList.type* %.tmp8744 to i32
%.tmp8746 = call i8*(i32) @malloc(i32 %.tmp8745)
%.tmp8747 = bitcast i8* %.tmp8746 to %m2638$.ErrorList.type*
%new_err.8748 = alloca %m2638$.ErrorList.type*
store %m2638$.ErrorList.type* %.tmp8747, %m2638$.ErrorList.type** %new_err.8748
%.tmp8749 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %new_err.8748
%.tmp8750 = getelementptr %m2638$.ErrorList.type, %m2638$.ErrorList.type* %.tmp8749, i32 0, i32 2
store i1 0, i1* %.tmp8750
%.tmp8751 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %new_err.8748
%.tmp8752 = getelementptr %m2638$.ErrorList.type, %m2638$.ErrorList.type* %.tmp8751, i32 0, i32 0
%.tmp8753 = load %m296$.Error.type*, %m296$.Error.type** %e
store %m296$.Error.type* %.tmp8753, %m296$.Error.type** %.tmp8752
%.tmp8754 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %new_err.8748
%.tmp8755 = getelementptr %m2638$.ErrorList.type, %m2638$.ErrorList.type* %.tmp8754, i32 0, i32 1
store %m2638$.ErrorList.type* null, %m2638$.ErrorList.type** %.tmp8755
%.tmp8756 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8757 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp8756, i32 0, i32 2
%.tmp8758 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %.tmp8757
%.tmp8759 = icmp eq %m2638$.ErrorList.type* %.tmp8758, null
br i1 %.tmp8759, label %.if.true.8760, label %.if.false.8760
.if.true.8760:
%.tmp8761 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8762 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp8761, i32 0, i32 2
%.tmp8763 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %new_err.8748
store %m2638$.ErrorList.type* %.tmp8763, %m2638$.ErrorList.type** %.tmp8762
ret void
br label %.if.end.8760
.if.false.8760:
br label %.if.end.8760
.if.end.8760:
%last.8764 = alloca %m2638$.ErrorList.type*
store %m2638$.ErrorList.type* null, %m2638$.ErrorList.type** %last.8764
%.tmp8766 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8767 = getelementptr %m2638$.CompilerCtx.type, %m2638$.CompilerCtx.type* %.tmp8766, i32 0, i32 2
%.tmp8768 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %.tmp8767
store %m2638$.ErrorList.type* %.tmp8768, %m2638$.ErrorList.type** %last.8764
br label %.for.start.8765
.for.start.8765:
%.tmp8769 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %last.8764
%.tmp8770 = getelementptr %m2638$.ErrorList.type, %m2638$.ErrorList.type* %.tmp8769, i32 0, i32 1
%.tmp8771 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %.tmp8770
%.tmp8772 = icmp ne %m2638$.ErrorList.type* %.tmp8771, null
br i1 %.tmp8772, label %.for.continue.8765, label %.for.end.8765
.for.continue.8765:
%.tmp8773 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %last.8764
%.tmp8774 = getelementptr %m2638$.ErrorList.type, %m2638$.ErrorList.type* %.tmp8773, i32 0, i32 1
%.tmp8775 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %.tmp8774
store %m2638$.ErrorList.type* %.tmp8775, %m2638$.ErrorList.type** %last.8764
br label %.for.start.8765
.for.end.8765:
%.tmp8776 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %last.8764
%.tmp8777 = getelementptr %m2638$.ErrorList.type, %m2638$.ErrorList.type* %.tmp8776, i32 0, i32 1
%.tmp8778 = load %m2638$.ErrorList.type*, %m2638$.ErrorList.type** %new_err.8748
store %m2638$.ErrorList.type* %.tmp8778, %m2638$.ErrorList.type** %.tmp8777
ret void
}
define i8* @m295$syn_function_name.cp.m981$.Node.typep(%m981$.Node.type* %.stmt.arg) {
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%.tmp8779 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp8780 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8779, i32 0, i32 6
%.tmp8781 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8780
%.tmp8782 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8781, i32 0, i32 7
%.tmp8783 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8782
%.tmp8784 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8783, i32 0, i32 1
%.tmp8785 = load i8*, i8** %.tmp8784
ret i8* %.tmp8785
}
define %m981$.Node.type* @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m981$.Node.type*
store %m981$.Node.type* %.node.arg, %m981$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp8787 = load %m981$.Node.type*, %m981$.Node.type** %node
%n.8788 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp8787, %m981$.Node.type** %n.8788
br label %.for.start.8786
.for.start.8786:
%.tmp8789 = load %m981$.Node.type*, %m981$.Node.type** %n.8788
%.tmp8790 = icmp ne %m981$.Node.type* %.tmp8789, null
br i1 %.tmp8790, label %.for.continue.8786, label %.for.end.8786
.for.continue.8786:
%.tmp8791 = load %m981$.Node.type*, %m981$.Node.type** %n.8788
%.tmp8792 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8791, i32 0, i32 0
%.tmp8793 = load i8*, i8** %.tmp8792
%.tmp8794 = load i8*, i8** %type
%.tmp8795 = call i32(i8*,i8*) @strcmp(i8* %.tmp8793, i8* %.tmp8794)
%.tmp8796 = icmp eq i32 %.tmp8795, 0
br i1 %.tmp8796, label %.if.true.8797, label %.if.false.8797
.if.true.8797:
%.tmp8798 = load %m981$.Node.type*, %m981$.Node.type** %n.8788
ret %m981$.Node.type* %.tmp8798
br label %.if.end.8797
.if.false.8797:
br label %.if.end.8797
.if.end.8797:
%.tmp8799 = load %m981$.Node.type*, %m981$.Node.type** %n.8788
%.tmp8800 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8799, i32 0, i32 7
%.tmp8801 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8800
store %m981$.Node.type* %.tmp8801, %m981$.Node.type** %n.8788
br label %.for.start.8786
.for.end.8786:
%.tmp8802 = bitcast ptr null to %m981$.Node.type*
ret %m981$.Node.type* %.tmp8802
}
define %m2638$.Type.type* @m295$syn_function_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%.tmp8803 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
%function_type.8804 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp8803, %m2638$.Type.type** %function_type.8804
%.tmp8805 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8806 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp8807 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8806, i32 0, i32 6
%.tmp8808 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8807
%.tmp8809 = call %m2638$.Type.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$node_to_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp8805, %m981$.Node.type* %.tmp8808)
%return_value_type.8810 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp8809, %m2638$.Type.type** %return_value_type.8810
%.tmp8811 = load %m2638$.Type.type*, %m2638$.Type.type** %function_type.8804
%.tmp8812 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8811, i32 0, i32 0
%.tmp8814 = getelementptr [9 x i8], [9 x i8]*@.str8813, i32 0, i32 0
store i8* %.tmp8814, i8** %.tmp8812
%.tmp8815 = load %m2638$.Type.type*, %m2638$.Type.type** %function_type.8804
%.tmp8816 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8815, i32 0, i32 3
%.tmp8817 = load %m2638$.Type.type*, %m2638$.Type.type** %return_value_type.8810
store %m2638$.Type.type* %.tmp8817, %m2638$.Type.type** %.tmp8816
%.tmp8818 = load %m2638$.Type.type*, %m2638$.Type.type** %return_value_type.8810
%last_type.8819 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp8818, %m2638$.Type.type** %last_type.8819
%.tmp8820 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp8821 = call %m981$.Node.type*(%m981$.Node.type*) @m295$syn_function_params.m981$.Node.typep.m981$.Node.typep(%m981$.Node.type* %.tmp8820)
%params.8822 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp8821, %m981$.Node.type** %params.8822
%.tmp8824 = load %m981$.Node.type*, %m981$.Node.type** %params.8822
%param_ptr.8825 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp8824, %m981$.Node.type** %param_ptr.8825
br label %.for.start.8823
.for.start.8823:
%.tmp8826 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.8825
%.tmp8827 = icmp ne %m981$.Node.type* %.tmp8826, null
br i1 %.tmp8827, label %.for.continue.8823, label %.for.end.8823
.for.continue.8823:
%.tmp8828 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.8825
%.tmp8829 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8828, i32 0, i32 0
%.tmp8830 = load i8*, i8** %.tmp8829
%.tmp8832 = getelementptr [5 x i8], [5 x i8]*@.str8831, i32 0, i32 0
%.tmp8833 = call i32(i8*,i8*) @strcmp(i8* %.tmp8830, i8* %.tmp8832)
%.tmp8834 = icmp eq i32 %.tmp8833, 0
br i1 %.tmp8834, label %.if.true.8835, label %.if.false.8835
.if.true.8835:
%.tmp8836 = load %m2638$.Type.type*, %m2638$.Type.type** %last_type.8819
%.tmp8837 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8836, i32 0, i32 4
%.tmp8838 = load %m2638$.Type.type*, %m2638$.Type.type** %last_type.8819
%.tmp8839 = call %m2638$.Type.type*(%m2638$.Type.type*) @m295$type_clone.m2638$.Type.typep.m2638$.Type.typep(%m2638$.Type.type* %.tmp8838)
store %m2638$.Type.type* %.tmp8839, %m2638$.Type.type** %.tmp8837
%.tmp8840 = load %m2638$.Type.type*, %m2638$.Type.type** %last_type.8819
%.tmp8841 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8840, i32 0, i32 4
%.tmp8842 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8841
%.tmp8843 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8842, i32 0, i32 4
store %m2638$.Type.type* null, %m2638$.Type.type** %.tmp8843
%.tmp8844 = load %m2638$.Type.type*, %m2638$.Type.type** %last_type.8819
%.tmp8845 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8844, i32 0, i32 4
%.tmp8846 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8845
store %m2638$.Type.type* %.tmp8846, %m2638$.Type.type** %last_type.8819
%.tmp8847 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.8825
%.tmp8848 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8847, i32 0, i32 7
%.tmp8849 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8848
%.tmp8850 = icmp ne %m981$.Node.type* %.tmp8849, null
br i1 %.tmp8850, label %.if.true.8851, label %.if.false.8851
.if.true.8851:
%.tmp8852 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.8825
%.tmp8853 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8852, i32 0, i32 7
%.tmp8854 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8853
store %m981$.Node.type* %.tmp8854, %m981$.Node.type** %param_ptr.8825
br label %.if.end.8851
.if.false.8851:
br label %.if.end.8851
.if.end.8851:
%.tmp8855 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.8825
%.tmp8856 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8855, i32 0, i32 7
%.tmp8857 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8856
%.tmp8858 = icmp ne %m981$.Node.type* %.tmp8857, null
br i1 %.tmp8858, label %.if.true.8859, label %.if.false.8859
.if.true.8859:
%.tmp8860 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.8825
%.tmp8861 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8860, i32 0, i32 7
%.tmp8862 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8861
store %m981$.Node.type* %.tmp8862, %m981$.Node.type** %param_ptr.8825
br label %.if.end.8859
.if.false.8859:
store %m981$.Node.type* null, %m981$.Node.type** %param_ptr.8825
br label %.if.end.8859
.if.end.8859:
br label %.if.end.8835
.if.false.8835:
%.tmp8863 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8864 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.8825
%.tmp8865 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8864, i32 0, i32 6
%.tmp8866 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8865
%.tmp8867 = call %m2638$.Type.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$node_to_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp8863, %m981$.Node.type* %.tmp8866)
%param_type.8868 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp8867, %m2638$.Type.type** %param_type.8868
%.tmp8869 = load %m2638$.Type.type*, %m2638$.Type.type** %last_type.8819
%.tmp8870 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8869, i32 0, i32 4
%.tmp8871 = load %m2638$.Type.type*, %m2638$.Type.type** %param_type.8868
store %m2638$.Type.type* %.tmp8871, %m2638$.Type.type** %.tmp8870
%.tmp8872 = load %m2638$.Type.type*, %m2638$.Type.type** %param_type.8868
store %m2638$.Type.type* %.tmp8872, %m2638$.Type.type** %last_type.8819
%.tmp8873 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.8825
%.tmp8874 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8873, i32 0, i32 7
%.tmp8875 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8874
store %m981$.Node.type* %.tmp8875, %m981$.Node.type** %param_ptr.8825
%.tmp8876 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.8825
%.tmp8877 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8876, i32 0, i32 7
%.tmp8878 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8877
%.tmp8879 = icmp ne %m981$.Node.type* %.tmp8878, null
br i1 %.tmp8879, label %.if.true.8880, label %.if.false.8880
.if.true.8880:
%.tmp8881 = load %m981$.Node.type*, %m981$.Node.type** %param_ptr.8825
%.tmp8882 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8881, i32 0, i32 7
%.tmp8883 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8882
%.tmp8884 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8883, i32 0, i32 7
%.tmp8885 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8884
store %m981$.Node.type* %.tmp8885, %m981$.Node.type** %param_ptr.8825
br label %.if.end.8880
.if.false.8880:
store %m981$.Node.type* null, %m981$.Node.type** %param_ptr.8825
br label %.if.end.8880
.if.end.8880:
br label %.if.end.8835
.if.end.8835:
br label %.for.start.8823
.for.end.8823:
%.tmp8886 = load %m2638$.Type.type*, %m2638$.Type.type** %function_type.8804
ret %m2638$.Type.type* %.tmp8886
}
define %m981$.Node.type* @m295$syn_function_params.m981$.Node.typep.m981$.Node.typep(%m981$.Node.type* %.stmt.arg) {
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%.tmp8887 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp8889 = getelementptr [10 x i8], [10 x i8]*@.str8888, i32 0, i32 0
%.tmp8890 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp8887, i8* %.tmp8889)
%params.8891 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp8890, %m981$.Node.type** %params.8891
%.tmp8892 = load %m981$.Node.type*, %m981$.Node.type** %params.8891
%.tmp8893 = icmp eq %m981$.Node.type* %.tmp8892, null
br i1 %.tmp8893, label %.if.true.8894, label %.if.false.8894
.if.true.8894:
%.tmp8895 = bitcast ptr null to %m981$.Node.type*
ret %m981$.Node.type* %.tmp8895
br label %.if.end.8894
.if.false.8894:
br label %.if.end.8894
.if.end.8894:
%.tmp8896 = load %m981$.Node.type*, %m981$.Node.type** %params.8891
%.tmp8897 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8896, i32 0, i32 6
%.tmp8898 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8897
ret %m981$.Node.type* %.tmp8898
}
define %m2638$.Type.type* @m295$node_to_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.ctx.arg, %m981$.Node.type* %.stmt.arg) {
%ctx = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.ctx.arg, %m2638$.CompilerCtx.type** %ctx
%stmt = alloca %m981$.Node.type*
store %m981$.Node.type* %.stmt.arg, %m981$.Node.type** %stmt
%.tmp8899 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp8900 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8899, i32 0, i32 0
%.tmp8901 = load i8*, i8** %.tmp8900
%.tmp8903 = getelementptr [11 x i8], [11 x i8]*@.str8902, i32 0, i32 0
%.tmp8904 = call i32(i8*,i8*) @strcmp(i8* %.tmp8901, i8* %.tmp8903)
%.tmp8905 = icmp eq i32 %.tmp8904, 0
br i1 %.tmp8905, label %.if.true.8906, label %.if.false.8906
.if.true.8906:
%.tmp8907 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8908 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp8909 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8908, i32 0, i32 6
%.tmp8910 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8909
%.tmp8911 = call %m2638$.Type.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$node_to_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp8907, %m981$.Node.type* %.tmp8910)
%t.8912 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp8911, %m2638$.Type.type** %t.8912
%.tmp8913 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp8914 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8913, i32 0, i32 7
%.tmp8915 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8914
%.tmp8916 = icmp ne %m981$.Node.type* %.tmp8915, null
br i1 %.tmp8916, label %.if.true.8917, label %.if.false.8917
.if.true.8917:
%.tmp8918 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp8919 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8918, i32 0, i32 7
%.tmp8920 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8919
%.tmp8921 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8920, i32 0, i32 0
%.tmp8922 = load i8*, i8** %.tmp8921
%.tmp8924 = getelementptr [13 x i8], [13 x i8]*@.str8923, i32 0, i32 0
%.tmp8925 = call i32(i8*,i8*) @strcmp(i8* %.tmp8922, i8* %.tmp8924)
%.tmp8926 = icmp eq i32 %.tmp8925, 0
br i1 %.tmp8926, label %.if.true.8927, label %.if.false.8927
.if.true.8927:
%.tmp8928 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
%fn_type.8929 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp8928, %m2638$.Type.type** %fn_type.8929
%.tmp8930 = load %m2638$.Type.type*, %m2638$.Type.type** %fn_type.8929
%.tmp8931 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8930, i32 0, i32 0
%.tmp8933 = getelementptr [9 x i8], [9 x i8]*@.str8932, i32 0, i32 0
store i8* %.tmp8933, i8** %.tmp8931
%.tmp8934 = load %m2638$.Type.type*, %m2638$.Type.type** %fn_type.8929
%.tmp8935 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8934, i32 0, i32 3
%.tmp8936 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8912
store %m2638$.Type.type* %.tmp8936, %m2638$.Type.type** %.tmp8935
%.tmp8937 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp8938 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8937, i32 0, i32 7
%.tmp8939 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8938
%.tmp8940 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8939, i32 0, i32 6
%.tmp8941 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8940
%.tmp8942 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8941, i32 0, i32 7
%.tmp8943 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8942
%fst_operator.8944 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp8943, %m981$.Node.type** %fst_operator.8944
%.tmp8945 = load %m981$.Node.type*, %m981$.Node.type** %fst_operator.8944
%.tmp8946 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8945, i32 0, i32 0
%.tmp8947 = load i8*, i8** %.tmp8946
%.tmp8949 = getelementptr [15 x i8], [15 x i8]*@.str8948, i32 0, i32 0
%.tmp8950 = call i32(i8*,i8*) @strcmp(i8* %.tmp8947, i8* %.tmp8949)
%.tmp8951 = icmp eq i32 %.tmp8950, 0
br i1 %.tmp8951, label %.if.true.8952, label %.if.false.8952
.if.true.8952:
%.tmp8953 = load %m2638$.Type.type*, %m2638$.Type.type** %fn_type.8929
%.tmp8954 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8953, i32 0, i32 3
%.tmp8955 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8954
%last_fn_value.8956 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp8955, %m2638$.Type.type** %last_fn_value.8956
%.tmp8958 = load %m981$.Node.type*, %m981$.Node.type** %fst_operator.8944
%.tmp8959 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8958, i32 0, i32 6
%.tmp8960 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8959
%t.8961 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp8960, %m981$.Node.type** %t.8961
br label %.for.start.8957
.for.start.8957:
%.tmp8962 = load %m981$.Node.type*, %m981$.Node.type** %t.8961
%.tmp8963 = icmp ne %m981$.Node.type* %.tmp8962, null
br i1 %.tmp8963, label %.for.continue.8957, label %.for.end.8957
.for.continue.8957:
%.tmp8964 = load %m2638$.Type.type*, %m2638$.Type.type** %last_fn_value.8956
%.tmp8965 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8964, i32 0, i32 4
%.tmp8966 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp8967 = load %m981$.Node.type*, %m981$.Node.type** %t.8961
%.tmp8968 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8967, i32 0, i32 6
%.tmp8969 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8968
%.tmp8970 = call %m2638$.Type.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$node_to_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp8966, %m981$.Node.type* %.tmp8969)
store %m2638$.Type.type* %.tmp8970, %m2638$.Type.type** %.tmp8965
%.tmp8971 = load %m2638$.Type.type*, %m2638$.Type.type** %last_fn_value.8956
%.tmp8972 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8971, i32 0, i32 4
%.tmp8973 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp8972
store %m2638$.Type.type* %.tmp8973, %m2638$.Type.type** %last_fn_value.8956
%.tmp8974 = load %m981$.Node.type*, %m981$.Node.type** %t.8961
%.tmp8975 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8974, i32 0, i32 7
%.tmp8976 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8975
%.tmp8977 = icmp ne %m981$.Node.type* %.tmp8976, null
br i1 %.tmp8977, label %.if.true.8978, label %.if.false.8978
.if.true.8978:
%.tmp8979 = load %m981$.Node.type*, %m981$.Node.type** %t.8961
%.tmp8980 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8979, i32 0, i32 7
%.tmp8981 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8980
store %m981$.Node.type* %.tmp8981, %m981$.Node.type** %t.8961
br label %.if.end.8978
.if.false.8978:
br label %.if.end.8978
.if.end.8978:
%.tmp8982 = load %m981$.Node.type*, %m981$.Node.type** %t.8961
%.tmp8983 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8982, i32 0, i32 7
%.tmp8984 = load %m981$.Node.type*, %m981$.Node.type** %.tmp8983
store %m981$.Node.type* %.tmp8984, %m981$.Node.type** %t.8961
br label %.for.start.8957
.for.end.8957:
br label %.if.end.8952
.if.false.8952:
br label %.if.end.8952
.if.end.8952:
%.tmp8985 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
%t_ptr.8986 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp8985, %m2638$.Type.type** %t_ptr.8986
%.tmp8987 = load %m2638$.Type.type*, %m2638$.Type.type** %t_ptr.8986
%.tmp8988 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8987, i32 0, i32 0
%.tmp8990 = getelementptr [4 x i8], [4 x i8]*@.str8989, i32 0, i32 0
store i8* %.tmp8990, i8** %.tmp8988
%.tmp8991 = load %m2638$.Type.type*, %m2638$.Type.type** %t_ptr.8986
%.tmp8992 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp8991, i32 0, i32 3
%.tmp8993 = load %m2638$.Type.type*, %m2638$.Type.type** %fn_type.8929
store %m2638$.Type.type* %.tmp8993, %m2638$.Type.type** %.tmp8992
%.tmp8994 = load %m2638$.Type.type*, %m2638$.Type.type** %t_ptr.8986
store %m2638$.Type.type* %.tmp8994, %m2638$.Type.type** %t.8912
br label %.if.end.8927
.if.false.8927:
br label %.if.end.8927
.if.end.8927:
br label %.if.end.8917
.if.false.8917:
br label %.if.end.8917
.if.end.8917:
%.tmp8995 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8912
ret %m2638$.Type.type* %.tmp8995
br label %.if.end.8906
.if.false.8906:
br label %.if.end.8906
.if.end.8906:
%.tmp8996 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
%t.8997 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp8996, %m2638$.Type.type** %t.8997
%.tmp8998 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp8999 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp8998, i32 0, i32 0
%.tmp9000 = load i8*, i8** %.tmp8999
%.tmp9002 = getelementptr [10 x i8], [10 x i8]*@.str9001, i32 0, i32 0
%.tmp9003 = call i32(i8*,i8*) @strcmp(i8* %.tmp9000, i8* %.tmp9002)
%.tmp9004 = icmp eq i32 %.tmp9003, 0
br i1 %.tmp9004, label %.if.true.9005, label %.if.false.9005
.if.true.9005:
%.tmp9006 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
%.tmp9007 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9006, i32 0, i32 0
%.tmp9009 = getelementptr [7 x i8], [7 x i8]*@.str9008, i32 0, i32 0
store i8* %.tmp9009, i8** %.tmp9007
%.tmp9010 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
%.tmp9011 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9010, i32 0, i32 1
store i8* null, i8** %.tmp9011
%.tmp9012 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp9013 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9012, i32 0, i32 6
%.tmp9014 = load %m981$.Node.type*, %m981$.Node.type** %.tmp9013
%.tmp9016 = getelementptr [5 x i8], [5 x i8]*@.str9015, i32 0, i32 0
%.tmp9017 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp9014, i8* %.tmp9016)
%curr_type.9018 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp9017, %m981$.Node.type** %curr_type.9018
%.tmp9019 = load %m981$.Node.type*, %m981$.Node.type** %curr_type.9018
%.tmp9020 = icmp ne %m981$.Node.type* %.tmp9019, null
br i1 %.tmp9020, label %.if.true.9021, label %.if.false.9021
.if.true.9021:
%.tmp9022 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
%.tmp9023 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9022, i32 0, i32 3
%.tmp9024 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp9025 = load %m981$.Node.type*, %m981$.Node.type** %curr_type.9018
%.tmp9026 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9025, i32 0, i32 6
%.tmp9027 = load %m981$.Node.type*, %m981$.Node.type** %.tmp9026
%.tmp9028 = call %m2638$.Type.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$node_to_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp9024, %m981$.Node.type* %.tmp9027)
store %m2638$.Type.type* %.tmp9028, %m2638$.Type.type** %.tmp9023
%.tmp9029 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
%.tmp9030 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9029, i32 0, i32 3
%.tmp9031 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp9030
%.tmp9032 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9031, i32 0, i32 1
%.tmp9033 = load %m981$.Node.type*, %m981$.Node.type** %curr_type.9018
%.tmp9034 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9033, i32 0, i32 7
%.tmp9035 = load %m981$.Node.type*, %m981$.Node.type** %.tmp9034
%.tmp9036 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9035, i32 0, i32 1
%.tmp9037 = load i8*, i8** %.tmp9036
store i8* %.tmp9037, i8** %.tmp9032
%.tmp9038 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
%.tmp9039 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9038, i32 0, i32 3
%.tmp9040 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp9039
%curr_t.9041 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp9040, %m2638$.Type.type** %curr_t.9041
%.tmp9043 = load %m981$.Node.type*, %m981$.Node.type** %curr_type.9018
%.tmp9044 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9043, i32 0, i32 7
%.tmp9045 = load %m981$.Node.type*, %m981$.Node.type** %.tmp9044
%.tmp9047 = getelementptr [5 x i8], [5 x i8]*@.str9046, i32 0, i32 0
%.tmp9048 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp9045, i8* %.tmp9047)
store %m981$.Node.type* %.tmp9048, %m981$.Node.type** %curr_type.9018
br label %.for.start.9042
.for.start.9042:
%.tmp9049 = load %m981$.Node.type*, %m981$.Node.type** %curr_type.9018
%.tmp9050 = icmp ne %m981$.Node.type* %.tmp9049, null
br i1 %.tmp9050, label %.for.continue.9042, label %.for.end.9042
.for.continue.9042:
%.tmp9051 = load %m2638$.Type.type*, %m2638$.Type.type** %curr_t.9041
%.tmp9052 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9051, i32 0, i32 4
%.tmp9053 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp9054 = load %m981$.Node.type*, %m981$.Node.type** %curr_type.9018
%.tmp9055 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9054, i32 0, i32 6
%.tmp9056 = load %m981$.Node.type*, %m981$.Node.type** %.tmp9055
%.tmp9057 = call %m2638$.Type.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$node_to_type.m2638$.Type.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp9053, %m981$.Node.type* %.tmp9056)
store %m2638$.Type.type* %.tmp9057, %m2638$.Type.type** %.tmp9052
%.tmp9058 = load %m2638$.Type.type*, %m2638$.Type.type** %curr_t.9041
%.tmp9059 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9058, i32 0, i32 4
%.tmp9060 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp9059
%.tmp9061 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9060, i32 0, i32 1
%.tmp9062 = load %m981$.Node.type*, %m981$.Node.type** %curr_type.9018
%.tmp9063 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9062, i32 0, i32 7
%.tmp9064 = load %m981$.Node.type*, %m981$.Node.type** %.tmp9063
%.tmp9065 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9064, i32 0, i32 1
%.tmp9066 = load i8*, i8** %.tmp9065
store i8* %.tmp9066, i8** %.tmp9061
%.tmp9067 = load %m2638$.Type.type*, %m2638$.Type.type** %curr_t.9041
%.tmp9068 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9067, i32 0, i32 4
%.tmp9069 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp9068
store %m2638$.Type.type* %.tmp9069, %m2638$.Type.type** %curr_t.9041
%.tmp9070 = load %m981$.Node.type*, %m981$.Node.type** %curr_type.9018
%.tmp9071 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9070, i32 0, i32 7
%.tmp9072 = load %m981$.Node.type*, %m981$.Node.type** %.tmp9071
%.tmp9074 = getelementptr [5 x i8], [5 x i8]*@.str9073, i32 0, i32 0
%.tmp9075 = call %m981$.Node.type*(%m981$.Node.type*,i8*) @m295$skip_to_type.m981$.Node.typep.m981$.Node.typep.cp(%m981$.Node.type* %.tmp9072, i8* %.tmp9074)
store %m981$.Node.type* %.tmp9075, %m981$.Node.type** %curr_type.9018
br label %.for.start.9042
.for.end.9042:
br label %.if.end.9021
.if.false.9021:
br label %.if.end.9021
.if.end.9021:
br label %.if.end.9005
.if.false.9005:
%.tmp9076 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp9077 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9076, i32 0, i32 0
%.tmp9078 = load i8*, i8** %.tmp9077
%.tmp9080 = getelementptr [12 x i8], [12 x i8]*@.str9079, i32 0, i32 0
%.tmp9081 = call i32(i8*,i8*) @strcmp(i8* %.tmp9078, i8* %.tmp9080)
%.tmp9082 = icmp eq i32 %.tmp9081, 0
br i1 %.tmp9082, label %.if.true.9083, label %.if.false.9083
.if.true.9083:
%err_msg.9084 = alloca i8*
store i8* null, i8** %err_msg.9084
%.tmp9085 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp9086 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp9087 = call %m2638$.ScopeItem.type*(%m2638$.CompilerCtx.type*,%m981$.Node.type*) @m295$find_defined.m2638$.ScopeItem.typep.m2638$.CompilerCtx.typep.m981$.Node.typep(%m2638$.CompilerCtx.type* %.tmp9085, %m981$.Node.type* %.tmp9086)
%base.9088 = alloca %m2638$.ScopeItem.type*
store %m2638$.ScopeItem.type* %.tmp9087, %m2638$.ScopeItem.type** %base.9088
%.tmp9089 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %base.9088
%.tmp9090 = icmp eq %m2638$.ScopeItem.type* %.tmp9089, null
br i1 %.tmp9090, label %.if.true.9091, label %.if.false.9091
.if.true.9091:
%.tmp9092 = getelementptr i8*, i8** %err_msg.9084, i32 0
%.tmp9094 = getelementptr [37 x i8], [37 x i8]*@.str9093, i32 0, i32 0
%.tmp9095 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp9096 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9095, i32 0, i32 6
%.tmp9097 = load %m981$.Node.type*, %m981$.Node.type** %.tmp9096
%.tmp9098 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9097, i32 0, i32 1
%.tmp9099 = load i8*, i8** %.tmp9098
%.tmp9100 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9092, i8* %.tmp9094, i8* %.tmp9099)
%.tmp9101 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp9102 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp9103 = load i8*, i8** %err_msg.9084
call void(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$new_error.v.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp9101, %m981$.Node.type* %.tmp9102, i8* %.tmp9103)
%.tmp9104 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
%.tmp9105 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9104, i32 0, i32 0
%.tmp9107 = getelementptr [6 x i8], [6 x i8]*@.str9106, i32 0, i32 0
store i8* %.tmp9107, i8** %.tmp9105
%.tmp9108 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
ret %m2638$.Type.type* %.tmp9108
br label %.if.end.9091
.if.false.9091:
br label %.if.end.9091
.if.end.9091:
%.tmp9109 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
%.tmp9110 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9109, i32 0, i32 0
%.tmp9112 = getelementptr [10 x i8], [10 x i8]*@.str9111, i32 0, i32 0
store i8* %.tmp9112, i8** %.tmp9110
%.tmp9113 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
%.tmp9114 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9113, i32 0, i32 1
%.tmp9115 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %base.9088
%.tmp9116 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp9115, i32 0, i32 0
%.tmp9117 = load i8*, i8** %.tmp9116
store i8* %.tmp9117, i8** %.tmp9114
%.tmp9118 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
%.tmp9119 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9118, i32 0, i32 2
%.tmp9120 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %base.9088
%.tmp9121 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp9120, i32 0, i32 1
%.tmp9122 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %.tmp9121
%.tmp9123 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp9122, i32 0, i32 0
%.tmp9124 = load i8*, i8** %.tmp9123
store i8* %.tmp9124, i8** %.tmp9119
%.tmp9125 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
%.tmp9126 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9125, i32 0, i32 3
%.tmp9127 = load %m2638$.ScopeItem.type*, %m2638$.ScopeItem.type** %base.9088
%.tmp9128 = getelementptr %m2638$.ScopeItem.type, %m2638$.ScopeItem.type* %.tmp9127, i32 0, i32 1
%.tmp9129 = load %m2638$.AssignableInfo.type*, %m2638$.AssignableInfo.type** %.tmp9128
%.tmp9130 = getelementptr %m2638$.AssignableInfo.type, %m2638$.AssignableInfo.type* %.tmp9129, i32 0, i32 4
%.tmp9131 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp9130
store %m2638$.Type.type* %.tmp9131, %m2638$.Type.type** %.tmp9126
br label %.if.end.9083
.if.false.9083:
%.tmp9132 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp9133 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9132, i32 0, i32 1
%.tmp9134 = load i8*, i8** %.tmp9133
%.tmp9136 = getelementptr [4 x i8], [4 x i8]*@.str9135, i32 0, i32 0
%.tmp9137 = call i32(i8*,i8*) @strcmp(i8* %.tmp9134, i8* %.tmp9136)
%.tmp9138 = icmp eq i32 %.tmp9137, 0
br i1 %.tmp9138, label %.if.true.9139, label %.if.false.9139
.if.true.9139:
%.tmp9140 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
%.tmp9141 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9140, i32 0, i32 0
%.tmp9143 = getelementptr [4 x i8], [4 x i8]*@.str9142, i32 0, i32 0
store i8* %.tmp9143, i8** %.tmp9141
%.tmp9144 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
%.tmp9145 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9144, i32 0, i32 3
%.tmp9146 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
store %m2638$.Type.type* %.tmp9146, %m2638$.Type.type** %.tmp9145
%.tmp9147 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
%.tmp9148 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9147, i32 0, i32 3
%.tmp9149 = load %m2638$.Type.type*, %m2638$.Type.type** %.tmp9148
%.tmp9150 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9149, i32 0, i32 0
%.tmp9152 = getelementptr [4 x i8], [4 x i8]*@.str9151, i32 0, i32 0
store i8* %.tmp9152, i8** %.tmp9150
br label %.if.end.9139
.if.false.9139:
%.tmp9153 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp9154 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9153, i32 0, i32 0
%.tmp9155 = load i8*, i8** %.tmp9154
%.tmp9157 = getelementptr [5 x i8], [5 x i8]*@.str9156, i32 0, i32 0
%.tmp9158 = call i32(i8*,i8*) @strcmp(i8* %.tmp9155, i8* %.tmp9157)
%.tmp9159 = icmp eq i32 %.tmp9158, 0
br i1 %.tmp9159, label %.if.true.9160, label %.if.false.9160
.if.true.9160:
%.tmp9161 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
%.tmp9162 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9161, i32 0, i32 0
%.tmp9163 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp9164 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9163, i32 0, i32 1
%.tmp9165 = load i8*, i8** %.tmp9164
store i8* %.tmp9165, i8** %.tmp9162
br label %.if.end.9160
.if.false.9160:
%.tmp9166 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp9167 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9166, i32 0, i32 1
%.tmp9168 = load i8*, i8** %.tmp9167
%.tmp9170 = getelementptr [4 x i8], [4 x i8]*@.str9169, i32 0, i32 0
%.tmp9171 = call i32(i8*,i8*) @strcmp(i8* %.tmp9168, i8* %.tmp9170)
%.tmp9172 = icmp eq i32 %.tmp9171, 0
br i1 %.tmp9172, label %.if.true.9173, label %.if.false.9173
.if.true.9173:
%.tmp9174 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
%.tmp9175 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9174, i32 0, i32 0
%.tmp9177 = getelementptr [7 x i8], [7 x i8]*@.str9176, i32 0, i32 0
store i8* %.tmp9177, i8** %.tmp9175
br label %.if.end.9173
.if.false.9173:
%.tmp9178 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp9179 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp9181 = getelementptr [54 x i8], [54 x i8]*@.str9180, i32 0, i32 0
%.tmp9182 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$err_tmpl.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp9178, %m981$.Node.type* %.tmp9179, i8* %.tmp9181)
%.tmp9183 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp9184 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9183, i32 0, i32 0
%.tmp9185 = load i8*, i8** %.tmp9184
%.tmp9186 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp9187 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9186, i32 0, i32 1
%.tmp9188 = load i8*, i8** %.tmp9187
%.tmp9189 = call i32(i8*,...) @printf(i8* %.tmp9182, i8* %.tmp9185, i8* %.tmp9188)
%.tmp9190 = bitcast ptr null to %m2638$.Type.type*
ret %m2638$.Type.type* %.tmp9190
br label %.if.end.9173
.if.end.9173:
br label %.if.end.9160
.if.end.9160:
br label %.if.end.9139
.if.end.9139:
br label %.if.end.9083
.if.end.9083:
br label %.if.end.9005
.if.end.9005:
%.tmp9192 = load %m981$.Node.type*, %m981$.Node.type** %stmt
%.tmp9193 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9192, i32 0, i32 7
%.tmp9194 = load %m981$.Node.type*, %m981$.Node.type** %.tmp9193
%ptr.9195 = alloca %m981$.Node.type*
store %m981$.Node.type* %.tmp9194, %m981$.Node.type** %ptr.9195
br label %.for.start.9191
.for.start.9191:
%.tmp9196 = load %m981$.Node.type*, %m981$.Node.type** %ptr.9195
%.tmp9197 = icmp ne %m981$.Node.type* %.tmp9196, null
br i1 %.tmp9197, label %.for.continue.9191, label %.for.end.9191
.for.continue.9191:
%.tmp9198 = load %m981$.Node.type*, %m981$.Node.type** %ptr.9195
%.tmp9199 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9198, i32 0, i32 1
%.tmp9200 = load i8*, i8** %.tmp9199
%.tmp9202 = getelementptr [2 x i8], [2 x i8]*@.str9201, i32 0, i32 0
%.tmp9203 = call i32(i8*,i8*) @strcmp(i8* %.tmp9200, i8* %.tmp9202)
%.tmp9204 = icmp eq i32 %.tmp9203, 0
br i1 %.tmp9204, label %.if.true.9205, label %.if.false.9205
.if.true.9205:
%.tmp9206 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
%pt.9207 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp9206, %m2638$.Type.type** %pt.9207
%.tmp9208 = load %m2638$.Type.type*, %m2638$.Type.type** %pt.9207
%.tmp9209 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9208, i32 0, i32 0
%.tmp9211 = getelementptr [4 x i8], [4 x i8]*@.str9210, i32 0, i32 0
store i8* %.tmp9211, i8** %.tmp9209
%.tmp9212 = load %m2638$.Type.type*, %m2638$.Type.type** %pt.9207
%.tmp9213 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9212, i32 0, i32 3
%.tmp9214 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
store %m2638$.Type.type* %.tmp9214, %m2638$.Type.type** %.tmp9213
%.tmp9215 = load %m2638$.Type.type*, %m2638$.Type.type** %pt.9207
store %m2638$.Type.type* %.tmp9215, %m2638$.Type.type** %t.8997
br label %.if.end.9205
.if.false.9205:
%.tmp9216 = load %m981$.Node.type*, %m981$.Node.type** %ptr.9195
%.tmp9217 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9216, i32 0, i32 1
%.tmp9218 = load i8*, i8** %.tmp9217
%.tmp9220 = getelementptr [2 x i8], [2 x i8]*@.str9219, i32 0, i32 0
%.tmp9221 = call i32(i8*,i8*) @strcmp(i8* %.tmp9218, i8* %.tmp9220)
%.tmp9222 = icmp eq i32 %.tmp9221, 0
br i1 %.tmp9222, label %.if.true.9223, label %.if.false.9223
.if.true.9223:
%.tmp9224 = load %m981$.Node.type*, %m981$.Node.type** %ptr.9195
%.tmp9225 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9224, i32 0, i32 7
%.tmp9226 = load %m981$.Node.type*, %m981$.Node.type** %.tmp9225
%.tmp9227 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9226, i32 0, i32 1
%.tmp9228 = load i8*, i8** %.tmp9227
%.tmp9230 = getelementptr [2 x i8], [2 x i8]*@.str9229, i32 0, i32 0
%.tmp9231 = call i32(i8*,i8*) @strcmp(i8* %.tmp9228, i8* %.tmp9230)
%.tmp9232 = icmp eq i32 %.tmp9231, 0
br i1 %.tmp9232, label %.if.true.9233, label %.if.false.9233
.if.true.9233:
%.tmp9234 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
%slice_type.9235 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp9234, %m2638$.Type.type** %slice_type.9235
%.tmp9236 = load %m2638$.Type.type*, %m2638$.Type.type** %slice_type.9235
%.tmp9237 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9236, i32 0, i32 0
%.tmp9239 = getelementptr [7 x i8], [7 x i8]*@.str9238, i32 0, i32 0
store i8* %.tmp9239, i8** %.tmp9237
%.tmp9240 = load %m2638$.Type.type*, %m2638$.Type.type** %slice_type.9235
%.tmp9241 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9240, i32 0, i32 1
%.tmp9243 = getelementptr [6 x i8], [6 x i8]*@.str9242, i32 0, i32 0
store i8* %.tmp9243, i8** %.tmp9241
%.tmp9244 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
%slice_c_array.9245 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp9244, %m2638$.Type.type** %slice_c_array.9245
%.tmp9246 = load %m2638$.Type.type*, %m2638$.Type.type** %slice_c_array.9245
%.tmp9247 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9246, i32 0, i32 0
%.tmp9249 = getelementptr [4 x i8], [4 x i8]*@.str9248, i32 0, i32 0
store i8* %.tmp9249, i8** %.tmp9247
%.tmp9250 = load %m2638$.Type.type*, %m2638$.Type.type** %slice_c_array.9245
%.tmp9251 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9250, i32 0, i32 1
%.tmp9253 = getelementptr [6 x i8], [6 x i8]*@.str9252, i32 0, i32 0
store i8* %.tmp9253, i8** %.tmp9251
%.tmp9254 = load %m2638$.Type.type*, %m2638$.Type.type** %slice_c_array.9245
%.tmp9255 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9254, i32 0, i32 3
%.tmp9256 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
store %m2638$.Type.type* %.tmp9256, %m2638$.Type.type** %.tmp9255
%.tmp9257 = load %m2638$.Type.type*, %m2638$.Type.type** %slice_type.9235
%.tmp9258 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9257, i32 0, i32 3
%.tmp9259 = load %m2638$.Type.type*, %m2638$.Type.type** %slice_c_array.9245
store %m2638$.Type.type* %.tmp9259, %m2638$.Type.type** %.tmp9258
%.tmp9260 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
%slice_len.9261 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp9260, %m2638$.Type.type** %slice_len.9261
%.tmp9262 = load %m2638$.Type.type*, %m2638$.Type.type** %slice_len.9261
%.tmp9263 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9262, i32 0, i32 0
%.tmp9265 = getelementptr [4 x i8], [4 x i8]*@.str9264, i32 0, i32 0
store i8* %.tmp9265, i8** %.tmp9263
%.tmp9266 = load %m2638$.Type.type*, %m2638$.Type.type** %slice_len.9261
%.tmp9267 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9266, i32 0, i32 1
%.tmp9269 = getelementptr [4 x i8], [4 x i8]*@.str9268, i32 0, i32 0
store i8* %.tmp9269, i8** %.tmp9267
%.tmp9270 = load %m2638$.Type.type*, %m2638$.Type.type** %slice_c_array.9245
%.tmp9271 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9270, i32 0, i32 4
%.tmp9272 = load %m2638$.Type.type*, %m2638$.Type.type** %slice_len.9261
store %m2638$.Type.type* %.tmp9272, %m2638$.Type.type** %.tmp9271
%.tmp9273 = call %m2638$.Type.type*() @m295$new_type.m2638$.Type.typep()
%slice_cap.9274 = alloca %m2638$.Type.type*
store %m2638$.Type.type* %.tmp9273, %m2638$.Type.type** %slice_cap.9274
%.tmp9275 = load %m2638$.Type.type*, %m2638$.Type.type** %slice_cap.9274
%.tmp9276 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9275, i32 0, i32 0
%.tmp9278 = getelementptr [4 x i8], [4 x i8]*@.str9277, i32 0, i32 0
store i8* %.tmp9278, i8** %.tmp9276
%.tmp9279 = load %m2638$.Type.type*, %m2638$.Type.type** %slice_cap.9274
%.tmp9280 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9279, i32 0, i32 1
%.tmp9282 = getelementptr [4 x i8], [4 x i8]*@.str9281, i32 0, i32 0
store i8* %.tmp9282, i8** %.tmp9280
%.tmp9283 = load %m2638$.Type.type*, %m2638$.Type.type** %slice_len.9261
%.tmp9284 = getelementptr %m2638$.Type.type, %m2638$.Type.type* %.tmp9283, i32 0, i32 4
%.tmp9285 = load %m2638$.Type.type*, %m2638$.Type.type** %slice_cap.9274
store %m2638$.Type.type* %.tmp9285, %m2638$.Type.type** %.tmp9284
%.tmp9286 = load %m2638$.Type.type*, %m2638$.Type.type** %slice_type.9235
store %m2638$.Type.type* %.tmp9286, %m2638$.Type.type** %t.8997
%.tmp9287 = load %m981$.Node.type*, %m981$.Node.type** %ptr.9195
%.tmp9288 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9287, i32 0, i32 7
%.tmp9289 = load %m981$.Node.type*, %m981$.Node.type** %.tmp9288
store %m981$.Node.type* %.tmp9289, %m981$.Node.type** %ptr.9195
br label %.if.end.9233
.if.false.9233:
br label %.if.end.9233
.if.end.9233:
br label %.if.end.9223
.if.false.9223:
%.tmp9290 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %ctx
%.tmp9291 = load %m981$.Node.type*, %m981$.Node.type** %ptr.9195
%.tmp9293 = getelementptr [49 x i8], [49 x i8]*@.str9292, i32 0, i32 0
%.tmp9294 = call i8*(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$err_tmpl.cp.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp9290, %m981$.Node.type* %.tmp9291, i8* %.tmp9293)
%.tmp9295 = load %m981$.Node.type*, %m981$.Node.type** %ptr.9195
%.tmp9296 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9295, i32 0, i32 1
%.tmp9297 = load i8*, i8** %.tmp9296
%.tmp9298 = call i32(i8*,...) @printf(i8* %.tmp9294, i8* %.tmp9297)
%.tmp9299 = bitcast ptr null to %m2638$.Type.type*
ret %m2638$.Type.type* %.tmp9299
br label %.if.end.9223
.if.end.9223:
br label %.if.end.9205
.if.end.9205:
%.tmp9300 = load %m981$.Node.type*, %m981$.Node.type** %ptr.9195
%.tmp9301 = getelementptr %m981$.Node.type, %m981$.Node.type* %.tmp9300, i32 0, i32 7
%.tmp9302 = load %m981$.Node.type*, %m981$.Node.type** %.tmp9301
store %m981$.Node.type* %.tmp9302, %m981$.Node.type** %ptr.9195
br label %.for.start.9191
.for.end.9191:
%.tmp9303 = load %m2638$.Type.type*, %m2638$.Type.type** %t.8997
ret %m2638$.Type.type* %.tmp9303
}
define i1 @compile_file.b.cp.cp(i8* %.filename.arg, i8* %.outname.arg) {
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%outname = alloca i8*
store i8* %.outname.arg, i8** %outname
%.tmp9304 = load i32, i32* @STDERR
%.tmp9306 = getelementptr [2 x i8], [2 x i8]*@.str9305, i32 0, i32 0
%.tmp9307 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp9304, i8* %.tmp9306)
%stderr.9308 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9307, %m0$.File.type** %stderr.9308
%.tmp9309 = call %m0$.File.type*() @tmpfile()
%llvm_code.9310 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9309, %m0$.File.type** %llvm_code.9310
%.tmp9311 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9310
%.tmp9312 = load i8*, i8** %filename
%.tmp9313 = call %m2638$.CompilerCtx.type*(%m0$.File.type*,i8*) @m295$new_context.m2638$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp9311, i8* %.tmp9312)
%compiler_ctx.9314 = alloca %m2638$.CompilerCtx.type*
store %m2638$.CompilerCtx.type* %.tmp9313, %m2638$.CompilerCtx.type** %compiler_ctx.9314
%.tmp9315 = load %m2638$.CompilerCtx.type*, %m2638$.CompilerCtx.type** %compiler_ctx.9314
%.tmp9316 = bitcast ptr null to %m981$.Node.type*
%.tmp9317 = load i8*, i8** %filename
%.tmp9318 = call i1(%m2638$.CompilerCtx.type*,%m981$.Node.type*,i8*) @m295$compile_file.b.m2638$.CompilerCtx.typep.m981$.Node.typep.cp(%m2638$.CompilerCtx.type* %.tmp9315, %m981$.Node.type* %.tmp9316, i8* %.tmp9317)
br i1 %.tmp9318, label %.if.true.9319, label %.if.false.9319
.if.true.9319:
%.tmp9320 = load %m0$.File.type*, %m0$.File.type** %stderr.9308
%.tmp9322 = getelementptr [34 x i8], [34 x i8]*@.str9321, i32 0, i32 0
%.tmp9323 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9320, i8* %.tmp9322)
ret i1 0
br label %.if.end.9319
.if.false.9319:
br label %.if.end.9319
.if.end.9319:
%.tmp9324 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9310
%.tmp9325 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp9324)
%.tmp9326 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9310
%.tmp9327 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp9326)
%llvm_code_size.9328 = alloca i32
store i32 %.tmp9327, i32* %llvm_code_size.9328
%.tmp9329 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9310
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp9329)
%.tmp9331 = getelementptr [1 x i8], [1 x i8]*@.str9330, i32 0, i32 0
%cmd.9332 = alloca i8*
store i8* %.tmp9331, i8** %cmd.9332
%.tmp9333 = getelementptr i8*, i8** %cmd.9332, i32 0
%.tmp9335 = getelementptr [32 x i8], [32 x i8]*@.str9334, i32 0, i32 0
%.tmp9336 = load i8*, i8** %outname
%.tmp9337 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9333, i8* %.tmp9335, i8* %.tmp9336)
%.tmp9338 = load i8*, i8** %cmd.9332
%.tmp9340 = getelementptr [2 x i8], [2 x i8]*@.str9339, i32 0, i32 0
%.tmp9341 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp9338, i8* %.tmp9340)
%proc.9342 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9341, %m0$.File.type** %proc.9342
%.tmp9343 = load %m0$.File.type*, %m0$.File.type** %proc.9342
%.tmp9344 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp9343)
%.tmp9345 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9310
%.tmp9346 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp9345)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp9344, i32 %.tmp9346)
%.tmp9347 = load %m0$.File.type*, %m0$.File.type** %proc.9342
%.tmp9348 = icmp eq %m0$.File.type* %.tmp9347, null
br i1 %.tmp9348, label %.if.true.9349, label %.if.false.9349
.if.true.9349:
%.tmp9350 = load %m0$.File.type*, %m0$.File.type** %stderr.9308
%.tmp9352 = getelementptr [28 x i8], [28 x i8]*@.str9351, i32 0, i32 0
%.tmp9353 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9350, i8* %.tmp9352)
ret i1 0
br label %.if.end.9349
.if.false.9349:
br label %.if.end.9349
.if.end.9349:
%.tmp9354 = load %m0$.File.type*, %m0$.File.type** %proc.9342
%.tmp9355 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp9354)
%.tmp9356 = icmp ne i32 %.tmp9355, 0
br i1 %.tmp9356, label %.if.true.9357, label %.if.false.9357
.if.true.9357:
%.tmp9358 = load %m0$.File.type*, %m0$.File.type** %stderr.9308
%.tmp9360 = getelementptr [24 x i8], [24 x i8]*@.str9359, i32 0, i32 0
%.tmp9361 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9358, i8* %.tmp9360)
ret i1 0
br label %.if.end.9357
.if.false.9357:
br label %.if.end.9357
.if.end.9357:
%.tmp9362 = getelementptr i8*, i8** %cmd.9332, i32 0
%.tmp9364 = getelementptr [17 x i8], [17 x i8]*@.str9363, i32 0, i32 0
%.tmp9365 = load i8*, i8** %outname
%.tmp9366 = load i8*, i8** %outname
%.tmp9367 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9362, i8* %.tmp9364, i8* %.tmp9365, i8* %.tmp9366)
%.tmp9368 = load i8*, i8** %cmd.9332
%.tmp9370 = getelementptr [2 x i8], [2 x i8]*@.str9369, i32 0, i32 0
%.tmp9371 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp9368, i8* %.tmp9370)
%cc_proc.9372 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9371, %m0$.File.type** %cc_proc.9372
%.tmp9373 = load %m0$.File.type*, %m0$.File.type** %cc_proc.9372
%.tmp9374 = icmp eq %m0$.File.type* %.tmp9373, null
br i1 %.tmp9374, label %.if.true.9375, label %.if.false.9375
.if.true.9375:
%.tmp9376 = load %m0$.File.type*, %m0$.File.type** %stderr.9308
%.tmp9378 = getelementptr [28 x i8], [28 x i8]*@.str9377, i32 0, i32 0
%.tmp9379 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9376, i8* %.tmp9378)
ret i1 0
br label %.if.end.9375
.if.false.9375:
br label %.if.end.9375
.if.end.9375:
%.tmp9380 = load %m0$.File.type*, %m0$.File.type** %proc.9342
%.tmp9381 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp9380)
%.tmp9382 = icmp ne i32 %.tmp9381, 0
br i1 %.tmp9382, label %.if.true.9383, label %.if.false.9383
.if.true.9383:
%.tmp9384 = load %m0$.File.type*, %m0$.File.type** %stderr.9308
%.tmp9386 = getelementptr [22 x i8], [22 x i8]*@.str9385, i32 0, i32 0
%.tmp9387 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9384, i8* %.tmp9386)
br label %.if.end.9383
.if.false.9383:
%.tmp9389 = getelementptr [32 x i8], [32 x i8]*@.str9388, i32 0, i32 0
%.tmp9390 = load i8*, i8** %outname
%.tmp9391 = call i32(i8*,...) @printf(i8* %.tmp9389, i8* %.tmp9390)
br label %.if.end.9383
.if.end.9383:
ret i1 1
}
%.Args.type = type {i8*,i8*,i8*,i8**}
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp9392 = load i32, i32* %argc
%.tmp9393 = load i8**, i8*** %argv
%.tmp9394 = call %.Args.type(i32,i8**) @check_args..Args.type.i.cpp(i32 %.tmp9392, i8** %.tmp9393)
%args.9395 = alloca %.Args.type
store %.Args.type %.tmp9394, %.Args.type* %args.9395
%.tmp9396 = getelementptr %.Args.type, %.Args.type* %args.9395, i32 0, i32 1
%.tmp9397 = load i8*, i8** %.tmp9396
%.tmp9398 = getelementptr %.Args.type, %.Args.type* %args.9395, i32 0, i32 2
%.tmp9399 = load i8*, i8** %.tmp9398
%.tmp9400 = call i1(i8*,i8*) @compile_file.b.cp.cp(i8* %.tmp9397, i8* %.tmp9399)
%.tmp9401 = icmp eq i1 %.tmp9400, 0
br i1 %.tmp9401, label %.if.true.9402, label %.if.false.9402
.if.true.9402:
ret i32 0
br label %.if.end.9402
.if.false.9402:
br label %.if.end.9402
.if.end.9402:
%.tmp9403 = getelementptr %.Args.type, %.Args.type* %args.9395, i32 0, i32 0
%.tmp9404 = load i8*, i8** %.tmp9403
%.tmp9406 = getelementptr [4 x i8], [4 x i8]*@.str9405, i32 0, i32 0
%.tmp9407 = call i32(i8*,i8*) @strcmp(i8* %.tmp9404, i8* %.tmp9406)
%.tmp9408 = icmp eq i32 %.tmp9407, 0
br i1 %.tmp9408, label %.if.true.9409, label %.if.false.9409
.if.true.9409:
%.tmp9411 = getelementptr [1 x i8], [1 x i8]*@.str9410, i32 0, i32 0
%cmd.9412 = alloca i8*
store i8* %.tmp9411, i8** %cmd.9412
%.tmp9413 = getelementptr i8*, i8** %cmd.9412, i32 0
%.tmp9415 = getelementptr [5 x i8], [5 x i8]*@.str9414, i32 0, i32 0
%.tmp9416 = getelementptr %.Args.type, %.Args.type* %args.9395, i32 0, i32 2
%.tmp9417 = load i8*, i8** %.tmp9416
%.tmp9418 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9413, i8* %.tmp9415, i8* %.tmp9417)
%.tmp9419 = load i8*, i8** %cmd.9412
%.tmp9420 = getelementptr %.Args.type, %.Args.type* %args.9395, i32 0, i32 3
%.tmp9421 = load i8**, i8*** %.tmp9420
%.tmp9422 = call i32(i8*,i8**) @execvp(i8* %.tmp9419, i8** %.tmp9421)
ret i32 %.tmp9422
br label %.if.end.9409
.if.false.9409:
br label %.if.end.9409
.if.end.9409:
ret i32 0
}
define %.Args.type @check_args..Args.type.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp9424 = getelementptr [22 x i8], [22 x i8]*@.str9423, i32 0, i32 0
%tmpl.9425 = alloca i8*
store i8* %.tmp9424, i8** %tmpl.9425
%args.9426 = alloca %.Args.type
%.tmp9427 = getelementptr %.Args.type, %.Args.type* %args.9426, i32 0, i32 0
store i8* null, i8** %.tmp9427
%.tmp9428 = getelementptr %.Args.type, %.Args.type* %args.9426, i32 0, i32 1
store i8* null, i8** %.tmp9428
%.tmp9429 = getelementptr %.Args.type, %.Args.type* %args.9426, i32 0, i32 2
store i8* null, i8** %.tmp9429
%.tmp9430 = getelementptr %.Args.type, %.Args.type* %args.9426, i32 0, i32 3
store i8** null, i8*** %.tmp9430
%.tmp9431 = load i32, i32* %argc
%.tmp9432 = icmp slt i32 %.tmp9431, 2
br i1 %.tmp9432, label %.if.true.9433, label %.if.false.9433
.if.true.9433:
%.tmp9434 = load i8*, i8** %tmpl.9425
%.tmp9435 = load i8**, i8*** %argv
%.tmp9436 = getelementptr i8*, i8** %.tmp9435, i32 0
%.tmp9437 = load i8*, i8** %.tmp9436
%.tmp9438 = call i32(i8*,...) @printf(i8* %.tmp9434, i8* %.tmp9437)
call void(i32) @exit(i32 1)
br label %.if.end.9433
.if.false.9433:
br label %.if.end.9433
.if.end.9433:
%fp.9439 = alloca i32
store i32 1, i32* %fp.9439
%.tmp9440 = getelementptr %.Args.type, %.Args.type* %args.9426, i32 0, i32 0
%.tmp9442 = getelementptr [8 x i8], [8 x i8]*@.str9441, i32 0, i32 0
store i8* %.tmp9442, i8** %.tmp9440
%.tmp9443 = load i8**, i8*** %argv
%.tmp9444 = getelementptr i8*, i8** %.tmp9443, i32 1
%.tmp9445 = load i8*, i8** %.tmp9444
%.tmp9447 = getelementptr [4 x i8], [4 x i8]*@.str9446, i32 0, i32 0
%.tmp9448 = call i32(i8*,i8*) @strcmp(i8* %.tmp9445, i8* %.tmp9447)
%.tmp9449 = icmp eq i32 %.tmp9448, 0
br i1 %.tmp9449, label %.if.true.9450, label %.if.false.9450
.if.true.9450:
%.tmp9451 = getelementptr %.Args.type, %.Args.type* %args.9426, i32 0, i32 0
%.tmp9453 = getelementptr [4 x i8], [4 x i8]*@.str9452, i32 0, i32 0
store i8* %.tmp9453, i8** %.tmp9451
store i32 2, i32* %fp.9439
br label %.if.end.9450
.if.false.9450:
br label %.if.end.9450
.if.end.9450:
%.tmp9454 = load i32, i32* %argc
%.tmp9455 = load i32, i32* %fp.9439
%.tmp9456 = add i32 %.tmp9455, 1
%.tmp9457 = icmp slt i32 %.tmp9454, %.tmp9456
br i1 %.tmp9457, label %.if.true.9458, label %.if.false.9458
.if.true.9458:
%.tmp9459 = load i8*, i8** %tmpl.9425
%.tmp9460 = load i8**, i8*** %argv
%.tmp9461 = getelementptr i8*, i8** %.tmp9460, i32 0
%.tmp9462 = load i8*, i8** %.tmp9461
%.tmp9463 = call i32(i8*,...) @printf(i8* %.tmp9459, i8* %.tmp9462)
call void(i32) @exit(i32 1)
br label %.if.end.9458
.if.false.9458:
br label %.if.end.9458
.if.end.9458:
%.tmp9464 = getelementptr %.Args.type, %.Args.type* %args.9426, i32 0, i32 1
%.tmp9465 = load i32, i32* %fp.9439
%.tmp9466 = load i8**, i8*** %argv
%.tmp9467 = getelementptr i8*, i8** %.tmp9466, i32 %.tmp9465
%.tmp9468 = load i8*, i8** %.tmp9467
store i8* %.tmp9468, i8** %.tmp9464
%.tmp9469 = getelementptr %.Args.type, %.Args.type* %args.9426, i32 0, i32 1
%.tmp9470 = load i8*, i8** %.tmp9469
%.tmp9471 = call {i8*,i8*}(i8*) @m2$splitext.scpcp.cp(i8* %.tmp9470)
%ext.9472 = alloca {i8*,i8*}
store {i8*,i8*} %.tmp9471, {i8*,i8*}* %ext.9472
%.tmp9473 = getelementptr %.Args.type, %.Args.type* %args.9426, i32 0, i32 2
%.tmp9474 = getelementptr {i8*,i8*}, {i8*,i8*}* %ext.9472, i32 0, i32 0
%.tmp9475 = load i8*, i8** %.tmp9474
store i8* %.tmp9475, i8** %.tmp9473
%.tmp9476 = load i32, i32* %argc
%.tmp9477 = load i32, i32* %fp.9439
%.tmp9478 = sub i32 %.tmp9476, %.tmp9477
%.tmp9479 = add i32 %.tmp9478, 1
%ac.9480 = alloca i32
store i32 %.tmp9479, i32* %ac.9480
%.tmp9481 = getelementptr %.Args.type, %.Args.type* %args.9426, i32 0, i32 3
%.tmp9482 = load i32, i32* %ac.9480
%.tmp9483 = mul i32 8, %.tmp9482
%.tmp9484 = call i8*(i32) @malloc(i32 %.tmp9483)
%.tmp9485 = bitcast i8* %.tmp9484 to i8**
store i8** %.tmp9485, i8*** %.tmp9481
%.tmp9486 = getelementptr %.Args.type, %.Args.type* %args.9426, i32 0, i32 3
%.tmp9487 = load i8**, i8*** %.tmp9486
%.tmp9488 = getelementptr i8*, i8** %.tmp9487, i32 0
%.tmp9489 = getelementptr %.Args.type, %.Args.type* %args.9426, i32 0, i32 2
%.tmp9490 = load i8*, i8** %.tmp9489
store i8* %.tmp9490, i8** %.tmp9488
%i.9492 = alloca i32
store i32 0, i32* %i.9492
br label %.for.start.9491
.for.start.9491:
%.tmp9493 = load i32, i32* %i.9492
%.tmp9494 = load i32, i32* %argc
%.tmp9495 = load i32, i32* %fp.9439
%.tmp9496 = sub i32 %.tmp9494, %.tmp9495
%.tmp9497 = icmp slt i32 %.tmp9493, %.tmp9496
br i1 %.tmp9497, label %.for.continue.9491, label %.for.end.9491
.for.continue.9491:
%.tmp9498 = getelementptr %.Args.type, %.Args.type* %args.9426, i32 0, i32 3
%.tmp9499 = load i32, i32* %i.9492
%.tmp9500 = add i32 %.tmp9499, 1
%.tmp9501 = load i8**, i8*** %.tmp9498
%.tmp9502 = getelementptr i8*, i8** %.tmp9501, i32 %.tmp9500
%.tmp9503 = load i32, i32* %fp.9439
%.tmp9504 = load i32, i32* %i.9492
%.tmp9505 = add i32 %.tmp9503, %.tmp9504
%.tmp9506 = add i32 %.tmp9505, 1
%.tmp9507 = load i8**, i8*** %argv
%.tmp9508 = getelementptr i8*, i8** %.tmp9507, i32 %.tmp9506
%.tmp9509 = load i8*, i8** %.tmp9508
store i8* %.tmp9509, i8** %.tmp9502
%.tmp9510 = load i32, i32* %i.9492
%.tmp9511 = add i32 %.tmp9510, 1
store i32 %.tmp9511, i32* %i.9492
br label %.for.start.9491
.for.end.9491:
%.tmp9512 = load %.Args.type, %.Args.type* %args.9426
ret %.Args.type %.tmp9512
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
@.str941 = constant [5 x i8] c"\0A%s\0A\00"
@.str946 = constant [1 x i8] c"\00"
@.str953 = constant [24 x i8] c"[%s %d:%d] error: %s\0A%s\00"
@.str970 = constant [3 x i8] c"%s\00"
@.str976 = constant [3 x i8] c"%s\00"
@.str1022 = constant [2 x i8] c"(\00"
@.str1042 = constant [2 x i8] c"|\00"
@.str1062 = constant [2 x i8] c")\00"
@.str1071 = constant [4 x i8] c"EOF\00"
@.str1088 = constant [2 x i8] c"|\00"
@.str1097 = constant [2 x i8] c")\00"
@.str1103 = constant [48 x i8] c"[%d:%d] malformed grammar, expected | got '%s'\0A\00"
@.str1126 = constant [2 x i8] c"|\00"
@.str1143 = constant [2 x i8] c")\00"
@.str1149 = constant [22 x i8] c"open brace not closed\00"
@.str1163 = constant [2 x i8] c"+\00"
@.str1182 = constant [2 x i8] c"*\00"
@.str1201 = constant [2 x i8] c"?\00"
@.str1222 = constant [2 x i8] c"(\00"
@.str1231 = constant [5 x i8] c"WORD\00"
@.str1253 = constant [5 x i8] c"WORD\00"
@.str1260 = constant [7 x i8] c"STRING\00"
@.str1302 = constant [7 x i8] c"STRING\00"
@.str1327 = constant [17 x i8] c"rule name: '%s'\0A\00"
@.str1336 = constant [50 x i8] c"Some characters are not allowed in this rule name\00"
@.str1368 = constant [5 x i8] c"WORD\00"
@.str1373 = constant [37 x i8] c"Identifier: {type: %s, value: '%s'}\0A\00"
@.str1387 = constant [31 x i8] c"rule identifier must be a WORD\00"
@.str1396 = constant [1 x i8] c"\00"
@.str1404 = constant [2 x i8] c"[\00"
@.str1435 = constant [2 x i8] c":\00"
@.str1446 = constant [1 x i8] c"\00"
@.str1450 = constant [35 x i8] c"expected : after rule name, got %s\00"
@.str1504 = constant [4 x i8] c"EOF\00"
@.str1513 = constant [3 x i8] c"NL\00"
@.str1680 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str1737 = constant [7 x i8] c"(null)\00"
@.str1739 = constant [1 x i8] c"\00"
@.str1743 = constant [43 x i8] c"Unable to match token by value: %s != \22%s\22\00"
@.str1801 = constant [13 x i8] c"%s: %s != %s\00"
@.str1804 = constant [30 x i8] c"unable to match token by type\00"
@.str1865 = constant [30 x i8] c"unable to retrieve alias rule\00"
@.str1888 = constant [41 x i8] c"parser.bn: query matcher not implemented\00"
@.str2028 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str2045 = constant [4 x i8] c"EOF\00"
@.str2059 = constant [26 x i8] c"syntax parsing ended here\00"
@.str2094 = constant [2 x i8] c"\0A\00"
@.str2103 = constant [3 x i8] c"  \00"
@.str2112 = constant [7 x i8] c"(null)\00"
@.str2116 = constant [2 x i8] c"{\00"
@.str2122 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str2131 = constant [12 x i8] c"\22value\22: %s\00"
@.str2140 = constant [11 x i8] c"\22line\22: %d\00"
@.str2149 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str2158 = constant [9 x i8] c"\22next\22: \00"
@.str2170 = constant [13 x i8] c"\22children\22: \00"
@.str2183 = constant [2 x i8] c"}\00"
@.str2187 = constant [1886 x i8] c"
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
@.str2190 = constant [1885 x i8] c"%%%1$s.tmp0 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 1
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
@.str2196 = constant [1 x i8] c"\00"
@.str2212 = constant [6 x i8] c"%s\5C22\00"
@.str2237 = constant [6 x i8] c"%s\5C0A\00"
@.str2251 = constant [6 x i8] c"%s\5C5C\00"
@.str2267 = constant [8 x i8] c"%s\5C%c%c\00"
@.str2285 = constant [5 x i8] c"%s%c\00"
@.str2294 = constant [5 x i8] c"%s%c\00"
@.str2305 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2342 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2347 = constant [3 x i8] c"%d\00"
@.str2355 = constant [6 x i8] c"'\5C%x'\00"
@.str2360 = constant [3 x i8] c"%d\00"
@.str2368 = constant [6 x i8] c"'\5C%c'\00"
@.str2375 = constant [3 x i8] c"10\00"
@.str2382 = constant [5 x i8] c"'%c'\00"
@.str2387 = constant [3 x i8] c"%d\00"
@.str2436 = constant [16 x i8] c"mono_assignable\00"
@.str2447 = constant [9 x i8] c"operator\00"
@.str2484 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2531 = constant [2 x i8] c"+\00"
@.str2538 = constant [2 x i8] c"-\00"
@.str2547 = constant [2 x i8] c"*\00"
@.str2554 = constant [2 x i8] c"/\00"
@.str2562 = constant [2 x i8] c"%\00"
@.str2571 = constant [3 x i8] c"==\00"
@.str2578 = constant [3 x i8] c"!=\00"
@.str2587 = constant [3 x i8] c">=\00"
@.str2594 = constant [3 x i8] c"<=\00"
@.str2603 = constant [2 x i8] c">\00"
@.str2610 = constant [2 x i8] c"<\00"
@.str2619 = constant [2 x i8] c"&\00"
@.str2627 = constant [2 x i8] c"|\00"
@.str2632 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
@.str2643 = constant [2 x i8] c"?\00"
@.str2649 = constant [54 x i8] c"called 'repr' with malformed type, container is null.\00"
@.str2655 = constant [4 x i8] c"int\00"
@.str2660 = constant [4 x i8] c"i32\00"
@.str2665 = constant [5 x i8] c"void\00"
@.str2670 = constant [5 x i8] c"void\00"
@.str2675 = constant [5 x i8] c"bool\00"
@.str2680 = constant [3 x i8] c"i1\00"
@.str2685 = constant [8 x i8] c"nullptr\00"
@.str2690 = constant [4 x i8] c"ptr\00"
@.str2695 = constant [4 x i8] c"chr\00"
@.str2700 = constant [3 x i8] c"i8\00"
@.str2705 = constant [9 x i8] c"function\00"
@.str2711 = constant [4 x i8] c"%s(\00"
@.str2737 = constant [4 x i8] c"%s,\00"
@.str2742 = constant [5 x i8] c"%s%s\00"
@.str2753 = constant [4 x i8] c"%s)\00"
@.str2761 = constant [4 x i8] c"ptr\00"
@.str2767 = constant [4 x i8] c"%s*\00"
@.str2779 = constant [7 x i8] c"struct\00"
@.str2785 = constant [2 x i8] c"{\00"
@.str2802 = constant [4 x i8] c"%s,\00"
@.str2807 = constant [5 x i8] c"%s%s\00"
@.str2818 = constant [4 x i8] c"%s}\00"
@.str2826 = constant [6 x i8] c"array\00"
@.str2832 = constant [10 x i8] c"[%s x %s]\00"
@.str2851 = constant [10 x i8] c"typealias\00"
@.str2857 = constant [5 x i8] c"%%%s\00"
@.str2867 = constant [7 x i8] c"vararg\00"
@.str2872 = constant [4 x i8] c"...\00"
@.str2877 = constant [6 x i8] c"error\00"
@.str2882 = constant [53 x i8] c":coffee-error: 'repr' not implemented for type '%s'\0A\00"
@.str2892 = constant [8 x i8] c"nullptr\00"
@.str2899 = constant [8 x i8] c"nullptr\00"
@.str2908 = constant [4 x i8] c"ptr\00"
@.str2915 = constant [4 x i8] c"ptr\00"
@.str2923 = constant [10 x i8] c"typealias\00"
@.str2937 = constant [10 x i8] c"typealias\00"
@.str2996 = constant [12 x i8] c"COFFEE_ROOT\00"
@.str3003 = constant [5 x i8] c"HOME\00"
@.str3008 = constant [11 x i8] c"%s/.coffee\00"
@.str3096 = constant [1 x i8] c"\00"
@.str3142 = constant [5 x i8] c"%c%s\00"
@.str3154 = constant [7 x i8] c".tmp%d\00"
@.str3254 = constant [1 x i8] c"\00"
@.str3299 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str3317 = constant [26 x i8] c"Unable to open file: '%s'\00"
@.str3336 = constant [6 x i8] c"start\00"
@.str3413 = constant [6 x i8] c"start\00"
@.str3420 = constant [29 x i8] c"Expecting 'start' expression\00"
@.str3423 = constant [7 x i8] c"global\00"
@.str3435 = constant [13 x i8] c"head_comment\00"
@.str3479 = constant [1 x i8] c"\00"
@.str3503 = constant [7 x i8] c"string\00"
@.str3511 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3531 = constant [7 x i8] c"extern\00"
@.str3545 = constant [15 x i8] c"declare %s %s(\00"
@.str3581 = constant [3 x i8] c", \00"
@.str3587 = constant [3 x i8] c"%s\00"
@.str3599 = constant [3 x i8] c")\0A\00"
@.str3616 = constant [5 x i8] c"%s%s\00"
@.str3624 = constant [9 x i8] c"function\00"
@.str3630 = constant [5 x i8] c"main\00"
@.str3645 = constant [6 x i8] c"%s.%s\00"
@.str3666 = constant [3 x i8] c"NL\00"
@.str3674 = constant [7 x i8] c"global\00"
@.str3682 = constant [11 x i8] c"assignable\00"
@.str3713 = constant [9 x i8] c"variable\00"
@.str3725 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3740 = constant [10 x i8] c"typealias\00"
@.str3762 = constant [11 x i8] c"%s.%s.type\00"
@.str3774 = constant [10 x i8] c"typealias\00"
@.str3796 = constant [5 x i8] c"type\00"
@.str3826 = constant [14 x i8] c"%s = type %s\0A\00"
@.str3839 = constant [7 x i8] c"extern\00"
@.str3857 = constant [7 x i8] c"extern\00"
@.str3898 = constant [7 x i8] c"extern\00"
@.str3910 = constant [9 x i8] c"function\00"
@.str3919 = constant [9 x i8] c"function\00"
@.str3958 = constant [14 x i8] c"define %s %s(\00"
@.str3987 = constant [3 x i8] c", \00"
@.str3993 = constant [5 x i8] c"type\00"
@.str4009 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str4024 = constant [5 x i8] c") {\0A\00"
@.str4028 = constant [9 x i8] c"function\00"
@.str4038 = constant [6 x i8] c"block\00"
@.str4053 = constant [3 x i8] c"}\0A\00"
@.str4059 = constant [7 x i8] c"import\00"
@.str4115 = constant [54 x i8] c"Unable to import '%s' no such file or directory. (%s)\00"
@.str4176 = constant [5 x i8] c"m%d$\00"
@.str4227 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str4236 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str4268 = constant [9 x i8] c"variable\00"
@.str4273 = constant [5 x i8] c"type\00"
@.str4305 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str4318 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str4330 = constant [6 x i8] c"block\00"
@.str4338 = constant [12 x i8] c"expressions\00"
@.str4369 = constant [7 x i8] c"struct\00"
@.str4374 = constant [7 x i8] c"WhAT!\0A\00"
@.str4414 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4426 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str4452 = constant [7 x i8] c"struct\00"
@.str4457 = constant [7 x i8] c"WhAT!\0A\00"
@.str4488 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4500 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4525 = constant [7 x i8] c"sizeof\00"
@.str4531 = constant [8 x i8] c"fn_args\00"
@.str4538 = constant [11 x i8] c"assignable\00"
@.str4566 = constant [4 x i8] c"int\00"
@.str4579 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4588 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4599 = constant [7 x i8] c"append\00"
@.str4605 = constant [8 x i8] c"fn_args\00"
@.str4612 = constant [11 x i8] c"assignable\00"
@.str4619 = constant [11 x i8] c"assignable\00"
@.str4643 = constant [5 x i8] c".b%d\00"
@.str4677 = constant [8 x i8] c"realloc\00"
@.str4686 = constant [9 x i8] c"function\00"
@.str4699 = constant [4 x i8] c"ptr\00"
@.str4716 = constant [4 x i8] c"chr\00"
@.str4733 = constant [4 x i8] c"ptr\00"
@.str4754 = constant [4 x i8] c"chr\00"
@.str4775 = constant [4 x i8] c"int\00"
@.str4778 = constant [8 x i8] c"realloc\00"
@.str4780 = constant [7 x i8] c"extern\00"
@.str4787 = constant [4 x i8] c"len\00"
@.str4793 = constant [8 x i8] c"fn_args\00"
@.str4800 = constant [11 x i8] c"assignable\00"
@.str4808 = constant [1 x i8] c"\00"
@.str4824 = constant [46 x i8] c"Imports %s must not start with '/' character.\00"
@.str4845 = constant [13 x i8] c"%s/lib/%s.bn\00"
@.str4851 = constant [1 x i8] c"\00"
@.str4857 = constant [6 x i8] c"%s.bn\00"
@.str4862 = constant [9 x i8] c"%s/%s.bn\00"
@.str4886 = constant [35 x i8] c"unable to compile function address\00"
@.str4892 = constant [8 x i8] c"fn_args\00"
@.str4896 = constant [1 x i8] c"\00"
@.str4905 = constant [4 x i8] c"ptr\00"
@.str4925 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str4949 = constant [11 x i8] c"assignable\00"
@.str4973 = constant [11 x i8] c"assignable\00"
@.str4985 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str5003 = constant [5 x i8] c"%s, \00"
@.str5028 = constant [7 x i8] c"vararg\00"
@.str5041 = constant [1 x i8] c"\00"
@.str5045 = constant [58 x i8] c"types.Type for argument %d does not match: '%s', got '%s'\00"
@.str5062 = constant [8 x i8] c"%s%s %s\00"
@.str5079 = constant [7 x i8] c"vararg\00"
@.str5090 = constant [11 x i8] c"assignable\00"
@.str5099 = constant [7 x i8] c"vararg\00"
@.str5105 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str5141 = constant [7 x i8] c"vararg\00"
@.str5152 = constant [42 x i8] c"Function '%s' takes %d arguments, 0 given\00"
@.str5170 = constant [5 x i8] c"void\00"
@.str5178 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str5210 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str5236 = constant [7 x i8] c"return\00"
@.str5242 = constant [9 x i8] c"function\00"
@.str5251 = constant [40 x i8] c"'return' used outside of function scope\00"
@.str5260 = constant [3 x i8] c"NL\00"
@.str5285 = constant [1 x i8] c"\00"
@.str5289 = constant [67 x i8] c"trying to return '%s' from function declared with return type '%s'\00"
@.str5308 = constant [11 x i8] c"ret %s %s\0A\00"
@.str5321 = constant [10 x i8] c"ret void\0A\00"
@.str5325 = constant [3 x i8] c"NL\00"
@.str5331 = constant [8 x i8] c"fn_call\00"
@.str5342 = constant [12 x i8] c"declaration\00"
@.str5351 = constant [11 x i8] c"assignment\00"
@.str5359 = constant [11 x i8] c"assignable\00"
@.str5387 = constant [1 x i8] c"\00"
@.str5391 = constant [37 x i8] c"cannot assign type '%s' to type '%s'\00"
@.str5420 = constant [4 x i8] c"ptr\00"
@.str5429 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5439 = constant [9 x i8] c"if_block\00"
@.str5447 = constant [9 x i8] c"for_loop\00"
@.str5455 = constant [8 x i8] c"keyword\00"
@.str5461 = constant [4 x i8] c"for\00"
@.str5468 = constant [1 x i8] c"\00"
@.str5472 = constant [42 x i8] c"'%s' keyword used outside 'for' statement\00"
@.str5488 = constant [6 x i8] c"break\00"
@.str5496 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5507 = constant [9 x i8] c"continue\00"
@.str5515 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5522 = constant [9 x i8] c"function\00"
@.str5531 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str5562 = constant [4 x i8] c"ptr\00"
@.str5571 = constant [4 x i8] c"chr\00"
@.str5582 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5591 = constant [9 x i8] c"function\00"
@.str5604 = constant [5 x i8] c"void\00"
@.str5634 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5636 = constant [7 x i8] c"extern\00"
@.str5644 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5653 = constant [9 x i8] c"function\00"
@.str5668 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5670 = constant [7 x i8] c"extern\00"
@.str5678 = constant [5 x i8] c"mmap\00"
@.str5687 = constant [9 x i8] c"function\00"
@.str5713 = constant [4 x i8] c"int\00"
@.str5725 = constant [4 x i8] c"int\00"
@.str5737 = constant [4 x i8] c"int\00"
@.str5749 = constant [4 x i8] c"int\00"
@.str5761 = constant [4 x i8] c"int\00"
@.str5767 = constant [5 x i8] c"mmap\00"
@.str5769 = constant [7 x i8] c"extern\00"
@.str5775 = constant [5 x i8] c"WORD\00"
@.str5798 = constant [9 x i8] c"function\00"
@.str5822 = constant [4 x i8] c"ptr\00"
@.str5831 = constant [7 x i8] c"struct\00"
@.str5845 = constant [1 x i8] c"\00"
@.str5849 = constant [5 x i8] c"@.%d\00"
@.str5863 = constant [101 x i8] c"%%.tmem%d = call i8*(i8*,i32,i32,i32,i32,i32) @mmap(i8* null, i32 72, i32 7, i32 34, i32 -1, i32 0)\0A\00"
@.str5870 = constant [100 x i8] c"call void(i8*,i8*,i8*) @llvm.init.trampoline(i8* %%.tmem%d, i8* bitcast (%s* %s to i8*), i8* null)\0A\00"
@.str5881 = constant [66 x i8] c"%%.trmp%d = call i8*(i8*) @llvm.adjust.trampoline(i8* %%.tmem%d)\0A\00"
@.str5889 = constant [35 x i8] c"%s = bitcast i8* %%.trmp%d to %s*\0A\00"
@.str5910 = constant [14 x i8] c"define %s %s(\00"
@.str5918 = constant [9 x i8] c"function\00"
@.str5926 = constant [13 x i8] c"%s nest %%.0\00"
@.str5953 = constant [3 x i8] c", \00"
@.str5959 = constant [5 x i8] c"type\00"
@.str5975 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str5990 = constant [5 x i8] c") {\0A\00"
@.str5998 = constant [6 x i8] c"block\00"
@.str6011 = constant [3 x i8] c"}\0A\00"
@.str6037 = constant [12 x i8] c"expressions\00"
@.str6051 = constant [3 x i8] c"NL\00"
@.str6068 = constant [7 x i8] c"return\00"
@.str6076 = constant [5 x i8] c"void\00"
@.str6087 = constant [21 x i8] c"Missing return value\00"
@.str6092 = constant [10 x i8] c"ret void\0A\00"
@.str6109 = constant [14 x i8] c".for.start.%d\00"
@.str6114 = constant [12 x i8] c".for.end.%d\00"
@.str6119 = constant [4 x i8] c"for\00"
@.str6127 = constant [12 x i8] c"declaration\00"
@.str6138 = constant [11 x i8] c"assignment\00"
@.str6148 = constant [9 x i8] c"OPERATOR\00"
@.str6155 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str6166 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str6173 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str6180 = constant [9 x i8] c"OPERATOR\00"
@.str6191 = constant [9 x i8] c"OPERATOR\00"
@.str6198 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str6207 = constant [9 x i8] c"OPERATOR\00"
@.str6212 = constant [6 x i8] c"block\00"
@.str6217 = constant [11 x i8] c"else_block\00"
@.str6227 = constant [13 x i8] c".for.else.%d\00"
@.str6234 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str6249 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str6268 = constant [15 x i8] c"br label %%%s\0A\00"
@.str6278 = constant [15 x i8] c".for.else.%d:\0A\00"
@.str6285 = constant [6 x i8] c"block\00"
@.str6294 = constant [15 x i8] c"br label %%%s\0A\00"
@.str6301 = constant [5 x i8] c"%s:\0A\00"
@.str6315 = constant [5 x i8] c"type\00"
@.str6330 = constant [11 x i8] c"assignable\00"
@.str6345 = constant [9 x i8] c"variable\00"
@.str6350 = constant [5 x i8] c"WORD\00"
@.str6359 = constant [31 x i8] c"unable to get declaration name\00"
@.str6379 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6391 = constant [6 x i8] c"%s.%d\00"
@.str6444 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str6461 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str6473 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6514 = constant [4 x i8] c"int\00"
@.str6521 = constant [4 x i8] c"chr\00"
@.str6529 = constant [5 x i8] c"bool\00"
@.str6538 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str6547 = constant [4 x i8] c"ptr\00"
@.str6555 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6558 = constant [5 x i8] c"null\00"
@.str6566 = constant [7 x i8] c"struct\00"
@.str6587 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6607 = constant [10 x i8] c"typealias\00"
@.str6630 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6649 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str6666 = constant [11 x i8] c"assignable\00"
@.str6683 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str6698 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str6705 = constant [6 x i8] c"block\00"
@.str6714 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6721 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str6728 = constant [11 x i8] c"elif_block\00"
@.str6740 = constant [11 x i8] c"else_block\00"
@.str6750 = constant [6 x i8] c"block\00"
@.str6760 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6767 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str6788 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str6797 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str6831 = constant [1 x i8] c"\00"
@.str6842 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6862 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6897 = constant [7 x i8] c"module\00"
@.str6950 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str6987 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str6995 = constant [9 x i8] c"function\00"
@.str7002 = constant [7 x i8] c"extern\00"
@.str7014 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str7035 = constant [9 x i8] c"variable\00"
@.str7057 = constant [4 x i8] c"ptr\00"
@.str7076 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str7100 = constant [10 x i8] c"typealias\00"
@.str7111 = constant [7 x i8] c"struct\00"
@.str7117 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str7169 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str7190 = constant [9 x i8] c"variable\00"
@.str7201 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str7222 = constant [9 x i8] c"variable\00"
@.str7230 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str7244 = constant [17 x i8] c"addr_destination\00"
@.str7251 = constant [16 x i8] c"mono_assignable\00"
@.str7259 = constant [11 x i8] c"assignable\00"
@.str7273 = constant [12 x i8] c"destination\00"
@.str7278 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str7306 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str7325 = constant [7 x i8] c"module\00"
@.str7347 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str7418 = constant [6 x i8] c"slice\00"
@.str7431 = constant [45 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 0\0A\00"
@.str7473 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str7494 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str7518 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str7541 = constant [16 x i8] c"mono_assignable\00"
@.str7567 = constant [5 x i8] c"cast\00"
@.str7577 = constant [5 x i8] c"type\00"
@.str7602 = constant [8 x i8] c"bitcast\00"
@.str7617 = constant [6 x i8] c"slice\00"
@.str7622 = constant [48 x i8] c"Casting array to slices is not implemented yet\0A\00"
@.str7630 = constant [4 x i8] c"ptr\00"
@.str7637 = constant [4 x i8] c"ptr\00"
@.str7656 = constant [4 x i8] c"i%d\00"
@.str7661 = constant [4 x i8] c"i%d\00"
@.str7669 = constant [5 x i8] c"sext\00"
@.str7671 = constant [6 x i8] c"trunc\00"
@.str7676 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str7696 = constant [16 x i8] c"mono_assignable\00"
@.str7758 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str7781 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str7788 = constant [2 x i8] c"+\00"
@.str7793 = constant [4 x i8] c"add\00"
@.str7798 = constant [2 x i8] c"-\00"
@.str7803 = constant [4 x i8] c"sub\00"
@.str7808 = constant [2 x i8] c"*\00"
@.str7813 = constant [4 x i8] c"mul\00"
@.str7818 = constant [2 x i8] c"/\00"
@.str7823 = constant [5 x i8] c"sdiv\00"
@.str7828 = constant [3 x i8] c"==\00"
@.str7833 = constant [8 x i8] c"icmp eq\00"
@.str7838 = constant [3 x i8] c"!=\00"
@.str7843 = constant [8 x i8] c"icmp ne\00"
@.str7848 = constant [2 x i8] c">\00"
@.str7853 = constant [9 x i8] c"icmp sgt\00"
@.str7858 = constant [2 x i8] c"<\00"
@.str7863 = constant [9 x i8] c"icmp slt\00"
@.str7868 = constant [2 x i8] c"&\00"
@.str7873 = constant [4 x i8] c"and\00"
@.str7878 = constant [2 x i8] c"|\00"
@.str7883 = constant [3 x i8] c"or\00"
@.str7888 = constant [3 x i8] c">=\00"
@.str7893 = constant [9 x i8] c"icmp sge\00"
@.str7898 = constant [3 x i8] c"<=\00"
@.str7903 = constant [9 x i8] c"icmp sle\00"
@.str7908 = constant [2 x i8] c"%\00"
@.str7913 = constant [5 x i8] c"srem\00"
@.str7917 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str7924 = constant [4 x i8] c"add\00"
@.str7931 = constant [3 x i8] c"==\00"
@.str7938 = constant [3 x i8] c"!=\00"
@.str7946 = constant [2 x i8] c"|\00"
@.str7954 = constant [2 x i8] c"&\00"
@.str7962 = constant [2 x i8] c">\00"
@.str7970 = constant [2 x i8] c"<\00"
@.str7978 = constant [3 x i8] c">=\00"
@.str7986 = constant [3 x i8] c"<=\00"
@.str7994 = constant [5 x i8] c"bool\00"
@.str7998 = constant [4 x i8] c"int\00"
@.str8012 = constant [7 x i8] c"NUMBER\00"
@.str8026 = constant [4 x i8] c"int\00"
@.str8040 = constant [5 x i8] c"WORD\00"
@.str8050 = constant [5 x i8] c"null\00"
@.str8057 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str8071 = constant [5 x i8] c"null\00"
@.str8080 = constant [8 x i8] c"nullptr\00"
@.str8087 = constant [17 x i8] c"addr_destination\00"
@.str8099 = constant [12 x i8] c"destination\00"
@.str8143 = constant [4 x i8] c"ptr\00"
@.str8162 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str8176 = constant [9 x i8] c"function\00"
@.str8191 = constant [4 x i8] c"ptr\00"
@.str8199 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str8213 = constant [8 x i8] c"boolean\00"
@.str8227 = constant [5 x i8] c"bool\00"
@.str8236 = constant [6 x i8] c"false\00"
@.str8243 = constant [2 x i8] c"0\00"
@.str8247 = constant [2 x i8] c"1\00"
@.str8254 = constant [8 x i8] c"fn_call\00"
@.str8271 = constant [7 x i8] c"STRING\00"
@.str8297 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str8313 = constant [4 x i8] c"ptr\00"
@.str8326 = constant [4 x i8] c"chr\00"
@.str8333 = constant [4 x i8] c"CHR\00"
@.str8349 = constant [2 x i8] c"0\00"
@.str8365 = constant [22 x i8] c"Invalid character: %s\00"
@.str8381 = constant [4 x i8] c"chr\00"
@.str8385 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str8413 = constant [22 x i8] c"called 'abbr' on null\00"
@.str8419 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str8424 = constant [4 x i8] c"int\00"
@.str8429 = constant [2 x i8] c"i\00"
@.str8434 = constant [5 x i8] c"bool\00"
@.str8439 = constant [2 x i8] c"b\00"
@.str8444 = constant [5 x i8] c"void\00"
@.str8449 = constant [2 x i8] c"v\00"
@.str8454 = constant [4 x i8] c"chr\00"
@.str8459 = constant [2 x i8] c"c\00"
@.str8464 = constant [4 x i8] c"ptr\00"
@.str8471 = constant [4 x i8] c"%sp\00"
@.str8482 = constant [10 x i8] c"typealias\00"
@.str8493 = constant [7 x i8] c"struct\00"
@.str8498 = constant [2 x i8] c"s\00"
@.str8509 = constant [5 x i8] c"%s%s\00"
@.str8522 = constant [9 x i8] c"function\00"
@.str8527 = constant [2 x i8] c"f\00"
@.str8532 = constant [6 x i8] c"error\00"
@.str8537 = constant [2 x i8] c"?\00"
@.str8539 = constant [45 x i8] c":coffee-error: unable to abbreviate type %s\0A\00"
@.str8551 = constant [7 x i8] c".str%d\00"
@.str8566 = constant [6 x i8] c"array\00"
@.str8579 = constant [4 x i8] c"chr\00"
@.str8600 = constant [3 x i8] c"%d\00"
@.str8607 = constant [7 x i8] c"string\00"
@.str8643 = constant [7 x i8] c"module\00"
@.str8694 = constant [4 x i8] c"%s\0A\00"
@.str8813 = constant [9 x i8] c"function\00"
@.str8831 = constant [5 x i8] c"WORD\00"
@.str8888 = constant [10 x i8] c"fn_params\00"
@.str8902 = constant [11 x i8] c"basic_type\00"
@.str8923 = constant [13 x i8] c"type_trailer\00"
@.str8932 = constant [9 x i8] c"function\00"
@.str8948 = constant [15 x i8] c"type_fn_params\00"
@.str8989 = constant [4 x i8] c"ptr\00"
@.str9001 = constant [10 x i8] c"structdef\00"
@.str9008 = constant [7 x i8] c"struct\00"
@.str9015 = constant [5 x i8] c"type\00"
@.str9046 = constant [5 x i8] c"type\00"
@.str9073 = constant [5 x i8] c"type\00"
@.str9079 = constant [12 x i8] c"dotted_name\00"
@.str9093 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str9106 = constant [6 x i8] c"error\00"
@.str9111 = constant [10 x i8] c"typealias\00"
@.str9135 = constant [4 x i8] c"str\00"
@.str9142 = constant [4 x i8] c"ptr\00"
@.str9151 = constant [4 x i8] c"chr\00"
@.str9156 = constant [5 x i8] c"WORD\00"
@.str9169 = constant [4 x i8] c"...\00"
@.str9176 = constant [7 x i8] c"vararg\00"
@.str9180 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str9201 = constant [2 x i8] c"*\00"
@.str9210 = constant [4 x i8] c"ptr\00"
@.str9219 = constant [2 x i8] c"[\00"
@.str9229 = constant [2 x i8] c"]\00"
@.str9238 = constant [7 x i8] c"struct\00"
@.str9242 = constant [6 x i8] c"slice\00"
@.str9248 = constant [4 x i8] c"ptr\00"
@.str9252 = constant [6 x i8] c"c_arr\00"
@.str9264 = constant [4 x i8] c"int\00"
@.str9268 = constant [4 x i8] c"len\00"
@.str9277 = constant [4 x i8] c"int\00"
@.str9281 = constant [4 x i8] c"cap\00"
@.str9292 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
@.str9305 = constant [2 x i8] c"w\00"
@.str9321 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str9330 = constant [1 x i8] c"\00"
@.str9334 = constant [32 x i8] c"tee debug.ll | llc - -o debug.s\00"
@.str9339 = constant [2 x i8] c"w\00"
@.str9351 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str9359 = constant [24 x i8] c"error on llc execution\0A\00"
@.str9363 = constant [17 x i8] c"cc debug.s -o %s\00"
@.str9369 = constant [2 x i8] c"w\00"
@.str9377 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str9385 = constant [22 x i8] c"error on cc execution\00"
@.str9388 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str9405 = constant [4 x i8] c"run\00"
@.str9410 = constant [1 x i8] c"\00"
@.str9414 = constant [5 x i8] c"./%s\00"
@.str9423 = constant [22 x i8] c"Usage: %s <filename>\0A\00"
@.str9441 = constant [8 x i8] c"compile\00"
@.str9446 = constant [4 x i8] c"run\00"
@.str9452 = constant [4 x i8] c"run\00"
