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
define i32 @m3$strcmp.i.cp.cp(i8* %.str1.arg, i8* %.str2.arg) {
%str1 = alloca i8*
store i8* %.str1.arg, i8** %str1
%str2 = alloca i8*
store i8* %.str2.arg, i8** %str2
%.tmp5 = load i8*, i8** %str1
%.tmp6 = icmp eq i8* %.tmp5, null
%.tmp7 = load i8*, i8** %str2
%.tmp8 = icmp eq i8* %.tmp7, null
%.tmp9 = or i1 %.tmp6, %.tmp8
br i1 %.tmp9, label %.if.true.10, label %.if.false.10
.if.true.10:
%.tmp11 = load i8*, i8** %str1
%.tmp12 = icmp eq i8* %.tmp11, null
%.tmp13 = load i8*, i8** %str2
%.tmp14 = icmp eq i8* %.tmp13, null
%.tmp15 = and i1 %.tmp12, %.tmp14
br i1 %.tmp15, label %.if.true.16, label %.if.false.16
.if.true.16:
ret i32 0
br label %.if.end.16
.if.false.16:
br label %.if.end.16
.if.end.16:
ret i32 1
br label %.if.end.10
.if.false.10:
br label %.if.end.10
.if.end.10:
%.tmp17 = load i8*, i8** %str1
%.tmp18 = load i8*, i8** %str2
%.tmp19 = call i32(i8*,i8*) @strcmp(i8* %.tmp17, i8* %.tmp18)
ret i32 %.tmp19
}
declare i32 @strncmp(i8*, i8*, i32)
declare i32 @strlen(i8*)
declare i8* @strcat(i8*, i8*)
declare i8* @strncat(i8*, i8*, i32)
define i1 @m3$is_letter.b.c(i8 %.c.arg) {
%c = alloca i8
store i8 %.c.arg, i8* %c
%.tmp20 = load i8, i8* %c
%.tmp21 = icmp sge i8 %.tmp20, 97
%.tmp22 = load i8, i8* %c
%.tmp23 = icmp sle i8 %.tmp22, 122
%.tmp24 = and i1 %.tmp21, %.tmp23
%.tmp25 = load i8, i8* %c
%.tmp26 = icmp sge i8 %.tmp25, 65
%.tmp27 = load i8, i8* %c
%.tmp28 = icmp sle i8 %.tmp27, 90
%.tmp29 = and i1 %.tmp26, %.tmp28
%.tmp30 = or i1 %.tmp24, %.tmp29
ret i1 %.tmp30
}
define i1 @m3$is_digit.b.c(i8 %.c.arg) {
%c = alloca i8
store i8 %.c.arg, i8* %c
%.tmp31 = load i8, i8* %c
%.tmp32 = icmp sge i8 %.tmp31, 48
%.tmp33 = load i8, i8* %c
%.tmp34 = icmp sle i8 %.tmp33, 57
%.tmp35 = and i1 %.tmp32, %.tmp34
ret i1 %.tmp35
}
define i1 @m3$is_whitespace.b.c(i8 %.c.arg) {
%c = alloca i8
store i8 %.c.arg, i8* %c
%.tmp36 = load i8, i8* %c
%.tmp37 = icmp eq i8 %.tmp36, 32
%.tmp38 = load i8, i8* %c
%.tmp39 = icmp eq i8 %.tmp38, 9
%.tmp40 = or i1 %.tmp37, %.tmp39
ret i1 %.tmp40
}
define i1 @m3$is_lower.b.cp(i8* %.string.arg) {
%string = alloca i8*
store i8* %.string.arg, i8** %string
%idx.42 = alloca i32
store i32 0, i32* %idx.42
br label %.for.start.41
.for.start.41:
%.tmp43 = load i32, i32* %idx.42
%.tmp44 = load i8*, i8** %string
%.tmp45 = getelementptr i8, i8* %.tmp44, i32 %.tmp43
%.tmp46 = load i8, i8* %.tmp45
%.tmp47 = icmp ne i8 %.tmp46, 0
br i1 %.tmp47, label %.for.continue.41, label %.for.end.41
.for.continue.41:
%.tmp48 = load i32, i32* %idx.42
%.tmp49 = load i8*, i8** %string
%.tmp50 = getelementptr i8, i8* %.tmp49, i32 %.tmp48
%.tmp51 = load i8, i8* %.tmp50
%c.52 = alloca i8
store i8 %.tmp51, i8* %c.52
%.tmp53 = load i8, i8* %c.52
%.tmp54 = icmp eq i8 %.tmp53, 95
br i1 %.tmp54, label %.if.true.55, label %.if.false.55
.if.true.55:
br label %.if.end.55
.if.false.55:
%.tmp56 = load i8, i8* %c.52
%.tmp57 = icmp slt i8 %.tmp56, 97
%.tmp58 = load i8, i8* %c.52
%.tmp59 = icmp sgt i8 %.tmp58, 122
%.tmp60 = or i1 %.tmp57, %.tmp59
br i1 %.tmp60, label %.if.true.61, label %.if.false.61
.if.true.61:
ret i1 0
br label %.if.end.61
.if.false.61:
br label %.if.end.61
.if.end.61:
br label %.if.end.55
.if.end.55:
%.tmp62 = load i32, i32* %idx.42
%.tmp63 = add i32 %.tmp62, 1
store i32 %.tmp63, i32* %idx.42
br label %.for.start.41
.for.end.41:
ret i1 1
}
define i1 @m3$is_upper.b.cp(i8* %.string.arg) {
%string = alloca i8*
store i8* %.string.arg, i8** %string
%idx.65 = alloca i32
store i32 0, i32* %idx.65
br label %.for.start.64
.for.start.64:
%.tmp66 = load i32, i32* %idx.65
%.tmp67 = load i8*, i8** %string
%.tmp68 = getelementptr i8, i8* %.tmp67, i32 %.tmp66
%.tmp69 = load i8, i8* %.tmp68
%.tmp70 = icmp ne i8 %.tmp69, 0
br i1 %.tmp70, label %.for.continue.64, label %.for.end.64
.for.continue.64:
%.tmp71 = load i32, i32* %idx.65
%.tmp72 = load i8*, i8** %string
%.tmp73 = getelementptr i8, i8* %.tmp72, i32 %.tmp71
%.tmp74 = load i8, i8* %.tmp73
%c.75 = alloca i8
store i8 %.tmp74, i8* %c.75
%.tmp76 = load i8, i8* %c.75
%.tmp77 = icmp eq i8 %.tmp76, 95
br i1 %.tmp77, label %.if.true.78, label %.if.false.78
.if.true.78:
br label %.if.end.78
.if.false.78:
%.tmp79 = load i8, i8* %c.75
%.tmp80 = icmp slt i8 %.tmp79, 65
%.tmp81 = load i8, i8* %c.75
%.tmp82 = icmp sgt i8 %.tmp81, 90
%.tmp83 = or i1 %.tmp80, %.tmp82
br i1 %.tmp83, label %.if.true.84, label %.if.false.84
.if.true.84:
ret i1 0
br label %.if.end.84
.if.false.84:
br label %.if.end.84
.if.end.84:
br label %.if.end.78
.if.end.78:
%.tmp85 = load i32, i32* %idx.65
%.tmp86 = add i32 %.tmp85, 1
store i32 %.tmp86, i32* %idx.65
br label %.for.start.64
.for.end.64:
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
%.tmp87 = load i1, i1* %condition
%.tmp88 = icmp ne i1 %.tmp87, 1
br i1 %.tmp88, label %.if.true.89, label %.if.false.89
.if.true.89:
%.tmp90 = load i8*, i8** %message
%.tmp91 = call i32(i8*) @strlen(i8* %.tmp90)
%size.92 = alloca i32
store i32 %.tmp91, i32* %size.92
%.tmp93 = load i8*, i8** %message
%.tmp94 = load i32, i32* %size.92
%.tmp95 = call i32(i32,i8*,i32) @write(i32 1, i8* %.tmp93, i32 %.tmp94)
call void(i32) @exit(i32 1)
br label %.if.end.89
.if.false.89:
br label %.if.end.89
.if.end.89:
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
%i.97 = alloca i32
store i32 0, i32* %i.97
br label %.for.start.96
.for.start.96:
%.tmp98 = load i32, i32* %i.97
%.tmp99 = load i32, i32* %n
%.tmp100 = icmp slt i32 %.tmp98, %.tmp99
br i1 %.tmp100, label %.for.continue.96, label %.for.end.96
.for.continue.96:
%.tmp101 = load i32, i32* %i.97
%.tmp102 = load i8*, i8** %buf
%.tmp103 = getelementptr i8, i8* %.tmp102, i32 %.tmp101
%.tmp104 = load i8, i8* %val
store i8 %.tmp104, i8* %.tmp103
%.tmp105 = load i32, i32* %i.97
%.tmp106 = add i32 %.tmp105, 1
store i32 %.tmp106, i32* %i.97
br label %.for.start.96
.for.end.96:
%.tmp107 = load i8*, i8** %buf
ret i8* %.tmp107
}
declare i32 @pipe(i32*)
declare %m0$.File.type* @popen(i8*, i8*)
declare i32 @pclose(%m0$.File.type*)
declare i32 @execvp(i8*, i8**)
define i8* @m2$dirname.cp.cp(i8* %.path.arg) {
%path = alloca i8*
store i8* %.path.arg, i8** %path
%.tmp108 = load i8*, i8** %path
%.tmp109 = icmp eq i8* %.tmp108, null
br i1 %.tmp109, label %.if.true.110, label %.if.false.110
.if.true.110:
%.tmp111 = bitcast ptr null to i8*
ret i8* %.tmp111
br label %.if.end.110
.if.false.110:
br label %.if.end.110
.if.end.110:
%end_idx.112 = alloca i32
store i32 0, i32* %end_idx.112
%stop.113 = alloca i1
store i1 0, i1* %stop.113
%.tmp115 = load i8*, i8** %path
%.tmp116 = call i32(i8*) @strlen(i8* %.tmp115)
%.tmp117 = sub i32 %.tmp116, 1
store i32 %.tmp117, i32* %end_idx.112
br label %.for.start.114
.for.start.114:
%.tmp118 = load i32, i32* %end_idx.112
%.tmp119 = icmp sgt i32 %.tmp118, 0
%.tmp120 = load i1, i1* %stop.113
%.tmp121 = icmp eq i1 %.tmp120, 0
%.tmp122 = and i1 %.tmp119, %.tmp121
br i1 %.tmp122, label %.for.continue.114, label %.for.end.114
.for.continue.114:
%.tmp123 = load i32, i32* %end_idx.112
%.tmp124 = load i8*, i8** %path
%.tmp125 = getelementptr i8, i8* %.tmp124, i32 %.tmp123
%.tmp126 = load i8, i8* %.tmp125
%.tmp127 = icmp eq i8 %.tmp126, 47
br i1 %.tmp127, label %.if.true.128, label %.if.false.128
.if.true.128:
store i1 1, i1* %stop.113
br label %.if.end.128
.if.false.128:
%.tmp129 = load i32, i32* %end_idx.112
%.tmp130 = sub i32 %.tmp129, 1
store i32 %.tmp130, i32* %end_idx.112
br label %.if.end.128
.if.end.128:
br label %.for.start.114
.for.end.114:
%.tmp131 = load i32, i32* %end_idx.112
%.tmp132 = add i32 %.tmp131, 1
%.tmp133 = call i8*(i32) @malloc(i32 %.tmp132)
%.tmp134 = bitcast i8* %.tmp133 to i8*
%path_dirname.135 = alloca i8*
store i8* %.tmp134, i8** %path_dirname.135
%i.137 = alloca i32
store i32 0, i32* %i.137
br label %.for.start.136
.for.start.136:
%.tmp138 = load i32, i32* %i.137
%.tmp139 = load i32, i32* %end_idx.112
%.tmp140 = icmp slt i32 %.tmp138, %.tmp139
br i1 %.tmp140, label %.for.continue.136, label %.for.end.136
.for.continue.136:
%.tmp141 = load i32, i32* %i.137
%.tmp142 = load i8*, i8** %path_dirname.135
%.tmp143 = getelementptr i8, i8* %.tmp142, i32 %.tmp141
%.tmp144 = load i32, i32* %i.137
%.tmp145 = load i8*, i8** %path
%.tmp146 = getelementptr i8, i8* %.tmp145, i32 %.tmp144
%.tmp147 = load i8, i8* %.tmp146
store i8 %.tmp147, i8* %.tmp143
%.tmp148 = load i32, i32* %i.137
%.tmp149 = add i32 %.tmp148, 1
store i32 %.tmp149, i32* %i.137
br label %.for.start.136
.for.end.136:
%.tmp150 = load i32, i32* %end_idx.112
%.tmp151 = load i8*, i8** %path_dirname.135
%.tmp152 = getelementptr i8, i8* %.tmp151, i32 %.tmp150
store i8 0, i8* %.tmp152
%.tmp153 = load i8*, i8** %path_dirname.135
ret i8* %.tmp153
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
%S.154 = alloca {i8*,i8*}
%.tmp155 = getelementptr {i8*,i8*}, {i8*,i8*}* %S.154, i32 0, i32 0
store i8* null, i8** %.tmp155
%.tmp156 = getelementptr {i8*,i8*}, {i8*,i8*}* %S.154, i32 0, i32 1
store i8* null, i8** %.tmp156
%.tmp157 = load i8*, i8** %path
%.tmp158 = call i32(i8*) @strlen(i8* %.tmp157)
%str_length.159 = alloca i32
store i32 %.tmp158, i32* %str_length.159
%.tmp160 = load i32, i32* %str_length.159
%ext_pos.161 = alloca i32
store i32 %.tmp160, i32* %ext_pos.161
%.tmp163 = load i32, i32* %str_length.159
%.tmp164 = sub i32 %.tmp163, 1
%i.165 = alloca i32
store i32 %.tmp164, i32* %i.165
br label %.for.start.162
.for.start.162:
%.tmp166 = load i32, i32* %i.165
%.tmp167 = icmp sgt i32 %.tmp166, 0
br i1 %.tmp167, label %.for.continue.162, label %.for.end.162
.for.continue.162:
%.tmp168 = load i32, i32* %i.165
%.tmp169 = load i8*, i8** %path
%.tmp170 = getelementptr i8, i8* %.tmp169, i32 %.tmp168
%.tmp171 = load i8, i8* %.tmp170
%.tmp172 = icmp eq i8 %.tmp171, 46
br i1 %.tmp172, label %.if.true.173, label %.if.false.173
.if.true.173:
%.tmp174 = load i32, i32* %i.165
store i32 %.tmp174, i32* %ext_pos.161
br label %.for.end.162
br label %.if.end.173
.if.false.173:
%.tmp175 = load i32, i32* %i.165
%.tmp176 = load i8*, i8** %path
%.tmp177 = getelementptr i8, i8* %.tmp176, i32 %.tmp175
%.tmp178 = load i8, i8* %.tmp177
%.tmp179 = icmp eq i8 %.tmp178, 47
br i1 %.tmp179, label %.if.true.180, label %.if.false.180
.if.true.180:
br label %.for.end.162
br label %.if.end.180
.if.false.180:
br label %.if.end.180
.if.end.180:
br label %.if.end.173
.if.end.173:
%.tmp181 = load i32, i32* %i.165
%.tmp182 = sub i32 %.tmp181, 1
store i32 %.tmp182, i32* %i.165
br label %.for.start.162
.for.end.162:
%.tmp183 = getelementptr {i8*,i8*}, {i8*,i8*}* %S.154, i32 0, i32 0
%.tmp184 = load i32, i32* %ext_pos.161
%.tmp185 = add i32 %.tmp184, 1
%.tmp186 = call i8*(i32) @malloc(i32 %.tmp185)
store i8* %.tmp186, i8** %.tmp183
%.tmp187 = getelementptr {i8*,i8*}, {i8*,i8*}* %S.154, i32 0, i32 0
%.tmp188 = load i8*, i8** %.tmp187
%.tmp189 = load i8*, i8** %path
%.tmp190 = load i32, i32* %ext_pos.161
%.tmp191 = call i8*(i8*,i8*,i32) @strncpy(i8* %.tmp188, i8* %.tmp189, i32 %.tmp190)
%.tmp192 = getelementptr {i8*,i8*}, {i8*,i8*}* %S.154, i32 0, i32 0
%.tmp193 = load i32, i32* %ext_pos.161
%.tmp194 = load i8*, i8** %.tmp192
%.tmp195 = getelementptr i8, i8* %.tmp194, i32 %.tmp193
store i8 0, i8* %.tmp195
%.tmp196 = getelementptr {i8*,i8*}, {i8*,i8*}* %S.154, i32 0, i32 1
%.tmp197 = load i32, i32* %str_length.159
%.tmp198 = load i32, i32* %ext_pos.161
%.tmp199 = sub i32 %.tmp197, %.tmp198
%.tmp200 = call i8*(i32) @malloc(i32 %.tmp199)
store i8* %.tmp200, i8** %.tmp196
%.tmp202 = load i32, i32* %ext_pos.161
%i.203 = alloca i32
store i32 %.tmp202, i32* %i.203
br label %.for.start.201
.for.start.201:
%.tmp204 = load i32, i32* %i.203
%.tmp205 = load i32, i32* %str_length.159
%.tmp206 = icmp slt i32 %.tmp204, %.tmp205
br i1 %.tmp206, label %.for.continue.201, label %.for.end.201
.for.continue.201:
%.tmp207 = getelementptr {i8*,i8*}, {i8*,i8*}* %S.154, i32 0, i32 1
%.tmp208 = load i32, i32* %i.203
%.tmp209 = load i32, i32* %ext_pos.161
%.tmp210 = sub i32 %.tmp208, %.tmp209
%.tmp211 = load i8*, i8** %.tmp207
%.tmp212 = getelementptr i8, i8* %.tmp211, i32 %.tmp210
%.tmp213 = load i32, i32* %i.203
%.tmp214 = load i8*, i8** %path
%.tmp215 = getelementptr i8, i8* %.tmp214, i32 %.tmp213
%.tmp216 = load i8, i8* %.tmp215
store i8 %.tmp216, i8* %.tmp212
%.tmp217 = load i32, i32* %i.203
%.tmp218 = add i32 %.tmp217, 1
store i32 %.tmp218, i32* %i.203
br label %.for.start.201
.for.end.201:
%.tmp219 = load {i8*,i8*}, {i8*,i8*}* %S.154
ret {i8*,i8*} %.tmp219
}
define i8* @m1$readall.cp.i(i32 %.fd.arg) {
%fd = alloca i32
store i32 %.fd.arg, i32* %fd
%buf_len.220 = alloca i32
store i32 1024, i32* %buf_len.220
%.tmp221 = load i32, i32* %buf_len.220
%.tmp222 = call i8*(i32) @malloc(i32 %.tmp221)
%buf.223 = alloca i8*
store i8* %.tmp222, i8** %buf.223
%content_len.224 = alloca i32
store i32 0, i32* %content_len.224
%.tmp225 = call i8*(i32) @malloc(i32 1)
%content.226 = alloca i8*
store i8* %.tmp225, i8** %content.226
%.tmp227 = load i8*, i8** %content.226
%.tmp228 = getelementptr i8, i8* %.tmp227, i32 0
store i8 0, i8* %.tmp228
%.tmp229 = load i32, i32* %fd
%.tmp230 = load i8*, i8** %buf.223
%.tmp231 = load i32, i32* %buf_len.220
%.tmp232 = call i32(i32,i8*,i32) @read(i32 %.tmp229, i8* %.tmp230, i32 %.tmp231)
%read_bytes.233 = alloca i32
store i32 %.tmp232, i32* %read_bytes.233
br label %.for.start.234
.for.start.234:
%.tmp235 = load i32, i32* %read_bytes.233
%.tmp236 = icmp sgt i32 %.tmp235, 0
br i1 %.tmp236, label %.for.continue.234, label %.for.end.234
.for.continue.234:
%.tmp237 = load i8*, i8** %content.226
%.tmp238 = load i32, i32* %content_len.224
%.tmp239 = load i32, i32* %read_bytes.233
%.tmp240 = add i32 %.tmp238, %.tmp239
%.tmp241 = call i8*(i8*,i32) @realloc(i8* %.tmp237, i32 %.tmp240)
store i8* %.tmp241, i8** %content.226
%i.243 = alloca i32
store i32 0, i32* %i.243
br label %.for.start.242
.for.start.242:
%.tmp244 = load i32, i32* %i.243
%.tmp245 = load i32, i32* %read_bytes.233
%.tmp246 = icmp slt i32 %.tmp244, %.tmp245
br i1 %.tmp246, label %.for.continue.242, label %.for.end.242
.for.continue.242:
%.tmp247 = load i32, i32* %i.243
%.tmp248 = load i32, i32* %content_len.224
%.tmp249 = add i32 %.tmp247, %.tmp248
%.tmp250 = load i8*, i8** %content.226
%.tmp251 = getelementptr i8, i8* %.tmp250, i32 %.tmp249
%.tmp252 = load i32, i32* %i.243
%.tmp253 = load i8*, i8** %buf.223
%.tmp254 = getelementptr i8, i8* %.tmp253, i32 %.tmp252
%.tmp255 = load i8, i8* %.tmp254
store i8 %.tmp255, i8* %.tmp251
%.tmp256 = load i32, i32* %i.243
%.tmp257 = add i32 %.tmp256, 1
store i32 %.tmp257, i32* %i.243
br label %.for.start.242
.for.end.242:
%.tmp258 = load i32, i32* %content_len.224
%.tmp259 = load i32, i32* %read_bytes.233
%.tmp260 = add i32 %.tmp258, %.tmp259
store i32 %.tmp260, i32* %content_len.224
%.tmp261 = load i32, i32* %fd
%.tmp262 = load i8*, i8** %buf.223
%.tmp263 = load i32, i32* %buf_len.220
%.tmp264 = call i32(i32,i8*,i32) @read(i32 %.tmp261, i8* %.tmp262, i32 %.tmp263)
store i32 %.tmp264, i32* %read_bytes.233
br label %.for.start.234
.for.end.234:
%.tmp265 = load i32, i32* %content_len.224
%.tmp266 = sub i32 %.tmp265, 1
%.tmp267 = load i8*, i8** %content.226
%.tmp268 = getelementptr i8, i8* %.tmp267, i32 %.tmp266
store i8 0, i8* %.tmp268
%.tmp269 = load i8*, i8** %buf.223
call void(i8*) @free(i8* %.tmp269)
%.tmp270 = load i8*, i8** %content.226
ret i8* %.tmp270
}
define void @m1$copy.v.i.i(i32 %.dest.arg, i32 %.src.arg) {
%dest = alloca i32
store i32 %.dest.arg, i32* %dest
%src = alloca i32
store i32 %.src.arg, i32* %src
%buf_size.271 = alloca i32
store i32 4096, i32* %buf_size.271
%.tmp272 = call i8*(i32) @malloc(i32 4096)
%buf.273 = alloca i8*
store i8* %.tmp272, i8** %buf.273
%to_write.274 = alloca i32
store i32 1, i32* %to_write.274
br label %.for.start.275
.for.start.275:
%.tmp276 = load i32, i32* %to_write.274
%.tmp277 = icmp sgt i32 %.tmp276, 0
br i1 %.tmp277, label %.for.continue.275, label %.for.end.275
.for.continue.275:
%.tmp278 = load i32, i32* %src
%.tmp279 = load i8*, i8** %buf.273
%.tmp280 = load i32, i32* %buf_size.271
%.tmp281 = call i32(i32,i8*,i32) @read(i32 %.tmp278, i8* %.tmp279, i32 %.tmp280)
store i32 %.tmp281, i32* %to_write.274
%.tmp282 = load i32, i32* %dest
%.tmp283 = load i8*, i8** %buf.273
%.tmp284 = load i32, i32* %to_write.274
%.tmp285 = call i32(i32,i8*,i32) @write(i32 %.tmp282, i8* %.tmp283, i32 %.tmp284)
br label %.for.start.275
.for.end.275:
ret void
}
define %m0$.File.type* @m1$str_as_file.m0$.File.typep.cp(i8* %.file_content.arg) {
%file_content = alloca i8*
store i8* %.file_content.arg, i8** %file_content
%.tmp286 = call i8*(i32) @malloc(i32 16)
%.tmp287 = bitcast i8* %.tmp286 to i32*
%pp.288 = alloca i32*
store i32* %.tmp287, i32** %pp.288
%.tmp289 = load i32*, i32** %pp.288
%.tmp290 = call i32(i32*) @pipe(i32* %.tmp289)
%.tmp291 = load i32, i32* @STDOUT
%.tmp292 = load i32*, i32** %pp.288
%.tmp293 = getelementptr i32, i32* %.tmp292, i32 %.tmp291
%.tmp294 = load i32, i32* %.tmp293
%.tmp295 = load i8*, i8** %file_content
%.tmp296 = load i8*, i8** %file_content
%.tmp297 = call i32(i8*) @strlen(i8* %.tmp296)
%.tmp298 = call i32(i32,i8*,i32) @write(i32 %.tmp294, i8* %.tmp295, i32 %.tmp297)
%.tmp299 = load i32, i32* @STDOUT
%.tmp300 = load i32*, i32** %pp.288
%.tmp301 = getelementptr i32, i32* %.tmp300, i32 %.tmp299
%.tmp302 = load i32, i32* %.tmp301
%.tmp303 = call i32(i32) @close(i32 %.tmp302)
%.tmp304 = load i32, i32* @STDIN
%.tmp305 = load i32*, i32** %pp.288
%.tmp306 = getelementptr i32, i32* %.tmp305, i32 %.tmp304
%.tmp307 = load i32, i32* %.tmp306
%.tmp309 = getelementptr [2 x i8], [2 x i8]*@.str308, i32 0, i32 0
%.tmp310 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp307, i8* %.tmp309)
ret %m0$.File.type* %.tmp310
}
%m314$.PeekerInfo.type = type {i32,i32,i32,i32,i8,i1,i8*}
@EOF = constant i32 0
define i8 @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.p.arg) {
%p = alloca %m314$.PeekerInfo.type*
store %m314$.PeekerInfo.type* %.p.arg, %m314$.PeekerInfo.type** %p
%.tmp315 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp316 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp315, i32 0, i32 5
%.tmp317 = load i1, i1* %.tmp316
br i1 %.tmp317, label %.if.true.318, label %.if.false.318
.if.true.318:
ret i8 0
br label %.if.end.318
.if.false.318:
br label %.if.end.318
.if.end.318:
%.tmp319 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp320 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp319, i32 0, i32 4
%.tmp321 = load i8, i8* %.tmp320
%.tmp322 = icmp eq i8 %.tmp321, 10
br i1 %.tmp322, label %.if.true.323, label %.if.false.323
.if.true.323:
%.tmp324 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp325 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp324, i32 0, i32 2
%.tmp326 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp327 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp326, i32 0, i32 2
%.tmp328 = load i32, i32* %.tmp327
%.tmp329 = add i32 %.tmp328, 1
store i32 %.tmp329, i32* %.tmp325
%.tmp330 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp331 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp330, i32 0, i32 3
store i32 0, i32* %.tmp331
br label %.if.end.323
.if.false.323:
br label %.if.end.323
.if.end.323:
%.tmp332 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp333 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp332, i32 0, i32 1
%.tmp334 = load i32, i32* %.tmp333
%.tmp335 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp336 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp335, i32 0, i32 4
%.tmp337 = getelementptr i8, i8* %.tmp336, i32 0
%.tmp338 = call i32(i32,i8*,i32) @read(i32 %.tmp334, i8* %.tmp337, i32 1)
%.tmp339 = icmp eq i32 %.tmp338, 0
br i1 %.tmp339, label %.if.true.340, label %.if.false.340
.if.true.340:
%.tmp341 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp342 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp341, i32 0, i32 4
store i8 0, i8* %.tmp342
%.tmp343 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp344 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp343, i32 0, i32 5
store i1 1, i1* %.tmp344
%.tmp345 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp346 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp345, i32 0, i32 4
%.tmp347 = load i8, i8* %.tmp346
ret i8 %.tmp347
br label %.if.end.340
.if.false.340:
br label %.if.end.340
.if.end.340:
%.tmp348 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp349 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp348, i32 0, i32 3
%.tmp350 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp351 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp350, i32 0, i32 3
%.tmp352 = load i32, i32* %.tmp351
%.tmp353 = add i32 %.tmp352, 1
store i32 %.tmp353, i32* %.tmp349
%.tmp354 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp355 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp354, i32 0, i32 0
%.tmp356 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp357 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp356, i32 0, i32 0
%.tmp358 = load i32, i32* %.tmp357
%.tmp359 = add i32 %.tmp358, 1
store i32 %.tmp359, i32* %.tmp355
%.tmp360 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp361 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp360, i32 0, i32 4
%.tmp362 = load i8, i8* %.tmp361
ret i8 %.tmp362
}
define void @m314$seek.v.m314$.PeekerInfo.typep.i(%m314$.PeekerInfo.type* %.p.arg, i32 %.pos.arg) {
%p = alloca %m314$.PeekerInfo.type*
store %m314$.PeekerInfo.type* %.p.arg, %m314$.PeekerInfo.type** %p
%pos = alloca i32
store i32 %.pos.arg, i32* %pos
%.tmp363 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp364 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp363, i32 0, i32 1
%.tmp365 = load i32, i32* %.tmp364
%.tmp366 = load i32, i32* %pos
%.tmp367 = load i32, i32* @SEEK_SET
%.tmp368 = call i32(i32,i32,i32) @lseek(i32 %.tmp365, i32 %.tmp366, i32 %.tmp367)
ret void
}
define %m314$.PeekerInfo.type* @m314$new.m314$.PeekerInfo.typep.i(i32 %.fd.arg) {
%fd = alloca i32
store i32 %.fd.arg, i32* %fd
%.tmp369 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* null, i32 1
%.tmp370 = ptrtoint %m314$.PeekerInfo.type* %.tmp369 to i32
%.tmp371 = call i8*(i32) @malloc(i32 %.tmp370)
%.tmp372 = bitcast i8* %.tmp371 to %m314$.PeekerInfo.type*
%p.373 = alloca %m314$.PeekerInfo.type*
store %m314$.PeekerInfo.type* %.tmp372, %m314$.PeekerInfo.type** %p.373
%.tmp374 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p.373
%.tmp375 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp374, i32 0, i32 0
store i32 0, i32* %.tmp375
%.tmp376 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p.373
%.tmp377 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp376, i32 0, i32 2
store i32 1, i32* %.tmp377
%.tmp378 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p.373
%.tmp379 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp378, i32 0, i32 3
store i32 0, i32* %.tmp379
%.tmp380 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p.373
%.tmp381 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp380, i32 0, i32 1
%.tmp382 = load i32, i32* %fd
store i32 %.tmp382, i32* %.tmp381
%.tmp383 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p.373
%.tmp384 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp383, i32 0, i32 4
store i8 0, i8* %.tmp384
%.tmp385 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p.373
%.tmp386 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp385, i32 0, i32 5
store i1 0, i1* %.tmp386
%.tmp387 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p.373
%.tmp388 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp387, i32 0, i32 6
%.tmp390 = getelementptr [1 x i8], [1 x i8]*@.str389, i32 0, i32 0
store i8* %.tmp390, i8** %.tmp388
%.tmp391 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p.373
ret %m314$.PeekerInfo.type* %.tmp391
}
%m313$.Token.type = type {i8*,i8*,i32,i32,i8*,%m313$.Token.type*,%m313$.Token.type*}
%m313$.ParseCtx.type = type {i8*,i32,i32,%m313$.Token.type*,%m313$.Token.type*}
define %m313$.Token.type* @m313$push_token.m313$.Token.typep.m313$.ParseCtx.typep.cp.cp(%m313$.ParseCtx.type* %.c.arg, i8* %.type.arg, i8* %.value.arg) {
%c = alloca %m313$.ParseCtx.type*
store %m313$.ParseCtx.type* %.c.arg, %m313$.ParseCtx.type** %c
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp392 = getelementptr %m313$.Token.type, %m313$.Token.type* null, i32 1
%.tmp393 = ptrtoint %m313$.Token.type* %.tmp392 to i32
%.tmp394 = call i8*(i32) @malloc(i32 %.tmp393)
%.tmp395 = bitcast i8* %.tmp394 to %m313$.Token.type*
%root.396 = alloca %m313$.Token.type*
store %m313$.Token.type* %.tmp395, %m313$.Token.type** %root.396
%.tmp397 = load %m313$.Token.type*, %m313$.Token.type** %root.396
%.tmp398 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp397, i32 0, i32 0
%.tmp399 = load i8*, i8** %type
store i8* %.tmp399, i8** %.tmp398
%.tmp400 = load %m313$.Token.type*, %m313$.Token.type** %root.396
%.tmp401 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp400, i32 0, i32 1
%.tmp402 = load i8*, i8** %value
store i8* %.tmp402, i8** %.tmp401
%.tmp403 = load %m313$.Token.type*, %m313$.Token.type** %root.396
%.tmp404 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp403, i32 0, i32 4
%.tmp405 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %c
%.tmp406 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp405, i32 0, i32 0
%.tmp407 = load i8*, i8** %.tmp406
store i8* %.tmp407, i8** %.tmp404
%.tmp408 = load %m313$.Token.type*, %m313$.Token.type** %root.396
%.tmp409 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp408, i32 0, i32 2
%.tmp410 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %c
%.tmp411 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp410, i32 0, i32 1
%.tmp412 = load i32, i32* %.tmp411
store i32 %.tmp412, i32* %.tmp409
%.tmp413 = load %m313$.Token.type*, %m313$.Token.type** %root.396
%.tmp414 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp413, i32 0, i32 3
%.tmp415 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %c
%.tmp416 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp415, i32 0, i32 2
%.tmp417 = load i32, i32* %.tmp416
store i32 %.tmp417, i32* %.tmp414
%.tmp418 = load %m313$.Token.type*, %m313$.Token.type** %root.396
%.tmp419 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp418, i32 0, i32 6
%.tmp420 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %c
%.tmp421 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp420, i32 0, i32 4
%.tmp422 = load %m313$.Token.type*, %m313$.Token.type** %.tmp421
store %m313$.Token.type* %.tmp422, %m313$.Token.type** %.tmp419
%.tmp423 = load %m313$.Token.type*, %m313$.Token.type** %root.396
%.tmp424 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp423, i32 0, i32 5
store %m313$.Token.type* null, %m313$.Token.type** %.tmp424
%.tmp425 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %c
%.tmp426 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp425, i32 0, i32 4
%.tmp427 = load %m313$.Token.type*, %m313$.Token.type** %.tmp426
%.tmp428 = icmp ne %m313$.Token.type* %.tmp427, null
br i1 %.tmp428, label %.if.true.429, label %.if.false.429
.if.true.429:
%.tmp430 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %c
%.tmp431 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp430, i32 0, i32 4
%.tmp432 = load %m313$.Token.type*, %m313$.Token.type** %.tmp431
%.tmp433 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp432, i32 0, i32 5
%.tmp434 = load %m313$.Token.type*, %m313$.Token.type** %root.396
store %m313$.Token.type* %.tmp434, %m313$.Token.type** %.tmp433
br label %.if.end.429
.if.false.429:
br label %.if.end.429
.if.end.429:
%.tmp435 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %c
%.tmp436 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp435, i32 0, i32 4
%.tmp437 = load %m313$.Token.type*, %m313$.Token.type** %root.396
store %m313$.Token.type* %.tmp437, %m313$.Token.type** %.tmp436
%.tmp438 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %c
%.tmp439 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp438, i32 0, i32 3
%.tmp440 = load %m313$.Token.type*, %m313$.Token.type** %.tmp439
%.tmp441 = icmp eq %m313$.Token.type* %.tmp440, null
br i1 %.tmp441, label %.if.true.442, label %.if.false.442
.if.true.442:
%.tmp443 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %c
%.tmp444 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp443, i32 0, i32 3
%.tmp445 = load %m313$.Token.type*, %m313$.Token.type** %root.396
store %m313$.Token.type* %.tmp445, %m313$.Token.type** %.tmp444
br label %.if.end.442
.if.false.442:
br label %.if.end.442
.if.end.442:
%.tmp446 = load %m313$.Token.type*, %m313$.Token.type** %root.396
ret %m313$.Token.type* %.tmp446
}
define %m313$.Token.type* @m313$tokenize.m313$.Token.typep.m314$.PeekerInfo.typep.b(%m314$.PeekerInfo.type* %.p.arg, i1 %.keep_comments.arg) {
%p = alloca %m314$.PeekerInfo.type*
store %m314$.PeekerInfo.type* %.p.arg, %m314$.PeekerInfo.type** %p
%keep_comments = alloca i1
store i1 %.keep_comments.arg, i1* %keep_comments
%.tmp447 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* null, i32 1
%.tmp448 = ptrtoint %m313$.ParseCtx.type* %.tmp447 to i32
%.tmp449 = call i8*(i32) @malloc(i32 %.tmp448)
%.tmp450 = bitcast i8* %.tmp449 to %m313$.ParseCtx.type*
%ctx.451 = alloca %m313$.ParseCtx.type*
store %m313$.ParseCtx.type* %.tmp450, %m313$.ParseCtx.type** %ctx.451
%.tmp452 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp453 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp452, i32 0, i32 0
%.tmp454 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp455 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp454, i32 0, i32 6
%.tmp456 = load i8*, i8** %.tmp455
store i8* %.tmp456, i8** %.tmp453
%.tmp457 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp458 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp457, i32 0, i32 3
store %m313$.Token.type* null, %m313$.Token.type** %.tmp458
%.tmp459 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp460 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp459, i32 0, i32 4
store %m313$.Token.type* null, %m313$.Token.type** %.tmp460
%max_token_size.461 = alloca i32
store i32 128, i32* %max_token_size.461
%.tmp462 = bitcast ptr null to i8*
%buf.463 = alloca i8*
store i8* %.tmp462, i8** %buf.463
%idx.464 = alloca i32
store i32 0, i32* %idx.464
%.tmp465 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp466 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp465)
%c.467 = alloca i8
store i8 %.tmp466, i8* %c.467
br label %.for.start.468
.for.start.468:
%.tmp469 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp470 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp469, i32 0, i32 5
%.tmp471 = load i1, i1* %.tmp470
%.tmp472 = icmp eq i1 %.tmp471, 0
br i1 %.tmp472, label %.for.continue.468, label %.for.end.468
.for.continue.468:
%.tmp473 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp474 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp473, i32 0, i32 1
%.tmp475 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp476 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp475, i32 0, i32 2
%.tmp477 = load i32, i32* %.tmp476
store i32 %.tmp477, i32* %.tmp474
%.tmp478 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp479 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp478, i32 0, i32 2
%.tmp480 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp481 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp480, i32 0, i32 3
%.tmp482 = load i32, i32* %.tmp481
store i32 %.tmp482, i32* %.tmp479
%.tmp483 = load i8, i8* %c.467
%.tmp484 = icmp eq i8 %.tmp483, 0
br i1 %.tmp484, label %.if.true.485, label %.if.false.485
.if.true.485:
%.tmp486 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp487 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp486)
store i8 %.tmp487, i8* %c.467
br label %.if.end.485
.if.false.485:
%.tmp488 = load i8, i8* %c.467
%.tmp489 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp488)
br i1 %.tmp489, label %.if.true.490, label %.if.false.490
.if.true.490:
%.tmp491 = load i32, i32* %max_token_size.461
%.tmp492 = call i8*(i32) @malloc(i32 %.tmp491)
store i8* %.tmp492, i8** %buf.463
store i32 0, i32* %idx.464
br label %.for.start.493
.for.start.493:
%.tmp494 = load i8, i8* %c.467
%.tmp495 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp494)
br i1 %.tmp495, label %.for.continue.493, label %.for.end.493
.for.continue.493:
%.tmp496 = load i32, i32* %idx.464
%.tmp497 = load i8*, i8** %buf.463
%.tmp498 = getelementptr i8, i8* %.tmp497, i32 %.tmp496
%.tmp499 = load i8, i8* %c.467
store i8 %.tmp499, i8* %.tmp498
%.tmp500 = load i32, i32* %idx.464
%.tmp501 = add i32 %.tmp500, 1
store i32 %.tmp501, i32* %idx.464
%.tmp502 = load i32, i32* %idx.464
%.tmp503 = load i32, i32* %max_token_size.461
%.tmp504 = icmp slt i32 %.tmp502, %.tmp503
%.tmp506 = getelementptr [16 x i8], [16 x i8]*@.str505, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp504, i8* %.tmp506)
%.tmp507 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp508 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp507)
store i8 %.tmp508, i8* %c.467
br label %.for.start.493
.for.end.493:
%.tmp509 = load i32, i32* %idx.464
%.tmp510 = load i8*, i8** %buf.463
%.tmp511 = getelementptr i8, i8* %.tmp510, i32 %.tmp509
store i8 0, i8* %.tmp511
%.tmp512 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp514 = getelementptr [7 x i8], [7 x i8]*@.str513, i32 0, i32 0
%.tmp515 = load i8*, i8** %buf.463
%.tmp516 = call %m313$.Token.type*(%m313$.ParseCtx.type*,i8*,i8*) @m313$push_token.m313$.Token.typep.m313$.ParseCtx.typep.cp.cp(%m313$.ParseCtx.type* %.tmp512, i8* %.tmp514, i8* %.tmp515)
br label %.if.end.490
.if.false.490:
%.tmp517 = load i8, i8* %c.467
%.tmp518 = call i1(i8) @m3$is_letter.b.c(i8 %.tmp517)
%.tmp519 = load i8, i8* %c.467
%.tmp520 = icmp eq i8 %.tmp519, 95
%.tmp521 = or i1 %.tmp518, %.tmp520
br i1 %.tmp521, label %.if.true.522, label %.if.false.522
.if.true.522:
%.tmp523 = load i32, i32* %max_token_size.461
%.tmp524 = call i8*(i32) @malloc(i32 %.tmp523)
store i8* %.tmp524, i8** %buf.463
store i32 0, i32* %idx.464
br label %.for.start.525
.for.start.525:
%.tmp526 = load i8, i8* %c.467
%.tmp527 = call i1(i8) @m3$is_letter.b.c(i8 %.tmp526)
%.tmp528 = load i8, i8* %c.467
%.tmp529 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp528)
%.tmp530 = or i1 %.tmp527, %.tmp529
%.tmp531 = load i8, i8* %c.467
%.tmp532 = icmp eq i8 %.tmp531, 95
%.tmp533 = or i1 %.tmp530, %.tmp532
br i1 %.tmp533, label %.for.continue.525, label %.for.end.525
.for.continue.525:
%.tmp534 = load i32, i32* %idx.464
%.tmp535 = load i8*, i8** %buf.463
%.tmp536 = getelementptr i8, i8* %.tmp535, i32 %.tmp534
%.tmp537 = load i8, i8* %c.467
store i8 %.tmp537, i8* %.tmp536
%.tmp538 = load i32, i32* %idx.464
%.tmp539 = add i32 %.tmp538, 1
store i32 %.tmp539, i32* %idx.464
%.tmp540 = load i32, i32* %idx.464
%.tmp541 = load i32, i32* %max_token_size.461
%.tmp542 = icmp slt i32 %.tmp540, %.tmp541
%.tmp544 = getelementptr [15 x i8], [15 x i8]*@.str543, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp542, i8* %.tmp544)
%.tmp545 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp546 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp545)
store i8 %.tmp546, i8* %c.467
br label %.for.start.525
.for.end.525:
%.tmp547 = load i32, i32* %idx.464
%.tmp548 = load i8*, i8** %buf.463
%.tmp549 = getelementptr i8, i8* %.tmp548, i32 %.tmp547
store i8 0, i8* %.tmp549
%.tmp550 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp552 = getelementptr [5 x i8], [5 x i8]*@.str551, i32 0, i32 0
%.tmp553 = load i8*, i8** %buf.463
%.tmp554 = call %m313$.Token.type*(%m313$.ParseCtx.type*,i8*,i8*) @m313$push_token.m313$.Token.typep.m313$.ParseCtx.typep.cp.cp(%m313$.ParseCtx.type* %.tmp550, i8* %.tmp552, i8* %.tmp553)
br label %.if.end.522
.if.false.522:
%.tmp555 = load i8, i8* %c.467
%.tmp556 = call i1(i8) @m3$is_whitespace.b.c(i8 %.tmp555)
br i1 %.tmp556, label %.if.true.557, label %.if.false.557
.if.true.557:
%.tmp558 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp559 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp558)
store i8 %.tmp559, i8* %c.467
br label %.if.end.557
.if.false.557:
%.tmp560 = load i8, i8* %c.467
%.tmp561 = icmp eq i8 %.tmp560, 34
%.tmp562 = load i8, i8* %c.467
%.tmp563 = icmp eq i8 %.tmp562, 96
%.tmp564 = or i1 %.tmp561, %.tmp563
br i1 %.tmp564, label %.if.true.565, label %.if.false.565
.if.true.565:
%.tmp566 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp567 = load i8, i8* %c.467
%.tmp568 = call i8*(%m314$.PeekerInfo.type*,i8) @m313$read_string.cp.m314$.PeekerInfo.typep.c(%m314$.PeekerInfo.type* %.tmp566, i8 %.tmp567)
store i8* %.tmp568, i8** %buf.463
%.tmp569 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp570 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp569)
store i8 %.tmp570, i8* %c.467
%.tmp571 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp573 = getelementptr [7 x i8], [7 x i8]*@.str572, i32 0, i32 0
%.tmp574 = load i8*, i8** %buf.463
%.tmp575 = call %m313$.Token.type*(%m313$.ParseCtx.type*,i8*,i8*) @m313$push_token.m313$.Token.typep.m313$.ParseCtx.typep.cp.cp(%m313$.ParseCtx.type* %.tmp571, i8* %.tmp573, i8* %.tmp574)
br label %.if.end.565
.if.false.565:
%.tmp576 = load i8, i8* %c.467
%.tmp577 = icmp eq i8 %.tmp576, 39
br i1 %.tmp577, label %.if.true.578, label %.if.false.578
.if.true.578:
%.tmp579 = load i32, i32* %max_token_size.461
%.tmp580 = call i8*(i32) @malloc(i32 %.tmp579)
store i8* %.tmp580, i8** %buf.463
%.tmp581 = load i8*, i8** %buf.463
%.tmp582 = getelementptr i8, i8* %.tmp581, i32 0
%.tmp583 = load i8, i8* %c.467
store i8 %.tmp583, i8* %.tmp582
%.tmp584 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp585 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp584)
store i8 %.tmp585, i8* %c.467
store i32 1, i32* %idx.464
br label %.for.start.586
.for.start.586:
%.tmp587 = load i8, i8* %c.467
%.tmp588 = icmp ne i8 %.tmp587, 39
br i1 %.tmp588, label %.for.continue.586, label %.for.end.586
.for.continue.586:
%.tmp589 = load i32, i32* %idx.464
%.tmp590 = load i32, i32* %max_token_size.461
%.tmp591 = sub i32 %.tmp590, 2
%.tmp592 = icmp slt i32 %.tmp589, %.tmp591
%.tmp594 = getelementptr [15 x i8], [15 x i8]*@.str593, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp592, i8* %.tmp594)
%.tmp595 = load i32, i32* %idx.464
%.tmp596 = load i8*, i8** %buf.463
%.tmp597 = getelementptr i8, i8* %.tmp596, i32 %.tmp595
%.tmp598 = load i8, i8* %c.467
store i8 %.tmp598, i8* %.tmp597
%.tmp599 = load i32, i32* %idx.464
%.tmp600 = add i32 %.tmp599, 1
store i32 %.tmp600, i32* %idx.464
%.tmp601 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp602 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp601)
store i8 %.tmp602, i8* %c.467
br label %.for.start.586
.for.end.586:
%.tmp603 = load i32, i32* %idx.464
%.tmp604 = load i8*, i8** %buf.463
%.tmp605 = getelementptr i8, i8* %.tmp604, i32 %.tmp603
%.tmp606 = load i8, i8* %c.467
store i8 %.tmp606, i8* %.tmp605
%.tmp607 = load i32, i32* %idx.464
%.tmp608 = add i32 %.tmp607, 1
%.tmp609 = load i8*, i8** %buf.463
%.tmp610 = getelementptr i8, i8* %.tmp609, i32 %.tmp608
store i8 0, i8* %.tmp610
%.tmp611 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp612 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp611)
store i8 %.tmp612, i8* %c.467
%.tmp613 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp615 = getelementptr [4 x i8], [4 x i8]*@.str614, i32 0, i32 0
%.tmp616 = load i8*, i8** %buf.463
%.tmp617 = call %m313$.Token.type*(%m313$.ParseCtx.type*,i8*,i8*) @m313$push_token.m313$.Token.typep.m313$.ParseCtx.typep.cp.cp(%m313$.ParseCtx.type* %.tmp613, i8* %.tmp615, i8* %.tmp616)
br label %.if.end.578
.if.false.578:
%.tmp618 = load i8, i8* %c.467
%.tmp619 = icmp eq i8 %.tmp618, 10
br i1 %.tmp619, label %.if.true.620, label %.if.false.620
.if.true.620:
%.tmp621 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp623 = getelementptr [3 x i8], [3 x i8]*@.str622, i32 0, i32 0
%.tmp625 = getelementptr [2 x i8], [2 x i8]*@.str624, i32 0, i32 0
%.tmp626 = call %m313$.Token.type*(%m313$.ParseCtx.type*,i8*,i8*) @m313$push_token.m313$.Token.typep.m313$.ParseCtx.typep.cp.cp(%m313$.ParseCtx.type* %.tmp621, i8* %.tmp623, i8* %.tmp625)
%.tmp627 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp628 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp627)
store i8 %.tmp628, i8* %c.467
br label %.if.end.620
.if.false.620:
%.tmp629 = load i8, i8* %c.467
%.tmp630 = icmp eq i8 %.tmp629, 45
br i1 %.tmp630, label %.if.true.631, label %.if.false.631
.if.true.631:
%.tmp632 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp633 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp632)
store i8 %.tmp633, i8* %c.467
%.tmp634 = load i8, i8* %c.467
%.tmp635 = icmp ne i8 %.tmp634, 45
br i1 %.tmp635, label %.if.true.636, label %.if.false.636
.if.true.636:
%.tmp637 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp639 = getelementptr [9 x i8], [9 x i8]*@.str638, i32 0, i32 0
%.tmp641 = getelementptr [2 x i8], [2 x i8]*@.str640, i32 0, i32 0
%.tmp642 = call %m313$.Token.type*(%m313$.ParseCtx.type*,i8*,i8*) @m313$push_token.m313$.Token.typep.m313$.ParseCtx.typep.cp.cp(%m313$.ParseCtx.type* %.tmp637, i8* %.tmp639, i8* %.tmp641)
br label %.for.start.468
br label %.if.end.636
.if.false.636:
br label %.if.end.636
.if.end.636:
%.tmp643 = load i32, i32* %max_token_size.461
%.tmp644 = call i8*(i32) @malloc(i32 %.tmp643)
store i8* %.tmp644, i8** %buf.463
%.tmp645 = load i8*, i8** %buf.463
%.tmp646 = getelementptr i8, i8* %.tmp645, i32 0
store i8 45, i8* %.tmp646
store i32 1, i32* %idx.464
br label %.for.start.647
.for.start.647:
%.tmp648 = load i8, i8* %c.467
%.tmp649 = icmp ne i8 %.tmp648, 10
%.tmp650 = load i8, i8* %c.467
%.tmp651 = icmp ne i8 %.tmp650, 0
%.tmp652 = and i1 %.tmp649, %.tmp651
br i1 %.tmp652, label %.for.continue.647, label %.for.end.647
.for.continue.647:
%.tmp653 = load i32, i32* %idx.464
%.tmp654 = load i8*, i8** %buf.463
%.tmp655 = getelementptr i8, i8* %.tmp654, i32 %.tmp653
%.tmp656 = load i8, i8* %c.467
store i8 %.tmp656, i8* %.tmp655
%.tmp657 = load i32, i32* %idx.464
%.tmp658 = add i32 %.tmp657, 1
store i32 %.tmp658, i32* %idx.464
%.tmp659 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp660 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp659)
store i8 %.tmp660, i8* %c.467
br label %.for.start.647
.for.end.647:
%.tmp661 = load i32, i32* %idx.464
%.tmp662 = load i8*, i8** %buf.463
%.tmp663 = getelementptr i8, i8* %.tmp662, i32 %.tmp661
store i8 0, i8* %.tmp663
%.tmp664 = load i1, i1* %keep_comments
br i1 %.tmp664, label %.if.true.665, label %.if.false.665
.if.true.665:
%.tmp666 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp668 = getelementptr [8 x i8], [8 x i8]*@.str667, i32 0, i32 0
%.tmp669 = load i8*, i8** %buf.463
%.tmp670 = call %m313$.Token.type*(%m313$.ParseCtx.type*,i8*,i8*) @m313$push_token.m313$.Token.typep.m313$.ParseCtx.typep.cp.cp(%m313$.ParseCtx.type* %.tmp666, i8* %.tmp668, i8* %.tmp669)
br label %.if.end.665
.if.false.665:
%.tmp671 = load i8*, i8** %buf.463
%.tmp672 = bitcast i8* %.tmp671 to i8*
call void(i8*) @free(i8* %.tmp672)
br label %.if.end.665
.if.end.665:
br label %.if.end.631
.if.false.631:
%.tmp673 = load i8, i8* %c.467
%.tmp674 = icmp sgt i8 %.tmp673, 126
br i1 %.tmp674, label %.if.true.675, label %.if.false.675
.if.true.675:
%.tmp677 = getelementptr [47 x i8], [47 x i8]*@.str676, i32 0, i32 0
%.tmp678 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp679 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp678, i32 0, i32 1
%.tmp680 = load i32, i32* %.tmp679
%.tmp681 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp682 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp681, i32 0, i32 2
%.tmp683 = load i32, i32* %.tmp682
%.tmp684 = load i8, i8* %c.467
%.tmp685 = load i8, i8* %c.467
%.tmp686 = call i32(i8*,...) @printf(i8* %.tmp677, i32 %.tmp680, i32 %.tmp683, i8 %.tmp684, i8 %.tmp685)
call void(i32) @exit(i32 1)
br label %.if.end.675
.if.false.675:
br label %.if.end.675
.if.end.675:
%.tmp687 = load i8, i8* %c.467
%prev_c.688 = alloca i8
store i8 %.tmp687, i8* %prev_c.688
%.tmp689 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp690 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp689)
store i8 %.tmp690, i8* %c.467
%.tmp692 = getelementptr [9 x i8], [9 x i8]*@.str691, i32 0, i32 0
%type.693 = alloca i8*
store i8* %.tmp692, i8** %type.693
%.tmp694 = load i8, i8* %prev_c.688
%.tmp695 = icmp eq i8 %.tmp694, 61
%.tmp696 = load i8, i8* %c.467
%.tmp697 = icmp eq i8 %.tmp696, 61
%.tmp698 = and i1 %.tmp695, %.tmp697
br i1 %.tmp698, label %.if.true.699, label %.if.false.699
.if.true.699:
%.tmp700 = getelementptr i8*, i8** %buf.463, i32 0
%.tmp702 = getelementptr [3 x i8], [3 x i8]*@.str701, i32 0, i32 0
%.tmp703 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp700, i8* %.tmp702)
%.tmp704 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp705 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp704)
store i8 %.tmp705, i8* %c.467
br label %.if.end.699
.if.false.699:
%.tmp706 = load i8, i8* %prev_c.688
%.tmp707 = icmp eq i8 %.tmp706, 33
%.tmp708 = load i8, i8* %c.467
%.tmp709 = icmp eq i8 %.tmp708, 61
%.tmp710 = and i1 %.tmp707, %.tmp709
br i1 %.tmp710, label %.if.true.711, label %.if.false.711
.if.true.711:
%.tmp712 = getelementptr i8*, i8** %buf.463, i32 0
%.tmp714 = getelementptr [3 x i8], [3 x i8]*@.str713, i32 0, i32 0
%.tmp715 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp712, i8* %.tmp714)
%.tmp716 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp717 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp716)
store i8 %.tmp717, i8* %c.467
br label %.if.end.711
.if.false.711:
%.tmp718 = load i8, i8* %prev_c.688
%.tmp719 = icmp eq i8 %.tmp718, 62
%.tmp720 = load i8, i8* %c.467
%.tmp721 = icmp eq i8 %.tmp720, 61
%.tmp722 = and i1 %.tmp719, %.tmp721
br i1 %.tmp722, label %.if.true.723, label %.if.false.723
.if.true.723:
%.tmp724 = getelementptr i8*, i8** %buf.463, i32 0
%.tmp726 = getelementptr [3 x i8], [3 x i8]*@.str725, i32 0, i32 0
%.tmp727 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp724, i8* %.tmp726)
%.tmp728 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp729 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp728)
store i8 %.tmp729, i8* %c.467
br label %.if.end.723
.if.false.723:
%.tmp730 = load i8, i8* %prev_c.688
%.tmp731 = icmp eq i8 %.tmp730, 60
%.tmp732 = load i8, i8* %c.467
%.tmp733 = icmp eq i8 %.tmp732, 61
%.tmp734 = and i1 %.tmp731, %.tmp733
br i1 %.tmp734, label %.if.true.735, label %.if.false.735
.if.true.735:
%.tmp736 = getelementptr i8*, i8** %buf.463, i32 0
%.tmp738 = getelementptr [3 x i8], [3 x i8]*@.str737, i32 0, i32 0
%.tmp739 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp736, i8* %.tmp738)
%.tmp740 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp741 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp740)
store i8 %.tmp741, i8* %c.467
br label %.if.end.735
.if.false.735:
%.tmp742 = load i8, i8* %prev_c.688
%.tmp743 = icmp eq i8 %.tmp742, 46
%.tmp744 = load i8, i8* %c.467
%.tmp745 = icmp eq i8 %.tmp744, 46
%.tmp746 = and i1 %.tmp743, %.tmp745
br i1 %.tmp746, label %.if.true.747, label %.if.false.747
.if.true.747:
%.tmp748 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp749 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp748)
store i8 %.tmp749, i8* %c.467
%.tmp750 = load i8, i8* %c.467
%.tmp751 = icmp ne i8 %.tmp750, 46
br i1 %.tmp751, label %.if.true.752, label %.if.false.752
.if.true.752:
%.tmp754 = getelementptr [13 x i8], [13 x i8]*@.str753, i32 0, i32 0
%.tmp755 = call i32(i8*,...) @printf(i8* %.tmp754)
call void(i32) @exit(i32 1)
br label %.if.end.752
.if.false.752:
%.tmp756 = getelementptr i8*, i8** %buf.463, i32 0
%.tmp758 = getelementptr [4 x i8], [4 x i8]*@.str757, i32 0, i32 0
%.tmp759 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp756, i8* %.tmp758)
%.tmp761 = getelementptr [8 x i8], [8 x i8]*@.str760, i32 0, i32 0
store i8* %.tmp761, i8** %type.693
br label %.if.end.752
.if.end.752:
%.tmp762 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp763 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp762)
store i8 %.tmp763, i8* %c.467
br label %.if.end.747
.if.false.747:
%.tmp764 = call i8*(i32) @malloc(i32 2)
store i8* %.tmp764, i8** %buf.463
%.tmp765 = load i8*, i8** %buf.463
%.tmp766 = getelementptr i8, i8* %.tmp765, i32 0
%.tmp767 = load i8, i8* %prev_c.688
store i8 %.tmp767, i8* %.tmp766
%.tmp768 = load i8*, i8** %buf.463
%.tmp769 = getelementptr i8, i8* %.tmp768, i32 1
store i8 0, i8* %.tmp769
br label %.if.end.747
.if.end.747:
br label %.if.end.735
.if.end.735:
br label %.if.end.723
.if.end.723:
br label %.if.end.711
.if.end.711:
br label %.if.end.699
.if.end.699:
%.tmp770 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp771 = load i8*, i8** %type.693
%.tmp772 = load i8*, i8** %buf.463
%.tmp773 = call %m313$.Token.type*(%m313$.ParseCtx.type*,i8*,i8*) @m313$push_token.m313$.Token.typep.m313$.ParseCtx.typep.cp.cp(%m313$.ParseCtx.type* %.tmp770, i8* %.tmp771, i8* %.tmp772)
br label %.if.end.631
.if.end.631:
br label %.if.end.620
.if.end.620:
br label %.if.end.578
.if.end.578:
br label %.if.end.565
.if.end.565:
br label %.if.end.557
.if.end.557:
br label %.if.end.522
.if.end.522:
br label %.if.end.490
.if.end.490:
br label %.if.end.485
.if.end.485:
br label %.for.start.468
.for.end.468:
%.tmp774 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp776 = getelementptr [4 x i8], [4 x i8]*@.str775, i32 0, i32 0
%.tmp778 = getelementptr [1 x i8], [1 x i8]*@.str777, i32 0, i32 0
%.tmp779 = call %m313$.Token.type*(%m313$.ParseCtx.type*,i8*,i8*) @m313$push_token.m313$.Token.typep.m313$.ParseCtx.typep.cp.cp(%m313$.ParseCtx.type* %.tmp774, i8* %.tmp776, i8* %.tmp778)
%.tmp780 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp781 = getelementptr %m313$.ParseCtx.type, %m313$.ParseCtx.type* %.tmp780, i32 0, i32 3
%.tmp782 = load %m313$.Token.type*, %m313$.Token.type** %.tmp781
%root.783 = alloca %m313$.Token.type*
store %m313$.Token.type* %.tmp782, %m313$.Token.type** %root.783
%.tmp784 = load %m313$.ParseCtx.type*, %m313$.ParseCtx.type** %ctx.451
%.tmp785 = bitcast %m313$.ParseCtx.type* %.tmp784 to i8*
call void(i8*) @free(i8* %.tmp785)
%.tmp786 = load %m313$.Token.type*, %m313$.Token.type** %root.783
%.tmp787 = bitcast %m313$.Token.type* %.tmp786 to %m313$.Token.type*
ret %m313$.Token.type* %.tmp787
}
define i8* @m313$read_string.cp.m314$.PeekerInfo.typep.c(%m314$.PeekerInfo.type* %.p.arg, i8 %.delimeter.arg) {
%p = alloca %m314$.PeekerInfo.type*
store %m314$.PeekerInfo.type* %.p.arg, %m314$.PeekerInfo.type** %p
%delimeter = alloca i8
store i8 %.delimeter.arg, i8* %delimeter
%str_size.788 = alloca i32
store i32 64, i32* %str_size.788
%.tmp789 = load i32, i32* %str_size.788
%.tmp790 = call i8*(i32) @malloc(i32 %.tmp789)
%buf.791 = alloca i8*
store i8* %.tmp790, i8** %buf.791
%.tmp792 = load i8*, i8** %buf.791
%.tmp793 = getelementptr i8, i8* %.tmp792, i32 0
%.tmp794 = load i8, i8* %delimeter
store i8 %.tmp794, i8* %.tmp793
%.tmp795 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp796 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp795)
%c.797 = alloca i8
store i8 %.tmp796, i8* %c.797
%idx.798 = alloca i32
store i32 0, i32* %idx.798
store i32 1, i32* %idx.798
br label %.for.start.799
.for.start.799:
%.tmp800 = load i8, i8* %c.797
%.tmp801 = load i8, i8* %delimeter
%.tmp802 = icmp ne i8 %.tmp800, %.tmp801
br i1 %.tmp802, label %.for.continue.799, label %.for.end.799
.for.continue.799:
%.tmp803 = load i8, i8* %c.797
%.tmp804 = icmp ne i8 %.tmp803, 0
%.tmp806 = getelementptr [61 x i8], [61 x i8]*@.str805, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp804, i8* %.tmp806)
%.tmp807 = load i32, i32* %idx.798
%.tmp808 = load i32, i32* %str_size.788
%.tmp809 = sub i32 %.tmp808, 2
%.tmp810 = icmp eq i32 %.tmp807, %.tmp809
br i1 %.tmp810, label %.if.true.811, label %.if.false.811
.if.true.811:
%.tmp812 = load i32, i32* %str_size.788
%.tmp813 = mul i32 %.tmp812, 2
store i32 %.tmp813, i32* %str_size.788
%.tmp814 = load i8*, i8** %buf.791
%.tmp815 = load i32, i32* %str_size.788
%.tmp816 = call i8*(i8*,i32) @realloc(i8* %.tmp814, i32 %.tmp815)
store i8* %.tmp816, i8** %buf.791
br label %.if.end.811
.if.false.811:
br label %.if.end.811
.if.end.811:
%.tmp817 = load i32, i32* %idx.798
%.tmp818 = load i8*, i8** %buf.791
%.tmp819 = getelementptr i8, i8* %.tmp818, i32 %.tmp817
%.tmp820 = load i8, i8* %c.797
store i8 %.tmp820, i8* %.tmp819
%.tmp821 = load i32, i32* %idx.798
%.tmp822 = add i32 %.tmp821, 1
store i32 %.tmp822, i32* %idx.798
%.tmp823 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p
%.tmp824 = call i8(%m314$.PeekerInfo.type*) @m314$read.c.m314$.PeekerInfo.typep(%m314$.PeekerInfo.type* %.tmp823)
store i8 %.tmp824, i8* %c.797
br label %.for.start.799
.for.end.799:
%.tmp825 = load i32, i32* %idx.798
%.tmp826 = load i8*, i8** %buf.791
%.tmp827 = getelementptr i8, i8* %.tmp826, i32 %.tmp825
%.tmp828 = load i8, i8* %c.797
store i8 %.tmp828, i8* %.tmp827
%.tmp829 = load i32, i32* %idx.798
%.tmp830 = add i32 %.tmp829, 1
%.tmp831 = load i8*, i8** %buf.791
%.tmp832 = getelementptr i8, i8* %.tmp831, i32 %.tmp830
store i8 0, i8* %.tmp832
%.tmp833 = load i8*, i8** %buf.791
ret i8* %.tmp833
}
%m312$.Error.type = type {i32,i32,i8*,i8*}
@Error_size = constant i32 24
define %m312$.Error.type* @m312$from.m312$.Error.typep.m313$.Token.typep.cp(%m313$.Token.type* %.t.arg, i8* %.message.arg) {
%t = alloca %m313$.Token.type*
store %m313$.Token.type* %.t.arg, %m313$.Token.type** %t
%message = alloca i8*
store i8* %.message.arg, i8** %message
%.tmp834 = load %m313$.Token.type*, %m313$.Token.type** %t
%.tmp835 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp834, i32 0, i32 4
%.tmp836 = load i8*, i8** %.tmp835
%.tmp837 = bitcast i8* %.tmp836 to i8*
%.tmp838 = load %m313$.Token.type*, %m313$.Token.type** %t
%.tmp839 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp838, i32 0, i32 2
%.tmp840 = load i32, i32* %.tmp839
%.tmp841 = load %m313$.Token.type*, %m313$.Token.type** %t
%.tmp842 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp841, i32 0, i32 3
%.tmp843 = load i32, i32* %.tmp842
%.tmp844 = load i8*, i8** %message
%.tmp845 = call %m312$.Error.type*(i8*,i32,i32,i8*) @m312$new.m312$.Error.typep.cp.i.i.cp(i8* %.tmp837, i32 %.tmp840, i32 %.tmp843, i8* %.tmp844)
ret %m312$.Error.type* %.tmp845
}
define %m312$.Error.type* @m312$new.m312$.Error.typep.cp.i.i.cp(i8* %.filename.arg, i32 %.line.arg, i32 %.char_of_line.arg, i8* %.message.arg) {
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%line = alloca i32
store i32 %.line.arg, i32* %line
%char_of_line = alloca i32
store i32 %.char_of_line.arg, i32* %char_of_line
%message = alloca i8*
store i8* %.message.arg, i8** %message
%.tmp846 = load i32, i32* @Error_size
%.tmp847 = call i8*(i32) @malloc(i32 %.tmp846)
%.tmp848 = bitcast i8* %.tmp847 to %m312$.Error.type*
%e.849 = alloca %m312$.Error.type*
store %m312$.Error.type* %.tmp848, %m312$.Error.type** %e.849
%.tmp850 = load %m312$.Error.type*, %m312$.Error.type** %e.849
%.tmp851 = getelementptr %m312$.Error.type, %m312$.Error.type* %.tmp850, i32 0, i32 0
%.tmp852 = load i32, i32* %line
store i32 %.tmp852, i32* %.tmp851
%.tmp853 = load %m312$.Error.type*, %m312$.Error.type** %e.849
%.tmp854 = getelementptr %m312$.Error.type, %m312$.Error.type* %.tmp853, i32 0, i32 1
%.tmp855 = load i32, i32* %char_of_line
store i32 %.tmp855, i32* %.tmp854
%.tmp856 = load %m312$.Error.type*, %m312$.Error.type** %e.849
%.tmp857 = getelementptr %m312$.Error.type, %m312$.Error.type* %.tmp856, i32 0, i32 3
%.tmp858 = load i8*, i8** %message
store i8* %.tmp858, i8** %.tmp857
%.tmp859 = load %m312$.Error.type*, %m312$.Error.type** %e.849
%.tmp860 = getelementptr %m312$.Error.type, %m312$.Error.type* %.tmp859, i32 0, i32 2
%.tmp861 = load i8*, i8** %filename
store i8* %.tmp861, i8** %.tmp860
%.tmp862 = load %m312$.Error.type*, %m312$.Error.type** %e.849
ret %m312$.Error.type* %.tmp862
}
define i8* @m312$_context.cp.m312$.Error.typep(%m312$.Error.type* %.e.arg) {
%e = alloca %m312$.Error.type*
store %m312$.Error.type* %.e.arg, %m312$.Error.type** %e
%lines.863 = alloca {i8**,i32,i32}
%.tmp864 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 0
store i8** null, i8*** %.tmp864
%.tmp865 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 1
store i32 0, i32* %.tmp865
%.tmp866 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 2
store i32 0, i32* %.tmp866
%.tmp867 = load %m312$.Error.type*, %m312$.Error.type** %e
%.tmp868 = getelementptr %m312$.Error.type, %m312$.Error.type* %.tmp867, i32 0, i32 2
%.tmp869 = load i8*, i8** %.tmp868
%.tmp871 = getelementptr [2 x i8], [2 x i8]*@.str870, i32 0, i32 0
%.tmp872 = call %m0$.File.type*(i8*,i8*) @fopen(i8* %.tmp869, i8* %.tmp871)
%fd.873 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp872, %m0$.File.type** %fd.873
%.tmp874 = load %m0$.File.type*, %m0$.File.type** %fd.873
%.tmp875 = icmp eq %m0$.File.type* %.tmp874, null
br i1 %.tmp875, label %.if.true.876, label %.if.false.876
.if.true.876:
%.tmp878 = getelementptr [1 x i8], [1 x i8]*@.str877, i32 0, i32 0
ret i8* %.tmp878
br label %.if.end.876
.if.false.876:
br label %.if.end.876
.if.end.876:
%curline.879 = alloca i32
store i32 0, i32* %curline.879
%context_size.880 = alloca i32
store i32 1, i32* %context_size.880
%.tmp881 = bitcast ptr null to i8*
%buf.882 = alloca i8*
store i8* %.tmp881, i8** %buf.882
%bufsize.883 = alloca i32
store i32 0, i32* %bufsize.883
%curline.885 = alloca i32
store i32 1, i32* %curline.885
br label %.for.start.884
.for.start.884:
%.tmp886 = load i32, i32* %curline.885
%.tmp887 = load %m312$.Error.type*, %m312$.Error.type** %e
%.tmp888 = getelementptr %m312$.Error.type, %m312$.Error.type* %.tmp887, i32 0, i32 0
%.tmp889 = load i32, i32* %.tmp888
%.tmp890 = load i32, i32* %context_size.880
%.tmp891 = add i32 %.tmp889, %.tmp890
%.tmp892 = icmp sle i32 %.tmp886, %.tmp891
br i1 %.tmp892, label %.for.continue.884, label %.for.end.884
.for.continue.884:
%.tmp893 = getelementptr i8*, i8** %buf.882, i32 0
%.tmp894 = getelementptr i32, i32* %bufsize.883, i32 0
%.tmp895 = load %m0$.File.type*, %m0$.File.type** %fd.873
%.tmp896 = call i32(i8**,i32*,%m0$.File.type*) @getline(i8** %.tmp893, i32* %.tmp894, %m0$.File.type* %.tmp895)
%.tmp897 = icmp slt i32 %.tmp896, 0
br i1 %.tmp897, label %.if.true.898, label %.if.false.898
.if.true.898:
br label %.for.end.884
br label %.if.end.898
.if.false.898:
br label %.if.end.898
.if.end.898:
%.tmp899 = load i32, i32* %curline.885
%.tmp900 = load %m312$.Error.type*, %m312$.Error.type** %e
%.tmp901 = getelementptr %m312$.Error.type, %m312$.Error.type* %.tmp900, i32 0, i32 0
%.tmp902 = load i32, i32* %.tmp901
%.tmp903 = load i32, i32* %context_size.880
%.tmp904 = sub i32 %.tmp902, %.tmp903
%.tmp905 = icmp sge i32 %.tmp899, %.tmp904
%.tmp906 = load i32, i32* %curline.885
%.tmp907 = load %m312$.Error.type*, %m312$.Error.type** %e
%.tmp908 = getelementptr %m312$.Error.type, %m312$.Error.type* %.tmp907, i32 0, i32 0
%.tmp909 = load i32, i32* %.tmp908
%.tmp910 = load i32, i32* %context_size.880
%.tmp911 = add i32 %.tmp909, %.tmp910
%.tmp912 = icmp sle i32 %.tmp906, %.tmp911
%.tmp913 = and i1 %.tmp905, %.tmp912
br i1 %.tmp913, label %.if.true.914, label %.if.false.914
.if.true.914:
%.tmp916 = getelementptr [1 x i8], [1 x i8]*@.str915, i32 0, i32 0
%.b918.tmp0 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 1
%.b918.tmp1 = load i32, i32* %.b918.tmp0
%.b918.tmp2 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 2
%.b918.tmp3 = load i32, i32* %.b918.tmp2
%.b918.tmp4 = icmp sge i32 %.b918.tmp1, %.b918.tmp3
br i1 %.b918.tmp4, label %.b918.if.true.9, label %.b918.if.end.9
.b918.if.true.9:
%.b918.tmp6 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 2
%.b918.tmp7 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 2
%.b918.tmp8 = load i32, i32* %.b918.tmp7
%.b918.tmp9 = mul i32 %.b918.tmp8, 2
%.b918.tmp10 = add i32 %.b918.tmp9, 1
store i32 %.b918.tmp10, i32* %.b918.tmp6
%.b918.tmp11 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 0
%.b918.tmp12 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 0
%.b918.tmp13 = load i8**, i8*** %.b918.tmp12
%.b918.tmp14 = bitcast i8** %.b918.tmp13 to i8*
%.b918.tmp15 = getelementptr i8*, i8** null, i32 1
%.b918.tmp16 = ptrtoint i8** %.b918.tmp15 to i32
%.b918.tmp17 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 2
%.b918.tmp18 = load i32, i32* %.b918.tmp17
%.b918.tmp19 = mul i32 %.b918.tmp16, %.b918.tmp18
%.b918.tmp20 = call i8*(i8*,i32) @realloc(i8* %.b918.tmp14, i32 %.b918.tmp19)
%.b918.tmp21 = bitcast i8* %.b918.tmp20 to i8**
store i8** %.b918.tmp21, i8*** %.b918.tmp11
br label %.b918.if.end.9
.b918.if.end.9:
%.b918.tmp22 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 0
%.b918.tmp23 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 1
%.b918.tmp24 = load i32, i32* %.b918.tmp23
%.b918.tmp25 = load i8**, i8*** %.b918.tmp22
%.b918.tmp26 = getelementptr i8*, i8** %.b918.tmp25, i32 %.b918.tmp24
store i8* %.tmp916, i8** %.b918.tmp26
%.b918.tmp27 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 1
%.b918.tmp28 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 1
%.b918.tmp29 = load i32, i32* %.b918.tmp28
%.b918.tmp30 = add i32 %.b918.tmp29, 1
store i32 %.b918.tmp30, i32* %.b918.tmp27
%.tmp917 = load {i8**,i32,i32}, {i8**,i32,i32}* %lines.863
store {i8**,i32,i32} %.tmp917, {i8**,i32,i32}* %lines.863
%.tmp919 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 1
%.tmp920 = load i32, i32* %.tmp919
%.tmp921 = sub i32 %.tmp920, 1
%.tmp922 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 0
%.tmp923 = load i8**, i8*** %.tmp922
%.tmp924 = getelementptr i8*, i8** %.tmp923, i32 %.tmp921
%.tmp925 = getelementptr i8*, i8** %.tmp924, i32 0
%.tmp927 = getelementptr [9 x i8], [9 x i8]*@.str926, i32 0, i32 0
%.tmp928 = load i32, i32* %curline.885
%.tmp929 = load i8*, i8** %buf.882
%.tmp930 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp925, i8* %.tmp927, i32 %.tmp928, i8* %.tmp929)
br label %.if.end.914
.if.false.914:
br label %.if.end.914
.if.end.914:
%.tmp931 = load i32, i32* %curline.885
%.tmp932 = add i32 %.tmp931, 1
store i32 %.tmp932, i32* %curline.885
br label %.for.start.884
.for.end.884:
%.tmp933 = load %m0$.File.type*, %m0$.File.type** %fd.873
%.tmp934 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp933)
%.tmp936 = getelementptr [1 x i8], [1 x i8]*@.str935, i32 0, i32 0
store i8* %.tmp936, i8** %buf.882
%i.938 = alloca i32
store i32 0, i32* %i.938
br label %.for.start.937
.for.start.937:
%.tmp939 = load i32, i32* %i.938
%.tmp940 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 1
%.tmp941 = load i32, i32* %.tmp940
%.tmp942 = icmp slt i32 %.tmp939, %.tmp941
br i1 %.tmp942, label %.for.continue.937, label %.for.end.937
.for.continue.937:
%.tmp943 = getelementptr i8*, i8** %buf.882, i32 0
%.tmp945 = getelementptr [5 x i8], [5 x i8]*@.str944, i32 0, i32 0
%.tmp946 = load i8*, i8** %buf.882
%.tmp947 = load i32, i32* %i.938
%.tmp948 = getelementptr {i8**,i32,i32}, {i8**,i32,i32}* %lines.863, i32 0, i32 0
%.tmp949 = load i8**, i8*** %.tmp948
%.tmp950 = getelementptr i8*, i8** %.tmp949, i32 %.tmp947
%.tmp951 = load i8*, i8** %.tmp950
%.tmp952 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp943, i8* %.tmp945, i8* %.tmp946, i8* %.tmp951)
%.tmp953 = load i32, i32* %i.938
%.tmp954 = add i32 %.tmp953, 1
store i32 %.tmp954, i32* %i.938
br label %.for.start.937
.for.end.937:
%.tmp955 = getelementptr i8*, i8** %buf.882, i32 0
%.tmp957 = getelementptr [5 x i8], [5 x i8]*@.str956, i32 0, i32 0
%.tmp958 = load i8*, i8** %buf.882
%.tmp959 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp955, i8* %.tmp957, i8* %.tmp958)
%.tmp960 = load i8*, i8** %buf.882
ret i8* %.tmp960
}
define i8* @m312$to_string.cp.m312$.Error.typep(%m312$.Error.type* %.e.arg) {
%e = alloca %m312$.Error.type*
store %m312$.Error.type* %.e.arg, %m312$.Error.type** %e
%.tmp962 = getelementptr [1 x i8], [1 x i8]*@.str961, i32 0, i32 0
%buf.963 = alloca i8*
store i8* %.tmp962, i8** %buf.963
%.tmp964 = load %m312$.Error.type*, %m312$.Error.type** %e
%.tmp965 = call i8*(%m312$.Error.type*) @m312$_context.cp.m312$.Error.typep(%m312$.Error.type* %.tmp964)
%ctx.966 = alloca i8*
store i8* %.tmp965, i8** %ctx.966
%.tmp967 = getelementptr i8*, i8** %buf.963, i32 0
%.tmp969 = getelementptr [24 x i8], [24 x i8]*@.str968, i32 0, i32 0
%.tmp970 = load %m312$.Error.type*, %m312$.Error.type** %e
%.tmp971 = getelementptr %m312$.Error.type, %m312$.Error.type* %.tmp970, i32 0, i32 2
%.tmp972 = load i8*, i8** %.tmp971
%.tmp973 = load %m312$.Error.type*, %m312$.Error.type** %e
%.tmp974 = getelementptr %m312$.Error.type, %m312$.Error.type* %.tmp973, i32 0, i32 0
%.tmp975 = load i32, i32* %.tmp974
%.tmp976 = load %m312$.Error.type*, %m312$.Error.type** %e
%.tmp977 = getelementptr %m312$.Error.type, %m312$.Error.type* %.tmp976, i32 0, i32 1
%.tmp978 = load i32, i32* %.tmp977
%.tmp979 = load %m312$.Error.type*, %m312$.Error.type** %e
%.tmp980 = getelementptr %m312$.Error.type, %m312$.Error.type* %.tmp979, i32 0, i32 3
%.tmp981 = load i8*, i8** %.tmp980
%.tmp982 = load i8*, i8** %ctx.966
%.tmp983 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp967, i8* %.tmp969, i8* %.tmp972, i32 %.tmp975, i32 %.tmp978, i8* %.tmp981, i8* %.tmp982)
%.tmp984 = load i8*, i8** %buf.963
ret i8* %.tmp984
}
define void @m312$report.v.m312$.Error.typep(%m312$.Error.type* %.e.arg) {
%e = alloca %m312$.Error.type*
store %m312$.Error.type* %.e.arg, %m312$.Error.type** %e
%.tmp986 = getelementptr [3 x i8], [3 x i8]*@.str985, i32 0, i32 0
%.tmp987 = load %m312$.Error.type*, %m312$.Error.type** %e
%.tmp988 = call i8*(%m312$.Error.type*) @m312$to_string.cp.m312$.Error.typep(%m312$.Error.type* %.tmp987)
%.tmp989 = call i32(i8*,...) @printf(i8* %.tmp986, i8* %.tmp988)
ret void
}
define void @m312$freport.v.m0$.File.typep.m312$.Error.typep(%m0$.File.type* %.fd.arg, %m312$.Error.type* %.e.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%e = alloca %m312$.Error.type*
store %m312$.Error.type* %.e.arg, %m312$.Error.type** %e
%.tmp990 = load %m0$.File.type*, %m0$.File.type** %fd
%.tmp992 = getelementptr [3 x i8], [3 x i8]*@.str991, i32 0, i32 0
%.tmp993 = load %m312$.Error.type*, %m312$.Error.type** %e
%.tmp994 = call i8*(%m312$.Error.type*) @m312$to_string.cp.m312$.Error.typep(%m312$.Error.type* %.tmp993)
%.tmp995 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp990, i8* %.tmp992, i8* %.tmp994)
ret void
}
@TYPE_VALUE = constant i8 118
@TYPE_ALIAS = constant i8 97
@TYPE_TYPE = constant i8 116
@TYPE_IGNORE = constant i8 0
%m996$.Matcher.type = type {i8,i8*,%m996$.Matcher.type*,%m996$.Matcher.type*,%m996$.Matcher.type*,i8,i8*}
%m996$.Rule.type = type {i8*,i8*,%m996$.Matcher.type*}
%m996$.ParsingContext.type = type {%m313$.Token.type*,%m312$.Error.type*}
define %m996$.ParsingContext.type* @m996$new_context.m996$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.f.arg) {
%f = alloca %m0$.File.type*
store %m0$.File.type* %.f.arg, %m0$.File.type** %f
%.tmp997 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* null, i32 1
%.tmp998 = ptrtoint %m996$.ParsingContext.type* %.tmp997 to i32
%.tmp999 = call i8*(i32) @malloc(i32 %.tmp998)
%.tmp1000 = bitcast i8* %.tmp999 to %m996$.ParsingContext.type*
%ctx.1001 = alloca %m996$.ParsingContext.type*
store %m996$.ParsingContext.type* %.tmp1000, %m996$.ParsingContext.type** %ctx.1001
%.tmp1002 = load %m0$.File.type*, %m0$.File.type** %f
%.tmp1003 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp1002)
%fd.1004 = alloca i32
store i32 %.tmp1003, i32* %fd.1004
%.tmp1005 = load i32, i32* %fd.1004
%.tmp1006 = call %m314$.PeekerInfo.type*(i32) @m314$new.m314$.PeekerInfo.typep.i(i32 %.tmp1005)
%p.1007 = alloca %m314$.PeekerInfo.type*
store %m314$.PeekerInfo.type* %.tmp1006, %m314$.PeekerInfo.type** %p.1007
%.tmp1008 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p.1007
%.tmp1009 = call %m313$.Token.type*(%m314$.PeekerInfo.type*,i1) @m313$tokenize.m313$.Token.typep.m314$.PeekerInfo.typep.b(%m314$.PeekerInfo.type* %.tmp1008, i1 0)
%token_list.1010 = alloca %m313$.Token.type*
store %m313$.Token.type* %.tmp1009, %m313$.Token.type** %token_list.1010
%.tmp1011 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p.1007
%.tmp1012 = bitcast %m314$.PeekerInfo.type* %.tmp1011 to i8*
call void(i8*) @free(i8* %.tmp1012)
%.tmp1013 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx.1001
%.tmp1014 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1013, i32 0, i32 0
%.tmp1015 = load %m313$.Token.type*, %m313$.Token.type** %token_list.1010
store %m313$.Token.type* %.tmp1015, %m313$.Token.type** %.tmp1014
%.tmp1016 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx.1001
ret %m996$.ParsingContext.type* %.tmp1016
}
define %m996$.Matcher.type* @m996$new_matcher.m996$.Matcher.typep() {
%.tmp1017 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* null, i32 1
%.tmp1018 = ptrtoint %m996$.Matcher.type* %.tmp1017 to i32
%.tmp1019 = call i8*(i32) @malloc(i32 %.tmp1018)
%.tmp1020 = bitcast i8* %.tmp1019 to %m996$.Matcher.type*
%m.1021 = alloca %m996$.Matcher.type*
store %m996$.Matcher.type* %.tmp1020, %m996$.Matcher.type** %m.1021
%.tmp1022 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1021
%.tmp1023 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1022, i32 0, i32 5
%.tmp1024 = load i8, i8* @TYPE_IGNORE
store i8 %.tmp1024, i8* %.tmp1023
%.tmp1025 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1021
%.tmp1026 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1025, i32 0, i32 6
%.tmp1028 = getelementptr [1 x i8], [1 x i8]*@.str1027, i32 0, i32 0
store i8* %.tmp1028, i8** %.tmp1026
%.tmp1029 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1021
%.tmp1030 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1029, i32 0, i32 1
%.tmp1032 = getelementptr [1 x i8], [1 x i8]*@.str1031, i32 0, i32 0
store i8* %.tmp1032, i8** %.tmp1030
%.tmp1033 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1021
%.tmp1034 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1033, i32 0, i32 4
store %m996$.Matcher.type* null, %m996$.Matcher.type** %.tmp1034
%.tmp1035 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1021
%.tmp1036 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1035, i32 0, i32 0
store i8 49, i8* %.tmp1036
%.tmp1037 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1021
%.tmp1038 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1037, i32 0, i32 2
store %m996$.Matcher.type* null, %m996$.Matcher.type** %.tmp1038
%.tmp1039 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1021
%.tmp1040 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1039, i32 0, i32 3
store %m996$.Matcher.type* null, %m996$.Matcher.type** %.tmp1040
%.tmp1041 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1021
ret %m996$.Matcher.type* %.tmp1041
}
define i8* @m996$value.cp.m313$.Token.typep(%m313$.Token.type* %.token.arg) {
%token = alloca %m313$.Token.type*
store %m313$.Token.type* %.token.arg, %m313$.Token.type** %token
%.tmp1042 = load %m313$.Token.type*, %m313$.Token.type** %token
%.tmp1043 = icmp eq %m313$.Token.type* %.tmp1042, null
br i1 %.tmp1043, label %.if.true.1044, label %.if.false.1044
.if.true.1044:
%.tmp1046 = getelementptr [1 x i8], [1 x i8]*@.str1045, i32 0, i32 0
ret i8* %.tmp1046
br label %.if.end.1044
.if.false.1044:
br label %.if.end.1044
.if.end.1044:
%.tmp1047 = load %m313$.Token.type*, %m313$.Token.type** %token
%.tmp1048 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1047, i32 0, i32 1
%.tmp1049 = load i8*, i8** %.tmp1048
ret i8* %.tmp1049
}
define i8* @m996$type.cp.m313$.Token.typep(%m313$.Token.type* %.token.arg) {
%token = alloca %m313$.Token.type*
store %m313$.Token.type* %.token.arg, %m313$.Token.type** %token
%.tmp1050 = load %m313$.Token.type*, %m313$.Token.type** %token
%.tmp1051 = icmp eq %m313$.Token.type* %.tmp1050, null
br i1 %.tmp1051, label %.if.true.1052, label %.if.false.1052
.if.true.1052:
%.tmp1054 = getelementptr [1 x i8], [1 x i8]*@.str1053, i32 0, i32 0
ret i8* %.tmp1054
br label %.if.end.1052
.if.false.1052:
br label %.if.end.1052
.if.end.1052:
%.tmp1055 = load %m313$.Token.type*, %m313$.Token.type** %token
%.tmp1056 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1055, i32 0, i32 0
%.tmp1057 = load i8*, i8** %.tmp1056
ret i8* %.tmp1057
}
define %m313$.Token.type* @m996$next.m313$.Token.typep.m313$.Token.typep(%m313$.Token.type* %.token.arg) {
%token = alloca %m313$.Token.type*
store %m313$.Token.type* %.token.arg, %m313$.Token.type** %token
%.tmp1058 = load %m313$.Token.type*, %m313$.Token.type** %token
%.tmp1059 = icmp eq %m313$.Token.type* %.tmp1058, null
br i1 %.tmp1059, label %.if.true.1060, label %.if.false.1060
.if.true.1060:
%.tmp1061 = bitcast ptr null to %m313$.Token.type*
ret %m313$.Token.type* %.tmp1061
br label %.if.end.1060
.if.false.1060:
br label %.if.end.1060
.if.end.1060:
%.tmp1062 = load %m313$.Token.type*, %m313$.Token.type** %token
%.tmp1063 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1062, i32 0, i32 5
%.tmp1064 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1063
ret %m313$.Token.type* %.tmp1064
}
define void @m996$append_submatch.v.m996$.Matcher.typep.m996$.Matcher.typep(%m996$.Matcher.type* %.m.arg, %m996$.Matcher.type* %.child.arg) {
%m = alloca %m996$.Matcher.type*
store %m996$.Matcher.type* %.m.arg, %m996$.Matcher.type** %m
%child = alloca %m996$.Matcher.type*
store %m996$.Matcher.type* %.child.arg, %m996$.Matcher.type** %child
%.tmp1065 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m
%.tmp1066 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1065, i32 0, i32 4
%.tmp1067 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp1066
%.tmp1068 = icmp eq %m996$.Matcher.type* %.tmp1067, null
br i1 %.tmp1068, label %.if.true.1069, label %.if.false.1069
.if.true.1069:
%.tmp1070 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m
%.tmp1071 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1070, i32 0, i32 4
%.tmp1072 = load %m996$.Matcher.type*, %m996$.Matcher.type** %child
store %m996$.Matcher.type* %.tmp1072, %m996$.Matcher.type** %.tmp1071
ret void
br label %.if.end.1069
.if.false.1069:
br label %.if.end.1069
.if.end.1069:
%.tmp1073 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m
%.tmp1074 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1073, i32 0, i32 4
%.tmp1075 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp1074
%base.1076 = alloca %m996$.Matcher.type*
store %m996$.Matcher.type* %.tmp1075, %m996$.Matcher.type** %base.1076
br label %.for.start.1077
.for.start.1077:
%.tmp1078 = load %m996$.Matcher.type*, %m996$.Matcher.type** %base.1076
%.tmp1079 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1078, i32 0, i32 3
%.tmp1080 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp1079
%.tmp1081 = icmp ne %m996$.Matcher.type* %.tmp1080, null
br i1 %.tmp1081, label %.for.continue.1077, label %.for.end.1077
.for.continue.1077:
%.tmp1082 = load %m996$.Matcher.type*, %m996$.Matcher.type** %base.1076
%.tmp1083 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1082, i32 0, i32 3
%.tmp1084 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp1083
store %m996$.Matcher.type* %.tmp1084, %m996$.Matcher.type** %base.1076
br label %.for.start.1077
.for.end.1077:
%.tmp1085 = load %m996$.Matcher.type*, %m996$.Matcher.type** %base.1076
%.tmp1086 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1085, i32 0, i32 3
%.tmp1087 = load %m996$.Matcher.type*, %m996$.Matcher.type** %child
store %m996$.Matcher.type* %.tmp1087, %m996$.Matcher.type** %.tmp1086
ret void
}
define %m996$.Matcher.type* @m996$parse_matcher.m996$.Matcher.typep.m996$.ParsingContext.typep(%m996$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m996$.ParsingContext.type*
store %m996$.ParsingContext.type* %.ctx.arg, %m996$.ParsingContext.type** %ctx
%.tmp1088 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1089 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1088, i32 0, i32 0
%.tmp1090 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1089
%.tmp1091 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1090, i32 0, i32 1
%.tmp1092 = load i8*, i8** %.tmp1091
%.tmp1094 = getelementptr [2 x i8], [2 x i8]*@.str1093, i32 0, i32 0
%.tmp1095 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1092, i8* %.tmp1094)
%.tmp1096 = icmp eq i32 %.tmp1095, 0
br i1 %.tmp1096, label %.if.true.1097, label %.if.false.1097
.if.true.1097:
%.tmp1098 = bitcast ptr null to %m996$.Matcher.type*
ret %m996$.Matcher.type* %.tmp1098
br label %.if.end.1097
.if.false.1097:
br label %.if.end.1097
.if.end.1097:
%.tmp1099 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1100 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1099, i32 0, i32 0
%.tmp1101 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1100
%.tmp1102 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1101, i32 0, i32 1
%.tmp1103 = load i8*, i8** %.tmp1102
%.tmp1105 = getelementptr [2 x i8], [2 x i8]*@.str1104, i32 0, i32 0
%.tmp1106 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1103, i8* %.tmp1105)
%.tmp1107 = icmp eq i32 %.tmp1106, 0
br i1 %.tmp1107, label %.if.true.1108, label %.if.false.1108
.if.true.1108:
%.tmp1109 = bitcast ptr null to %m996$.Matcher.type*
ret %m996$.Matcher.type* %.tmp1109
br label %.if.end.1108
.if.false.1108:
br label %.if.end.1108
.if.end.1108:
%.tmp1110 = call %m996$.Matcher.type*() @m996$new_matcher.m996$.Matcher.typep()
%m.1111 = alloca %m996$.Matcher.type*
store %m996$.Matcher.type* %.tmp1110, %m996$.Matcher.type** %m.1111
%.tmp1112 = bitcast ptr null to %m996$.Matcher.type*
%tmp_submatch.1113 = alloca %m996$.Matcher.type*
store %m996$.Matcher.type* %.tmp1112, %m996$.Matcher.type** %tmp_submatch.1113
%.tmp1115 = getelementptr [1 x i8], [1 x i8]*@.str1114, i32 0, i32 0
%tag.1116 = alloca i8*
store i8* %.tmp1115, i8** %tag.1116
br label %.for.start.1117
.for.start.1117:
%.tmp1118 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1119 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1118, i32 0, i32 0
%.tmp1120 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1119
%.tmp1121 = icmp ne %m313$.Token.type* %.tmp1120, null
br i1 %.tmp1121, label %.for.continue.1117, label %.for.end.1117
.for.continue.1117:
%.tmp1122 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1123 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1122, i32 0, i32 0
%.tmp1124 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1123
%.tmp1125 = call i8*(%m313$.Token.type*) @m996$type.cp.m313$.Token.typep(%m313$.Token.type* %.tmp1124)
%.tmp1127 = getelementptr [5 x i8], [5 x i8]*@.str1126, i32 0, i32 0
%.tmp1128 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1125, i8* %.tmp1127)
%.tmp1129 = icmp eq i32 %.tmp1128, 0
%.tmp1130 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1131 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1130, i32 0, i32 0
%.tmp1132 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1131
%.tmp1133 = call %m313$.Token.type*(%m313$.Token.type*) @m996$next.m313$.Token.typep.m313$.Token.typep(%m313$.Token.type* %.tmp1132)
%.tmp1134 = call i8*(%m313$.Token.type*) @m996$value.cp.m313$.Token.typep(%m313$.Token.type* %.tmp1133)
%.tmp1136 = getelementptr [2 x i8], [2 x i8]*@.str1135, i32 0, i32 0
%.tmp1137 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1134, i8* %.tmp1136)
%.tmp1138 = icmp eq i32 %.tmp1137, 0
%.tmp1139 = and i1 %.tmp1129, %.tmp1138
br i1 %.tmp1139, label %.if.true.1140, label %.if.false.1140
.if.true.1140:
%.tmp1141 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1142 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1141, i32 0, i32 0
%.tmp1143 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1142
%.tmp1144 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1143, i32 0, i32 1
%.tmp1145 = load i8*, i8** %.tmp1144
store i8* %.tmp1145, i8** %tag.1116
%.tmp1146 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1147 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1146, i32 0, i32 0
%.tmp1148 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1149 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1148, i32 0, i32 0
%.tmp1150 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1149
%.tmp1151 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1150, i32 0, i32 5
%.tmp1152 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1151
%.tmp1153 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1152, i32 0, i32 5
%.tmp1154 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1153
store %m313$.Token.type* %.tmp1154, %m313$.Token.type** %.tmp1147
br label %.if.end.1140
.if.false.1140:
%.tmp1156 = getelementptr [1 x i8], [1 x i8]*@.str1155, i32 0, i32 0
store i8* %.tmp1156, i8** %tag.1116
br label %.if.end.1140
.if.end.1140:
%.tmp1157 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1158 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1157, i32 0, i32 0
%.tmp1159 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1158
%.tmp1160 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1159, i32 0, i32 1
%.tmp1161 = load i8*, i8** %.tmp1160
%.tmp1163 = getelementptr [2 x i8], [2 x i8]*@.str1162, i32 0, i32 0
%.tmp1164 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1161, i8* %.tmp1163)
%.tmp1165 = icmp eq i32 %.tmp1164, 0
br i1 %.tmp1165, label %.if.true.1166, label %.if.false.1166
.if.true.1166:
%.tmp1167 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1168 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1167, i32 0, i32 0
%.tmp1169 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1168
%b_tok.1170 = alloca %m313$.Token.type*
store %m313$.Token.type* %.tmp1169, %m313$.Token.type** %b_tok.1170
%.tmp1171 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1172 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1171, i32 0, i32 0
%.tmp1173 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1174 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1173, i32 0, i32 0
%.tmp1175 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1174
%.tmp1176 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1175, i32 0, i32 5
%.tmp1177 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1176
store %m313$.Token.type* %.tmp1177, %m313$.Token.type** %.tmp1172
%.tmp1178 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1179 = call %m996$.Matcher.type*(%m996$.ParsingContext.type*) @m996$parse_matcher.m996$.Matcher.typep.m996$.ParsingContext.typep(%m996$.ParsingContext.type* %.tmp1178)
store %m996$.Matcher.type* %.tmp1179, %m996$.Matcher.type** %tmp_submatch.1113
%.tmp1180 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1181 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1180, i32 0, i32 0
%.tmp1182 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1181
%.tmp1183 = call i8*(%m313$.Token.type*) @m996$value.cp.m313$.Token.typep(%m313$.Token.type* %.tmp1182)
%.tmp1185 = getelementptr [2 x i8], [2 x i8]*@.str1184, i32 0, i32 0
%.tmp1186 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1183, i8* %.tmp1185)
%.tmp1187 = icmp ne i32 %.tmp1186, 0
br i1 %.tmp1187, label %.if.true.1188, label %.if.false.1188
.if.true.1188:
%.tmp1189 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1190 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1189, i32 0, i32 1
%.tmp1191 = load %m313$.Token.type*, %m313$.Token.type** %b_tok.1170
%.tmp1193 = getelementptr [19 x i8], [19 x i8]*@.str1192, i32 0, i32 0
%.tmp1194 = call %m312$.Error.type*(%m313$.Token.type*,i8*) @m312$from.m312$.Error.typep.m313$.Token.typep.cp(%m313$.Token.type* %.tmp1191, i8* %.tmp1193)
store %m312$.Error.type* %.tmp1194, %m312$.Error.type** %.tmp1190
%.tmp1195 = bitcast ptr null to %m996$.Matcher.type*
ret %m996$.Matcher.type* %.tmp1195
br label %.if.end.1188
.if.false.1188:
br label %.if.end.1188
.if.end.1188:
%.tmp1196 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1197 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1196, i32 0, i32 0
%.tmp1198 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1199 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1198, i32 0, i32 0
%.tmp1200 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1199
%.tmp1201 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1200, i32 0, i32 5
%.tmp1202 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1201
store %m313$.Token.type* %.tmp1202, %m313$.Token.type** %.tmp1197
br label %.if.end.1166
.if.false.1166:
%.tmp1203 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1204 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1203, i32 0, i32 0
%.tmp1205 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1204
%.tmp1206 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1205, i32 0, i32 0
%.tmp1207 = load i8*, i8** %.tmp1206
%.tmp1209 = getelementptr [5 x i8], [5 x i8]*@.str1208, i32 0, i32 0
%.tmp1210 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1207, i8* %.tmp1209)
%.tmp1211 = icmp eq i32 %.tmp1210, 0
%.tmp1212 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1213 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1212, i32 0, i32 0
%.tmp1214 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1213
%.tmp1215 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1214, i32 0, i32 0
%.tmp1216 = load i8*, i8** %.tmp1215
%.tmp1218 = getelementptr [7 x i8], [7 x i8]*@.str1217, i32 0, i32 0
%.tmp1219 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1216, i8* %.tmp1218)
%.tmp1220 = icmp eq i32 %.tmp1219, 0
%.tmp1221 = or i1 %.tmp1211, %.tmp1220
br i1 %.tmp1221, label %.if.true.1222, label %.if.false.1222
.if.true.1222:
%.tmp1223 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1224 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1225 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1224, i32 0, i32 0
%.tmp1226 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1225
%.tmp1227 = call %m996$.Matcher.type*(%m996$.ParsingContext.type*,%m313$.Token.type*) @m996$parse_single_token.m996$.Matcher.typep.m996$.ParsingContext.typep.m313$.Token.typep(%m996$.ParsingContext.type* %.tmp1223, %m313$.Token.type* %.tmp1226)
store %m996$.Matcher.type* %.tmp1227, %m996$.Matcher.type** %tmp_submatch.1113
%.tmp1228 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1229 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1228, i32 0, i32 0
%.tmp1230 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1231 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1230, i32 0, i32 0
%.tmp1232 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1231
%.tmp1233 = call %m313$.Token.type*(%m313$.Token.type*) @m996$next.m313$.Token.typep.m313$.Token.typep(%m313$.Token.type* %.tmp1232)
store %m313$.Token.type* %.tmp1233, %m313$.Token.type** %.tmp1229
br label %.if.end.1222
.if.false.1222:
%.tmp1234 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1235 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1234, i32 0, i32 0
%.tmp1236 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1235
%.tmp1237 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1236, i32 0, i32 1
%.tmp1238 = load i8*, i8** %.tmp1237
%.tmp1240 = getelementptr [2 x i8], [2 x i8]*@.str1239, i32 0, i32 0
%.tmp1241 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1238, i8* %.tmp1240)
%.tmp1242 = icmp eq i32 %.tmp1241, 0
br i1 %.tmp1242, label %.if.true.1243, label %.if.false.1243
.if.true.1243:
%.tmp1244 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1245 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1244, i32 0, i32 0
%.tmp1246 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1247 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1246, i32 0, i32 0
%.tmp1248 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1247
%.tmp1249 = call %m313$.Token.type*(%m313$.Token.type*) @m996$next.m313$.Token.typep.m313$.Token.typep(%m313$.Token.type* %.tmp1248)
store %m313$.Token.type* %.tmp1249, %m313$.Token.type** %.tmp1245
%.tmp1250 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1111
%.tmp1251 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1250, i32 0, i32 4
%.tmp1252 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp1251
%.tmp1253 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1252, i32 0, i32 2
%.tmp1254 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1255 = call %m996$.Matcher.type*(%m996$.ParsingContext.type*) @m996$parse_matcher.m996$.Matcher.typep.m996$.ParsingContext.typep(%m996$.ParsingContext.type* %.tmp1254)
store %m996$.Matcher.type* %.tmp1255, %m996$.Matcher.type** %.tmp1253
br label %.for.end.1117
br label %.if.end.1243
.if.false.1243:
br label %.for.end.1117
br label %.if.end.1243
.if.end.1243:
br label %.if.end.1222
.if.end.1222:
br label %.if.end.1166
.if.end.1166:
%.tmp1256 = load %m996$.Matcher.type*, %m996$.Matcher.type** %tmp_submatch.1113
%.tmp1257 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1256, i32 0, i32 1
%.tmp1258 = load i8*, i8** %tag.1116
store i8* %.tmp1258, i8** %.tmp1257
%.tmp1259 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1260 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1259, i32 0, i32 0
%.tmp1261 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1260
%.tmp1262 = call i8*(%m313$.Token.type*) @m996$value.cp.m313$.Token.typep(%m313$.Token.type* %.tmp1261)
%nv.1263 = alloca i8*
store i8* %.tmp1262, i8** %nv.1263
%.tmp1264 = load i8*, i8** %nv.1263
%.tmp1266 = getelementptr [2 x i8], [2 x i8]*@.str1265, i32 0, i32 0
%.tmp1267 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1264, i8* %.tmp1266)
%.tmp1268 = icmp eq i32 %.tmp1267, 0
br i1 %.tmp1268, label %.if.true.1269, label %.if.false.1269
.if.true.1269:
%.tmp1270 = load %m996$.Matcher.type*, %m996$.Matcher.type** %tmp_submatch.1113
%.tmp1271 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1270, i32 0, i32 0
store i8 43, i8* %.tmp1271
%.tmp1272 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1273 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1272, i32 0, i32 0
%.tmp1274 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1275 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1274, i32 0, i32 0
%.tmp1276 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1275
%.tmp1277 = call %m313$.Token.type*(%m313$.Token.type*) @m996$next.m313$.Token.typep.m313$.Token.typep(%m313$.Token.type* %.tmp1276)
store %m313$.Token.type* %.tmp1277, %m313$.Token.type** %.tmp1273
br label %.if.end.1269
.if.false.1269:
%.tmp1278 = load i8*, i8** %nv.1263
%.tmp1280 = getelementptr [2 x i8], [2 x i8]*@.str1279, i32 0, i32 0
%.tmp1281 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1278, i8* %.tmp1280)
%.tmp1282 = icmp eq i32 %.tmp1281, 0
br i1 %.tmp1282, label %.if.true.1283, label %.if.false.1283
.if.true.1283:
%.tmp1284 = load %m996$.Matcher.type*, %m996$.Matcher.type** %tmp_submatch.1113
%.tmp1285 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1284, i32 0, i32 0
store i8 42, i8* %.tmp1285
%.tmp1286 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1287 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1286, i32 0, i32 0
%.tmp1288 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1289 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1288, i32 0, i32 0
%.tmp1290 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1289
%.tmp1291 = call %m313$.Token.type*(%m313$.Token.type*) @m996$next.m313$.Token.typep.m313$.Token.typep(%m313$.Token.type* %.tmp1290)
store %m313$.Token.type* %.tmp1291, %m313$.Token.type** %.tmp1287
br label %.if.end.1283
.if.false.1283:
%.tmp1292 = load i8*, i8** %nv.1263
%.tmp1294 = getelementptr [2 x i8], [2 x i8]*@.str1293, i32 0, i32 0
%.tmp1295 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1292, i8* %.tmp1294)
%.tmp1296 = icmp eq i32 %.tmp1295, 0
br i1 %.tmp1296, label %.if.true.1297, label %.if.false.1297
.if.true.1297:
%.tmp1298 = load %m996$.Matcher.type*, %m996$.Matcher.type** %tmp_submatch.1113
%.tmp1299 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1298, i32 0, i32 0
store i8 63, i8* %.tmp1299
%.tmp1300 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1301 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1300, i32 0, i32 0
%.tmp1302 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1303 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1302, i32 0, i32 0
%.tmp1304 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1303
%.tmp1305 = call %m313$.Token.type*(%m313$.Token.type*) @m996$next.m313$.Token.typep.m313$.Token.typep(%m313$.Token.type* %.tmp1304)
store %m313$.Token.type* %.tmp1305, %m313$.Token.type** %.tmp1301
br label %.if.end.1297
.if.false.1297:
br label %.if.end.1297
.if.end.1297:
br label %.if.end.1283
.if.end.1283:
br label %.if.end.1269
.if.end.1269:
%.tmp1306 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1111
%.tmp1307 = load %m996$.Matcher.type*, %m996$.Matcher.type** %tmp_submatch.1113
call void(%m996$.Matcher.type*,%m996$.Matcher.type*) @m996$append_submatch.v.m996$.Matcher.typep.m996$.Matcher.typep(%m996$.Matcher.type* %.tmp1306, %m996$.Matcher.type* %.tmp1307)
br label %.for.start.1117
.for.end.1117:
%.tmp1308 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1111
ret %m996$.Matcher.type* %.tmp1308
}
define %m996$.Matcher.type* @m996$parse_single_token.m996$.Matcher.typep.m996$.ParsingContext.typep.m313$.Token.typep(%m996$.ParsingContext.type* %.ctx.arg, %m313$.Token.type* %.t.arg) {
%ctx = alloca %m996$.ParsingContext.type*
store %m996$.ParsingContext.type* %.ctx.arg, %m996$.ParsingContext.type** %ctx
%t = alloca %m313$.Token.type*
store %m313$.Token.type* %.t.arg, %m313$.Token.type** %t
%.tmp1309 = load %m313$.Token.type*, %m313$.Token.type** %t
%.tmp1310 = icmp eq %m313$.Token.type* %.tmp1309, null
br i1 %.tmp1310, label %.if.true.1311, label %.if.false.1311
.if.true.1311:
%.tmp1312 = bitcast ptr null to %m996$.Matcher.type*
ret %m996$.Matcher.type* %.tmp1312
br label %.if.end.1311
.if.false.1311:
br label %.if.end.1311
.if.end.1311:
%.tmp1313 = call %m996$.Matcher.type*() @m996$new_matcher.m996$.Matcher.typep()
%m.1314 = alloca %m996$.Matcher.type*
store %m996$.Matcher.type* %.tmp1313, %m996$.Matcher.type** %m.1314
%.tmp1315 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1314
%.tmp1316 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1315, i32 0, i32 6
%.tmp1317 = load %m313$.Token.type*, %m313$.Token.type** %t
%.tmp1318 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1317, i32 0, i32 1
%.tmp1319 = load i8*, i8** %.tmp1318
store i8* %.tmp1319, i8** %.tmp1316
%.tmp1320 = load %m313$.Token.type*, %m313$.Token.type** %t
%.tmp1321 = call i8*(%m313$.Token.type*) @m996$type.cp.m313$.Token.typep(%m313$.Token.type* %.tmp1320)
%.tmp1323 = getelementptr [7 x i8], [7 x i8]*@.str1322, i32 0, i32 0
%.tmp1324 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1321, i8* %.tmp1323)
%.tmp1325 = icmp eq i32 %.tmp1324, 0
br i1 %.tmp1325, label %.if.true.1326, label %.if.false.1326
.if.true.1326:
%.tmp1327 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1314
%.tmp1328 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1327, i32 0, i32 5
%.tmp1329 = load i8, i8* @TYPE_VALUE
store i8 %.tmp1329, i8* %.tmp1328
br label %.if.end.1326
.if.false.1326:
%.tmp1330 = load %m313$.Token.type*, %m313$.Token.type** %t
%.tmp1331 = call i8*(%m313$.Token.type*) @m996$value.cp.m313$.Token.typep(%m313$.Token.type* %.tmp1330)
%.tmp1332 = call i1(i8*) @m3$is_lower.b.cp(i8* %.tmp1331)
br i1 %.tmp1332, label %.if.true.1333, label %.if.false.1333
.if.true.1333:
%.tmp1334 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1314
%.tmp1335 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1334, i32 0, i32 5
%.tmp1336 = load i8, i8* @TYPE_ALIAS
store i8 %.tmp1336, i8* %.tmp1335
br label %.if.end.1333
.if.false.1333:
%.tmp1337 = load %m313$.Token.type*, %m313$.Token.type** %t
%.tmp1338 = call i8*(%m313$.Token.type*) @m996$value.cp.m313$.Token.typep(%m313$.Token.type* %.tmp1337)
%.tmp1339 = call i1(i8*) @m3$is_upper.b.cp(i8* %.tmp1338)
br i1 %.tmp1339, label %.if.true.1340, label %.if.false.1340
.if.true.1340:
%.tmp1341 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1314
%.tmp1342 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1341, i32 0, i32 5
%.tmp1343 = load i8, i8* @TYPE_TYPE
store i8 %.tmp1343, i8* %.tmp1342
br label %.if.end.1340
.if.false.1340:
%.tmp1344 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1345 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1344, i32 0, i32 1
%.tmp1346 = load %m313$.Token.type*, %m313$.Token.type** %t
%.tmp1348 = getelementptr [50 x i8], [50 x i8]*@.str1347, i32 0, i32 0
%.tmp1349 = call %m312$.Error.type*(%m313$.Token.type*,i8*) @m312$from.m312$.Error.typep.m313$.Token.typep.cp(%m313$.Token.type* %.tmp1346, i8* %.tmp1348)
store %m312$.Error.type* %.tmp1349, %m312$.Error.type** %.tmp1345
%.tmp1350 = bitcast ptr null to %m996$.Matcher.type*
ret %m996$.Matcher.type* %.tmp1350
br label %.if.end.1340
.if.end.1340:
br label %.if.end.1333
.if.end.1333:
br label %.if.end.1326
.if.end.1326:
%.tmp1351 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1314
ret %m996$.Matcher.type* %.tmp1351
}
define %m996$.Rule.type* @m996$parse_rule.m996$.Rule.typep.m996$.ParsingContext.typep(%m996$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m996$.ParsingContext.type*
store %m996$.ParsingContext.type* %.ctx.arg, %m996$.ParsingContext.type** %ctx
%.tmp1352 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1353 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1352, i32 0, i32 0
%.tmp1354 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1353
%.tmp1355 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1354, i32 0, i32 1
%.tmp1356 = load i8*, i8** %.tmp1355
%rule_name.1357 = alloca i8*
store i8* %.tmp1356, i8** %rule_name.1357
%.tmp1358 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1359 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1358, i32 0, i32 0
%.tmp1360 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1359
%.tmp1361 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1360, i32 0, i32 0
%.tmp1362 = load i8*, i8** %.tmp1361
%.tmp1364 = getelementptr [5 x i8], [5 x i8]*@.str1363, i32 0, i32 0
%.tmp1365 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1362, i8* %.tmp1364)
%.tmp1366 = icmp ne i32 %.tmp1365, 0
br i1 %.tmp1366, label %.if.true.1367, label %.if.false.1367
.if.true.1367:
%.tmp1369 = getelementptr [37 x i8], [37 x i8]*@.str1368, i32 0, i32 0
%.tmp1370 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1371 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1370, i32 0, i32 0
%.tmp1372 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1371
%.tmp1373 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1372, i32 0, i32 0
%.tmp1374 = load i8*, i8** %.tmp1373
%.tmp1375 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1376 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1375, i32 0, i32 0
%.tmp1377 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1376
%.tmp1378 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1377, i32 0, i32 1
%.tmp1379 = load i8*, i8** %.tmp1378
%.tmp1380 = call i32(i8*,...) @printf(i8* %.tmp1369, i8* %.tmp1374, i8* %.tmp1379)
%.tmp1381 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1383 = getelementptr [31 x i8], [31 x i8]*@.str1382, i32 0, i32 0
call void(%m996$.ParsingContext.type*,i8*) @m996$parser_error.v.m996$.ParsingContext.typep.cp(%m996$.ParsingContext.type* %.tmp1381, i8* %.tmp1383)
br label %.if.end.1367
.if.false.1367:
br label %.if.end.1367
.if.end.1367:
%.tmp1384 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1385 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1384, i32 0, i32 0
%.tmp1386 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1387 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1386, i32 0, i32 0
%.tmp1388 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1387
%.tmp1389 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1388, i32 0, i32 5
%.tmp1390 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1389
store %m313$.Token.type* %.tmp1390, %m313$.Token.type** %.tmp1385
%.tmp1392 = getelementptr [1 x i8], [1 x i8]*@.str1391, i32 0, i32 0
%transformer_name.1393 = alloca i8*
store i8* %.tmp1392, i8** %transformer_name.1393
%.tmp1394 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1395 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1394, i32 0, i32 0
%.tmp1396 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1395
%.tmp1397 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1396, i32 0, i32 1
%.tmp1398 = load i8*, i8** %.tmp1397
%.tmp1400 = getelementptr [2 x i8], [2 x i8]*@.str1399, i32 0, i32 0
%.tmp1401 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1398, i8* %.tmp1400)
%.tmp1402 = icmp eq i32 %.tmp1401, 0
br i1 %.tmp1402, label %.if.true.1403, label %.if.false.1403
.if.true.1403:
%.tmp1404 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1405 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1404, i32 0, i32 0
%.tmp1406 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1407 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1406, i32 0, i32 0
%.tmp1408 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1407
%.tmp1409 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1408, i32 0, i32 5
%.tmp1410 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1409
store %m313$.Token.type* %.tmp1410, %m313$.Token.type** %.tmp1405
%.tmp1411 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1412 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1411, i32 0, i32 0
%.tmp1413 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1412
%.tmp1414 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1413, i32 0, i32 1
%.tmp1415 = load i8*, i8** %.tmp1414
store i8* %.tmp1415, i8** %transformer_name.1393
%.tmp1416 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1417 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1416, i32 0, i32 0
%.tmp1418 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1419 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1418, i32 0, i32 0
%.tmp1420 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1419
%.tmp1421 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1420, i32 0, i32 5
%.tmp1422 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1421
%.tmp1423 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1422, i32 0, i32 5
%.tmp1424 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1423
store %m313$.Token.type* %.tmp1424, %m313$.Token.type** %.tmp1417
br label %.if.end.1403
.if.false.1403:
br label %.if.end.1403
.if.end.1403:
%.tmp1425 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1426 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1425, i32 0, i32 0
%.tmp1427 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1426
%.tmp1428 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1427, i32 0, i32 1
%.tmp1429 = load i8*, i8** %.tmp1428
%.tmp1431 = getelementptr [2 x i8], [2 x i8]*@.str1430, i32 0, i32 0
%.tmp1432 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1429, i8* %.tmp1431)
%.tmp1433 = icmp ne i32 %.tmp1432, 0
br i1 %.tmp1433, label %.if.true.1434, label %.if.false.1434
.if.true.1434:
%.tmp1435 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1436 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1435, i32 0, i32 0
%.tmp1437 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1436
%.tmp1438 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1437, i32 0, i32 1
%.tmp1439 = load i8*, i8** %.tmp1438
%.tmp1440 = call i32(i8*,...) @printf(i8* %.tmp1439)
%.tmp1442 = getelementptr [1 x i8], [1 x i8]*@.str1441, i32 0, i32 0
%err.1443 = alloca i8*
store i8* %.tmp1442, i8** %err.1443
%.tmp1444 = getelementptr i8*, i8** %err.1443, i32 0
%.tmp1446 = getelementptr [35 x i8], [35 x i8]*@.str1445, i32 0, i32 0
%.tmp1447 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1448 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1447, i32 0, i32 0
%.tmp1449 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1448
%.tmp1450 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1449, i32 0, i32 1
%.tmp1451 = load i8*, i8** %.tmp1450
%.tmp1452 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1444, i8* %.tmp1446, i8* %.tmp1451)
%.tmp1453 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1454 = load i8*, i8** %err.1443
call void(%m996$.ParsingContext.type*,i8*) @m996$parser_error.v.m996$.ParsingContext.typep.cp(%m996$.ParsingContext.type* %.tmp1453, i8* %.tmp1454)
br label %.if.end.1434
.if.false.1434:
br label %.if.end.1434
.if.end.1434:
%.tmp1455 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1456 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1455, i32 0, i32 0
%.tmp1457 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1458 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1457, i32 0, i32 0
%.tmp1459 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1458
%.tmp1460 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1459, i32 0, i32 5
%.tmp1461 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1460
store %m313$.Token.type* %.tmp1461, %m313$.Token.type** %.tmp1456
%.tmp1462 = getelementptr %m996$.Rule.type, %m996$.Rule.type* null, i32 1
%.tmp1463 = ptrtoint %m996$.Rule.type* %.tmp1462 to i32
%.tmp1464 = call i8*(i32) @malloc(i32 %.tmp1463)
%.tmp1465 = bitcast i8* %.tmp1464 to %m996$.Rule.type*
%rule.1466 = alloca %m996$.Rule.type*
store %m996$.Rule.type* %.tmp1465, %m996$.Rule.type** %rule.1466
%.tmp1467 = load %m996$.Rule.type*, %m996$.Rule.type** %rule.1466
%.tmp1468 = getelementptr %m996$.Rule.type, %m996$.Rule.type* %.tmp1467, i32 0, i32 0
%.tmp1469 = load i8*, i8** %rule_name.1357
store i8* %.tmp1469, i8** %.tmp1468
%.tmp1470 = load %m996$.Rule.type*, %m996$.Rule.type** %rule.1466
%.tmp1471 = getelementptr %m996$.Rule.type, %m996$.Rule.type* %.tmp1470, i32 0, i32 1
%.tmp1472 = load i8*, i8** %transformer_name.1393
store i8* %.tmp1472, i8** %.tmp1471
%.tmp1473 = load %m996$.Rule.type*, %m996$.Rule.type** %rule.1466
%.tmp1474 = getelementptr %m996$.Rule.type, %m996$.Rule.type* %.tmp1473, i32 0, i32 2
%.tmp1475 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1476 = call %m996$.Matcher.type*(%m996$.ParsingContext.type*) @m996$parse_matcher.m996$.Matcher.typep.m996$.ParsingContext.typep(%m996$.ParsingContext.type* %.tmp1475)
store %m996$.Matcher.type* %.tmp1476, %m996$.Matcher.type** %.tmp1474
%.tmp1477 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1478 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1477, i32 0, i32 0
%.tmp1479 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1480 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1479, i32 0, i32 0
%.tmp1481 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1480
store %m313$.Token.type* %.tmp1481, %m313$.Token.type** %.tmp1478
%.tmp1482 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1483 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1482, i32 0, i32 0
%.tmp1484 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1483
%.tmp1485 = icmp ne %m313$.Token.type* %.tmp1484, null
br i1 %.tmp1485, label %.if.true.1486, label %.if.false.1486
.if.true.1486:
%.tmp1487 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1488 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1487, i32 0, i32 0
%.tmp1489 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1488
%.tmp1490 = call i8*(%m313$.Token.type*) @m996$type.cp.m313$.Token.typep(%m313$.Token.type* %.tmp1489)
%.tmp1492 = getelementptr [3 x i8], [3 x i8]*@.str1491, i32 0, i32 0
%.tmp1493 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1490, i8* %.tmp1492)
%.tmp1494 = icmp ne i32 %.tmp1493, 0
%.tmp1495 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1496 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1495, i32 0, i32 0
%.tmp1497 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1496
%.tmp1498 = call i8*(%m313$.Token.type*) @m996$type.cp.m313$.Token.typep(%m313$.Token.type* %.tmp1497)
%.tmp1500 = getelementptr [4 x i8], [4 x i8]*@.str1499, i32 0, i32 0
%.tmp1501 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1498, i8* %.tmp1500)
%.tmp1502 = icmp ne i32 %.tmp1501, 0
%.tmp1503 = and i1 %.tmp1494, %.tmp1502
br i1 %.tmp1503, label %.if.true.1504, label %.if.false.1504
.if.true.1504:
%.tmp1506 = getelementptr [58 x i8], [58 x i8]*@.str1505, i32 0, i32 0
%.tmp1507 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1508 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1507, i32 0, i32 0
%.tmp1509 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1508
%.tmp1510 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1509, i32 0, i32 2
%.tmp1511 = load i32, i32* %.tmp1510
%.tmp1512 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1513 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1512, i32 0, i32 0
%.tmp1514 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1513
%.tmp1515 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1514, i32 0, i32 3
%.tmp1516 = load i32, i32* %.tmp1515
%.tmp1517 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1518 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1517, i32 0, i32 0
%.tmp1519 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1518
%.tmp1520 = call i8*(%m313$.Token.type*) @m996$type.cp.m313$.Token.typep(%m313$.Token.type* %.tmp1519)
%.tmp1521 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1522 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1521, i32 0, i32 0
%.tmp1523 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1522
%.tmp1524 = call i8*(%m313$.Token.type*) @m996$value.cp.m313$.Token.typep(%m313$.Token.type* %.tmp1523)
%.tmp1525 = call i32(i8*,...) @printf(i8* %.tmp1506, i32 %.tmp1511, i32 %.tmp1516, i8* %.tmp1520, i8* %.tmp1524)
%.tmp1526 = bitcast ptr null to %m996$.Rule.type*
ret %m996$.Rule.type* %.tmp1526
br label %.if.end.1504
.if.false.1504:
br label %.if.end.1504
.if.end.1504:
br label %.if.end.1486
.if.false.1486:
br label %.if.end.1486
.if.end.1486:
%.tmp1527 = load %m996$.Rule.type*, %m996$.Rule.type** %rule.1466
%.tmp1528 = getelementptr %m996$.Rule.type, %m996$.Rule.type* %.tmp1527, i32 0, i32 2
%.tmp1529 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp1528
%.tmp1530 = icmp eq %m996$.Matcher.type* %.tmp1529, null
br i1 %.tmp1530, label %.if.true.1531, label %.if.false.1531
.if.true.1531:
%.tmp1532 = bitcast ptr null to %m996$.Rule.type*
ret %m996$.Rule.type* %.tmp1532
br label %.if.end.1531
.if.false.1531:
br label %.if.end.1531
.if.end.1531:
%.tmp1533 = load %m996$.Rule.type*, %m996$.Rule.type** %rule.1466
ret %m996$.Rule.type* %.tmp1533
}
define void @m996$parser_error.v.m996$.ParsingContext.typep.cp(%m996$.ParsingContext.type* %.ctx.arg, i8* %.error.arg) {
%ctx = alloca %m996$.ParsingContext.type*
store %m996$.ParsingContext.type* %.ctx.arg, %m996$.ParsingContext.type** %ctx
%error = alloca i8*
store i8* %.error.arg, i8** %error
%.tmp1534 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1535 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1534, i32 0, i32 0
%.tmp1536 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1535
%.tmp1537 = load i8*, i8** %error
%.tmp1538 = call %m312$.Error.type*(%m313$.Token.type*,i8*) @m312$from.m312$.Error.typep.m313$.Token.typep.cp(%m313$.Token.type* %.tmp1536, i8* %.tmp1537)
%e.1539 = alloca %m312$.Error.type*
store %m312$.Error.type* %.tmp1538, %m312$.Error.type** %e.1539
%.tmp1540 = load %m312$.Error.type*, %m312$.Error.type** %e.1539
call void(%m312$.Error.type*) @m312$report.v.m312$.Error.typep(%m312$.Error.type* %.tmp1540)
call void(i32) @exit(i32 1)
ret void
}
define %m996$.Rule.type** @m996$parse_grammar.m996$.Rule.typepp.m996$.ParsingContext.typep(%m996$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m996$.ParsingContext.type*
store %m996$.ParsingContext.type* %.ctx.arg, %m996$.ParsingContext.type** %ctx
%max_rules.1541 = alloca i32
store i32 40, i32* %max_rules.1541
%.tmp1542 = load i32, i32* @ptr_size
%.tmp1543 = load i32, i32* %max_rules.1541
%.tmp1544 = mul i32 %.tmp1542, %.tmp1543
%.tmp1545 = call i8*(i32) @malloc(i32 %.tmp1544)
%.tmp1546 = bitcast i8* %.tmp1545 to %m996$.Rule.type**
%grammar.1547 = alloca %m996$.Rule.type**
store %m996$.Rule.type** %.tmp1546, %m996$.Rule.type*** %grammar.1547
%i.1549 = alloca i32
store i32 0, i32* %i.1549
br label %.for.start.1548
.for.start.1548:
%.tmp1550 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1551 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1550, i32 0, i32 0
%.tmp1552 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1551
%.tmp1553 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1552, i32 0, i32 0
%.tmp1554 = load i8*, i8** %.tmp1553
%.tmp1556 = getelementptr [4 x i8], [4 x i8]*@.str1555, i32 0, i32 0
%.tmp1557 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1554, i8* %.tmp1556)
%.tmp1558 = icmp ne i32 %.tmp1557, 0
br i1 %.tmp1558, label %.for.continue.1548, label %.for.end.1548
.for.continue.1548:
%.tmp1559 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1560 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1559, i32 0, i32 0
%.tmp1561 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1560
%.tmp1562 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1561, i32 0, i32 0
%.tmp1563 = load i8*, i8** %.tmp1562
%.tmp1565 = getelementptr [3 x i8], [3 x i8]*@.str1564, i32 0, i32 0
%.tmp1566 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1563, i8* %.tmp1565)
%.tmp1567 = icmp ne i32 %.tmp1566, 0
br i1 %.tmp1567, label %.if.true.1568, label %.if.false.1568
.if.true.1568:
%.tmp1569 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1570 = call %m996$.Rule.type*(%m996$.ParsingContext.type*) @m996$parse_rule.m996$.Rule.typep.m996$.ParsingContext.typep(%m996$.ParsingContext.type* %.tmp1569)
%rule.1571 = alloca %m996$.Rule.type*
store %m996$.Rule.type* %.tmp1570, %m996$.Rule.type** %rule.1571
%.tmp1572 = load %m996$.Rule.type*, %m996$.Rule.type** %rule.1571
%.tmp1573 = icmp eq %m996$.Rule.type* %.tmp1572, null
br i1 %.tmp1573, label %.if.true.1574, label %.if.false.1574
.if.true.1574:
%.tmp1575 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1576 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1575, i32 0, i32 1
%.tmp1577 = load %m312$.Error.type*, %m312$.Error.type** %.tmp1576
call void(%m312$.Error.type*) @m312$report.v.m312$.Error.typep(%m312$.Error.type* %.tmp1577)
%.tmp1578 = bitcast ptr null to %m996$.Rule.type**
ret %m996$.Rule.type** %.tmp1578
br label %.if.end.1574
.if.false.1574:
br label %.if.end.1574
.if.end.1574:
%.tmp1579 = load i32, i32* %i.1549
%.tmp1580 = load %m996$.Rule.type**, %m996$.Rule.type*** %grammar.1547
%.tmp1581 = getelementptr %m996$.Rule.type*, %m996$.Rule.type** %.tmp1580, i32 %.tmp1579
%.tmp1582 = load %m996$.Rule.type*, %m996$.Rule.type** %rule.1571
store %m996$.Rule.type* %.tmp1582, %m996$.Rule.type** %.tmp1581
%.tmp1583 = load i32, i32* %i.1549
%.tmp1584 = add i32 %.tmp1583, 1
store i32 %.tmp1584, i32* %i.1549
br label %.if.end.1568
.if.false.1568:
%.tmp1585 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1586 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1585, i32 0, i32 0
%.tmp1587 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %ctx
%.tmp1588 = getelementptr %m996$.ParsingContext.type, %m996$.ParsingContext.type* %.tmp1587, i32 0, i32 0
%.tmp1589 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1588
%.tmp1590 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1589, i32 0, i32 5
%.tmp1591 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1590
store %m313$.Token.type* %.tmp1591, %m313$.Token.type** %.tmp1586
br label %.if.end.1568
.if.end.1568:
br label %.for.start.1548
.for.end.1548:
%.tmp1592 = load %m996$.Rule.type**, %m996$.Rule.type*** %grammar.1547
%.tmp1593 = bitcast %m996$.Rule.type** %.tmp1592 to %m996$.Rule.type**
ret %m996$.Rule.type** %.tmp1593
}
%m996$.Node.type = type {i8*,i8*,i8*,i32,i32,i8*,i8*,%m996$.Node.type*,%m996$.Node.type*,%m996$.Node.type*}
define %m996$.Node.type* @m996$new_node.m996$.Node.typep.m313$.Token.typep.cp.cp.cp(%m313$.Token.type* %.t.arg, i8* %.type.arg, i8* %.value.arg, i8* %.tag.arg) {
%t = alloca %m313$.Token.type*
store %m313$.Token.type* %.t.arg, %m313$.Token.type** %t
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%tag = alloca i8*
store i8* %.tag.arg, i8** %tag
%.tmp1594 = getelementptr %m996$.Node.type, %m996$.Node.type* null, i32 1
%.tmp1595 = ptrtoint %m996$.Node.type* %.tmp1594 to i32
%.tmp1596 = call i8*(i32) @malloc(i32 %.tmp1595)
%.tmp1597 = bitcast i8* %.tmp1596 to %m996$.Node.type*
%node.1598 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp1597, %m996$.Node.type** %node.1598
%.tmp1599 = load %m996$.Node.type*, %m996$.Node.type** %node.1598
%.tmp1600 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1599, i32 0, i32 5
%.tmp1602 = getelementptr [1 x i8], [1 x i8]*@.str1601, i32 0, i32 0
store i8* %.tmp1602, i8** %.tmp1600
%.tmp1603 = load %m996$.Node.type*, %m996$.Node.type** %node.1598
%.tmp1604 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1603, i32 0, i32 0
%.tmp1605 = load i8*, i8** %type
store i8* %.tmp1605, i8** %.tmp1604
%.tmp1606 = load %m996$.Node.type*, %m996$.Node.type** %node.1598
%.tmp1607 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1606, i32 0, i32 1
%.tmp1608 = load i8*, i8** %value
store i8* %.tmp1608, i8** %.tmp1607
%.tmp1609 = load %m996$.Node.type*, %m996$.Node.type** %node.1598
%.tmp1610 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1609, i32 0, i32 3
%.tmp1611 = load %m313$.Token.type*, %m313$.Token.type** %t
%.tmp1612 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1611, i32 0, i32 2
%.tmp1613 = load i32, i32* %.tmp1612
store i32 %.tmp1613, i32* %.tmp1610
%.tmp1614 = load %m996$.Node.type*, %m996$.Node.type** %node.1598
%.tmp1615 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1614, i32 0, i32 6
%.tmp1616 = load i8*, i8** %tag
store i8* %.tmp1616, i8** %.tmp1615
%.tmp1617 = load %m996$.Node.type*, %m996$.Node.type** %node.1598
%.tmp1618 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1617, i32 0, i32 2
%.tmp1619 = load %m313$.Token.type*, %m313$.Token.type** %t
%.tmp1620 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1619, i32 0, i32 4
%.tmp1621 = load i8*, i8** %.tmp1620
store i8* %.tmp1621, i8** %.tmp1618
%.tmp1622 = load %m996$.Node.type*, %m996$.Node.type** %node.1598
%.tmp1623 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1622, i32 0, i32 4
%.tmp1624 = load %m313$.Token.type*, %m313$.Token.type** %t
%.tmp1625 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1624, i32 0, i32 3
%.tmp1626 = load i32, i32* %.tmp1625
store i32 %.tmp1626, i32* %.tmp1623
%.tmp1627 = load %m996$.Node.type*, %m996$.Node.type** %node.1598
%.tmp1628 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1627, i32 0, i32 7
store %m996$.Node.type* null, %m996$.Node.type** %.tmp1628
%.tmp1629 = load %m996$.Node.type*, %m996$.Node.type** %node.1598
%.tmp1630 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1629, i32 0, i32 9
store %m996$.Node.type* null, %m996$.Node.type** %.tmp1630
%.tmp1631 = load %m996$.Node.type*, %m996$.Node.type** %node.1598
%.tmp1632 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1631, i32 0, i32 8
store %m996$.Node.type* null, %m996$.Node.type** %.tmp1632
%.tmp1633 = load %m996$.Node.type*, %m996$.Node.type** %node.1598
ret %m996$.Node.type* %.tmp1633
}
define void @m996$child_append.v.m996$.Node.typep.m996$.Node.typep(%m996$.Node.type* %.parent.arg, %m996$.Node.type* %.child.arg) {
%parent = alloca %m996$.Node.type*
store %m996$.Node.type* %.parent.arg, %m996$.Node.type** %parent
%child = alloca %m996$.Node.type*
store %m996$.Node.type* %.child.arg, %m996$.Node.type** %child
%.tmp1634 = load %m996$.Node.type*, %m996$.Node.type** %child
%.tmp1635 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1634, i32 0, i32 7
%.tmp1636 = load %m996$.Node.type*, %m996$.Node.type** %parent
store %m996$.Node.type* %.tmp1636, %m996$.Node.type** %.tmp1635
%.tmp1637 = load %m996$.Node.type*, %m996$.Node.type** %parent
%.tmp1638 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1637, i32 0, i32 8
%.tmp1639 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1638
%.tmp1640 = icmp eq %m996$.Node.type* %.tmp1639, null
br i1 %.tmp1640, label %.if.true.1641, label %.if.false.1641
.if.true.1641:
%.tmp1642 = load %m996$.Node.type*, %m996$.Node.type** %parent
%.tmp1643 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1642, i32 0, i32 8
%.tmp1644 = load %m996$.Node.type*, %m996$.Node.type** %child
store %m996$.Node.type* %.tmp1644, %m996$.Node.type** %.tmp1643
br label %.if.end.1641
.if.false.1641:
%.tmp1645 = load %m996$.Node.type*, %m996$.Node.type** %parent
%.tmp1646 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1645, i32 0, i32 8
%.tmp1647 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1646
%c.1648 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp1647, %m996$.Node.type** %c.1648
br label %.for.start.1649
.for.start.1649:
%.tmp1650 = load %m996$.Node.type*, %m996$.Node.type** %c.1648
%.tmp1651 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1650, i32 0, i32 9
%.tmp1652 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1651
%.tmp1653 = icmp ne %m996$.Node.type* %.tmp1652, null
br i1 %.tmp1653, label %.for.continue.1649, label %.for.end.1649
.for.continue.1649:
%.tmp1654 = load %m996$.Node.type*, %m996$.Node.type** %c.1648
%.tmp1655 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1654, i32 0, i32 9
%.tmp1656 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1655
store %m996$.Node.type* %.tmp1656, %m996$.Node.type** %c.1648
br label %.for.start.1649
.for.end.1649:
%.tmp1657 = load %m996$.Node.type*, %m996$.Node.type** %c.1648
%.tmp1658 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1657, i32 0, i32 9
%.tmp1659 = load %m996$.Node.type*, %m996$.Node.type** %child
store %m996$.Node.type* %.tmp1659, %m996$.Node.type** %.tmp1658
br label %.if.end.1641
.if.end.1641:
%.tmp1660 = load %m996$.Node.type*, %m996$.Node.type** %child
%.tmp1661 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1660, i32 0, i32 9
store %m996$.Node.type* null, %m996$.Node.type** %.tmp1661
ret void
}
define void @m996$child_pop.v.m996$.Node.typep(%m996$.Node.type* %.parent.arg) {
%parent = alloca %m996$.Node.type*
store %m996$.Node.type* %.parent.arg, %m996$.Node.type** %parent
%.tmp1662 = load %m996$.Node.type*, %m996$.Node.type** %parent
%.tmp1663 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1662, i32 0, i32 8
%.tmp1664 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1663
%.tmp1665 = icmp eq %m996$.Node.type* %.tmp1664, null
br i1 %.tmp1665, label %.if.true.1666, label %.if.false.1666
.if.true.1666:
ret void
br label %.if.end.1666
.if.false.1666:
br label %.if.end.1666
.if.end.1666:
%.tmp1667 = load %m996$.Node.type*, %m996$.Node.type** %parent
%.tmp1668 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1667, i32 0, i32 8
%.tmp1669 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1668
%c.1670 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp1669, %m996$.Node.type** %c.1670
%.tmp1671 = load %m996$.Node.type*, %m996$.Node.type** %c.1670
%.tmp1672 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1671, i32 0, i32 9
%.tmp1673 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1672
%.tmp1674 = icmp eq %m996$.Node.type* %.tmp1673, null
br i1 %.tmp1674, label %.if.true.1675, label %.if.false.1675
.if.true.1675:
%.tmp1676 = load %m996$.Node.type*, %m996$.Node.type** %c.1670
%.tmp1677 = bitcast %m996$.Node.type* %.tmp1676 to i8*
call void(i8*) @free(i8* %.tmp1677)
%.tmp1678 = load %m996$.Node.type*, %m996$.Node.type** %parent
%.tmp1679 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1678, i32 0, i32 8
store %m996$.Node.type* null, %m996$.Node.type** %.tmp1679
ret void
br label %.if.end.1675
.if.false.1675:
br label %.if.end.1675
.if.end.1675:
br label %.for.start.1680
.for.start.1680:
%.tmp1681 = load %m996$.Node.type*, %m996$.Node.type** %c.1670
%.tmp1682 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1681, i32 0, i32 9
%.tmp1683 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1682
%.tmp1684 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1683, i32 0, i32 9
%.tmp1685 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1684
%.tmp1686 = icmp ne %m996$.Node.type* %.tmp1685, null
br i1 %.tmp1686, label %.for.continue.1680, label %.for.end.1680
.for.continue.1680:
%.tmp1687 = load %m996$.Node.type*, %m996$.Node.type** %c.1670
%.tmp1688 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1687, i32 0, i32 9
%.tmp1689 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1688
store %m996$.Node.type* %.tmp1689, %m996$.Node.type** %c.1670
br label %.for.start.1680
.for.end.1680:
%.tmp1690 = load %m996$.Node.type*, %m996$.Node.type** %c.1670
%.tmp1691 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1690, i32 0, i32 9
%.tmp1692 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1691
%.tmp1693 = bitcast %m996$.Node.type* %.tmp1692 to i8*
call void(i8*) @free(i8* %.tmp1693)
%.tmp1694 = load %m996$.Node.type*, %m996$.Node.type** %c.1670
%.tmp1695 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1694, i32 0, i32 9
store %m996$.Node.type* null, %m996$.Node.type** %.tmp1695
ret void
}
%m996$.AstContext.type = type {%m313$.Token.type*,%m996$.Rule.type**,%m312$.Error.type*,i32,i32}
define %m996$.AstContext.type* @m996$next_token.m996$.AstContext.typep.m996$.AstContext.typep(%m996$.AstContext.type* %.ctx.arg) {
%ctx = alloca %m996$.AstContext.type*
store %m996$.AstContext.type* %.ctx.arg, %m996$.AstContext.type** %ctx
%.tmp1696 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1697 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1696, i32 0, i32 0
%.tmp1698 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1699 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1698, i32 0, i32 0
%.tmp1700 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1699
%.tmp1701 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1700, i32 0, i32 5
%.tmp1702 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1701
store %m313$.Token.type* %.tmp1702, %m313$.Token.type** %.tmp1697
%.tmp1703 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1704 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1703, i32 0, i32 0
%.tmp1705 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1704
%ct.1706 = alloca %m313$.Token.type*
store %m313$.Token.type* %.tmp1705, %m313$.Token.type** %ct.1706
%.tmp1707 = load %m313$.Token.type*, %m313$.Token.type** %ct.1706
%.tmp1708 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1707, i32 0, i32 2
%.tmp1709 = load i32, i32* %.tmp1708
%.tmp1710 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1711 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1710, i32 0, i32 3
%.tmp1712 = load i32, i32* %.tmp1711
%.tmp1713 = icmp sgt i32 %.tmp1709, %.tmp1712
br i1 %.tmp1713, label %.if.true.1714, label %.if.false.1714
.if.true.1714:
%.tmp1715 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1716 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1715, i32 0, i32 3
%.tmp1717 = load %m313$.Token.type*, %m313$.Token.type** %ct.1706
%.tmp1718 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1717, i32 0, i32 2
%.tmp1719 = load i32, i32* %.tmp1718
store i32 %.tmp1719, i32* %.tmp1716
%.tmp1720 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1721 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1720, i32 0, i32 4
%.tmp1722 = load %m313$.Token.type*, %m313$.Token.type** %ct.1706
%.tmp1723 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1722, i32 0, i32 3
%.tmp1724 = load i32, i32* %.tmp1723
store i32 %.tmp1724, i32* %.tmp1721
br label %.if.end.1714
.if.false.1714:
%.tmp1725 = load %m313$.Token.type*, %m313$.Token.type** %ct.1706
%.tmp1726 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1725, i32 0, i32 2
%.tmp1727 = load i32, i32* %.tmp1726
%.tmp1728 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1729 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1728, i32 0, i32 3
%.tmp1730 = load i32, i32* %.tmp1729
%.tmp1731 = icmp eq i32 %.tmp1727, %.tmp1730
br i1 %.tmp1731, label %.if.true.1732, label %.if.false.1732
.if.true.1732:
%.tmp1733 = load %m313$.Token.type*, %m313$.Token.type** %ct.1706
%.tmp1734 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1733, i32 0, i32 3
%.tmp1735 = load i32, i32* %.tmp1734
%.tmp1736 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1737 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1736, i32 0, i32 4
%.tmp1738 = load i32, i32* %.tmp1737
%.tmp1739 = icmp sgt i32 %.tmp1735, %.tmp1738
br i1 %.tmp1739, label %.if.true.1740, label %.if.false.1740
.if.true.1740:
%.tmp1741 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1742 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1741, i32 0, i32 4
%.tmp1743 = load %m313$.Token.type*, %m313$.Token.type** %ct.1706
%.tmp1744 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1743, i32 0, i32 3
%.tmp1745 = load i32, i32* %.tmp1744
store i32 %.tmp1745, i32* %.tmp1742
br label %.if.end.1740
.if.false.1740:
br label %.if.end.1740
.if.end.1740:
br label %.if.end.1732
.if.false.1732:
br label %.if.end.1732
.if.end.1732:
br label %.if.end.1714
.if.end.1714:
%.tmp1746 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
ret %m996$.AstContext.type* %.tmp1746
}
define %m996$.Rule.type* @m996$find_rule.m996$.Rule.typep.m996$.Rule.typepp.cp(%m996$.Rule.type** %.grammar.arg, i8* %.rule_name.arg) {
%grammar = alloca %m996$.Rule.type**
store %m996$.Rule.type** %.grammar.arg, %m996$.Rule.type*** %grammar
%rule_name = alloca i8*
store i8* %.rule_name.arg, i8** %rule_name
%i.1748 = alloca i32
store i32 0, i32* %i.1748
br label %.for.start.1747
.for.start.1747:
%.tmp1749 = load i32, i32* %i.1748
%.tmp1750 = load %m996$.Rule.type**, %m996$.Rule.type*** %grammar
%.tmp1751 = getelementptr %m996$.Rule.type*, %m996$.Rule.type** %.tmp1750, i32 %.tmp1749
%.tmp1752 = load %m996$.Rule.type*, %m996$.Rule.type** %.tmp1751
%.tmp1753 = icmp ne %m996$.Rule.type* %.tmp1752, null
br i1 %.tmp1753, label %.for.continue.1747, label %.for.end.1747
.for.continue.1747:
%.tmp1754 = load i32, i32* %i.1748
%.tmp1755 = load %m996$.Rule.type**, %m996$.Rule.type*** %grammar
%.tmp1756 = getelementptr %m996$.Rule.type*, %m996$.Rule.type** %.tmp1755, i32 %.tmp1754
%.tmp1757 = load %m996$.Rule.type*, %m996$.Rule.type** %.tmp1756
%rule.1758 = alloca %m996$.Rule.type*
store %m996$.Rule.type* %.tmp1757, %m996$.Rule.type** %rule.1758
%.tmp1759 = load %m996$.Rule.type*, %m996$.Rule.type** %rule.1758
%.tmp1760 = getelementptr %m996$.Rule.type, %m996$.Rule.type* %.tmp1759, i32 0, i32 0
%.tmp1761 = load i8*, i8** %.tmp1760
%.tmp1762 = load i8*, i8** %rule_name
%.tmp1763 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1761, i8* %.tmp1762)
%.tmp1764 = icmp eq i32 %.tmp1763, 0
br i1 %.tmp1764, label %.if.true.1765, label %.if.false.1765
.if.true.1765:
%.tmp1766 = load %m996$.Rule.type*, %m996$.Rule.type** %rule.1758
ret %m996$.Rule.type* %.tmp1766
br label %.if.end.1765
.if.false.1765:
br label %.if.end.1765
.if.end.1765:
%.tmp1767 = load i32, i32* %i.1748
%.tmp1768 = add i32 %.tmp1767, 1
store i32 %.tmp1768, i32* %i.1748
br label %.for.start.1747
.for.end.1747:
%.tmp1769 = bitcast ptr null to %m996$.Rule.type*
ret %m996$.Rule.type* %.tmp1769
}
%m996$.ParseResult.type = type {%m312$.Error.type*,%m996$.Node.type*}
define %m996$.ParseResult.type* @m996$parse_to_ast.m996$.ParseResult.typep.m996$.AstContext.typep.m996$.Rule.typep(%m996$.AstContext.type* %.c.arg, %m996$.Rule.type* %.rule.arg) {
%c = alloca %m996$.AstContext.type*
store %m996$.AstContext.type* %.c.arg, %m996$.AstContext.type** %c
%rule = alloca %m996$.Rule.type*
store %m996$.Rule.type* %.rule.arg, %m996$.Rule.type** %rule
%.tmp1770 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* null, i32 1
%.tmp1771 = ptrtoint %m996$.ParseResult.type* %.tmp1770 to i32
%.tmp1772 = call i8*(i32) @malloc(i32 %.tmp1771)
%.tmp1773 = bitcast i8* %.tmp1772 to %m996$.ParseResult.type*
%res.1774 = alloca %m996$.ParseResult.type*
store %m996$.ParseResult.type* %.tmp1773, %m996$.ParseResult.type** %res.1774
%.tmp1775 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.1774
%.tmp1776 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp1775, i32 0, i32 0
store %m312$.Error.type* null, %m312$.Error.type** %.tmp1776
%.tmp1777 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.1774
%.tmp1778 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp1777, i32 0, i32 1
%.tmp1779 = load %m996$.AstContext.type*, %m996$.AstContext.type** %c
%.tmp1780 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1779, i32 0, i32 0
%.tmp1781 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1780
%.tmp1782 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp1783 = getelementptr %m996$.Rule.type, %m996$.Rule.type* %.tmp1782, i32 0, i32 0
%.tmp1784 = load i8*, i8** %.tmp1783
%.tmp1785 = bitcast ptr null to i8*
%.tmp1786 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp1787 = getelementptr %m996$.Rule.type, %m996$.Rule.type* %.tmp1786, i32 0, i32 2
%.tmp1788 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp1787
%.tmp1789 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1788, i32 0, i32 1
%.tmp1790 = load i8*, i8** %.tmp1789
%.tmp1791 = call %m996$.Node.type*(%m313$.Token.type*,i8*,i8*,i8*) @m996$new_node.m996$.Node.typep.m313$.Token.typep.cp.cp.cp(%m313$.Token.type* %.tmp1781, i8* %.tmp1784, i8* %.tmp1785, i8* %.tmp1790)
store %m996$.Node.type* %.tmp1791, %m996$.Node.type** %.tmp1778
%.tmp1792 = load %m996$.AstContext.type*, %m996$.AstContext.type** %c
%.tmp1793 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1792, i32 0, i32 0
%.tmp1794 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1793
%start_match.1795 = alloca %m313$.Token.type*
store %m313$.Token.type* %.tmp1794, %m313$.Token.type** %start_match.1795
%.tmp1796 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.1774
%.tmp1797 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp1796, i32 0, i32 1
%.tmp1798 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1797
%.tmp1799 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1798, i32 0, i32 5
%.tmp1800 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp1801 = getelementptr %m996$.Rule.type, %m996$.Rule.type* %.tmp1800, i32 0, i32 1
%.tmp1802 = load i8*, i8** %.tmp1801
store i8* %.tmp1802, i8** %.tmp1799
%.tmp1803 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.1774
%.tmp1804 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp1803, i32 0, i32 0
%.tmp1805 = load %m996$.AstContext.type*, %m996$.AstContext.type** %c
%.tmp1806 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp1807 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp1808 = getelementptr %m996$.Rule.type, %m996$.Rule.type* %.tmp1807, i32 0, i32 2
%.tmp1809 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp1808
%.tmp1810 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.1774
%.tmp1811 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp1810, i32 0, i32 1
%.tmp1812 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1811
%.tmp1813 = call %m312$.Error.type*(%m996$.AstContext.type*,%m996$.Rule.type*,%m996$.Matcher.type*,%m996$.Node.type*) @m996$execute_matcher.m312$.Error.typep.m996$.AstContext.typep.m996$.Rule.typep.m996$.Matcher.typep.m996$.Node.typep(%m996$.AstContext.type* %.tmp1805, %m996$.Rule.type* %.tmp1806, %m996$.Matcher.type* %.tmp1809, %m996$.Node.type* %.tmp1812)
store %m312$.Error.type* %.tmp1813, %m312$.Error.type** %.tmp1804
%.tmp1814 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.1774
ret %m996$.ParseResult.type* %.tmp1814
}
define %m312$.Error.type* @m996$execute_matcher.m312$.Error.typep.m996$.AstContext.typep.m996$.Rule.typep.m996$.Matcher.typep.m996$.Node.typep(%m996$.AstContext.type* %.ctx.arg, %m996$.Rule.type* %.rule.arg, %m996$.Matcher.type* %.matcher.arg, %m996$.Node.type* %.root.arg) {
%ctx = alloca %m996$.AstContext.type*
store %m996$.AstContext.type* %.ctx.arg, %m996$.AstContext.type** %ctx
%rule = alloca %m996$.Rule.type*
store %m996$.Rule.type* %.rule.arg, %m996$.Rule.type** %rule
%matcher = alloca %m996$.Matcher.type*
store %m996$.Matcher.type* %.matcher.arg, %m996$.Matcher.type** %matcher
%root = alloca %m996$.Node.type*
store %m996$.Node.type* %.root.arg, %m996$.Node.type** %root
%.tmp1815 = bitcast ptr null to %m312$.Error.type*
%err.1816 = alloca %m312$.Error.type*
store %m312$.Error.type* %.tmp1815, %m312$.Error.type** %err.1816
%.tmp1818 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%m.1819 = alloca %m996$.Matcher.type*
store %m996$.Matcher.type* %.tmp1818, %m996$.Matcher.type** %m.1819
br label %.for.start.1817
.for.start.1817:
%.tmp1820 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1819
%.tmp1821 = icmp ne %m996$.Matcher.type* %.tmp1820, null
br i1 %.tmp1821, label %.for.continue.1817, label %.for.end.1817
.for.continue.1817:
%.tmp1822 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1823 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp1824 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1819
%.tmp1825 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp1826 = call %m312$.Error.type*(%m996$.AstContext.type*,%m996$.Rule.type*,%m996$.Matcher.type*,%m996$.Node.type*) @m996$execute_matcher_straight.m312$.Error.typep.m996$.AstContext.typep.m996$.Rule.typep.m996$.Matcher.typep.m996$.Node.typep(%m996$.AstContext.type* %.tmp1822, %m996$.Rule.type* %.tmp1823, %m996$.Matcher.type* %.tmp1824, %m996$.Node.type* %.tmp1825)
store %m312$.Error.type* %.tmp1826, %m312$.Error.type** %err.1816
%.tmp1827 = load %m312$.Error.type*, %m312$.Error.type** %err.1816
%.tmp1828 = icmp eq %m312$.Error.type* %.tmp1827, null
br i1 %.tmp1828, label %.if.true.1829, label %.if.false.1829
.if.true.1829:
br label %.for.end.1817
br label %.if.end.1829
.if.false.1829:
br label %.if.end.1829
.if.end.1829:
%.tmp1830 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1819
%.tmp1831 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1830, i32 0, i32 2
%.tmp1832 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp1831
store %m996$.Matcher.type* %.tmp1832, %m996$.Matcher.type** %m.1819
br label %.for.start.1817
.for.end.1817:
%.tmp1833 = load %m312$.Error.type*, %m312$.Error.type** %err.1816
ret %m312$.Error.type* %.tmp1833
}
define %m312$.Error.type* @m996$execute_matcher_straight.m312$.Error.typep.m996$.AstContext.typep.m996$.Rule.typep.m996$.Matcher.typep.m996$.Node.typep(%m996$.AstContext.type* %.ctx.arg, %m996$.Rule.type* %.rule.arg, %m996$.Matcher.type* %.matcher.arg, %m996$.Node.type* %.root.arg) {
%ctx = alloca %m996$.AstContext.type*
store %m996$.AstContext.type* %.ctx.arg, %m996$.AstContext.type** %ctx
%rule = alloca %m996$.Rule.type*
store %m996$.Rule.type* %.rule.arg, %m996$.Rule.type** %rule
%matcher = alloca %m996$.Matcher.type*
store %m996$.Matcher.type* %.matcher.arg, %m996$.Matcher.type** %matcher
%root = alloca %m996$.Node.type*
store %m996$.Node.type* %.root.arg, %m996$.Node.type** %root
%.tmp1835 = getelementptr [1 x i8], [1 x i8]*@.str1834, i32 0, i32 0
%buf.1836 = alloca i8*
store i8* %.tmp1835, i8** %buf.1836
%.tmp1837 = bitcast ptr null to %m312$.Error.type*
%err.1838 = alloca %m312$.Error.type*
store %m312$.Error.type* %.tmp1837, %m312$.Error.type** %err.1838
%.tmp1839 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1840 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1839, i32 0, i32 0
%.tmp1841 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1840
%anchor.1842 = alloca %m313$.Token.type*
store %m313$.Token.type* %.tmp1841, %m313$.Token.type** %anchor.1842
%.tmp1843 = bitcast ptr null to %m996$.Node.type*
%child.1844 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp1843, %m996$.Node.type** %child.1844
%.tmp1845 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1846 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1845, i32 0, i32 5
%.tmp1847 = load i8, i8* %.tmp1846
%.tmp1848 = load i8, i8* @TYPE_IGNORE
%.tmp1849 = icmp eq i8 %.tmp1847, %.tmp1848
br i1 %.tmp1849, label %.if.true.1850, label %.if.false.1850
.if.true.1850:
%.tmp1851 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1852 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1851, i32 0, i32 4
%.tmp1853 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp1852
%.tmp1854 = icmp ne %m996$.Matcher.type* %.tmp1853, null
br i1 %.tmp1854, label %.if.true.1855, label %.if.false.1855
.if.true.1855:
%.tmp1856 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1857 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp1858 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1859 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1858, i32 0, i32 4
%.tmp1860 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp1859
%.tmp1861 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp1862 = call %m312$.Error.type*(%m996$.AstContext.type*,%m996$.Rule.type*,%m996$.Matcher.type*,%m996$.Node.type*) @m996$execute_matcher.m312$.Error.typep.m996$.AstContext.typep.m996$.Rule.typep.m996$.Matcher.typep.m996$.Node.typep(%m996$.AstContext.type* %.tmp1856, %m996$.Rule.type* %.tmp1857, %m996$.Matcher.type* %.tmp1860, %m996$.Node.type* %.tmp1861)
store %m312$.Error.type* %.tmp1862, %m312$.Error.type** %err.1838
br label %.if.end.1855
.if.false.1855:
br label %.if.end.1855
.if.end.1855:
br label %.if.end.1850
.if.false.1850:
%.tmp1863 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1864 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1863, i32 0, i32 5
%.tmp1865 = load i8, i8* %.tmp1864
%.tmp1866 = load i8, i8* @TYPE_VALUE
%.tmp1867 = icmp eq i8 %.tmp1865, %.tmp1866
br i1 %.tmp1867, label %.if.true.1868, label %.if.false.1868
.if.true.1868:
%.tmp1869 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1870 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1869, i32 0, i32 6
%.tmp1871 = load i8*, i8** %.tmp1870
%.tmp1872 = icmp eq i8* %.tmp1871, null
br i1 %.tmp1872, label %.if.true.1873, label %.if.false.1873
.if.true.1873:
%.tmp1875 = getelementptr [22 x i8], [22 x i8]*@.str1874, i32 0, i32 0
%.tmp1876 = call i32(i8*,...) @printf(i8* %.tmp1875)
br label %.if.end.1873
.if.false.1873:
br label %.if.end.1873
.if.end.1873:
%.tmp1877 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1878 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1877, i32 0, i32 6
%.tmp1879 = load i8*, i8** %.tmp1878
%.tmp1880 = call i32(i8*) @strlen(i8* %.tmp1879)
%.tmp1881 = sub i32 %.tmp1880, 1
%.tmp1882 = call i8*(i32) @malloc(i32 %.tmp1881)
%buf.1883 = alloca i8*
store i8* %.tmp1882, i8** %buf.1883
%.tmp1884 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1885 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1884, i32 0, i32 6
%.tmp1886 = load i8*, i8** %.tmp1885
%.tmp1888 = getelementptr [8 x i8], [8 x i8]*@.str1887, i32 0, i32 0
%.tmp1889 = load i8*, i8** %buf.1883
%.tmp1890 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp1886, i8* %.tmp1888, i8* %.tmp1889)
%.tmp1891 = load i8*, i8** %buf.1883
%.tmp1892 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1893 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1892, i32 0, i32 0
%.tmp1894 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1893
%.tmp1895 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1894, i32 0, i32 1
%.tmp1896 = load i8*, i8** %.tmp1895
%.tmp1897 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1891, i8* %.tmp1896)
%.tmp1898 = icmp ne i32 %.tmp1897, 0
br i1 %.tmp1898, label %.if.true.1899, label %.if.false.1899
.if.true.1899:
%.tmp1900 = getelementptr i8*, i8** %buf.1883, i32 0
%.tmp1902 = getelementptr [43 x i8], [43 x i8]*@.str1901, i32 0, i32 0
%.tmp1903 = load i8*, i8** %buf.1883
%.tmp1904 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1905 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1904, i32 0, i32 0
%.tmp1906 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1905
%.tmp1907 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1906, i32 0, i32 1
%.tmp1908 = load i8*, i8** %.tmp1907
%.tmp1909 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1900, i8* %.tmp1902, i8* %.tmp1903, i8* %.tmp1908)
%.tmp1910 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1911 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1910, i32 0, i32 0
%.tmp1912 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1911
%.tmp1913 = load i8*, i8** %buf.1883
%.tmp1914 = call %m312$.Error.type*(%m313$.Token.type*,i8*) @m312$from.m312$.Error.typep.m313$.Token.typep.cp(%m313$.Token.type* %.tmp1912, i8* %.tmp1913)
ret %m312$.Error.type* %.tmp1914
br label %.if.end.1899
.if.false.1899:
br label %.if.end.1899
.if.end.1899:
%.tmp1915 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1916 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1915, i32 0, i32 0
%.tmp1917 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1916
%.tmp1918 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1919 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1918, i32 0, i32 0
%.tmp1920 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1919
%.tmp1921 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1920, i32 0, i32 0
%.tmp1922 = load i8*, i8** %.tmp1921
%.tmp1923 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1924 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1923, i32 0, i32 0
%.tmp1925 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1924
%.tmp1926 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1925, i32 0, i32 1
%.tmp1927 = load i8*, i8** %.tmp1926
%.tmp1928 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1929 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1928, i32 0, i32 1
%.tmp1930 = load i8*, i8** %.tmp1929
%.tmp1931 = call %m996$.Node.type*(%m313$.Token.type*,i8*,i8*,i8*) @m996$new_node.m996$.Node.typep.m313$.Token.typep.cp.cp.cp(%m313$.Token.type* %.tmp1917, i8* %.tmp1922, i8* %.tmp1927, i8* %.tmp1930)
store %m996$.Node.type* %.tmp1931, %m996$.Node.type** %child.1844
%.tmp1932 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1933 = call %m996$.AstContext.type*(%m996$.AstContext.type*) @m996$next_token.m996$.AstContext.typep.m996$.AstContext.typep(%m996$.AstContext.type* %.tmp1932)
store %m996$.AstContext.type* %.tmp1933, %m996$.AstContext.type** %ctx
br label %.if.end.1868
.if.false.1868:
%.tmp1934 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1935 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1934, i32 0, i32 5
%.tmp1936 = load i8, i8* %.tmp1935
%.tmp1937 = load i8, i8* @TYPE_TYPE
%.tmp1938 = icmp eq i8 %.tmp1936, %.tmp1937
br i1 %.tmp1938, label %.if.true.1939, label %.if.false.1939
.if.true.1939:
%.tmp1940 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1941 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1940, i32 0, i32 6
%.tmp1942 = load i8*, i8** %.tmp1941
%.tmp1943 = icmp eq i8* %.tmp1942, null
br i1 %.tmp1943, label %.if.true.1944, label %.if.false.1944
.if.true.1944:
%.tmp1946 = getelementptr [22 x i8], [22 x i8]*@.str1945, i32 0, i32 0
%.tmp1947 = call i32(i8*,...) @printf(i8* %.tmp1946)
br label %.if.end.1944
.if.false.1944:
br label %.if.end.1944
.if.end.1944:
%.tmp1948 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1949 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1948, i32 0, i32 6
%.tmp1950 = load i8*, i8** %.tmp1949
%.tmp1951 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1952 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1951, i32 0, i32 0
%.tmp1953 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1952
%.tmp1954 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1953, i32 0, i32 0
%.tmp1955 = load i8*, i8** %.tmp1954
%.tmp1956 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1950, i8* %.tmp1955)
%.tmp1957 = icmp ne i32 %.tmp1956, 0
br i1 %.tmp1957, label %.if.true.1958, label %.if.false.1958
.if.true.1958:
%.tmp1959 = getelementptr i8*, i8** %buf.1836, i32 0
%.tmp1961 = getelementptr [54 x i8], [54 x i8]*@.str1960, i32 0, i32 0
%.tmp1962 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1963 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1962, i32 0, i32 6
%.tmp1964 = load i8*, i8** %.tmp1963
%.tmp1965 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1966 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1965, i32 0, i32 0
%.tmp1967 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1966
%.tmp1968 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1967, i32 0, i32 0
%.tmp1969 = load i8*, i8** %.tmp1968
%.tmp1970 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1959, i8* %.tmp1961, i8* %.tmp1964, i8* %.tmp1969)
%.tmp1971 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1972 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1971, i32 0, i32 0
%.tmp1973 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1972
%.tmp1974 = load i8*, i8** %buf.1836
%.tmp1975 = call %m312$.Error.type*(%m313$.Token.type*,i8*) @m312$from.m312$.Error.typep.m313$.Token.typep.cp(%m313$.Token.type* %.tmp1973, i8* %.tmp1974)
ret %m312$.Error.type* %.tmp1975
br label %.if.end.1958
.if.false.1958:
br label %.if.end.1958
.if.end.1958:
%.tmp1976 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1977 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1976, i32 0, i32 0
%.tmp1978 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1977
%.tmp1979 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1980 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1979, i32 0, i32 0
%.tmp1981 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1980
%.tmp1982 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1981, i32 0, i32 0
%.tmp1983 = load i8*, i8** %.tmp1982
%.tmp1984 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1985 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1984, i32 0, i32 0
%.tmp1986 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1985
%.tmp1987 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1986, i32 0, i32 1
%.tmp1988 = load i8*, i8** %.tmp1987
%.tmp1989 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1990 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1989, i32 0, i32 1
%.tmp1991 = load i8*, i8** %.tmp1990
%.tmp1992 = call %m996$.Node.type*(%m313$.Token.type*,i8*,i8*,i8*) @m996$new_node.m996$.Node.typep.m313$.Token.typep.cp.cp.cp(%m313$.Token.type* %.tmp1978, i8* %.tmp1983, i8* %.tmp1988, i8* %.tmp1991)
store %m996$.Node.type* %.tmp1992, %m996$.Node.type** %child.1844
%.tmp1993 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1994 = call %m996$.AstContext.type*(%m996$.AstContext.type*) @m996$next_token.m996$.AstContext.typep.m996$.AstContext.typep(%m996$.AstContext.type* %.tmp1993)
store %m996$.AstContext.type* %.tmp1994, %m996$.AstContext.type** %ctx
br label %.if.end.1939
.if.false.1939:
%.tmp1995 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1996 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1995, i32 0, i32 5
%.tmp1997 = load i8, i8* %.tmp1996
%.tmp1998 = load i8, i8* @TYPE_ALIAS
%.tmp1999 = icmp eq i8 %.tmp1997, %.tmp1998
br i1 %.tmp1999, label %.if.true.2000, label %.if.false.2000
.if.true.2000:
%.tmp2001 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp2002 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp2001, i32 0, i32 1
%.tmp2003 = load %m996$.Rule.type**, %m996$.Rule.type*** %.tmp2002
%.tmp2004 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2005 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp2004, i32 0, i32 6
%.tmp2006 = load i8*, i8** %.tmp2005
%.tmp2007 = call %m996$.Rule.type*(%m996$.Rule.type**,i8*) @m996$find_rule.m996$.Rule.typep.m996$.Rule.typepp.cp(%m996$.Rule.type** %.tmp2003, i8* %.tmp2006)
%alias_rule.2008 = alloca %m996$.Rule.type*
store %m996$.Rule.type* %.tmp2007, %m996$.Rule.type** %alias_rule.2008
%.tmp2009 = load %m996$.Rule.type*, %m996$.Rule.type** %alias_rule.2008
%.tmp2010 = icmp eq %m996$.Rule.type* %.tmp2009, null
br i1 %.tmp2010, label %.if.true.2011, label %.if.false.2011
.if.true.2011:
%.tmp2012 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp2013 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp2012, i32 0, i32 0
%.tmp2014 = load %m313$.Token.type*, %m313$.Token.type** %.tmp2013
%.tmp2016 = getelementptr [26 x i8], [26 x i8]*@.str2015, i32 0, i32 0
%.tmp2017 = call %m312$.Error.type*(%m313$.Token.type*,i8*) @m312$from.m312$.Error.typep.m313$.Token.typep.cp(%m313$.Token.type* %.tmp2014, i8* %.tmp2016)
ret %m312$.Error.type* %.tmp2017
br label %.if.end.2011
.if.false.2011:
br label %.if.end.2011
.if.end.2011:
%.tmp2018 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp2019 = load %m996$.Rule.type*, %m996$.Rule.type** %alias_rule.2008
%.tmp2020 = call %m996$.ParseResult.type*(%m996$.AstContext.type*,%m996$.Rule.type*) @m996$parse_to_ast.m996$.ParseResult.typep.m996$.AstContext.typep.m996$.Rule.typep(%m996$.AstContext.type* %.tmp2018, %m996$.Rule.type* %.tmp2019)
%parse_result.2021 = alloca %m996$.ParseResult.type*
store %m996$.ParseResult.type* %.tmp2020, %m996$.ParseResult.type** %parse_result.2021
%.tmp2022 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %parse_result.2021
%.tmp2023 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2022, i32 0, i32 0
%.tmp2024 = load %m312$.Error.type*, %m312$.Error.type** %.tmp2023
%.tmp2025 = icmp ne %m312$.Error.type* %.tmp2024, null
br i1 %.tmp2025, label %.if.true.2026, label %.if.false.2026
.if.true.2026:
%.tmp2027 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %parse_result.2021
%.tmp2028 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2027, i32 0, i32 0
%.tmp2029 = load %m312$.Error.type*, %m312$.Error.type** %.tmp2028
ret %m312$.Error.type* %.tmp2029
br label %.if.end.2026
.if.false.2026:
br label %.if.end.2026
.if.end.2026:
%.tmp2030 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %parse_result.2021
%.tmp2031 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2030, i32 0, i32 1
%.tmp2032 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2031
store %m996$.Node.type* %.tmp2032, %m996$.Node.type** %child.1844
%.tmp2033 = load %m996$.Node.type*, %m996$.Node.type** %child.1844
%.tmp2034 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2033, i32 0, i32 6
%.tmp2035 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2036 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp2035, i32 0, i32 1
%.tmp2037 = load i8*, i8** %.tmp2036
store i8* %.tmp2037, i8** %.tmp2034
%.tmp2038 = load %m996$.Node.type*, %m996$.Node.type** %child.1844
%.tmp2039 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2038, i32 0, i32 5
%.tmp2040 = load %m996$.Rule.type*, %m996$.Rule.type** %alias_rule.2008
%.tmp2041 = getelementptr %m996$.Rule.type, %m996$.Rule.type* %.tmp2040, i32 0, i32 1
%.tmp2042 = load i8*, i8** %.tmp2041
store i8* %.tmp2042, i8** %.tmp2039
br label %.if.end.2000
.if.false.2000:
%.tmp2044 = getelementptr [33 x i8], [33 x i8]*@.str2043, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp2044)
br label %.if.end.2000
.if.end.2000:
br label %.if.end.1939
.if.end.1939:
br label %.if.end.1868
.if.end.1868:
br label %.if.end.1850
.if.end.1850:
%.tmp2045 = load %m996$.Node.type*, %m996$.Node.type** %child.1844
%.tmp2046 = icmp ne %m996$.Node.type* %.tmp2045, null
br i1 %.tmp2046, label %.if.true.2047, label %.if.false.2047
.if.true.2047:
%.tmp2048 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp2049 = load %m996$.Node.type*, %m996$.Node.type** %child.1844
call void(%m996$.Node.type*,%m996$.Node.type*) @m996$child_append.v.m996$.Node.typep.m996$.Node.typep(%m996$.Node.type* %.tmp2048, %m996$.Node.type* %.tmp2049)
br label %.if.end.2047
.if.false.2047:
br label %.if.end.2047
.if.end.2047:
%.tmp2050 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2051 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp2050, i32 0, i32 0
%.tmp2052 = load i8, i8* %.tmp2051
%.tmp2053 = icmp eq i8 %.tmp2052, 63
%.tmp2054 = load %m312$.Error.type*, %m312$.Error.type** %err.1838
%.tmp2055 = icmp ne %m312$.Error.type* %.tmp2054, null
%.tmp2056 = and i1 %.tmp2053, %.tmp2055
br i1 %.tmp2056, label %.if.true.2057, label %.if.false.2057
.if.true.2057:
store %m312$.Error.type* null, %m312$.Error.type** %err.1838
br label %.if.end.2057
.if.false.2057:
%.tmp2058 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2059 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp2058, i32 0, i32 0
%.tmp2060 = load i8, i8* %.tmp2059
%.tmp2061 = icmp eq i8 %.tmp2060, 42
br i1 %.tmp2061, label %.if.true.2062, label %.if.false.2062
.if.true.2062:
%.tmp2063 = load %m312$.Error.type*, %m312$.Error.type** %err.1838
%.tmp2064 = icmp ne %m312$.Error.type* %.tmp2063, null
br i1 %.tmp2064, label %.if.true.2065, label %.if.false.2065
.if.true.2065:
store %m312$.Error.type* null, %m312$.Error.type** %err.1838
br label %.if.end.2065
.if.false.2065:
%.tmp2066 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp2067 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp2068 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2069 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp2070 = call %m312$.Error.type*(%m996$.AstContext.type*,%m996$.Rule.type*,%m996$.Matcher.type*,%m996$.Node.type*) @m996$execute_matcher.m312$.Error.typep.m996$.AstContext.typep.m996$.Rule.typep.m996$.Matcher.typep.m996$.Node.typep(%m996$.AstContext.type* %.tmp2066, %m996$.Rule.type* %.tmp2067, %m996$.Matcher.type* %.tmp2068, %m996$.Node.type* %.tmp2069)
ret %m312$.Error.type* %.tmp2070
br label %.if.end.2065
.if.end.2065:
br label %.if.end.2062
.if.false.2062:
%.tmp2071 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2072 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp2071, i32 0, i32 0
%.tmp2073 = load i8, i8* %.tmp2072
%.tmp2074 = icmp eq i8 %.tmp2073, 43
%.tmp2075 = load %m312$.Error.type*, %m312$.Error.type** %err.1838
%.tmp2076 = icmp eq %m312$.Error.type* %.tmp2075, null
%.tmp2077 = and i1 %.tmp2074, %.tmp2076
br i1 %.tmp2077, label %.if.true.2078, label %.if.false.2078
.if.true.2078:
%.tmp2079 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp2080 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp2081 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2082 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp2083 = call %m312$.Error.type*(%m996$.AstContext.type*,%m996$.Rule.type*,%m996$.Matcher.type*,%m996$.Node.type*) @m996$execute_matcher.m312$.Error.typep.m996$.AstContext.typep.m996$.Rule.typep.m996$.Matcher.typep.m996$.Node.typep(%m996$.AstContext.type* %.tmp2079, %m996$.Rule.type* %.tmp2080, %m996$.Matcher.type* %.tmp2081, %m996$.Node.type* %.tmp2082)
store %m312$.Error.type* %.tmp2083, %m312$.Error.type** %err.1838
%.tmp2084 = load %m312$.Error.type*, %m312$.Error.type** %err.1838
%.tmp2085 = icmp ne %m312$.Error.type* %.tmp2084, null
br i1 %.tmp2085, label %.if.true.2086, label %.if.false.2086
.if.true.2086:
store %m312$.Error.type* null, %m312$.Error.type** %err.1838
br label %.if.end.2086
.if.false.2086:
%.tmp2087 = bitcast ptr null to %m312$.Error.type*
ret %m312$.Error.type* %.tmp2087
br label %.if.end.2086
.if.end.2086:
br label %.if.end.2078
.if.false.2078:
br label %.if.end.2078
.if.end.2078:
br label %.if.end.2062
.if.end.2062:
br label %.if.end.2057
.if.end.2057:
%.tmp2088 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2089 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp2088, i32 0, i32 3
%.tmp2090 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp2089
%.tmp2091 = icmp ne %m996$.Matcher.type* %.tmp2090, null
%.tmp2092 = load %m312$.Error.type*, %m312$.Error.type** %err.1838
%.tmp2093 = icmp eq %m312$.Error.type* %.tmp2092, null
%.tmp2094 = and i1 %.tmp2091, %.tmp2093
br i1 %.tmp2094, label %.if.true.2095, label %.if.false.2095
.if.true.2095:
%.tmp2096 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp2097 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp2098 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2099 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp2098, i32 0, i32 3
%.tmp2100 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp2099
%.tmp2101 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp2102 = call %m312$.Error.type*(%m996$.AstContext.type*,%m996$.Rule.type*,%m996$.Matcher.type*,%m996$.Node.type*) @m996$execute_matcher.m312$.Error.typep.m996$.AstContext.typep.m996$.Rule.typep.m996$.Matcher.typep.m996$.Node.typep(%m996$.AstContext.type* %.tmp2096, %m996$.Rule.type* %.tmp2097, %m996$.Matcher.type* %.tmp2100, %m996$.Node.type* %.tmp2101)
store %m312$.Error.type* %.tmp2102, %m312$.Error.type** %err.1838
br label %.if.end.2095
.if.false.2095:
br label %.if.end.2095
.if.end.2095:
%.tmp2103 = load %m312$.Error.type*, %m312$.Error.type** %err.1838
%.tmp2104 = icmp ne %m312$.Error.type* %.tmp2103, null
br i1 %.tmp2104, label %.if.true.2105, label %.if.false.2105
.if.true.2105:
%.tmp2106 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp2107 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp2106, i32 0, i32 0
%.tmp2108 = load %m313$.Token.type*, %m313$.Token.type** %anchor.1842
store %m313$.Token.type* %.tmp2108, %m313$.Token.type** %.tmp2107
%.tmp2109 = load %m996$.Node.type*, %m996$.Node.type** %child.1844
%.tmp2110 = icmp ne %m996$.Node.type* %.tmp2109, null
br i1 %.tmp2110, label %.if.true.2111, label %.if.false.2111
.if.true.2111:
%.tmp2112 = load %m996$.Node.type*, %m996$.Node.type** %root
call void(%m996$.Node.type*) @m996$child_pop.v.m996$.Node.typep(%m996$.Node.type* %.tmp2112)
br label %.if.end.2111
.if.false.2111:
br label %.if.end.2111
.if.end.2111:
br label %.if.end.2105
.if.false.2105:
br label %.if.end.2105
.if.end.2105:
%.tmp2113 = load %m312$.Error.type*, %m312$.Error.type** %err.1838
ret %m312$.Error.type* %.tmp2113
}
define %m996$.ParseResult.type* @m996$ast.m996$.ParseResult.typep.m996$.Rule.typepp.cp.m313$.Token.typep(%m996$.Rule.type** %.grammar.arg, i8* %.start.arg, %m313$.Token.type* %.tokens.arg) {
%grammar = alloca %m996$.Rule.type**
store %m996$.Rule.type** %.grammar.arg, %m996$.Rule.type*** %grammar
%start = alloca i8*
store i8* %.start.arg, i8** %start
%tokens = alloca %m313$.Token.type*
store %m313$.Token.type* %.tokens.arg, %m313$.Token.type** %tokens
%.tmp2114 = load %m996$.Rule.type**, %m996$.Rule.type*** %grammar
%.tmp2115 = load i8*, i8** %start
%.tmp2116 = call %m996$.Rule.type*(%m996$.Rule.type**,i8*) @m996$find_rule.m996$.Rule.typep.m996$.Rule.typepp.cp(%m996$.Rule.type** %.tmp2114, i8* %.tmp2115)
%start_matcher.2117 = alloca %m996$.Rule.type*
store %m996$.Rule.type* %.tmp2116, %m996$.Rule.type** %start_matcher.2117
%.tmp2118 = load %m996$.Rule.type*, %m996$.Rule.type** %start_matcher.2117
%.tmp2119 = icmp eq %m996$.Rule.type* %.tmp2118, null
br i1 %.tmp2119, label %.if.true.2120, label %.if.false.2120
.if.true.2120:
%.tmp2121 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* null, i32 1
%.tmp2122 = ptrtoint %m996$.ParseResult.type* %.tmp2121 to i32
%.tmp2123 = call i8*(i32) @malloc(i32 %.tmp2122)
%.tmp2124 = bitcast i8* %.tmp2123 to %m996$.ParseResult.type*
%res.2125 = alloca %m996$.ParseResult.type*
store %m996$.ParseResult.type* %.tmp2124, %m996$.ParseResult.type** %res.2125
%.tmp2126 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.2125
%.tmp2127 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2126, i32 0, i32 1
store %m996$.Node.type* null, %m996$.Node.type** %.tmp2127
%.tmp2129 = getelementptr [1 x i8], [1 x i8]*@.str2128, i32 0, i32 0
%buf.2130 = alloca i8*
store i8* %.tmp2129, i8** %buf.2130
%.tmp2131 = getelementptr i8*, i8** %buf.2130, i32 0
%.tmp2133 = getelementptr [29 x i8], [29 x i8]*@.str2132, i32 0, i32 0
%.tmp2134 = load i8*, i8** %start
%.tmp2135 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2131, i8* %.tmp2133, i8* %.tmp2134)
%.tmp2136 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.2125
%.tmp2137 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2136, i32 0, i32 0
%.tmp2139 = getelementptr [10 x i8], [10 x i8]*@.str2138, i32 0, i32 0
%.tmp2140 = load i8*, i8** %buf.2130
%.tmp2141 = call %m312$.Error.type*(i8*,i32,i32,i8*) @m312$new.m312$.Error.typep.cp.i.i.cp(i8* %.tmp2139, i32 0, i32 0, i8* %.tmp2140)
store %m312$.Error.type* %.tmp2141, %m312$.Error.type** %.tmp2137
%.tmp2142 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.2125
ret %m996$.ParseResult.type* %.tmp2142
br label %.if.end.2120
.if.false.2120:
br label %.if.end.2120
.if.end.2120:
%.tmp2143 = load %m996$.Rule.type*, %m996$.Rule.type** %start_matcher.2117
%.tmp2144 = icmp ne %m996$.Rule.type* %.tmp2143, null
%.tmp2146 = getelementptr [44 x i8], [44 x i8]*@.str2145, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2144, i8* %.tmp2146)
%c.2147 = alloca %m996$.AstContext.type
%.tmp2148 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2147, i32 0, i32 0
store %m313$.Token.type* null, %m313$.Token.type** %.tmp2148
%.tmp2149 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2147, i32 0, i32 1
store %m996$.Rule.type** null, %m996$.Rule.type*** %.tmp2149
%.tmp2150 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2147, i32 0, i32 2
store %m312$.Error.type* null, %m312$.Error.type** %.tmp2150
%.tmp2151 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2147, i32 0, i32 3
store i32 0, i32* %.tmp2151
%.tmp2152 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2147, i32 0, i32 4
store i32 0, i32* %.tmp2152
%.tmp2153 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2147, i32 0, i32 0
%.tmp2154 = load %m313$.Token.type*, %m313$.Token.type** %tokens
store %m313$.Token.type* %.tmp2154, %m313$.Token.type** %.tmp2153
%.tmp2155 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2147, i32 0, i32 1
%.tmp2156 = load %m996$.Rule.type**, %m996$.Rule.type*** %grammar
store %m996$.Rule.type** %.tmp2156, %m996$.Rule.type*** %.tmp2155
%.tmp2157 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2147, i32 0
%.tmp2158 = load %m996$.Rule.type*, %m996$.Rule.type** %start_matcher.2117
%.tmp2159 = call %m996$.ParseResult.type*(%m996$.AstContext.type*,%m996$.Rule.type*) @m996$parse_to_ast.m996$.ParseResult.typep.m996$.AstContext.typep.m996$.Rule.typep(%m996$.AstContext.type* %.tmp2157, %m996$.Rule.type* %.tmp2158)
%res.2160 = alloca %m996$.ParseResult.type*
store %m996$.ParseResult.type* %.tmp2159, %m996$.ParseResult.type** %res.2160
%.tmp2161 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2147, i32 0, i32 0
%.tmp2162 = load %m313$.Token.type*, %m313$.Token.type** %.tmp2161
%.tmp2163 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp2162, i32 0, i32 0
%.tmp2164 = load i8*, i8** %.tmp2163
%.tmp2166 = getelementptr [4 x i8], [4 x i8]*@.str2165, i32 0, i32 0
%.tmp2167 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2164, i8* %.tmp2166)
%.tmp2168 = icmp ne i32 %.tmp2167, 0
%.tmp2169 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.2160
%.tmp2170 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2169, i32 0, i32 0
%.tmp2171 = load %m312$.Error.type*, %m312$.Error.type** %.tmp2170
%.tmp2172 = icmp eq %m312$.Error.type* %.tmp2171, null
%.tmp2173 = and i1 %.tmp2168, %.tmp2172
br i1 %.tmp2173, label %.if.true.2174, label %.if.false.2174
.if.true.2174:
%.tmp2175 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.2160
%.tmp2176 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2175, i32 0, i32 0
%.tmp2177 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2147, i32 0, i32 0
%.tmp2178 = load %m313$.Token.type*, %m313$.Token.type** %.tmp2177
%.tmp2180 = getelementptr [32 x i8], [32 x i8]*@.str2179, i32 0, i32 0
%.tmp2181 = call %m312$.Error.type*(%m313$.Token.type*,i8*) @m312$from.m312$.Error.typep.m313$.Token.typep.cp(%m313$.Token.type* %.tmp2178, i8* %.tmp2180)
store %m312$.Error.type* %.tmp2181, %m312$.Error.type** %.tmp2176
%.tmp2182 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.2160
%.tmp2183 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2182, i32 0, i32 0
%.tmp2184 = load %m312$.Error.type*, %m312$.Error.type** %.tmp2183
%.tmp2185 = getelementptr %m312$.Error.type, %m312$.Error.type* %.tmp2184, i32 0, i32 0
%.tmp2186 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2147, i32 0, i32 3
%.tmp2187 = load i32, i32* %.tmp2186
store i32 %.tmp2187, i32* %.tmp2185
%.tmp2188 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.2160
%.tmp2189 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2188, i32 0, i32 0
%.tmp2190 = load %m312$.Error.type*, %m312$.Error.type** %.tmp2189
%.tmp2191 = getelementptr %m312$.Error.type, %m312$.Error.type* %.tmp2190, i32 0, i32 1
%.tmp2192 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2147, i32 0, i32 4
%.tmp2193 = load i32, i32* %.tmp2192
store i32 %.tmp2193, i32* %.tmp2191
br label %.if.end.2174
.if.false.2174:
br label %.if.end.2174
.if.end.2174:
%.tmp2194 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.2160
ret %m996$.ParseResult.type* %.tmp2194
}
define %m996$.Node.type* @m996$find_tag.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.root.arg, i8* %.tag.arg) {
%root = alloca %m996$.Node.type*
store %m996$.Node.type* %.root.arg, %m996$.Node.type** %root
%tag = alloca i8*
store i8* %.tag.arg, i8** %tag
%.tmp2195 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp2196 = icmp eq %m996$.Node.type* %.tmp2195, null
br i1 %.tmp2196, label %.if.true.2197, label %.if.false.2197
.if.true.2197:
%.tmp2198 = bitcast ptr null to %m996$.Node.type*
ret %m996$.Node.type* %.tmp2198
br label %.if.end.2197
.if.false.2197:
br label %.if.end.2197
.if.end.2197:
%.tmp2199 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp2200 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2199, i32 0, i32 6
%.tmp2201 = load i8*, i8** %.tmp2200
%.tmp2202 = load i8*, i8** %tag
%.tmp2203 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2201, i8* %.tmp2202)
%.tmp2204 = icmp eq i32 %.tmp2203, 0
br i1 %.tmp2204, label %.if.true.2205, label %.if.false.2205
.if.true.2205:
%.tmp2206 = load %m996$.Node.type*, %m996$.Node.type** %root
ret %m996$.Node.type* %.tmp2206
br label %.if.end.2205
.if.false.2205:
br label %.if.end.2205
.if.end.2205:
%.tmp2208 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp2209 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2208, i32 0, i32 9
%.tmp2210 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2209
%n.2211 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp2210, %m996$.Node.type** %n.2211
br label %.for.start.2207
.for.start.2207:
%.tmp2212 = load %m996$.Node.type*, %m996$.Node.type** %n.2211
%.tmp2213 = icmp ne %m996$.Node.type* %.tmp2212, null
br i1 %.tmp2213, label %.for.continue.2207, label %.for.end.2207
.for.continue.2207:
%.tmp2214 = load %m996$.Node.type*, %m996$.Node.type** %n.2211
%.tmp2215 = load i8*, i8** %tag
%.tmp2216 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m996$find_tag.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp2214, i8* %.tmp2215)
%node.2217 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp2216, %m996$.Node.type** %node.2217
%.tmp2218 = load %m996$.Node.type*, %m996$.Node.type** %node.2217
%.tmp2219 = icmp ne %m996$.Node.type* %.tmp2218, null
br i1 %.tmp2219, label %.if.true.2220, label %.if.false.2220
.if.true.2220:
%.tmp2221 = load %m996$.Node.type*, %m996$.Node.type** %node.2217
ret %m996$.Node.type* %.tmp2221
br label %.if.end.2220
.if.false.2220:
br label %.if.end.2220
.if.end.2220:
%.tmp2222 = load %m996$.Node.type*, %m996$.Node.type** %n.2211
%.tmp2223 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2222, i32 0, i32 9
%.tmp2224 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2223
store %m996$.Node.type* %.tmp2224, %m996$.Node.type** %n.2211
br label %.for.start.2207
.for.end.2207:
%.tmp2226 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp2227 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2226, i32 0, i32 8
%.tmp2228 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2227
%n.2229 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp2228, %m996$.Node.type** %n.2229
br label %.for.start.2225
.for.start.2225:
%.tmp2230 = load %m996$.Node.type*, %m996$.Node.type** %n.2229
%.tmp2231 = icmp ne %m996$.Node.type* %.tmp2230, null
br i1 %.tmp2231, label %.for.continue.2225, label %.for.end.2225
.for.continue.2225:
%.tmp2232 = load %m996$.Node.type*, %m996$.Node.type** %n.2229
%.tmp2233 = load i8*, i8** %tag
%.tmp2234 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m996$find_tag.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp2232, i8* %.tmp2233)
%node.2235 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp2234, %m996$.Node.type** %node.2235
%.tmp2236 = load %m996$.Node.type*, %m996$.Node.type** %node.2235
%.tmp2237 = icmp ne %m996$.Node.type* %.tmp2236, null
br i1 %.tmp2237, label %.if.true.2238, label %.if.false.2238
.if.true.2238:
%.tmp2239 = load %m996$.Node.type*, %m996$.Node.type** %node.2235
ret %m996$.Node.type* %.tmp2239
br label %.if.end.2238
.if.false.2238:
br label %.if.end.2238
.if.end.2238:
%.tmp2240 = load %m996$.Node.type*, %m996$.Node.type** %n.2229
%.tmp2241 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2240, i32 0, i32 9
%.tmp2242 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2241
store %m996$.Node.type* %.tmp2242, %m996$.Node.type** %n.2229
br label %.for.start.2225
.for.end.2225:
%.tmp2243 = bitcast ptr null to %m996$.Node.type*
ret %m996$.Node.type* %.tmp2243
}
define %m996$.Node.type* @m996$next_tag.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.node.arg, i8* %.tag.arg) {
%node = alloca %m996$.Node.type*
store %m996$.Node.type* %.node.arg, %m996$.Node.type** %node
%tag = alloca i8*
store i8* %.tag.arg, i8** %tag
%.tmp2244 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2245 = icmp eq %m996$.Node.type* %.tmp2244, null
br i1 %.tmp2245, label %.if.true.2246, label %.if.false.2246
.if.true.2246:
%.tmp2247 = bitcast ptr null to %m996$.Node.type*
ret %m996$.Node.type* %.tmp2247
br label %.if.end.2246
.if.false.2246:
br label %.if.end.2246
.if.end.2246:
%.tmp2249 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2250 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2249, i32 0, i32 9
%.tmp2251 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2250
%n.2252 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp2251, %m996$.Node.type** %n.2252
br label %.for.start.2248
.for.start.2248:
%.tmp2253 = load %m996$.Node.type*, %m996$.Node.type** %n.2252
%.tmp2254 = icmp ne %m996$.Node.type* %.tmp2253, null
br i1 %.tmp2254, label %.for.continue.2248, label %.for.end.2248
.for.continue.2248:
%.tmp2255 = load %m996$.Node.type*, %m996$.Node.type** %n.2252
%.tmp2256 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2255, i32 0, i32 6
%.tmp2257 = load i8*, i8** %.tmp2256
%.tmp2258 = load i8*, i8** %tag
%.tmp2259 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2257, i8* %.tmp2258)
%.tmp2260 = icmp eq i32 %.tmp2259, 0
br i1 %.tmp2260, label %.if.true.2261, label %.if.false.2261
.if.true.2261:
%.tmp2262 = load %m996$.Node.type*, %m996$.Node.type** %n.2252
ret %m996$.Node.type* %.tmp2262
br label %.if.end.2261
.if.false.2261:
br label %.if.end.2261
.if.end.2261:
%.tmp2263 = load %m996$.Node.type*, %m996$.Node.type** %n.2252
%.tmp2264 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2263, i32 0, i32 9
%.tmp2265 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2264
store %m996$.Node.type* %.tmp2265, %m996$.Node.type** %n.2252
br label %.for.start.2248
.for.end.2248:
%.tmp2266 = bitcast ptr null to %m996$.Node.type*
ret %m996$.Node.type* %.tmp2266
}
define %m996$.Node.type* @m996$nearest_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m996$.Node.type*
store %m996$.Node.type* %.node.arg, %m996$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp2267 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2268 = icmp eq %m996$.Node.type* %.tmp2267, null
br i1 %.tmp2268, label %.if.true.2269, label %.if.false.2269
.if.true.2269:
%.tmp2270 = bitcast ptr null to %m996$.Node.type*
ret %m996$.Node.type* %.tmp2270
br label %.if.end.2269
.if.false.2269:
br label %.if.end.2269
.if.end.2269:
%.tmp2271 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2272 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2271, i32 0, i32 0
%.tmp2273 = load i8*, i8** %.tmp2272
%.tmp2274 = load i8*, i8** %type
%.tmp2275 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2273, i8* %.tmp2274)
%.tmp2276 = icmp eq i32 %.tmp2275, 0
br i1 %.tmp2276, label %.if.true.2277, label %.if.false.2277
.if.true.2277:
%.tmp2278 = load %m996$.Node.type*, %m996$.Node.type** %node
ret %m996$.Node.type* %.tmp2278
br label %.if.end.2277
.if.false.2277:
br label %.if.end.2277
.if.end.2277:
%.tmp2279 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2280 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2279, i32 0, i32 7
%.tmp2281 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2280
%.tmp2282 = load i8*, i8** %type
%.tmp2283 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m996$nearest_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp2281, i8* %.tmp2282)
ret %m996$.Node.type* %.tmp2283
}
define i8* @m2284$node_to_string.cp.m996$.Node.typep(%m996$.Node.type* %.n.arg) {
%n = alloca %m996$.Node.type*
store %m996$.Node.type* %.n.arg, %m996$.Node.type** %n
%.tmp2285 = call %m0$.File.type*() @tmpfile()
%tmp.2286 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2285, %m0$.File.type** %tmp.2286
%.tmp2287 = load %m996$.Node.type*, %m996$.Node.type** %n
%.tmp2288 = load %m0$.File.type*, %m0$.File.type** %tmp.2286
call void(%m996$.Node.type*,%m0$.File.type*,i32) @m2284$_node_to_string.v.m996$.Node.typep.m0$.File.typep.i(%m996$.Node.type* %.tmp2287, %m0$.File.type* %.tmp2288, i32 1)
%.tmp2289 = load %m0$.File.type*, %m0$.File.type** %tmp.2286
%.tmp2290 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp2289)
%.tmp2291 = load %m0$.File.type*, %m0$.File.type** %tmp.2286
%.tmp2292 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp2291)
%str_len.2293 = alloca i32
store i32 %.tmp2292, i32* %str_len.2293
%.tmp2294 = load %m0$.File.type*, %m0$.File.type** %tmp.2286
%.tmp2295 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp2294)
%tmp_fd.2296 = alloca i32
store i32 %.tmp2295, i32* %tmp_fd.2296
%.tmp2297 = load i32, i32* %tmp_fd.2296
%.tmp2298 = load i32, i32* @SEEK_SET
%.tmp2299 = call i32(i32,i32,i32) @lseek(i32 %.tmp2297, i32 0, i32 %.tmp2298)
%.tmp2300 = load i32, i32* %str_len.2293
%.tmp2301 = call i8*(i32) @malloc(i32 %.tmp2300)
%buf.2302 = alloca i8*
store i8* %.tmp2301, i8** %buf.2302
%.tmp2303 = load i32, i32* %tmp_fd.2296
%.tmp2304 = load i8*, i8** %buf.2302
%.tmp2305 = load i32, i32* %str_len.2293
%.tmp2306 = call i32(i32,i8*,i32) @read(i32 %.tmp2303, i8* %.tmp2304, i32 %.tmp2305)
%read.2307 = alloca i32
store i32 %.tmp2306, i32* %read.2307
%.tmp2308 = load i32, i32* %read.2307
%.tmp2309 = load i32, i32* %str_len.2293
%.tmp2310 = icmp ne i32 %.tmp2308, %.tmp2309
br i1 %.tmp2310, label %.if.true.2311, label %.if.false.2311
.if.true.2311:
%.tmp2312 = load i8*, i8** %buf.2302
call void(i8*) @free(i8* %.tmp2312)
store i8* null, i8** %buf.2302
br label %.if.end.2311
.if.false.2311:
br label %.if.end.2311
.if.end.2311:
%.tmp2313 = load i8*, i8** %buf.2302
ret i8* %.tmp2313
}
define void @m2284$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp2314 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2316 = getelementptr [2 x i8], [2 x i8]*@.str2315, i32 0, i32 0
%.tmp2317 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2314, i8* %.tmp2316)
%i.2319 = alloca i32
store i32 0, i32* %i.2319
br label %.for.start.2318
.for.start.2318:
%.tmp2320 = load i32, i32* %i.2319
%.tmp2321 = load i32, i32* %indent
%.tmp2322 = icmp slt i32 %.tmp2320, %.tmp2321
br i1 %.tmp2322, label %.for.continue.2318, label %.for.end.2318
.for.continue.2318:
%.tmp2323 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2325 = getelementptr [3 x i8], [3 x i8]*@.str2324, i32 0, i32 0
%.tmp2326 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2323, i8* %.tmp2325)
%.tmp2327 = load i32, i32* %i.2319
%.tmp2328 = add i32 %.tmp2327, 1
store i32 %.tmp2328, i32* %i.2319
br label %.for.start.2318
.for.end.2318:
ret void
}
define void @m2284$_node_to_string.v.m996$.Node.typep.m0$.File.typep.i(%m996$.Node.type* %.node.arg, %m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%node = alloca %m996$.Node.type*
store %m996$.Node.type* %.node.arg, %m996$.Node.type** %node
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp2329 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2330 = icmp eq %m996$.Node.type* %.tmp2329, null
br i1 %.tmp2330, label %.if.true.2331, label %.if.false.2331
.if.true.2331:
%.tmp2332 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2334 = getelementptr [7 x i8], [7 x i8]*@.str2333, i32 0, i32 0
%.tmp2335 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2332, i8* %.tmp2334)
ret void
br label %.if.end.2331
.if.false.2331:
br label %.if.end.2331
.if.end.2331:
%.tmp2336 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2338 = getelementptr [2 x i8], [2 x i8]*@.str2337, i32 0, i32 0
%.tmp2339 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2336, i8* %.tmp2338)
%.tmp2340 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2341 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2284$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2340, i32 %.tmp2341)
%.tmp2342 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2344 = getelementptr [13 x i8], [13 x i8]*@.str2343, i32 0, i32 0
%.tmp2345 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2346 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2345, i32 0, i32 0
%.tmp2347 = load i8*, i8** %.tmp2346
%.tmp2348 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2342, i8* %.tmp2344, i8* %.tmp2347)
%.tmp2349 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2350 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2284$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2349, i32 %.tmp2350)
%.tmp2351 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2353 = getelementptr [12 x i8], [12 x i8]*@.str2352, i32 0, i32 0
%.tmp2354 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2355 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2354, i32 0, i32 1
%.tmp2356 = load i8*, i8** %.tmp2355
%.tmp2357 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2351, i8* %.tmp2353, i8* %.tmp2356)
%.tmp2358 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2359 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2284$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2358, i32 %.tmp2359)
%.tmp2360 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2362 = getelementptr [11 x i8], [11 x i8]*@.str2361, i32 0, i32 0
%.tmp2363 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2364 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2363, i32 0, i32 3
%.tmp2365 = load i32, i32* %.tmp2364
%.tmp2366 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2360, i8* %.tmp2362, i32 %.tmp2365)
%.tmp2367 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2368 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2284$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2367, i32 %.tmp2368)
%.tmp2369 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2371 = getelementptr [19 x i8], [19 x i8]*@.str2370, i32 0, i32 0
%.tmp2372 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2373 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2372, i32 0, i32 4
%.tmp2374 = load i32, i32* %.tmp2373
%.tmp2375 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2369, i8* %.tmp2371, i32 %.tmp2374)
%.tmp2376 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2377 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2284$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2376, i32 %.tmp2377)
%.tmp2378 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2380 = getelementptr [9 x i8], [9 x i8]*@.str2379, i32 0, i32 0
%.tmp2381 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2378, i8* %.tmp2380)
%.tmp2382 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2383 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2382, i32 0, i32 9
%.tmp2384 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2383
%.tmp2385 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2386 = load i32, i32* %indent
%.tmp2387 = add i32 %.tmp2386, 1
call void(%m996$.Node.type*,%m0$.File.type*,i32) @m2284$_node_to_string.v.m996$.Node.typep.m0$.File.typep.i(%m996$.Node.type* %.tmp2384, %m0$.File.type* %.tmp2385, i32 %.tmp2387)
%.tmp2388 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2389 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2284$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2388, i32 %.tmp2389)
%.tmp2390 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2392 = getelementptr [13 x i8], [13 x i8]*@.str2391, i32 0, i32 0
%.tmp2393 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2390, i8* %.tmp2392)
%.tmp2394 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2395 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2394, i32 0, i32 8
%.tmp2396 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2395
%.tmp2397 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2398 = load i32, i32* %indent
%.tmp2399 = add i32 %.tmp2398, 1
call void(%m996$.Node.type*,%m0$.File.type*,i32) @m2284$_node_to_string.v.m996$.Node.typep.m0$.File.typep.i(%m996$.Node.type* %.tmp2396, %m0$.File.type* %.tmp2397, i32 %.tmp2399)
%.tmp2400 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2401 = load i32, i32* %indent
%.tmp2402 = sub i32 %.tmp2401, 1
call void(%m0$.File.type*,i32) @m2284$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2400, i32 %.tmp2402)
%.tmp2403 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2405 = getelementptr [2 x i8], [2 x i8]*@.str2404, i32 0, i32 0
%.tmp2406 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2403, i8* %.tmp2405)
ret void
}
define i8* @m2407$grammar.cp() {
%.tmp2409 = getelementptr [1998 x i8], [1998 x i8]*@.str2408, i32 0, i32 0
ret i8* %.tmp2409
}
define i8* @m2410$append_tmpl.cp() {
%.tmp2412 = getelementptr [1885 x i8], [1885 x i8]*@.str2411, i32 0, i32 0
ret i8* %.tmp2412
}
define i8* @m2413$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp2414 = load i8*, i8** %text
%.tmp2415 = call i32(i8*) @strlen(i8* %.tmp2414)
%str_len.2416 = alloca i32
store i32 %.tmp2415, i32* %str_len.2416
%.tmp2418 = getelementptr [1 x i8], [1 x i8]*@.str2417, i32 0, i32 0
%buf.2419 = alloca i8*
store i8* %.tmp2418, i8** %buf.2419
%i.2421 = alloca i32
store i32 1, i32* %i.2421
br label %.for.start.2420
.for.start.2420:
%.tmp2422 = load i32, i32* %i.2421
%.tmp2423 = load i32, i32* %str_len.2416
%.tmp2424 = sub i32 %.tmp2423, 1
%.tmp2425 = icmp slt i32 %.tmp2422, %.tmp2424
br i1 %.tmp2425, label %.for.continue.2420, label %.for.end.2420
.for.continue.2420:
%.tmp2426 = load i32, i32* %i.2421
%.tmp2427 = load i8*, i8** %text
%.tmp2428 = getelementptr i8, i8* %.tmp2427, i32 %.tmp2426
%.tmp2429 = load i8, i8* %.tmp2428
%.tmp2430 = icmp eq i8 %.tmp2429, 34
br i1 %.tmp2430, label %.if.true.2431, label %.if.false.2431
.if.true.2431:
%.tmp2432 = getelementptr i8*, i8** %buf.2419, i32 0
%.tmp2434 = getelementptr [6 x i8], [6 x i8]*@.str2433, i32 0, i32 0
%.tmp2435 = load i8*, i8** %buf.2419
%.tmp2436 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2432, i8* %.tmp2434, i8* %.tmp2435)
br label %.if.end.2431
.if.false.2431:
%.tmp2437 = load i32, i32* %i.2421
%.tmp2438 = load i8*, i8** %text
%.tmp2439 = getelementptr i8, i8* %.tmp2438, i32 %.tmp2437
%.tmp2440 = load i8, i8* %.tmp2439
%.tmp2441 = icmp eq i8 %.tmp2440, 92
br i1 %.tmp2441, label %.if.true.2442, label %.if.false.2442
.if.true.2442:
%.tmp2443 = load i32, i32* %i.2421
%.tmp2444 = add i32 %.tmp2443, 1
%.tmp2445 = load i8*, i8** %text
%.tmp2446 = getelementptr i8, i8* %.tmp2445, i32 %.tmp2444
%.tmp2447 = load i8, i8* %.tmp2446
%.tmp2448 = icmp eq i8 %.tmp2447, 110
%.tmp2449 = load i32, i32* %i.2421
%.tmp2450 = add i32 %.tmp2449, 1
%.tmp2451 = load i8*, i8** %text
%.tmp2452 = getelementptr i8, i8* %.tmp2451, i32 %.tmp2450
%.tmp2453 = load i8, i8* %.tmp2452
%.tmp2454 = icmp eq i8 %.tmp2453, 78
%.tmp2455 = or i1 %.tmp2448, %.tmp2454
br i1 %.tmp2455, label %.if.true.2456, label %.if.false.2456
.if.true.2456:
%.tmp2457 = getelementptr i8*, i8** %buf.2419, i32 0
%.tmp2459 = getelementptr [6 x i8], [6 x i8]*@.str2458, i32 0, i32 0
%.tmp2460 = load i8*, i8** %buf.2419
%.tmp2461 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2457, i8* %.tmp2459, i8* %.tmp2460)
%.tmp2462 = load i32, i32* %i.2421
%.tmp2463 = add i32 %.tmp2462, 1
store i32 %.tmp2463, i32* %i.2421
br label %.if.end.2456
.if.false.2456:
%.tmp2464 = load i32, i32* %i.2421
%.tmp2465 = add i32 %.tmp2464, 1
%.tmp2466 = load i8*, i8** %text
%.tmp2467 = getelementptr i8, i8* %.tmp2466, i32 %.tmp2465
%.tmp2468 = load i8, i8* %.tmp2467
%.tmp2469 = icmp eq i8 %.tmp2468, 92
br i1 %.tmp2469, label %.if.true.2470, label %.if.false.2470
.if.true.2470:
%.tmp2471 = getelementptr i8*, i8** %buf.2419, i32 0
%.tmp2473 = getelementptr [6 x i8], [6 x i8]*@.str2472, i32 0, i32 0
%.tmp2474 = load i8*, i8** %buf.2419
%.tmp2475 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2471, i8* %.tmp2473, i8* %.tmp2474)
%.tmp2476 = load i32, i32* %i.2421
%.tmp2477 = add i32 %.tmp2476, 1
store i32 %.tmp2477, i32* %i.2421
br label %.if.end.2470
.if.false.2470:
%.tmp2478 = load i32, i32* %i.2421
%.tmp2479 = add i32 %.tmp2478, 1
%.tmp2480 = load i8*, i8** %text
%.tmp2481 = getelementptr i8, i8* %.tmp2480, i32 %.tmp2479
%.tmp2482 = load i8, i8* %.tmp2481
%.tmp2483 = icmp eq i8 %.tmp2482, 120
br i1 %.tmp2483, label %.if.true.2484, label %.if.false.2484
.if.true.2484:
%.tmp2485 = load i32, i32* %i.2421
%.tmp2486 = add i32 %.tmp2485, 2
store i32 %.tmp2486, i32* %i.2421
%.tmp2487 = getelementptr i8*, i8** %buf.2419, i32 0
%.tmp2489 = getelementptr [8 x i8], [8 x i8]*@.str2488, i32 0, i32 0
%.tmp2490 = load i8*, i8** %buf.2419
%.tmp2491 = load i32, i32* %i.2421
%.tmp2492 = load i8*, i8** %text
%.tmp2493 = getelementptr i8, i8* %.tmp2492, i32 %.tmp2491
%.tmp2494 = load i8, i8* %.tmp2493
%.tmp2495 = call i8(i8) @toupper(i8 %.tmp2494)
%.tmp2496 = load i32, i32* %i.2421
%.tmp2497 = add i32 %.tmp2496, 1
%.tmp2498 = load i8*, i8** %text
%.tmp2499 = getelementptr i8, i8* %.tmp2498, i32 %.tmp2497
%.tmp2500 = load i8, i8* %.tmp2499
%.tmp2501 = call i8(i8) @toupper(i8 %.tmp2500)
%.tmp2502 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2487, i8* %.tmp2489, i8* %.tmp2490, i8 %.tmp2495, i8 %.tmp2501)
%.tmp2503 = load i32, i32* %i.2421
%.tmp2504 = add i32 %.tmp2503, 1
store i32 %.tmp2504, i32* %i.2421
br label %.if.end.2484
.if.false.2484:
%.tmp2505 = getelementptr i8*, i8** %buf.2419, i32 0
%.tmp2507 = getelementptr [5 x i8], [5 x i8]*@.str2506, i32 0, i32 0
%.tmp2508 = load i8*, i8** %buf.2419
%.tmp2509 = load i32, i32* %i.2421
%.tmp2510 = load i8*, i8** %text
%.tmp2511 = getelementptr i8, i8* %.tmp2510, i32 %.tmp2509
%.tmp2512 = load i8, i8* %.tmp2511
%.tmp2513 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2505, i8* %.tmp2507, i8* %.tmp2508, i8 %.tmp2512)
br label %.if.end.2484
.if.end.2484:
br label %.if.end.2470
.if.end.2470:
br label %.if.end.2456
.if.end.2456:
br label %.if.end.2442
.if.false.2442:
%.tmp2514 = getelementptr i8*, i8** %buf.2419, i32 0
%.tmp2516 = getelementptr [5 x i8], [5 x i8]*@.str2515, i32 0, i32 0
%.tmp2517 = load i8*, i8** %buf.2419
%.tmp2518 = load i32, i32* %i.2421
%.tmp2519 = load i8*, i8** %text
%.tmp2520 = getelementptr i8, i8* %.tmp2519, i32 %.tmp2518
%.tmp2521 = load i8, i8* %.tmp2520
%.tmp2522 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2514, i8* %.tmp2516, i8* %.tmp2517, i8 %.tmp2521)
br label %.if.end.2442
.if.end.2442:
br label %.if.end.2431
.if.end.2431:
%.tmp2523 = load i32, i32* %i.2421
%.tmp2524 = add i32 %.tmp2523, 1
store i32 %.tmp2524, i32* %i.2421
br label %.for.start.2420
.for.end.2420:
%.tmp2525 = getelementptr i8*, i8** %buf.2419, i32 0
%.tmp2527 = getelementptr [9 x i8], [9 x i8]*@.str2526, i32 0, i32 0
%.tmp2528 = load i8*, i8** %buf.2419
%.tmp2529 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2525, i8* %.tmp2527, i8* %.tmp2528)
%.tmp2530 = load i8*, i8** %buf.2419
ret i8* %.tmp2530
}
define i32 @m2413$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len.2531 = alloca i32
store i32 0, i32* %len.2531
%i.2533 = alloca i32
store i32 2, i32* %i.2533
br label %.for.start.2532
.for.start.2532:
%.tmp2534 = load i32, i32* %i.2533
%.tmp2535 = load i8*, i8** %text
%.tmp2536 = getelementptr i8, i8* %.tmp2535, i32 %.tmp2534
%.tmp2537 = load i8, i8* %.tmp2536
%.tmp2538 = icmp ne i8 %.tmp2537, 0
br i1 %.tmp2538, label %.for.continue.2532, label %.for.end.2532
.for.continue.2532:
%.tmp2539 = load i32, i32* %i.2533
%.tmp2540 = load i8*, i8** %text
%.tmp2541 = getelementptr i8, i8* %.tmp2540, i32 %.tmp2539
%.tmp2542 = load i8, i8* %.tmp2541
%.tmp2543 = icmp eq i8 %.tmp2542, 92
br i1 %.tmp2543, label %.if.true.2544, label %.if.false.2544
.if.true.2544:
%.tmp2545 = load i32, i32* %i.2533
%.tmp2546 = add i32 %.tmp2545, 2
store i32 %.tmp2546, i32* %i.2533
br label %.if.end.2544
.if.false.2544:
br label %.if.end.2544
.if.end.2544:
%.tmp2547 = load i32, i32* %len.2531
%.tmp2548 = add i32 %.tmp2547, 1
store i32 %.tmp2548, i32* %len.2531
%.tmp2549 = load i32, i32* %i.2533
%.tmp2550 = add i32 %.tmp2549, 1
store i32 %.tmp2550, i32* %i.2533
br label %.for.start.2532
.for.end.2532:
%.tmp2551 = load i32, i32* %len.2531
%.tmp2552 = sub i32 %.tmp2551, 1
ret i32 %.tmp2552
}
define i8* @m2413$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval.2553 = alloca i32
store i32 0, i32* %intval.2553
%buf.2554 = alloca i8*
store i8* null, i8** %buf.2554
%chrval.2555 = alloca i8
store i8 0, i8* %chrval.2555
%.tmp2556 = load i8*, i8** %chr_repr
%.tmp2557 = call i32(i8*) @strlen(i8* %.tmp2556)
%chr_len.2558 = alloca i32
store i32 %.tmp2557, i32* %chr_len.2558
%.tmp2559 = load i32, i32* %chr_len.2558
%.tmp2560 = icmp eq i32 %.tmp2559, 6
br i1 %.tmp2560, label %.if.true.2561, label %.if.false.2561
.if.true.2561:
%.tmp2562 = load i8*, i8** %chr_repr
%.tmp2564 = getelementptr [7 x i8], [7 x i8]*@.str2563, i32 0, i32 0
%.tmp2565 = getelementptr i32, i32* %intval.2553, i32 0
%.tmp2566 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2562, i8* %.tmp2564, i32* %.tmp2565)
%.tmp2567 = getelementptr i8*, i8** %buf.2554, i32 0
%.tmp2569 = getelementptr [3 x i8], [3 x i8]*@.str2568, i32 0, i32 0
%.tmp2570 = load i32, i32* %intval.2553
%.tmp2571 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2567, i8* %.tmp2569, i32 %.tmp2570)
br label %.if.end.2561
.if.false.2561:
%.tmp2572 = load i32, i32* %chr_len.2558
%.tmp2573 = icmp eq i32 %.tmp2572, 5
br i1 %.tmp2573, label %.if.true.2574, label %.if.false.2574
.if.true.2574:
%.tmp2575 = load i8*, i8** %chr_repr
%.tmp2577 = getelementptr [6 x i8], [6 x i8]*@.str2576, i32 0, i32 0
%.tmp2578 = getelementptr i32, i32* %intval.2553, i32 0
%.tmp2579 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2575, i8* %.tmp2577, i32* %.tmp2578)
%.tmp2580 = getelementptr i8*, i8** %buf.2554, i32 0
%.tmp2582 = getelementptr [3 x i8], [3 x i8]*@.str2581, i32 0, i32 0
%.tmp2583 = load i32, i32* %intval.2553
%.tmp2584 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2580, i8* %.tmp2582, i32 %.tmp2583)
br label %.if.end.2574
.if.false.2574:
%.tmp2585 = load i32, i32* %chr_len.2558
%.tmp2586 = icmp eq i32 %.tmp2585, 4
br i1 %.tmp2586, label %.if.true.2587, label %.if.false.2587
.if.true.2587:
%.tmp2588 = load i8*, i8** %chr_repr
%.tmp2590 = getelementptr [6 x i8], [6 x i8]*@.str2589, i32 0, i32 0
%.tmp2591 = getelementptr i8, i8* %chrval.2555, i32 0
%.tmp2592 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2588, i8* %.tmp2590, i8* %.tmp2591)
%.tmp2593 = load i8, i8* %chrval.2555
%.tmp2594 = icmp eq i8 %.tmp2593, 110
br i1 %.tmp2594, label %.if.true.2595, label %.if.false.2595
.if.true.2595:
%.tmp2597 = getelementptr [3 x i8], [3 x i8]*@.str2596, i32 0, i32 0
store i8* %.tmp2597, i8** %buf.2554
br label %.if.end.2595
.if.false.2595:
%.tmp2598 = bitcast ptr null to i8*
ret i8* %.tmp2598
br label %.if.end.2595
.if.end.2595:
br label %.if.end.2587
.if.false.2587:
%.tmp2599 = load i32, i32* %chr_len.2558
%.tmp2600 = icmp eq i32 %.tmp2599, 3
br i1 %.tmp2600, label %.if.true.2601, label %.if.false.2601
.if.true.2601:
%.tmp2602 = load i8*, i8** %chr_repr
%.tmp2604 = getelementptr [5 x i8], [5 x i8]*@.str2603, i32 0, i32 0
%.tmp2605 = getelementptr i32, i32* %intval.2553, i32 0
%.tmp2606 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2602, i8* %.tmp2604, i32* %.tmp2605)
%.tmp2607 = getelementptr i8*, i8** %buf.2554, i32 0
%.tmp2609 = getelementptr [3 x i8], [3 x i8]*@.str2608, i32 0, i32 0
%.tmp2610 = load i32, i32* %intval.2553
%.tmp2611 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2607, i8* %.tmp2609, i32 %.tmp2610)
br label %.if.end.2601
.if.false.2601:
%.tmp2612 = bitcast ptr null to i8*
ret i8* %.tmp2612
br label %.if.end.2601
.if.end.2601:
br label %.if.end.2587
.if.end.2587:
br label %.if.end.2574
.if.end.2574:
br label %.if.end.2561
.if.end.2561:
%.tmp2613 = load i8*, i8** %buf.2554
ret i8* %.tmp2613
}
%m2614$.SYStack.type = type {%m996$.Node.type*,%m2614$.SYStack.type*}
@SYStack_size = constant i32 16
define %m2614$.SYStack.type* @m2614$stack_new.m2614$.SYStack.typep() {
%.tmp2615 = load i32, i32* @SYStack_size
%.tmp2616 = call i8*(i32) @malloc(i32 %.tmp2615)
%.tmp2617 = bitcast i8* %.tmp2616 to %m2614$.SYStack.type*
%s.2618 = alloca %m2614$.SYStack.type*
store %m2614$.SYStack.type* %.tmp2617, %m2614$.SYStack.type** %s.2618
%.tmp2619 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %s.2618
%.tmp2620 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp2619, i32 0, i32 0
store %m996$.Node.type* null, %m996$.Node.type** %.tmp2620
%.tmp2621 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %s.2618
%.tmp2622 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp2621, i32 0, i32 1
store %m2614$.SYStack.type* null, %m2614$.SYStack.type** %.tmp2622
%.tmp2623 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %s.2618
ret %m2614$.SYStack.type* %.tmp2623
}
define %m2614$.SYStack.type* @m2614$sy_algorithm.m2614$.SYStack.typep.m996$.Node.typep(%m996$.Node.type* %.assignable.arg) {
%assignable = alloca %m996$.Node.type*
store %m996$.Node.type* %.assignable.arg, %m996$.Node.type** %assignable
%.tmp2624 = call %m2614$.SYStack.type*() @m2614$stack_new.m2614$.SYStack.typep()
%out_stack.2625 = alloca %m2614$.SYStack.type*
store %m2614$.SYStack.type* %.tmp2624, %m2614$.SYStack.type** %out_stack.2625
%.tmp2626 = call %m2614$.SYStack.type*() @m2614$stack_new.m2614$.SYStack.typep()
%op_stack.2627 = alloca %m2614$.SYStack.type*
store %m2614$.SYStack.type* %.tmp2626, %m2614$.SYStack.type** %op_stack.2627
%.tmp2628 = call %m2614$.SYStack.type*() @m2614$stack_new.m2614$.SYStack.typep()
%token_stack.2629 = alloca %m2614$.SYStack.type*
store %m2614$.SYStack.type* %.tmp2628, %m2614$.SYStack.type** %token_stack.2629
%ptr.2630 = alloca %m996$.Node.type*
store %m996$.Node.type* null, %m996$.Node.type** %ptr.2630
%.tmp2632 = load %m996$.Node.type*, %m996$.Node.type** %assignable
store %m996$.Node.type* %.tmp2632, %m996$.Node.type** %ptr.2630
br label %.for.start.2631
.for.start.2631:
%.tmp2633 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2630
%.tmp2634 = icmp ne %m996$.Node.type* %.tmp2633, null
br i1 %.tmp2634, label %.for.continue.2631, label %.for.end.2631
.for.continue.2631:
%.tmp2635 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %token_stack.2629
%.tmp2636 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2630
%.tmp2637 = call %m2614$.SYStack.type*(%m2614$.SYStack.type*,%m996$.Node.type*) @m2614$stack_push.m2614$.SYStack.typep.m2614$.SYStack.typep.m996$.Node.typep(%m2614$.SYStack.type* %.tmp2635, %m996$.Node.type* %.tmp2636)
store %m2614$.SYStack.type* %.tmp2637, %m2614$.SYStack.type** %token_stack.2629
%.tmp2638 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2630
%.tmp2639 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2638, i32 0, i32 9
%.tmp2640 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2639
store %m996$.Node.type* %.tmp2640, %m996$.Node.type** %ptr.2630
br label %.for.start.2631
.for.end.2631:
%.tmp2642 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %token_stack.2629
%.tmp2643 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp2642, i32 0, i32 0
%.tmp2644 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2643
store %m996$.Node.type* %.tmp2644, %m996$.Node.type** %ptr.2630
br label %.for.start.2641
.for.start.2641:
%.tmp2645 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2630
%.tmp2646 = icmp ne %m996$.Node.type* %.tmp2645, null
br i1 %.tmp2646, label %.for.continue.2641, label %.for.end.2641
.for.continue.2641:
%.tmp2647 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %token_stack.2629
%cs.2648 = alloca %m2614$.SYStack.type*
store %m2614$.SYStack.type* %.tmp2647, %m2614$.SYStack.type** %cs.2648
%.tmp2649 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %token_stack.2629
%.tmp2650 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp2649, i32 0, i32 1
%.tmp2651 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %.tmp2650
store %m2614$.SYStack.type* %.tmp2651, %m2614$.SYStack.type** %token_stack.2629
%.tmp2652 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %cs.2648
%.tmp2653 = bitcast %m2614$.SYStack.type* %.tmp2652 to i8*
call void(i8*) @free(i8* %.tmp2653)
%.tmp2654 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2630
%.tmp2655 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2654, i32 0, i32 0
%.tmp2656 = load i8*, i8** %.tmp2655
%.tmp2658 = getelementptr [16 x i8], [16 x i8]*@.str2657, i32 0, i32 0
%.tmp2659 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2656, i8* %.tmp2658)
%.tmp2660 = icmp eq i32 %.tmp2659, 0
br i1 %.tmp2660, label %.if.true.2661, label %.if.false.2661
.if.true.2661:
%.tmp2662 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %out_stack.2625
%.tmp2663 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2630
%.tmp2664 = call %m2614$.SYStack.type*(%m2614$.SYStack.type*,%m996$.Node.type*) @m2614$stack_push.m2614$.SYStack.typep.m2614$.SYStack.typep.m996$.Node.typep(%m2614$.SYStack.type* %.tmp2662, %m996$.Node.type* %.tmp2663)
store %m2614$.SYStack.type* %.tmp2664, %m2614$.SYStack.type** %out_stack.2625
br label %.if.end.2661
.if.false.2661:
%.tmp2665 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2630
%.tmp2666 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2665, i32 0, i32 0
%.tmp2667 = load i8*, i8** %.tmp2666
%.tmp2669 = getelementptr [9 x i8], [9 x i8]*@.str2668, i32 0, i32 0
%.tmp2670 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2667, i8* %.tmp2669)
%.tmp2671 = icmp eq i32 %.tmp2670, 0
br i1 %.tmp2671, label %.if.true.2672, label %.if.false.2672
.if.true.2672:
%quit.2673 = alloca i1
store i1 0, i1* %quit.2673
br label %.for.start.2674
.for.start.2674:
%.tmp2675 = load i1, i1* %quit.2673
%.tmp2676 = icmp eq i1 %.tmp2675, 0
br i1 %.tmp2676, label %.for.continue.2674, label %.for.end.2674
.for.continue.2674:
%.tmp2677 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %op_stack.2627
%.tmp2678 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp2677, i32 0, i32 0
%.tmp2679 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2678
%.tmp2680 = icmp eq %m996$.Node.type* %.tmp2679, null
br i1 %.tmp2680, label %.if.true.2681, label %.if.false.2681
.if.true.2681:
store i1 1, i1* %quit.2673
br label %.if.end.2681
.if.false.2681:
%.tmp2682 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %op_stack.2627
%.tmp2683 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp2682, i32 0, i32 0
%.tmp2684 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2683
%.tmp2685 = call i32(%m996$.Node.type*) @m2614$op_precedence.i.m996$.Node.typep(%m996$.Node.type* %.tmp2684)
%.tmp2686 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2630
%.tmp2687 = call i32(%m996$.Node.type*) @m2614$op_precedence.i.m996$.Node.typep(%m996$.Node.type* %.tmp2686)
%.tmp2688 = icmp slt i32 %.tmp2685, %.tmp2687
br i1 %.tmp2688, label %.if.true.2689, label %.if.false.2689
.if.true.2689:
%.tmp2690 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %op_stack.2627
%top.2691 = alloca %m2614$.SYStack.type*
store %m2614$.SYStack.type* %.tmp2690, %m2614$.SYStack.type** %top.2691
%.tmp2692 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %op_stack.2627
%.tmp2693 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp2692, i32 0, i32 1
%.tmp2694 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %.tmp2693
store %m2614$.SYStack.type* %.tmp2694, %m2614$.SYStack.type** %op_stack.2627
%.tmp2695 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %out_stack.2625
%.tmp2696 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %top.2691
%.tmp2697 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp2696, i32 0, i32 0
%.tmp2698 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2697
%.tmp2699 = call %m2614$.SYStack.type*(%m2614$.SYStack.type*,%m996$.Node.type*) @m2614$stack_push.m2614$.SYStack.typep.m2614$.SYStack.typep.m996$.Node.typep(%m2614$.SYStack.type* %.tmp2695, %m996$.Node.type* %.tmp2698)
store %m2614$.SYStack.type* %.tmp2699, %m2614$.SYStack.type** %out_stack.2625
%.tmp2700 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %top.2691
%.tmp2701 = bitcast %m2614$.SYStack.type* %.tmp2700 to i8*
call void(i8*) @free(i8* %.tmp2701)
br label %.if.end.2689
.if.false.2689:
store i1 1, i1* %quit.2673
br label %.if.end.2689
.if.end.2689:
br label %.if.end.2681
.if.end.2681:
br label %.for.start.2674
.for.end.2674:
%.tmp2702 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %op_stack.2627
%.tmp2703 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2630
%.tmp2704 = call %m2614$.SYStack.type*(%m2614$.SYStack.type*,%m996$.Node.type*) @m2614$stack_push.m2614$.SYStack.typep.m2614$.SYStack.typep.m996$.Node.typep(%m2614$.SYStack.type* %.tmp2702, %m996$.Node.type* %.tmp2703)
store %m2614$.SYStack.type* %.tmp2704, %m2614$.SYStack.type** %op_stack.2627
br label %.if.end.2672
.if.false.2672:
%.tmp2706 = getelementptr [68 x i8], [68 x i8]*@.str2705, i32 0, i32 0
%.tmp2707 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2630
%.tmp2708 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2707, i32 0, i32 0
%.tmp2709 = load i8*, i8** %.tmp2708
%.tmp2710 = call i32(i8*,...) @printf(i8* %.tmp2706, i8* %.tmp2709)
br label %.if.end.2672
.if.end.2672:
br label %.if.end.2661
.if.end.2661:
%.tmp2711 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %token_stack.2629
%.tmp2712 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp2711, i32 0, i32 0
%.tmp2713 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2712
store %m996$.Node.type* %.tmp2713, %m996$.Node.type** %ptr.2630
br label %.for.start.2641
.for.end.2641:
br label %.for.start.2714
.for.start.2714:
%.tmp2715 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %op_stack.2627
%.tmp2716 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp2715, i32 0, i32 0
%.tmp2717 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2716
%.tmp2718 = icmp ne %m996$.Node.type* %.tmp2717, null
br i1 %.tmp2718, label %.for.continue.2714, label %.for.end.2714
.for.continue.2714:
%.tmp2719 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %op_stack.2627
%.tmp2720 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp2719, i32 0, i32 0
%.tmp2721 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2720
%node.2722 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp2721, %m996$.Node.type** %node.2722
%.tmp2723 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %op_stack.2627
%s.2724 = alloca %m2614$.SYStack.type*
store %m2614$.SYStack.type* %.tmp2723, %m2614$.SYStack.type** %s.2724
%.tmp2725 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %op_stack.2627
%.tmp2726 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp2725, i32 0, i32 1
%.tmp2727 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %.tmp2726
store %m2614$.SYStack.type* %.tmp2727, %m2614$.SYStack.type** %op_stack.2627
%.tmp2728 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %s.2724
%.tmp2729 = bitcast %m2614$.SYStack.type* %.tmp2728 to i8*
call void(i8*) @free(i8* %.tmp2729)
%.tmp2730 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %out_stack.2625
%.tmp2731 = load %m996$.Node.type*, %m996$.Node.type** %node.2722
%.tmp2732 = call %m2614$.SYStack.type*(%m2614$.SYStack.type*,%m996$.Node.type*) @m2614$stack_push.m2614$.SYStack.typep.m2614$.SYStack.typep.m996$.Node.typep(%m2614$.SYStack.type* %.tmp2730, %m996$.Node.type* %.tmp2731)
store %m2614$.SYStack.type* %.tmp2732, %m2614$.SYStack.type** %out_stack.2625
br label %.for.start.2714
.for.end.2714:
%.tmp2733 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %out_stack.2625
ret %m2614$.SYStack.type* %.tmp2733
}
define %m2614$.SYStack.type* @m2614$stack_push.m2614$.SYStack.typep.m2614$.SYStack.typep.m996$.Node.typep(%m2614$.SYStack.type* %.curr_stack.arg, %m996$.Node.type* %.node.arg) {
%curr_stack = alloca %m2614$.SYStack.type*
store %m2614$.SYStack.type* %.curr_stack.arg, %m2614$.SYStack.type** %curr_stack
%node = alloca %m996$.Node.type*
store %m996$.Node.type* %.node.arg, %m996$.Node.type** %node
%.tmp2734 = load i32, i32* @SYStack_size
%.tmp2735 = call i8*(i32) @malloc(i32 %.tmp2734)
%.tmp2736 = bitcast i8* %.tmp2735 to %m2614$.SYStack.type*
%s.2737 = alloca %m2614$.SYStack.type*
store %m2614$.SYStack.type* %.tmp2736, %m2614$.SYStack.type** %s.2737
%.tmp2738 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %s.2737
%.tmp2739 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp2738, i32 0, i32 0
%.tmp2740 = load %m996$.Node.type*, %m996$.Node.type** %node
store %m996$.Node.type* %.tmp2740, %m996$.Node.type** %.tmp2739
%.tmp2741 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %s.2737
%.tmp2742 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp2741, i32 0, i32 1
%.tmp2743 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %curr_stack
store %m2614$.SYStack.type* %.tmp2743, %m2614$.SYStack.type** %.tmp2742
%.tmp2744 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %s.2737
ret %m2614$.SYStack.type* %.tmp2744
}
define i32 @m2614$op_precedence.i.m996$.Node.typep(%m996$.Node.type* %.n.arg) {
%n = alloca %m996$.Node.type*
store %m996$.Node.type* %.n.arg, %m996$.Node.type** %n
%.tmp2745 = load %m996$.Node.type*, %m996$.Node.type** %n
%.tmp2746 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2745, i32 0, i32 8
%.tmp2747 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2746
%op.2748 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp2747, %m996$.Node.type** %op.2748
%.tmp2749 = load %m996$.Node.type*, %m996$.Node.type** %op.2748
%.tmp2750 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2749, i32 0, i32 1
%.tmp2751 = load i8*, i8** %.tmp2750
%.tmp2753 = getelementptr [2 x i8], [2 x i8]*@.str2752, i32 0, i32 0
%.tmp2754 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2751, i8* %.tmp2753)
%.tmp2755 = icmp eq i32 %.tmp2754, 0
%.tmp2756 = load %m996$.Node.type*, %m996$.Node.type** %op.2748
%.tmp2757 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2756, i32 0, i32 1
%.tmp2758 = load i8*, i8** %.tmp2757
%.tmp2760 = getelementptr [2 x i8], [2 x i8]*@.str2759, i32 0, i32 0
%.tmp2761 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2758, i8* %.tmp2760)
%.tmp2762 = icmp eq i32 %.tmp2761, 0
%.tmp2763 = or i1 %.tmp2755, %.tmp2762
br i1 %.tmp2763, label %.if.true.2764, label %.if.false.2764
.if.true.2764:
ret i32 4
br label %.if.end.2764
.if.false.2764:
%.tmp2765 = load %m996$.Node.type*, %m996$.Node.type** %op.2748
%.tmp2766 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2765, i32 0, i32 1
%.tmp2767 = load i8*, i8** %.tmp2766
%.tmp2769 = getelementptr [2 x i8], [2 x i8]*@.str2768, i32 0, i32 0
%.tmp2770 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2767, i8* %.tmp2769)
%.tmp2771 = icmp eq i32 %.tmp2770, 0
%.tmp2772 = load %m996$.Node.type*, %m996$.Node.type** %op.2748
%.tmp2773 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2772, i32 0, i32 1
%.tmp2774 = load i8*, i8** %.tmp2773
%.tmp2776 = getelementptr [2 x i8], [2 x i8]*@.str2775, i32 0, i32 0
%.tmp2777 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2774, i8* %.tmp2776)
%.tmp2778 = icmp eq i32 %.tmp2777, 0
%.tmp2779 = or i1 %.tmp2771, %.tmp2778
%.tmp2780 = load %m996$.Node.type*, %m996$.Node.type** %op.2748
%.tmp2781 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2780, i32 0, i32 1
%.tmp2782 = load i8*, i8** %.tmp2781
%.tmp2784 = getelementptr [2 x i8], [2 x i8]*@.str2783, i32 0, i32 0
%.tmp2785 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2782, i8* %.tmp2784)
%.tmp2786 = icmp eq i32 %.tmp2785, 0
%.tmp2787 = or i1 %.tmp2779, %.tmp2786
br i1 %.tmp2787, label %.if.true.2788, label %.if.false.2788
.if.true.2788:
ret i32 3
br label %.if.end.2788
.if.false.2788:
%.tmp2789 = load %m996$.Node.type*, %m996$.Node.type** %op.2748
%.tmp2790 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2789, i32 0, i32 1
%.tmp2791 = load i8*, i8** %.tmp2790
%.tmp2793 = getelementptr [3 x i8], [3 x i8]*@.str2792, i32 0, i32 0
%.tmp2794 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2791, i8* %.tmp2793)
%.tmp2795 = icmp eq i32 %.tmp2794, 0
%.tmp2796 = load %m996$.Node.type*, %m996$.Node.type** %op.2748
%.tmp2797 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2796, i32 0, i32 1
%.tmp2798 = load i8*, i8** %.tmp2797
%.tmp2800 = getelementptr [3 x i8], [3 x i8]*@.str2799, i32 0, i32 0
%.tmp2801 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2798, i8* %.tmp2800)
%.tmp2802 = icmp eq i32 %.tmp2801, 0
%.tmp2803 = or i1 %.tmp2795, %.tmp2802
br i1 %.tmp2803, label %.if.true.2804, label %.if.false.2804
.if.true.2804:
ret i32 7
br label %.if.end.2804
.if.false.2804:
%.tmp2805 = load %m996$.Node.type*, %m996$.Node.type** %op.2748
%.tmp2806 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2805, i32 0, i32 1
%.tmp2807 = load i8*, i8** %.tmp2806
%.tmp2809 = getelementptr [3 x i8], [3 x i8]*@.str2808, i32 0, i32 0
%.tmp2810 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2807, i8* %.tmp2809)
%.tmp2811 = icmp eq i32 %.tmp2810, 0
%.tmp2812 = load %m996$.Node.type*, %m996$.Node.type** %op.2748
%.tmp2813 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2812, i32 0, i32 1
%.tmp2814 = load i8*, i8** %.tmp2813
%.tmp2816 = getelementptr [3 x i8], [3 x i8]*@.str2815, i32 0, i32 0
%.tmp2817 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2814, i8* %.tmp2816)
%.tmp2818 = icmp eq i32 %.tmp2817, 0
%.tmp2819 = or i1 %.tmp2811, %.tmp2818
br i1 %.tmp2819, label %.if.true.2820, label %.if.false.2820
.if.true.2820:
ret i32 6
br label %.if.end.2820
.if.false.2820:
%.tmp2821 = load %m996$.Node.type*, %m996$.Node.type** %op.2748
%.tmp2822 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2821, i32 0, i32 1
%.tmp2823 = load i8*, i8** %.tmp2822
%.tmp2825 = getelementptr [2 x i8], [2 x i8]*@.str2824, i32 0, i32 0
%.tmp2826 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2823, i8* %.tmp2825)
%.tmp2827 = icmp eq i32 %.tmp2826, 0
%.tmp2828 = load %m996$.Node.type*, %m996$.Node.type** %op.2748
%.tmp2829 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2828, i32 0, i32 1
%.tmp2830 = load i8*, i8** %.tmp2829
%.tmp2832 = getelementptr [2 x i8], [2 x i8]*@.str2831, i32 0, i32 0
%.tmp2833 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2830, i8* %.tmp2832)
%.tmp2834 = icmp eq i32 %.tmp2833, 0
%.tmp2835 = or i1 %.tmp2827, %.tmp2834
br i1 %.tmp2835, label %.if.true.2836, label %.if.false.2836
.if.true.2836:
ret i32 6
br label %.if.end.2836
.if.false.2836:
%.tmp2837 = load %m996$.Node.type*, %m996$.Node.type** %op.2748
%.tmp2838 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2837, i32 0, i32 1
%.tmp2839 = load i8*, i8** %.tmp2838
%.tmp2841 = getelementptr [2 x i8], [2 x i8]*@.str2840, i32 0, i32 0
%.tmp2842 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2839, i8* %.tmp2841)
%.tmp2843 = icmp eq i32 %.tmp2842, 0
br i1 %.tmp2843, label %.if.true.2844, label %.if.false.2844
.if.true.2844:
ret i32 11
br label %.if.end.2844
.if.false.2844:
%.tmp2845 = load %m996$.Node.type*, %m996$.Node.type** %op.2748
%.tmp2846 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2845, i32 0, i32 1
%.tmp2847 = load i8*, i8** %.tmp2846
%.tmp2849 = getelementptr [2 x i8], [2 x i8]*@.str2848, i32 0, i32 0
%.tmp2850 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2847, i8* %.tmp2849)
%.tmp2851 = icmp eq i32 %.tmp2850, 0
br i1 %.tmp2851, label %.if.true.2852, label %.if.false.2852
.if.true.2852:
ret i32 12
br label %.if.end.2852
.if.false.2852:
br label %.if.end.2852
.if.end.2852:
br label %.if.end.2844
.if.end.2844:
br label %.if.end.2836
.if.end.2836:
br label %.if.end.2820
.if.end.2820:
br label %.if.end.2804
.if.end.2804:
br label %.if.end.2788
.if.end.2788:
br label %.if.end.2764
.if.end.2764:
%.tmp2854 = getelementptr [65 x i8], [65 x i8]*@.str2853, i32 0, i32 0
%.tmp2855 = load %m996$.Node.type*, %m996$.Node.type** %op.2748
%.tmp2856 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2855, i32 0, i32 1
%.tmp2857 = load i8*, i8** %.tmp2856
%.tmp2858 = call i32(i8*,...) @printf(i8* %.tmp2854, i8* %.tmp2857)
ret i32 4
}
%m2859$.Type.type = type {i8*,i8*,i8*,%m2859$.Type.type*,%m2859$.Type.type*,%m2859$.Type.type*}
%m2859$.ErrorList.type = type {%m312$.Error.type*,%m2859$.ErrorList.type*,i1}
%m2859$.AssignableInfo.type = type {i8*,i8,i8*,i8*,%m2859$.Type.type*,i32,i32,i8*}
%m2859$.ScopeItem.type = type {i8*,%m2859$.AssignableInfo.type*,%m2859$.ScopeItem.type*}
%m2859$.Scope.type = type {i8*,%m2859$.ScopeItem.type*,i8*,i8*,i8*,%m2859$.Scope.type*,%m2859$.Type.type*}
%m2859$.GlobalName.type = type {i8*,i8*,i1,i1,%m2859$.AssignableInfo.type*,%m2859$.GlobalName.type*}
%m2859$.ModuleLookup.type = type {i8*,i8*,%m2859$.ModuleLookup.type*,%m2859$.Scope.type*}
%m2859$.AnonFn.type = type {i8*,%m2859$.AnonFn.type*}
%m2859$.CompilerCtx.type = type {%m996$.Node.type*,%m0$.File.type*,%m2859$.ErrorList.type*,%m2859$.GlobalName.type*,%m996$.Rule.type**,i32,%m2859$.ModuleLookup.type*,i8*,%m2859$.AnonFn.type*}
define i32 @m2861$max.i.i.i(i32 %.a.arg, i32 %.b.arg) {
%a = alloca i32
store i32 %.a.arg, i32* %a
%b = alloca i32
store i32 %.b.arg, i32* %b
%.tmp2862 = load i32, i32* %a
%.tmp2863 = load i32, i32* %b
%.tmp2864 = icmp sgt i32 %.tmp2862, %.tmp2863
br i1 %.tmp2864, label %.if.true.2865, label %.if.false.2865
.if.true.2865:
%.tmp2866 = load i32, i32* %a
ret i32 %.tmp2866
br label %.if.end.2865
.if.false.2865:
br label %.if.end.2865
.if.end.2865:
%.tmp2867 = load i32, i32* %b
ret i32 %.tmp2867
}
define i32 @m2861$gcd.i.i.i(i32 %.a.arg, i32 %.b.arg) {
%a = alloca i32
store i32 %.a.arg, i32* %a
%b = alloca i32
store i32 %.b.arg, i32* %b
%.tmp2868 = load i32, i32* %b
%.tmp2869 = icmp eq i32 %.tmp2868, 0
br i1 %.tmp2869, label %.if.true.2870, label %.if.false.2870
.if.true.2870:
%.tmp2871 = load i32, i32* %a
ret i32 %.tmp2871
br label %.if.end.2870
.if.false.2870:
br label %.if.end.2870
.if.end.2870:
%.tmp2872 = load i32, i32* %b
%.tmp2873 = load i32, i32* %a
%.tmp2874 = load i32, i32* %b
%.tmp2875 = srem i32 %.tmp2873, %.tmp2874
%.tmp2876 = call i32(i32,i32) @m2861$gcd.i.i.i(i32 %.tmp2872, i32 %.tmp2875)
ret i32 %.tmp2876
}
define i32 @m2861$lcm.i.i.i(i32 %.a.arg, i32 %.b.arg) {
%a = alloca i32
store i32 %.a.arg, i32* %a
%b = alloca i32
store i32 %.b.arg, i32* %b
%.tmp2877 = load i32, i32* %a
%.tmp2878 = icmp eq i32 %.tmp2877, 0
%.tmp2879 = load i32, i32* %b
%.tmp2880 = icmp eq i32 %.tmp2879, 0
%.tmp2881 = and i1 %.tmp2878, %.tmp2880
br i1 %.tmp2881, label %.if.true.2882, label %.if.false.2882
.if.true.2882:
ret i32 0
br label %.if.end.2882
.if.false.2882:
br label %.if.end.2882
.if.end.2882:
%.tmp2883 = load i32, i32* %a
%.tmp2884 = load i32, i32* %b
%.tmp2885 = mul i32 %.tmp2883, %.tmp2884
%.tmp2886 = load i32, i32* %a
%.tmp2887 = load i32, i32* %b
%.tmp2888 = call i32(i32,i32) @m2861$gcd.i.i.i(i32 %.tmp2886, i32 %.tmp2887)
%.tmp2889 = sdiv i32 %.tmp2885, %.tmp2888
ret i32 %.tmp2889
}
define i8* @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.Type.type* %.type.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%type = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.type.arg, %m2859$.Type.type** %type
%.tmp2890 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp2891 = icmp eq %m2859$.Type.type* %.tmp2890, null
br i1 %.tmp2891, label %.if.true.2892, label %.if.false.2892
.if.true.2892:
%.tmp2894 = getelementptr [2 x i8], [2 x i8]*@.str2893, i32 0, i32 0
ret i8* %.tmp2894
br label %.if.end.2892
.if.false.2892:
br label %.if.end.2892
.if.end.2892:
%.tmp2895 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp2896 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp2895, i32 0, i32 0
%.tmp2897 = load i8*, i8** %.tmp2896
%.tmp2898 = icmp ne i8* %.tmp2897, null
%.tmp2900 = getelementptr [54 x i8], [54 x i8]*@.str2899, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2898, i8* %.tmp2900)
%buf.2901 = alloca i8*
store i8* null, i8** %buf.2901
%.tmp2902 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp2903 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp2902, i32 0, i32 0
%.tmp2904 = load i8*, i8** %.tmp2903
%.tmp2906 = getelementptr [4 x i8], [4 x i8]*@.str2905, i32 0, i32 0
%.tmp2907 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2904, i8* %.tmp2906)
%.tmp2908 = icmp eq i32 %.tmp2907, 0
br i1 %.tmp2908, label %.if.true.2909, label %.if.false.2909
.if.true.2909:
%.tmp2911 = getelementptr [4 x i8], [4 x i8]*@.str2910, i32 0, i32 0
ret i8* %.tmp2911
br label %.if.end.2909
.if.false.2909:
%.tmp2912 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp2913 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp2912, i32 0, i32 0
%.tmp2914 = load i8*, i8** %.tmp2913
%.tmp2916 = getelementptr [5 x i8], [5 x i8]*@.str2915, i32 0, i32 0
%.tmp2917 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2914, i8* %.tmp2916)
%.tmp2918 = icmp eq i32 %.tmp2917, 0
br i1 %.tmp2918, label %.if.true.2919, label %.if.false.2919
.if.true.2919:
%.tmp2921 = getelementptr [5 x i8], [5 x i8]*@.str2920, i32 0, i32 0
ret i8* %.tmp2921
br label %.if.end.2919
.if.false.2919:
%.tmp2922 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp2923 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp2922, i32 0, i32 0
%.tmp2924 = load i8*, i8** %.tmp2923
%.tmp2926 = getelementptr [5 x i8], [5 x i8]*@.str2925, i32 0, i32 0
%.tmp2927 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2924, i8* %.tmp2926)
%.tmp2928 = icmp eq i32 %.tmp2927, 0
br i1 %.tmp2928, label %.if.true.2929, label %.if.false.2929
.if.true.2929:
%.tmp2931 = getelementptr [3 x i8], [3 x i8]*@.str2930, i32 0, i32 0
ret i8* %.tmp2931
br label %.if.end.2929
.if.false.2929:
%.tmp2932 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp2933 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp2932, i32 0, i32 0
%.tmp2934 = load i8*, i8** %.tmp2933
%.tmp2936 = getelementptr [8 x i8], [8 x i8]*@.str2935, i32 0, i32 0
%.tmp2937 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2934, i8* %.tmp2936)
%.tmp2938 = icmp eq i32 %.tmp2937, 0
br i1 %.tmp2938, label %.if.true.2939, label %.if.false.2939
.if.true.2939:
%.tmp2941 = getelementptr [4 x i8], [4 x i8]*@.str2940, i32 0, i32 0
ret i8* %.tmp2941
br label %.if.end.2939
.if.false.2939:
%.tmp2942 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp2943 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp2942, i32 0, i32 0
%.tmp2944 = load i8*, i8** %.tmp2943
%.tmp2946 = getelementptr [4 x i8], [4 x i8]*@.str2945, i32 0, i32 0
%.tmp2947 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2944, i8* %.tmp2946)
%.tmp2948 = icmp eq i32 %.tmp2947, 0
br i1 %.tmp2948, label %.if.true.2949, label %.if.false.2949
.if.true.2949:
%.tmp2951 = getelementptr [3 x i8], [3 x i8]*@.str2950, i32 0, i32 0
ret i8* %.tmp2951
br label %.if.end.2949
.if.false.2949:
%.tmp2952 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp2953 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp2952, i32 0, i32 0
%.tmp2954 = load i8*, i8** %.tmp2953
%.tmp2956 = getelementptr [9 x i8], [9 x i8]*@.str2955, i32 0, i32 0
%.tmp2957 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2954, i8* %.tmp2956)
%.tmp2958 = icmp eq i32 %.tmp2957, 0
br i1 %.tmp2958, label %.if.true.2959, label %.if.false.2959
.if.true.2959:
%.tmp2960 = getelementptr i8*, i8** %buf.2901, i32 0
%.tmp2962 = getelementptr [4 x i8], [4 x i8]*@.str2961, i32 0, i32 0
%.tmp2963 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp2964 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp2965 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp2964, i32 0, i32 3
%.tmp2966 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp2965
%.tmp2967 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp2963, %m2859$.Type.type* %.tmp2966)
%.tmp2968 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2960, i8* %.tmp2962, i8* %.tmp2967)
%.tmp2970 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp2971 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp2970, i32 0, i32 3
%.tmp2972 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp2971
%.tmp2973 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp2972, i32 0, i32 4
%.tmp2974 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp2973
%p.2975 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp2974, %m2859$.Type.type** %p.2975
br label %.for.start.2969
.for.start.2969:
%.tmp2976 = load %m2859$.Type.type*, %m2859$.Type.type** %p.2975
%.tmp2977 = icmp ne %m2859$.Type.type* %.tmp2976, null
br i1 %.tmp2977, label %.for.continue.2969, label %.for.end.2969
.for.continue.2969:
%.tmp2978 = load %m2859$.Type.type*, %m2859$.Type.type** %p.2975
%.tmp2979 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp2980 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp2979, i32 0, i32 3
%.tmp2981 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp2980
%.tmp2982 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp2981, i32 0, i32 4
%.tmp2983 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp2982
%.tmp2984 = icmp ne %m2859$.Type.type* %.tmp2978, %.tmp2983
br i1 %.tmp2984, label %.if.true.2985, label %.if.false.2985
.if.true.2985:
%.tmp2986 = getelementptr i8*, i8** %buf.2901, i32 0
%.tmp2988 = getelementptr [4 x i8], [4 x i8]*@.str2987, i32 0, i32 0
%.tmp2989 = load i8*, i8** %buf.2901
%.tmp2990 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2986, i8* %.tmp2988, i8* %.tmp2989)
br label %.if.end.2985
.if.false.2985:
br label %.if.end.2985
.if.end.2985:
%.tmp2991 = getelementptr i8*, i8** %buf.2901, i32 0
%.tmp2993 = getelementptr [5 x i8], [5 x i8]*@.str2992, i32 0, i32 0
%.tmp2994 = load i8*, i8** %buf.2901
%.tmp2995 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp2996 = load %m2859$.Type.type*, %m2859$.Type.type** %p.2975
%.tmp2997 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp2995, %m2859$.Type.type* %.tmp2996)
%.tmp2998 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2991, i8* %.tmp2993, i8* %.tmp2994, i8* %.tmp2997)
%.tmp2999 = load %m2859$.Type.type*, %m2859$.Type.type** %p.2975
%.tmp3000 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp2999, i32 0, i32 4
%.tmp3001 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3000
store %m2859$.Type.type* %.tmp3001, %m2859$.Type.type** %p.2975
br label %.for.start.2969
.for.end.2969:
%.tmp3002 = getelementptr i8*, i8** %buf.2901, i32 0
%.tmp3004 = getelementptr [4 x i8], [4 x i8]*@.str3003, i32 0, i32 0
%.tmp3005 = load i8*, i8** %buf.2901
%.tmp3006 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3002, i8* %.tmp3004, i8* %.tmp3005)
%.tmp3007 = load i8*, i8** %buf.2901
ret i8* %.tmp3007
br label %.if.end.2959
.if.false.2959:
%.tmp3008 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3009 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3008, i32 0, i32 0
%.tmp3010 = load i8*, i8** %.tmp3009
%.tmp3012 = getelementptr [4 x i8], [4 x i8]*@.str3011, i32 0, i32 0
%.tmp3013 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3010, i8* %.tmp3012)
%.tmp3014 = icmp eq i32 %.tmp3013, 0
br i1 %.tmp3014, label %.if.true.3015, label %.if.false.3015
.if.true.3015:
%.tmp3016 = getelementptr i8*, i8** %buf.2901, i32 0
%.tmp3018 = getelementptr [4 x i8], [4 x i8]*@.str3017, i32 0, i32 0
%.tmp3019 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3020 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3021 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3020, i32 0, i32 3
%.tmp3022 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3021
%.tmp3023 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp3019, %m2859$.Type.type* %.tmp3022)
%.tmp3024 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3016, i8* %.tmp3018, i8* %.tmp3023)
%.tmp3025 = load i8*, i8** %buf.2901
ret i8* %.tmp3025
br label %.if.end.3015
.if.false.3015:
%.tmp3026 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3027 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3026, i32 0, i32 0
%.tmp3028 = load i8*, i8** %.tmp3027
%.tmp3030 = getelementptr [7 x i8], [7 x i8]*@.str3029, i32 0, i32 0
%.tmp3031 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3028, i8* %.tmp3030)
%.tmp3032 = icmp eq i32 %.tmp3031, 0
br i1 %.tmp3032, label %.if.true.3033, label %.if.false.3033
.if.true.3033:
%.tmp3034 = getelementptr i8*, i8** %buf.2901, i32 0
%.tmp3036 = getelementptr [2 x i8], [2 x i8]*@.str3035, i32 0, i32 0
%.tmp3037 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3034, i8* %.tmp3036)
%.tmp3039 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3040 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3039, i32 0, i32 3
%.tmp3041 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3040
%t.3042 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp3041, %m2859$.Type.type** %t.3042
br label %.for.start.3038
.for.start.3038:
%.tmp3043 = load %m2859$.Type.type*, %m2859$.Type.type** %t.3042
%.tmp3044 = icmp ne %m2859$.Type.type* %.tmp3043, null
br i1 %.tmp3044, label %.for.continue.3038, label %.for.end.3038
.for.continue.3038:
%.tmp3045 = load %m2859$.Type.type*, %m2859$.Type.type** %t.3042
%.tmp3046 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3047 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3046, i32 0, i32 3
%.tmp3048 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3047
%.tmp3049 = icmp ne %m2859$.Type.type* %.tmp3045, %.tmp3048
br i1 %.tmp3049, label %.if.true.3050, label %.if.false.3050
.if.true.3050:
%.tmp3051 = getelementptr i8*, i8** %buf.2901, i32 0
%.tmp3053 = getelementptr [4 x i8], [4 x i8]*@.str3052, i32 0, i32 0
%.tmp3054 = load i8*, i8** %buf.2901
%.tmp3055 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3051, i8* %.tmp3053, i8* %.tmp3054)
br label %.if.end.3050
.if.false.3050:
br label %.if.end.3050
.if.end.3050:
%.tmp3056 = getelementptr i8*, i8** %buf.2901, i32 0
%.tmp3058 = getelementptr [5 x i8], [5 x i8]*@.str3057, i32 0, i32 0
%.tmp3059 = load i8*, i8** %buf.2901
%.tmp3060 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3061 = load %m2859$.Type.type*, %m2859$.Type.type** %t.3042
%.tmp3062 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp3060, %m2859$.Type.type* %.tmp3061)
%.tmp3063 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3056, i8* %.tmp3058, i8* %.tmp3059, i8* %.tmp3062)
%.tmp3064 = load %m2859$.Type.type*, %m2859$.Type.type** %t.3042
%.tmp3065 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3064, i32 0, i32 4
%.tmp3066 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3065
store %m2859$.Type.type* %.tmp3066, %m2859$.Type.type** %t.3042
br label %.for.start.3038
.for.end.3038:
%.tmp3067 = getelementptr i8*, i8** %buf.2901, i32 0
%.tmp3069 = getelementptr [4 x i8], [4 x i8]*@.str3068, i32 0, i32 0
%.tmp3070 = load i8*, i8** %buf.2901
%.tmp3071 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3067, i8* %.tmp3069, i8* %.tmp3070)
%.tmp3072 = load i8*, i8** %buf.2901
ret i8* %.tmp3072
br label %.if.end.3033
.if.false.3033:
%.tmp3073 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3074 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3073, i32 0, i32 0
%.tmp3075 = load i8*, i8** %.tmp3074
%.tmp3077 = getelementptr [6 x i8], [6 x i8]*@.str3076, i32 0, i32 0
%.tmp3078 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3075, i8* %.tmp3077)
%.tmp3079 = icmp eq i32 %.tmp3078, 0
br i1 %.tmp3079, label %.if.true.3080, label %.if.false.3080
.if.true.3080:
%.tmp3081 = getelementptr i8*, i8** %buf.2901, i32 0
%.tmp3083 = getelementptr [10 x i8], [10 x i8]*@.str3082, i32 0, i32 0
%.tmp3084 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3085 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3084, i32 0, i32 3
%.tmp3086 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3085
%.tmp3087 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3086, i32 0, i32 4
%.tmp3088 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3087
%.tmp3089 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3088, i32 0, i32 0
%.tmp3090 = load i8*, i8** %.tmp3089
%.tmp3091 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3092 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3093 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3092, i32 0, i32 3
%.tmp3094 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3093
%.tmp3095 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp3091, %m2859$.Type.type* %.tmp3094)
%.tmp3096 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3081, i8* %.tmp3083, i8* %.tmp3090, i8* %.tmp3095)
%.tmp3097 = load i8*, i8** %buf.2901
ret i8* %.tmp3097
br label %.if.end.3080
.if.false.3080:
%.tmp3098 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3099 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3098, i32 0, i32 0
%.tmp3100 = load i8*, i8** %.tmp3099
%.tmp3102 = getelementptr [10 x i8], [10 x i8]*@.str3101, i32 0, i32 0
%.tmp3103 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3100, i8* %.tmp3102)
%.tmp3104 = icmp eq i32 %.tmp3103, 0
br i1 %.tmp3104, label %.if.true.3105, label %.if.false.3105
.if.true.3105:
%.tmp3106 = getelementptr i8*, i8** %buf.2901, i32 0
%.tmp3108 = getelementptr [5 x i8], [5 x i8]*@.str3107, i32 0, i32 0
%.tmp3109 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3110 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3109, i32 0, i32 2
%.tmp3111 = load i8*, i8** %.tmp3110
%.tmp3112 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3106, i8* %.tmp3108, i8* %.tmp3111)
%.tmp3113 = load i8*, i8** %buf.2901
ret i8* %.tmp3113
br label %.if.end.3105
.if.false.3105:
%.tmp3114 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3115 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3114, i32 0, i32 0
%.tmp3116 = load i8*, i8** %.tmp3115
%.tmp3118 = getelementptr [7 x i8], [7 x i8]*@.str3117, i32 0, i32 0
%.tmp3119 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3116, i8* %.tmp3118)
%.tmp3120 = icmp eq i32 %.tmp3119, 0
br i1 %.tmp3120, label %.if.true.3121, label %.if.false.3121
.if.true.3121:
%.tmp3123 = getelementptr [4 x i8], [4 x i8]*@.str3122, i32 0, i32 0
ret i8* %.tmp3123
br label %.if.end.3121
.if.false.3121:
%.tmp3124 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3125 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3124, i32 0, i32 0
%.tmp3126 = load i8*, i8** %.tmp3125
%.tmp3128 = getelementptr [5 x i8], [5 x i8]*@.str3127, i32 0, i32 0
%.tmp3129 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3126, i8* %.tmp3128)
%.tmp3130 = icmp eq i32 %.tmp3129, 0
br i1 %.tmp3130, label %.if.true.3131, label %.if.false.3131
.if.true.3131:
%.tmp3133 = getelementptr [1 x i8], [1 x i8]*@.str3132, i32 0, i32 0
%buf.3134 = alloca i8*
store i8* %.tmp3133, i8** %buf.3134
%.tmp3135 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3136 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3137 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3136, i32 0, i32 3
%.tmp3138 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3137
%.tmp3139 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3138, i32 0, i32 4
%.tmp3140 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3139
%.tmp3141 = call i32(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$type_size.i.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp3135, %m2859$.Type.type* %.tmp3140)
%enum_size.3142 = alloca i32
store i32 %.tmp3141, i32* %enum_size.3142
%.tmp3143 = getelementptr i8*, i8** %buf.3134, i32 0
%.tmp3145 = getelementptr [10 x i8], [10 x i8]*@.str3144, i32 0, i32 0
%.tmp3146 = load i32, i32* %enum_size.3142
%.tmp3147 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3143, i8* %.tmp3145, i32 %.tmp3146)
%.tmp3148 = load i8*, i8** %buf.3134
ret i8* %.tmp3148
br label %.if.end.3131
.if.false.3131:
%.tmp3149 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3150 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3149, i32 0, i32 0
%.tmp3151 = load i8*, i8** %.tmp3150
%.tmp3153 = getelementptr [11 x i8], [11 x i8]*@.str3152, i32 0, i32 0
%.tmp3154 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3151, i8* %.tmp3153)
%.tmp3155 = icmp eq i32 %.tmp3154, 0
br i1 %.tmp3155, label %.if.true.3156, label %.if.false.3156
.if.true.3156:
%.tmp3157 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3158 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3159 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3158, i32 0, i32 5
%.tmp3160 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3159
%.tmp3161 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp3157, %m2859$.Type.type* %.tmp3160)
ret i8* %.tmp3161
br label %.if.end.3156
.if.false.3156:
%.tmp3162 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3163 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3162, i32 0, i32 0
%.tmp3164 = load i8*, i8** %.tmp3163
%.tmp3166 = getelementptr [6 x i8], [6 x i8]*@.str3165, i32 0, i32 0
%.tmp3167 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3164, i8* %.tmp3166)
%.tmp3168 = icmp eq i32 %.tmp3167, 0
br i1 %.tmp3168, label %.if.true.3169, label %.if.false.3169
.if.true.3169:
br label %.if.end.3169
.if.false.3169:
%.tmp3171 = getelementptr [53 x i8], [53 x i8]*@.str3170, i32 0, i32 0
%.tmp3172 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp3173 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3172, i32 0, i32 0
%.tmp3174 = load i8*, i8** %.tmp3173
%.tmp3175 = call i32(i8*,...) @printf(i8* %.tmp3171, i8* %.tmp3174)
br label %.if.end.3169
.if.end.3169:
br label %.if.end.3156
.if.end.3156:
br label %.if.end.3131
.if.end.3131:
br label %.if.end.3121
.if.end.3121:
br label %.if.end.3105
.if.end.3105:
br label %.if.end.3080
.if.end.3080:
br label %.if.end.3033
.if.end.3033:
br label %.if.end.3015
.if.end.3015:
br label %.if.end.2959
.if.end.2959:
br label %.if.end.2949
.if.end.2949:
br label %.if.end.2939
.if.end.2939:
br label %.if.end.2929
.if.end.2929:
br label %.if.end.2919
.if.end.2919:
br label %.if.end.2909
.if.end.2909:
%.tmp3176 = bitcast ptr null to i8*
ret i8* %.tmp3176
}
define i1 @m2860$cmp.b.m2859$.CompilerCtx.typep.m2859$.Type.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.Type.type* %.a.arg, %m2859$.Type.type* %.b.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%a = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.a.arg, %m2859$.Type.type** %a
%b = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.b.arg, %m2859$.Type.type** %b
%.tmp3177 = load %m2859$.Type.type*, %m2859$.Type.type** %a
%.tmp3178 = icmp eq %m2859$.Type.type* %.tmp3177, null
%.tmp3179 = load %m2859$.Type.type*, %m2859$.Type.type** %b
%.tmp3180 = icmp eq %m2859$.Type.type* %.tmp3179, null
%.tmp3181 = or i1 %.tmp3178, %.tmp3180
br i1 %.tmp3181, label %.if.true.3182, label %.if.false.3182
.if.true.3182:
ret i1 0
br label %.if.end.3182
.if.false.3182:
br label %.if.end.3182
.if.end.3182:
%.tmp3183 = load %m2859$.Type.type*, %m2859$.Type.type** %a
%.tmp3184 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3183, i32 0, i32 0
%.tmp3185 = load i8*, i8** %.tmp3184
%.tmp3187 = getelementptr [8 x i8], [8 x i8]*@.str3186, i32 0, i32 0
%.tmp3188 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3185, i8* %.tmp3187)
%.tmp3189 = icmp eq i32 %.tmp3188, 0
%.tmp3190 = load %m2859$.Type.type*, %m2859$.Type.type** %b
%.tmp3191 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3190, i32 0, i32 0
%.tmp3192 = load i8*, i8** %.tmp3191
%.tmp3194 = getelementptr [8 x i8], [8 x i8]*@.str3193, i32 0, i32 0
%.tmp3195 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3192, i8* %.tmp3194)
%.tmp3196 = icmp eq i32 %.tmp3195, 0
%.tmp3197 = or i1 %.tmp3189, %.tmp3196
br i1 %.tmp3197, label %.if.true.3198, label %.if.false.3198
.if.true.3198:
%.tmp3199 = load %m2859$.Type.type*, %m2859$.Type.type** %a
%.tmp3200 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3199, i32 0, i32 0
%.tmp3201 = load i8*, i8** %.tmp3200
%.tmp3203 = getelementptr [4 x i8], [4 x i8]*@.str3202, i32 0, i32 0
%.tmp3204 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3201, i8* %.tmp3203)
%.tmp3205 = icmp eq i32 %.tmp3204, 0
%.tmp3206 = load %m2859$.Type.type*, %m2859$.Type.type** %b
%.tmp3207 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3206, i32 0, i32 0
%.tmp3208 = load i8*, i8** %.tmp3207
%.tmp3210 = getelementptr [4 x i8], [4 x i8]*@.str3209, i32 0, i32 0
%.tmp3211 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3208, i8* %.tmp3210)
%.tmp3212 = icmp eq i32 %.tmp3211, 0
%.tmp3213 = or i1 %.tmp3205, %.tmp3212
ret i1 %.tmp3213
br label %.if.end.3198
.if.false.3198:
br label %.if.end.3198
.if.end.3198:
%.tmp3214 = load %m2859$.Type.type*, %m2859$.Type.type** %a
%.tmp3215 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3214, i32 0, i32 0
%.tmp3216 = load i8*, i8** %.tmp3215
%.tmp3218 = getelementptr [10 x i8], [10 x i8]*@.str3217, i32 0, i32 0
%.tmp3219 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3216, i8* %.tmp3218)
%.tmp3220 = icmp eq i32 %.tmp3219, 0
br i1 %.tmp3220, label %.if.true.3221, label %.if.false.3221
.if.true.3221:
%.tmp3222 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3223 = load %m2859$.Type.type*, %m2859$.Type.type** %a
%.tmp3224 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3223, i32 0, i32 3
%.tmp3225 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3224
%.tmp3226 = load %m2859$.Type.type*, %m2859$.Type.type** %b
%.tmp3227 = call i1(%m2859$.CompilerCtx.type*,%m2859$.Type.type*,%m2859$.Type.type*) @m2860$cmp.b.m2859$.CompilerCtx.typep.m2859$.Type.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp3222, %m2859$.Type.type* %.tmp3225, %m2859$.Type.type* %.tmp3226)
ret i1 %.tmp3227
br label %.if.end.3221
.if.false.3221:
br label %.if.end.3221
.if.end.3221:
%.tmp3228 = load %m2859$.Type.type*, %m2859$.Type.type** %b
%.tmp3229 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3228, i32 0, i32 0
%.tmp3230 = load i8*, i8** %.tmp3229
%.tmp3232 = getelementptr [10 x i8], [10 x i8]*@.str3231, i32 0, i32 0
%.tmp3233 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3230, i8* %.tmp3232)
%.tmp3234 = icmp eq i32 %.tmp3233, 0
br i1 %.tmp3234, label %.if.true.3235, label %.if.false.3235
.if.true.3235:
%.tmp3236 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3237 = load %m2859$.Type.type*, %m2859$.Type.type** %a
%.tmp3238 = load %m2859$.Type.type*, %m2859$.Type.type** %b
%.tmp3239 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3238, i32 0, i32 3
%.tmp3240 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3239
%.tmp3241 = call i1(%m2859$.CompilerCtx.type*,%m2859$.Type.type*,%m2859$.Type.type*) @m2860$cmp.b.m2859$.CompilerCtx.typep.m2859$.Type.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp3236, %m2859$.Type.type* %.tmp3237, %m2859$.Type.type* %.tmp3240)
ret i1 %.tmp3241
br label %.if.end.3235
.if.false.3235:
br label %.if.end.3235
.if.end.3235:
%.tmp3242 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3243 = load %m2859$.Type.type*, %m2859$.Type.type** %a
%.tmp3244 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp3242, %m2859$.Type.type* %.tmp3243)
%a_repr.3245 = alloca i8*
store i8* %.tmp3244, i8** %a_repr.3245
%.tmp3246 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3247 = load %m2859$.Type.type*, %m2859$.Type.type** %b
%.tmp3248 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp3246, %m2859$.Type.type* %.tmp3247)
%b_repr.3249 = alloca i8*
store i8* %.tmp3248, i8** %b_repr.3249
%.tmp3250 = load i8*, i8** %a_repr.3245
%.tmp3251 = load i8*, i8** %b_repr.3249
%.tmp3252 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3250, i8* %.tmp3251)
%.tmp3253 = icmp eq i32 %.tmp3252, 0
ret i1 %.tmp3253
}
define i32 @m2860$type_size.i.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.Type.type* %.t.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%t = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.t.arg, %m2859$.Type.type** %t
%.tmp3254 = load %m2859$.Type.type*, %m2859$.Type.type** %t
%.tmp3255 = icmp eq %m2859$.Type.type* %.tmp3254, null
br i1 %.tmp3255, label %.if.true.3256, label %.if.false.3256
.if.true.3256:
ret i32 0
br label %.if.end.3256
.if.false.3256:
br label %.if.end.3256
.if.end.3256:
%.tmp3257 = load %m2859$.Type.type*, %m2859$.Type.type** %t
%.tmp3258 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3257, i32 0, i32 0
%.tmp3259 = load i8*, i8** %.tmp3258
%.tmp3261 = getelementptr [4 x i8], [4 x i8]*@.str3260, i32 0, i32 0
%.tmp3262 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3259, i8* %.tmp3261)
%.tmp3263 = icmp eq i32 %.tmp3262, 0
br i1 %.tmp3263, label %.if.true.3264, label %.if.false.3264
.if.true.3264:
ret i32 32
br label %.if.end.3264
.if.false.3264:
%.tmp3265 = load %m2859$.Type.type*, %m2859$.Type.type** %t
%.tmp3266 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3265, i32 0, i32 0
%.tmp3267 = load i8*, i8** %.tmp3266
%.tmp3269 = getelementptr [6 x i8], [6 x i8]*@.str3268, i32 0, i32 0
%.tmp3270 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3267, i8* %.tmp3269)
%.tmp3271 = icmp eq i32 %.tmp3270, 0
br i1 %.tmp3271, label %.if.true.3272, label %.if.false.3272
.if.true.3272:
%union_size.3273 = alloca i32
store i32 0, i32* %union_size.3273
%.tmp3275 = load %m2859$.Type.type*, %m2859$.Type.type** %t
%.tmp3276 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3275, i32 0, i32 3
%.tmp3277 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3276
%field.3278 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp3277, %m2859$.Type.type** %field.3278
br label %.for.start.3274
.for.start.3274:
%.tmp3279 = load %m2859$.Type.type*, %m2859$.Type.type** %field.3278
%.tmp3280 = icmp ne %m2859$.Type.type* %.tmp3279, null
br i1 %.tmp3280, label %.for.continue.3274, label %.for.end.3274
.for.continue.3274:
%.tmp3281 = load i32, i32* %union_size.3273
%.tmp3282 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3283 = load %m2859$.Type.type*, %m2859$.Type.type** %field.3278
%.tmp3284 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3283, i32 0, i32 3
%.tmp3285 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3284
%.tmp3286 = call i32(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$type_size.i.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp3282, %m2859$.Type.type* %.tmp3285)
%.tmp3287 = call i32(i32,i32) @m2861$max.i.i.i(i32 %.tmp3281, i32 %.tmp3286)
store i32 %.tmp3287, i32* %union_size.3273
%.tmp3288 = load %m2859$.Type.type*, %m2859$.Type.type** %field.3278
%.tmp3289 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3288, i32 0, i32 4
%.tmp3290 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3289
store %m2859$.Type.type* %.tmp3290, %m2859$.Type.type** %field.3278
br label %.for.start.3274
.for.end.3274:
%.tmp3291 = load i32, i32* %union_size.3273
ret i32 %.tmp3291
br label %.if.end.3272
.if.false.3272:
%.tmp3292 = load %m2859$.Type.type*, %m2859$.Type.type** %t
%.tmp3293 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3292, i32 0, i32 0
%.tmp3294 = load i8*, i8** %.tmp3293
%.tmp3296 = getelementptr [11 x i8], [11 x i8]*@.str3295, i32 0, i32 0
%.tmp3297 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3294, i8* %.tmp3296)
%.tmp3298 = icmp eq i32 %.tmp3297, 0
br i1 %.tmp3298, label %.if.true.3299, label %.if.false.3299
.if.true.3299:
%.tmp3300 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3301 = load %m2859$.Type.type*, %m2859$.Type.type** %t
%.tmp3302 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3301, i32 0, i32 5
%.tmp3303 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3302
%.tmp3304 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3303, i32 0, i32 3
%.tmp3305 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3304
%.tmp3306 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3305, i32 0, i32 4
%.tmp3307 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3306
%.tmp3308 = call i32(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$type_size.i.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp3300, %m2859$.Type.type* %.tmp3307)
ret i32 %.tmp3308
br label %.if.end.3299
.if.false.3299:
br label %.if.end.3299
.if.end.3299:
br label %.if.end.3272
.if.end.3272:
br label %.if.end.3264
.if.end.3264:
%.tmp3310 = getelementptr [40 x i8], [40 x i8]*@.str3309, i32 0, i32 0
%.tmp3311 = load %m2859$.Type.type*, %m2859$.Type.type** %t
%.tmp3312 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3311, i32 0, i32 0
%.tmp3313 = load i8*, i8** %.tmp3312
%.tmp3314 = call i32(i8*,...) @printf(i8* %.tmp3310, i8* %.tmp3313)
%.tmp3315 = sub i32 0, 1
ret i32 %.tmp3315
}
@DEBUG_INTERNALS = constant i1 0
define %m2859$.Type.type* @m311$type_clone.m2859$.Type.typep.m2859$.Type.typep(%m2859$.Type.type* %.t.arg) {
%t = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.t.arg, %m2859$.Type.type** %t
%.tmp3316 = load %m2859$.Type.type*, %m2859$.Type.type** %t
%.tmp3317 = icmp eq %m2859$.Type.type* %.tmp3316, null
br i1 %.tmp3317, label %.if.true.3318, label %.if.false.3318
.if.true.3318:
%.tmp3319 = bitcast ptr null to %m2859$.Type.type*
ret %m2859$.Type.type* %.tmp3319
br label %.if.end.3318
.if.false.3318:
br label %.if.end.3318
.if.end.3318:
%.tmp3320 = getelementptr %m2859$.Type.type, %m2859$.Type.type* null, i32 1
%.tmp3321 = ptrtoint %m2859$.Type.type* %.tmp3320 to i32
%.tmp3322 = call i8*(i32) @malloc(i32 %.tmp3321)
%.tmp3323 = bitcast i8* %.tmp3322 to %m2859$.Type.type*
%clone.3324 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp3323, %m2859$.Type.type** %clone.3324
%.tmp3325 = load %m2859$.Type.type*, %m2859$.Type.type** %clone.3324
%.tmp3326 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3325, i32 0, i32 3
%.tmp3327 = load %m2859$.Type.type*, %m2859$.Type.type** %t
%.tmp3328 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3327, i32 0, i32 3
%.tmp3329 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3328
store %m2859$.Type.type* %.tmp3329, %m2859$.Type.type** %.tmp3326
%.tmp3330 = load %m2859$.Type.type*, %m2859$.Type.type** %clone.3324
%.tmp3331 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3330, i32 0, i32 4
%.tmp3332 = load %m2859$.Type.type*, %m2859$.Type.type** %t
%.tmp3333 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3332, i32 0, i32 4
%.tmp3334 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3333
%.tmp3335 = call %m2859$.Type.type*(%m2859$.Type.type*) @m311$type_clone.m2859$.Type.typep.m2859$.Type.typep(%m2859$.Type.type* %.tmp3334)
store %m2859$.Type.type* %.tmp3335, %m2859$.Type.type** %.tmp3331
%.tmp3336 = load %m2859$.Type.type*, %m2859$.Type.type** %clone.3324
%.tmp3337 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3336, i32 0, i32 2
%.tmp3338 = load %m2859$.Type.type*, %m2859$.Type.type** %t
%.tmp3339 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3338, i32 0, i32 2
%.tmp3340 = load i8*, i8** %.tmp3339
store i8* %.tmp3340, i8** %.tmp3337
%.tmp3341 = load %m2859$.Type.type*, %m2859$.Type.type** %clone.3324
%.tmp3342 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3341, i32 0, i32 0
%.tmp3343 = load %m2859$.Type.type*, %m2859$.Type.type** %t
%.tmp3344 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3343, i32 0, i32 0
%.tmp3345 = load i8*, i8** %.tmp3344
store i8* %.tmp3345, i8** %.tmp3342
%.tmp3346 = load %m2859$.Type.type*, %m2859$.Type.type** %clone.3324
%.tmp3347 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3346, i32 0, i32 1
%.tmp3348 = load %m2859$.Type.type*, %m2859$.Type.type** %t
%.tmp3349 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3348, i32 0, i32 1
%.tmp3350 = load i8*, i8** %.tmp3349
store i8* %.tmp3350, i8** %.tmp3347
%.tmp3351 = load %m2859$.Type.type*, %m2859$.Type.type** %clone.3324
ret %m2859$.Type.type* %.tmp3351
}
define i8* @m311$get_root.cp() {
%.tmp3353 = getelementptr [12 x i8], [12 x i8]*@.str3352, i32 0, i32 0
%.tmp3354 = call i8*(i8*) @getenv(i8* %.tmp3353)
%project_root.3355 = alloca i8*
store i8* %.tmp3354, i8** %project_root.3355
%.tmp3356 = load i8*, i8** %project_root.3355
%.tmp3357 = icmp eq i8* %.tmp3356, null
br i1 %.tmp3357, label %.if.true.3358, label %.if.false.3358
.if.true.3358:
%.tmp3360 = getelementptr [5 x i8], [5 x i8]*@.str3359, i32 0, i32 0
%.tmp3361 = call i8*(i8*) @getenv(i8* %.tmp3360)
%home.3362 = alloca i8*
store i8* %.tmp3361, i8** %home.3362
%.tmp3363 = getelementptr i8*, i8** %project_root.3355, i32 0
%.tmp3365 = getelementptr [11 x i8], [11 x i8]*@.str3364, i32 0, i32 0
%.tmp3366 = load i8*, i8** %home.3362
%.tmp3367 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3363, i8* %.tmp3365, i8* %.tmp3366)
br label %.if.end.3358
.if.false.3358:
br label %.if.end.3358
.if.end.3358:
%.tmp3368 = load i8*, i8** %project_root.3355
ret i8* %.tmp3368
}
define %m2859$.Type.type* @m311$new_type.m2859$.Type.typep() {
%.tmp3369 = getelementptr %m2859$.Type.type, %m2859$.Type.type* null, i32 1
%.tmp3370 = ptrtoint %m2859$.Type.type* %.tmp3369 to i32
%.tmp3371 = call i8*(i32) @malloc(i32 %.tmp3370)
%.tmp3372 = bitcast i8* %.tmp3371 to %m2859$.Type.type*
%type.3373 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp3372, %m2859$.Type.type** %type.3373
%.tmp3374 = load %m2859$.Type.type*, %m2859$.Type.type** %type.3373
%.tmp3375 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3374, i32 0, i32 1
store i8* null, i8** %.tmp3375
%.tmp3376 = load %m2859$.Type.type*, %m2859$.Type.type** %type.3373
%.tmp3377 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3376, i32 0, i32 2
store i8* null, i8** %.tmp3377
%.tmp3378 = load %m2859$.Type.type*, %m2859$.Type.type** %type.3373
%.tmp3379 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3378, i32 0, i32 0
store i8* null, i8** %.tmp3379
%.tmp3380 = load %m2859$.Type.type*, %m2859$.Type.type** %type.3373
%.tmp3381 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3380, i32 0, i32 3
store %m2859$.Type.type* null, %m2859$.Type.type** %.tmp3381
%.tmp3382 = load %m2859$.Type.type*, %m2859$.Type.type** %type.3373
%.tmp3383 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3382, i32 0, i32 4
store %m2859$.Type.type* null, %m2859$.Type.type** %.tmp3383
%.tmp3384 = load %m2859$.Type.type*, %m2859$.Type.type** %type.3373
%.tmp3385 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3384, i32 0, i32 5
store %m2859$.Type.type* null, %m2859$.Type.type** %.tmp3385
%.tmp3386 = load %m2859$.Type.type*, %m2859$.Type.type** %type.3373
ret %m2859$.Type.type* %.tmp3386
}
define void @m311$copy_type.v.m2859$.Type.typep.m2859$.Type.typep(%m2859$.Type.type* %.dest.arg, %m2859$.Type.type* %.src.arg) {
%dest = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.dest.arg, %m2859$.Type.type** %dest
%src = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.src.arg, %m2859$.Type.type** %src
%.tmp3387 = load %m2859$.Type.type*, %m2859$.Type.type** %dest
%.tmp3388 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3387, i32 0, i32 0
%.tmp3389 = load %m2859$.Type.type*, %m2859$.Type.type** %src
%.tmp3390 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3389, i32 0, i32 0
%.tmp3391 = load i8*, i8** %.tmp3390
store i8* %.tmp3391, i8** %.tmp3388
%.tmp3392 = load %m2859$.Type.type*, %m2859$.Type.type** %dest
%.tmp3393 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3392, i32 0, i32 1
%.tmp3394 = load %m2859$.Type.type*, %m2859$.Type.type** %src
%.tmp3395 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3394, i32 0, i32 1
%.tmp3396 = load i8*, i8** %.tmp3395
store i8* %.tmp3396, i8** %.tmp3393
%.tmp3397 = load %m2859$.Type.type*, %m2859$.Type.type** %dest
%.tmp3398 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3397, i32 0, i32 2
%.tmp3399 = load %m2859$.Type.type*, %m2859$.Type.type** %src
%.tmp3400 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3399, i32 0, i32 2
%.tmp3401 = load i8*, i8** %.tmp3400
store i8* %.tmp3401, i8** %.tmp3398
%.tmp3402 = load %m2859$.Type.type*, %m2859$.Type.type** %dest
%.tmp3403 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3402, i32 0, i32 3
%.tmp3404 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3403
%.tmp3405 = load %m2859$.Type.type*, %m2859$.Type.type** %src
%.tmp3406 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3405, i32 0, i32 3
%.tmp3407 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3406
%.tmp3408 = icmp ne %m2859$.Type.type* %.tmp3404, %.tmp3407
br i1 %.tmp3408, label %.if.true.3409, label %.if.false.3409
.if.true.3409:
%.tmp3410 = load %m2859$.Type.type*, %m2859$.Type.type** %dest
%.tmp3411 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3410, i32 0, i32 3
%.tmp3412 = load %m2859$.Type.type*, %m2859$.Type.type** %src
%.tmp3413 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3412, i32 0, i32 3
%.tmp3414 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3413
store %m2859$.Type.type* %.tmp3414, %m2859$.Type.type** %.tmp3411
%.tmp3415 = load %m2859$.Type.type*, %m2859$.Type.type** %dest
%.tmp3416 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3415, i32 0, i32 3
%.tmp3417 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3416
%.tmp3418 = load %m2859$.Type.type*, %m2859$.Type.type** %src
%.tmp3419 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3418, i32 0, i32 3
%.tmp3420 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3419
call void(%m2859$.Type.type*,%m2859$.Type.type*) @m311$copy_type.v.m2859$.Type.typep.m2859$.Type.typep(%m2859$.Type.type* %.tmp3417, %m2859$.Type.type* %.tmp3420)
br label %.if.end.3409
.if.false.3409:
br label %.if.end.3409
.if.end.3409:
%.tmp3421 = load %m2859$.Type.type*, %m2859$.Type.type** %dest
%.tmp3422 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3421, i32 0, i32 4
%.tmp3423 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3422
%.tmp3424 = load %m2859$.Type.type*, %m2859$.Type.type** %src
%.tmp3425 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3424, i32 0, i32 4
%.tmp3426 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3425
%.tmp3427 = icmp ne %m2859$.Type.type* %.tmp3423, %.tmp3426
br i1 %.tmp3427, label %.if.true.3428, label %.if.false.3428
.if.true.3428:
%.tmp3429 = load %m2859$.Type.type*, %m2859$.Type.type** %dest
%.tmp3430 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3429, i32 0, i32 4
%.tmp3431 = load %m2859$.Type.type*, %m2859$.Type.type** %src
%.tmp3432 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3431, i32 0, i32 4
%.tmp3433 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3432
store %m2859$.Type.type* %.tmp3433, %m2859$.Type.type** %.tmp3430
%.tmp3434 = load %m2859$.Type.type*, %m2859$.Type.type** %dest
%.tmp3435 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3434, i32 0, i32 4
%.tmp3436 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3435
%.tmp3437 = load %m2859$.Type.type*, %m2859$.Type.type** %src
%.tmp3438 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3437, i32 0, i32 4
%.tmp3439 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3438
call void(%m2859$.Type.type*,%m2859$.Type.type*) @m311$copy_type.v.m2859$.Type.typep.m2859$.Type.typep(%m2859$.Type.type* %.tmp3436, %m2859$.Type.type* %.tmp3439)
br label %.if.end.3428
.if.false.3428:
br label %.if.end.3428
.if.end.3428:
ret void
}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m2859$.AssignableInfo.type* @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.node.arg) {
%node = alloca %m996$.Node.type*
store %m996$.Node.type* %.node.arg, %m996$.Node.type** %node
%.tmp3440 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* null, i32 1
%.tmp3441 = ptrtoint %m2859$.AssignableInfo.type* %.tmp3440 to i32
%.tmp3442 = call i8*(i32) @malloc(i32 %.tmp3441)
%.tmp3443 = bitcast i8* %.tmp3442 to %m2859$.AssignableInfo.type*
%ptr.3444 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp3443, %m2859$.AssignableInfo.type** %ptr.3444
%.tmp3445 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %ptr.3444
%.tmp3446 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3445, i32 0, i32 1
%.tmp3447 = load i8, i8* @SCOPE_CONST
store i8 %.tmp3447, i8* %.tmp3446
%.tmp3448 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %ptr.3444
%.tmp3449 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3448, i32 0, i32 0
store i8* null, i8** %.tmp3449
%.tmp3450 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %ptr.3444
%.tmp3451 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3450, i32 0, i32 3
store i8* null, i8** %.tmp3451
%.tmp3452 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %ptr.3444
%.tmp3453 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3452, i32 0, i32 2
%.tmp3455 = getelementptr [1 x i8], [1 x i8]*@.str3454, i32 0, i32 0
store i8* %.tmp3455, i8** %.tmp3453
%.tmp3456 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %ptr.3444
%.tmp3457 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3456, i32 0, i32 4
store %m2859$.Type.type* null, %m2859$.Type.type** %.tmp3457
%.tmp3458 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp3459 = icmp ne %m996$.Node.type* %.tmp3458, null
br i1 %.tmp3459, label %.if.true.3460, label %.if.false.3460
.if.true.3460:
%.tmp3461 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %ptr.3444
%.tmp3462 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3461, i32 0, i32 5
%.tmp3463 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp3464 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3463, i32 0, i32 3
%.tmp3465 = load i32, i32* %.tmp3464
store i32 %.tmp3465, i32* %.tmp3462
%.tmp3466 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %ptr.3444
%.tmp3467 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3466, i32 0, i32 6
%.tmp3468 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp3469 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3468, i32 0, i32 4
%.tmp3470 = load i32, i32* %.tmp3469
store i32 %.tmp3470, i32* %.tmp3467
%.tmp3471 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %ptr.3444
%.tmp3472 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3471, i32 0, i32 7
%.tmp3473 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp3474 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3473, i32 0, i32 2
%.tmp3475 = load i8*, i8** %.tmp3474
store i8* %.tmp3475, i8** %.tmp3472
br label %.if.end.3460
.if.false.3460:
%.tmp3476 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %ptr.3444
%.tmp3477 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3476, i32 0, i32 5
store i32 0, i32* %.tmp3477
%.tmp3478 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %ptr.3444
%.tmp3479 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3478, i32 0, i32 6
store i32 0, i32* %.tmp3479
%.tmp3480 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %ptr.3444
%.tmp3481 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3480, i32 0, i32 7
store i8* null, i8** %.tmp3481
br label %.if.end.3460
.if.end.3460:
%.tmp3482 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %ptr.3444
ret %m2859$.AssignableInfo.type* %.tmp3482
}
define void @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.info.arg, %m2859$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp3483 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp3484 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3483, i32 0, i32 0
%.tmp3485 = load i8*, i8** %id
store i8* %.tmp3485, i8** %.tmp3484
%.tmp3486 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp3487 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3486, i32 0, i32 1
%.tmp3488 = load i8, i8* %scope
store i8 %.tmp3488, i8* %.tmp3487
ret void
}
define i8* @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.info.arg) {
%info = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.info.arg, %m2859$.AssignableInfo.type** %info
%.tmp3489 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp3490 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3489, i32 0, i32 1
%.tmp3491 = load i8, i8* %.tmp3490
%.tmp3492 = load i8, i8* @SCOPE_CONST
%.tmp3493 = icmp eq i8 %.tmp3491, %.tmp3492
br i1 %.tmp3493, label %.if.true.3494, label %.if.false.3494
.if.true.3494:
%.tmp3495 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp3496 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3495, i32 0, i32 0
%.tmp3497 = load i8*, i8** %.tmp3496
ret i8* %.tmp3497
br label %.if.end.3494
.if.false.3494:
br label %.if.end.3494
.if.end.3494:
%.tmp3499 = getelementptr [1 x i8], [1 x i8]*@.str3498, i32 0, i32 0
%buf.3500 = alloca i8*
store i8* %.tmp3499, i8** %buf.3500
%.tmp3501 = getelementptr i8*, i8** %buf.3500, i32 0
%.tmp3503 = getelementptr [5 x i8], [5 x i8]*@.str3502, i32 0, i32 0
%.tmp3504 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp3505 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3504, i32 0, i32 1
%.tmp3506 = load i8, i8* %.tmp3505
%.tmp3507 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp3508 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3507, i32 0, i32 0
%.tmp3509 = load i8*, i8** %.tmp3508
%.tmp3510 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3501, i8* %.tmp3503, i8 %.tmp3506, i8* %.tmp3509)
%.tmp3511 = load i8*, i8** %buf.3500
ret i8* %.tmp3511
}
define void @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%info = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.info.arg, %m2859$.AssignableInfo.type** %info
%.tmp3513 = getelementptr [1 x i8], [1 x i8]*@.str3512, i32 0, i32 0
%tmp_buff.3514 = alloca i8*
store i8* %.tmp3513, i8** %tmp_buff.3514
%.tmp3515 = getelementptr i8*, i8** %tmp_buff.3514, i32 0
%.tmp3517 = getelementptr [7 x i8], [7 x i8]*@.str3516, i32 0, i32 0
%.tmp3518 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3519 = call i32(%m2859$.CompilerCtx.type*) @m311$new_uid.i.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp3518)
%.tmp3520 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3515, i8* %.tmp3517, i32 %.tmp3519)
%.tmp3521 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp3522 = load i8, i8* @SCOPE_LOCAL
%.tmp3523 = load i8*, i8** %tmp_buff.3514
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp3521, i8 %.tmp3522, i8* %.tmp3523)
ret void
}
define %m2859$.ModuleLookup.type* @m311$get_module.m2859$.ModuleLookup.typep.m2859$.CompilerCtx.typep.cp(%m2859$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp3525 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3526 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3525, i32 0, i32 6
%.tmp3527 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %.tmp3526
%m.3528 = alloca %m2859$.ModuleLookup.type*
store %m2859$.ModuleLookup.type* %.tmp3527, %m2859$.ModuleLookup.type** %m.3528
br label %.for.start.3524
.for.start.3524:
%.tmp3529 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.3528
%.tmp3530 = icmp ne %m2859$.ModuleLookup.type* %.tmp3529, null
br i1 %.tmp3530, label %.for.continue.3524, label %.for.end.3524
.for.continue.3524:
%.tmp3531 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.3528
%.tmp3532 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp3531, i32 0, i32 0
%.tmp3533 = load i8*, i8** %.tmp3532
%.tmp3534 = load i8*, i8** %filename
%.tmp3535 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3533, i8* %.tmp3534)
%.tmp3536 = icmp eq i32 %.tmp3535, 0
br i1 %.tmp3536, label %.if.true.3537, label %.if.false.3537
.if.true.3537:
%.tmp3538 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.3528
ret %m2859$.ModuleLookup.type* %.tmp3538
br label %.if.end.3537
.if.false.3537:
br label %.if.end.3537
.if.end.3537:
%.tmp3539 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.3528
%.tmp3540 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp3539, i32 0, i32 2
%.tmp3541 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %.tmp3540
store %m2859$.ModuleLookup.type* %.tmp3541, %m2859$.ModuleLookup.type** %m.3528
br label %.for.start.3524
.for.end.3524:
%.tmp3542 = bitcast ptr null to %m2859$.ModuleLookup.type*
ret %m2859$.ModuleLookup.type* %.tmp3542
}
define %m2859$.ModuleLookup.type* @m311$get_current_module.m2859$.ModuleLookup.typep.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%.tmp3543 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3544 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3545 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3544, i32 0, i32 7
%.tmp3546 = load i8*, i8** %.tmp3545
%.tmp3547 = call %m2859$.ModuleLookup.type*(%m2859$.CompilerCtx.type*,i8*) @m311$get_module.m2859$.ModuleLookup.typep.m2859$.CompilerCtx.typep.cp(%m2859$.CompilerCtx.type* %.tmp3543, i8* %.tmp3546)
ret %m2859$.ModuleLookup.type* %.tmp3547
}
define i32 @m311$new_uid.i.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%.tmp3548 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3549 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3548, i32 0, i32 5
%.tmp3550 = load i32, i32* %.tmp3549
%uid.3551 = alloca i32
store i32 %.tmp3550, i32* %uid.3551
%.tmp3552 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3553 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3552, i32 0, i32 5
%.tmp3554 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3555 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3554, i32 0, i32 5
%.tmp3556 = load i32, i32* %.tmp3555
%.tmp3557 = add i32 %.tmp3556, 1
store i32 %.tmp3557, i32* %.tmp3553
%.tmp3558 = load i32, i32* %uid.3551
ret i32 %.tmp3558
}
define %m2859$.CompilerCtx.type* @m311$new_context.m2859$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp3559 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* null, i32 1
%.tmp3560 = ptrtoint %m2859$.CompilerCtx.type* %.tmp3559 to i32
%.tmp3561 = call i8*(i32) @malloc(i32 %.tmp3560)
%.tmp3562 = bitcast i8* %.tmp3561 to %m2859$.CompilerCtx.type*
%ctx.3563 = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.tmp3562, %m2859$.CompilerCtx.type** %ctx.3563
%.tmp3564 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx.3563
%.tmp3565 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3564, i32 0, i32 1
%.tmp3566 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp3566, %m0$.File.type** %.tmp3565
%.tmp3567 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx.3563
%.tmp3568 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3567, i32 0, i32 0
%.tmp3569 = bitcast ptr null to %m996$.Node.type*
store %m996$.Node.type* %.tmp3569, %m996$.Node.type** %.tmp3568
%.tmp3570 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx.3563
%.tmp3571 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3570, i32 0, i32 2
store %m2859$.ErrorList.type* null, %m2859$.ErrorList.type** %.tmp3571
%.tmp3572 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx.3563
%.tmp3573 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3572, i32 0, i32 5
store i32 0, i32* %.tmp3573
%.tmp3574 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx.3563
%.tmp3575 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3574, i32 0, i32 3
store %m2859$.GlobalName.type* null, %m2859$.GlobalName.type** %.tmp3575
%.tmp3576 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx.3563
%.tmp3577 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3576, i32 0, i32 8
store %m2859$.AnonFn.type* null, %m2859$.AnonFn.type** %.tmp3577
%.tmp3578 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx.3563
%.tmp3579 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3578, i32 0, i32 7
%.tmp3580 = load i8*, i8** %filename
store i8* %.tmp3580, i8** %.tmp3579
%.tmp3581 = call i8*() @m2407$grammar.cp()
%.tmp3582 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp3581)
%grammar_file.3583 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp3582, %m0$.File.type** %grammar_file.3583
%.tmp3584 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3583
%.tmp3585 = icmp eq %m0$.File.type* %.tmp3584, null
br i1 %.tmp3585, label %.if.true.3586, label %.if.false.3586
.if.true.3586:
%.tmp3587 = bitcast ptr null to %m2859$.CompilerCtx.type*
ret %m2859$.CompilerCtx.type* %.tmp3587
br label %.if.end.3586
.if.false.3586:
br label %.if.end.3586
.if.end.3586:
%.tmp3588 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3583
%.tmp3589 = call %m996$.ParsingContext.type*(%m0$.File.type*) @m996$new_context.m996$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp3588)
%grammar_ctx.3590 = alloca %m996$.ParsingContext.type*
store %m996$.ParsingContext.type* %.tmp3589, %m996$.ParsingContext.type** %grammar_ctx.3590
%.tmp3591 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3583
%.tmp3592 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp3591)
%.tmp3593 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx.3563
%.tmp3594 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3593, i32 0, i32 4
%.tmp3595 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %grammar_ctx.3590
%.tmp3596 = call %m996$.Rule.type**(%m996$.ParsingContext.type*) @m996$parse_grammar.m996$.Rule.typepp.m996$.ParsingContext.typep(%m996$.ParsingContext.type* %.tmp3595)
store %m996$.Rule.type** %.tmp3596, %m996$.Rule.type*** %.tmp3594
%.tmp3597 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx.3563
%.tmp3598 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3597, i32 0, i32 4
%.tmp3599 = load %m996$.Rule.type**, %m996$.Rule.type*** %.tmp3598
%.tmp3600 = icmp eq %m996$.Rule.type** %.tmp3599, null
br i1 %.tmp3600, label %.if.true.3601, label %.if.false.3601
.if.true.3601:
%.tmp3603 = getelementptr [39 x i8], [39 x i8]*@.str3602, i32 0, i32 0
%.tmp3604 = call i32(i8*,...) @printf(i8* %.tmp3603)
call void(i32) @exit(i32 1)
br label %.if.end.3601
.if.false.3601:
br label %.if.end.3601
.if.end.3601:
%.tmp3605 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx.3563
%.tmp3606 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3605, i32 0, i32 6
%.tmp3607 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* null, i32 1
%.tmp3608 = ptrtoint %m2859$.ModuleLookup.type* %.tmp3607 to i32
%.tmp3609 = call i8*(i32) @malloc(i32 %.tmp3608)
%.tmp3610 = bitcast i8* %.tmp3609 to %m2859$.ModuleLookup.type*
store %m2859$.ModuleLookup.type* %.tmp3610, %m2859$.ModuleLookup.type** %.tmp3606
%.tmp3611 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx.3563
%.tmp3612 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3611, i32 0, i32 6
%.tmp3613 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %.tmp3612
%.tmp3614 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp3613, i32 0, i32 0
%.tmp3615 = load i8*, i8** %filename
store i8* %.tmp3615, i8** %.tmp3614
%.tmp3616 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx.3563
%.tmp3617 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3616, i32 0, i32 6
%.tmp3618 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %.tmp3617
%.tmp3619 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp3618, i32 0, i32 3
store %m2859$.Scope.type* null, %m2859$.Scope.type** %.tmp3619
%.tmp3620 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx.3563
%.tmp3621 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3620, i32 0, i32 6
%.tmp3622 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %.tmp3621
%.tmp3623 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp3622, i32 0, i32 1
%.tmp3625 = getelementptr [1 x i8], [1 x i8]*@.str3624, i32 0, i32 0
store i8* %.tmp3625, i8** %.tmp3623
%.tmp3626 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx.3563
%.tmp3627 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3626, i32 0, i32 6
%.tmp3628 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %.tmp3627
%.tmp3629 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp3628, i32 0, i32 2
store %m2859$.ModuleLookup.type* null, %m2859$.ModuleLookup.type** %.tmp3629
%.tmp3630 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx.3563
%.tmp3631 = bitcast %m2859$.CompilerCtx.type* %.tmp3630 to %m2859$.CompilerCtx.type*
ret %m2859$.CompilerCtx.type* %.tmp3631
}
define void @m311$push_scope.v.m2859$.CompilerCtx.typep.cp.cp.cp.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.ctx.arg, i8* %.type.arg, i8* %.begin_id.arg, i8* %.end_id.arg, %m2859$.Type.type* %.t.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%type = alloca i8*
store i8* %.type.arg, i8** %type
%begin_id = alloca i8*
store i8* %.begin_id.arg, i8** %begin_id
%end_id = alloca i8*
store i8* %.end_id.arg, i8** %end_id
%t = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.t.arg, %m2859$.Type.type** %t
%.tmp3632 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* null, i32 1
%.tmp3633 = ptrtoint %m2859$.Scope.type* %.tmp3632 to i32
%.tmp3634 = call i8*(i32) @malloc(i32 %.tmp3633)
%.tmp3635 = bitcast i8* %.tmp3634 to %m2859$.Scope.type*
%s.3636 = alloca %m2859$.Scope.type*
store %m2859$.Scope.type* %.tmp3635, %m2859$.Scope.type** %s.3636
%.tmp3637 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3638 = call %m2859$.ModuleLookup.type*(%m2859$.CompilerCtx.type*) @m311$get_current_module.m2859$.ModuleLookup.typep.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp3637)
%m.3639 = alloca %m2859$.ModuleLookup.type*
store %m2859$.ModuleLookup.type* %.tmp3638, %m2859$.ModuleLookup.type** %m.3639
%.tmp3640 = load %m2859$.Scope.type*, %m2859$.Scope.type** %s.3636
%.tmp3641 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp3640, i32 0, i32 5
%.tmp3642 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.3639
%.tmp3643 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp3642, i32 0, i32 3
%.tmp3644 = load %m2859$.Scope.type*, %m2859$.Scope.type** %.tmp3643
store %m2859$.Scope.type* %.tmp3644, %m2859$.Scope.type** %.tmp3641
%.tmp3645 = load %m2859$.Scope.type*, %m2859$.Scope.type** %s.3636
%.tmp3646 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp3645, i32 0, i32 1
store %m2859$.ScopeItem.type* null, %m2859$.ScopeItem.type** %.tmp3646
%.tmp3647 = load %m2859$.Scope.type*, %m2859$.Scope.type** %s.3636
%.tmp3648 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp3647, i32 0, i32 2
%.tmp3649 = load i8*, i8** %type
store i8* %.tmp3649, i8** %.tmp3648
%.tmp3650 = load %m2859$.Scope.type*, %m2859$.Scope.type** %s.3636
%.tmp3651 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp3650, i32 0, i32 3
%.tmp3652 = load i8*, i8** %begin_id
store i8* %.tmp3652, i8** %.tmp3651
%.tmp3653 = load %m2859$.Scope.type*, %m2859$.Scope.type** %s.3636
%.tmp3654 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp3653, i32 0, i32 4
%.tmp3655 = load i8*, i8** %end_id
store i8* %.tmp3655, i8** %.tmp3654
%.tmp3656 = load %m2859$.Scope.type*, %m2859$.Scope.type** %s.3636
%.tmp3657 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp3656, i32 0, i32 6
%.tmp3658 = load %m2859$.Type.type*, %m2859$.Type.type** %t
store %m2859$.Type.type* %.tmp3658, %m2859$.Type.type** %.tmp3657
%.tmp3659 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.3639
%.tmp3660 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp3659, i32 0, i32 3
%.tmp3661 = load %m2859$.Scope.type*, %m2859$.Scope.type** %s.3636
store %m2859$.Scope.type* %.tmp3661, %m2859$.Scope.type** %.tmp3660
ret void
}
define void @m311$pop_scope.v.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%.tmp3662 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3663 = call %m2859$.ModuleLookup.type*(%m2859$.CompilerCtx.type*) @m311$get_current_module.m2859$.ModuleLookup.typep.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp3662)
%m.3664 = alloca %m2859$.ModuleLookup.type*
store %m2859$.ModuleLookup.type* %.tmp3663, %m2859$.ModuleLookup.type** %m.3664
%.tmp3665 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.3664
%.tmp3666 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp3665, i32 0, i32 3
%.tmp3667 = load %m2859$.Scope.type*, %m2859$.Scope.type** %.tmp3666
%.tmp3668 = icmp ne %m2859$.Scope.type* %.tmp3667, null
%.tmp3670 = getelementptr [61 x i8], [61 x i8]*@.str3669, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp3668, i8* %.tmp3670)
%.tmp3671 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.3664
%.tmp3672 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp3671, i32 0, i32 3
%.tmp3673 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.3664
%.tmp3674 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp3673, i32 0, i32 3
%.tmp3675 = load %m2859$.Scope.type*, %m2859$.Scope.type** %.tmp3674
%.tmp3676 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp3675, i32 0, i32 5
%.tmp3677 = load %m2859$.Scope.type*, %m2859$.Scope.type** %.tmp3676
store %m2859$.Scope.type* %.tmp3677, %m2859$.Scope.type** %.tmp3672
ret void
}
define i1 @m311$compile_file.b.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, i8* %.filepath.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp3678 = load i8*, i8** %filepath
%.tmp3679 = load i32, i32* @O_RDONLY
%.tmp3680 = call i32(i8*,i32) @open(i8* %.tmp3678, i32 %.tmp3679)
%input_fd.3681 = alloca i32
store i32 %.tmp3680, i32* %input_fd.3681
%.tmp3682 = load i32, i32* %input_fd.3681
%.tmp3683 = icmp sle i32 %.tmp3682, 0
br i1 %.tmp3683, label %.if.true.3684, label %.if.false.3684
.if.true.3684:
%.tmp3686 = getelementptr [1 x i8], [1 x i8]*@.str3685, i32 0, i32 0
%err_msg.3687 = alloca i8*
store i8* %.tmp3686, i8** %err_msg.3687
%.tmp3688 = getelementptr i8*, i8** %err_msg.3687, i32 0
%.tmp3690 = getelementptr [26 x i8], [26 x i8]*@.str3689, i32 0, i32 0
%.tmp3691 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp3692 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3688, i8* %.tmp3690, %m996$.Node.type* %.tmp3691)
%.tmp3693 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3694 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp3695 = load i8*, i8** %err_msg.3687
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp3693, %m996$.Node.type* %.tmp3694, i8* %.tmp3695)
ret i1 0
br label %.if.end.3684
.if.false.3684:
br label %.if.end.3684
.if.end.3684:
%.tmp3696 = load i32, i32* %input_fd.3681
%.tmp3697 = call %m314$.PeekerInfo.type*(i32) @m314$new.m314$.PeekerInfo.typep.i(i32 %.tmp3696)
%p.3698 = alloca %m314$.PeekerInfo.type*
store %m314$.PeekerInfo.type* %.tmp3697, %m314$.PeekerInfo.type** %p.3698
%.tmp3699 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p.3698
%.tmp3700 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp3699, i32 0, i32 6
%.tmp3701 = load i8*, i8** %filepath
store i8* %.tmp3701, i8** %.tmp3700
%.tmp3702 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p.3698
%.tmp3703 = call %m313$.Token.type*(%m314$.PeekerInfo.type*,i1) @m313$tokenize.m313$.Token.typep.m314$.PeekerInfo.typep.b(%m314$.PeekerInfo.type* %.tmp3702, i1 0)
%tokens.3704 = alloca %m313$.Token.type*
store %m313$.Token.type* %.tmp3703, %m313$.Token.type** %tokens.3704
%.tmp3705 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3706 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3705, i32 0, i32 4
%.tmp3707 = load %m996$.Rule.type**, %m996$.Rule.type*** %.tmp3706
%.tmp3709 = getelementptr [6 x i8], [6 x i8]*@.str3708, i32 0, i32 0
%.tmp3710 = load %m313$.Token.type*, %m313$.Token.type** %tokens.3704
%.tmp3711 = call %m996$.ParseResult.type*(%m996$.Rule.type**,i8*,%m313$.Token.type*) @m996$ast.m996$.ParseResult.typep.m996$.Rule.typepp.cp.m313$.Token.typep(%m996$.Rule.type** %.tmp3707, i8* %.tmp3709, %m313$.Token.type* %.tmp3710)
%ast.3712 = alloca %m996$.ParseResult.type*
store %m996$.ParseResult.type* %.tmp3711, %m996$.ParseResult.type** %ast.3712
%.tmp3713 = load i32, i32* %input_fd.3681
%.tmp3714 = call i32(i32) @close(i32 %.tmp3713)
%.tmp3715 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %ast.3712
%.tmp3716 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp3715, i32 0, i32 0
%.tmp3717 = load %m312$.Error.type*, %m312$.Error.type** %.tmp3716
%.tmp3718 = icmp ne %m312$.Error.type* %.tmp3717, null
br i1 %.tmp3718, label %.if.true.3719, label %.if.false.3719
.if.true.3719:
%.tmp3720 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3721 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %ast.3712
%.tmp3722 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp3721, i32 0, i32 0
%.tmp3723 = load %m312$.Error.type*, %m312$.Error.type** %.tmp3722
call void(%m2859$.CompilerCtx.type*,%m312$.Error.type*) @m311$append_error.v.m2859$.CompilerCtx.typep.m312$.Error.typep(%m2859$.CompilerCtx.type* %.tmp3720, %m312$.Error.type* %.tmp3723)
%.tmp3724 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
call void(%m2859$.CompilerCtx.type*) @m311$report_errors.v.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp3724)
ret i1 1
br label %.if.end.3719
.if.false.3719:
br label %.if.end.3719
.if.end.3719:
%.tmp3725 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3726 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %ast.3712
%.tmp3727 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp3726, i32 0, i32 1
%.tmp3728 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3727
%.tmp3729 = call i1(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile.b.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp3725, %m996$.Node.type* %.tmp3728)
ret i1 %.tmp3729
}
define void @m311$report_errors.v.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%.tmp3730 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3731 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3730, i32 0, i32 2
%.tmp3732 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %.tmp3731
%.tmp3733 = icmp ne %m2859$.ErrorList.type* %.tmp3732, null
br i1 %.tmp3733, label %.if.true.3734, label %.if.false.3734
.if.true.3734:
%.tmp3736 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3737 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3736, i32 0, i32 2
%.tmp3738 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %.tmp3737
%err.3739 = alloca %m2859$.ErrorList.type*
store %m2859$.ErrorList.type* %.tmp3738, %m2859$.ErrorList.type** %err.3739
br label %.for.start.3735
.for.start.3735:
%.tmp3740 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %err.3739
%.tmp3741 = icmp ne %m2859$.ErrorList.type* %.tmp3740, null
br i1 %.tmp3741, label %.for.continue.3735, label %.for.end.3735
.for.continue.3735:
%.tmp3742 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %err.3739
%.tmp3743 = getelementptr %m2859$.ErrorList.type, %m2859$.ErrorList.type* %.tmp3742, i32 0, i32 2
%.tmp3744 = load i1, i1* %.tmp3743
%.tmp3745 = icmp eq i1 %.tmp3744, 0
br i1 %.tmp3745, label %.if.true.3746, label %.if.false.3746
.if.true.3746:
%.tmp3747 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %err.3739
%.tmp3748 = getelementptr %m2859$.ErrorList.type, %m2859$.ErrorList.type* %.tmp3747, i32 0, i32 0
%.tmp3749 = load %m312$.Error.type*, %m312$.Error.type** %.tmp3748
call void(%m312$.Error.type*) @m312$report.v.m312$.Error.typep(%m312$.Error.type* %.tmp3749)
%.tmp3750 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %err.3739
%.tmp3751 = getelementptr %m2859$.ErrorList.type, %m2859$.ErrorList.type* %.tmp3750, i32 0, i32 2
store i1 1, i1* %.tmp3751
br label %.if.end.3746
.if.false.3746:
br label %.if.end.3746
.if.end.3746:
%.tmp3752 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %err.3739
%.tmp3753 = getelementptr %m2859$.ErrorList.type, %m2859$.ErrorList.type* %.tmp3752, i32 0, i32 1
%.tmp3754 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %.tmp3753
store %m2859$.ErrorList.type* %.tmp3754, %m2859$.ErrorList.type** %err.3739
br label %.for.start.3735
.for.end.3735:
br label %.if.end.3734
.if.false.3734:
br label %.if.end.3734
.if.end.3734:
ret void
}
define i1 @m311$compile.b.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.ast.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%ast = alloca %m996$.Node.type*
store %m996$.Node.type* %.ast.arg, %m996$.Node.type** %ast
%.tmp3755 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3756 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3755, i32 0, i32 2
%.tmp3757 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %.tmp3756
%.tmp3758 = icmp eq %m2859$.ErrorList.type* %.tmp3757, null
br i1 %.tmp3758, label %.if.true.3759, label %.if.false.3759
.if.true.3759:
%.tmp3760 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3761 = load %m996$.Node.type*, %m996$.Node.type** %ast
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_ast.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp3760, %m996$.Node.type* %.tmp3761)
br label %.if.end.3759
.if.false.3759:
br label %.if.end.3759
.if.end.3759:
%.tmp3762 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3763 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3762, i32 0, i32 2
%.tmp3764 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %.tmp3763
%.tmp3765 = icmp ne %m2859$.ErrorList.type* %.tmp3764, null
br i1 %.tmp3765, label %.if.true.3766, label %.if.false.3766
.if.true.3766:
%.tmp3767 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
call void(%m2859$.CompilerCtx.type*) @m311$report_errors.v.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp3767)
ret i1 1
br label %.if.end.3766
.if.false.3766:
br label %.if.end.3766
.if.end.3766:
ret i1 0
}
define void @m311$mark_weak_global.v.m2859$.CompilerCtx.typep.cp(%m2859$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp3769 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3770 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3769, i32 0, i32 3
%.tmp3771 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %.tmp3770
%g.3772 = alloca %m2859$.GlobalName.type*
store %m2859$.GlobalName.type* %.tmp3771, %m2859$.GlobalName.type** %g.3772
br label %.for.start.3768
.for.start.3768:
%.tmp3773 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g.3772
%.tmp3774 = icmp ne %m2859$.GlobalName.type* %.tmp3773, null
br i1 %.tmp3774, label %.for.continue.3768, label %.for.end.3768
.for.continue.3768:
%.tmp3775 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g.3772
%.tmp3776 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp3775, i32 0, i32 3
%.tmp3777 = load i1, i1* %.tmp3776
%.tmp3778 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g.3772
%.tmp3779 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp3778, i32 0, i32 0
%.tmp3780 = load i8*, i8** %.tmp3779
%.tmp3781 = load i8*, i8** %id
%.tmp3782 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3780, i8* %.tmp3781)
%.tmp3783 = icmp eq i32 %.tmp3782, 0
%.tmp3784 = and i1 %.tmp3777, %.tmp3783
br i1 %.tmp3784, label %.if.true.3785, label %.if.false.3785
.if.true.3785:
%.tmp3786 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g.3772
%.tmp3787 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp3786, i32 0, i32 2
store i1 1, i1* %.tmp3787
br label %.for.end.3768
br label %.if.end.3785
.if.false.3785:
br label %.if.end.3785
.if.end.3785:
%.tmp3788 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g.3772
%.tmp3789 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp3788, i32 0, i32 5
%.tmp3790 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %.tmp3789
store %m2859$.GlobalName.type* %.tmp3790, %m2859$.GlobalName.type** %g.3772
br label %.for.start.3768
.for.end.3768:
ret void
}
define void @m311$compile_ast.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.ast.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%ast = alloca %m996$.Node.type*
store %m996$.Node.type* %.ast.arg, %m996$.Node.type** %ast
%.tmp3791 = load %m996$.Node.type*, %m996$.Node.type** %ast
%.tmp3792 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3791, i32 0, i32 0
%.tmp3793 = load i8*, i8** %.tmp3792
%.tmp3795 = getelementptr [6 x i8], [6 x i8]*@.str3794, i32 0, i32 0
%.tmp3796 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3793, i8* %.tmp3795)
%.tmp3797 = icmp ne i32 %.tmp3796, 0
br i1 %.tmp3797, label %.if.true.3798, label %.if.false.3798
.if.true.3798:
%.tmp3799 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3800 = load %m996$.Node.type*, %m996$.Node.type** %ast
%.tmp3802 = getelementptr [29 x i8], [29 x i8]*@.str3801, i32 0, i32 0
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp3799, %m996$.Node.type* %.tmp3800, i8* %.tmp3802)
ret void
br label %.if.end.3798
.if.false.3798:
br label %.if.end.3798
.if.end.3798:
%.tmp3803 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3805 = getelementptr [7 x i8], [7 x i8]*@.str3804, i32 0, i32 0
%.tmp3806 = bitcast ptr null to i8*
%.tmp3807 = bitcast ptr null to i8*
%.tmp3808 = bitcast ptr null to %m2859$.Type.type*
call void(%m2859$.CompilerCtx.type*,i8*,i8*,i8*,%m2859$.Type.type*) @m311$push_scope.v.m2859$.CompilerCtx.typep.cp.cp.cp.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp3803, i8* %.tmp3805, i8* %.tmp3806, i8* %.tmp3807, %m2859$.Type.type* %.tmp3808)
%.tmp3809 = load %m996$.Node.type*, %m996$.Node.type** %ast
%.tmp3810 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3809, i32 0, i32 8
%.tmp3811 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3810
%start.3812 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp3811, %m996$.Node.type** %start.3812
%.tmp3813 = load %m996$.Node.type*, %m996$.Node.type** %start.3812
%.tmp3814 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3813, i32 0, i32 0
%.tmp3815 = load i8*, i8** %.tmp3814
%.tmp3817 = getelementptr [13 x i8], [13 x i8]*@.str3816, i32 0, i32 0
%.tmp3818 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3815, i8* %.tmp3817)
%.tmp3819 = icmp eq i32 %.tmp3818, 0
br i1 %.tmp3819, label %.if.true.3820, label %.if.false.3820
.if.true.3820:
%.tmp3821 = load %m996$.Node.type*, %m996$.Node.type** %start.3812
%.tmp3822 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3821, i32 0, i32 9
%.tmp3823 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3822
store %m996$.Node.type* %.tmp3823, %m996$.Node.type** %start.3812
br label %.if.end.3820
.if.false.3820:
br label %.if.end.3820
.if.end.3820:
%.tmp3825 = load %m996$.Node.type*, %m996$.Node.type** %start.3812
%stmt.3826 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp3825, %m996$.Node.type** %stmt.3826
br label %.for.start.3824
.for.start.3824:
%.tmp3827 = load %m996$.Node.type*, %m996$.Node.type** %stmt.3826
%.tmp3828 = icmp ne %m996$.Node.type* %.tmp3827, null
br i1 %.tmp3828, label %.for.continue.3824, label %.for.end.3824
.for.continue.3824:
%.tmp3829 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3830 = load %m996$.Node.type*, %m996$.Node.type** %stmt.3826
%.tmp3831 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3830, i32 0, i32 8
%.tmp3832 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3831
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i1) @m311$compile_statement.v.m2859$.CompilerCtx.typep.m996$.Node.typep.b(%m2859$.CompilerCtx.type* %.tmp3829, %m996$.Node.type* %.tmp3832, i1 1)
%.tmp3833 = load %m996$.Node.type*, %m996$.Node.type** %stmt.3826
%.tmp3834 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3833, i32 0, i32 9
%.tmp3835 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3834
store %m996$.Node.type* %.tmp3835, %m996$.Node.type** %stmt.3826
br label %.for.start.3824
.for.end.3824:
%.tmp3836 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3837 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3836, i32 0, i32 2
%.tmp3838 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %.tmp3837
%.tmp3839 = icmp ne %m2859$.ErrorList.type* %.tmp3838, null
br i1 %.tmp3839, label %.if.true.3840, label %.if.false.3840
.if.true.3840:
ret void
br label %.if.end.3840
.if.false.3840:
br label %.if.end.3840
.if.end.3840:
%.tmp3842 = load %m996$.Node.type*, %m996$.Node.type** %start.3812
%s.3843 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp3842, %m996$.Node.type** %s.3843
br label %.for.start.3841
.for.start.3841:
%.tmp3844 = load %m996$.Node.type*, %m996$.Node.type** %s.3843
%.tmp3845 = icmp ne %m996$.Node.type* %.tmp3844, null
br i1 %.tmp3845, label %.for.continue.3841, label %.for.end.3841
.for.continue.3841:
%.tmp3846 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3847 = load %m996$.Node.type*, %m996$.Node.type** %s.3843
%.tmp3848 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3847, i32 0, i32 8
%.tmp3849 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3848
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i1) @m311$compile_statement.v.m2859$.CompilerCtx.typep.m996$.Node.typep.b(%m2859$.CompilerCtx.type* %.tmp3846, %m996$.Node.type* %.tmp3849, i1 0)
%.tmp3850 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
call void(%m2859$.CompilerCtx.type*) @m311$compile_anon_fn.v.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp3850)
%.tmp3851 = load %m996$.Node.type*, %m996$.Node.type** %s.3843
%.tmp3852 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3851, i32 0, i32 9
%.tmp3853 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3852
store %m996$.Node.type* %.tmp3853, %m996$.Node.type** %s.3843
br label %.for.start.3841
.for.end.3841:
%.tmp3854 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3855 = call %m2859$.ModuleLookup.type*(%m2859$.CompilerCtx.type*) @m311$get_current_module.m2859$.ModuleLookup.typep.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp3854)
%mod.3856 = alloca %m2859$.ModuleLookup.type*
store %m2859$.ModuleLookup.type* %.tmp3855, %m2859$.ModuleLookup.type** %mod.3856
%.tmp3857 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.3856
%.tmp3858 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp3857, i32 0, i32 1
%.tmp3859 = load i8*, i8** %.tmp3858
%.tmp3861 = getelementptr [1 x i8], [1 x i8]*@.str3860, i32 0, i32 0
%.tmp3862 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3859, i8* %.tmp3861)
%.tmp3863 = icmp eq i32 %.tmp3862, 0
br i1 %.tmp3863, label %.if.true.3864, label %.if.false.3864
.if.true.3864:
%.tmp3866 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3867 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3866, i32 0, i32 3
%.tmp3868 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %.tmp3867
%g.3869 = alloca %m2859$.GlobalName.type*
store %m2859$.GlobalName.type* %.tmp3868, %m2859$.GlobalName.type** %g.3869
br label %.for.start.3865
.for.start.3865:
%.tmp3870 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g.3869
%.tmp3871 = icmp ne %m2859$.GlobalName.type* %.tmp3870, null
br i1 %.tmp3871, label %.for.continue.3865, label %.for.end.3865
.for.continue.3865:
%.tmp3872 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3873 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g.3869
call void(%m2859$.CompilerCtx.type*,%m2859$.GlobalName.type*) @m311$compile_global.v.m2859$.CompilerCtx.typep.m2859$.GlobalName.typep(%m2859$.CompilerCtx.type* %.tmp3872, %m2859$.GlobalName.type* %.tmp3873)
%.tmp3874 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g.3869
%.tmp3875 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp3874, i32 0, i32 5
%.tmp3876 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %.tmp3875
store %m2859$.GlobalName.type* %.tmp3876, %m2859$.GlobalName.type** %g.3869
br label %.for.start.3865
.for.end.3865:
br label %.if.end.3864
.if.false.3864:
br label %.if.end.3864
.if.end.3864:
ret void
}
define void @m311$compile_global.v.m2859$.CompilerCtx.typep.m2859$.GlobalName.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%g = alloca %m2859$.GlobalName.type*
store %m2859$.GlobalName.type* %.g.arg, %m2859$.GlobalName.type** %g
%.tmp3877 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g
%.tmp3878 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp3877, i32 0, i32 2
%.tmp3879 = load i1, i1* %.tmp3878
br i1 %.tmp3879, label %.if.true.3880, label %.if.false.3880
.if.true.3880:
ret void
br label %.if.end.3880
.if.false.3880:
br label %.if.end.3880
.if.end.3880:
%.tmp3881 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g
%.tmp3882 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp3881, i32 0, i32 1
%.tmp3883 = load i8*, i8** %.tmp3882
%.tmp3885 = getelementptr [7 x i8], [7 x i8]*@.str3884, i32 0, i32 0
%.tmp3886 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3883, i8* %.tmp3885)
%.tmp3887 = icmp eq i32 %.tmp3886, 0
br i1 %.tmp3887, label %.if.true.3888, label %.if.false.3888
.if.true.3888:
%.tmp3889 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3890 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3889, i32 0, i32 1
%.tmp3891 = load %m0$.File.type*, %m0$.File.type** %.tmp3890
%.tmp3893 = getelementptr [21 x i8], [21 x i8]*@.str3892, i32 0, i32 0
%.tmp3894 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g
%.tmp3895 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp3894, i32 0, i32 4
%.tmp3896 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %.tmp3895
%.tmp3897 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp3896)
%.tmp3898 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3899 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g
%.tmp3900 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp3899, i32 0, i32 4
%.tmp3901 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %.tmp3900
%.tmp3902 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3901, i32 0, i32 4
%.tmp3903 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3902
%.tmp3904 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp3898, %m2859$.Type.type* %.tmp3903)
%.tmp3905 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g
%.tmp3906 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp3905, i32 0, i32 0
%.tmp3907 = load i8*, i8** %.tmp3906
%.tmp3908 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3891, i8* %.tmp3893, i8* %.tmp3897, i8* %.tmp3904, i8* %.tmp3907)
br label %.if.end.3888
.if.false.3888:
%.tmp3909 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g
%.tmp3910 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp3909, i32 0, i32 1
%.tmp3911 = load i8*, i8** %.tmp3910
%.tmp3913 = getelementptr [7 x i8], [7 x i8]*@.str3912, i32 0, i32 0
%.tmp3914 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3911, i8* %.tmp3913)
%.tmp3915 = icmp eq i32 %.tmp3914, 0
br i1 %.tmp3915, label %.if.true.3916, label %.if.false.3916
.if.true.3916:
%.tmp3917 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3918 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g
%.tmp3919 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp3918, i32 0, i32 4
%.tmp3920 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %.tmp3919
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$compile_extern.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp3917, %m2859$.AssignableInfo.type* %.tmp3920)
br label %.if.end.3916
.if.false.3916:
br label %.if.end.3916
.if.end.3916:
br label %.if.end.3888
.if.end.3888:
%.tmp3921 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g
%.tmp3922 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp3921, i32 0, i32 2
store i1 1, i1* %.tmp3922
ret void
}
define void @m311$compile_extern.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%info = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.info.arg, %m2859$.AssignableInfo.type** %info
%.tmp3923 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3924 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3923, i32 0, i32 1
%.tmp3925 = load %m0$.File.type*, %m0$.File.type** %.tmp3924
%.tmp3927 = getelementptr [15 x i8], [15 x i8]*@.str3926, i32 0, i32 0
%.tmp3928 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3929 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp3930 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3929, i32 0, i32 4
%.tmp3931 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3930
%.tmp3932 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3931, i32 0, i32 3
%.tmp3933 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3932
%.tmp3934 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp3928, %m2859$.Type.type* %.tmp3933)
%.tmp3935 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp3936 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp3935)
%.tmp3937 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3925, i8* %.tmp3927, i8* %.tmp3934, i8* %.tmp3936)
%.tmp3939 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp3940 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3939, i32 0, i32 4
%.tmp3941 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3940
%.tmp3942 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3941, i32 0, i32 3
%.tmp3943 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3942
%.tmp3944 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3943, i32 0, i32 4
%.tmp3945 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3944
%pt.3946 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp3945, %m2859$.Type.type** %pt.3946
br label %.for.start.3938
.for.start.3938:
%.tmp3947 = load %m2859$.Type.type*, %m2859$.Type.type** %pt.3946
%.tmp3948 = icmp ne %m2859$.Type.type* %.tmp3947, null
br i1 %.tmp3948, label %.for.continue.3938, label %.for.end.3938
.for.continue.3938:
%.tmp3949 = load %m2859$.Type.type*, %m2859$.Type.type** %pt.3946
%.tmp3950 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp3951 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp3950, i32 0, i32 4
%.tmp3952 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3951
%.tmp3953 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3952, i32 0, i32 3
%.tmp3954 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3953
%.tmp3955 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3954, i32 0, i32 4
%.tmp3956 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3955
%.tmp3957 = icmp ne %m2859$.Type.type* %.tmp3949, %.tmp3956
br i1 %.tmp3957, label %.if.true.3958, label %.if.false.3958
.if.true.3958:
%.tmp3959 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3960 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3959, i32 0, i32 1
%.tmp3961 = load %m0$.File.type*, %m0$.File.type** %.tmp3960
%.tmp3963 = getelementptr [3 x i8], [3 x i8]*@.str3962, i32 0, i32 0
%.tmp3964 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3961, i8* %.tmp3963)
br label %.if.end.3958
.if.false.3958:
br label %.if.end.3958
.if.end.3958:
%.tmp3965 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3966 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3965, i32 0, i32 1
%.tmp3967 = load %m0$.File.type*, %m0$.File.type** %.tmp3966
%.tmp3969 = getelementptr [3 x i8], [3 x i8]*@.str3968, i32 0, i32 0
%.tmp3970 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3971 = load %m2859$.Type.type*, %m2859$.Type.type** %pt.3946
%.tmp3972 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp3970, %m2859$.Type.type* %.tmp3971)
%.tmp3973 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3967, i8* %.tmp3969, i8* %.tmp3972)
%.tmp3974 = load %m2859$.Type.type*, %m2859$.Type.type** %pt.3946
%.tmp3975 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp3974, i32 0, i32 4
%.tmp3976 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp3975
store %m2859$.Type.type* %.tmp3976, %m2859$.Type.type** %pt.3946
br label %.for.start.3938
.for.end.3938:
%.tmp3977 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3978 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp3977, i32 0, i32 1
%.tmp3979 = load %m0$.File.type*, %m0$.File.type** %.tmp3978
%.tmp3981 = getelementptr [3 x i8], [3 x i8]*@.str3980, i32 0, i32 0
%.tmp3982 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3979, i8* %.tmp3981)
ret void
}
define i8* @m311$get_mod_prefix.cp.m2859$.CompilerCtx.typep.cp(%m2859$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp3983 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3984 = call %m2859$.ModuleLookup.type*(%m2859$.CompilerCtx.type*) @m311$get_current_module.m2859$.ModuleLookup.typep.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp3983)
%m.3985 = alloca %m2859$.ModuleLookup.type*
store %m2859$.ModuleLookup.type* %.tmp3984, %m2859$.ModuleLookup.type** %m.3985
%.tmp3986 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.3985
%.tmp3987 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp3986, i32 0, i32 1
%.tmp3988 = load i8*, i8** %.tmp3987
ret i8* %.tmp3988
}
define i8* @m311$name_mangle.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.fn.arg, i8* %.original_name.arg, %m2859$.Type.type* %.type.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%fn = alloca %m996$.Node.type*
store %m996$.Node.type* %.fn.arg, %m996$.Node.type** %fn
%original_name = alloca i8*
store i8* %.original_name.arg, i8** %original_name
%type = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.type.arg, %m2859$.Type.type** %type
%.tmp3990 = getelementptr [1 x i8], [1 x i8]*@.str3989, i32 0, i32 0
%mangled_name.3991 = alloca i8*
store i8* %.tmp3990, i8** %mangled_name.3991
%.tmp3992 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp3993 = load %m996$.Node.type*, %m996$.Node.type** %fn
%.tmp3994 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3993, i32 0, i32 2
%.tmp3995 = load i8*, i8** %.tmp3994
%.tmp3996 = call i8*(%m2859$.CompilerCtx.type*,i8*) @m311$get_mod_prefix.cp.m2859$.CompilerCtx.typep.cp(%m2859$.CompilerCtx.type* %.tmp3992, i8* %.tmp3995)
%prefix.3997 = alloca i8*
store i8* %.tmp3996, i8** %prefix.3997
%.tmp3998 = getelementptr i8*, i8** %mangled_name.3991, i32 0
%.tmp4000 = getelementptr [5 x i8], [5 x i8]*@.str3999, i32 0, i32 0
%.tmp4001 = load i8*, i8** %prefix.3997
%.tmp4002 = load i8*, i8** %original_name
%.tmp4003 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3998, i8* %.tmp4000, i8* %.tmp4001, i8* %.tmp4002)
%.tmp4004 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp4005 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4004, i32 0, i32 0
%.tmp4006 = load i8*, i8** %.tmp4005
%.tmp4008 = getelementptr [9 x i8], [9 x i8]*@.str4007, i32 0, i32 0
%.tmp4009 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4006, i8* %.tmp4008)
%.tmp4010 = icmp eq i32 %.tmp4009, 0
br i1 %.tmp4010, label %.if.true.4011, label %.if.false.4011
.if.true.4011:
%.tmp4012 = load i8*, i8** %mangled_name.3991
%.tmp4014 = getelementptr [5 x i8], [5 x i8]*@.str4013, i32 0, i32 0
%.tmp4015 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4012, i8* %.tmp4014)
%.tmp4016 = icmp ne i32 %.tmp4015, 0
br i1 %.tmp4016, label %.if.true.4017, label %.if.false.4017
.if.true.4017:
%.tmp4019 = getelementptr [1 x i8], [1 x i8]*@.str4018, i32 0, i32 0
%tmp_buff.4020 = alloca i8*
store i8* %.tmp4019, i8** %tmp_buff.4020
%.tmp4022 = getelementptr [1 x i8], [1 x i8]*@.str4021, i32 0, i32 0
%swap_var.4023 = alloca i8*
store i8* %.tmp4022, i8** %swap_var.4023
%.tmp4025 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp4026 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4025, i32 0, i32 3
%.tmp4027 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4026
%tp.4028 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp4027, %m2859$.Type.type** %tp.4028
br label %.for.start.4024
.for.start.4024:
%.tmp4029 = load %m2859$.Type.type*, %m2859$.Type.type** %tp.4028
%.tmp4030 = icmp ne %m2859$.Type.type* %.tmp4029, null
br i1 %.tmp4030, label %.for.continue.4024, label %.for.end.4024
.for.continue.4024:
%.tmp4031 = getelementptr i8*, i8** %tmp_buff.4020, i32 0
%.tmp4033 = getelementptr [6 x i8], [6 x i8]*@.str4032, i32 0, i32 0
%.tmp4034 = load i8*, i8** %mangled_name.3991
%.tmp4035 = load %m2859$.Type.type*, %m2859$.Type.type** %tp.4028
%.tmp4036 = call i8*(%m2859$.Type.type*) @m311$type_abbr.cp.m2859$.Type.typep(%m2859$.Type.type* %.tmp4035)
%.tmp4037 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4031, i8* %.tmp4033, i8* %.tmp4034, i8* %.tmp4036)
%.tmp4038 = load i8*, i8** %tmp_buff.4020
store i8* %.tmp4038, i8** %swap_var.4023
%.tmp4039 = load i8*, i8** %mangled_name.3991
store i8* %.tmp4039, i8** %tmp_buff.4020
%.tmp4040 = load i8*, i8** %swap_var.4023
store i8* %.tmp4040, i8** %mangled_name.3991
%.tmp4041 = load i8*, i8** %tmp_buff.4020
call void(i8*) @free(i8* %.tmp4041)
%.tmp4042 = load %m2859$.Type.type*, %m2859$.Type.type** %tp.4028
%.tmp4043 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4042, i32 0, i32 4
%.tmp4044 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4043
store %m2859$.Type.type* %.tmp4044, %m2859$.Type.type** %tp.4028
br label %.for.start.4024
.for.end.4024:
br label %.if.end.4017
.if.false.4017:
br label %.if.end.4017
.if.end.4017:
br label %.if.end.4011
.if.false.4011:
br label %.if.end.4011
.if.end.4011:
%.tmp4045 = load i8*, i8** %mangled_name.3991
ret i8* %.tmp4045
}
define void @m311$compile_statement.v.m2859$.CompilerCtx.typep.m996$.Node.typep.b(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info.4046 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* null, %m2859$.AssignableInfo.type** %info.4046
%return_type.4047 = alloca %m2859$.Type.type*
store %m2859$.Type.type* null, %m2859$.Type.type** %return_type.4047
%.tmp4049 = getelementptr [1 x i8], [1 x i8]*@.str4048, i32 0, i32 0
%err_buf.4050 = alloca i8*
store i8* %.tmp4049, i8** %err_buf.4050
%.tmp4052 = getelementptr [1 x i8], [1 x i8]*@.str4051, i32 0, i32 0
%tmp_buff.4053 = alloca i8*
store i8* %.tmp4052, i8** %tmp_buff.4053
%.tmp4054 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4055 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4054, i32 0, i32 0
%.tmp4056 = load i8*, i8** %.tmp4055
%.tmp4058 = getelementptr [3 x i8], [3 x i8]*@.str4057, i32 0, i32 0
%.tmp4059 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4056, i8* %.tmp4058)
%.tmp4060 = icmp eq i32 %.tmp4059, 0
br i1 %.tmp4060, label %.if.true.4061, label %.if.false.4061
.if.true.4061:
ret void
br label %.if.end.4061
.if.false.4061:
%.tmp4062 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4063 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4062, i32 0, i32 0
%.tmp4064 = load i8*, i8** %.tmp4063
%.tmp4066 = getelementptr [7 x i8], [7 x i8]*@.str4065, i32 0, i32 0
%.tmp4067 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4064, i8* %.tmp4066)
%.tmp4068 = icmp eq i32 %.tmp4067, 0
br i1 %.tmp4068, label %.if.true.4069, label %.if.false.4069
.if.true.4069:
%.tmp4070 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4071 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4070, i32 0, i32 8
%.tmp4072 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4071
%.tmp4074 = getelementptr [11 x i8], [11 x i8]*@.str4073, i32 0, i32 0
%.tmp4075 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp4072, i8* %.tmp4074)
%assignable.4076 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4075, %m996$.Node.type** %assignable.4076
%.tmp4077 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4078 = load %m996$.Node.type*, %m996$.Node.type** %assignable.4076
%.tmp4079 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp4077, %m996$.Node.type* %.tmp4078)
%a_info.4080 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp4079, %m2859$.AssignableInfo.type** %a_info.4080
%.tmp4081 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.4080
%.tmp4082 = icmp eq %m2859$.AssignableInfo.type* %.tmp4081, null
br i1 %.tmp4082, label %.if.true.4083, label %.if.false.4083
.if.true.4083:
ret void
br label %.if.end.4083
.if.false.4083:
br label %.if.end.4083
.if.end.4083:
%.tmp4084 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4085 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp4084)
store %m2859$.AssignableInfo.type* %.tmp4085, %m2859$.AssignableInfo.type** %info.4046
%.tmp4086 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4087 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4086, i32 0, i32 8
%.tmp4088 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4087
%.tmp4089 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4088, i32 0, i32 9
%.tmp4090 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4089
%.tmp4091 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4090, i32 0, i32 1
%.tmp4092 = load i8*, i8** %.tmp4091
%global_name.4093 = alloca i8*
store i8* %.tmp4092, i8** %global_name.4093
%.tmp4094 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4095 = load i8, i8* @SCOPE_GLOBAL
%.tmp4096 = load i8*, i8** %global_name.4093
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp4094, i8 %.tmp4095, i8* %.tmp4096)
%.tmp4097 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4098 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4097, i32 0, i32 4
%.tmp4099 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.4080
%.tmp4100 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4099, i32 0, i32 4
%.tmp4101 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4100
store %m2859$.Type.type* %.tmp4101, %m2859$.Type.type** %.tmp4098
%.tmp4102 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4103 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4102, i32 0, i32 3
%.tmp4105 = getelementptr [9 x i8], [9 x i8]*@.str4104, i32 0, i32 0
store i8* %.tmp4105, i8** %.tmp4103
%.tmp4106 = load i1, i1* %shallow
%.tmp4107 = icmp eq i1 %.tmp4106, 1
br i1 %.tmp4107, label %.if.true.4108, label %.if.false.4108
.if.true.4108:
%.tmp4109 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4110 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4111 = load i8*, i8** %global_name.4093
%.tmp4112 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2859$.AssignableInfo.type*) @m311$define_assignable.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp4109, %m996$.Node.type* %.tmp4110, i8* %.tmp4111, %m2859$.AssignableInfo.type* %.tmp4112)
br label %.if.end.4108
.if.false.4108:
%.tmp4113 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4114 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4113, i32 0, i32 1
%.tmp4115 = load %m0$.File.type*, %m0$.File.type** %.tmp4114
%.tmp4117 = getelementptr [21 x i8], [21 x i8]*@.str4116, i32 0, i32 0
%.tmp4118 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4119 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp4118)
%.tmp4120 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4121 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4122 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4121, i32 0, i32 4
%.tmp4123 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4122
%.tmp4124 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp4120, %m2859$.Type.type* %.tmp4123)
%.tmp4125 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.4080
%.tmp4126 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp4125)
%.tmp4127 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4115, i8* %.tmp4117, i8* %.tmp4119, i8* %.tmp4124, i8* %.tmp4126)
br label %.if.end.4108
.if.end.4108:
br label %.if.end.4069
.if.false.4069:
%.tmp4128 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4129 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4128, i32 0, i32 0
%.tmp4130 = load i8*, i8** %.tmp4129
%.tmp4132 = getelementptr [10 x i8], [10 x i8]*@.str4131, i32 0, i32 0
%.tmp4133 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4130, i8* %.tmp4132)
%.tmp4134 = icmp eq i32 %.tmp4133, 0
br i1 %.tmp4134, label %.if.true.4135, label %.if.false.4135
.if.true.4135:
%.tmp4136 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4137 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4136, i32 0, i32 8
%.tmp4138 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4137
%.tmp4139 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4138, i32 0, i32 9
%.tmp4140 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4139
%.tmp4141 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4140, i32 0, i32 1
%.tmp4142 = load i8*, i8** %.tmp4141
%type_name.4143 = alloca i8*
store i8* %.tmp4142, i8** %type_name.4143
%.tmp4144 = load i1, i1* %shallow
%.tmp4145 = icmp eq i1 %.tmp4144, 1
br i1 %.tmp4145, label %.if.true.4146, label %.if.false.4146
.if.true.4146:
%.tmp4147 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4148 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp4147)
store %m2859$.AssignableInfo.type* %.tmp4148, %m2859$.AssignableInfo.type** %info.4046
%.tmp4149 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4150 = call %m2859$.ModuleLookup.type*(%m2859$.CompilerCtx.type*) @m311$get_current_module.m2859$.ModuleLookup.typep.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp4149)
%mod_from.4151 = alloca %m2859$.ModuleLookup.type*
store %m2859$.ModuleLookup.type* %.tmp4150, %m2859$.ModuleLookup.type** %mod_from.4151
%.tmp4152 = getelementptr i8*, i8** %tmp_buff.4053, i32 0
%.tmp4154 = getelementptr [11 x i8], [11 x i8]*@.str4153, i32 0, i32 0
%.tmp4155 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod_from.4151
%.tmp4156 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp4155, i32 0, i32 1
%.tmp4157 = load i8*, i8** %.tmp4156
%.tmp4158 = load i8*, i8** %type_name.4143
%.tmp4159 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4152, i8* %.tmp4154, i8* %.tmp4157, i8* %.tmp4158)
%.tmp4160 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4161 = load i8, i8* @SCOPE_LOCAL
%.tmp4162 = load i8*, i8** %tmp_buff.4053
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp4160, i8 %.tmp4161, i8* %.tmp4162)
%.tmp4163 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4164 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4163, i32 0, i32 3
%.tmp4166 = getelementptr [10 x i8], [10 x i8]*@.str4165, i32 0, i32 0
store i8* %.tmp4166, i8** %.tmp4164
%.tmp4167 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4168 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4167, i32 0, i32 5
%.tmp4169 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4170 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4169, i32 0, i32 3
%.tmp4171 = load i32, i32* %.tmp4170
store i32 %.tmp4171, i32* %.tmp4168
%.tmp4172 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4173 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4172, i32 0, i32 6
%.tmp4174 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4175 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4174, i32 0, i32 4
%.tmp4176 = load i32, i32* %.tmp4175
store i32 %.tmp4176, i32* %.tmp4173
%.tmp4177 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4178 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4177, i32 0, i32 4
%.tmp4179 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp4179, %m2859$.Type.type** %.tmp4178
%.tmp4180 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4181 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4182 = load i8*, i8** %type_name.4143
%.tmp4183 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2859$.AssignableInfo.type*) @m311$define_assignable.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp4180, %m996$.Node.type* %.tmp4181, i8* %.tmp4182, %m2859$.AssignableInfo.type* %.tmp4183)
%.tmp4184 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4185 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4184, i32 0, i32 8
%.tmp4186 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4185
%.tmp4188 = getelementptr [5 x i8], [5 x i8]*@.str4187, i32 0, i32 0
%.tmp4189 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp4186, i8* %.tmp4188)
%type_decl.4190 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4189, %m996$.Node.type** %type_decl.4190
%.tmp4191 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4192 = load %m996$.Node.type*, %m996$.Node.type** %type_decl.4190
%.tmp4193 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4192, i32 0, i32 8
%.tmp4194 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4193
%.tmp4195 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp4191, %m996$.Node.type* %.tmp4194)
%type_struct.4196 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp4195, %m2859$.Type.type** %type_struct.4196
%.tmp4197 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4198 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4197, i32 0, i32 4
%.tmp4199 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4198
%.tmp4200 = load %m2859$.Type.type*, %m2859$.Type.type** %type_struct.4196
call void(%m2859$.Type.type*,%m2859$.Type.type*) @m311$copy_type.v.m2859$.Type.typep.m2859$.Type.typep(%m2859$.Type.type* %.tmp4199, %m2859$.Type.type* %.tmp4200)
%.tmp4201 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4202 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4201, i32 0, i32 4
%.tmp4203 = load %m2859$.Type.type*, %m2859$.Type.type** %type_struct.4196
store %m2859$.Type.type* %.tmp4203, %m2859$.Type.type** %.tmp4202
br label %.if.end.4146
.if.false.4146:
%.tmp4204 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4205 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4206 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4205, i32 0, i32 7
%.tmp4207 = load i8*, i8** %.tmp4206
%.tmp4208 = load i8*, i8** %type_name.4143
%.tmp4209 = call %m2859$.ScopeItem.type*(%m2859$.CompilerCtx.type*,i8*,i8*) @m311$find_defined_str.m2859$.ScopeItem.typep.m2859$.CompilerCtx.typep.cp.cp(%m2859$.CompilerCtx.type* %.tmp4204, i8* %.tmp4207, i8* %.tmp4208)
%scope.4210 = alloca %m2859$.ScopeItem.type*
store %m2859$.ScopeItem.type* %.tmp4209, %m2859$.ScopeItem.type** %scope.4210
%.tmp4211 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %scope.4210
%.tmp4212 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp4211, i32 0, i32 1
%.tmp4213 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %.tmp4212
store %m2859$.AssignableInfo.type* %.tmp4213, %m2859$.AssignableInfo.type** %info.4046
%.tmp4214 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4215 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4214, i32 0, i32 1
%.tmp4216 = load %m0$.File.type*, %m0$.File.type** %.tmp4215
%.tmp4218 = getelementptr [14 x i8], [14 x i8]*@.str4217, i32 0, i32 0
%.tmp4219 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4220 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp4219)
%.tmp4221 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4222 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4223 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4222, i32 0, i32 4
%.tmp4224 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4223
%.tmp4225 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp4221, %m2859$.Type.type* %.tmp4224)
%.tmp4226 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4216, i8* %.tmp4218, i8* %.tmp4220, i8* %.tmp4225)
br label %.if.end.4146
.if.end.4146:
br label %.if.end.4135
.if.false.4135:
%.tmp4227 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4228 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4227, i32 0, i32 0
%.tmp4229 = load i8*, i8** %.tmp4228
%.tmp4231 = getelementptr [7 x i8], [7 x i8]*@.str4230, i32 0, i32 0
%.tmp4232 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4229, i8* %.tmp4231)
%.tmp4233 = icmp eq i32 %.tmp4232, 0
br i1 %.tmp4233, label %.if.true.4234, label %.if.false.4234
.if.true.4234:
%.tmp4235 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4236 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp4235)
store %m2859$.AssignableInfo.type* %.tmp4236, %m2859$.AssignableInfo.type** %info.4046
%.tmp4237 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4238 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4237, i32 0, i32 4
%.tmp4239 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4240 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4241 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4240, i32 0, i32 8
%.tmp4242 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4241
%.tmp4243 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4242, i32 0, i32 9
%.tmp4244 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4243
%.tmp4245 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$syn_function_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp4239, %m996$.Node.type* %.tmp4244)
store %m2859$.Type.type* %.tmp4245, %m2859$.Type.type** %.tmp4238
%.tmp4246 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4247 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4246, i32 0, i32 3
%.tmp4249 = getelementptr [7 x i8], [7 x i8]*@.str4248, i32 0, i32 0
store i8* %.tmp4249, i8** %.tmp4247
%.tmp4250 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4251 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4250, i32 0, i32 8
%.tmp4252 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4251
%.tmp4253 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4252, i32 0, i32 9
%.tmp4254 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4253
%.tmp4255 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4254, i32 0, i32 9
%.tmp4256 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4255
%.tmp4257 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4256, i32 0, i32 1
%.tmp4258 = load i8*, i8** %.tmp4257
%fn_name.4259 = alloca i8*
store i8* %.tmp4258, i8** %fn_name.4259
%.tmp4260 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4261 = load i8, i8* @SCOPE_GLOBAL
%.tmp4262 = load i8*, i8** %fn_name.4259
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp4260, i8 %.tmp4261, i8* %.tmp4262)
%.tmp4263 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp4263, %m2859$.Type.type** %return_type.4047
%.tmp4264 = load %m2859$.Type.type*, %m2859$.Type.type** %return_type.4047
%.tmp4265 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4264, i32 0, i32 0
%.tmp4266 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4267 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4266, i32 0, i32 4
%.tmp4268 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4267
%.tmp4269 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4268, i32 0, i32 3
%.tmp4270 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4269
%.tmp4271 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4270, i32 0, i32 0
%.tmp4272 = load i8*, i8** %.tmp4271
store i8* %.tmp4272, i8** %.tmp4265
%.tmp4273 = load %m2859$.Type.type*, %m2859$.Type.type** %return_type.4047
%.tmp4274 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4273, i32 0, i32 3
%.tmp4275 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4276 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4275, i32 0, i32 4
%.tmp4277 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4276
%.tmp4278 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4277, i32 0, i32 3
%.tmp4279 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4278
%.tmp4280 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4279, i32 0, i32 3
%.tmp4281 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4280
store %m2859$.Type.type* %.tmp4281, %m2859$.Type.type** %.tmp4274
%.tmp4282 = load i1, i1* %shallow
%.tmp4283 = icmp eq i1 %.tmp4282, 0
br i1 %.tmp4283, label %.if.true.4284, label %.if.false.4284
.if.true.4284:
%.tmp4285 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4286 = load i8*, i8** %fn_name.4259
call void(%m2859$.CompilerCtx.type*,i8*) @m311$mark_weak_global.v.m2859$.CompilerCtx.typep.cp(%m2859$.CompilerCtx.type* %.tmp4285, i8* %.tmp4286)
%.tmp4287 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4288 = load i8*, i8** %fn_name.4259
%.tmp4290 = getelementptr [7 x i8], [7 x i8]*@.str4289, i32 0, i32 0
%.tmp4291 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
call void(%m2859$.CompilerCtx.type*,i8*,i8*,%m2859$.AssignableInfo.type*,i1,i1) @m311$define_global.v.m2859$.CompilerCtx.typep.cp.cp.m2859$.AssignableInfo.typep.b.b(%m2859$.CompilerCtx.type* %.tmp4287, i8* %.tmp4288, i8* %.tmp4290, %m2859$.AssignableInfo.type* %.tmp4291, i1 1, i1 1)
%.tmp4292 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4293 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$compile_extern.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp4292, %m2859$.AssignableInfo.type* %.tmp4293)
br label %.if.end.4284
.if.false.4284:
%.tmp4294 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4295 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4296 = load i8*, i8** %fn_name.4259
%.tmp4297 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2859$.AssignableInfo.type*) @m311$define_assignable.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp4294, %m996$.Node.type* %.tmp4295, i8* %.tmp4296, %m2859$.AssignableInfo.type* %.tmp4297)
br label %.if.end.4284
.if.end.4284:
br label %.if.end.4234
.if.false.4234:
%.tmp4298 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4299 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4298, i32 0, i32 0
%.tmp4300 = load i8*, i8** %.tmp4299
%.tmp4302 = getelementptr [9 x i8], [9 x i8]*@.str4301, i32 0, i32 0
%.tmp4303 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4300, i8* %.tmp4302)
%.tmp4304 = icmp eq i32 %.tmp4303, 0
br i1 %.tmp4304, label %.if.true.4305, label %.if.false.4305
.if.true.4305:
%.tmp4306 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4307 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp4306)
store %m2859$.AssignableInfo.type* %.tmp4307, %m2859$.AssignableInfo.type** %info.4046
%.tmp4308 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4309 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4308, i32 0, i32 3
%.tmp4311 = getelementptr [9 x i8], [9 x i8]*@.str4310, i32 0, i32 0
store i8* %.tmp4311, i8** %.tmp4309
%.tmp4312 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4313 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4312, i32 0, i32 4
%.tmp4314 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4315 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4316 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4315, i32 0, i32 8
%.tmp4317 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4316
%.tmp4318 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$syn_function_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp4314, %m996$.Node.type* %.tmp4317)
store %m2859$.Type.type* %.tmp4318, %m2859$.Type.type** %.tmp4313
%.tmp4319 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4320 = call i8*(%m996$.Node.type*) @m311$syn_function_name.cp.m996$.Node.typep(%m996$.Node.type* %.tmp4319)
%name.4321 = alloca i8*
store i8* %.tmp4320, i8** %name.4321
%.tmp4322 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4323 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4324 = load i8*, i8** %name.4321
%.tmp4325 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4326 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4325, i32 0, i32 4
%.tmp4327 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4326
%.tmp4328 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2859$.Type.type*) @m311$name_mangle.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp4322, %m996$.Node.type* %.tmp4323, i8* %.tmp4324, %m2859$.Type.type* %.tmp4327)
store i8* %.tmp4328, i8** %tmp_buff.4053
%.tmp4329 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4330 = load i8, i8* @SCOPE_GLOBAL
%.tmp4331 = load i8*, i8** %tmp_buff.4053
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp4329, i8 %.tmp4330, i8* %.tmp4331)
%.tmp4332 = load i1, i1* %shallow
%.tmp4333 = icmp eq i1 %.tmp4332, 1
br i1 %.tmp4333, label %.if.true.4334, label %.if.false.4334
.if.true.4334:
%.tmp4335 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4336 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4337 = load i8*, i8** %name.4321
%.tmp4338 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2859$.AssignableInfo.type*) @m311$define_assignable.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp4335, %m996$.Node.type* %.tmp4336, i8* %.tmp4337, %m2859$.AssignableInfo.type* %.tmp4338)
br label %.if.end.4334
.if.false.4334:
%.tmp4339 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp4339, %m2859$.Type.type** %return_type.4047
%.tmp4340 = load %m2859$.Type.type*, %m2859$.Type.type** %return_type.4047
%.tmp4341 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4342 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4341, i32 0, i32 4
%.tmp4343 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4342
%.tmp4344 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4343, i32 0, i32 3
%.tmp4345 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4344
call void(%m2859$.Type.type*,%m2859$.Type.type*) @m311$copy_type.v.m2859$.Type.typep.m2859$.Type.typep(%m2859$.Type.type* %.tmp4340, %m2859$.Type.type* %.tmp4345)
%.tmp4346 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4347 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4346, i32 0, i32 1
%.tmp4348 = load %m0$.File.type*, %m0$.File.type** %.tmp4347
%.tmp4350 = getelementptr [14 x i8], [14 x i8]*@.str4349, i32 0, i32 0
%.tmp4351 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4352 = load %m2859$.Type.type*, %m2859$.Type.type** %return_type.4047
%.tmp4353 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp4351, %m2859$.Type.type* %.tmp4352)
%.tmp4354 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4046
%.tmp4355 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp4354)
%.tmp4356 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4348, i8* %.tmp4350, i8* %.tmp4353, i8* %.tmp4355)
%.tmp4357 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4358 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4357, i32 0, i32 8
%.tmp4359 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4358
%.tmp4360 = call %m996$.Node.type*(%m996$.Node.type*) @m311$syn_function_params.m996$.Node.typep.m996$.Node.typep(%m996$.Node.type* %.tmp4359)
%params.4361 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4360, %m996$.Node.type** %params.4361
%param_type.4362 = alloca %m2859$.Type.type*
store %m2859$.Type.type* null, %m2859$.Type.type** %param_type.4362
%.tmp4364 = load %m996$.Node.type*, %m996$.Node.type** %params.4361
%param_ptr.4365 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4364, %m996$.Node.type** %param_ptr.4365
br label %.for.start.4363
.for.start.4363:
%.tmp4366 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4365
%.tmp4367 = icmp ne %m996$.Node.type* %.tmp4366, null
br i1 %.tmp4367, label %.for.continue.4363, label %.for.end.4363
.for.continue.4363:
%.tmp4368 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4365
%.tmp4369 = load %m996$.Node.type*, %m996$.Node.type** %params.4361
%.tmp4370 = icmp ne %m996$.Node.type* %.tmp4368, %.tmp4369
br i1 %.tmp4370, label %.if.true.4371, label %.if.false.4371
.if.true.4371:
%.tmp4372 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4365
%.tmp4373 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4372, i32 0, i32 9
%.tmp4374 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4373
store %m996$.Node.type* %.tmp4374, %m996$.Node.type** %param_ptr.4365
%.tmp4375 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4376 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4375, i32 0, i32 1
%.tmp4377 = load %m0$.File.type*, %m0$.File.type** %.tmp4376
%.tmp4379 = getelementptr [3 x i8], [3 x i8]*@.str4378, i32 0, i32 0
%.tmp4380 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4377, i8* %.tmp4379)
br label %.if.end.4371
.if.false.4371:
br label %.if.end.4371
.if.end.4371:
%.tmp4381 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4365
%.tmp4382 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4381, i32 0, i32 0
%.tmp4383 = load i8*, i8** %.tmp4382
%.tmp4385 = getelementptr [5 x i8], [5 x i8]*@.str4384, i32 0, i32 0
%.tmp4386 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4383, i8* %.tmp4385)
%.tmp4387 = icmp eq i32 %.tmp4386, 0
br i1 %.tmp4387, label %.if.true.4388, label %.if.false.4388
.if.true.4388:
%.tmp4389 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4390 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4365
%.tmp4391 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4390, i32 0, i32 8
%.tmp4392 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4391
%.tmp4393 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp4389, %m996$.Node.type* %.tmp4392)
store %m2859$.Type.type* %.tmp4393, %m2859$.Type.type** %param_type.4362
%.tmp4394 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4365
%.tmp4395 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4394, i32 0, i32 9
%.tmp4396 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4395
store %m996$.Node.type* %.tmp4396, %m996$.Node.type** %param_ptr.4365
br label %.if.end.4388
.if.false.4388:
br label %.if.end.4388
.if.end.4388:
%.tmp4397 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4398 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4397, i32 0, i32 1
%.tmp4399 = load %m0$.File.type*, %m0$.File.type** %.tmp4398
%.tmp4401 = getelementptr [13 x i8], [13 x i8]*@.str4400, i32 0, i32 0
%.tmp4402 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4403 = load %m2859$.Type.type*, %m2859$.Type.type** %param_type.4362
%.tmp4404 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp4402, %m2859$.Type.type* %.tmp4403)
%.tmp4405 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4365
%.tmp4406 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4405, i32 0, i32 1
%.tmp4407 = load i8*, i8** %.tmp4406
%.tmp4408 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4399, i8* %.tmp4401, i8* %.tmp4404, i8* %.tmp4407)
%.tmp4409 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4365
%.tmp4410 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4409, i32 0, i32 9
%.tmp4411 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4410
store %m996$.Node.type* %.tmp4411, %m996$.Node.type** %param_ptr.4365
br label %.for.start.4363
.for.end.4363:
%.tmp4412 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4413 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4412, i32 0, i32 1
%.tmp4414 = load %m0$.File.type*, %m0$.File.type** %.tmp4413
%.tmp4416 = getelementptr [5 x i8], [5 x i8]*@.str4415, i32 0, i32 0
%.tmp4417 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4414, i8* %.tmp4416)
%.tmp4418 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4420 = getelementptr [9 x i8], [9 x i8]*@.str4419, i32 0, i32 0
%.tmp4421 = bitcast ptr null to i8*
%.tmp4422 = bitcast ptr null to i8*
%.tmp4423 = load %m2859$.Type.type*, %m2859$.Type.type** %return_type.4047
call void(%m2859$.CompilerCtx.type*,i8*,i8*,i8*,%m2859$.Type.type*) @m311$push_scope.v.m2859$.CompilerCtx.typep.cp.cp.cp.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp4418, i8* %.tmp4420, i8* %.tmp4421, i8* %.tmp4422, %m2859$.Type.type* %.tmp4423)
%.tmp4424 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4425 = load %m996$.Node.type*, %m996$.Node.type** %params.4361
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_fn_params.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp4424, %m996$.Node.type* %.tmp4425)
%.tmp4426 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4427 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4426, i32 0, i32 8
%.tmp4428 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4427
%.tmp4430 = getelementptr [6 x i8], [6 x i8]*@.str4429, i32 0, i32 0
%.tmp4431 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp4428, i8* %.tmp4430)
%fn_block.4432 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4431, %m996$.Node.type** %fn_block.4432
%.tmp4433 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4434 = load %m996$.Node.type*, %m996$.Node.type** %fn_block.4432
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_block.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp4433, %m996$.Node.type* %.tmp4434)
%.tmp4435 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
call void(%m2859$.CompilerCtx.type*) @m311$pop_scope.v.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp4435)
%.tmp4436 = bitcast ptr null to %m996$.Node.type*
%last_valid_instruction.4437 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4436, %m996$.Node.type** %last_valid_instruction.4437
%.tmp4438 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4439 = load %m996$.Node.type*, %m996$.Node.type** %fn_block.4432
%.tmp4440 = load %m2859$.Type.type*, %m2859$.Type.type** %return_type.4047
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,%m2859$.Type.type*) @m311$check_n_add_implicit_return.v.m2859$.CompilerCtx.typep.m996$.Node.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp4438, %m996$.Node.type* %.tmp4439, %m2859$.Type.type* %.tmp4440)
%.tmp4441 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4442 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4441, i32 0, i32 1
%.tmp4443 = load %m0$.File.type*, %m0$.File.type** %.tmp4442
%.tmp4445 = getelementptr [3 x i8], [3 x i8]*@.str4444, i32 0, i32 0
%.tmp4446 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4443, i8* %.tmp4445)
br label %.if.end.4334
.if.end.4334:
br label %.if.end.4305
.if.false.4305:
%.tmp4447 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4448 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4447, i32 0, i32 0
%.tmp4449 = load i8*, i8** %.tmp4448
%.tmp4451 = getelementptr [7 x i8], [7 x i8]*@.str4450, i32 0, i32 0
%.tmp4452 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4449, i8* %.tmp4451)
%.tmp4453 = icmp eq i32 %.tmp4452, 0
br i1 %.tmp4453, label %.if.true.4454, label %.if.false.4454
.if.true.4454:
%.tmp4455 = load i1, i1* %shallow
%.tmp4456 = icmp eq i1 %.tmp4455, 1
br i1 %.tmp4456, label %.if.true.4457, label %.if.false.4457
.if.true.4457:
%.tmp4458 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4459 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4458, i32 0, i32 8
%.tmp4460 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4459
%.tmp4461 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4460, i32 0, i32 9
%.tmp4462 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4461
%.tmp4463 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4462, i32 0, i32 1
%.tmp4464 = load i8*, i8** %.tmp4463
%mod_name.4465 = alloca i8*
store i8* %.tmp4464, i8** %mod_name.4465
%.tmp4466 = load i8*, i8** %mod_name.4465
%.tmp4467 = call i32(i8*) @strlen(i8* %.tmp4466)
%mod_name_len.4468 = alloca i32
store i32 %.tmp4467, i32* %mod_name_len.4468
%.tmp4469 = load i32, i32* %mod_name_len.4468
%.tmp4470 = sub i32 %.tmp4469, 1
%.tmp4471 = call i8*(i32) @malloc(i32 %.tmp4470)
%trimmed_path.4472 = alloca i8*
store i8* %.tmp4471, i8** %trimmed_path.4472
%i.4474 = alloca i32
store i32 1, i32* %i.4474
br label %.for.start.4473
.for.start.4473:
%.tmp4475 = load i32, i32* %i.4474
%.tmp4476 = load i32, i32* %mod_name_len.4468
%.tmp4477 = sub i32 %.tmp4476, 1
%.tmp4478 = icmp slt i32 %.tmp4475, %.tmp4477
br i1 %.tmp4478, label %.for.continue.4473, label %.for.end.4473
.for.continue.4473:
%.tmp4479 = load i32, i32* %i.4474
%.tmp4480 = sub i32 %.tmp4479, 1
%.tmp4481 = load i8*, i8** %trimmed_path.4472
%.tmp4482 = getelementptr i8, i8* %.tmp4481, i32 %.tmp4480
%.tmp4483 = load i32, i32* %i.4474
%.tmp4484 = load i8*, i8** %mod_name.4465
%.tmp4485 = getelementptr i8, i8* %.tmp4484, i32 %.tmp4483
%.tmp4486 = load i8, i8* %.tmp4485
store i8 %.tmp4486, i8* %.tmp4482
%.tmp4487 = load i32, i32* %i.4474
%.tmp4488 = add i32 %.tmp4487, 1
store i32 %.tmp4488, i32* %i.4474
br label %.for.start.4473
.for.end.4473:
%.tmp4489 = load i32, i32* %mod_name_len.4468
%.tmp4490 = sub i32 %.tmp4489, 2
%.tmp4491 = load i8*, i8** %trimmed_path.4472
%.tmp4492 = getelementptr i8, i8* %.tmp4491, i32 %.tmp4490
store i8 0, i8* %.tmp4492
%.tmp4493 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4494 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4495 = load i8*, i8** %trimmed_path.4472
%.tmp4496 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$resolve_import_path.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp4493, %m996$.Node.type* %.tmp4494, i8* %.tmp4495)
%mod_abspath.4497 = alloca i8*
store i8* %.tmp4496, i8** %mod_abspath.4497
%.tmp4498 = load i8*, i8** %mod_abspath.4497
%.tmp4499 = call i8*(i32) @malloc(i32 4096)
%.tmp4500 = call i8*(i8*,i8*) @realpath(i8* %.tmp4498, i8* %.tmp4499)
%relpath.4501 = alloca i8*
store i8* %.tmp4500, i8** %relpath.4501
%.tmp4502 = load i8*, i8** %relpath.4501
%.tmp4503 = icmp eq i8* %.tmp4502, null
br i1 %.tmp4503, label %.if.true.4504, label %.if.false.4504
.if.true.4504:
%.tmp4505 = getelementptr i8*, i8** %err_buf.4050, i32 0
%.tmp4507 = getelementptr [54 x i8], [54 x i8]*@.str4506, i32 0, i32 0
%.tmp4508 = load i8*, i8** %mod_name.4465
%.tmp4509 = load i8*, i8** %mod_abspath.4497
%.tmp4510 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4505, i8* %.tmp4507, i8* %.tmp4508, i8* %.tmp4509)
%.tmp4511 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4512 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4513 = load i8*, i8** %err_buf.4050
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp4511, %m996$.Node.type* %.tmp4512, i8* %.tmp4513)
ret void
br label %.if.end.4504
.if.false.4504:
br label %.if.end.4504
.if.end.4504:
%.tmp4514 = load i8*, i8** %relpath.4501
store i8* %.tmp4514, i8** %mod_abspath.4497
%m.4515 = alloca %m2859$.ModuleLookup.type*
store %m2859$.ModuleLookup.type* null, %m2859$.ModuleLookup.type** %m.4515
%.tmp4516 = bitcast ptr null to %m2859$.ModuleLookup.type*
%mod.4517 = alloca %m2859$.ModuleLookup.type*
store %m2859$.ModuleLookup.type* %.tmp4516, %m2859$.ModuleLookup.type** %mod.4517
%.tmp4519 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4520 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4519, i32 0, i32 6
%.tmp4521 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %.tmp4520
store %m2859$.ModuleLookup.type* %.tmp4521, %m2859$.ModuleLookup.type** %m.4515
br label %.for.start.4518
.for.start.4518:
%.tmp4522 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.4515
%.tmp4523 = icmp ne %m2859$.ModuleLookup.type* %.tmp4522, null
%.tmp4524 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.4517
%.tmp4525 = icmp eq %m2859$.ModuleLookup.type* %.tmp4524, null
%.tmp4526 = and i1 %.tmp4523, %.tmp4525
br i1 %.tmp4526, label %.for.continue.4518, label %.for.end.4518
.for.continue.4518:
%.tmp4527 = load i8*, i8** %mod_abspath.4497
%.tmp4528 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.4515
%.tmp4529 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp4528, i32 0, i32 0
%.tmp4530 = load i8*, i8** %.tmp4529
%.tmp4531 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4527, i8* %.tmp4530)
%.tmp4532 = icmp eq i32 %.tmp4531, 0
br i1 %.tmp4532, label %.if.true.4533, label %.if.false.4533
.if.true.4533:
%.tmp4534 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.4515
store %m2859$.ModuleLookup.type* %.tmp4534, %m2859$.ModuleLookup.type** %mod.4517
br label %.if.end.4533
.if.false.4533:
br label %.if.end.4533
.if.end.4533:
%.tmp4535 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.4515
%.tmp4536 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp4535, i32 0, i32 2
%.tmp4537 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %.tmp4536
store %m2859$.ModuleLookup.type* %.tmp4537, %m2859$.ModuleLookup.type** %m.4515
br label %.for.start.4518
.for.end.4518:
%.tmp4538 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4539 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4538, i32 0, i32 8
%.tmp4540 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4539
%.tmp4541 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4540, i32 0, i32 9
%.tmp4542 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4541
%.tmp4543 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4542, i32 0, i32 9
%.tmp4544 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4543
%.tmp4545 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4544, i32 0, i32 9
%.tmp4546 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4545
%.tmp4547 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4546, i32 0, i32 1
%.tmp4548 = load i8*, i8** %.tmp4547
%asname.4549 = alloca i8*
store i8* %.tmp4548, i8** %asname.4549
%.tmp4550 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.4517
%.tmp4551 = icmp eq %m2859$.ModuleLookup.type* %.tmp4550, null
br i1 %.tmp4551, label %.if.true.4552, label %.if.false.4552
.if.true.4552:
%.tmp4553 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* null, i32 1
%.tmp4554 = ptrtoint %m2859$.ModuleLookup.type* %.tmp4553 to i32
%.tmp4555 = call i8*(i32) @malloc(i32 %.tmp4554)
%.tmp4556 = bitcast i8* %.tmp4555 to %m2859$.ModuleLookup.type*
store %m2859$.ModuleLookup.type* %.tmp4556, %m2859$.ModuleLookup.type** %mod.4517
%.tmp4557 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.4517
%.tmp4558 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp4557, i32 0, i32 0
%.tmp4559 = load i8*, i8** %mod_abspath.4497
store i8* %.tmp4559, i8** %.tmp4558
%.tmp4560 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.4517
%.tmp4561 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp4560, i32 0, i32 2
store %m2859$.ModuleLookup.type* null, %m2859$.ModuleLookup.type** %.tmp4561
%.tmp4562 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.4517
%.tmp4563 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp4562, i32 0, i32 3
store %m2859$.Scope.type* null, %m2859$.Scope.type** %.tmp4563
%.tmp4564 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.4517
%.tmp4565 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp4564, i32 0, i32 1
%.tmp4566 = getelementptr i8*, i8** %.tmp4565, i32 0
%.tmp4568 = getelementptr [5 x i8], [5 x i8]*@.str4567, i32 0, i32 0
%.tmp4569 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4570 = call i32(%m2859$.CompilerCtx.type*) @m311$new_uid.i.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp4569)
%.tmp4571 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4566, i8* %.tmp4568, i32 %.tmp4570)
%.tmp4573 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4574 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4573, i32 0, i32 6
%.tmp4575 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %.tmp4574
store %m2859$.ModuleLookup.type* %.tmp4575, %m2859$.ModuleLookup.type** %m.4515
br label %.for.start.4572
.for.start.4572:
%.tmp4576 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.4515
%.tmp4577 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp4576, i32 0, i32 2
%.tmp4578 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %.tmp4577
%.tmp4579 = icmp ne %m2859$.ModuleLookup.type* %.tmp4578, null
br i1 %.tmp4579, label %.for.continue.4572, label %.for.end.4572
.for.continue.4572:
%.tmp4580 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.4515
%.tmp4581 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp4580, i32 0, i32 2
%.tmp4582 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %.tmp4581
store %m2859$.ModuleLookup.type* %.tmp4582, %m2859$.ModuleLookup.type** %m.4515
br label %.for.start.4572
.for.end.4572:
%.tmp4583 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %m.4515
%.tmp4584 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp4583, i32 0, i32 2
%.tmp4585 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.4517
store %m2859$.ModuleLookup.type* %.tmp4585, %m2859$.ModuleLookup.type** %.tmp4584
%.tmp4586 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4587 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4588 = load i8*, i8** %asname.4549
%.tmp4589 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.4517
%.tmp4590 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp4589, i32 0, i32 0
%.tmp4591 = load i8*, i8** %.tmp4590
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*,i8*) @m311$define_module.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp.cp(%m2859$.CompilerCtx.type* %.tmp4586, %m996$.Node.type* %.tmp4587, i8* %.tmp4588, i8* %.tmp4591)
%.tmp4592 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4593 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4592, i32 0, i32 7
%.tmp4594 = load i8*, i8** %.tmp4593
%curr_mod.4595 = alloca i8*
store i8* %.tmp4594, i8** %curr_mod.4595
%.tmp4596 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4597 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4596, i32 0, i32 7
%.tmp4598 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.4517
%.tmp4599 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp4598, i32 0, i32 0
%.tmp4600 = load i8*, i8** %.tmp4599
store i8* %.tmp4600, i8** %.tmp4597
%.tmp4601 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4602 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4603 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.4517
%.tmp4604 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp4603, i32 0, i32 0
%.tmp4605 = load i8*, i8** %.tmp4604
%.tmp4606 = call i1(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$compile_file.b.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp4601, %m996$.Node.type* %.tmp4602, i8* %.tmp4605)
%.tmp4607 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4608 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4607, i32 0, i32 7
%.tmp4609 = load i8*, i8** %curr_mod.4595
store i8* %.tmp4609, i8** %.tmp4608
br label %.if.end.4552
.if.false.4552:
%.tmp4610 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4611 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4612 = load i8*, i8** %asname.4549
%.tmp4613 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.4517
%.tmp4614 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp4613, i32 0, i32 0
%.tmp4615 = load i8*, i8** %.tmp4614
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*,i8*) @m311$define_module.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp.cp(%m2859$.CompilerCtx.type* %.tmp4610, %m996$.Node.type* %.tmp4611, i8* %.tmp4612, i8* %.tmp4615)
br label %.if.end.4552
.if.end.4552:
br label %.if.end.4457
.if.false.4457:
br label %.if.end.4457
.if.end.4457:
br label %.if.end.4454
.if.false.4454:
%.tmp4616 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4617 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4619 = getelementptr [40 x i8], [40 x i8]*@.str4618, i32 0, i32 0
%.tmp4620 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp4616, %m996$.Node.type* %.tmp4617, i8* %.tmp4619)
%.tmp4621 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4622 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4621, i32 0, i32 0
%.tmp4623 = load i8*, i8** %.tmp4622
%.tmp4624 = call i32(i8*,...) @printf(i8* %.tmp4620, i8* %.tmp4623)
br label %.if.end.4454
.if.end.4454:
br label %.if.end.4305
.if.end.4305:
br label %.if.end.4234
.if.end.4234:
br label %.if.end.4135
.if.end.4135:
br label %.if.end.4069
.if.end.4069:
br label %.if.end.4061
.if.end.4061:
ret void
}
define i8* @m311$err_tmpl.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp4626 = getelementptr [1 x i8], [1 x i8]*@.str4625, i32 0, i32 0
%buf.4627 = alloca i8*
store i8* %.tmp4626, i8** %buf.4627
%.tmp4628 = getelementptr i8*, i8** %buf.4627, i32 0
%.tmp4630 = getelementptr [31 x i8], [31 x i8]*@.str4629, i32 0, i32 0
%.tmp4631 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4632 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4631, i32 0, i32 7
%.tmp4633 = load i8*, i8** %.tmp4632
%.tmp4634 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4635 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4634, i32 0, i32 3
%.tmp4636 = load i32, i32* %.tmp4635
%.tmp4637 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4638 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4637, i32 0, i32 4
%.tmp4639 = load i32, i32* %.tmp4638
%.tmp4640 = load i8*, i8** %msg
%.tmp4641 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4628, i8* %.tmp4630, i8* %.tmp4633, i32 %.tmp4636, i32 %.tmp4639, i8* %.tmp4640)
%.tmp4642 = load i8*, i8** %buf.4627
ret i8* %.tmp4642
}
define void @m311$compile_fn_params.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.fn_params.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%fn_params = alloca %m996$.Node.type*
store %m996$.Node.type* %.fn_params.arg, %m996$.Node.type** %fn_params
%param_type.4643 = alloca %m2859$.Type.type*
store %m2859$.Type.type* null, %m2859$.Type.type** %param_type.4643
%.tmp4645 = load %m996$.Node.type*, %m996$.Node.type** %fn_params
%param_ptr.4646 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4645, %m996$.Node.type** %param_ptr.4646
br label %.for.start.4644
.for.start.4644:
%.tmp4647 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4646
%.tmp4648 = icmp ne %m996$.Node.type* %.tmp4647, null
br i1 %.tmp4648, label %.for.continue.4644, label %.for.end.4644
.for.continue.4644:
%.tmp4649 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4646
%.tmp4650 = load %m996$.Node.type*, %m996$.Node.type** %fn_params
%.tmp4651 = icmp ne %m996$.Node.type* %.tmp4649, %.tmp4650
br i1 %.tmp4651, label %.if.true.4652, label %.if.false.4652
.if.true.4652:
%.tmp4653 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4646
%.tmp4654 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4653, i32 0, i32 9
%.tmp4655 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4654
store %m996$.Node.type* %.tmp4655, %m996$.Node.type** %param_ptr.4646
br label %.if.end.4652
.if.false.4652:
br label %.if.end.4652
.if.end.4652:
%.tmp4656 = load %m996$.Node.type*, %m996$.Node.type** %fn_params
%.tmp4657 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp4656)
%param_info.4658 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp4657, %m2859$.AssignableInfo.type** %param_info.4658
%.tmp4659 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %param_info.4658
%.tmp4660 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4659, i32 0, i32 3
%.tmp4662 = getelementptr [9 x i8], [9 x i8]*@.str4661, i32 0, i32 0
store i8* %.tmp4662, i8** %.tmp4660
%.tmp4663 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4646
%.tmp4664 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4663, i32 0, i32 0
%.tmp4665 = load i8*, i8** %.tmp4664
%.tmp4667 = getelementptr [5 x i8], [5 x i8]*@.str4666, i32 0, i32 0
%.tmp4668 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4665, i8* %.tmp4667)
%.tmp4669 = icmp eq i32 %.tmp4668, 0
br i1 %.tmp4669, label %.if.true.4670, label %.if.false.4670
.if.true.4670:
%.tmp4671 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4672 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4646
%.tmp4673 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4672, i32 0, i32 8
%.tmp4674 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4673
%.tmp4675 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp4671, %m996$.Node.type* %.tmp4674)
store %m2859$.Type.type* %.tmp4675, %m2859$.Type.type** %param_type.4643
%.tmp4676 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4646
%.tmp4677 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4676, i32 0, i32 9
%.tmp4678 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4677
store %m996$.Node.type* %.tmp4678, %m996$.Node.type** %param_ptr.4646
br label %.if.end.4670
.if.false.4670:
br label %.if.end.4670
.if.end.4670:
%.tmp4679 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %param_info.4658
%.tmp4680 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4679, i32 0, i32 4
%.tmp4681 = load %m2859$.Type.type*, %m2859$.Type.type** %param_type.4643
store %m2859$.Type.type* %.tmp4681, %m2859$.Type.type** %.tmp4680
%.tmp4682 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4646
%.tmp4683 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4682, i32 0, i32 1
%.tmp4684 = load i8*, i8** %.tmp4683
%var_name.4685 = alloca i8*
store i8* %.tmp4684, i8** %var_name.4685
%.tmp4686 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %param_info.4658
%.tmp4687 = load i8, i8* @SCOPE_LOCAL
%.tmp4688 = load i8*, i8** %var_name.4685
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp4686, i8 %.tmp4687, i8* %.tmp4688)
%.tmp4689 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4690 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %param_info.4658
%.tmp4691 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4690, i32 0, i32 4
%.tmp4692 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4691
%.tmp4693 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp4689, %m2859$.Type.type* %.tmp4692)
%param_info_tr.4694 = alloca i8*
store i8* %.tmp4693, i8** %param_info_tr.4694
%.tmp4695 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4696 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4695, i32 0, i32 1
%.tmp4697 = load %m0$.File.type*, %m0$.File.type** %.tmp4696
%.tmp4699 = getelementptr [16 x i8], [16 x i8]*@.str4698, i32 0, i32 0
%.tmp4700 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %param_info.4658
%.tmp4701 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp4700)
%.tmp4702 = load i8*, i8** %param_info_tr.4694
%.tmp4703 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4697, i8* %.tmp4699, i8* %.tmp4701, i8* %.tmp4702)
%.tmp4704 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4705 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4646
%.tmp4706 = load i8*, i8** %var_name.4685
%.tmp4707 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %param_info.4658
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2859$.AssignableInfo.type*) @m311$define_assignable.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp4704, %m996$.Node.type* %.tmp4705, i8* %.tmp4706, %m2859$.AssignableInfo.type* %.tmp4707)
%.tmp4708 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4709 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4708, i32 0, i32 1
%.tmp4710 = load %m0$.File.type*, %m0$.File.type** %.tmp4709
%.tmp4712 = getelementptr [28 x i8], [28 x i8]*@.str4711, i32 0, i32 0
%.tmp4713 = load i8*, i8** %param_info_tr.4694
%.tmp4714 = load i8*, i8** %var_name.4685
%.tmp4715 = load i8*, i8** %param_info_tr.4694
%.tmp4716 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %param_info.4658
%.tmp4717 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp4716)
%.tmp4718 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4710, i8* %.tmp4712, i8* %.tmp4713, i8* %.tmp4714, i8* %.tmp4715, i8* %.tmp4717)
%.tmp4719 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4646
%.tmp4720 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4719, i32 0, i32 9
%.tmp4721 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4720
store %m996$.Node.type* %.tmp4721, %m996$.Node.type** %param_ptr.4646
br label %.for.start.4644
.for.end.4644:
ret void
}
define void @m311$compile_block.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp4722 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4724 = getelementptr [6 x i8], [6 x i8]*@.str4723, i32 0, i32 0
%.tmp4725 = bitcast ptr null to i8*
%.tmp4726 = bitcast ptr null to i8*
%.tmp4727 = bitcast ptr null to %m2859$.Type.type*
call void(%m2859$.CompilerCtx.type*,i8*,i8*,i8*,%m2859$.Type.type*) @m311$push_scope.v.m2859$.CompilerCtx.typep.cp.cp.cp.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp4722, i8* %.tmp4724, i8* %.tmp4725, i8* %.tmp4726, %m2859$.Type.type* %.tmp4727)
%.tmp4728 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4729 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4728, i32 0, i32 8
%.tmp4730 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4729
%.tmp4732 = getelementptr [12 x i8], [12 x i8]*@.str4731, i32 0, i32 0
%.tmp4733 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp4730, i8* %.tmp4732)
%exprs.4734 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4733, %m996$.Node.type** %exprs.4734
%.tmp4735 = load %m996$.Node.type*, %m996$.Node.type** %exprs.4734
%.tmp4736 = icmp ne %m996$.Node.type* %.tmp4735, null
br i1 %.tmp4736, label %.if.true.4737, label %.if.false.4737
.if.true.4737:
%.tmp4739 = load %m996$.Node.type*, %m996$.Node.type** %exprs.4734
%.tmp4740 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4739, i32 0, i32 8
%.tmp4741 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4740
%b.4742 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4741, %m996$.Node.type** %b.4742
br label %.for.start.4738
.for.start.4738:
%.tmp4743 = load %m996$.Node.type*, %m996$.Node.type** %b.4742
%.tmp4744 = icmp ne %m996$.Node.type* %.tmp4743, null
br i1 %.tmp4744, label %.for.continue.4738, label %.for.end.4738
.for.continue.4738:
%.tmp4745 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4746 = load %m996$.Node.type*, %m996$.Node.type** %b.4742
%.tmp4747 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4746, i32 0, i32 8
%.tmp4748 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4747
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_expression.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp4745, %m996$.Node.type* %.tmp4748)
%.tmp4749 = load %m996$.Node.type*, %m996$.Node.type** %b.4742
%.tmp4750 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4749, i32 0, i32 9
%.tmp4751 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4750
store %m996$.Node.type* %.tmp4751, %m996$.Node.type** %b.4742
br label %.for.start.4738
.for.end.4738:
br label %.if.end.4737
.if.false.4737:
br label %.if.end.4737
.if.end.4737:
%.tmp4752 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
call void(%m2859$.CompilerCtx.type*) @m311$pop_scope.v.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp4752)
ret void
}
define %m2859$.AssignableInfo.type* @m311$get_struct_attr.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep.i(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp4753 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4754 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4755 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_addr.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp4753, %m996$.Node.type* %.tmp4754)
%val.4756 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp4755, %m2859$.AssignableInfo.type** %val.4756
%.tmp4757 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %val.4756
%.tmp4758 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4757, i32 0, i32 4
%.tmp4759 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4758
%.tmp4760 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4759, i32 0, i32 0
%.tmp4761 = load i8*, i8** %.tmp4760
%.tmp4763 = getelementptr [7 x i8], [7 x i8]*@.str4762, i32 0, i32 0
%.tmp4764 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4761, i8* %.tmp4763)
%.tmp4765 = icmp ne i32 %.tmp4764, 0
br i1 %.tmp4765, label %.if.true.4766, label %.if.false.4766
.if.true.4766:
%.tmp4768 = getelementptr [7 x i8], [7 x i8]*@.str4767, i32 0, i32 0
%.tmp4769 = call i32(i8*,...) @printf(i8* %.tmp4768)
%.tmp4770 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp4770
br label %.if.end.4766
.if.false.4766:
br label %.if.end.4766
.if.end.4766:
%.tmp4771 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %val.4756
%.tmp4772 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4771, i32 0, i32 4
%.tmp4773 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4772
%.tmp4774 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4773, i32 0, i32 3
%.tmp4775 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4774
%node_type.4776 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp4775, %m2859$.Type.type** %node_type.4776
%i.4778 = alloca i32
store i32 0, i32* %i.4778
br label %.for.start.4777
.for.start.4777:
%.tmp4779 = load i32, i32* %i.4778
%.tmp4780 = load i32, i32* %attr_id
%.tmp4781 = icmp slt i32 %.tmp4779, %.tmp4780
br i1 %.tmp4781, label %.for.continue.4777, label %.for.end.4777
.for.continue.4777:
%.tmp4782 = load %m2859$.Type.type*, %m2859$.Type.type** %node_type.4776
%.tmp4783 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4782, i32 0, i32 4
%.tmp4784 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4783
store %m2859$.Type.type* %.tmp4784, %m2859$.Type.type** %node_type.4776
%.tmp4785 = load i32, i32* %i.4778
%.tmp4786 = add i32 %.tmp4785, 1
store i32 %.tmp4786, i32* %i.4778
br label %.for.start.4777
.for.end.4777:
%.tmp4787 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4788 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp4787)
%info.4789 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp4788, %m2859$.AssignableInfo.type** %info.4789
%.tmp4790 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4789
%.tmp4791 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4790, i32 0, i32 4
%.tmp4792 = load %m2859$.Type.type*, %m2859$.Type.type** %node_type.4776
store %m2859$.Type.type* %.tmp4792, %m2859$.Type.type** %.tmp4791
%.tmp4793 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4794 = call i32(%m2859$.CompilerCtx.type*) @m311$new_uid.i.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp4793)
%tmp_id.4795 = alloca i32
store i32 %.tmp4794, i32* %tmp_id.4795
%.tmp4796 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4797 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %val.4756
%.tmp4798 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4797, i32 0, i32 4
%.tmp4799 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4798
%.tmp4800 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp4796, %m2859$.Type.type* %.tmp4799)
%type_as_str.4801 = alloca i8*
store i8* %.tmp4800, i8** %type_as_str.4801
%.tmp4802 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4803 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4789
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp4802, %m2859$.AssignableInfo.type* %.tmp4803)
%.tmp4804 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4805 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4804, i32 0, i32 1
%.tmp4806 = load %m0$.File.type*, %m0$.File.type** %.tmp4805
%.tmp4808 = getelementptr [52 x i8], [52 x i8]*@.str4807, i32 0, i32 0
%.tmp4809 = load i32, i32* %tmp_id.4795
%.tmp4810 = load i8*, i8** %type_as_str.4801
%.tmp4811 = load i8*, i8** %type_as_str.4801
%.tmp4812 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %val.4756
%.tmp4813 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp4812)
%.tmp4814 = load i32, i32* %attr_id
%.tmp4815 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4806, i8* %.tmp4808, i32 %.tmp4809, i8* %.tmp4810, i8* %.tmp4811, i8* %.tmp4813, i32 %.tmp4814)
%.tmp4816 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4817 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4816, i32 0, i32 1
%.tmp4818 = load %m0$.File.type*, %m0$.File.type** %.tmp4817
%.tmp4820 = getelementptr [28 x i8], [28 x i8]*@.str4819, i32 0, i32 0
%.tmp4821 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4789
%.tmp4822 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp4821)
%.tmp4823 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4824 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4789
%.tmp4825 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4824, i32 0, i32 4
%.tmp4826 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4825
%.tmp4827 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp4823, %m2859$.Type.type* %.tmp4826)
%.tmp4828 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4829 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4789
%.tmp4830 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4829, i32 0, i32 4
%.tmp4831 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4830
%.tmp4832 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp4828, %m2859$.Type.type* %.tmp4831)
%.tmp4833 = load i32, i32* %tmp_id.4795
%.tmp4834 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4818, i8* %.tmp4820, i8* %.tmp4822, i8* %.tmp4827, i8* %.tmp4832, i32 %.tmp4833)
%.tmp4835 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4789
ret %m2859$.AssignableInfo.type* %.tmp4835
}
define void @m311$set_struct_attr.v.m2859$.CompilerCtx.typep.m996$.Node.typep.i.cp(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, i32 %.attr_id.arg, i8* %.attr.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%attr = alloca i8*
store i8* %.attr.arg, i8** %attr
%.tmp4836 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4837 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4838 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_addr.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp4836, %m996$.Node.type* %.tmp4837)
%val.4839 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp4838, %m2859$.AssignableInfo.type** %val.4839
%.tmp4840 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %val.4839
%.tmp4841 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4840, i32 0, i32 4
%.tmp4842 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4841
%.tmp4843 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4842, i32 0, i32 0
%.tmp4844 = load i8*, i8** %.tmp4843
%.tmp4846 = getelementptr [7 x i8], [7 x i8]*@.str4845, i32 0, i32 0
%.tmp4847 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4844, i8* %.tmp4846)
%.tmp4848 = icmp ne i32 %.tmp4847, 0
br i1 %.tmp4848, label %.if.true.4849, label %.if.false.4849
.if.true.4849:
%.tmp4851 = getelementptr [7 x i8], [7 x i8]*@.str4850, i32 0, i32 0
%.tmp4852 = call i32(i8*,...) @printf(i8* %.tmp4851)
ret void
br label %.if.end.4849
.if.false.4849:
br label %.if.end.4849
.if.end.4849:
%.tmp4853 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %val.4839
%.tmp4854 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4853, i32 0, i32 4
%.tmp4855 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4854
%.tmp4856 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4855, i32 0, i32 3
%.tmp4857 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4856
%node_type.4858 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp4857, %m2859$.Type.type** %node_type.4858
%i.4860 = alloca i32
store i32 0, i32* %i.4860
br label %.for.start.4859
.for.start.4859:
%.tmp4861 = load i32, i32* %i.4860
%.tmp4862 = load i32, i32* %attr_id
%.tmp4863 = icmp slt i32 %.tmp4861, %.tmp4862
br i1 %.tmp4863, label %.for.continue.4859, label %.for.end.4859
.for.continue.4859:
%.tmp4864 = load %m2859$.Type.type*, %m2859$.Type.type** %node_type.4858
%.tmp4865 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4864, i32 0, i32 4
%.tmp4866 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4865
store %m2859$.Type.type* %.tmp4866, %m2859$.Type.type** %node_type.4858
%.tmp4867 = load i32, i32* %i.4860
%.tmp4868 = add i32 %.tmp4867, 1
store i32 %.tmp4868, i32* %i.4860
br label %.for.start.4859
.for.end.4859:
%.tmp4869 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4870 = call i32(%m2859$.CompilerCtx.type*) @m311$new_uid.i.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp4869)
%tmp_id.4871 = alloca i32
store i32 %.tmp4870, i32* %tmp_id.4871
%.tmp4872 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4873 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %val.4839
%.tmp4874 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4873, i32 0, i32 4
%.tmp4875 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4874
%.tmp4876 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp4872, %m2859$.Type.type* %.tmp4875)
%type_as_str.4877 = alloca i8*
store i8* %.tmp4876, i8** %type_as_str.4877
%.tmp4878 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4879 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4878, i32 0, i32 1
%.tmp4880 = load %m0$.File.type*, %m0$.File.type** %.tmp4879
%.tmp4882 = getelementptr [52 x i8], [52 x i8]*@.str4881, i32 0, i32 0
%.tmp4883 = load i32, i32* %tmp_id.4871
%.tmp4884 = load i8*, i8** %type_as_str.4877
%.tmp4885 = load i8*, i8** %type_as_str.4877
%.tmp4886 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %val.4839
%.tmp4887 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp4886)
%.tmp4888 = load i32, i32* %attr_id
%.tmp4889 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4880, i8* %.tmp4882, i32 %.tmp4883, i8* %.tmp4884, i8* %.tmp4885, i8* %.tmp4887, i32 %.tmp4888)
%.tmp4890 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4891 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4890, i32 0, i32 1
%.tmp4892 = load %m0$.File.type*, %m0$.File.type** %.tmp4891
%.tmp4894 = getelementptr [18 x i8], [18 x i8]*@.str4893, i32 0, i32 0
%.tmp4895 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4896 = load %m2859$.Type.type*, %m2859$.Type.type** %node_type.4858
%.tmp4897 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp4895, %m2859$.Type.type* %.tmp4896)
%.tmp4898 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4899 = load %m2859$.Type.type*, %m2859$.Type.type** %node_type.4858
%.tmp4900 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp4898, %m2859$.Type.type* %.tmp4899)
%.tmp4901 = load i8*, i8** %attr
%.tmp4902 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4892, i8* %.tmp4894, i8* %.tmp4897, i8* %.tmp4900, i8* %.tmp4901)
ret void
}
define %m2859$.AssignableInfo.type* @m311$compile_builtin.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp4903 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4904 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4903, i32 0, i32 8
%.tmp4905 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4904
%.tmp4906 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4905, i32 0, i32 8
%.tmp4907 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4906
%dotted.4908 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4907, %m996$.Node.type** %dotted.4908
%.tmp4909 = load %m996$.Node.type*, %m996$.Node.type** %dotted.4908
%.tmp4910 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4909, i32 0, i32 9
%.tmp4911 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4910
%.tmp4912 = icmp ne %m996$.Node.type* %.tmp4911, null
br i1 %.tmp4912, label %.if.true.4913, label %.if.false.4913
.if.true.4913:
%.tmp4914 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp4914
br label %.if.end.4913
.if.false.4913:
br label %.if.end.4913
.if.end.4913:
%.tmp4915 = load %m996$.Node.type*, %m996$.Node.type** %dotted.4908
%.tmp4916 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4915, i32 0, i32 1
%.tmp4917 = load i8*, i8** %.tmp4916
%.tmp4919 = getelementptr [7 x i8], [7 x i8]*@.str4918, i32 0, i32 0
%.tmp4920 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4917, i8* %.tmp4919)
%.tmp4921 = icmp eq i32 %.tmp4920, 0
br i1 %.tmp4921, label %.if.true.4922, label %.if.false.4922
.if.true.4922:
%.tmp4923 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4925 = getelementptr [8 x i8], [8 x i8]*@.str4924, i32 0, i32 0
%.tmp4926 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp4923, i8* %.tmp4925)
%args.4927 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4926, %m996$.Node.type** %args.4927
%.tmp4928 = load %m996$.Node.type*, %m996$.Node.type** %args.4927
%.tmp4929 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4928, i32 0, i32 8
%.tmp4930 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4929
%.tmp4932 = getelementptr [11 x i8], [11 x i8]*@.str4931, i32 0, i32 0
%.tmp4933 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp4930, i8* %.tmp4932)
%value.4934 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4933, %m996$.Node.type** %value.4934
%.tmp4935 = load %m996$.Node.type*, %m996$.Node.type** %value.4934
%.tmp4936 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4935, i32 0, i32 8
%.tmp4937 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4936
%.tmp4938 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4937, i32 0, i32 8
%.tmp4939 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4938
%.tmp4940 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4939, i32 0, i32 8
%.tmp4941 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4940
%.tmp4942 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4941, i32 0, i32 8
%.tmp4943 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4942
store %m996$.Node.type* %.tmp4943, %m996$.Node.type** %value.4934
%.tmp4944 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4945 = call i32(%m2859$.CompilerCtx.type*) @m311$new_uid.i.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp4944)
%tmp_id.4946 = alloca i32
store i32 %.tmp4945, i32* %tmp_id.4946
%.tmp4947 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4948 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp4947)
%info.4949 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp4948, %m2859$.AssignableInfo.type** %info.4949
%.tmp4950 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4951 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4949
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp4950, %m2859$.AssignableInfo.type* %.tmp4951)
%.tmp4952 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4949
%.tmp4953 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4952, i32 0, i32 4
%.tmp4954 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp4954, %m2859$.Type.type** %.tmp4953
%.tmp4955 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4949
%.tmp4956 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp4955, i32 0, i32 4
%.tmp4957 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp4956
%.tmp4958 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp4957, i32 0, i32 0
%.tmp4960 = getelementptr [4 x i8], [4 x i8]*@.str4959, i32 0, i32 0
store i8* %.tmp4960, i8** %.tmp4958
%.tmp4961 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4962 = load %m996$.Node.type*, %m996$.Node.type** %value.4934
%.tmp4963 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp4961, %m996$.Node.type* %.tmp4962)
%inspected_type.4964 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp4963, %m2859$.Type.type** %inspected_type.4964
%.tmp4965 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4966 = load %m2859$.Type.type*, %m2859$.Type.type** %inspected_type.4964
%.tmp4967 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp4965, %m2859$.Type.type* %.tmp4966)
%type_as_str.4968 = alloca i8*
store i8* %.tmp4967, i8** %type_as_str.4968
%.tmp4969 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4970 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4969, i32 0, i32 1
%.tmp4971 = load %m0$.File.type*, %m0$.File.type** %.tmp4970
%.tmp4973 = getelementptr [46 x i8], [46 x i8]*@.str4972, i32 0, i32 0
%.tmp4974 = load i32, i32* %tmp_id.4946
%.tmp4975 = load i8*, i8** %type_as_str.4968
%.tmp4976 = load i8*, i8** %type_as_str.4968
%.tmp4977 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4971, i8* %.tmp4973, i32 %.tmp4974, i8* %.tmp4975, i8* %.tmp4976)
%.tmp4978 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp4979 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp4978, i32 0, i32 1
%.tmp4980 = load %m0$.File.type*, %m0$.File.type** %.tmp4979
%.tmp4982 = getelementptr [35 x i8], [35 x i8]*@.str4981, i32 0, i32 0
%.tmp4983 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4949
%.tmp4984 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp4983)
%.tmp4985 = load i8*, i8** %type_as_str.4968
%.tmp4986 = load i32, i32* %tmp_id.4946
%.tmp4987 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4980, i8* %.tmp4982, i8* %.tmp4984, i8* %.tmp4985, i32 %.tmp4986)
%.tmp4988 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.4949
ret %m2859$.AssignableInfo.type* %.tmp4988
br label %.if.end.4922
.if.false.4922:
%.tmp4989 = load %m996$.Node.type*, %m996$.Node.type** %dotted.4908
%.tmp4990 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4989, i32 0, i32 1
%.tmp4991 = load i8*, i8** %.tmp4990
%.tmp4993 = getelementptr [7 x i8], [7 x i8]*@.str4992, i32 0, i32 0
%.tmp4994 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4991, i8* %.tmp4993)
%.tmp4995 = icmp eq i32 %.tmp4994, 0
br i1 %.tmp4995, label %.if.true.4996, label %.if.false.4996
.if.true.4996:
%.tmp4997 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4999 = getelementptr [8 x i8], [8 x i8]*@.str4998, i32 0, i32 0
%.tmp5000 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp4997, i8* %.tmp4999)
%args.5001 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5000, %m996$.Node.type** %args.5001
%.tmp5002 = load %m996$.Node.type*, %m996$.Node.type** %args.5001
%.tmp5003 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5002, i32 0, i32 8
%.tmp5004 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5003
%.tmp5006 = getelementptr [11 x i8], [11 x i8]*@.str5005, i32 0, i32 0
%.tmp5007 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5004, i8* %.tmp5006)
%array.5008 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5007, %m996$.Node.type** %array.5008
%.tmp5009 = load %m996$.Node.type*, %m996$.Node.type** %array.5008
%.tmp5010 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5009, i32 0, i32 9
%.tmp5011 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5010
%.tmp5013 = getelementptr [11 x i8], [11 x i8]*@.str5012, i32 0, i32 0
%.tmp5014 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5011, i8* %.tmp5013)
%value.5015 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5014, %m996$.Node.type** %value.5015
%.tmp5016 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5017 = load %m996$.Node.type*, %m996$.Node.type** %value.5015
%.tmp5018 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp5016, %m996$.Node.type* %.tmp5017)
%value_info.5019 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp5018, %m2859$.AssignableInfo.type** %value_info.5019
%.tmp5020 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5021 = load %m996$.Node.type*, %m996$.Node.type** %array.5008
%.tmp5022 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_addr.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp5020, %m996$.Node.type* %.tmp5021)
%array_info.5023 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp5022, %m2859$.AssignableInfo.type** %array_info.5023
%.tmp5024 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5025 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp5024)
%info.5026 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp5025, %m2859$.AssignableInfo.type** %info.5026
%.tmp5027 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5028 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5026
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp5027, %m2859$.AssignableInfo.type* %.tmp5028)
%.tmp5029 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5026
%.tmp5030 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5029, i32 0, i32 4
%.tmp5031 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %array_info.5023
%.tmp5032 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5031, i32 0, i32 4
%.tmp5033 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5032
store %m2859$.Type.type* %.tmp5033, %m2859$.Type.type** %.tmp5030
%.tmp5035 = getelementptr [1 x i8], [1 x i8]*@.str5034, i32 0, i32 0
%builtin_prefix.5036 = alloca i8*
store i8* %.tmp5035, i8** %builtin_prefix.5036
%.tmp5037 = getelementptr i8*, i8** %builtin_prefix.5036, i32 0
%.tmp5039 = getelementptr [5 x i8], [5 x i8]*@.str5038, i32 0, i32 0
%.tmp5040 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5041 = call i32(%m2859$.CompilerCtx.type*) @m311$new_uid.i.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp5040)
%.tmp5042 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5037, i8* %.tmp5039, i32 %.tmp5041)
%.tmp5043 = call i8*() @m2410$append_tmpl.cp()
%tmpl.5044 = alloca i8*
store i8* %.tmp5043, i8** %tmpl.5044
%.tmp5045 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5046 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp5045, i32 0, i32 1
%.tmp5047 = load %m0$.File.type*, %m0$.File.type** %.tmp5046
%.tmp5048 = load i8*, i8** %tmpl.5044
%.tmp5049 = load i8*, i8** %builtin_prefix.5036
%.tmp5050 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5051 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %array_info.5023
%.tmp5052 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5051, i32 0, i32 4
%.tmp5053 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5052
%.tmp5054 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5050, %m2859$.Type.type* %.tmp5053)
%.tmp5055 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %array_info.5023
%.tmp5056 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp5055)
%.tmp5057 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5058 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %value_info.5019
%.tmp5059 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5058, i32 0, i32 4
%.tmp5060 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5059
%.tmp5061 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5057, %m2859$.Type.type* %.tmp5060)
%.tmp5062 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %value_info.5019
%.tmp5063 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp5062)
%.tmp5064 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5026
%.tmp5065 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp5064)
%.tmp5066 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5047, i8* %.tmp5048, i8* %.tmp5049, i8* %.tmp5054, i8* %.tmp5056, i8* %.tmp5061, i8* %.tmp5063, i8* %.tmp5065)
%.tmp5067 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5068 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp5067)
%info_g.5069 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp5068, %m2859$.AssignableInfo.type** %info_g.5069
%.tmp5070 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_g.5069
%.tmp5071 = load i8, i8* @SCOPE_GLOBAL
%.tmp5073 = getelementptr [8 x i8], [8 x i8]*@.str5072, i32 0, i32 0
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp5070, i8 %.tmp5071, i8* %.tmp5073)
%.tmp5074 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_g.5069
%.tmp5075 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5074, i32 0, i32 4
%.tmp5076 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp5076, %m2859$.Type.type** %.tmp5075
%.tmp5077 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_g.5069
%.tmp5078 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5077, i32 0, i32 4
%.tmp5079 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5078
%.tmp5080 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5079, i32 0, i32 0
%.tmp5082 = getelementptr [9 x i8], [9 x i8]*@.str5081, i32 0, i32 0
store i8* %.tmp5082, i8** %.tmp5080
%.tmp5083 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_g.5069
%.tmp5084 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5083, i32 0, i32 4
%.tmp5085 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5084
%.tmp5086 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5085, i32 0, i32 3
%.tmp5087 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp5087, %m2859$.Type.type** %.tmp5086
%.tmp5088 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_g.5069
%.tmp5089 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5088, i32 0, i32 4
%.tmp5090 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5089
%.tmp5091 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5090, i32 0, i32 3
%.tmp5092 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5091
%.tmp5093 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5092, i32 0, i32 0
%.tmp5095 = getelementptr [4 x i8], [4 x i8]*@.str5094, i32 0, i32 0
store i8* %.tmp5095, i8** %.tmp5093
%.tmp5096 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_g.5069
%.tmp5097 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5096, i32 0, i32 4
%.tmp5098 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5097
%.tmp5099 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5098, i32 0, i32 3
%.tmp5100 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5099
%.tmp5101 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5100, i32 0, i32 3
%.tmp5102 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp5102, %m2859$.Type.type** %.tmp5101
%.tmp5103 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_g.5069
%.tmp5104 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5103, i32 0, i32 4
%.tmp5105 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5104
%.tmp5106 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5105, i32 0, i32 3
%.tmp5107 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5106
%.tmp5108 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5107, i32 0, i32 3
%.tmp5109 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5108
%.tmp5110 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5109, i32 0, i32 0
%.tmp5112 = getelementptr [4 x i8], [4 x i8]*@.str5111, i32 0, i32 0
store i8* %.tmp5112, i8** %.tmp5110
%.tmp5113 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_g.5069
%.tmp5114 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5113, i32 0, i32 4
%.tmp5115 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5114
%.tmp5116 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5115, i32 0, i32 3
%.tmp5117 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5116
%.tmp5118 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5117, i32 0, i32 4
%.tmp5119 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp5119, %m2859$.Type.type** %.tmp5118
%.tmp5120 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_g.5069
%.tmp5121 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5120, i32 0, i32 4
%.tmp5122 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5121
%.tmp5123 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5122, i32 0, i32 3
%.tmp5124 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5123
%.tmp5125 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5124, i32 0, i32 4
%.tmp5126 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5125
%.tmp5127 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5126, i32 0, i32 0
%.tmp5129 = getelementptr [4 x i8], [4 x i8]*@.str5128, i32 0, i32 0
store i8* %.tmp5129, i8** %.tmp5127
%.tmp5130 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_g.5069
%.tmp5131 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5130, i32 0, i32 4
%.tmp5132 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5131
%.tmp5133 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5132, i32 0, i32 3
%.tmp5134 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5133
%.tmp5135 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5134, i32 0, i32 4
%.tmp5136 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5135
%.tmp5137 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5136, i32 0, i32 3
%.tmp5138 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp5138, %m2859$.Type.type** %.tmp5137
%.tmp5139 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_g.5069
%.tmp5140 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5139, i32 0, i32 4
%.tmp5141 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5140
%.tmp5142 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5141, i32 0, i32 3
%.tmp5143 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5142
%.tmp5144 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5143, i32 0, i32 4
%.tmp5145 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5144
%.tmp5146 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5145, i32 0, i32 3
%.tmp5147 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5146
%.tmp5148 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5147, i32 0, i32 0
%.tmp5150 = getelementptr [4 x i8], [4 x i8]*@.str5149, i32 0, i32 0
store i8* %.tmp5150, i8** %.tmp5148
%.tmp5151 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_g.5069
%.tmp5152 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5151, i32 0, i32 4
%.tmp5153 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5152
%.tmp5154 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5153, i32 0, i32 3
%.tmp5155 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5154
%.tmp5156 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5155, i32 0, i32 4
%.tmp5157 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5156
%.tmp5158 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5157, i32 0, i32 4
%.tmp5159 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp5159, %m2859$.Type.type** %.tmp5158
%.tmp5160 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_g.5069
%.tmp5161 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5160, i32 0, i32 4
%.tmp5162 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5161
%.tmp5163 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5162, i32 0, i32 3
%.tmp5164 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5163
%.tmp5165 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5164, i32 0, i32 4
%.tmp5166 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5165
%.tmp5167 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5166, i32 0, i32 4
%.tmp5168 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5167
%.tmp5169 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5168, i32 0, i32 0
%.tmp5171 = getelementptr [4 x i8], [4 x i8]*@.str5170, i32 0, i32 0
store i8* %.tmp5171, i8** %.tmp5169
%.tmp5172 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5174 = getelementptr [8 x i8], [8 x i8]*@.str5173, i32 0, i32 0
%.tmp5176 = getelementptr [7 x i8], [7 x i8]*@.str5175, i32 0, i32 0
%.tmp5177 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_g.5069
call void(%m2859$.CompilerCtx.type*,i8*,i8*,%m2859$.AssignableInfo.type*,i1,i1) @m311$define_global.v.m2859$.CompilerCtx.typep.cp.cp.m2859$.AssignableInfo.typep.b.b(%m2859$.CompilerCtx.type* %.tmp5172, i8* %.tmp5174, i8* %.tmp5176, %m2859$.AssignableInfo.type* %.tmp5177, i1 1, i1 0)
%.tmp5178 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5026
ret %m2859$.AssignableInfo.type* %.tmp5178
br label %.if.end.4996
.if.false.4996:
%.tmp5179 = load %m996$.Node.type*, %m996$.Node.type** %dotted.4908
%.tmp5180 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5179, i32 0, i32 1
%.tmp5181 = load i8*, i8** %.tmp5180
%.tmp5183 = getelementptr [4 x i8], [4 x i8]*@.str5182, i32 0, i32 0
%.tmp5184 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5181, i8* %.tmp5183)
%.tmp5185 = icmp eq i32 %.tmp5184, 0
br i1 %.tmp5185, label %.if.true.5186, label %.if.false.5186
.if.true.5186:
%.tmp5187 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5189 = getelementptr [8 x i8], [8 x i8]*@.str5188, i32 0, i32 0
%.tmp5190 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5187, i8* %.tmp5189)
%args.5191 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5190, %m996$.Node.type** %args.5191
%.tmp5192 = load %m996$.Node.type*, %m996$.Node.type** %args.5191
%.tmp5193 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5192, i32 0, i32 8
%.tmp5194 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5193
%.tmp5196 = getelementptr [11 x i8], [11 x i8]*@.str5195, i32 0, i32 0
%.tmp5197 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5194, i8* %.tmp5196)
%value.5198 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5197, %m996$.Node.type** %value.5198
%.tmp5199 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5200 = load %m996$.Node.type*, %m996$.Node.type** %value.5198
%.tmp5201 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i32) @m311$get_struct_attr.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep.i(%m2859$.CompilerCtx.type* %.tmp5199, %m996$.Node.type* %.tmp5200, i32 1)
ret %m2859$.AssignableInfo.type* %.tmp5201
br label %.if.end.5186
.if.false.5186:
br label %.if.end.5186
.if.end.5186:
br label %.if.end.4996
.if.end.4996:
br label %.if.end.4922
.if.end.4922:
%.tmp5202 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp5202
}
define i8* @m311$resolve_import_path.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, i8* %.import_str.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%import_str = alloca i8*
store i8* %.import_str.arg, i8** %import_str
%.tmp5204 = getelementptr [1 x i8], [1 x i8]*@.str5203, i32 0, i32 0
%err_buf.5205 = alloca i8*
store i8* %.tmp5204, i8** %err_buf.5205
%.tmp5206 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5207 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp5206, i32 0, i32 7
%.tmp5208 = load i8*, i8** %.tmp5207
%mod_abspath.5209 = alloca i8*
store i8* %.tmp5208, i8** %mod_abspath.5209
%.tmp5210 = load i8*, i8** %mod_abspath.5209
%.tmp5211 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp5210)
%dirname.5212 = alloca i8*
store i8* %.tmp5211, i8** %dirname.5212
%.tmp5213 = load i8*, i8** %import_str
%.tmp5214 = getelementptr i8, i8* %.tmp5213, i32 0
%.tmp5215 = load i8, i8* %.tmp5214
%.tmp5216 = icmp eq i8 %.tmp5215, 47
br i1 %.tmp5216, label %.if.true.5217, label %.if.false.5217
.if.true.5217:
%.tmp5218 = getelementptr i8*, i8** %err_buf.5205, i32 0
%.tmp5220 = getelementptr [46 x i8], [46 x i8]*@.str5219, i32 0, i32 0
%.tmp5221 = load i8*, i8** %import_str
%.tmp5222 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5218, i8* %.tmp5220, i8* %.tmp5221)
%.tmp5223 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5224 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5225 = load i8*, i8** %err_buf.5205
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp5223, %m996$.Node.type* %.tmp5224, i8* %.tmp5225)
%.tmp5226 = bitcast ptr null to i8*
ret i8* %.tmp5226
br label %.if.end.5217
.if.false.5217:
br label %.if.end.5217
.if.end.5217:
%.tmp5227 = load i8*, i8** %import_str
%.tmp5228 = getelementptr i8, i8* %.tmp5227, i32 0
%.tmp5229 = load i8, i8* %.tmp5228
%.tmp5230 = icmp ne i8 %.tmp5229, 46
%.tmp5231 = load i8*, i8** %import_str
%.tmp5232 = getelementptr i8, i8* %.tmp5231, i32 1
%.tmp5233 = load i8, i8* %.tmp5232
%.tmp5234 = icmp ne i8 %.tmp5233, 47
%.tmp5235 = and i1 %.tmp5230, %.tmp5234
br i1 %.tmp5235, label %.if.true.5236, label %.if.false.5236
.if.true.5236:
%.tmp5237 = call i8*() @m311$get_root.cp()
%root.5238 = alloca i8*
store i8* %.tmp5237, i8** %root.5238
%.tmp5239 = getelementptr i8*, i8** %mod_abspath.5209, i32 0
%.tmp5241 = getelementptr [13 x i8], [13 x i8]*@.str5240, i32 0, i32 0
%.tmp5242 = load i8*, i8** %root.5238
%.tmp5243 = load i8*, i8** %import_str
%.tmp5244 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5239, i8* %.tmp5241, i8* %.tmp5242, i8* %.tmp5243)
br label %.if.end.5236
.if.false.5236:
%.tmp5245 = load i8*, i8** %dirname.5212
%.tmp5247 = getelementptr [1 x i8], [1 x i8]*@.str5246, i32 0, i32 0
%.tmp5248 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5245, i8* %.tmp5247)
%.tmp5249 = icmp eq i32 %.tmp5248, 0
br i1 %.tmp5249, label %.if.true.5250, label %.if.false.5250
.if.true.5250:
%.tmp5251 = getelementptr i8*, i8** %mod_abspath.5209, i32 0
%.tmp5253 = getelementptr [6 x i8], [6 x i8]*@.str5252, i32 0, i32 0
%.tmp5254 = load i8*, i8** %import_str
%.tmp5255 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5251, i8* %.tmp5253, i8* %.tmp5254)
br label %.if.end.5250
.if.false.5250:
%.tmp5256 = getelementptr i8*, i8** %mod_abspath.5209, i32 0
%.tmp5258 = getelementptr [9 x i8], [9 x i8]*@.str5257, i32 0, i32 0
%.tmp5259 = load i8*, i8** %dirname.5212
%.tmp5260 = load i8*, i8** %import_str
%.tmp5261 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5256, i8* %.tmp5258, i8* %.tmp5259, i8* %.tmp5260)
br label %.if.end.5250
.if.end.5250:
br label %.if.end.5236
.if.end.5236:
%.tmp5262 = load i8*, i8** %mod_abspath.5209
ret i8* %.tmp5262
}
define %m2859$.AssignableInfo.type* @m311$compile_fn_call.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp5263 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5264 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5265 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_builtin.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp5263, %m996$.Node.type* %.tmp5264)
%info.5266 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp5265, %m2859$.AssignableInfo.type** %info.5266
%.tmp5267 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5268 = icmp ne %m2859$.AssignableInfo.type* %.tmp5267, null
br i1 %.tmp5268, label %.if.true.5269, label %.if.false.5269
.if.true.5269:
%.tmp5270 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
ret %m2859$.AssignableInfo.type* %.tmp5270
br label %.if.end.5269
.if.false.5269:
br label %.if.end.5269
.if.end.5269:
%.tmp5271 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5272 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5273 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_addr.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp5271, %m996$.Node.type* %.tmp5272)
store %m2859$.AssignableInfo.type* %.tmp5273, %m2859$.AssignableInfo.type** %info.5266
%.tmp5274 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5275 = icmp eq %m2859$.AssignableInfo.type* %.tmp5274, null
br i1 %.tmp5275, label %.if.true.5276, label %.if.false.5276
.if.true.5276:
%.tmp5277 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp5277, label %.if.true.5278, label %.if.false.5278
.if.true.5278:
%.tmp5279 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5280 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5282 = getelementptr [35 x i8], [35 x i8]*@.str5281, i32 0, i32 0
%.tmp5283 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp5279, %m996$.Node.type* %.tmp5280, i8* %.tmp5282)
%.tmp5284 = call i32(i8*,...) @printf(i8* %.tmp5283)
br label %.if.end.5278
.if.false.5278:
br label %.if.end.5278
.if.end.5278:
%.tmp5285 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp5285
br label %.if.end.5276
.if.false.5276:
br label %.if.end.5276
.if.end.5276:
%.tmp5286 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5288 = getelementptr [8 x i8], [8 x i8]*@.str5287, i32 0, i32 0
%.tmp5289 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5286, i8* %.tmp5288)
%args.5290 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5289, %m996$.Node.type** %args.5290
%.tmp5291 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5292 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5291, i32 0, i32 4
%.tmp5293 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5292
%.tmp5294 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5293, i32 0, i32 0
%.tmp5295 = load i8*, i8** %.tmp5294
%.tmp5297 = getelementptr [11 x i8], [11 x i8]*@.str5296, i32 0, i32 0
%.tmp5298 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5295, i8* %.tmp5297)
%.tmp5299 = icmp eq i32 %.tmp5298, 0
br i1 %.tmp5299, label %.if.true.5300, label %.if.false.5300
.if.true.5300:
%.tmp5302 = getelementptr [10 x i8], [10 x i8]*@.str5301, i32 0, i32 0
%.tmp5303 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5304 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5303, i32 0, i32 4
%.tmp5305 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5304
%.tmp5306 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5305, i32 0, i32 1
%.tmp5307 = load i8*, i8** %.tmp5306
%.tmp5308 = call i32(i8*,...) @printf(i8* %.tmp5302, i8* %.tmp5307)
%field_id.5309 = alloca i32
store i32 0, i32* %field_id.5309
%.tmp5311 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5312 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5311, i32 0, i32 4
%.tmp5313 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5312
%.tmp5314 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5313, i32 0, i32 5
%.tmp5315 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5314
%.tmp5316 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5315, i32 0, i32 3
%.tmp5317 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5316
%.tmp5318 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5317, i32 0, i32 4
%.tmp5319 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5318
%.tmp5320 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5319, i32 0, i32 3
%.tmp5321 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5320
%f.5322 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp5321, %m2859$.Type.type** %f.5322
br label %.for.start.5310
.for.start.5310:
%.tmp5323 = load %m2859$.Type.type*, %m2859$.Type.type** %f.5322
%.tmp5324 = icmp ne %m2859$.Type.type* %.tmp5323, null
br i1 %.tmp5324, label %.for.continue.5310, label %.for.else.5310
.for.continue.5310:
%.tmp5325 = load %m2859$.Type.type*, %m2859$.Type.type** %f.5322
%.tmp5326 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5327 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5326, i32 0, i32 4
%.tmp5328 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5327
%.tmp5329 = icmp eq %m2859$.Type.type* %.tmp5325, %.tmp5328
br i1 %.tmp5329, label %.if.true.5330, label %.if.false.5330
.if.true.5330:
br label %.for.end.5310
br label %.if.end.5330
.if.false.5330:
br label %.if.end.5330
.if.end.5330:
%.tmp5331 = load i32, i32* %field_id.5309
%.tmp5332 = add i32 %.tmp5331, 1
store i32 %.tmp5332, i32* %field_id.5309
%.tmp5333 = load %m2859$.Type.type*, %m2859$.Type.type** %f.5322
%.tmp5334 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5333, i32 0, i32 4
%.tmp5335 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5334
store %m2859$.Type.type* %.tmp5335, %m2859$.Type.type** %f.5322
br label %.for.start.5310
.for.else.5310:
%.tmp5337 = getelementptr [1 x i8], [1 x i8]*@.str5336, i32 0, i32 0
%buf.5338 = alloca i8*
store i8* %.tmp5337, i8** %buf.5338
%.tmp5339 = getelementptr i8*, i8** %buf.5338, i32 0
%.tmp5341 = getelementptr [39 x i8], [39 x i8]*@.str5340, i32 0, i32 0
%.tmp5342 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5343 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5342, i32 0, i32 4
%.tmp5344 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5343
%.tmp5345 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5344, i32 0, i32 1
%.tmp5346 = load i8*, i8** %.tmp5345
%.tmp5347 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5339, i8* %.tmp5341, i8* %.tmp5346)
%.tmp5348 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5349 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5350 = load i8*, i8** %buf.5338
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp5348, %m996$.Node.type* %.tmp5349, i8* %.tmp5350)
%.tmp5351 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp5351
br label %.for.end.5310
.for.end.5310:
%.tmp5353 = getelementptr [1 x i8], [1 x i8]*@.str5352, i32 0, i32 0
%buf_types.5354 = alloca i8*
store i8* %.tmp5353, i8** %buf_types.5354
%.tmp5356 = getelementptr [1 x i8], [1 x i8]*@.str5355, i32 0, i32 0
%buf_values.5357 = alloca i8*
store i8* %.tmp5356, i8** %buf_values.5357
%.tmp5358 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5359 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5360 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5359, i32 0, i32 4
%.tmp5361 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5360
%.tmp5362 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5361, i32 0, i32 5
%.tmp5363 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5362
%.tmp5364 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5363, i32 0, i32 3
%.tmp5365 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5364
%.tmp5366 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5365, i32 0, i32 4
%.tmp5367 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5366
%.tmp5368 = call i32(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$type_size.i.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5358, %m2859$.Type.type* %.tmp5367)
%padding.5369 = alloca i32
store i32 %.tmp5368, i32* %padding.5369
%expect_fields.5370 = alloca i32
store i32 0, i32* %expect_fields.5370
%.tmp5372 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5373 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5372, i32 0, i32 4
%.tmp5374 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5373
%.tmp5375 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5374, i32 0, i32 3
%.tmp5376 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5375
%f.5377 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp5376, %m2859$.Type.type** %f.5377
br label %.for.start.5371
.for.start.5371:
%.tmp5378 = load %m2859$.Type.type*, %m2859$.Type.type** %f.5377
%.tmp5379 = icmp ne %m2859$.Type.type* %.tmp5378, null
br i1 %.tmp5379, label %.for.continue.5371, label %.for.end.5371
.for.continue.5371:
%.tmp5381 = getelementptr [21 x i8], [21 x i8]*@.str5380, i32 0, i32 0
%.tmp5382 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5383 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5382, i32 0, i32 4
%.tmp5384 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5383
%.tmp5385 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5384, i32 0, i32 1
%.tmp5386 = load i8*, i8** %.tmp5385
%.tmp5387 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5388 = load %m2859$.Type.type*, %m2859$.Type.type** %f.5377
%.tmp5389 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5387, %m2859$.Type.type* %.tmp5388)
%.tmp5390 = call i32(i8*,...) @printf(i8* %.tmp5381, i8* %.tmp5386, i8* %.tmp5389)
%.tmp5391 = load i32, i32* %padding.5369
%.tmp5392 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5393 = load %m2859$.Type.type*, %m2859$.Type.type** %f.5377
%.tmp5394 = call i32(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$type_size.i.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5392, %m2859$.Type.type* %.tmp5393)
%.tmp5395 = sub i32 %.tmp5391, %.tmp5394
store i32 %.tmp5395, i32* %padding.5369
%.tmp5396 = load i32, i32* %expect_fields.5370
%.tmp5397 = add i32 %.tmp5396, 1
store i32 %.tmp5397, i32* %expect_fields.5370
%.tmp5398 = load %m2859$.Type.type*, %m2859$.Type.type** %f.5377
%.tmp5399 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5398, i32 0, i32 4
%.tmp5400 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5399
store %m2859$.Type.type* %.tmp5400, %m2859$.Type.type** %f.5377
br label %.for.start.5371
.for.end.5371:
%.tmp5402 = getelementptr [13 x i8], [13 x i8]*@.str5401, i32 0, i32 0
%.tmp5403 = load i32, i32* %padding.5369
%.tmp5404 = call i32(i8*,...) @printf(i8* %.tmp5402, i32 %.tmp5403)
%.tmp5405 = load %m996$.Node.type*, %m996$.Node.type** %args.5290
%.tmp5406 = icmp ne %m996$.Node.type* %.tmp5405, null
br i1 %.tmp5406, label %.if.true.5407, label %.if.false.5407
.if.true.5407:
%.tmp5408 = load %m996$.Node.type*, %m996$.Node.type** %args.5290
%.tmp5409 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5408, i32 0, i32 8
%.tmp5410 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5409
%.tmp5412 = getelementptr [11 x i8], [11 x i8]*@.str5411, i32 0, i32 0
%.tmp5413 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5410, i8* %.tmp5412)
%start.5414 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5413, %m996$.Node.type** %start.5414
%.tmp5416 = load %m996$.Node.type*, %m996$.Node.type** %start.5414
%pp.5417 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5416, %m996$.Node.type** %pp.5417
br label %.for.start.5415
.for.start.5415:
%.tmp5418 = load %m996$.Node.type*, %m996$.Node.type** %pp.5417
%.tmp5419 = icmp ne %m996$.Node.type* %.tmp5418, null
br i1 %.tmp5419, label %.for.continue.5415, label %.for.end.5415
.for.continue.5415:
%.tmp5420 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5421 = load %m996$.Node.type*, %m996$.Node.type** %pp.5417
%.tmp5422 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp5420, %m996$.Node.type* %.tmp5421)
%tmp_a.5423 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp5422, %m2859$.AssignableInfo.type** %tmp_a.5423
%.tmp5424 = getelementptr i8*, i8** %buf_types.5354, i32 0
%.tmp5426 = getelementptr [6 x i8], [6 x i8]*@.str5425, i32 0, i32 0
%.tmp5427 = load i8*, i8** %buf_types.5354
%.tmp5428 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5429 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %tmp_a.5423
%.tmp5430 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5429, i32 0, i32 4
%.tmp5431 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5430
%.tmp5432 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5428, %m2859$.Type.type* %.tmp5431)
%.tmp5433 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5424, i8* %.tmp5426, i8* %.tmp5427, i8* %.tmp5432)
%.tmp5434 = getelementptr i8*, i8** %buf_values.5357, i32 0
%.tmp5436 = getelementptr [9 x i8], [9 x i8]*@.str5435, i32 0, i32 0
%.tmp5437 = load i8*, i8** %buf_values.5357
%.tmp5438 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5439 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %tmp_a.5423
%.tmp5440 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5439, i32 0, i32 4
%.tmp5441 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5440
%.tmp5442 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5438, %m2859$.Type.type* %.tmp5441)
%.tmp5443 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %tmp_a.5423
%.tmp5444 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp5443)
%.tmp5445 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5434, i8* %.tmp5436, i8* %.tmp5437, i8* %.tmp5442, i8* %.tmp5444)
%.tmp5446 = load %m996$.Node.type*, %m996$.Node.type** %pp.5417
%.tmp5447 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5446, i32 0, i32 9
%.tmp5448 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5447
store %m996$.Node.type* %.tmp5448, %m996$.Node.type** %pp.5417
%.tmp5449 = load %m996$.Node.type*, %m996$.Node.type** %pp.5417
%.tmp5451 = getelementptr [11 x i8], [11 x i8]*@.str5450, i32 0, i32 0
%.tmp5452 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5449, i8* %.tmp5451)
store %m996$.Node.type* %.tmp5452, %m996$.Node.type** %pp.5417
br label %.for.start.5415
.for.end.5415:
br label %.if.end.5407
.if.false.5407:
%.tmp5453 = load i32, i32* %expect_fields.5370
%.tmp5454 = icmp sgt i32 %.tmp5453, 0
br i1 %.tmp5454, label %.if.true.5455, label %.if.false.5455
.if.true.5455:
%.tmp5457 = getelementptr [7 x i8], [7 x i8]*@.str5456, i32 0, i32 0
%.tmp5458 = call i32(i8*,...) @printf(i8* %.tmp5457)
%.tmp5459 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp5459
br label %.if.end.5455
.if.false.5455:
br label %.if.end.5455
.if.end.5455:
br label %.if.end.5407
.if.end.5407:
%.tmp5460 = load i32, i32* %padding.5369
%.tmp5461 = icmp sgt i32 %.tmp5460, 0
br i1 %.tmp5461, label %.if.true.5462, label %.if.false.5462
.if.true.5462:
%.tmp5463 = getelementptr i8*, i8** %buf_types.5354, i32 0
%.tmp5465 = getelementptr [7 x i8], [7 x i8]*@.str5464, i32 0, i32 0
%.tmp5466 = load i8*, i8** %buf_types.5354
%.tmp5467 = load i32, i32* %padding.5369
%.tmp5468 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5463, i8* %.tmp5465, i8* %.tmp5466, i32 %.tmp5467)
%.tmp5469 = getelementptr i8*, i8** %buf_values.5357, i32 0
%.tmp5471 = getelementptr [9 x i8], [9 x i8]*@.str5470, i32 0, i32 0
%.tmp5472 = load i8*, i8** %buf_values.5357
%.tmp5473 = load i32, i32* %padding.5369
%.tmp5474 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5469, i8* %.tmp5471, i8* %.tmp5472, i32 %.tmp5473)
br label %.if.end.5462
.if.false.5462:
br label %.if.end.5462
.if.end.5462:
%.tmp5475 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5476 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp5475)
%a.5477 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp5476, %m2859$.AssignableInfo.type** %a.5477
%.tmp5478 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5479 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a.5477
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp5478, %m2859$.AssignableInfo.type* %.tmp5479)
%.tmp5480 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a.5477
%.tmp5481 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5480, i32 0, i32 4
%.tmp5482 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5483 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5482, i32 0, i32 4
%.tmp5484 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5483
store %m2859$.Type.type* %.tmp5484, %m2859$.Type.type** %.tmp5481
%.tmp5485 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5486 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp5485, i32 0, i32 1
%.tmp5487 = load %m0$.File.type*, %m0$.File.type** %.tmp5486
%.tmp5489 = getelementptr [21 x i8], [21 x i8]*@.str5488, i32 0, i32 0
%.tmp5490 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a.5477
%.tmp5491 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp5490)
%.tmp5492 = load i8*, i8** %buf_types.5354
%.tmp5493 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5487, i8* %.tmp5489, i8* %.tmp5491, i8* %.tmp5492)
%.tmp5494 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5495 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp5494, i32 0, i32 1
%.tmp5496 = load %m0$.File.type*, %m0$.File.type** %.tmp5495
%.tmp5498 = getelementptr [34 x i8], [34 x i8]*@.str5497, i32 0, i32 0
%.tmp5499 = load i8*, i8** %buf_types.5354
%.tmp5500 = load i32, i32* %field_id.5309
%.tmp5501 = load i8*, i8** %buf_values.5357
%.tmp5502 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5503 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a.5477
%.tmp5504 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5503, i32 0, i32 4
%.tmp5505 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5504
%.tmp5506 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5502, %m2859$.Type.type* %.tmp5505)
%.tmp5507 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a.5477
%.tmp5508 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp5507)
%.tmp5509 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5496, i8* %.tmp5498, i8* %.tmp5499, i32 %.tmp5500, i8* %.tmp5501, i8* %.tmp5506, i8* %.tmp5508)
%.tmp5510 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5511 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp5510, i32 0, i32 1
%.tmp5512 = load %m0$.File.type*, %m0$.File.type** %.tmp5511
%.tmp5514 = getelementptr [33 x i8], [33 x i8]*@.str5513, i32 0, i32 0
%.tmp5515 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5512, i8* %.tmp5514)
%.tmp5516 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5517 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp5516, i32 0, i32 1
%.tmp5518 = load %m0$.File.type*, %m0$.File.type** %.tmp5517
%.tmp5520 = getelementptr [24 x i8], [24 x i8]*@.str5519, i32 0, i32 0
%.tmp5521 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5518, i8* %.tmp5520)
%.tmp5522 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a.5477
ret %m2859$.AssignableInfo.type* %.tmp5522
br label %.if.end.5300
.if.false.5300:
br label %.if.end.5300
.if.end.5300:
%.tmp5524 = getelementptr [1 x i8], [1 x i8]*@.str5523, i32 0, i32 0
%params_buff.5525 = alloca i8*
store i8* %.tmp5524, i8** %params_buff.5525
%.tmp5527 = getelementptr [1 x i8], [1 x i8]*@.str5526, i32 0, i32 0
%tmp.5528 = alloca i8*
store i8* %.tmp5527, i8** %tmp.5528
%.tmp5529 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5530 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5529, i32 0, i32 4
%.tmp5531 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5530
%.tmp5532 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5531, i32 0, i32 0
%.tmp5533 = load i8*, i8** %.tmp5532
%.tmp5535 = getelementptr [4 x i8], [4 x i8]*@.str5534, i32 0, i32 0
%.tmp5536 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5533, i8* %.tmp5535)
%.tmp5537 = icmp eq i32 %.tmp5536, 0
br i1 %.tmp5537, label %.if.true.5538, label %.if.false.5538
.if.true.5538:
%.tmp5539 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5540 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp5539)
%new_info.5541 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp5540, %m2859$.AssignableInfo.type** %new_info.5541
%.tmp5542 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5543 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_info.5541
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp5542, %m2859$.AssignableInfo.type* %.tmp5543)
%.tmp5544 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_info.5541
%.tmp5545 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5544, i32 0, i32 4
%.tmp5546 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5547 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5546, i32 0, i32 4
%.tmp5548 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5547
%.tmp5549 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5548, i32 0, i32 3
%.tmp5550 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5549
store %m2859$.Type.type* %.tmp5550, %m2859$.Type.type** %.tmp5545
%.tmp5551 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5552 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp5551, i32 0, i32 1
%.tmp5553 = load %m0$.File.type*, %m0$.File.type** %.tmp5552
%.tmp5555 = getelementptr [22 x i8], [22 x i8]*@.str5554, i32 0, i32 0
%.tmp5556 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_info.5541
%.tmp5557 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp5556)
%.tmp5558 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5559 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5560 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5559, i32 0, i32 4
%.tmp5561 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5560
%.tmp5562 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5558, %m2859$.Type.type* %.tmp5561)
%.tmp5563 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5564 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5565 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5564, i32 0, i32 4
%.tmp5566 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5565
%.tmp5567 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5563, %m2859$.Type.type* %.tmp5566)
%.tmp5568 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5569 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp5568)
%.tmp5570 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5553, i8* %.tmp5555, i8* %.tmp5557, i8* %.tmp5562, i8* %.tmp5567, i8* %.tmp5569)
%.tmp5571 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_info.5541
store %m2859$.AssignableInfo.type* %.tmp5571, %m2859$.AssignableInfo.type** %info.5266
br label %.if.end.5538
.if.false.5538:
br label %.if.end.5538
.if.end.5538:
%.tmp5572 = load %m996$.Node.type*, %m996$.Node.type** %args.5290
%.tmp5573 = icmp ne %m996$.Node.type* %.tmp5572, null
br i1 %.tmp5573, label %.if.true.5574, label %.if.false.5574
.if.true.5574:
%.tmp5575 = load %m996$.Node.type*, %m996$.Node.type** %args.5290
%.tmp5576 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5575, i32 0, i32 8
%.tmp5577 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5576
%.tmp5579 = getelementptr [11 x i8], [11 x i8]*@.str5578, i32 0, i32 0
%.tmp5580 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5577, i8* %.tmp5579)
%start.5581 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5580, %m996$.Node.type** %start.5581
%argno.5582 = alloca i32
store i32 1, i32* %argno.5582
%.tmp5583 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5584 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5583, i32 0, i32 4
%.tmp5585 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5584
%.tmp5586 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5585, i32 0, i32 3
%.tmp5587 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5586
%.tmp5588 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5587, i32 0, i32 4
%.tmp5589 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5588
%expect_type.5590 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp5589, %m2859$.Type.type** %expect_type.5590
%provided_args.5591 = alloca i32
store i32 0, i32* %provided_args.5591
%.tmp5593 = load %m996$.Node.type*, %m996$.Node.type** %start.5581
%pp.5594 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5593, %m996$.Node.type** %pp.5594
br label %.for.start.5592
.for.start.5592:
%.tmp5595 = load %m996$.Node.type*, %m996$.Node.type** %pp.5594
%.tmp5596 = icmp ne %m996$.Node.type* %.tmp5595, null
br i1 %.tmp5596, label %.for.continue.5592, label %.for.end.5592
.for.continue.5592:
%.tmp5597 = load i32, i32* %provided_args.5591
%.tmp5598 = add i32 %.tmp5597, 1
store i32 %.tmp5598, i32* %provided_args.5591
%.tmp5599 = load %m996$.Node.type*, %m996$.Node.type** %pp.5594
%.tmp5600 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5599, i32 0, i32 9
%.tmp5601 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5600
%.tmp5603 = getelementptr [11 x i8], [11 x i8]*@.str5602, i32 0, i32 0
%.tmp5604 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5601, i8* %.tmp5603)
store %m996$.Node.type* %.tmp5604, %m996$.Node.type** %pp.5594
br label %.for.start.5592
.for.end.5592:
%.tmp5606 = load %m996$.Node.type*, %m996$.Node.type** %start.5581
%pp.5607 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5606, %m996$.Node.type** %pp.5607
br label %.for.start.5605
.for.start.5605:
%.tmp5608 = load %m996$.Node.type*, %m996$.Node.type** %pp.5607
%.tmp5609 = icmp ne %m996$.Node.type* %.tmp5608, null
br i1 %.tmp5609, label %.for.continue.5605, label %.for.end.5605
.for.continue.5605:
%.tmp5610 = load %m2859$.Type.type*, %m2859$.Type.type** %expect_type.5590
%.tmp5611 = icmp eq %m2859$.Type.type* %.tmp5610, null
br i1 %.tmp5611, label %.if.true.5612, label %.if.false.5612
.if.true.5612:
%.tmp5613 = getelementptr i8*, i8** %tmp.5528, i32 0
%.tmp5615 = getelementptr [43 x i8], [43 x i8]*@.str5614, i32 0, i32 0
%.tmp5616 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5617 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5616, i32 0, i32 2
%.tmp5618 = load i8*, i8** %.tmp5617
%.tmp5619 = load i32, i32* %argno.5582
%.tmp5620 = sub i32 %.tmp5619, 1
%.tmp5621 = load i32, i32* %provided_args.5591
%.tmp5622 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5613, i8* %.tmp5615, i8* %.tmp5618, i32 %.tmp5620, i32 %.tmp5621)
%.tmp5623 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5624 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5625 = load i8*, i8** %tmp.5528
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp5623, %m996$.Node.type* %.tmp5624, i8* %.tmp5625)
%.tmp5626 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp5626
br label %.if.end.5612
.if.false.5612:
br label %.if.end.5612
.if.end.5612:
%.tmp5627 = load %m996$.Node.type*, %m996$.Node.type** %pp.5607
%.tmp5628 = load %m996$.Node.type*, %m996$.Node.type** %start.5581
%.tmp5629 = icmp ne %m996$.Node.type* %.tmp5627, %.tmp5628
br i1 %.tmp5629, label %.if.true.5630, label %.if.false.5630
.if.true.5630:
%.tmp5631 = getelementptr i8*, i8** %tmp.5528, i32 0
%.tmp5633 = getelementptr [5 x i8], [5 x i8]*@.str5632, i32 0, i32 0
%.tmp5634 = load i8*, i8** %params_buff.5525
%.tmp5635 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5631, i8* %.tmp5633, i8* %.tmp5634)
%.tmp5636 = load i8*, i8** %params_buff.5525
%tmp_buff.5637 = alloca i8*
store i8* %.tmp5636, i8** %tmp_buff.5637
%.tmp5638 = load i8*, i8** %tmp.5528
store i8* %.tmp5638, i8** %params_buff.5525
%.tmp5639 = load i8*, i8** %tmp_buff.5637
store i8* %.tmp5639, i8** %tmp.5528
%.tmp5640 = load i8*, i8** %tmp.5528
call void(i8*) @free(i8* %.tmp5640)
br label %.if.end.5630
.if.false.5630:
br label %.if.end.5630
.if.end.5630:
%.tmp5641 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5642 = load %m996$.Node.type*, %m996$.Node.type** %pp.5607
%.tmp5643 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp5641, %m996$.Node.type* %.tmp5642)
%a_info.5644 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp5643, %m2859$.AssignableInfo.type** %a_info.5644
%.tmp5645 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.5644
%.tmp5646 = icmp eq %m2859$.AssignableInfo.type* %.tmp5645, null
br i1 %.tmp5646, label %.if.true.5647, label %.if.false.5647
.if.true.5647:
%.tmp5648 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp5648
br label %.if.end.5647
.if.false.5647:
br label %.if.end.5647
.if.end.5647:
%.tmp5649 = load %m2859$.Type.type*, %m2859$.Type.type** %expect_type.5590
%.tmp5650 = call %m2859$.Type.type*(%m2859$.Type.type*) @m311$type_clone.m2859$.Type.typep.m2859$.Type.typep(%m2859$.Type.type* %.tmp5649)
%exp.5651 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp5650, %m2859$.Type.type** %exp.5651
%.tmp5652 = load %m2859$.Type.type*, %m2859$.Type.type** %exp.5651
%.tmp5653 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5652, i32 0, i32 4
store %m2859$.Type.type* null, %m2859$.Type.type** %.tmp5653
%.tmp5654 = load %m2859$.Type.type*, %m2859$.Type.type** %expect_type.5590
%.tmp5655 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5654, i32 0, i32 0
%.tmp5656 = load i8*, i8** %.tmp5655
%.tmp5658 = getelementptr [7 x i8], [7 x i8]*@.str5657, i32 0, i32 0
%.tmp5659 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5656, i8* %.tmp5658)
%.tmp5660 = icmp ne i32 %.tmp5659, 0
%.tmp5661 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5662 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.5644
%.tmp5663 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5662, i32 0, i32 4
%.tmp5664 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5663
%.tmp5665 = load %m2859$.Type.type*, %m2859$.Type.type** %exp.5651
%.tmp5666 = call i1(%m2859$.CompilerCtx.type*,%m2859$.Type.type*,%m2859$.Type.type*) @m2860$cmp.b.m2859$.CompilerCtx.typep.m2859$.Type.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5661, %m2859$.Type.type* %.tmp5664, %m2859$.Type.type* %.tmp5665)
%.tmp5667 = icmp eq i1 %.tmp5666, 0
%.tmp5668 = and i1 %.tmp5660, %.tmp5667
br i1 %.tmp5668, label %.if.true.5669, label %.if.false.5669
.if.true.5669:
%.tmp5671 = getelementptr [1 x i8], [1 x i8]*@.str5670, i32 0, i32 0
%err_buf.5672 = alloca i8*
store i8* %.tmp5671, i8** %err_buf.5672
%.tmp5673 = getelementptr i8*, i8** %err_buf.5672, i32 0
%.tmp5675 = getelementptr [58 x i8], [58 x i8]*@.str5674, i32 0, i32 0
%.tmp5676 = load i32, i32* %argno.5582
%.tmp5677 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5678 = load %m2859$.Type.type*, %m2859$.Type.type** %exp.5651
%.tmp5679 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5677, %m2859$.Type.type* %.tmp5678)
%.tmp5680 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5681 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.5644
%.tmp5682 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5681, i32 0, i32 4
%.tmp5683 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5682
%.tmp5684 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5680, %m2859$.Type.type* %.tmp5683)
%.tmp5685 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5673, i8* %.tmp5675, i32 %.tmp5676, i8* %.tmp5679, i8* %.tmp5684)
%.tmp5686 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5687 = load %m996$.Node.type*, %m996$.Node.type** %pp.5607
%.tmp5688 = load i8*, i8** %err_buf.5672
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp5686, %m996$.Node.type* %.tmp5687, i8* %.tmp5688)
%.tmp5689 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp5689
br label %.if.end.5669
.if.false.5669:
br label %.if.end.5669
.if.end.5669:
%.tmp5690 = getelementptr i8*, i8** %params_buff.5525, i32 0
%.tmp5692 = getelementptr [8 x i8], [8 x i8]*@.str5691, i32 0, i32 0
%.tmp5693 = load i8*, i8** %params_buff.5525
%.tmp5694 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5695 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.5644
%.tmp5696 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5695, i32 0, i32 4
%.tmp5697 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5696
%.tmp5698 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5694, %m2859$.Type.type* %.tmp5697)
%.tmp5699 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.5644
%.tmp5700 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp5699)
%.tmp5701 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5690, i8* %.tmp5692, i8* %.tmp5693, i8* %.tmp5698, i8* %.tmp5700)
%.tmp5702 = load %m996$.Node.type*, %m996$.Node.type** %pp.5607
%.tmp5703 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5702, i32 0, i32 9
%.tmp5704 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5703
store %m996$.Node.type* %.tmp5704, %m996$.Node.type** %pp.5607
%.tmp5705 = load %m2859$.Type.type*, %m2859$.Type.type** %expect_type.5590
%.tmp5706 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5705, i32 0, i32 0
%.tmp5707 = load i8*, i8** %.tmp5706
%.tmp5709 = getelementptr [7 x i8], [7 x i8]*@.str5708, i32 0, i32 0
%.tmp5710 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5707, i8* %.tmp5709)
%.tmp5711 = icmp ne i32 %.tmp5710, 0
br i1 %.tmp5711, label %.if.true.5712, label %.if.false.5712
.if.true.5712:
%.tmp5713 = load %m2859$.Type.type*, %m2859$.Type.type** %expect_type.5590
%.tmp5714 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5713, i32 0, i32 4
%.tmp5715 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5714
store %m2859$.Type.type* %.tmp5715, %m2859$.Type.type** %expect_type.5590
br label %.if.end.5712
.if.false.5712:
br label %.if.end.5712
.if.end.5712:
%.tmp5716 = load i32, i32* %argno.5582
%.tmp5717 = add i32 %.tmp5716, 1
store i32 %.tmp5717, i32* %argno.5582
%.tmp5718 = load %m996$.Node.type*, %m996$.Node.type** %pp.5607
%.tmp5720 = getelementptr [11 x i8], [11 x i8]*@.str5719, i32 0, i32 0
%.tmp5721 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5718, i8* %.tmp5720)
store %m996$.Node.type* %.tmp5721, %m996$.Node.type** %pp.5607
br label %.for.start.5605
.for.end.5605:
%.tmp5722 = load %m2859$.Type.type*, %m2859$.Type.type** %expect_type.5590
%.tmp5723 = icmp ne %m2859$.Type.type* %.tmp5722, null
br i1 %.tmp5723, label %.if.true.5724, label %.if.false.5724
.if.true.5724:
%.tmp5725 = load %m2859$.Type.type*, %m2859$.Type.type** %expect_type.5590
%.tmp5726 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5725, i32 0, i32 0
%.tmp5727 = load i8*, i8** %.tmp5726
%.tmp5729 = getelementptr [7 x i8], [7 x i8]*@.str5728, i32 0, i32 0
%.tmp5730 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5727, i8* %.tmp5729)
%.tmp5731 = icmp ne i32 %.tmp5730, 0
br i1 %.tmp5731, label %.if.true.5732, label %.if.false.5732
.if.true.5732:
%.tmp5733 = getelementptr i8*, i8** %tmp.5528, i32 0
%.tmp5735 = getelementptr [43 x i8], [43 x i8]*@.str5734, i32 0, i32 0
%.tmp5736 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5737 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5736, i32 0, i32 2
%.tmp5738 = load i8*, i8** %.tmp5737
%.tmp5739 = load i32, i32* %argno.5582
%.tmp5740 = load i32, i32* %provided_args.5591
%.tmp5741 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5733, i8* %.tmp5735, i8* %.tmp5738, i32 %.tmp5739, i32 %.tmp5740)
%.tmp5742 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5743 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5744 = load i8*, i8** %tmp.5528
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp5742, %m996$.Node.type* %.tmp5743, i8* %.tmp5744)
%.tmp5745 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp5745
br label %.if.end.5732
.if.false.5732:
br label %.if.end.5732
.if.end.5732:
br label %.if.end.5724
.if.false.5724:
br label %.if.end.5724
.if.end.5724:
br label %.if.end.5574
.if.false.5574:
%.tmp5746 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5747 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5746, i32 0, i32 4
%.tmp5748 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5747
%.tmp5749 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5748, i32 0, i32 3
%.tmp5750 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5749
%.tmp5751 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5750, i32 0, i32 4
%.tmp5752 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5751
%.tmp5753 = icmp ne %m2859$.Type.type* %.tmp5752, null
br i1 %.tmp5753, label %.if.true.5754, label %.if.false.5754
.if.true.5754:
%args_required.5755 = alloca i32
store i32 0, i32* %args_required.5755
%.tmp5757 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5758 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5757, i32 0, i32 4
%.tmp5759 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5758
%.tmp5760 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5759, i32 0, i32 3
%.tmp5761 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5760
%.tmp5762 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5761, i32 0, i32 4
%.tmp5763 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5762
%pp.5764 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp5763, %m2859$.Type.type** %pp.5764
br label %.for.start.5756
.for.start.5756:
%.tmp5765 = load %m2859$.Type.type*, %m2859$.Type.type** %pp.5764
%.tmp5766 = icmp ne %m2859$.Type.type* %.tmp5765, null
br i1 %.tmp5766, label %.for.continue.5756, label %.for.else.5756
.for.continue.5756:
%.tmp5767 = load %m2859$.Type.type*, %m2859$.Type.type** %pp.5764
%.tmp5768 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5767, i32 0, i32 0
%.tmp5769 = load i8*, i8** %.tmp5768
%.tmp5771 = getelementptr [7 x i8], [7 x i8]*@.str5770, i32 0, i32 0
%.tmp5772 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5769, i8* %.tmp5771)
%.tmp5773 = icmp eq i32 %.tmp5772, 0
br i1 %.tmp5773, label %.if.true.5774, label %.if.false.5774
.if.true.5774:
br label %.for.end.5756
br label %.if.end.5774
.if.false.5774:
br label %.if.end.5774
.if.end.5774:
%.tmp5775 = load i32, i32* %args_required.5755
%.tmp5776 = add i32 %.tmp5775, 1
store i32 %.tmp5776, i32* %args_required.5755
%.tmp5777 = load %m2859$.Type.type*, %m2859$.Type.type** %pp.5764
%.tmp5778 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5777, i32 0, i32 4
%.tmp5779 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5778
store %m2859$.Type.type* %.tmp5779, %m2859$.Type.type** %pp.5764
br label %.for.start.5756
.for.else.5756:
%.tmp5780 = getelementptr i8*, i8** %tmp.5528, i32 0
%.tmp5782 = getelementptr [42 x i8], [42 x i8]*@.str5781, i32 0, i32 0
%.tmp5783 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5784 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5783, i32 0, i32 2
%.tmp5785 = load i8*, i8** %.tmp5784
%.tmp5786 = load i32, i32* %args_required.5755
%.tmp5787 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5780, i8* %.tmp5782, i8* %.tmp5785, i32 %.tmp5786)
%.tmp5788 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5789 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5790 = load i8*, i8** %tmp.5528
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp5788, %m996$.Node.type* %.tmp5789, i8* %.tmp5790)
%.tmp5791 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp5791
br label %.for.end.5756
.for.end.5756:
br label %.if.end.5754
.if.false.5754:
br label %.if.end.5754
.if.end.5754:
br label %.if.end.5574
.if.end.5574:
%.tmp5792 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5793 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5794 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5793, i32 0, i32 4
%.tmp5795 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5794
%.tmp5796 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5795, i32 0, i32 3
%.tmp5797 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5796
%.tmp5798 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5792, %m2859$.Type.type* %.tmp5797)
%.tmp5800 = getelementptr [5 x i8], [5 x i8]*@.str5799, i32 0, i32 0
%.tmp5801 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5798, i8* %.tmp5800)
%.tmp5802 = icmp eq i32 %.tmp5801, 0
br i1 %.tmp5802, label %.if.true.5803, label %.if.false.5803
.if.true.5803:
%.tmp5804 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5805 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp5804, i32 0, i32 1
%.tmp5806 = load %m0$.File.type*, %m0$.File.type** %.tmp5805
%.tmp5808 = getelementptr [16 x i8], [16 x i8]*@.str5807, i32 0, i32 0
%.tmp5809 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5810 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5811 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5810, i32 0, i32 4
%.tmp5812 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5811
%.tmp5813 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5809, %m2859$.Type.type* %.tmp5812)
%.tmp5814 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5815 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp5814)
%.tmp5816 = load i8*, i8** %params_buff.5525
%.tmp5817 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5806, i8* %.tmp5808, i8* %.tmp5813, i8* %.tmp5815, i8* %.tmp5816)
%.tmp5818 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp5818
br label %.if.end.5803
.if.false.5803:
br label %.if.end.5803
.if.end.5803:
%.tmp5819 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5820 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp5819)
%call_info.5821 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp5820, %m2859$.AssignableInfo.type** %call_info.5821
%.tmp5822 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5823 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %call_info.5821
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp5822, %m2859$.AssignableInfo.type* %.tmp5823)
%.tmp5824 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %call_info.5821
%.tmp5825 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5824, i32 0, i32 4
%.tmp5826 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5827 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5826, i32 0, i32 4
%.tmp5828 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5827
%.tmp5829 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5828, i32 0, i32 3
%.tmp5830 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5829
%.tmp5831 = call %m2859$.Type.type*(%m2859$.Type.type*) @m311$type_clone.m2859$.Type.typep.m2859$.Type.typep(%m2859$.Type.type* %.tmp5830)
store %m2859$.Type.type* %.tmp5831, %m2859$.Type.type** %.tmp5825
%.tmp5832 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %call_info.5821
%.tmp5833 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5832, i32 0, i32 4
%.tmp5834 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5833
%.tmp5835 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp5834, i32 0, i32 4
store %m2859$.Type.type* null, %m2859$.Type.type** %.tmp5835
%.tmp5836 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5837 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp5836, i32 0, i32 1
%.tmp5838 = load %m0$.File.type*, %m0$.File.type** %.tmp5837
%.tmp5840 = getelementptr [21 x i8], [21 x i8]*@.str5839, i32 0, i32 0
%.tmp5841 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %call_info.5821
%.tmp5842 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp5841)
%.tmp5843 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5844 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5845 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5844, i32 0, i32 4
%.tmp5846 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5845
%.tmp5847 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5843, %m2859$.Type.type* %.tmp5846)
%.tmp5848 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5266
%.tmp5849 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp5848)
%.tmp5850 = load i8*, i8** %params_buff.5525
%.tmp5851 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5838, i8* %.tmp5840, i8* %.tmp5842, i8* %.tmp5847, i8* %.tmp5849, i8* %.tmp5850)
%.tmp5852 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %call_info.5821
%.tmp5853 = bitcast %m2859$.AssignableInfo.type* %.tmp5852 to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp5853
}
define void @m311$compile_expression.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp5855 = getelementptr [1 x i8], [1 x i8]*@.str5854, i32 0, i32 0
%err_msg.5856 = alloca i8*
store i8* %.tmp5855, i8** %err_msg.5856
%.tmp5857 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5858 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5857, i32 0, i32 0
%.tmp5859 = load i8*, i8** %.tmp5858
%expr_type.5860 = alloca i8*
store i8* %.tmp5859, i8** %expr_type.5860
%.tmp5861 = bitcast ptr null to %m2859$.AssignableInfo.type*
%info.5862 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp5861, %m2859$.AssignableInfo.type** %info.5862
%assignable.5863 = alloca %m996$.Node.type*
store %m996$.Node.type* null, %m996$.Node.type** %assignable.5863
%.tmp5864 = bitcast ptr null to %m2859$.AssignableInfo.type*
%a_info.5865 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp5864, %m2859$.AssignableInfo.type** %a_info.5865
%.tmp5866 = load i8*, i8** %expr_type.5860
%.tmp5868 = getelementptr [7 x i8], [7 x i8]*@.str5867, i32 0, i32 0
%.tmp5869 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5866, i8* %.tmp5868)
%.tmp5870 = icmp eq i32 %.tmp5869, 0
br i1 %.tmp5870, label %.if.true.5871, label %.if.false.5871
.if.true.5871:
%.tmp5872 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5874 = getelementptr [9 x i8], [9 x i8]*@.str5873, i32 0, i32 0
%.tmp5875 = call %m2859$.Scope.type*(%m2859$.CompilerCtx.type*,i8*) @m311$get_scope.m2859$.Scope.typep.m2859$.CompilerCtx.typep.cp(%m2859$.CompilerCtx.type* %.tmp5872, i8* %.tmp5874)
%fn_scope.5876 = alloca %m2859$.Scope.type*
store %m2859$.Scope.type* %.tmp5875, %m2859$.Scope.type** %fn_scope.5876
%.tmp5877 = load %m2859$.Scope.type*, %m2859$.Scope.type** %fn_scope.5876
%.tmp5878 = icmp eq %m2859$.Scope.type* %.tmp5877, null
br i1 %.tmp5878, label %.if.true.5879, label %.if.false.5879
.if.true.5879:
%.tmp5880 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5881 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5883 = getelementptr [40 x i8], [40 x i8]*@.str5882, i32 0, i32 0
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp5880, %m996$.Node.type* %.tmp5881, i8* %.tmp5883)
ret void
br label %.if.end.5879
.if.false.5879:
br label %.if.end.5879
.if.end.5879:
%.tmp5884 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5885 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5884, i32 0, i32 8
%.tmp5886 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5885
%.tmp5887 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5886, i32 0, i32 9
%.tmp5888 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5887
%.tmp5889 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5888, i32 0, i32 0
%.tmp5890 = load i8*, i8** %.tmp5889
%.tmp5892 = getelementptr [3 x i8], [3 x i8]*@.str5891, i32 0, i32 0
%.tmp5893 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5890, i8* %.tmp5892)
%.tmp5894 = icmp ne i32 %.tmp5893, 0
br i1 %.tmp5894, label %.if.true.5895, label %.if.false.5895
.if.true.5895:
%.tmp5896 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5897 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5898 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5897, i32 0, i32 8
%.tmp5899 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5898
%.tmp5900 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5899, i32 0, i32 9
%.tmp5901 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5900
%.tmp5902 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp5896, %m996$.Node.type* %.tmp5901)
store %m2859$.AssignableInfo.type* %.tmp5902, %m2859$.AssignableInfo.type** %info.5862
%.tmp5903 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5862
%.tmp5904 = icmp eq %m2859$.AssignableInfo.type* %.tmp5903, null
br i1 %.tmp5904, label %.if.true.5905, label %.if.false.5905
.if.true.5905:
ret void
br label %.if.end.5905
.if.false.5905:
br label %.if.end.5905
.if.end.5905:
%.tmp5906 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5907 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5862
%.tmp5908 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5907, i32 0, i32 4
%.tmp5909 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5908
%.tmp5910 = load %m2859$.Scope.type*, %m2859$.Scope.type** %fn_scope.5876
%.tmp5911 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp5910, i32 0, i32 6
%.tmp5912 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5911
%.tmp5913 = call i1(%m2859$.CompilerCtx.type*,%m2859$.Type.type*,%m2859$.Type.type*) @m2860$cmp.b.m2859$.CompilerCtx.typep.m2859$.Type.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5906, %m2859$.Type.type* %.tmp5909, %m2859$.Type.type* %.tmp5912)
%.tmp5914 = icmp eq i1 %.tmp5913, 0
br i1 %.tmp5914, label %.if.true.5915, label %.if.false.5915
.if.true.5915:
%.tmp5917 = getelementptr [1 x i8], [1 x i8]*@.str5916, i32 0, i32 0
%buf.5918 = alloca i8*
store i8* %.tmp5917, i8** %buf.5918
%.tmp5919 = getelementptr i8*, i8** %buf.5918, i32 0
%.tmp5921 = getelementptr [67 x i8], [67 x i8]*@.str5920, i32 0, i32 0
%.tmp5922 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5923 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5862
%.tmp5924 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5923, i32 0, i32 4
%.tmp5925 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5924
%.tmp5926 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5922, %m2859$.Type.type* %.tmp5925)
%.tmp5927 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5928 = load %m2859$.Scope.type*, %m2859$.Scope.type** %fn_scope.5876
%.tmp5929 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp5928, i32 0, i32 6
%.tmp5930 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5929
%.tmp5931 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5927, %m2859$.Type.type* %.tmp5930)
%.tmp5932 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5919, i8* %.tmp5921, i8* %.tmp5926, i8* %.tmp5931)
%.tmp5933 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5934 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5935 = load i8*, i8** %buf.5918
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp5933, %m996$.Node.type* %.tmp5934, i8* %.tmp5935)
ret void
br label %.if.end.5915
.if.false.5915:
br label %.if.end.5915
.if.end.5915:
%.tmp5936 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5937 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp5936, i32 0, i32 1
%.tmp5938 = load %m0$.File.type*, %m0$.File.type** %.tmp5937
%.tmp5940 = getelementptr [11 x i8], [11 x i8]*@.str5939, i32 0, i32 0
%.tmp5941 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5942 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5862
%.tmp5943 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp5942, i32 0, i32 4
%.tmp5944 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp5943
%.tmp5945 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp5941, %m2859$.Type.type* %.tmp5944)
%.tmp5946 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.5862
%.tmp5947 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp5946)
%.tmp5948 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5938, i8* %.tmp5940, i8* %.tmp5945, i8* %.tmp5947)
br label %.if.end.5895
.if.false.5895:
%.tmp5949 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5950 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp5949, i32 0, i32 1
%.tmp5951 = load %m0$.File.type*, %m0$.File.type** %.tmp5950
%.tmp5953 = getelementptr [10 x i8], [10 x i8]*@.str5952, i32 0, i32 0
%.tmp5954 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5951, i8* %.tmp5953)
br label %.if.end.5895
.if.end.5895:
br label %.if.end.5871
.if.false.5871:
%.tmp5955 = load i8*, i8** %expr_type.5860
%.tmp5957 = getelementptr [3 x i8], [3 x i8]*@.str5956, i32 0, i32 0
%.tmp5958 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5955, i8* %.tmp5957)
%.tmp5959 = icmp eq i32 %.tmp5958, 0
br i1 %.tmp5959, label %.if.true.5960, label %.if.false.5960
.if.true.5960:
br label %.if.end.5960
.if.false.5960:
%.tmp5961 = load i8*, i8** %expr_type.5860
%.tmp5963 = getelementptr [8 x i8], [8 x i8]*@.str5962, i32 0, i32 0
%.tmp5964 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5961, i8* %.tmp5963)
%.tmp5965 = icmp eq i32 %.tmp5964, 0
br i1 %.tmp5965, label %.if.true.5966, label %.if.false.5966
.if.true.5966:
%.tmp5967 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5968 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5969 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5968, i32 0, i32 8
%.tmp5970 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5969
%.tmp5971 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_fn_call.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp5967, %m996$.Node.type* %.tmp5970)
br label %.if.end.5966
.if.false.5966:
%.tmp5972 = load i8*, i8** %expr_type.5860
%.tmp5974 = getelementptr [12 x i8], [12 x i8]*@.str5973, i32 0, i32 0
%.tmp5975 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5972, i8* %.tmp5974)
%.tmp5976 = icmp eq i32 %.tmp5975, 0
br i1 %.tmp5976, label %.if.true.5977, label %.if.false.5977
.if.true.5977:
%.tmp5978 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5979 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5980 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_declaration.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp5978, %m996$.Node.type* %.tmp5979)
br label %.if.end.5977
.if.false.5977:
%.tmp5981 = load i8*, i8** %expr_type.5860
%.tmp5983 = getelementptr [11 x i8], [11 x i8]*@.str5982, i32 0, i32 0
%.tmp5984 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5981, i8* %.tmp5983)
%.tmp5985 = icmp eq i32 %.tmp5984, 0
br i1 %.tmp5985, label %.if.true.5986, label %.if.false.5986
.if.true.5986:
%.tmp5987 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5988 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5987, i32 0, i32 8
%.tmp5989 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5988
%.tmp5991 = getelementptr [11 x i8], [11 x i8]*@.str5990, i32 0, i32 0
%.tmp5992 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5989, i8* %.tmp5991)
store %m996$.Node.type* %.tmp5992, %m996$.Node.type** %assignable.5863
%.tmp5993 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp5994 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5995 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5994, i32 0, i32 8
%.tmp5996 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5995
%.tmp5997 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_addr.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp5993, %m996$.Node.type* %.tmp5996)
%dest.5998 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp5997, %m2859$.AssignableInfo.type** %dest.5998
%.tmp5999 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %dest.5998
%.tmp6000 = icmp eq %m2859$.AssignableInfo.type* %.tmp5999, null
br i1 %.tmp6000, label %.if.true.6001, label %.if.false.6001
.if.true.6001:
ret void
br label %.if.end.6001
.if.false.6001:
br label %.if.end.6001
.if.end.6001:
%.tmp6002 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6003 = load %m996$.Node.type*, %m996$.Node.type** %assignable.5863
%.tmp6004 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp6002, %m996$.Node.type* %.tmp6003)
store %m2859$.AssignableInfo.type* %.tmp6004, %m2859$.AssignableInfo.type** %a_info.5865
%.tmp6005 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.5865
%.tmp6006 = icmp eq %m2859$.AssignableInfo.type* %.tmp6005, null
br i1 %.tmp6006, label %.if.true.6007, label %.if.false.6007
.if.true.6007:
ret void
br label %.if.end.6007
.if.false.6007:
br label %.if.end.6007
.if.end.6007:
%.tmp6008 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6009 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.5865
%.tmp6010 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6009, i32 0, i32 4
%.tmp6011 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6010
%.tmp6012 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %dest.5998
%.tmp6013 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6012, i32 0, i32 4
%.tmp6014 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6013
%.tmp6015 = call i1(%m2859$.CompilerCtx.type*,%m2859$.Type.type*,%m2859$.Type.type*) @m2860$cmp.b.m2859$.CompilerCtx.typep.m2859$.Type.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp6008, %m2859$.Type.type* %.tmp6011, %m2859$.Type.type* %.tmp6014)
%.tmp6016 = icmp eq i1 %.tmp6015, 0
br i1 %.tmp6016, label %.if.true.6017, label %.if.false.6017
.if.true.6017:
%.tmp6019 = getelementptr [1 x i8], [1 x i8]*@.str6018, i32 0, i32 0
%err_buf.6020 = alloca i8*
store i8* %.tmp6019, i8** %err_buf.6020
%.tmp6021 = getelementptr i8*, i8** %err_buf.6020, i32 0
%.tmp6023 = getelementptr [37 x i8], [37 x i8]*@.str6022, i32 0, i32 0
%.tmp6024 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6025 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.5865
%.tmp6026 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6025, i32 0, i32 4
%.tmp6027 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6026
%.tmp6028 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp6024, %m2859$.Type.type* %.tmp6027)
%.tmp6029 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6030 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %dest.5998
%.tmp6031 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6030, i32 0, i32 4
%.tmp6032 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6031
%.tmp6033 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp6029, %m2859$.Type.type* %.tmp6032)
%.tmp6034 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6021, i8* %.tmp6023, i8* %.tmp6028, i8* %.tmp6033)
%.tmp6035 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6036 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6037 = load i8*, i8** %err_buf.6020
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp6035, %m996$.Node.type* %.tmp6036, i8* %.tmp6037)
br label %.if.end.6017
.if.false.6017:
br label %.if.end.6017
.if.end.6017:
%.tmp6038 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6039 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %dest.5998
%.tmp6040 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6039, i32 0, i32 4
%.tmp6041 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6040
%.tmp6042 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp6038, %m2859$.Type.type* %.tmp6041)
%dest_tr.6043 = alloca i8*
store i8* %.tmp6042, i8** %dest_tr.6043
%.tmp6044 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6045 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.5865
%.tmp6046 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6045, i32 0, i32 4
%.tmp6047 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6046
%.tmp6048 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp6044, %m2859$.Type.type* %.tmp6047)
%src_tr.6049 = alloca i8*
store i8* %.tmp6048, i8** %src_tr.6049
%.tmp6050 = load i8*, i8** %src_tr.6049
%.tmp6052 = getelementptr [4 x i8], [4 x i8]*@.str6051, i32 0, i32 0
%.tmp6053 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6050, i8* %.tmp6052)
%.tmp6054 = icmp eq i32 %.tmp6053, 0
br i1 %.tmp6054, label %.if.true.6055, label %.if.false.6055
.if.true.6055:
%.tmp6056 = load i8*, i8** %dest_tr.6043
store i8* %.tmp6056, i8** %src_tr.6049
br label %.if.end.6055
.if.false.6055:
br label %.if.end.6055
.if.end.6055:
%.tmp6057 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6058 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6057, i32 0, i32 1
%.tmp6059 = load %m0$.File.type*, %m0$.File.type** %.tmp6058
%.tmp6061 = getelementptr [21 x i8], [21 x i8]*@.str6060, i32 0, i32 0
%.tmp6062 = load i8*, i8** %src_tr.6049
%.tmp6063 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.5865
%.tmp6064 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp6063)
%.tmp6065 = load i8*, i8** %dest_tr.6043
%.tmp6066 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %dest.5998
%.tmp6067 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp6066)
%.tmp6068 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6059, i8* %.tmp6061, i8* %.tmp6062, i8* %.tmp6064, i8* %.tmp6065, i8* %.tmp6067)
br label %.if.end.5986
.if.false.5986:
%.tmp6069 = load i8*, i8** %expr_type.5860
%.tmp6071 = getelementptr [9 x i8], [9 x i8]*@.str6070, i32 0, i32 0
%.tmp6072 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6069, i8* %.tmp6071)
%.tmp6073 = icmp eq i32 %.tmp6072, 0
br i1 %.tmp6073, label %.if.true.6074, label %.if.false.6074
.if.true.6074:
%.tmp6075 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6076 = load %m996$.Node.type*, %m996$.Node.type** %stmt
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_if_block.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp6075, %m996$.Node.type* %.tmp6076)
br label %.if.end.6074
.if.false.6074:
%.tmp6077 = load i8*, i8** %expr_type.5860
%.tmp6079 = getelementptr [9 x i8], [9 x i8]*@.str6078, i32 0, i32 0
%.tmp6080 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6077, i8* %.tmp6079)
%.tmp6081 = icmp eq i32 %.tmp6080, 0
br i1 %.tmp6081, label %.if.true.6082, label %.if.false.6082
.if.true.6082:
%.tmp6083 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6084 = load %m996$.Node.type*, %m996$.Node.type** %stmt
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_for_loop.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp6083, %m996$.Node.type* %.tmp6084)
br label %.if.end.6082
.if.false.6082:
%.tmp6085 = load i8*, i8** %expr_type.5860
%.tmp6087 = getelementptr [8 x i8], [8 x i8]*@.str6086, i32 0, i32 0
%.tmp6088 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6085, i8* %.tmp6087)
%.tmp6089 = icmp eq i32 %.tmp6088, 0
br i1 %.tmp6089, label %.if.true.6090, label %.if.false.6090
.if.true.6090:
%.tmp6091 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6093 = getelementptr [4 x i8], [4 x i8]*@.str6092, i32 0, i32 0
%.tmp6094 = call %m2859$.Scope.type*(%m2859$.CompilerCtx.type*,i8*) @m311$get_scope.m2859$.Scope.typep.m2859$.CompilerCtx.typep.cp(%m2859$.CompilerCtx.type* %.tmp6091, i8* %.tmp6093)
%for_scope.6095 = alloca %m2859$.Scope.type*
store %m2859$.Scope.type* %.tmp6094, %m2859$.Scope.type** %for_scope.6095
%.tmp6096 = load %m2859$.Scope.type*, %m2859$.Scope.type** %for_scope.6095
%.tmp6097 = icmp eq %m2859$.Scope.type* %.tmp6096, null
br i1 %.tmp6097, label %.if.true.6098, label %.if.false.6098
.if.true.6098:
%.tmp6100 = getelementptr [1 x i8], [1 x i8]*@.str6099, i32 0, i32 0
%buf.6101 = alloca i8*
store i8* %.tmp6100, i8** %buf.6101
%.tmp6102 = getelementptr i8*, i8** %buf.6101, i32 0
%.tmp6104 = getelementptr [42 x i8], [42 x i8]*@.str6103, i32 0, i32 0
%.tmp6105 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6106 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6105, i32 0, i32 8
%.tmp6107 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6106
%.tmp6108 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6107, i32 0, i32 1
%.tmp6109 = load i8*, i8** %.tmp6108
%.tmp6110 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6102, i8* %.tmp6104, i8* %.tmp6109)
%.tmp6111 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6112 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6113 = load i8*, i8** %buf.6101
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp6111, %m996$.Node.type* %.tmp6112, i8* %.tmp6113)
ret void
br label %.if.end.6098
.if.false.6098:
br label %.if.end.6098
.if.end.6098:
%.tmp6114 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6115 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6114, i32 0, i32 8
%.tmp6116 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6115
%.tmp6117 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6116, i32 0, i32 1
%.tmp6118 = load i8*, i8** %.tmp6117
%.tmp6120 = getelementptr [6 x i8], [6 x i8]*@.str6119, i32 0, i32 0
%.tmp6121 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6118, i8* %.tmp6120)
%.tmp6122 = icmp eq i32 %.tmp6121, 0
br i1 %.tmp6122, label %.if.true.6123, label %.if.false.6123
.if.true.6123:
%.tmp6124 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6125 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6124, i32 0, i32 1
%.tmp6126 = load %m0$.File.type*, %m0$.File.type** %.tmp6125
%.tmp6128 = getelementptr [15 x i8], [15 x i8]*@.str6127, i32 0, i32 0
%.tmp6129 = load %m2859$.Scope.type*, %m2859$.Scope.type** %for_scope.6095
%.tmp6130 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp6129, i32 0, i32 4
%.tmp6131 = load i8*, i8** %.tmp6130
%.tmp6132 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6126, i8* %.tmp6128, i8* %.tmp6131)
br label %.if.end.6123
.if.false.6123:
%.tmp6133 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6134 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6133, i32 0, i32 8
%.tmp6135 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6134
%.tmp6136 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6135, i32 0, i32 1
%.tmp6137 = load i8*, i8** %.tmp6136
%.tmp6139 = getelementptr [9 x i8], [9 x i8]*@.str6138, i32 0, i32 0
%.tmp6140 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6137, i8* %.tmp6139)
%.tmp6141 = icmp eq i32 %.tmp6140, 0
br i1 %.tmp6141, label %.if.true.6142, label %.if.false.6142
.if.true.6142:
%.tmp6143 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6144 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6143, i32 0, i32 1
%.tmp6145 = load %m0$.File.type*, %m0$.File.type** %.tmp6144
%.tmp6147 = getelementptr [15 x i8], [15 x i8]*@.str6146, i32 0, i32 0
%.tmp6148 = load %m2859$.Scope.type*, %m2859$.Scope.type** %for_scope.6095
%.tmp6149 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp6148, i32 0, i32 3
%.tmp6150 = load i8*, i8** %.tmp6149
%.tmp6151 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6145, i8* %.tmp6147, i8* %.tmp6150)
br label %.if.end.6142
.if.false.6142:
br label %.if.end.6142
.if.end.6142:
br label %.if.end.6123
.if.end.6123:
br label %.if.end.6090
.if.false.6090:
%.tmp6152 = load i8*, i8** %expr_type.5860
%.tmp6154 = getelementptr [9 x i8], [9 x i8]*@.str6153, i32 0, i32 0
%.tmp6155 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6152, i8* %.tmp6154)
%.tmp6156 = icmp eq i32 %.tmp6155, 0
br i1 %.tmp6156, label %.if.true.6157, label %.if.false.6157
.if.true.6157:
%.tmp6158 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6159 = load %m996$.Node.type*, %m996$.Node.type** %stmt
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_closure.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp6158, %m996$.Node.type* %.tmp6159)
br label %.if.end.6157
.if.false.6157:
%.tmp6160 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6161 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6163 = getelementptr [34 x i8], [34 x i8]*@.str6162, i32 0, i32 0
%.tmp6164 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp6160, %m996$.Node.type* %.tmp6161, i8* %.tmp6163)
%.tmp6165 = load i8*, i8** %expr_type.5860
%.tmp6166 = call i32(i8*,...) @printf(i8* %.tmp6164, i8* %.tmp6165)
br label %.if.end.6157
.if.end.6157:
br label %.if.end.6090
.if.end.6090:
br label %.if.end.6082
.if.end.6082:
br label %.if.end.6074
.if.end.6074:
br label %.if.end.5986
.if.end.5986:
br label %.if.end.5977
.if.end.5977:
br label %.if.end.5966
.if.end.5966:
br label %.if.end.5960
.if.end.5960:
br label %.if.end.5871
.if.end.5871:
ret void
}
define %m2859$.Scope.type* @m311$get_scope.m2859$.Scope.typep.m2859$.CompilerCtx.typep.cp(%m2859$.CompilerCtx.type* %.ctx.arg, i8* %.scope_type.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%scope_type = alloca i8*
store i8* %.scope_type.arg, i8** %scope_type
%.tmp6167 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6168 = call %m2859$.ModuleLookup.type*(%m2859$.CompilerCtx.type*) @m311$get_current_module.m2859$.ModuleLookup.typep.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp6167)
%mod.6169 = alloca %m2859$.ModuleLookup.type*
store %m2859$.ModuleLookup.type* %.tmp6168, %m2859$.ModuleLookup.type** %mod.6169
%.tmp6171 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.6169
%.tmp6172 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp6171, i32 0, i32 3
%.tmp6173 = load %m2859$.Scope.type*, %m2859$.Scope.type** %.tmp6172
%s.6174 = alloca %m2859$.Scope.type*
store %m2859$.Scope.type* %.tmp6173, %m2859$.Scope.type** %s.6174
br label %.for.start.6170
.for.start.6170:
%.tmp6175 = load %m2859$.Scope.type*, %m2859$.Scope.type** %s.6174
%.tmp6176 = icmp ne %m2859$.Scope.type* %.tmp6175, null
br i1 %.tmp6176, label %.for.continue.6170, label %.for.end.6170
.for.continue.6170:
%.tmp6177 = load %m2859$.Scope.type*, %m2859$.Scope.type** %s.6174
%.tmp6178 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp6177, i32 0, i32 2
%.tmp6179 = load i8*, i8** %.tmp6178
%.tmp6180 = load i8*, i8** %scope_type
%.tmp6181 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6179, i8* %.tmp6180)
%.tmp6182 = icmp eq i32 %.tmp6181, 0
br i1 %.tmp6182, label %.if.true.6183, label %.if.false.6183
.if.true.6183:
%.tmp6184 = load %m2859$.Scope.type*, %m2859$.Scope.type** %s.6174
ret %m2859$.Scope.type* %.tmp6184
br label %.if.end.6183
.if.false.6183:
br label %.if.end.6183
.if.end.6183:
%.tmp6185 = load %m2859$.Scope.type*, %m2859$.Scope.type** %s.6174
%.tmp6186 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp6185, i32 0, i32 5
%.tmp6187 = load %m2859$.Scope.type*, %m2859$.Scope.type** %.tmp6186
store %m2859$.Scope.type* %.tmp6187, %m2859$.Scope.type** %s.6174
br label %.for.start.6170
.for.end.6170:
%.tmp6188 = bitcast ptr null to %m2859$.Scope.type*
ret %m2859$.Scope.type* %.tmp6188
}
define %m2859$.Type.type* @m311$type_ptr_of_chr.m2859$.Type.typep() {
%.tmp6189 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
%t.6190 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp6189, %m2859$.Type.type** %t.6190
%.tmp6191 = load %m2859$.Type.type*, %m2859$.Type.type** %t.6190
%.tmp6192 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6191, i32 0, i32 0
%.tmp6194 = getelementptr [4 x i8], [4 x i8]*@.str6193, i32 0, i32 0
store i8* %.tmp6194, i8** %.tmp6192
%.tmp6195 = load %m2859$.Type.type*, %m2859$.Type.type** %t.6190
%.tmp6196 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6195, i32 0, i32 3
%.tmp6197 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6197, %m2859$.Type.type** %.tmp6196
%.tmp6198 = load %m2859$.Type.type*, %m2859$.Type.type** %t.6190
%.tmp6199 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6198, i32 0, i32 3
%.tmp6200 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6199
%.tmp6201 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6200, i32 0, i32 0
%.tmp6203 = getelementptr [4 x i8], [4 x i8]*@.str6202, i32 0, i32 0
store i8* %.tmp6203, i8** %.tmp6201
%.tmp6204 = load %m2859$.Type.type*, %m2859$.Type.type** %t.6190
ret %m2859$.Type.type* %.tmp6204
}
define void @m311$compile_closure.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp6205 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6206 = call i32(%m2859$.CompilerCtx.type*) @m311$new_uid.i.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp6205)
%cj_id.6207 = alloca i32
store i32 %.tmp6206, i32* %cj_id.6207
%.tmp6208 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6209 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp6208)
%info_lit.6210 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp6209, %m2859$.AssignableInfo.type** %info_lit.6210
%.tmp6211 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_lit.6210
%.tmp6212 = load i8, i8* @SCOPE_GLOBAL
%.tmp6214 = getelementptr [21 x i8], [21 x i8]*@.str6213, i32 0, i32 0
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp6211, i8 %.tmp6212, i8* %.tmp6214)
%.tmp6215 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_lit.6210
%.tmp6216 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6215, i32 0, i32 4
%.tmp6217 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6217, %m2859$.Type.type** %.tmp6216
%.tmp6218 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_lit.6210
%.tmp6219 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6218, i32 0, i32 4
%.tmp6220 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6219
%.tmp6221 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6220, i32 0, i32 0
%.tmp6223 = getelementptr [9 x i8], [9 x i8]*@.str6222, i32 0, i32 0
store i8* %.tmp6223, i8** %.tmp6221
%.tmp6224 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_lit.6210
%.tmp6225 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6224, i32 0, i32 4
%.tmp6226 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6225
%.tmp6227 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6226, i32 0, i32 3
%.tmp6228 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6228, %m2859$.Type.type** %.tmp6227
%.tmp6229 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_lit.6210
%.tmp6230 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6229, i32 0, i32 4
%.tmp6231 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6230
%.tmp6232 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6231, i32 0, i32 3
%.tmp6233 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6232
%.tmp6234 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6233, i32 0, i32 0
%.tmp6236 = getelementptr [5 x i8], [5 x i8]*@.str6235, i32 0, i32 0
store i8* %.tmp6236, i8** %.tmp6234
%.tmp6237 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_lit.6210
%.tmp6238 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6237, i32 0, i32 4
%.tmp6239 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6238
%.tmp6240 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6239, i32 0, i32 3
%.tmp6241 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6240
%.tmp6242 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6241, i32 0, i32 4
%.tmp6243 = call %m2859$.Type.type*() @m311$type_ptr_of_chr.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6243, %m2859$.Type.type** %.tmp6242
%.tmp6244 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_lit.6210
%.tmp6245 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6244, i32 0, i32 4
%.tmp6246 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6245
%.tmp6247 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6246, i32 0, i32 3
%.tmp6248 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6247
%.tmp6249 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6248, i32 0, i32 4
%.tmp6250 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6249
%.tmp6251 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6250, i32 0, i32 4
%.tmp6252 = call %m2859$.Type.type*() @m311$type_ptr_of_chr.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6252, %m2859$.Type.type** %.tmp6251
%.tmp6253 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_lit.6210
%.tmp6254 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6253, i32 0, i32 4
%.tmp6255 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6254
%.tmp6256 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6255, i32 0, i32 3
%.tmp6257 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6256
%.tmp6258 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6257, i32 0, i32 4
%.tmp6259 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6258
%.tmp6260 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6259, i32 0, i32 4
%.tmp6261 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6260
%.tmp6262 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6261, i32 0, i32 4
%.tmp6263 = call %m2859$.Type.type*() @m311$type_ptr_of_chr.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6263, %m2859$.Type.type** %.tmp6262
%.tmp6264 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6266 = getelementptr [21 x i8], [21 x i8]*@.str6265, i32 0, i32 0
%.tmp6268 = getelementptr [7 x i8], [7 x i8]*@.str6267, i32 0, i32 0
%.tmp6269 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_lit.6210
call void(%m2859$.CompilerCtx.type*,i8*,i8*,%m2859$.AssignableInfo.type*,i1,i1) @m311$define_global.v.m2859$.CompilerCtx.typep.cp.cp.m2859$.AssignableInfo.typep.b.b(%m2859$.CompilerCtx.type* %.tmp6264, i8* %.tmp6266, i8* %.tmp6268, %m2859$.AssignableInfo.type* %.tmp6269, i1 1, i1 0)
%.tmp6270 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6271 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp6270)
%info_lat.6272 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp6271, %m2859$.AssignableInfo.type** %info_lat.6272
%.tmp6273 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_lat.6272
%.tmp6274 = load i8, i8* @SCOPE_GLOBAL
%.tmp6276 = getelementptr [23 x i8], [23 x i8]*@.str6275, i32 0, i32 0
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp6273, i8 %.tmp6274, i8* %.tmp6276)
%.tmp6277 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_lat.6272
%.tmp6278 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6277, i32 0, i32 4
%.tmp6279 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6279, %m2859$.Type.type** %.tmp6278
%.tmp6280 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_lat.6272
%.tmp6281 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6280, i32 0, i32 4
%.tmp6282 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6281
%.tmp6283 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6282, i32 0, i32 0
%.tmp6285 = getelementptr [9 x i8], [9 x i8]*@.str6284, i32 0, i32 0
store i8* %.tmp6285, i8** %.tmp6283
%.tmp6286 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_lat.6272
%.tmp6287 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6286, i32 0, i32 4
%.tmp6288 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6287
%.tmp6289 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6288, i32 0, i32 3
%.tmp6290 = call %m2859$.Type.type*() @m311$type_ptr_of_chr.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6290, %m2859$.Type.type** %.tmp6289
%.tmp6291 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_lat.6272
%.tmp6292 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6291, i32 0, i32 4
%.tmp6293 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6292
%.tmp6294 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6293, i32 0, i32 3
%.tmp6295 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6294
%.tmp6296 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6295, i32 0, i32 4
%.tmp6297 = call %m2859$.Type.type*() @m311$type_ptr_of_chr.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6297, %m2859$.Type.type** %.tmp6296
%.tmp6298 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6300 = getelementptr [23 x i8], [23 x i8]*@.str6299, i32 0, i32 0
%.tmp6302 = getelementptr [7 x i8], [7 x i8]*@.str6301, i32 0, i32 0
%.tmp6303 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_lat.6272
call void(%m2859$.CompilerCtx.type*,i8*,i8*,%m2859$.AssignableInfo.type*,i1,i1) @m311$define_global.v.m2859$.CompilerCtx.typep.cp.cp.m2859$.AssignableInfo.typep.b.b(%m2859$.CompilerCtx.type* %.tmp6298, i8* %.tmp6300, i8* %.tmp6302, %m2859$.AssignableInfo.type* %.tmp6303, i1 1, i1 0)
%.tmp6304 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6305 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp6304)
%info_mmap.6306 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp6305, %m2859$.AssignableInfo.type** %info_mmap.6306
%.tmp6307 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_mmap.6306
%.tmp6308 = load i8, i8* @SCOPE_GLOBAL
%.tmp6310 = getelementptr [5 x i8], [5 x i8]*@.str6309, i32 0, i32 0
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp6307, i8 %.tmp6308, i8* %.tmp6310)
%.tmp6311 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_mmap.6306
%.tmp6312 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6311, i32 0, i32 4
%.tmp6313 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6313, %m2859$.Type.type** %.tmp6312
%.tmp6314 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_mmap.6306
%.tmp6315 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6314, i32 0, i32 4
%.tmp6316 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6315
%.tmp6317 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6316, i32 0, i32 0
%.tmp6319 = getelementptr [9 x i8], [9 x i8]*@.str6318, i32 0, i32 0
store i8* %.tmp6319, i8** %.tmp6317
%.tmp6320 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_mmap.6306
%.tmp6321 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6320, i32 0, i32 4
%.tmp6322 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6321
%.tmp6323 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6322, i32 0, i32 3
%.tmp6324 = call %m2859$.Type.type*() @m311$type_ptr_of_chr.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6324, %m2859$.Type.type** %.tmp6323
%.tmp6325 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_mmap.6306
%.tmp6326 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6325, i32 0, i32 4
%.tmp6327 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6326
%.tmp6328 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6327, i32 0, i32 3
%.tmp6329 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6328
%lt.6330 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp6329, %m2859$.Type.type** %lt.6330
%.tmp6331 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6332 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6331, i32 0, i32 4
%.tmp6333 = call %m2859$.Type.type*() @m311$type_ptr_of_chr.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6333, %m2859$.Type.type** %.tmp6332
%.tmp6334 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6335 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6334, i32 0, i32 4
%.tmp6336 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6335
store %m2859$.Type.type* %.tmp6336, %m2859$.Type.type** %lt.6330
%.tmp6337 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6338 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6337, i32 0, i32 4
%.tmp6339 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6339, %m2859$.Type.type** %.tmp6338
%.tmp6340 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6341 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6340, i32 0, i32 4
%.tmp6342 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6341
%.tmp6343 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6342, i32 0, i32 0
%.tmp6345 = getelementptr [4 x i8], [4 x i8]*@.str6344, i32 0, i32 0
store i8* %.tmp6345, i8** %.tmp6343
%.tmp6346 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6347 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6346, i32 0, i32 4
%.tmp6348 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6347
store %m2859$.Type.type* %.tmp6348, %m2859$.Type.type** %lt.6330
%.tmp6349 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6350 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6349, i32 0, i32 4
%.tmp6351 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6351, %m2859$.Type.type** %.tmp6350
%.tmp6352 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6353 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6352, i32 0, i32 4
%.tmp6354 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6353
%.tmp6355 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6354, i32 0, i32 0
%.tmp6357 = getelementptr [4 x i8], [4 x i8]*@.str6356, i32 0, i32 0
store i8* %.tmp6357, i8** %.tmp6355
%.tmp6358 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6359 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6358, i32 0, i32 4
%.tmp6360 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6359
store %m2859$.Type.type* %.tmp6360, %m2859$.Type.type** %lt.6330
%.tmp6361 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6362 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6361, i32 0, i32 4
%.tmp6363 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6363, %m2859$.Type.type** %.tmp6362
%.tmp6364 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6365 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6364, i32 0, i32 4
%.tmp6366 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6365
%.tmp6367 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6366, i32 0, i32 0
%.tmp6369 = getelementptr [4 x i8], [4 x i8]*@.str6368, i32 0, i32 0
store i8* %.tmp6369, i8** %.tmp6367
%.tmp6370 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6371 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6370, i32 0, i32 4
%.tmp6372 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6371
store %m2859$.Type.type* %.tmp6372, %m2859$.Type.type** %lt.6330
%.tmp6373 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6374 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6373, i32 0, i32 4
%.tmp6375 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6375, %m2859$.Type.type** %.tmp6374
%.tmp6376 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6377 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6376, i32 0, i32 4
%.tmp6378 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6377
%.tmp6379 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6378, i32 0, i32 0
%.tmp6381 = getelementptr [4 x i8], [4 x i8]*@.str6380, i32 0, i32 0
store i8* %.tmp6381, i8** %.tmp6379
%.tmp6382 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6383 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6382, i32 0, i32 4
%.tmp6384 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6383
store %m2859$.Type.type* %.tmp6384, %m2859$.Type.type** %lt.6330
%.tmp6385 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6386 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6385, i32 0, i32 4
%.tmp6387 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6387, %m2859$.Type.type** %.tmp6386
%.tmp6388 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6389 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6388, i32 0, i32 4
%.tmp6390 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6389
%.tmp6391 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6390, i32 0, i32 0
%.tmp6393 = getelementptr [4 x i8], [4 x i8]*@.str6392, i32 0, i32 0
store i8* %.tmp6393, i8** %.tmp6391
%.tmp6394 = load %m2859$.Type.type*, %m2859$.Type.type** %lt.6330
%.tmp6395 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6394, i32 0, i32 4
%.tmp6396 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6395
store %m2859$.Type.type* %.tmp6396, %m2859$.Type.type** %lt.6330
%.tmp6397 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6399 = getelementptr [5 x i8], [5 x i8]*@.str6398, i32 0, i32 0
%.tmp6401 = getelementptr [7 x i8], [7 x i8]*@.str6400, i32 0, i32 0
%.tmp6402 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info_mmap.6306
call void(%m2859$.CompilerCtx.type*,i8*,i8*,%m2859$.AssignableInfo.type*,i1,i1) @m311$define_global.v.m2859$.CompilerCtx.typep.cp.cp.m2859$.AssignableInfo.typep.b.b(%m2859$.CompilerCtx.type* %.tmp6397, i8* %.tmp6399, i8* %.tmp6401, %m2859$.AssignableInfo.type* %.tmp6402, i1 1, i1 0)
%.tmp6403 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6404 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6403, i32 0, i32 8
%.tmp6405 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6404
%.tmp6407 = getelementptr [5 x i8], [5 x i8]*@.str6406, i32 0, i32 0
%.tmp6408 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6405, i8* %.tmp6407)
%fn_name_node.6409 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6408, %m996$.Node.type** %fn_name_node.6409
%.tmp6410 = load %m996$.Node.type*, %m996$.Node.type** %fn_name_node.6409
%.tmp6411 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6410, i32 0, i32 1
%.tmp6412 = load i8*, i8** %.tmp6411
%fn_name.6413 = alloca i8*
store i8* %.tmp6412, i8** %fn_name.6413
%.tmp6414 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6415 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp6414)
%info.6416 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp6415, %m2859$.AssignableInfo.type** %info.6416
%.tmp6417 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6416
%.tmp6418 = load i8, i8* @SCOPE_LOCAL
%.tmp6419 = load i8*, i8** %fn_name.6413
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp6417, i8 %.tmp6418, i8* %.tmp6419)
%.tmp6420 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6416
%.tmp6421 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6420, i32 0, i32 4
%.tmp6422 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6423 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6424 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6423, i32 0, i32 8
%.tmp6425 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6424
%.tmp6426 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$syn_function_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp6422, %m996$.Node.type* %.tmp6425)
store %m2859$.Type.type* %.tmp6426, %m2859$.Type.type** %.tmp6421
%.tmp6427 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6416
%.tmp6428 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6427, i32 0, i32 3
%.tmp6430 = getelementptr [9 x i8], [9 x i8]*@.str6429, i32 0, i32 0
store i8* %.tmp6430, i8** %.tmp6428
%.tmp6431 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6432 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6433 = load i8*, i8** %fn_name.6413
%.tmp6434 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6416
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2859$.AssignableInfo.type*) @m311$define_assignable.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp6431, %m996$.Node.type* %.tmp6432, i8* %.tmp6433, %m2859$.AssignableInfo.type* %.tmp6434)
%.tmp6435 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6436 = call i32(%m2859$.CompilerCtx.type*) @m311$new_uid.i.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp6435)
%closure_id.6437 = alloca i32
store i32 %.tmp6436, i32* %closure_id.6437
%.tmp6438 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6416
%.tmp6439 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6438, i32 0, i32 4
%.tmp6440 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6439
%.tmp6441 = call %m2859$.Type.type*(%m2859$.Type.type*) @m311$type_clone.m2859$.Type.typep.m2859$.Type.typep(%m2859$.Type.type* %.tmp6440)
%closure_type.6442 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp6441, %m2859$.Type.type** %closure_type.6442
%.tmp6443 = load %m2859$.Type.type*, %m2859$.Type.type** %closure_type.6442
%.tmp6444 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6443, i32 0, i32 3
%.tmp6445 = load %m2859$.Type.type*, %m2859$.Type.type** %closure_type.6442
%.tmp6446 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6445, i32 0, i32 3
%.tmp6447 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6446
%.tmp6448 = call %m2859$.Type.type*(%m2859$.Type.type*) @m311$type_clone.m2859$.Type.typep.m2859$.Type.typep(%m2859$.Type.type* %.tmp6447)
store %m2859$.Type.type* %.tmp6448, %m2859$.Type.type** %.tmp6444
%.tmp6449 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
%ctx_param.6450 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp6449, %m2859$.Type.type** %ctx_param.6450
%.tmp6451 = load %m2859$.Type.type*, %m2859$.Type.type** %ctx_param.6450
%.tmp6452 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6451, i32 0, i32 0
%.tmp6454 = getelementptr [4 x i8], [4 x i8]*@.str6453, i32 0, i32 0
store i8* %.tmp6454, i8** %.tmp6452
%.tmp6455 = load %m2859$.Type.type*, %m2859$.Type.type** %ctx_param.6450
%.tmp6456 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6455, i32 0, i32 3
%.tmp6457 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp6457, %m2859$.Type.type** %.tmp6456
%.tmp6458 = load %m2859$.Type.type*, %m2859$.Type.type** %ctx_param.6450
%.tmp6459 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6458, i32 0, i32 3
%.tmp6460 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6459
%.tmp6461 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6460, i32 0, i32 0
%.tmp6463 = getelementptr [7 x i8], [7 x i8]*@.str6462, i32 0, i32 0
store i8* %.tmp6463, i8** %.tmp6461
%.tmp6464 = load %m2859$.Type.type*, %m2859$.Type.type** %ctx_param.6450
%.tmp6465 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6464, i32 0, i32 4
%.tmp6466 = load %m2859$.Type.type*, %m2859$.Type.type** %closure_type.6442
%.tmp6467 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6466, i32 0, i32 3
%.tmp6468 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6467
%.tmp6469 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6468, i32 0, i32 4
%.tmp6470 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6469
store %m2859$.Type.type* %.tmp6470, %m2859$.Type.type** %.tmp6465
%.tmp6471 = load %m2859$.Type.type*, %m2859$.Type.type** %closure_type.6442
%.tmp6472 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6471, i32 0, i32 3
%.tmp6473 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6472
%.tmp6474 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6473, i32 0, i32 4
%.tmp6475 = load %m2859$.Type.type*, %m2859$.Type.type** %ctx_param.6450
store %m2859$.Type.type* %.tmp6475, %m2859$.Type.type** %.tmp6474
%.tmp6477 = getelementptr [1 x i8], [1 x i8]*@.str6476, i32 0, i32 0
%closure_name.6478 = alloca i8*
store i8* %.tmp6477, i8** %closure_name.6478
%.tmp6479 = getelementptr i8*, i8** %closure_name.6478, i32 0
%.tmp6481 = getelementptr [5 x i8], [5 x i8]*@.str6480, i32 0, i32 0
%.tmp6482 = load i32, i32* %closure_id.6437
%.tmp6483 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6479, i8* %.tmp6481, i32 %.tmp6482)
%.tmp6484 = load %m2859$.Type.type*, %m2859$.Type.type** %closure_type.6442
%.tmp6485 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6484, i32 0, i32 3
%.tmp6486 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6485
%.tmp6487 = call %m2859$.Type.type*(%m2859$.Type.type*) @m311$type_clone.m2859$.Type.typep.m2859$.Type.typep(%m2859$.Type.type* %.tmp6486)
%ret_type.6488 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp6487, %m2859$.Type.type** %ret_type.6488
%.tmp6489 = load %m2859$.Type.type*, %m2859$.Type.type** %ret_type.6488
%.tmp6490 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp6489, i32 0, i32 3
store %m2859$.Type.type* null, %m2859$.Type.type** %.tmp6490
%.tmp6491 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6492 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6491, i32 0, i32 1
%.tmp6493 = load %m0$.File.type*, %m0$.File.type** %.tmp6492
%.tmp6495 = getelementptr [101 x i8], [101 x i8]*@.str6494, i32 0, i32 0
%.tmp6496 = load i32, i32* %closure_id.6437
%.tmp6497 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6493, i8* %.tmp6495, i32 %.tmp6496)
%.tmp6498 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6499 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6498, i32 0, i32 1
%.tmp6500 = load %m0$.File.type*, %m0$.File.type** %.tmp6499
%.tmp6502 = getelementptr [100 x i8], [100 x i8]*@.str6501, i32 0, i32 0
%.tmp6503 = load i32, i32* %closure_id.6437
%.tmp6504 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6505 = load %m2859$.Type.type*, %m2859$.Type.type** %closure_type.6442
%.tmp6506 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp6504, %m2859$.Type.type* %.tmp6505)
%.tmp6507 = load i8*, i8** %closure_name.6478
%.tmp6508 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6500, i8* %.tmp6502, i32 %.tmp6503, i8* %.tmp6506, i8* %.tmp6507)
%.tmp6509 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6510 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6509, i32 0, i32 1
%.tmp6511 = load %m0$.File.type*, %m0$.File.type** %.tmp6510
%.tmp6513 = getelementptr [66 x i8], [66 x i8]*@.str6512, i32 0, i32 0
%.tmp6514 = load i32, i32* %closure_id.6437
%.tmp6515 = load i32, i32* %closure_id.6437
%.tmp6516 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6511, i8* %.tmp6513, i32 %.tmp6514, i32 %.tmp6515)
%.tmp6517 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6518 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6517, i32 0, i32 1
%.tmp6519 = load %m0$.File.type*, %m0$.File.type** %.tmp6518
%.tmp6521 = getelementptr [35 x i8], [35 x i8]*@.str6520, i32 0, i32 0
%.tmp6522 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6416
%.tmp6523 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp6522)
%.tmp6524 = load i32, i32* %closure_id.6437
%.tmp6525 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6526 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6416
%.tmp6527 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6526, i32 0, i32 4
%.tmp6528 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6527
%.tmp6529 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp6525, %m2859$.Type.type* %.tmp6528)
%.tmp6530 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6519, i8* %.tmp6521, i8* %.tmp6523, i32 %.tmp6524, i8* %.tmp6529)
%.tmp6531 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6532 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6531, i32 0, i32 1
%.tmp6533 = load %m0$.File.type*, %m0$.File.type** %.tmp6532
%bkp_ctx.6534 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6533, %m0$.File.type** %bkp_ctx.6534
%.tmp6535 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6536 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6535, i32 0, i32 1
%.tmp6537 = call %m0$.File.type*() @tmpfile()
store %m0$.File.type* %.tmp6537, %m0$.File.type** %.tmp6536
%.tmp6538 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6539 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6538, i32 0, i32 1
%.tmp6540 = load %m0$.File.type*, %m0$.File.type** %.tmp6539
%.tmp6542 = getelementptr [14 x i8], [14 x i8]*@.str6541, i32 0, i32 0
%.tmp6543 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6544 = load %m2859$.Type.type*, %m2859$.Type.type** %ret_type.6488
%.tmp6545 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp6543, %m2859$.Type.type* %.tmp6544)
%.tmp6546 = load i8*, i8** %closure_name.6478
%.tmp6547 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6540, i8* %.tmp6542, i8* %.tmp6545, i8* %.tmp6546)
%.tmp6548 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6550 = getelementptr [9 x i8], [9 x i8]*@.str6549, i32 0, i32 0
%.tmp6551 = bitcast ptr null to i8*
%.tmp6552 = bitcast ptr null to i8*
%.tmp6553 = load %m2859$.Type.type*, %m2859$.Type.type** %ret_type.6488
call void(%m2859$.CompilerCtx.type*,i8*,i8*,i8*,%m2859$.Type.type*) @m311$push_scope.v.m2859$.CompilerCtx.typep.cp.cp.cp.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp6548, i8* %.tmp6550, i8* %.tmp6551, i8* %.tmp6552, %m2859$.Type.type* %.tmp6553)
%.tmp6554 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6555 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6554, i32 0, i32 1
%.tmp6556 = load %m0$.File.type*, %m0$.File.type** %.tmp6555
%.tmp6558 = getelementptr [13 x i8], [13 x i8]*@.str6557, i32 0, i32 0
%.tmp6559 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6560 = load %m2859$.Type.type*, %m2859$.Type.type** %ctx_param.6450
%.tmp6561 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp6559, %m2859$.Type.type* %.tmp6560)
%.tmp6562 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6556, i8* %.tmp6558, i8* %.tmp6561)
%.tmp6563 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6564 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6563, i32 0, i32 8
%.tmp6565 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6564
%.tmp6566 = call %m996$.Node.type*(%m996$.Node.type*) @m311$syn_function_params.m996$.Node.typep.m996$.Node.typep(%m996$.Node.type* %.tmp6565)
%params.6567 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6566, %m996$.Node.type** %params.6567
%param_type.6568 = alloca %m2859$.Type.type*
store %m2859$.Type.type* null, %m2859$.Type.type** %param_type.6568
%.tmp6570 = load %m996$.Node.type*, %m996$.Node.type** %params.6567
%param_ptr.6571 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6570, %m996$.Node.type** %param_ptr.6571
br label %.for.start.6569
.for.start.6569:
%.tmp6572 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.6571
%.tmp6573 = icmp ne %m996$.Node.type* %.tmp6572, null
br i1 %.tmp6573, label %.for.continue.6569, label %.for.end.6569
.for.continue.6569:
%.tmp6574 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.6571
%.tmp6575 = load %m996$.Node.type*, %m996$.Node.type** %params.6567
%.tmp6576 = icmp ne %m996$.Node.type* %.tmp6574, %.tmp6575
br i1 %.tmp6576, label %.if.true.6577, label %.if.false.6577
.if.true.6577:
%.tmp6578 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.6571
%.tmp6579 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6578, i32 0, i32 9
%.tmp6580 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6579
store %m996$.Node.type* %.tmp6580, %m996$.Node.type** %param_ptr.6571
br label %.if.end.6577
.if.false.6577:
br label %.if.end.6577
.if.end.6577:
%.tmp6581 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6582 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6581, i32 0, i32 1
%.tmp6583 = load %m0$.File.type*, %m0$.File.type** %.tmp6582
%.tmp6585 = getelementptr [3 x i8], [3 x i8]*@.str6584, i32 0, i32 0
%.tmp6586 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6583, i8* %.tmp6585)
%.tmp6587 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.6571
%.tmp6588 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6587, i32 0, i32 0
%.tmp6589 = load i8*, i8** %.tmp6588
%.tmp6591 = getelementptr [5 x i8], [5 x i8]*@.str6590, i32 0, i32 0
%.tmp6592 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6589, i8* %.tmp6591)
%.tmp6593 = icmp eq i32 %.tmp6592, 0
br i1 %.tmp6593, label %.if.true.6594, label %.if.false.6594
.if.true.6594:
%.tmp6595 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6596 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.6571
%.tmp6597 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6596, i32 0, i32 8
%.tmp6598 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6597
%.tmp6599 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp6595, %m996$.Node.type* %.tmp6598)
store %m2859$.Type.type* %.tmp6599, %m2859$.Type.type** %param_type.6568
%.tmp6600 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.6571
%.tmp6601 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6600, i32 0, i32 9
%.tmp6602 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6601
store %m996$.Node.type* %.tmp6602, %m996$.Node.type** %param_ptr.6571
br label %.if.end.6594
.if.false.6594:
br label %.if.end.6594
.if.end.6594:
%.tmp6603 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6604 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6603, i32 0, i32 1
%.tmp6605 = load %m0$.File.type*, %m0$.File.type** %.tmp6604
%.tmp6607 = getelementptr [13 x i8], [13 x i8]*@.str6606, i32 0, i32 0
%.tmp6608 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6609 = load %m2859$.Type.type*, %m2859$.Type.type** %param_type.6568
%.tmp6610 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp6608, %m2859$.Type.type* %.tmp6609)
%.tmp6611 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.6571
%.tmp6612 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6611, i32 0, i32 1
%.tmp6613 = load i8*, i8** %.tmp6612
%.tmp6614 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6605, i8* %.tmp6607, i8* %.tmp6610, i8* %.tmp6613)
%.tmp6615 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.6571
%.tmp6616 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6615, i32 0, i32 9
%.tmp6617 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6616
store %m996$.Node.type* %.tmp6617, %m996$.Node.type** %param_ptr.6571
br label %.for.start.6569
.for.end.6569:
%.tmp6618 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6619 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6618, i32 0, i32 1
%.tmp6620 = load %m0$.File.type*, %m0$.File.type** %.tmp6619
%.tmp6622 = getelementptr [5 x i8], [5 x i8]*@.str6621, i32 0, i32 0
%.tmp6623 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6620, i8* %.tmp6622)
%.tmp6624 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6625 = load %m996$.Node.type*, %m996$.Node.type** %params.6567
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_fn_params.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp6624, %m996$.Node.type* %.tmp6625)
%.tmp6626 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6627 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6626, i32 0, i32 8
%.tmp6628 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6627
%.tmp6630 = getelementptr [6 x i8], [6 x i8]*@.str6629, i32 0, i32 0
%.tmp6631 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6628, i8* %.tmp6630)
%block.6632 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6631, %m996$.Node.type** %block.6632
%.tmp6633 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6634 = load %m996$.Node.type*, %m996$.Node.type** %block.6632
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_block.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp6633, %m996$.Node.type* %.tmp6634)
%.tmp6635 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6636 = load %m996$.Node.type*, %m996$.Node.type** %block.6632
%.tmp6637 = load %m2859$.Type.type*, %m2859$.Type.type** %ret_type.6488
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,%m2859$.Type.type*) @m311$check_n_add_implicit_return.v.m2859$.CompilerCtx.typep.m996$.Node.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp6635, %m996$.Node.type* %.tmp6636, %m2859$.Type.type* %.tmp6637)
%.tmp6638 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
call void(%m2859$.CompilerCtx.type*) @m311$pop_scope.v.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp6638)
%.tmp6639 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6640 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6639, i32 0, i32 1
%.tmp6641 = load %m0$.File.type*, %m0$.File.type** %.tmp6640
%.tmp6643 = getelementptr [3 x i8], [3 x i8]*@.str6642, i32 0, i32 0
%.tmp6644 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6641, i8* %.tmp6643)
%.tmp6645 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6646 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6645, i32 0, i32 1
%.tmp6647 = load %m0$.File.type*, %m0$.File.type** %.tmp6646
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp6647)
%.tmp6648 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6649 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6648, i32 0, i32 1
%.tmp6650 = load %m0$.File.type*, %m0$.File.type** %.tmp6649
%.tmp6651 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6650)
%.tmp6652 = call i8*(i32) @m1$readall.cp.i(i32 %.tmp6651)
%code.6653 = alloca i8*
store i8* %.tmp6652, i8** %code.6653
%.tmp6654 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6655 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6654, i32 0, i32 1
%.tmp6656 = load %m0$.File.type*, %m0$.File.type** %.tmp6655
%.tmp6657 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp6656)
%.tmp6658 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6659 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6658, i32 0, i32 1
%.tmp6660 = load %m0$.File.type*, %m0$.File.type** %bkp_ctx.6534
store %m0$.File.type* %.tmp6660, %m0$.File.type** %.tmp6659
%.tmp6661 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6662 = load i8*, i8** %code.6653
call void(%m2859$.CompilerCtx.type*,i8*) @m311$append_anon_fn.v.m2859$.CompilerCtx.typep.cp(%m2859$.CompilerCtx.type* %.tmp6661, i8* %.tmp6662)
ret void
}
define void @m311$check_n_add_implicit_return.v.m2859$.CompilerCtx.typep.m996$.Node.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, %m2859$.Type.type* %.return_type.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%return_type = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.return_type.arg, %m2859$.Type.type** %return_type
%.tmp6663 = bitcast ptr null to %m996$.Node.type*
%li.6664 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6663, %m996$.Node.type** %li.6664
%.tmp6665 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6666 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6665, i32 0, i32 8
%.tmp6667 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6666
%.tmp6669 = getelementptr [12 x i8], [12 x i8]*@.str6668, i32 0, i32 0
%.tmp6670 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6667, i8* %.tmp6669)
%exprs.6671 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6670, %m996$.Node.type** %exprs.6671
%.tmp6673 = load %m996$.Node.type*, %m996$.Node.type** %exprs.6671
%.tmp6674 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6673, i32 0, i32 8
%.tmp6675 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6674
%ci.6676 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6675, %m996$.Node.type** %ci.6676
br label %.for.start.6672
.for.start.6672:
%.tmp6677 = load %m996$.Node.type*, %m996$.Node.type** %ci.6676
%.tmp6678 = icmp ne %m996$.Node.type* %.tmp6677, null
br i1 %.tmp6678, label %.for.continue.6672, label %.for.end.6672
.for.continue.6672:
%.tmp6679 = load %m996$.Node.type*, %m996$.Node.type** %ci.6676
%.tmp6680 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6679, i32 0, i32 8
%.tmp6681 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6680
%.tmp6682 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6681, i32 0, i32 0
%.tmp6683 = load i8*, i8** %.tmp6682
%.tmp6685 = getelementptr [3 x i8], [3 x i8]*@.str6684, i32 0, i32 0
%.tmp6686 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6683, i8* %.tmp6685)
%.tmp6687 = icmp ne i32 %.tmp6686, 0
br i1 %.tmp6687, label %.if.true.6688, label %.if.false.6688
.if.true.6688:
%.tmp6689 = load %m996$.Node.type*, %m996$.Node.type** %ci.6676
store %m996$.Node.type* %.tmp6689, %m996$.Node.type** %li.6664
br label %.if.end.6688
.if.false.6688:
br label %.if.end.6688
.if.end.6688:
%.tmp6690 = load %m996$.Node.type*, %m996$.Node.type** %ci.6676
%.tmp6691 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6690, i32 0, i32 9
%.tmp6692 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6691
store %m996$.Node.type* %.tmp6692, %m996$.Node.type** %ci.6676
br label %.for.start.6672
.for.end.6672:
%.tmp6693 = load %m996$.Node.type*, %m996$.Node.type** %li.6664
%.tmp6694 = icmp ne %m996$.Node.type* %.tmp6693, null
br i1 %.tmp6694, label %.if.true.6695, label %.if.false.6695
.if.true.6695:
%.tmp6696 = load %m996$.Node.type*, %m996$.Node.type** %li.6664
%.tmp6697 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6696, i32 0, i32 8
%.tmp6698 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6697
%.tmp6699 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6698, i32 0, i32 0
%.tmp6700 = load i8*, i8** %.tmp6699
%.tmp6702 = getelementptr [7 x i8], [7 x i8]*@.str6701, i32 0, i32 0
%.tmp6703 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6700, i8* %.tmp6702)
%.tmp6704 = icmp eq i32 %.tmp6703, 0
br i1 %.tmp6704, label %.if.true.6705, label %.if.false.6705
.if.true.6705:
ret void
br label %.if.end.6705
.if.false.6705:
br label %.if.end.6705
.if.end.6705:
br label %.if.end.6695
.if.false.6695:
br label %.if.end.6695
.if.end.6695:
%.tmp6706 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6707 = load %m2859$.Type.type*, %m2859$.Type.type** %return_type
%.tmp6708 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp6706, %m2859$.Type.type* %.tmp6707)
%.tmp6710 = getelementptr [5 x i8], [5 x i8]*@.str6709, i32 0, i32 0
%.tmp6711 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6708, i8* %.tmp6710)
%.tmp6712 = icmp ne i32 %.tmp6711, 0
br i1 %.tmp6712, label %.if.true.6713, label %.if.false.6713
.if.true.6713:
%.tmp6714 = load %m996$.Node.type*, %m996$.Node.type** %li.6664
%.tmp6715 = icmp ne %m996$.Node.type* %.tmp6714, null
br i1 %.tmp6715, label %.if.true.6716, label %.if.false.6716
.if.true.6716:
%.tmp6717 = load %m996$.Node.type*, %m996$.Node.type** %li.6664
store %m996$.Node.type* %.tmp6717, %m996$.Node.type** %stmt
br label %.if.end.6716
.if.false.6716:
br label %.if.end.6716
.if.end.6716:
%.tmp6718 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6719 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6721 = getelementptr [21 x i8], [21 x i8]*@.str6720, i32 0, i32 0
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp6718, %m996$.Node.type* %.tmp6719, i8* %.tmp6721)
br label %.if.end.6713
.if.false.6713:
%.tmp6722 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6723 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6722, i32 0, i32 1
%.tmp6724 = load %m0$.File.type*, %m0$.File.type** %.tmp6723
%.tmp6726 = getelementptr [10 x i8], [10 x i8]*@.str6725, i32 0, i32 0
%.tmp6727 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6724, i8* %.tmp6726)
br label %.if.end.6713
.if.end.6713:
ret void
}
define void @m311$compile_for_loop.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp6728 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6729 = call i32(%m2859$.CompilerCtx.type*) @m311$new_uid.i.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp6728)
%for_id.6730 = alloca i32
store i32 %.tmp6729, i32* %for_id.6730
%.tmp6731 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6732 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6731, i32 0, i32 8
%.tmp6733 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6732
%.tmp6734 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6733, i32 0, i32 9
%.tmp6735 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6734
%init_stmt.6736 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6735, %m996$.Node.type** %init_stmt.6736
%.tmp6737 = bitcast ptr null to i8*
%begin_lbl.6738 = alloca i8*
store i8* %.tmp6737, i8** %begin_lbl.6738
%.tmp6739 = bitcast ptr null to i8*
%end_lbl.6740 = alloca i8*
store i8* %.tmp6739, i8** %end_lbl.6740
%.tmp6741 = getelementptr i8*, i8** %begin_lbl.6738, i32 0
%.tmp6743 = getelementptr [14 x i8], [14 x i8]*@.str6742, i32 0, i32 0
%.tmp6744 = load i32, i32* %for_id.6730
%.tmp6745 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6741, i8* %.tmp6743, i32 %.tmp6744)
%.tmp6746 = getelementptr i8*, i8** %end_lbl.6740, i32 0
%.tmp6748 = getelementptr [12 x i8], [12 x i8]*@.str6747, i32 0, i32 0
%.tmp6749 = load i32, i32* %for_id.6730
%.tmp6750 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6746, i8* %.tmp6748, i32 %.tmp6749)
%.tmp6751 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6753 = getelementptr [4 x i8], [4 x i8]*@.str6752, i32 0, i32 0
%.tmp6754 = load i8*, i8** %begin_lbl.6738
%.tmp6755 = load i8*, i8** %end_lbl.6740
%.tmp6756 = bitcast ptr null to %m2859$.Type.type*
call void(%m2859$.CompilerCtx.type*,i8*,i8*,i8*,%m2859$.Type.type*) @m311$push_scope.v.m2859$.CompilerCtx.typep.cp.cp.cp.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp6751, i8* %.tmp6753, i8* %.tmp6754, i8* %.tmp6755, %m2859$.Type.type* %.tmp6756)
%.tmp6757 = load %m996$.Node.type*, %m996$.Node.type** %init_stmt.6736
%.tmp6758 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6757, i32 0, i32 0
%.tmp6759 = load i8*, i8** %.tmp6758
%.tmp6761 = getelementptr [12 x i8], [12 x i8]*@.str6760, i32 0, i32 0
%.tmp6762 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6759, i8* %.tmp6761)
%.tmp6763 = icmp eq i32 %.tmp6762, 0
br i1 %.tmp6763, label %.if.true.6764, label %.if.false.6764
.if.true.6764:
%.tmp6765 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6766 = load %m996$.Node.type*, %m996$.Node.type** %init_stmt.6736
%.tmp6767 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_declaration.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp6765, %m996$.Node.type* %.tmp6766)
br label %.if.end.6764
.if.false.6764:
%.tmp6768 = load %m996$.Node.type*, %m996$.Node.type** %init_stmt.6736
%.tmp6769 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6768, i32 0, i32 0
%.tmp6770 = load i8*, i8** %.tmp6769
%.tmp6772 = getelementptr [11 x i8], [11 x i8]*@.str6771, i32 0, i32 0
%.tmp6773 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6770, i8* %.tmp6772)
%.tmp6774 = icmp eq i32 %.tmp6773, 0
br i1 %.tmp6774, label %.if.true.6775, label %.if.false.6775
.if.true.6775:
%.tmp6776 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6777 = load %m996$.Node.type*, %m996$.Node.type** %init_stmt.6736
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_expression.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp6776, %m996$.Node.type* %.tmp6777)
br label %.if.end.6775
.if.false.6775:
%.tmp6778 = load %m996$.Node.type*, %m996$.Node.type** %init_stmt.6736
%.tmp6779 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6778, i32 0, i32 0
%.tmp6780 = load i8*, i8** %.tmp6779
%.tmp6782 = getelementptr [9 x i8], [9 x i8]*@.str6781, i32 0, i32 0
%.tmp6783 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6780, i8* %.tmp6782)
%.tmp6784 = icmp eq i32 %.tmp6783, 0
br i1 %.tmp6784, label %.if.true.6785, label %.if.false.6785
.if.true.6785:
br label %.if.end.6785
.if.false.6785:
%.tmp6786 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6787 = load %m996$.Node.type*, %m996$.Node.type** %init_stmt.6736
%.tmp6789 = getelementptr [66 x i8], [66 x i8]*@.str6788, i32 0, i32 0
%.tmp6790 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp6786, %m996$.Node.type* %.tmp6787, i8* %.tmp6789)
%.tmp6791 = load %m996$.Node.type*, %m996$.Node.type** %init_stmt.6736
%.tmp6792 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6791, i32 0, i32 0
%.tmp6793 = load i8*, i8** %.tmp6792
%.tmp6794 = call i32(i8*,...) @printf(i8* %.tmp6790, i8* %.tmp6793)
%.tmp6795 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
call void(%m2859$.CompilerCtx.type*) @m311$pop_scope.v.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp6795)
ret void
br label %.if.end.6785
.if.end.6785:
br label %.if.end.6775
.if.end.6775:
br label %.if.end.6764
.if.end.6764:
%.tmp6796 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6797 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6796, i32 0, i32 1
%.tmp6798 = load %m0$.File.type*, %m0$.File.type** %.tmp6797
%.tmp6800 = getelementptr [26 x i8], [26 x i8]*@.str6799, i32 0, i32 0
%.tmp6801 = load i32, i32* %for_id.6730
%.tmp6802 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6798, i8* %.tmp6800, i32 %.tmp6801)
%.tmp6803 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6804 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6803, i32 0, i32 1
%.tmp6805 = load %m0$.File.type*, %m0$.File.type** %.tmp6804
%.tmp6807 = getelementptr [16 x i8], [16 x i8]*@.str6806, i32 0, i32 0
%.tmp6808 = load i32, i32* %for_id.6730
%.tmp6809 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6805, i8* %.tmp6807, i32 %.tmp6808)
%.tmp6810 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6811 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6810, i32 0, i32 8
%.tmp6812 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6811
%.tmp6814 = getelementptr [9 x i8], [9 x i8]*@.str6813, i32 0, i32 0
%.tmp6815 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6812, i8* %.tmp6814)
%fst_colon.6816 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6815, %m996$.Node.type** %fst_colon.6816
%.tmp6817 = load %m996$.Node.type*, %m996$.Node.type** %fst_colon.6816
%.tmp6818 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6817, i32 0, i32 9
%.tmp6819 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6818
%condition.6820 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6819, %m996$.Node.type** %condition.6820
%.tmp6821 = load %m996$.Node.type*, %m996$.Node.type** %condition.6820
%.tmp6822 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6821, i32 0, i32 0
%.tmp6823 = load i8*, i8** %.tmp6822
%.tmp6825 = getelementptr [9 x i8], [9 x i8]*@.str6824, i32 0, i32 0
%.tmp6826 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6823, i8* %.tmp6825)
%.tmp6827 = icmp eq i32 %.tmp6826, 0
br i1 %.tmp6827, label %.if.true.6828, label %.if.false.6828
.if.true.6828:
%.tmp6829 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6830 = load %m996$.Node.type*, %m996$.Node.type** %condition.6820
%.tmp6832 = getelementptr [39 x i8], [39 x i8]*@.str6831, i32 0, i32 0
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp6829, %m996$.Node.type* %.tmp6830, i8* %.tmp6832)
ret void
br label %.if.end.6828
.if.false.6828:
br label %.if.end.6828
.if.end.6828:
%.tmp6833 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6834 = load %m996$.Node.type*, %m996$.Node.type** %condition.6820
%.tmp6835 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp6833, %m996$.Node.type* %.tmp6834)
%condition_info.6836 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp6835, %m2859$.AssignableInfo.type** %condition_info.6836
%.tmp6837 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %condition_info.6836
%.tmp6838 = icmp eq %m2859$.AssignableInfo.type* %.tmp6837, null
br i1 %.tmp6838, label %.if.true.6839, label %.if.false.6839
.if.true.6839:
ret void
br label %.if.end.6839
.if.false.6839:
br label %.if.end.6839
.if.end.6839:
%.tmp6840 = load %m996$.Node.type*, %m996$.Node.type** %fst_colon.6816
%.tmp6841 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6840, i32 0, i32 9
%.tmp6842 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6841
%.tmp6844 = getelementptr [9 x i8], [9 x i8]*@.str6843, i32 0, i32 0
%.tmp6845 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6842, i8* %.tmp6844)
%snd_colon.6846 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6845, %m996$.Node.type** %snd_colon.6846
%.tmp6847 = load %m996$.Node.type*, %m996$.Node.type** %snd_colon.6846
%.tmp6849 = getelementptr [6 x i8], [6 x i8]*@.str6848, i32 0, i32 0
%.tmp6850 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6847, i8* %.tmp6849)
%for_body.6851 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6850, %m996$.Node.type** %for_body.6851
%.tmp6852 = load %m996$.Node.type*, %m996$.Node.type** %for_body.6851
%.tmp6854 = getelementptr [11 x i8], [11 x i8]*@.str6853, i32 0, i32 0
%.tmp6855 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6852, i8* %.tmp6854)
%else_block.6856 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6855, %m996$.Node.type** %else_block.6856
%.tmp6857 = load i8*, i8** %end_lbl.6740
%on_end.6858 = alloca i8*
store i8* %.tmp6857, i8** %on_end.6858
%.tmp6859 = load %m996$.Node.type*, %m996$.Node.type** %else_block.6856
%.tmp6860 = icmp ne %m996$.Node.type* %.tmp6859, null
br i1 %.tmp6860, label %.if.true.6861, label %.if.false.6861
.if.true.6861:
%.tmp6862 = getelementptr i8*, i8** %on_end.6858, i32 0
%.tmp6864 = getelementptr [13 x i8], [13 x i8]*@.str6863, i32 0, i32 0
%.tmp6865 = load i32, i32* %for_id.6730
%.tmp6866 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6862, i8* %.tmp6864, i32 %.tmp6865)
br label %.if.end.6861
.if.false.6861:
br label %.if.end.6861
.if.end.6861:
%.tmp6867 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6868 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6867, i32 0, i32 1
%.tmp6869 = load %m0$.File.type*, %m0$.File.type** %.tmp6868
%.tmp6871 = getelementptr [48 x i8], [48 x i8]*@.str6870, i32 0, i32 0
%.tmp6872 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6873 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %condition_info.6836
%.tmp6874 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6873, i32 0, i32 4
%.tmp6875 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp6874
%.tmp6876 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp6872, %m2859$.Type.type* %.tmp6875)
%.tmp6877 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %condition_info.6836
%.tmp6878 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp6877)
%.tmp6879 = load i32, i32* %for_id.6730
%.tmp6880 = load i8*, i8** %on_end.6858
%.tmp6881 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6869, i8* %.tmp6871, i8* %.tmp6876, i8* %.tmp6878, i32 %.tmp6879, i8* %.tmp6880)
%.tmp6882 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6883 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6882, i32 0, i32 1
%.tmp6884 = load %m0$.File.type*, %m0$.File.type** %.tmp6883
%.tmp6886 = getelementptr [19 x i8], [19 x i8]*@.str6885, i32 0, i32 0
%.tmp6887 = load i32, i32* %for_id.6730
%.tmp6888 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6884, i8* %.tmp6886, i32 %.tmp6887)
%.tmp6889 = load %m996$.Node.type*, %m996$.Node.type** %snd_colon.6846
%.tmp6890 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6889, i32 0, i32 9
%.tmp6891 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6890
%increment.6892 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6891, %m996$.Node.type** %increment.6892
%.tmp6893 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6894 = load %m996$.Node.type*, %m996$.Node.type** %for_body.6851
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_block.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp6893, %m996$.Node.type* %.tmp6894)
%.tmp6895 = load %m996$.Node.type*, %m996$.Node.type** %increment.6892
%.tmp6896 = load %m996$.Node.type*, %m996$.Node.type** %for_body.6851
%.tmp6897 = icmp ne %m996$.Node.type* %.tmp6895, %.tmp6896
br i1 %.tmp6897, label %.if.true.6898, label %.if.false.6898
.if.true.6898:
%.tmp6899 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6900 = load %m996$.Node.type*, %m996$.Node.type** %increment.6892
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_expression.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp6899, %m996$.Node.type* %.tmp6900)
br label %.if.end.6898
.if.false.6898:
br label %.if.end.6898
.if.end.6898:
%.tmp6901 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6902 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6901, i32 0, i32 1
%.tmp6903 = load %m0$.File.type*, %m0$.File.type** %.tmp6902
%.tmp6905 = getelementptr [15 x i8], [15 x i8]*@.str6904, i32 0, i32 0
%.tmp6906 = load i8*, i8** %begin_lbl.6738
%.tmp6907 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6903, i8* %.tmp6905, i8* %.tmp6906)
%.tmp6908 = load %m996$.Node.type*, %m996$.Node.type** %else_block.6856
%.tmp6909 = icmp ne %m996$.Node.type* %.tmp6908, null
br i1 %.tmp6909, label %.if.true.6910, label %.if.false.6910
.if.true.6910:
%.tmp6911 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6912 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6911, i32 0, i32 1
%.tmp6913 = load %m0$.File.type*, %m0$.File.type** %.tmp6912
%.tmp6915 = getelementptr [15 x i8], [15 x i8]*@.str6914, i32 0, i32 0
%.tmp6916 = load i32, i32* %for_id.6730
%.tmp6917 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6913, i8* %.tmp6915, i32 %.tmp6916)
%.tmp6918 = load %m996$.Node.type*, %m996$.Node.type** %else_block.6856
%.tmp6919 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6918, i32 0, i32 8
%.tmp6920 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6919
%.tmp6922 = getelementptr [6 x i8], [6 x i8]*@.str6921, i32 0, i32 0
%.tmp6923 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6920, i8* %.tmp6922)
%block.6924 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6923, %m996$.Node.type** %block.6924
%.tmp6925 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6926 = load %m996$.Node.type*, %m996$.Node.type** %block.6924
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_block.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp6925, %m996$.Node.type* %.tmp6926)
%.tmp6927 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6928 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6927, i32 0, i32 1
%.tmp6929 = load %m0$.File.type*, %m0$.File.type** %.tmp6928
%.tmp6931 = getelementptr [15 x i8], [15 x i8]*@.str6930, i32 0, i32 0
%.tmp6932 = load i8*, i8** %end_lbl.6740
%.tmp6933 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6929, i8* %.tmp6931, i8* %.tmp6932)
br label %.if.end.6910
.if.false.6910:
br label %.if.end.6910
.if.end.6910:
%.tmp6934 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6935 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp6934, i32 0, i32 1
%.tmp6936 = load %m0$.File.type*, %m0$.File.type** %.tmp6935
%.tmp6938 = getelementptr [5 x i8], [5 x i8]*@.str6937, i32 0, i32 0
%.tmp6939 = load i8*, i8** %end_lbl.6740
%.tmp6940 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6936, i8* %.tmp6938, i8* %.tmp6939)
%.tmp6941 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
call void(%m2859$.CompilerCtx.type*) @m311$pop_scope.v.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp6941)
ret void
}
define %m2859$.AssignableInfo.type* @m311$compile_declaration.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp6942 = bitcast ptr null to %m2859$.Type.type*
%decl_type.6943 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp6942, %m2859$.Type.type** %decl_type.6943
%.tmp6944 = bitcast ptr null to %m2859$.AssignableInfo.type*
%a_info.6945 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp6944, %m2859$.AssignableInfo.type** %a_info.6945
%.tmp6946 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6947 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6946, i32 0, i32 8
%.tmp6948 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6947
%.tmp6949 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6948, i32 0, i32 0
%.tmp6950 = load i8*, i8** %.tmp6949
%.tmp6952 = getelementptr [5 x i8], [5 x i8]*@.str6951, i32 0, i32 0
%.tmp6953 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6950, i8* %.tmp6952)
%.tmp6954 = icmp eq i32 %.tmp6953, 0
br i1 %.tmp6954, label %.if.true.6955, label %.if.false.6955
.if.true.6955:
%.tmp6956 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6957 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6958 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6957, i32 0, i32 8
%.tmp6959 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6958
%.tmp6960 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6959, i32 0, i32 8
%.tmp6961 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6960
%.tmp6962 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp6956, %m996$.Node.type* %.tmp6961)
store %m2859$.Type.type* %.tmp6962, %m2859$.Type.type** %decl_type.6943
br label %.if.end.6955
.if.false.6955:
br label %.if.end.6955
.if.end.6955:
%.tmp6963 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6964 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6963, i32 0, i32 8
%.tmp6965 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6964
%.tmp6967 = getelementptr [11 x i8], [11 x i8]*@.str6966, i32 0, i32 0
%.tmp6968 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6965, i8* %.tmp6967)
%assignable.6969 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6968, %m996$.Node.type** %assignable.6969
%.tmp6970 = load %m996$.Node.type*, %m996$.Node.type** %assignable.6969
%.tmp6971 = icmp ne %m996$.Node.type* %.tmp6970, null
br i1 %.tmp6971, label %.if.true.6972, label %.if.false.6972
.if.true.6972:
%.tmp6973 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6974 = load %m996$.Node.type*, %m996$.Node.type** %assignable.6969
%.tmp6975 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp6973, %m996$.Node.type* %.tmp6974)
store %m2859$.AssignableInfo.type* %.tmp6975, %m2859$.AssignableInfo.type** %a_info.6945
br label %.if.end.6972
.if.false.6972:
br label %.if.end.6972
.if.end.6972:
%.tmp6976 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6977 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp6976)
%info.6978 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp6977, %m2859$.AssignableInfo.type** %info.6978
%.tmp6979 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6978
%.tmp6980 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp6979, i32 0, i32 3
%.tmp6982 = getelementptr [9 x i8], [9 x i8]*@.str6981, i32 0, i32 0
store i8* %.tmp6982, i8** %.tmp6980
%.tmp6983 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6984 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6983, i32 0, i32 8
%.tmp6985 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6984
%.tmp6987 = getelementptr [5 x i8], [5 x i8]*@.str6986, i32 0, i32 0
%.tmp6988 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6985, i8* %.tmp6987)
%var_name.6989 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6988, %m996$.Node.type** %var_name.6989
%.tmp6990 = load %m996$.Node.type*, %m996$.Node.type** %var_name.6989
%.tmp6991 = icmp eq %m996$.Node.type* %.tmp6990, null
br i1 %.tmp6991, label %.if.true.6992, label %.if.false.6992
.if.true.6992:
%.tmp6993 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp6994 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6996 = getelementptr [31 x i8], [31 x i8]*@.str6995, i32 0, i32 0
%.tmp6997 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp6993, %m996$.Node.type* %.tmp6994, i8* %.tmp6996)
%.tmp6998 = call i32(i8*,...) @printf(i8* %.tmp6997)
%.tmp6999 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp6999
br label %.if.end.6992
.if.false.6992:
br label %.if.end.6992
.if.end.6992:
%.tmp7000 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7001 = call %m2859$.ModuleLookup.type*(%m2859$.CompilerCtx.type*) @m311$get_current_module.m2859$.ModuleLookup.typep.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp7000)
%mod.7002 = alloca %m2859$.ModuleLookup.type*
store %m2859$.ModuleLookup.type* %.tmp7001, %m2859$.ModuleLookup.type** %mod.7002
%.tmp7003 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7004 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.7002
%.tmp7005 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp7004, i32 0, i32 3
%.tmp7006 = load %m2859$.Scope.type*, %m2859$.Scope.type** %.tmp7005
%.tmp7007 = load %m996$.Node.type*, %m996$.Node.type** %var_name.6989
%.tmp7008 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7007, i32 0, i32 1
%.tmp7009 = load i8*, i8** %.tmp7008
%.tmp7010 = call %m2859$.ScopeItem.type*(%m2859$.CompilerCtx.type*,%m2859$.Scope.type*,i8*) @m311$find_defined_here.m2859$.ScopeItem.typep.m2859$.CompilerCtx.typep.m2859$.Scope.typep.cp(%m2859$.CompilerCtx.type* %.tmp7003, %m2859$.Scope.type* %.tmp7006, i8* %.tmp7009)
%.tmp7011 = icmp ne %m2859$.ScopeItem.type* %.tmp7010, null
br i1 %.tmp7011, label %.if.true.7012, label %.if.false.7012
.if.true.7012:
%.tmp7014 = getelementptr [1 x i8], [1 x i8]*@.str7013, i32 0, i32 0
%err_buf.7015 = alloca i8*
store i8* %.tmp7014, i8** %err_buf.7015
%.tmp7016 = getelementptr i8*, i8** %err_buf.7015, i32 0
%.tmp7018 = getelementptr [43 x i8], [43 x i8]*@.str7017, i32 0, i32 0
%.tmp7019 = load %m996$.Node.type*, %m996$.Node.type** %var_name.6989
%.tmp7020 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7019, i32 0, i32 1
%.tmp7021 = load i8*, i8** %.tmp7020
%.tmp7022 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7016, i8* %.tmp7018, i8* %.tmp7021)
%.tmp7023 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7024 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7025 = load i8*, i8** %err_buf.7015
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp7023, %m996$.Node.type* %.tmp7024, i8* %.tmp7025)
%.tmp7026 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp7026
br label %.if.end.7012
.if.false.7012:
br label %.if.end.7012
.if.end.7012:
%.tmp7028 = getelementptr [1 x i8], [1 x i8]*@.str7027, i32 0, i32 0
%var_id.7029 = alloca i8*
store i8* %.tmp7028, i8** %var_id.7029
%.tmp7030 = getelementptr i8*, i8** %var_id.7029, i32 0
%.tmp7032 = getelementptr [6 x i8], [6 x i8]*@.str7031, i32 0, i32 0
%.tmp7033 = load %m996$.Node.type*, %m996$.Node.type** %var_name.6989
%.tmp7034 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7033, i32 0, i32 1
%.tmp7035 = load i8*, i8** %.tmp7034
%.tmp7036 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7037 = call i32(%m2859$.CompilerCtx.type*) @m311$new_uid.i.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp7036)
%.tmp7038 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7030, i8* %.tmp7032, i8* %.tmp7035, i32 %.tmp7037)
%.tmp7039 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6978
%.tmp7040 = load i8, i8* @SCOPE_LOCAL
%.tmp7041 = load i8*, i8** %var_id.7029
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp7039, i8 %.tmp7040, i8* %.tmp7041)
%.tmp7042 = load %m2859$.Type.type*, %m2859$.Type.type** %decl_type.6943
%.tmp7043 = icmp ne %m2859$.Type.type* %.tmp7042, null
br i1 %.tmp7043, label %.if.true.7044, label %.if.false.7044
.if.true.7044:
%.tmp7045 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6978
%.tmp7046 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7045, i32 0, i32 4
%.tmp7047 = load %m2859$.Type.type*, %m2859$.Type.type** %decl_type.6943
store %m2859$.Type.type* %.tmp7047, %m2859$.Type.type** %.tmp7046
br label %.if.end.7044
.if.false.7044:
%.tmp7048 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.6945
%.tmp7049 = icmp ne %m2859$.AssignableInfo.type* %.tmp7048, null
br i1 %.tmp7049, label %.if.true.7050, label %.if.false.7050
.if.true.7050:
%.tmp7051 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6978
%.tmp7052 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7051, i32 0, i32 4
%.tmp7053 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.6945
%.tmp7054 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7053, i32 0, i32 4
%.tmp7055 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7054
store %m2859$.Type.type* %.tmp7055, %m2859$.Type.type** %.tmp7052
br label %.if.end.7050
.if.false.7050:
br label %.if.end.7050
.if.end.7050:
br label %.if.end.7044
.if.end.7044:
%.tmp7056 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7057 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6978
%.tmp7058 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7057, i32 0, i32 4
%.tmp7059 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7058
%.tmp7060 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp7056, %m2859$.Type.type* %.tmp7059)
%var_type_repr.7061 = alloca i8*
store i8* %.tmp7060, i8** %var_type_repr.7061
%.tmp7062 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.6945
%.tmp7063 = icmp ne %m2859$.AssignableInfo.type* %.tmp7062, null
br i1 %.tmp7063, label %.if.true.7064, label %.if.false.7064
.if.true.7064:
%.tmp7065 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7066 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.6945
%.tmp7067 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7066, i32 0, i32 4
%.tmp7068 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7067
%.tmp7069 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp7065, %m2859$.Type.type* %.tmp7068)
%a_type_repr.7070 = alloca i8*
store i8* %.tmp7069, i8** %a_type_repr.7070
%.tmp7071 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7072 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.6945
%.tmp7073 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7072, i32 0, i32 4
%.tmp7074 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7073
%.tmp7075 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6978
%.tmp7076 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7075, i32 0, i32 4
%.tmp7077 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7076
%.tmp7078 = call i1(%m2859$.CompilerCtx.type*,%m2859$.Type.type*,%m2859$.Type.type*) @m2860$cmp.b.m2859$.CompilerCtx.typep.m2859$.Type.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp7071, %m2859$.Type.type* %.tmp7074, %m2859$.Type.type* %.tmp7077)
%.tmp7079 = icmp eq i1 %.tmp7078, 0
br i1 %.tmp7079, label %.if.true.7080, label %.if.false.7080
.if.true.7080:
%.tmp7082 = getelementptr [1 x i8], [1 x i8]*@.str7081, i32 0, i32 0
%err_msg.7083 = alloca i8*
store i8* %.tmp7082, i8** %err_msg.7083
%.tmp7084 = getelementptr i8*, i8** %err_msg.7083, i32 0
%.tmp7086 = getelementptr [49 x i8], [49 x i8]*@.str7085, i32 0, i32 0
%.tmp7087 = load i8*, i8** %a_type_repr.7070
%.tmp7088 = load i8*, i8** %var_type_repr.7061
%.tmp7089 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7084, i8* %.tmp7086, i8* %.tmp7087, i8* %.tmp7088)
%.tmp7090 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7091 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7092 = load i8*, i8** %err_msg.7083
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp7090, %m996$.Node.type* %.tmp7091, i8* %.tmp7092)
br label %.if.end.7080
.if.false.7080:
br label %.if.end.7080
.if.end.7080:
br label %.if.end.7064
.if.false.7064:
br label %.if.end.7064
.if.end.7064:
%.tmp7093 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7094 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7095 = load %m996$.Node.type*, %m996$.Node.type** %var_name.6989
%.tmp7096 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7095, i32 0, i32 1
%.tmp7097 = load i8*, i8** %.tmp7096
%.tmp7098 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6978
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2859$.AssignableInfo.type*) @m311$define_assignable.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp7093, %m996$.Node.type* %.tmp7094, i8* %.tmp7097, %m2859$.AssignableInfo.type* %.tmp7098)
%.tmp7099 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7100 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp7099, i32 0, i32 1
%.tmp7101 = load %m0$.File.type*, %m0$.File.type** %.tmp7100
%.tmp7103 = getelementptr [16 x i8], [16 x i8]*@.str7102, i32 0, i32 0
%.tmp7104 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6978
%.tmp7105 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp7104)
%.tmp7106 = load i8*, i8** %var_type_repr.7061
%.tmp7107 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7101, i8* %.tmp7103, i8* %.tmp7105, i8* %.tmp7106)
%.tmp7108 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.6945
%.tmp7109 = icmp ne %m2859$.AssignableInfo.type* %.tmp7108, null
br i1 %.tmp7109, label %.if.true.7110, label %.if.false.7110
.if.true.7110:
%.tmp7111 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7112 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp7111, i32 0, i32 1
%.tmp7113 = load %m0$.File.type*, %m0$.File.type** %.tmp7112
%.tmp7115 = getelementptr [21 x i8], [21 x i8]*@.str7114, i32 0, i32 0
%.tmp7116 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7117 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.6945
%.tmp7118 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7117, i32 0, i32 4
%.tmp7119 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7118
%.tmp7120 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp7116, %m2859$.Type.type* %.tmp7119)
%.tmp7121 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.6945
%.tmp7122 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp7121)
%.tmp7123 = load i8*, i8** %var_type_repr.7061
%.tmp7124 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6978
%.tmp7125 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp7124)
%.tmp7126 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7113, i8* %.tmp7115, i8* %.tmp7120, i8* %.tmp7122, i8* %.tmp7123, i8* %.tmp7125)
br label %.if.end.7110
.if.false.7110:
%.tmp7127 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7128 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7129 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6978
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,%m2859$.AssignableInfo.type*) @m311$compile_zero_value.v.m2859$.CompilerCtx.typep.m996$.Node.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp7127, %m996$.Node.type* %.tmp7128, %m2859$.AssignableInfo.type* %.tmp7129)
br label %.if.end.7110
.if.end.7110:
%.tmp7130 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.6978
ret %m2859$.AssignableInfo.type* %.tmp7130
}
define void @m311$compile_zero_value.v.m2859$.CompilerCtx.typep.m996$.Node.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, %m2859$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%info = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.info.arg, %m2859$.AssignableInfo.type** %info
%.tmp7131 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp7132 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7131, i32 0, i32 4
%.tmp7133 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7132
%.tmp7134 = icmp eq %m2859$.Type.type* %.tmp7133, null
br i1 %.tmp7134, label %.if.true.7135, label %.if.false.7135
.if.true.7135:
ret void
br label %.if.end.7135
.if.false.7135:
br label %.if.end.7135
.if.end.7135:
%.tmp7136 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7137 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp7138 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7137, i32 0, i32 4
%.tmp7139 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7138
%.tmp7140 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp7136, %m2859$.Type.type* %.tmp7139)
%t_repr.7141 = alloca i8*
store i8* %.tmp7140, i8** %t_repr.7141
%.tmp7142 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp7143 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp7142)
%id.7144 = alloca i8*
store i8* %.tmp7143, i8** %id.7144
%field_id.7145 = alloca i32
store i32 0, i32* %field_id.7145
%field.7146 = alloca %m2859$.Type.type*
store %m2859$.Type.type* null, %m2859$.Type.type** %field.7146
%field_info.7147 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* null, %m2859$.AssignableInfo.type** %field_info.7147
%.tmp7148 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp7149 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7148, i32 0, i32 4
%.tmp7150 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7149
%t.7151 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp7150, %m2859$.Type.type** %t.7151
%.tmp7152 = load %m2859$.Type.type*, %m2859$.Type.type** %t.7151
%.tmp7153 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7152, i32 0, i32 0
%.tmp7154 = load i8*, i8** %.tmp7153
%.tmp7156 = getelementptr [4 x i8], [4 x i8]*@.str7155, i32 0, i32 0
%.tmp7157 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7154, i8* %.tmp7156)
%.tmp7158 = icmp eq i32 %.tmp7157, 0
%.tmp7159 = load %m2859$.Type.type*, %m2859$.Type.type** %t.7151
%.tmp7160 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7159, i32 0, i32 0
%.tmp7161 = load i8*, i8** %.tmp7160
%.tmp7163 = getelementptr [4 x i8], [4 x i8]*@.str7162, i32 0, i32 0
%.tmp7164 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7161, i8* %.tmp7163)
%.tmp7165 = icmp eq i32 %.tmp7164, 0
%.tmp7166 = or i1 %.tmp7158, %.tmp7165
%.tmp7167 = load %m2859$.Type.type*, %m2859$.Type.type** %t.7151
%.tmp7168 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7167, i32 0, i32 0
%.tmp7169 = load i8*, i8** %.tmp7168
%.tmp7171 = getelementptr [5 x i8], [5 x i8]*@.str7170, i32 0, i32 0
%.tmp7172 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7169, i8* %.tmp7171)
%.tmp7173 = icmp eq i32 %.tmp7172, 0
%.tmp7174 = or i1 %.tmp7166, %.tmp7173
br i1 %.tmp7174, label %.if.true.7175, label %.if.false.7175
.if.true.7175:
%.tmp7176 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7177 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp7176, i32 0, i32 1
%.tmp7178 = load %m0$.File.type*, %m0$.File.type** %.tmp7177
%.tmp7180 = getelementptr [21 x i8], [21 x i8]*@.str7179, i32 0, i32 0
%.tmp7181 = load i8*, i8** %t_repr.7141
%.tmp7182 = load i8*, i8** %t_repr.7141
%.tmp7183 = load i8*, i8** %id.7144
%.tmp7184 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7178, i8* %.tmp7180, i8* %.tmp7181, i32 0, i8* %.tmp7182, i8* %.tmp7183)
br label %.if.end.7175
.if.false.7175:
%.tmp7185 = load %m2859$.Type.type*, %m2859$.Type.type** %t.7151
%.tmp7186 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7185, i32 0, i32 0
%.tmp7187 = load i8*, i8** %.tmp7186
%.tmp7189 = getelementptr [4 x i8], [4 x i8]*@.str7188, i32 0, i32 0
%.tmp7190 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7187, i8* %.tmp7189)
%.tmp7191 = icmp eq i32 %.tmp7190, 0
br i1 %.tmp7191, label %.if.true.7192, label %.if.false.7192
.if.true.7192:
%.tmp7193 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7194 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp7193, i32 0, i32 1
%.tmp7195 = load %m0$.File.type*, %m0$.File.type** %.tmp7194
%.tmp7197 = getelementptr [21 x i8], [21 x i8]*@.str7196, i32 0, i32 0
%.tmp7198 = load i8*, i8** %t_repr.7141
%.tmp7200 = getelementptr [5 x i8], [5 x i8]*@.str7199, i32 0, i32 0
%.tmp7201 = load i8*, i8** %t_repr.7141
%.tmp7202 = load i8*, i8** %id.7144
%.tmp7203 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7195, i8* %.tmp7197, i8* %.tmp7198, i8* %.tmp7200, i8* %.tmp7201, i8* %.tmp7202)
br label %.if.end.7192
.if.false.7192:
%.tmp7204 = load %m2859$.Type.type*, %m2859$.Type.type** %t.7151
%.tmp7205 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7204, i32 0, i32 0
%.tmp7206 = load i8*, i8** %.tmp7205
%.tmp7208 = getelementptr [7 x i8], [7 x i8]*@.str7207, i32 0, i32 0
%.tmp7209 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7206, i8* %.tmp7208)
%.tmp7210 = icmp eq i32 %.tmp7209, 0
br i1 %.tmp7210, label %.if.true.7211, label %.if.false.7211
.if.true.7211:
%.tmp7213 = load %m2859$.Type.type*, %m2859$.Type.type** %t.7151
%.tmp7214 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7213, i32 0, i32 3
%.tmp7215 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7214
store %m2859$.Type.type* %.tmp7215, %m2859$.Type.type** %field.7146
br label %.for.start.7212
.for.start.7212:
%.tmp7216 = load %m2859$.Type.type*, %m2859$.Type.type** %field.7146
%.tmp7217 = icmp ne %m2859$.Type.type* %.tmp7216, null
br i1 %.tmp7217, label %.for.continue.7212, label %.for.end.7212
.for.continue.7212:
%.tmp7218 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7219 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp7218)
store %m2859$.AssignableInfo.type* %.tmp7219, %m2859$.AssignableInfo.type** %field_info.7147
%.tmp7220 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7221 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %field_info.7147
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp7220, %m2859$.AssignableInfo.type* %.tmp7221)
%.tmp7222 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %field_info.7147
%.tmp7223 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7222, i32 0, i32 4
%.tmp7224 = load %m2859$.Type.type*, %m2859$.Type.type** %field.7146
store %m2859$.Type.type* %.tmp7224, %m2859$.Type.type** %.tmp7223
%.tmp7225 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7226 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp7225, i32 0, i32 1
%.tmp7227 = load %m0$.File.type*, %m0$.File.type** %.tmp7226
%.tmp7229 = getelementptr [46 x i8], [46 x i8]*@.str7228, i32 0, i32 0
%.tmp7230 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %field_info.7147
%.tmp7231 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp7230)
%.tmp7232 = load i8*, i8** %t_repr.7141
%.tmp7233 = load i8*, i8** %t_repr.7141
%.tmp7234 = load i8*, i8** %id.7144
%.tmp7235 = load i32, i32* %field_id.7145
%.tmp7236 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7227, i8* %.tmp7229, i8* %.tmp7231, i8* %.tmp7232, i8* %.tmp7233, i8* %.tmp7234, i32 %.tmp7235)
%.tmp7237 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7238 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7239 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %field_info.7147
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,%m2859$.AssignableInfo.type*) @m311$compile_zero_value.v.m2859$.CompilerCtx.typep.m996$.Node.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp7237, %m996$.Node.type* %.tmp7238, %m2859$.AssignableInfo.type* %.tmp7239)
%.tmp7240 = load i32, i32* %field_id.7145
%.tmp7241 = add i32 %.tmp7240, 1
store i32 %.tmp7241, i32* %field_id.7145
%.tmp7242 = load %m2859$.Type.type*, %m2859$.Type.type** %field.7146
%.tmp7243 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7242, i32 0, i32 4
%.tmp7244 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7243
store %m2859$.Type.type* %.tmp7244, %m2859$.Type.type** %field.7146
br label %.for.start.7212
.for.end.7212:
br label %.if.end.7211
.if.false.7211:
%.tmp7245 = load %m2859$.Type.type*, %m2859$.Type.type** %t.7151
%.tmp7246 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7245, i32 0, i32 0
%.tmp7247 = load i8*, i8** %.tmp7246
%.tmp7249 = getelementptr [10 x i8], [10 x i8]*@.str7248, i32 0, i32 0
%.tmp7250 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7247, i8* %.tmp7249)
%.tmp7251 = icmp eq i32 %.tmp7250, 0
br i1 %.tmp7251, label %.if.true.7252, label %.if.false.7252
.if.true.7252:
%.tmp7254 = load %m2859$.Type.type*, %m2859$.Type.type** %t.7151
%.tmp7255 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7254, i32 0, i32 3
%.tmp7256 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7255
%.tmp7257 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7256, i32 0, i32 3
%.tmp7258 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7257
store %m2859$.Type.type* %.tmp7258, %m2859$.Type.type** %field.7146
br label %.for.start.7253
.for.start.7253:
%.tmp7259 = load %m2859$.Type.type*, %m2859$.Type.type** %field.7146
%.tmp7260 = icmp ne %m2859$.Type.type* %.tmp7259, null
br i1 %.tmp7260, label %.for.continue.7253, label %.for.end.7253
.for.continue.7253:
%.tmp7261 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7262 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp7261)
store %m2859$.AssignableInfo.type* %.tmp7262, %m2859$.AssignableInfo.type** %field_info.7147
%.tmp7263 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7264 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %field_info.7147
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp7263, %m2859$.AssignableInfo.type* %.tmp7264)
%.tmp7265 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %field_info.7147
%.tmp7266 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7265, i32 0, i32 4
%.tmp7267 = load %m2859$.Type.type*, %m2859$.Type.type** %field.7146
store %m2859$.Type.type* %.tmp7267, %m2859$.Type.type** %.tmp7266
%.tmp7268 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7269 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp7268, i32 0, i32 1
%.tmp7270 = load %m0$.File.type*, %m0$.File.type** %.tmp7269
%.tmp7272 = getelementptr [46 x i8], [46 x i8]*@.str7271, i32 0, i32 0
%.tmp7273 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %field_info.7147
%.tmp7274 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp7273)
%.tmp7275 = load i8*, i8** %t_repr.7141
%.tmp7276 = load i8*, i8** %t_repr.7141
%.tmp7277 = load i8*, i8** %id.7144
%.tmp7278 = load i32, i32* %field_id.7145
%.tmp7279 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7270, i8* %.tmp7272, i8* %.tmp7274, i8* %.tmp7275, i8* %.tmp7276, i8* %.tmp7277, i32 %.tmp7278)
%.tmp7280 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7281 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7282 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %field_info.7147
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,%m2859$.AssignableInfo.type*) @m311$compile_zero_value.v.m2859$.CompilerCtx.typep.m996$.Node.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp7280, %m996$.Node.type* %.tmp7281, %m2859$.AssignableInfo.type* %.tmp7282)
%.tmp7283 = load i32, i32* %field_id.7145
%.tmp7284 = add i32 %.tmp7283, 1
store i32 %.tmp7284, i32* %field_id.7145
%.tmp7285 = load %m2859$.Type.type*, %m2859$.Type.type** %field.7146
%.tmp7286 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7285, i32 0, i32 4
%.tmp7287 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7286
store %m2859$.Type.type* %.tmp7287, %m2859$.Type.type** %field.7146
br label %.for.start.7253
.for.end.7253:
br label %.if.end.7252
.if.false.7252:
%.tmp7288 = load %m2859$.Type.type*, %m2859$.Type.type** %t.7151
%.tmp7289 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7288, i32 0, i32 0
%.tmp7290 = load i8*, i8** %.tmp7289
%.tmp7292 = getelementptr [6 x i8], [6 x i8]*@.str7291, i32 0, i32 0
%.tmp7293 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7290, i8* %.tmp7292)
%.tmp7294 = icmp eq i32 %.tmp7293, 0
br i1 %.tmp7294, label %.if.true.7295, label %.if.false.7295
.if.true.7295:
ret void
br label %.if.end.7295
.if.false.7295:
%.tmp7296 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7297 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7299 = getelementptr [44 x i8], [44 x i8]*@.str7298, i32 0, i32 0
%.tmp7300 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp7296, %m996$.Node.type* %.tmp7297, i8* %.tmp7299)
%.tmp7301 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp7302 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7301, i32 0, i32 4
%.tmp7303 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7302
%.tmp7304 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7303, i32 0, i32 0
%.tmp7305 = load i8*, i8** %.tmp7304
%.tmp7306 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7307 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp7308 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7307, i32 0, i32 4
%.tmp7309 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7308
%.tmp7310 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp7306, %m2859$.Type.type* %.tmp7309)
%.tmp7311 = call i32(i8*,...) @printf(i8* %.tmp7300, i8* %.tmp7305, i8* %.tmp7310)
ret void
br label %.if.end.7295
.if.end.7295:
br label %.if.end.7252
.if.end.7252:
br label %.if.end.7211
.if.end.7211:
br label %.if.end.7192
.if.end.7192:
br label %.if.end.7175
.if.end.7175:
ret void
}
define void @m311$compile_if_block.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp7312 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7313 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7312, i32 0, i32 8
%.tmp7314 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7313
%.tmp7316 = getelementptr [11 x i8], [11 x i8]*@.str7315, i32 0, i32 0
%.tmp7317 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp7314, i8* %.tmp7316)
%assignable.7318 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp7317, %m996$.Node.type** %assignable.7318
%.tmp7319 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7320 = load %m996$.Node.type*, %m996$.Node.type** %assignable.7318
%.tmp7321 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp7319, %m996$.Node.type* %.tmp7320)
%a_info.7322 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp7321, %m2859$.AssignableInfo.type** %a_info.7322
%.tmp7323 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.7322
%.tmp7324 = icmp eq %m2859$.AssignableInfo.type* %.tmp7323, null
br i1 %.tmp7324, label %.if.true.7325, label %.if.false.7325
.if.true.7325:
ret void
br label %.if.end.7325
.if.false.7325:
br label %.if.end.7325
.if.end.7325:
%.tmp7326 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7327 = call i32(%m2859$.CompilerCtx.type*) @m311$new_uid.i.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp7326)
%if_id.7328 = alloca i32
store i32 %.tmp7327, i32* %if_id.7328
%.tmp7329 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7330 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp7329, i32 0, i32 1
%.tmp7331 = load %m0$.File.type*, %m0$.File.type** %.tmp7330
%.tmp7333 = getelementptr [53 x i8], [53 x i8]*@.str7332, i32 0, i32 0
%.tmp7334 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7335 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.7322
%.tmp7336 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7335, i32 0, i32 4
%.tmp7337 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7336
%.tmp7338 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp7334, %m2859$.Type.type* %.tmp7337)
%.tmp7339 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %a_info.7322
%.tmp7340 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp7339)
%.tmp7341 = load i32, i32* %if_id.7328
%.tmp7342 = load i32, i32* %if_id.7328
%.tmp7343 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7331, i8* %.tmp7333, i8* %.tmp7338, i8* %.tmp7340, i32 %.tmp7341, i32 %.tmp7342)
%.tmp7344 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7345 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp7344, i32 0, i32 1
%.tmp7346 = load %m0$.File.type*, %m0$.File.type** %.tmp7345
%.tmp7348 = getelementptr [14 x i8], [14 x i8]*@.str7347, i32 0, i32 0
%.tmp7349 = load i32, i32* %if_id.7328
%.tmp7350 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7346, i8* %.tmp7348, i32 %.tmp7349)
%.tmp7351 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7352 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7351, i32 0, i32 8
%.tmp7353 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7352
%.tmp7355 = getelementptr [6 x i8], [6 x i8]*@.str7354, i32 0, i32 0
%.tmp7356 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp7353, i8* %.tmp7355)
%block.7357 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp7356, %m996$.Node.type** %block.7357
%.tmp7358 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7359 = load %m996$.Node.type*, %m996$.Node.type** %block.7357
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_block.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp7358, %m996$.Node.type* %.tmp7359)
%.tmp7360 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7361 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp7360, i32 0, i32 1
%.tmp7362 = load %m0$.File.type*, %m0$.File.type** %.tmp7361
%.tmp7364 = getelementptr [23 x i8], [23 x i8]*@.str7363, i32 0, i32 0
%.tmp7365 = load i32, i32* %if_id.7328
%.tmp7366 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7362, i8* %.tmp7364, i32 %.tmp7365)
%.tmp7367 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7368 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp7367, i32 0, i32 1
%.tmp7369 = load %m0$.File.type*, %m0$.File.type** %.tmp7368
%.tmp7371 = getelementptr [15 x i8], [15 x i8]*@.str7370, i32 0, i32 0
%.tmp7372 = load i32, i32* %if_id.7328
%.tmp7373 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7369, i8* %.tmp7371, i32 %.tmp7372)
%.tmp7374 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7375 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7374, i32 0, i32 8
%.tmp7376 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7375
%.tmp7378 = getelementptr [11 x i8], [11 x i8]*@.str7377, i32 0, i32 0
%.tmp7379 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp7376, i8* %.tmp7378)
%else_block.7380 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp7379, %m996$.Node.type** %else_block.7380
%.tmp7381 = load %m996$.Node.type*, %m996$.Node.type** %else_block.7380
%.tmp7382 = icmp ne %m996$.Node.type* %.tmp7381, null
br i1 %.tmp7382, label %.if.true.7383, label %.if.false.7383
.if.true.7383:
%.tmp7384 = load %m996$.Node.type*, %m996$.Node.type** %else_block.7380
%.tmp7385 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7384, i32 0, i32 8
%.tmp7386 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7385
%.tmp7387 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7386, i32 0, i32 0
%.tmp7388 = load i8*, i8** %.tmp7387
%.tmp7390 = getelementptr [11 x i8], [11 x i8]*@.str7389, i32 0, i32 0
%.tmp7391 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7388, i8* %.tmp7390)
%.tmp7392 = icmp eq i32 %.tmp7391, 0
br i1 %.tmp7392, label %.if.true.7393, label %.if.false.7393
.if.true.7393:
%.tmp7394 = load %m996$.Node.type*, %m996$.Node.type** %else_block.7380
%.tmp7395 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7394, i32 0, i32 8
%.tmp7396 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7395
%.tmp7397 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7396, i32 0, i32 8
%.tmp7398 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7397
%.tmp7400 = getelementptr [6 x i8], [6 x i8]*@.str7399, i32 0, i32 0
%.tmp7401 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp7398, i8* %.tmp7400)
store %m996$.Node.type* %.tmp7401, %m996$.Node.type** %block.7357
%.tmp7402 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7403 = load %m996$.Node.type*, %m996$.Node.type** %block.7357
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_block.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp7402, %m996$.Node.type* %.tmp7403)
br label %.if.end.7393
.if.false.7393:
%.tmp7404 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7405 = load %m996$.Node.type*, %m996$.Node.type** %else_block.7380
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_if_block.v.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp7404, %m996$.Node.type* %.tmp7405)
br label %.if.end.7393
.if.end.7393:
br label %.if.end.7383
.if.false.7383:
br label %.if.end.7383
.if.end.7383:
%.tmp7406 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7407 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp7406, i32 0, i32 1
%.tmp7408 = load %m0$.File.type*, %m0$.File.type** %.tmp7407
%.tmp7410 = getelementptr [23 x i8], [23 x i8]*@.str7409, i32 0, i32 0
%.tmp7411 = load i32, i32* %if_id.7328
%.tmp7412 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7408, i8* %.tmp7410, i32 %.tmp7411)
%.tmp7413 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7414 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp7413, i32 0, i32 1
%.tmp7415 = load %m0$.File.type*, %m0$.File.type** %.tmp7414
%.tmp7417 = getelementptr [13 x i8], [13 x i8]*@.str7416, i32 0, i32 0
%.tmp7418 = load i32, i32* %if_id.7328
%.tmp7419 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7415, i8* %.tmp7417, i32 %.tmp7418)
ret void
}
define void @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%curr_node = alloca %m996$.Node.type*
store %m996$.Node.type* %.curr_node.arg, %m996$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp7420 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp7421 = icmp ne %m996$.Node.type* %.tmp7420, null
br i1 %.tmp7421, label %.if.true.7422, label %.if.false.7422
.if.true.7422:
%.tmp7423 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7424 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp7423, i32 0, i32 7
%.tmp7425 = load i8*, i8** %.tmp7424
%.tmp7426 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp7427 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7426, i32 0, i32 3
%.tmp7428 = load i32, i32* %.tmp7427
%.tmp7429 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp7430 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7429, i32 0, i32 4
%.tmp7431 = load i32, i32* %.tmp7430
%.tmp7432 = load i8*, i8** %msg
%.tmp7433 = call %m312$.Error.type*(i8*,i32,i32,i8*) @m312$new.m312$.Error.typep.cp.i.i.cp(i8* %.tmp7425, i32 %.tmp7428, i32 %.tmp7431, i8* %.tmp7432)
%err.7434 = alloca %m312$.Error.type*
store %m312$.Error.type* %.tmp7433, %m312$.Error.type** %err.7434
%.tmp7435 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7436 = load %m312$.Error.type*, %m312$.Error.type** %err.7434
call void(%m2859$.CompilerCtx.type*,%m312$.Error.type*) @m311$append_error.v.m2859$.CompilerCtx.typep.m312$.Error.typep(%m2859$.CompilerCtx.type* %.tmp7435, %m312$.Error.type* %.tmp7436)
br label %.if.end.7422
.if.false.7422:
%.tmp7438 = getelementptr [61 x i8], [61 x i8]*@.str7437, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp7438)
br label %.if.end.7422
.if.end.7422:
ret void
}
define void @m311$define_assignable.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, i8* %.name.arg, %m2859$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.info.arg, %m2859$.AssignableInfo.type** %info
%.tmp7439 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7440 = call %m2859$.ModuleLookup.type*(%m2859$.CompilerCtx.type*) @m311$get_current_module.m2859$.ModuleLookup.typep.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp7439)
%mod.7441 = alloca %m2859$.ModuleLookup.type*
store %m2859$.ModuleLookup.type* %.tmp7440, %m2859$.ModuleLookup.type** %mod.7441
%.tmp7442 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.7441
%.tmp7443 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp7442, i32 0, i32 3
%.tmp7444 = load %m2859$.Scope.type*, %m2859$.Scope.type** %.tmp7443
%.tmp7445 = icmp ne %m2859$.Scope.type* %.tmp7444, null
%.tmp7447 = getelementptr [82 x i8], [82 x i8]*@.str7446, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7445, i8* %.tmp7447)
%.tmp7448 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.7441
%.tmp7449 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp7448, i32 0, i32 3
%.tmp7450 = load %m2859$.Scope.type*, %m2859$.Scope.type** %.tmp7449
%current_scope.7451 = alloca %m2859$.Scope.type*
store %m2859$.Scope.type* %.tmp7450, %m2859$.Scope.type** %current_scope.7451
%.tmp7452 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* null, i32 1
%.tmp7453 = ptrtoint %m2859$.ScopeItem.type* %.tmp7452 to i32
%.tmp7454 = call i8*(i32) @malloc(i32 %.tmp7453)
%.tmp7455 = bitcast i8* %.tmp7454 to %m2859$.ScopeItem.type*
%newitem.7456 = alloca %m2859$.ScopeItem.type*
store %m2859$.ScopeItem.type* %.tmp7455, %m2859$.ScopeItem.type** %newitem.7456
%.tmp7457 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %newitem.7456
%.tmp7458 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp7457, i32 0, i32 0
%.tmp7459 = load i8*, i8** %name
store i8* %.tmp7459, i8** %.tmp7458
%.tmp7460 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %newitem.7456
%.tmp7461 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp7460, i32 0, i32 1
%.tmp7462 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
store %m2859$.AssignableInfo.type* %.tmp7462, %m2859$.AssignableInfo.type** %.tmp7461
%.tmp7463 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %newitem.7456
%.tmp7464 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp7463, i32 0, i32 2
store %m2859$.ScopeItem.type* null, %m2859$.ScopeItem.type** %.tmp7464
%.tmp7465 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp7466 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7465, i32 0, i32 2
%.tmp7467 = load i8*, i8** %name
store i8* %.tmp7467, i8** %.tmp7466
%.tmp7468 = load %m2859$.Scope.type*, %m2859$.Scope.type** %current_scope.7451
%.tmp7469 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp7468, i32 0, i32 1
%.tmp7470 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %.tmp7469
%.tmp7471 = icmp eq %m2859$.ScopeItem.type* %.tmp7470, null
br i1 %.tmp7471, label %.if.true.7472, label %.if.false.7472
.if.true.7472:
%.tmp7473 = load %m2859$.Scope.type*, %m2859$.Scope.type** %current_scope.7451
%.tmp7474 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp7473, i32 0, i32 1
%.tmp7475 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %newitem.7456
store %m2859$.ScopeItem.type* %.tmp7475, %m2859$.ScopeItem.type** %.tmp7474
ret void
br label %.if.end.7472
.if.false.7472:
br label %.if.end.7472
.if.end.7472:
%.tmp7476 = load %m2859$.Scope.type*, %m2859$.Scope.type** %current_scope.7451
%.tmp7477 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp7476, i32 0, i32 1
%.tmp7478 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %.tmp7477
%last_item.7479 = alloca %m2859$.ScopeItem.type*
store %m2859$.ScopeItem.type* %.tmp7478, %m2859$.ScopeItem.type** %last_item.7479
%.tmp7481 = getelementptr [1 x i8], [1 x i8]*@.str7480, i32 0, i32 0
%err_buf.7482 = alloca i8*
store i8* %.tmp7481, i8** %err_buf.7482
%.tmp7483 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %last_item.7479
%.tmp7484 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp7483, i32 0, i32 0
%.tmp7485 = load i8*, i8** %.tmp7484
%.tmp7486 = load i8*, i8** %name
%.tmp7487 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7485, i8* %.tmp7486)
%.tmp7488 = icmp eq i32 %.tmp7487, 0
br i1 %.tmp7488, label %.if.true.7489, label %.if.false.7489
.if.true.7489:
%.tmp7490 = getelementptr i8*, i8** %err_buf.7482, i32 0
%.tmp7492 = getelementptr [43 x i8], [43 x i8]*@.str7491, i32 0, i32 0
%.tmp7493 = load i8*, i8** %name
%.tmp7494 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7490, i8* %.tmp7492, i8* %.tmp7493)
%.tmp7495 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7496 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7497 = load i8*, i8** %err_buf.7482
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp7495, %m996$.Node.type* %.tmp7496, i8* %.tmp7497)
br label %.if.end.7489
.if.false.7489:
br label %.if.end.7489
.if.end.7489:
br label %.for.start.7498
.for.start.7498:
%.tmp7499 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %last_item.7479
%.tmp7500 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp7499, i32 0, i32 2
%.tmp7501 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %.tmp7500
%.tmp7502 = icmp ne %m2859$.ScopeItem.type* %.tmp7501, null
br i1 %.tmp7502, label %.for.continue.7498, label %.for.else.7498
.for.continue.7498:
%.tmp7503 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %last_item.7479
%.tmp7504 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp7503, i32 0, i32 0
%.tmp7505 = load i8*, i8** %.tmp7504
%.tmp7506 = load i8*, i8** %name
%.tmp7507 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7505, i8* %.tmp7506)
%.tmp7508 = icmp eq i32 %.tmp7507, 0
br i1 %.tmp7508, label %.if.true.7509, label %.if.false.7509
.if.true.7509:
%.tmp7510 = getelementptr i8*, i8** %err_buf.7482, i32 0
%.tmp7512 = getelementptr [43 x i8], [43 x i8]*@.str7511, i32 0, i32 0
%.tmp7513 = load i8*, i8** %name
%.tmp7514 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7510, i8* %.tmp7512, i8* %.tmp7513)
%.tmp7515 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7516 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7517 = load i8*, i8** %err_buf.7482
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp7515, %m996$.Node.type* %.tmp7516, i8* %.tmp7517)
br label %.for.end.7498
br label %.if.end.7509
.if.false.7509:
br label %.if.end.7509
.if.end.7509:
%.tmp7518 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %last_item.7479
%.tmp7519 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp7518, i32 0, i32 2
%.tmp7520 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %.tmp7519
store %m2859$.ScopeItem.type* %.tmp7520, %m2859$.ScopeItem.type** %last_item.7479
br label %.for.start.7498
.for.else.7498:
%.tmp7521 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %last_item.7479
%.tmp7522 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp7521, i32 0, i32 2
%.tmp7523 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %newitem.7456
store %m2859$.ScopeItem.type* %.tmp7523, %m2859$.ScopeItem.type** %.tmp7522
br label %.for.end.7498
.for.end.7498:
ret void
}
define %m2859$.ScopeItem.type* @m311$find_defined_in.m2859$.ScopeItem.typep.m2859$.CompilerCtx.typep.cp.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m996$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m996$.Node.type*
store %m996$.Node.type* %.dotted_name.arg, %m996$.Node.type** %dotted_name
%.tmp7524 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7525 = load i8*, i8** %module
%.tmp7526 = load %m996$.Node.type*, %m996$.Node.type** %dotted_name
%.tmp7527 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7526, i32 0, i32 1
%.tmp7528 = load i8*, i8** %.tmp7527
%.tmp7529 = call %m2859$.ScopeItem.type*(%m2859$.CompilerCtx.type*,i8*,i8*) @m311$find_defined_str.m2859$.ScopeItem.typep.m2859$.CompilerCtx.typep.cp.cp(%m2859$.CompilerCtx.type* %.tmp7524, i8* %.tmp7525, i8* %.tmp7528)
%found.7530 = alloca %m2859$.ScopeItem.type*
store %m2859$.ScopeItem.type* %.tmp7529, %m2859$.ScopeItem.type** %found.7530
%.tmp7531 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %found.7530
%.tmp7532 = icmp eq %m2859$.ScopeItem.type* %.tmp7531, null
br i1 %.tmp7532, label %.if.true.7533, label %.if.false.7533
.if.true.7533:
%.tmp7534 = bitcast ptr null to %m2859$.ScopeItem.type*
ret %m2859$.ScopeItem.type* %.tmp7534
br label %.if.end.7533
.if.false.7533:
br label %.if.end.7533
.if.end.7533:
br label %.for.start.7535
.for.start.7535:
%.tmp7536 = load %m996$.Node.type*, %m996$.Node.type** %dotted_name
%.tmp7537 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7536, i32 0, i32 9
%.tmp7538 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7537
%.tmp7539 = icmp ne %m996$.Node.type* %.tmp7538, null
%.tmp7540 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %found.7530
%.tmp7541 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp7540, i32 0, i32 1
%.tmp7542 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %.tmp7541
%.tmp7543 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7542, i32 0, i32 3
%.tmp7544 = load i8*, i8** %.tmp7543
%.tmp7546 = getelementptr [7 x i8], [7 x i8]*@.str7545, i32 0, i32 0
%.tmp7547 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7544, i8* %.tmp7546)
%.tmp7548 = icmp eq i32 %.tmp7547, 0
%.tmp7549 = and i1 %.tmp7539, %.tmp7548
br i1 %.tmp7549, label %.for.continue.7535, label %.for.end.7535
.for.continue.7535:
%.tmp7550 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7551 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %found.7530
%.tmp7552 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp7551, i32 0, i32 1
%.tmp7553 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %.tmp7552
%.tmp7554 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7553, i32 0, i32 0
%.tmp7555 = load i8*, i8** %.tmp7554
%.tmp7556 = load %m996$.Node.type*, %m996$.Node.type** %dotted_name
%.tmp7557 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7556, i32 0, i32 9
%.tmp7558 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7557
%.tmp7559 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7558, i32 0, i32 9
%.tmp7560 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7559
%.tmp7561 = call %m2859$.ScopeItem.type*(%m2859$.CompilerCtx.type*,i8*,%m996$.Node.type*) @m311$find_defined_in.m2859$.ScopeItem.typep.m2859$.CompilerCtx.typep.cp.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp7550, i8* %.tmp7555, %m996$.Node.type* %.tmp7560)
store %m2859$.ScopeItem.type* %.tmp7561, %m2859$.ScopeItem.type** %found.7530
%.tmp7562 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %found.7530
%.tmp7563 = icmp eq %m2859$.ScopeItem.type* %.tmp7562, null
br i1 %.tmp7563, label %.if.true.7564, label %.if.false.7564
.if.true.7564:
%.tmp7565 = bitcast ptr null to %m2859$.ScopeItem.type*
ret %m2859$.ScopeItem.type* %.tmp7565
br label %.if.end.7564
.if.false.7564:
br label %.if.end.7564
.if.end.7564:
br label %.for.start.7535
.for.end.7535:
%.tmp7566 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %found.7530
ret %m2859$.ScopeItem.type* %.tmp7566
}
define %m2859$.ScopeItem.type* @m311$find_defined_here.m2859$.ScopeItem.typep.m2859$.CompilerCtx.typep.m2859$.Scope.typep.cp(%m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%s = alloca %m2859$.Scope.type*
store %m2859$.Scope.type* %.s.arg, %m2859$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp7567 = load %m2859$.Scope.type*, %m2859$.Scope.type** %s
%.tmp7568 = icmp eq %m2859$.Scope.type* %.tmp7567, null
br i1 %.tmp7568, label %.if.true.7569, label %.if.false.7569
.if.true.7569:
%.tmp7570 = bitcast ptr null to %m2859$.ScopeItem.type*
ret %m2859$.ScopeItem.type* %.tmp7570
br label %.if.end.7569
.if.false.7569:
br label %.if.end.7569
.if.end.7569:
%.tmp7572 = load %m2859$.Scope.type*, %m2859$.Scope.type** %s
%.tmp7573 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp7572, i32 0, i32 1
%.tmp7574 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %.tmp7573
%item.7575 = alloca %m2859$.ScopeItem.type*
store %m2859$.ScopeItem.type* %.tmp7574, %m2859$.ScopeItem.type** %item.7575
br label %.for.start.7571
.for.start.7571:
%.tmp7576 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %item.7575
%.tmp7577 = icmp ne %m2859$.ScopeItem.type* %.tmp7576, null
br i1 %.tmp7577, label %.for.continue.7571, label %.for.end.7571
.for.continue.7571:
%.tmp7578 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %item.7575
%.tmp7579 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp7578, i32 0, i32 0
%.tmp7580 = load i8*, i8** %.tmp7579
%.tmp7581 = load i8*, i8** %name
%.tmp7582 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7580, i8* %.tmp7581)
%.tmp7583 = icmp eq i32 %.tmp7582, 0
br i1 %.tmp7583, label %.if.true.7584, label %.if.false.7584
.if.true.7584:
%.tmp7585 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %item.7575
ret %m2859$.ScopeItem.type* %.tmp7585
br label %.if.end.7584
.if.false.7584:
br label %.if.end.7584
.if.end.7584:
%.tmp7586 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %item.7575
%.tmp7587 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp7586, i32 0, i32 2
%.tmp7588 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %.tmp7587
store %m2859$.ScopeItem.type* %.tmp7588, %m2859$.ScopeItem.type** %item.7575
br label %.for.start.7571
.for.end.7571:
%.tmp7589 = bitcast ptr null to %m2859$.ScopeItem.type*
ret %m2859$.ScopeItem.type* %.tmp7589
}
define %m2859$.ScopeItem.type* @m311$find_defined_str.m2859$.ScopeItem.typep.m2859$.CompilerCtx.typep.cp.cp(%m2859$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp7590 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7591 = load i8*, i8** %module
%.tmp7592 = call %m2859$.ModuleLookup.type*(%m2859$.CompilerCtx.type*,i8*) @m311$get_module.m2859$.ModuleLookup.typep.m2859$.CompilerCtx.typep.cp(%m2859$.CompilerCtx.type* %.tmp7590, i8* %.tmp7591)
%mod.7593 = alloca %m2859$.ModuleLookup.type*
store %m2859$.ModuleLookup.type* %.tmp7592, %m2859$.ModuleLookup.type** %mod.7593
%.tmp7594 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.7593
%.tmp7595 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp7594, i32 0, i32 3
%.tmp7596 = load %m2859$.Scope.type*, %m2859$.Scope.type** %.tmp7595
%.tmp7597 = icmp ne %m2859$.Scope.type* %.tmp7596, null
%.tmp7599 = getelementptr [77 x i8], [77 x i8]*@.str7598, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7597, i8* %.tmp7599)
%.tmp7601 = load %m2859$.ModuleLookup.type*, %m2859$.ModuleLookup.type** %mod.7593
%.tmp7602 = getelementptr %m2859$.ModuleLookup.type, %m2859$.ModuleLookup.type* %.tmp7601, i32 0, i32 3
%.tmp7603 = load %m2859$.Scope.type*, %m2859$.Scope.type** %.tmp7602
%s.7604 = alloca %m2859$.Scope.type*
store %m2859$.Scope.type* %.tmp7603, %m2859$.Scope.type** %s.7604
br label %.for.start.7600
.for.start.7600:
%.tmp7605 = load %m2859$.Scope.type*, %m2859$.Scope.type** %s.7604
%.tmp7606 = icmp ne %m2859$.Scope.type* %.tmp7605, null
br i1 %.tmp7606, label %.for.continue.7600, label %.for.end.7600
.for.continue.7600:
%.tmp7607 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7608 = load %m2859$.Scope.type*, %m2859$.Scope.type** %s.7604
%.tmp7609 = load i8*, i8** %assignable_name
%.tmp7610 = call %m2859$.ScopeItem.type*(%m2859$.CompilerCtx.type*,%m2859$.Scope.type*,i8*) @m311$find_defined_here.m2859$.ScopeItem.typep.m2859$.CompilerCtx.typep.m2859$.Scope.typep.cp(%m2859$.CompilerCtx.type* %.tmp7607, %m2859$.Scope.type* %.tmp7608, i8* %.tmp7609)
%item.7611 = alloca %m2859$.ScopeItem.type*
store %m2859$.ScopeItem.type* %.tmp7610, %m2859$.ScopeItem.type** %item.7611
%.tmp7612 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %item.7611
%.tmp7613 = icmp ne %m2859$.ScopeItem.type* %.tmp7612, null
br i1 %.tmp7613, label %.if.true.7614, label %.if.false.7614
.if.true.7614:
%.tmp7615 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %item.7611
ret %m2859$.ScopeItem.type* %.tmp7615
br label %.if.end.7614
.if.false.7614:
br label %.if.end.7614
.if.end.7614:
%.tmp7616 = load %m2859$.Scope.type*, %m2859$.Scope.type** %s.7604
%.tmp7617 = getelementptr %m2859$.Scope.type, %m2859$.Scope.type* %.tmp7616, i32 0, i32 5
%.tmp7618 = load %m2859$.Scope.type*, %m2859$.Scope.type** %.tmp7617
store %m2859$.Scope.type* %.tmp7618, %m2859$.Scope.type** %s.7604
br label %.for.start.7600
.for.end.7600:
%.tmp7619 = bitcast ptr null to %m2859$.ScopeItem.type*
ret %m2859$.ScopeItem.type* %.tmp7619
}
define %m2859$.ScopeItem.type* @m311$find_defined.m2859$.ScopeItem.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%dotted_name = alloca %m996$.Node.type*
store %m996$.Node.type* %.dotted_name.arg, %m996$.Node.type** %dotted_name
%.tmp7620 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7621 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7622 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp7621, i32 0, i32 7
%.tmp7623 = load i8*, i8** %.tmp7622
%.tmp7624 = load %m996$.Node.type*, %m996$.Node.type** %dotted_name
%.tmp7625 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7624, i32 0, i32 8
%.tmp7626 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7625
%.tmp7627 = call %m2859$.ScopeItem.type*(%m2859$.CompilerCtx.type*,i8*,%m996$.Node.type*) @m311$find_defined_in.m2859$.ScopeItem.typep.m2859$.CompilerCtx.typep.cp.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp7620, i8* %.tmp7623, %m996$.Node.type* %.tmp7626)
ret %m2859$.ScopeItem.type* %.tmp7627
}
define %m2859$.AssignableInfo.type* @m311$get_dotted_name.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.dot_name_ptr.arg, %m2859$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m996$.Node.type*
store %m996$.Node.type* %.dot_name_ptr.arg, %m996$.Node.type** %dot_name_ptr
%info = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.info.arg, %m2859$.AssignableInfo.type** %info
%.tmp7629 = getelementptr [1 x i8], [1 x i8]*@.str7628, i32 0, i32 0
%err_msg.7630 = alloca i8*
store i8* %.tmp7629, i8** %err_msg.7630
%.tmp7632 = getelementptr [1 x i8], [1 x i8]*@.str7631, i32 0, i32 0
%buf.7633 = alloca i8*
store i8* %.tmp7632, i8** %buf.7633
%.tmp7634 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp7635 = icmp eq %m2859$.AssignableInfo.type* %.tmp7634, null
br i1 %.tmp7635, label %.if.true.7636, label %.if.false.7636
.if.true.7636:
%.tmp7637 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7638 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7640 = getelementptr [54 x i8], [54 x i8]*@.str7639, i32 0, i32 0
%.tmp7641 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp7637, %m996$.Node.type* %.tmp7638, i8* %.tmp7640)
%.tmp7642 = call i32(i8*,...) @printf(i8* %.tmp7641)
%.tmp7643 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp7643
br label %.if.end.7636
.if.false.7636:
br label %.if.end.7636
.if.end.7636:
%.tmp7644 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp7645 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7644, i32 0, i32 3
%.tmp7646 = load i8*, i8** %.tmp7645
%.tmp7648 = getelementptr [9 x i8], [9 x i8]*@.str7647, i32 0, i32 0
%.tmp7649 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7646, i8* %.tmp7648)
%.tmp7650 = icmp eq i32 %.tmp7649, 0
%.tmp7651 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp7652 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7651, i32 0, i32 3
%.tmp7653 = load i8*, i8** %.tmp7652
%.tmp7655 = getelementptr [7 x i8], [7 x i8]*@.str7654, i32 0, i32 0
%.tmp7656 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7653, i8* %.tmp7655)
%.tmp7657 = icmp eq i32 %.tmp7656, 0
%.tmp7658 = or i1 %.tmp7650, %.tmp7657
br i1 %.tmp7658, label %.if.true.7659, label %.if.false.7659
.if.true.7659:
%.tmp7660 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7661 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7660, i32 0, i32 9
%.tmp7662 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7661
%.tmp7663 = icmp ne %m996$.Node.type* %.tmp7662, null
br i1 %.tmp7663, label %.if.true.7664, label %.if.false.7664
.if.true.7664:
%.tmp7665 = getelementptr i8*, i8** %err_msg.7630, i32 0
%.tmp7667 = getelementptr [46 x i8], [46 x i8]*@.str7666, i32 0, i32 0
%.tmp7668 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7669 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7668, i32 0, i32 9
%.tmp7670 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7669
%.tmp7671 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7670, i32 0, i32 9
%.tmp7672 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7671
%.tmp7673 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7672, i32 0, i32 1
%.tmp7674 = load i8*, i8** %.tmp7673
%.tmp7675 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7676 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7675, i32 0, i32 1
%.tmp7677 = load i8*, i8** %.tmp7676
%.tmp7678 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7665, i8* %.tmp7667, i8* %.tmp7674, i8* %.tmp7677)
%.tmp7679 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7680 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7681 = load i8*, i8** %err_msg.7630
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp7679, %m996$.Node.type* %.tmp7680, i8* %.tmp7681)
%.tmp7682 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp7682
br label %.if.end.7664
.if.false.7664:
br label %.if.end.7664
.if.end.7664:
%.tmp7683 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
ret %m2859$.AssignableInfo.type* %.tmp7683
br label %.if.end.7659
.if.false.7659:
%.tmp7684 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp7685 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7684, i32 0, i32 3
%.tmp7686 = load i8*, i8** %.tmp7685
%.tmp7688 = getelementptr [9 x i8], [9 x i8]*@.str7687, i32 0, i32 0
%.tmp7689 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7686, i8* %.tmp7688)
%.tmp7690 = icmp eq i32 %.tmp7689, 0
%.tmp7691 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7692 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7691, i32 0, i32 9
%.tmp7693 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7692
%.tmp7694 = icmp ne %m996$.Node.type* %.tmp7693, null
%.tmp7695 = and i1 %.tmp7690, %.tmp7694
br i1 %.tmp7695, label %.if.true.7696, label %.if.false.7696
.if.true.7696:
%.tmp7697 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%base_var.7698 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp7697, %m2859$.AssignableInfo.type** %base_var.7698
%.tmp7699 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base_var.7698
%.tmp7700 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7699, i32 0, i32 4
%.tmp7701 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7700
%struct_info.7702 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp7701, %m2859$.Type.type** %struct_info.7702
br label %.for.start.7703
.for.start.7703:
%.tmp7704 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base_var.7698
%.tmp7705 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7704, i32 0, i32 4
%.tmp7706 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7705
%.tmp7707 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7706, i32 0, i32 0
%.tmp7708 = load i8*, i8** %.tmp7707
%.tmp7710 = getelementptr [4 x i8], [4 x i8]*@.str7709, i32 0, i32 0
%.tmp7711 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7708, i8* %.tmp7710)
%.tmp7712 = icmp eq i32 %.tmp7711, 0
br i1 %.tmp7712, label %.for.continue.7703, label %.for.end.7703
.for.continue.7703:
%.tmp7713 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7714 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp7713)
%new_base.7715 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp7714, %m2859$.AssignableInfo.type** %new_base.7715
%.tmp7716 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7717 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_base.7715
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp7716, %m2859$.AssignableInfo.type* %.tmp7717)
%.tmp7718 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_base.7715
%.tmp7719 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7718, i32 0, i32 4
%.tmp7720 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base_var.7698
%.tmp7721 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7720, i32 0, i32 4
%.tmp7722 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7721
%.tmp7723 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7722, i32 0, i32 3
%.tmp7724 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7723
store %m2859$.Type.type* %.tmp7724, %m2859$.Type.type** %.tmp7719
%.tmp7725 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7726 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp7725, i32 0, i32 1
%.tmp7727 = load %m0$.File.type*, %m0$.File.type** %.tmp7726
%.tmp7729 = getelementptr [23 x i8], [23 x i8]*@.str7728, i32 0, i32 0
%.tmp7730 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_base.7715
%.tmp7731 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp7730)
%.tmp7732 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7733 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_base.7715
%.tmp7734 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7733, i32 0, i32 4
%.tmp7735 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7734
%.tmp7736 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp7732, %m2859$.Type.type* %.tmp7735)
%.tmp7737 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7738 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base_var.7698
%.tmp7739 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7738, i32 0, i32 4
%.tmp7740 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7739
%.tmp7741 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp7737, %m2859$.Type.type* %.tmp7740)
%.tmp7742 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base_var.7698
%.tmp7743 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp7742)
%.tmp7744 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7727, i8* %.tmp7729, i8* %.tmp7731, i8* %.tmp7736, i8* %.tmp7741, i8* %.tmp7743)
%.tmp7745 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_base.7715
store %m2859$.AssignableInfo.type* %.tmp7745, %m2859$.AssignableInfo.type** %base_var.7698
%.tmp7746 = load %m2859$.Type.type*, %m2859$.Type.type** %struct_info.7702
%.tmp7747 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7746, i32 0, i32 3
%.tmp7748 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7747
store %m2859$.Type.type* %.tmp7748, %m2859$.Type.type** %struct_info.7702
br label %.for.start.7703
.for.end.7703:
%.tmp7749 = load %m2859$.Type.type*, %m2859$.Type.type** %struct_info.7702
%.tmp7750 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7749, i32 0, i32 0
%.tmp7751 = load i8*, i8** %.tmp7750
%.tmp7753 = getelementptr [10 x i8], [10 x i8]*@.str7752, i32 0, i32 0
%.tmp7754 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7751, i8* %.tmp7753)
%.tmp7755 = icmp eq i32 %.tmp7754, 0
br i1 %.tmp7755, label %.if.true.7756, label %.if.false.7756
.if.true.7756:
%.tmp7757 = load %m2859$.Type.type*, %m2859$.Type.type** %struct_info.7702
%.tmp7758 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7757, i32 0, i32 3
%.tmp7759 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7758
store %m2859$.Type.type* %.tmp7759, %m2859$.Type.type** %struct_info.7702
br label %.if.end.7756
.if.false.7756:
br label %.if.end.7756
.if.end.7756:
%.tmp7760 = load %m2859$.Type.type*, %m2859$.Type.type** %struct_info.7702
%.tmp7761 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7760, i32 0, i32 0
%.tmp7762 = load i8*, i8** %.tmp7761
%.tmp7764 = getelementptr [7 x i8], [7 x i8]*@.str7763, i32 0, i32 0
%.tmp7765 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7762, i8* %.tmp7764)
%.tmp7766 = icmp ne i32 %.tmp7765, 0
br i1 %.tmp7766, label %.if.true.7767, label %.if.false.7767
.if.true.7767:
%.tmp7768 = getelementptr i8*, i8** %err_msg.7630, i32 0
%.tmp7770 = getelementptr [48 x i8], [48 x i8]*@.str7769, i32 0, i32 0
%.tmp7771 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7772 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7771, i32 0, i32 9
%.tmp7773 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7772
%.tmp7774 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7773, i32 0, i32 9
%.tmp7775 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7774
%.tmp7776 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7775, i32 0, i32 1
%.tmp7777 = load i8*, i8** %.tmp7776
%.tmp7778 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7779 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7778, i32 0, i32 1
%.tmp7780 = load i8*, i8** %.tmp7779
%.tmp7781 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7768, i8* %.tmp7770, i8* %.tmp7777, i8* %.tmp7780)
%.tmp7782 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7783 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7784 = load i8*, i8** %err_msg.7630
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp7782, %m996$.Node.type* %.tmp7783, i8* %.tmp7784)
%.tmp7785 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp7785
br label %.if.end.7767
.if.false.7767:
br label %.if.end.7767
.if.end.7767:
%.tmp7786 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7787 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7786, i32 0, i32 9
%.tmp7788 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7787
%.tmp7789 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7788, i32 0, i32 9
%.tmp7790 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7789
%.tmp7791 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7790, i32 0, i32 1
%.tmp7792 = load i8*, i8** %.tmp7791
%field_name.7793 = alloca i8*
store i8* %.tmp7792, i8** %field_name.7793
%field_id.7794 = alloca i32
store i32 0, i32* %field_id.7794
%.tmp7795 = bitcast ptr null to %m2859$.Type.type*
%found_field.7796 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp7795, %m2859$.Type.type** %found_field.7796
%.tmp7798 = load %m2859$.Type.type*, %m2859$.Type.type** %struct_info.7702
%.tmp7799 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7798, i32 0, i32 3
%.tmp7800 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7799
%field.7801 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp7800, %m2859$.Type.type** %field.7801
br label %.for.start.7797
.for.start.7797:
%.tmp7802 = load %m2859$.Type.type*, %m2859$.Type.type** %field.7801
%.tmp7803 = icmp ne %m2859$.Type.type* %.tmp7802, null
br i1 %.tmp7803, label %.for.continue.7797, label %.for.end.7797
.for.continue.7797:
%.tmp7804 = load %m2859$.Type.type*, %m2859$.Type.type** %field.7801
%.tmp7805 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7804, i32 0, i32 1
%.tmp7806 = load i8*, i8** %.tmp7805
%.tmp7807 = load i8*, i8** %field_name.7793
%.tmp7808 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7806, i8* %.tmp7807)
%.tmp7809 = icmp eq i32 %.tmp7808, 0
br i1 %.tmp7809, label %.if.true.7810, label %.if.false.7810
.if.true.7810:
%.tmp7811 = load %m2859$.Type.type*, %m2859$.Type.type** %field.7801
store %m2859$.Type.type* %.tmp7811, %m2859$.Type.type** %found_field.7796
br label %.for.end.7797
br label %.if.end.7810
.if.false.7810:
%.tmp7812 = load i32, i32* %field_id.7794
%.tmp7813 = add i32 %.tmp7812, 1
store i32 %.tmp7813, i32* %field_id.7794
br label %.if.end.7810
.if.end.7810:
%.tmp7814 = load %m2859$.Type.type*, %m2859$.Type.type** %field.7801
%.tmp7815 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7814, i32 0, i32 4
%.tmp7816 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7815
store %m2859$.Type.type* %.tmp7816, %m2859$.Type.type** %field.7801
br label %.for.start.7797
.for.end.7797:
%.tmp7817 = load %m2859$.Type.type*, %m2859$.Type.type** %found_field.7796
%.tmp7818 = icmp eq %m2859$.Type.type* %.tmp7817, null
br i1 %.tmp7818, label %.if.true.7819, label %.if.false.7819
.if.true.7819:
%.tmp7820 = getelementptr i8*, i8** %err_msg.7630, i32 0
%.tmp7822 = getelementptr [34 x i8], [34 x i8]*@.str7821, i32 0, i32 0
%.tmp7823 = load i8*, i8** %field_name.7793
%.tmp7824 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7825 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7824, i32 0, i32 1
%.tmp7826 = load i8*, i8** %.tmp7825
%.tmp7827 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7820, i8* %.tmp7822, i8* %.tmp7823, i8* %.tmp7826)
%.tmp7828 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7829 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7830 = load i8*, i8** %err_msg.7630
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp7828, %m996$.Node.type* %.tmp7829, i8* %.tmp7830)
%.tmp7831 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp7831
br label %.if.end.7819
.if.false.7819:
br label %.if.end.7819
.if.end.7819:
%.tmp7832 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7833 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp7832)
%new_info.7834 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp7833, %m2859$.AssignableInfo.type** %new_info.7834
%.tmp7835 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_info.7834
%.tmp7836 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7835, i32 0, i32 4
%.tmp7837 = load %m2859$.Type.type*, %m2859$.Type.type** %found_field.7796
store %m2859$.Type.type* %.tmp7837, %m2859$.Type.type** %.tmp7836
%.tmp7838 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7839 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_info.7834
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp7838, %m2859$.AssignableInfo.type* %.tmp7839)
%.tmp7840 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_info.7834
%.tmp7841 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7840, i32 0, i32 3
%.tmp7843 = getelementptr [9 x i8], [9 x i8]*@.str7842, i32 0, i32 0
store i8* %.tmp7843, i8** %.tmp7841
%.tmp7844 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7845 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base_var.7698
%.tmp7846 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7845, i32 0, i32 4
%.tmp7847 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7846
%.tmp7848 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp7844, %m2859$.Type.type* %.tmp7847)
%info_tr.7849 = alloca i8*
store i8* %.tmp7848, i8** %info_tr.7849
%.tmp7850 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7851 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp7850, i32 0, i32 1
%.tmp7852 = load %m0$.File.type*, %m0$.File.type** %.tmp7851
%.tmp7854 = getelementptr [46 x i8], [46 x i8]*@.str7853, i32 0, i32 0
%.tmp7855 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_info.7834
%.tmp7856 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp7855)
%.tmp7857 = load i8*, i8** %info_tr.7849
%.tmp7858 = load i8*, i8** %info_tr.7849
%.tmp7859 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base_var.7698
%.tmp7860 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp7859)
%.tmp7861 = load i32, i32* %field_id.7794
%.tmp7862 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7852, i8* %.tmp7854, i8* %.tmp7856, i8* %.tmp7857, i8* %.tmp7858, i8* %.tmp7860, i32 %.tmp7861)
%.tmp7863 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7864 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7865 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7864, i32 0, i32 9
%.tmp7866 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7865
%.tmp7867 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7866, i32 0, i32 9
%.tmp7868 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7867
%.tmp7869 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_info.7834
%.tmp7870 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,%m2859$.AssignableInfo.type*) @m311$get_dotted_name.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp7863, %m996$.Node.type* %.tmp7868, %m2859$.AssignableInfo.type* %.tmp7869)
ret %m2859$.AssignableInfo.type* %.tmp7870
br label %.if.end.7696
.if.false.7696:
%.tmp7871 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp7872 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7871, i32 0, i32 3
%.tmp7873 = load i8*, i8** %.tmp7872
%.tmp7875 = getelementptr [9 x i8], [9 x i8]*@.str7874, i32 0, i32 0
%.tmp7876 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7873, i8* %.tmp7875)
%.tmp7877 = icmp eq i32 %.tmp7876, 0
br i1 %.tmp7877, label %.if.true.7878, label %.if.false.7878
.if.true.7878:
%.tmp7879 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
ret %m2859$.AssignableInfo.type* %.tmp7879
br label %.if.end.7878
.if.false.7878:
%.tmp7880 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp7881 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7880, i32 0, i32 3
%.tmp7882 = load i8*, i8** %.tmp7881
%.tmp7884 = getelementptr [10 x i8], [10 x i8]*@.str7883, i32 0, i32 0
%.tmp7885 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7882, i8* %.tmp7884)
%.tmp7886 = icmp eq i32 %.tmp7885, 0
br i1 %.tmp7886, label %.if.true.7887, label %.if.false.7887
.if.true.7887:
%.tmp7888 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp7889 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7888, i32 0, i32 4
%.tmp7890 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7889
%.tmp7891 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7890, i32 0, i32 0
%.tmp7892 = load i8*, i8** %.tmp7891
%.tmp7894 = getelementptr [5 x i8], [5 x i8]*@.str7893, i32 0, i32 0
%.tmp7895 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7892, i8* %.tmp7894)
%.tmp7896 = icmp ne i32 %.tmp7895, 0
br i1 %.tmp7896, label %.if.true.7897, label %.if.false.7897
.if.true.7897:
%.tmp7899 = getelementptr [1 x i8], [1 x i8]*@.str7898, i32 0, i32 0
%err_msg.7900 = alloca i8*
store i8* %.tmp7899, i8** %err_msg.7900
%.tmp7901 = getelementptr i8*, i8** %err_msg.7900, i32 0
%.tmp7903 = getelementptr [37 x i8], [37 x i8]*@.str7902, i32 0, i32 0
%.tmp7904 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7905 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7904, i32 0, i32 1
%.tmp7906 = load i8*, i8** %.tmp7905
%.tmp7907 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp7908 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7907, i32 0, i32 4
%.tmp7909 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7908
%.tmp7910 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7909, i32 0, i32 0
%.tmp7911 = load i8*, i8** %.tmp7910
%.tmp7912 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7901, i8* %.tmp7903, i8* %.tmp7906, i8* %.tmp7911)
%.tmp7913 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7914 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7915 = load i8*, i8** %err_msg.7900
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp7913, %m996$.Node.type* %.tmp7914, i8* %.tmp7915)
%.tmp7916 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp7916
br label %.if.end.7897
.if.false.7897:
br label %.if.end.7897
.if.end.7897:
%.tmp7917 = bitcast ptr null to %m2859$.Type.type*
%enum_type.7918 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp7917, %m2859$.Type.type** %enum_type.7918
%.tmp7920 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp7921 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7920, i32 0, i32 4
%.tmp7922 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7921
%.tmp7923 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7922, i32 0, i32 3
%.tmp7924 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7923
%.tmp7925 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7924, i32 0, i32 4
%.tmp7926 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7925
%.tmp7927 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7926, i32 0, i32 3
%.tmp7928 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7927
%f.7929 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp7928, %m2859$.Type.type** %f.7929
br label %.for.start.7919
.for.start.7919:
%.tmp7930 = load %m2859$.Type.type*, %m2859$.Type.type** %f.7929
%.tmp7931 = icmp ne %m2859$.Type.type* %.tmp7930, null
br i1 %.tmp7931, label %.for.continue.7919, label %.for.else.7919
.for.continue.7919:
%.tmp7932 = load %m2859$.Type.type*, %m2859$.Type.type** %f.7929
%.tmp7933 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7932, i32 0, i32 1
%.tmp7934 = load i8*, i8** %.tmp7933
%.tmp7935 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7936 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7935, i32 0, i32 9
%.tmp7937 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7936
%.tmp7938 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7937, i32 0, i32 9
%.tmp7939 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7938
%.tmp7940 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7939, i32 0, i32 1
%.tmp7941 = load i8*, i8** %.tmp7940
%.tmp7942 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7934, i8* %.tmp7941)
%.tmp7943 = icmp eq i32 %.tmp7942, 0
br i1 %.tmp7943, label %.if.true.7944, label %.if.false.7944
.if.true.7944:
%.tmp7945 = load %m2859$.Type.type*, %m2859$.Type.type** %f.7929
store %m2859$.Type.type* %.tmp7945, %m2859$.Type.type** %enum_type.7918
br label %.for.end.7919
br label %.if.end.7944
.if.false.7944:
br label %.if.end.7944
.if.end.7944:
%.tmp7946 = load %m2859$.Type.type*, %m2859$.Type.type** %f.7929
%.tmp7947 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp7946, i32 0, i32 4
%.tmp7948 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp7947
store %m2859$.Type.type* %.tmp7948, %m2859$.Type.type** %f.7929
br label %.for.start.7919
.for.else.7919:
%.tmp7950 = getelementptr [1 x i8], [1 x i8]*@.str7949, i32 0, i32 0
%err_msg.7951 = alloca i8*
store i8* %.tmp7950, i8** %err_msg.7951
%.tmp7952 = getelementptr i8*, i8** %err_msg.7951, i32 0
%.tmp7954 = getelementptr [34 x i8], [34 x i8]*@.str7953, i32 0, i32 0
%.tmp7955 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7956 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7955, i32 0, i32 1
%.tmp7957 = load i8*, i8** %.tmp7956
%.tmp7958 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7959 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7958, i32 0, i32 9
%.tmp7960 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7959
%.tmp7961 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7960, i32 0, i32 9
%.tmp7962 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7961
%.tmp7963 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7962, i32 0, i32 1
%.tmp7964 = load i8*, i8** %.tmp7963
%.tmp7965 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7952, i8* %.tmp7954, i8* %.tmp7957, i8* %.tmp7964)
%.tmp7966 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7967 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7968 = load i8*, i8** %err_msg.7951
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp7966, %m996$.Node.type* %.tmp7967, i8* %.tmp7968)
%.tmp7969 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp7969
br label %.for.end.7919
.for.end.7919:
%.tmp7970 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7972 = getelementptr [12 x i8], [12 x i8]*@.str7971, i32 0, i32 0
%.tmp7973 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m996$nearest_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp7970, i8* %.tmp7972)
%dest.7974 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp7973, %m996$.Node.type** %dest.7974
%.tmp7975 = load %m996$.Node.type*, %m996$.Node.type** %dest.7974
%.tmp7976 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7975, i32 0, i32 9
%.tmp7977 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7976
%.tmp7978 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7977, i32 0, i32 1
%.tmp7979 = load i8*, i8** %.tmp7978
%.tmp7981 = getelementptr [2 x i8], [2 x i8]*@.str7980, i32 0, i32 0
%.tmp7982 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7979, i8* %.tmp7981)
%.tmp7983 = icmp eq i32 %.tmp7982, 0
br i1 %.tmp7983, label %.if.true.7984, label %.if.false.7984
.if.true.7984:
%.tmp7985 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7986 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7985, i32 0, i32 9
%.tmp7987 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7986
%.tmp7988 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7987, i32 0, i32 9
%.tmp7989 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7988
%.tmp7990 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp7989)
%new_info.7991 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp7990, %m2859$.AssignableInfo.type** %new_info.7991
%.tmp7992 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_info.7991
%.tmp7993 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp7992, i32 0, i32 4
%.tmp7994 = load %m2859$.Type.type*, %m2859$.Type.type** %enum_type.7918
store %m2859$.Type.type* %.tmp7994, %m2859$.Type.type** %.tmp7993
%.tmp7995 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_info.7991
ret %m2859$.AssignableInfo.type* %.tmp7995
br label %.if.end.7984
.if.false.7984:
br label %.if.end.7984
.if.end.7984:
%.tmp7996 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp7996
br label %.if.end.7887
.if.false.7887:
br label %.if.end.7887
.if.end.7887:
br label %.if.end.7878
.if.end.7878:
br label %.if.end.7696
.if.end.7696:
br label %.if.end.7659
.if.end.7659:
%.tmp7997 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp7998 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp8000 = getelementptr [43 x i8], [43 x i8]*@.str7999, i32 0, i32 0
%.tmp8001 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp7997, %m996$.Node.type* %.tmp7998, i8* %.tmp8000)
%.tmp8002 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
%.tmp8003 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8002, i32 0, i32 3
%.tmp8004 = load i8*, i8** %.tmp8003
%.tmp8005 = call i32(i8*,...) @printf(i8* %.tmp8001, i8* %.tmp8004)
%.tmp8006 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp8006
}
define %m2859$.AssignableInfo.type* @m311$compile_addr.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp8008 = getelementptr [1 x i8], [1 x i8]*@.str8007, i32 0, i32 0
%err_msg.8009 = alloca i8*
store i8* %.tmp8008, i8** %err_msg.8009
%.tmp8010 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%curr_node.8011 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp8010, %m996$.Node.type** %curr_node.8011
%.tmp8012 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.8011
%.tmp8013 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8012, i32 0, i32 0
%.tmp8014 = load i8*, i8** %.tmp8013
%.tmp8016 = getelementptr [17 x i8], [17 x i8]*@.str8015, i32 0, i32 0
%.tmp8017 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8014, i8* %.tmp8016)
%.tmp8018 = icmp eq i32 %.tmp8017, 0
%.tmp8019 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.8011
%.tmp8020 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8019, i32 0, i32 0
%.tmp8021 = load i8*, i8** %.tmp8020
%.tmp8023 = getelementptr [16 x i8], [16 x i8]*@.str8022, i32 0, i32 0
%.tmp8024 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8021, i8* %.tmp8023)
%.tmp8025 = icmp eq i32 %.tmp8024, 0
%.tmp8026 = or i1 %.tmp8018, %.tmp8025
%.tmp8027 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.8011
%.tmp8028 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8027, i32 0, i32 0
%.tmp8029 = load i8*, i8** %.tmp8028
%.tmp8031 = getelementptr [11 x i8], [11 x i8]*@.str8030, i32 0, i32 0
%.tmp8032 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8029, i8* %.tmp8031)
%.tmp8033 = icmp eq i32 %.tmp8032, 0
%.tmp8034 = or i1 %.tmp8026, %.tmp8033
br i1 %.tmp8034, label %.if.true.8035, label %.if.false.8035
.if.true.8035:
%.tmp8036 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8037 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp8038 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8037, i32 0, i32 8
%.tmp8039 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8038
%.tmp8040 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_addr.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp8036, %m996$.Node.type* %.tmp8039)
ret %m2859$.AssignableInfo.type* %.tmp8040
br label %.if.end.8035
.if.false.8035:
br label %.if.end.8035
.if.end.8035:
%.tmp8041 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.8011
%.tmp8042 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8041, i32 0, i32 0
%.tmp8043 = load i8*, i8** %.tmp8042
%.tmp8045 = getelementptr [12 x i8], [12 x i8]*@.str8044, i32 0, i32 0
%.tmp8046 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8043, i8* %.tmp8045)
%.tmp8047 = icmp ne i32 %.tmp8046, 0
br i1 %.tmp8047, label %.if.true.8048, label %.if.false.8048
.if.true.8048:
%.tmp8050 = getelementptr [92 x i8], [92 x i8]*@.str8049, i32 0, i32 0
%.tmp8051 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.8011
%.tmp8052 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8051, i32 0, i32 0
%.tmp8053 = load i8*, i8** %.tmp8052
%.tmp8054 = call i32(i8*,...) @printf(i8* %.tmp8050, i8* %.tmp8053)
%.tmp8055 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp8056 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8055, i32 0, i32 8
%.tmp8057 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8056
store %m996$.Node.type* %.tmp8057, %m996$.Node.type** %curr_node.8011
br label %.if.end.8048
.if.false.8048:
br label %.if.end.8048
.if.end.8048:
%.tmp8058 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.8011
%.tmp8059 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8058, i32 0, i32 8
%.tmp8060 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8059
%assignable_name.8061 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp8060, %m996$.Node.type** %assignable_name.8061
%.tmp8062 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8063 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8064 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp8063, i32 0, i32 7
%.tmp8065 = load i8*, i8** %.tmp8064
%.tmp8066 = load %m996$.Node.type*, %m996$.Node.type** %assignable_name.8061
%.tmp8067 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8066, i32 0, i32 8
%.tmp8068 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8067
%.tmp8069 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8068, i32 0, i32 1
%.tmp8070 = load i8*, i8** %.tmp8069
%.tmp8071 = call %m2859$.ScopeItem.type*(%m2859$.CompilerCtx.type*,i8*,i8*) @m311$find_defined_str.m2859$.ScopeItem.typep.m2859$.CompilerCtx.typep.cp.cp(%m2859$.CompilerCtx.type* %.tmp8062, i8* %.tmp8065, i8* %.tmp8070)
%scope_info.8072 = alloca %m2859$.ScopeItem.type*
store %m2859$.ScopeItem.type* %.tmp8071, %m2859$.ScopeItem.type** %scope_info.8072
%.tmp8073 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %scope_info.8072
%.tmp8074 = icmp eq %m2859$.ScopeItem.type* %.tmp8073, null
br i1 %.tmp8074, label %.if.true.8075, label %.if.false.8075
.if.true.8075:
%.tmp8076 = getelementptr i8*, i8** %err_msg.8009, i32 0
%.tmp8078 = getelementptr [41 x i8], [41 x i8]*@.str8077, i32 0, i32 0
%.tmp8079 = load %m996$.Node.type*, %m996$.Node.type** %assignable_name.8061
%.tmp8080 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8079, i32 0, i32 8
%.tmp8081 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8080
%.tmp8082 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8081, i32 0, i32 1
%.tmp8083 = load i8*, i8** %.tmp8082
%.tmp8084 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8076, i8* %.tmp8078, i8* %.tmp8083)
%.tmp8085 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8086 = load %m996$.Node.type*, %m996$.Node.type** %assignable_name.8061
%.tmp8087 = load i8*, i8** %err_msg.8009
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp8085, %m996$.Node.type* %.tmp8086, i8* %.tmp8087)
%.tmp8088 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp8088
br label %.if.end.8075
.if.false.8075:
br label %.if.end.8075
.if.end.8075:
%.tmp8089 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %scope_info.8072
%.tmp8090 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp8089, i32 0, i32 1
%.tmp8091 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %.tmp8090
%info.8092 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp8091, %m2859$.AssignableInfo.type** %info.8092
%.tmp8093 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.8092
%.tmp8094 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8093, i32 0, i32 3
%.tmp8095 = load i8*, i8** %.tmp8094
%.tmp8097 = getelementptr [7 x i8], [7 x i8]*@.str8096, i32 0, i32 0
%.tmp8098 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8095, i8* %.tmp8097)
%.tmp8099 = icmp eq i32 %.tmp8098, 0
br i1 %.tmp8099, label %.if.true.8100, label %.if.false.8100
.if.true.8100:
%.tmp8101 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8102 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.8092
%.tmp8103 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp8102)
%.tmp8104 = load %m996$.Node.type*, %m996$.Node.type** %assignable_name.8061
%.tmp8105 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8104, i32 0, i32 8
%.tmp8106 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8105
%.tmp8107 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8106, i32 0, i32 9
%.tmp8108 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8107
%.tmp8109 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8108, i32 0, i32 9
%.tmp8110 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8109
%.tmp8111 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8110, i32 0, i32 1
%.tmp8112 = load i8*, i8** %.tmp8111
%.tmp8113 = call %m2859$.ScopeItem.type*(%m2859$.CompilerCtx.type*,i8*,i8*) @m311$find_defined_str.m2859$.ScopeItem.typep.m2859$.CompilerCtx.typep.cp.cp(%m2859$.CompilerCtx.type* %.tmp8101, i8* %.tmp8103, i8* %.tmp8112)
store %m2859$.ScopeItem.type* %.tmp8113, %m2859$.ScopeItem.type** %scope_info.8072
%.tmp8114 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %scope_info.8072
%.tmp8115 = icmp eq %m2859$.ScopeItem.type* %.tmp8114, null
br i1 %.tmp8115, label %.if.true.8116, label %.if.false.8116
.if.true.8116:
%.tmp8117 = getelementptr i8*, i8** %err_msg.8009, i32 0
%.tmp8119 = getelementptr [31 x i8], [31 x i8]*@.str8118, i32 0, i32 0
%.tmp8120 = load %m996$.Node.type*, %m996$.Node.type** %assignable_name.8061
%.tmp8121 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8120, i32 0, i32 8
%.tmp8122 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8121
%.tmp8123 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8122, i32 0, i32 9
%.tmp8124 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8123
%.tmp8125 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8124, i32 0, i32 9
%.tmp8126 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8125
%.tmp8127 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8126, i32 0, i32 1
%.tmp8128 = load i8*, i8** %.tmp8127
%.tmp8129 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.8092
%.tmp8130 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp8129)
%.tmp8131 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8117, i8* %.tmp8119, i8* %.tmp8128, i8* %.tmp8130)
%.tmp8132 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8133 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.8011
%.tmp8134 = load i8*, i8** %err_msg.8009
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp8132, %m996$.Node.type* %.tmp8133, i8* %.tmp8134)
%.tmp8135 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp8135
br label %.if.end.8116
.if.false.8116:
br label %.if.end.8116
.if.end.8116:
%.tmp8136 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %scope_info.8072
%.tmp8137 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp8136, i32 0, i32 1
%.tmp8138 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %.tmp8137
store %m2859$.AssignableInfo.type* %.tmp8138, %m2859$.AssignableInfo.type** %info.8092
%.tmp8139 = load %m996$.Node.type*, %m996$.Node.type** %assignable_name.8061
%.tmp8140 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8139, i32 0, i32 8
%.tmp8141 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8140
%.tmp8142 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8141, i32 0, i32 9
%.tmp8143 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8142
%.tmp8144 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8143, i32 0, i32 9
%.tmp8145 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8144
store %m996$.Node.type* %.tmp8145, %m996$.Node.type** %assignable_name.8061
br label %.if.end.8100
.if.false.8100:
%.tmp8146 = load %m996$.Node.type*, %m996$.Node.type** %assignable_name.8061
%.tmp8147 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8146, i32 0, i32 8
%.tmp8148 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8147
store %m996$.Node.type* %.tmp8148, %m996$.Node.type** %assignable_name.8061
br label %.if.end.8100
.if.end.8100:
%.tmp8149 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8150 = load %m996$.Node.type*, %m996$.Node.type** %assignable_name.8061
%.tmp8151 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.8092
%.tmp8152 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,%m2859$.AssignableInfo.type*) @m311$get_dotted_name.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp8149, %m996$.Node.type* %.tmp8150, %m2859$.AssignableInfo.type* %.tmp8151)
%base.8153 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp8152, %m2859$.AssignableInfo.type** %base.8153
%.tmp8155 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.8011
%.tmp8156 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8155, i32 0, i32 8
%.tmp8157 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8156
%.tmp8158 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8157, i32 0, i32 9
%.tmp8159 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8158
%addr.8160 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp8159, %m996$.Node.type** %addr.8160
br label %.for.start.8154
.for.start.8154:
%.tmp8161 = load %m996$.Node.type*, %m996$.Node.type** %addr.8160
%.tmp8162 = icmp ne %m996$.Node.type* %.tmp8161, null
br i1 %.tmp8162, label %.for.continue.8154, label %.for.end.8154
.for.continue.8154:
%.tmp8163 = load %m996$.Node.type*, %m996$.Node.type** %addr.8160
%.tmp8164 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8163, i32 0, i32 9
%.tmp8165 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8164
%index.8166 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp8165, %m996$.Node.type** %index.8166
%.tmp8167 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8168 = load %m996$.Node.type*, %m996$.Node.type** %index.8166
%.tmp8169 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp8167, %m996$.Node.type* %.tmp8168)
%index_info.8170 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp8169, %m2859$.AssignableInfo.type** %index_info.8170
%.tmp8171 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8172 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %index_info.8170
%.tmp8173 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8172, i32 0, i32 4
%.tmp8174 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8173
%.tmp8175 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp8171, %m2859$.Type.type* %.tmp8174)
%index_type.8176 = alloca i8*
store i8* %.tmp8175, i8** %index_type.8176
%.tmp8177 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base.8153
%.tmp8178 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8177, i32 0, i32 4
%.tmp8179 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8178
%.tmp8180 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8179, i32 0, i32 1
%.tmp8181 = load i8*, i8** %.tmp8180
%.tmp8182 = icmp ne i8* %.tmp8181, null
br i1 %.tmp8182, label %.if.true.8183, label %.if.false.8183
.if.true.8183:
%.tmp8184 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base.8153
%.tmp8185 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8184, i32 0, i32 4
%.tmp8186 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8185
%.tmp8187 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8186, i32 0, i32 1
%.tmp8188 = load i8*, i8** %.tmp8187
%.tmp8190 = getelementptr [6 x i8], [6 x i8]*@.str8189, i32 0, i32 0
%.tmp8191 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8188, i8* %.tmp8190)
%.tmp8192 = icmp eq i32 %.tmp8191, 0
br i1 %.tmp8192, label %.if.true.8193, label %.if.false.8193
.if.true.8193:
%.tmp8194 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.8011
%.tmp8195 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8194)
%new_base.8196 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp8195, %m2859$.AssignableInfo.type** %new_base.8196
%.tmp8197 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8198 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_base.8196
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp8197, %m2859$.AssignableInfo.type* %.tmp8198)
%.tmp8199 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8200 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp8199, i32 0, i32 1
%.tmp8201 = load %m0$.File.type*, %m0$.File.type** %.tmp8200
%.tmp8203 = getelementptr [45 x i8], [45 x i8]*@.str8202, i32 0, i32 0
%.tmp8204 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_base.8196
%.tmp8205 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp8204)
%.tmp8206 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8207 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base.8153
%.tmp8208 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8207, i32 0, i32 4
%.tmp8209 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8208
%.tmp8210 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp8206, %m2859$.Type.type* %.tmp8209)
%.tmp8211 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8212 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base.8153
%.tmp8213 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8212, i32 0, i32 4
%.tmp8214 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8213
%.tmp8215 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp8211, %m2859$.Type.type* %.tmp8214)
%.tmp8216 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base.8153
%.tmp8217 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp8216)
%.tmp8218 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8201, i8* %.tmp8203, i8* %.tmp8205, i8* %.tmp8210, i8* %.tmp8215, i8* %.tmp8217)
%.tmp8219 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_base.8196
%.tmp8220 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8219, i32 0, i32 4
%.tmp8221 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base.8153
%.tmp8222 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8221, i32 0, i32 4
%.tmp8223 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8222
%.tmp8224 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8223, i32 0, i32 3
%.tmp8225 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8224
%.tmp8226 = call %m2859$.Type.type*(%m2859$.Type.type*) @m311$type_clone.m2859$.Type.typep.m2859$.Type.typep(%m2859$.Type.type* %.tmp8225)
store %m2859$.Type.type* %.tmp8226, %m2859$.Type.type** %.tmp8220
%.tmp8227 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_base.8196
%.tmp8228 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8227, i32 0, i32 4
%.tmp8229 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8228
%.tmp8230 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8229, i32 0, i32 4
store %m2859$.Type.type* null, %m2859$.Type.type** %.tmp8230
%.tmp8231 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_base.8196
store %m2859$.AssignableInfo.type* %.tmp8231, %m2859$.AssignableInfo.type** %base.8153
br label %.if.end.8193
.if.false.8193:
br label %.if.end.8193
.if.end.8193:
br label %.if.end.8183
.if.false.8183:
br label %.if.end.8183
.if.end.8183:
%.tmp8232 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8233 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base.8153
%.tmp8234 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8233, i32 0, i32 4
%.tmp8235 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8234
%.tmp8236 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp8232, %m2859$.Type.type* %.tmp8235)
%base_type.8237 = alloca i8*
store i8* %.tmp8236, i8** %base_type.8237
%.tmp8238 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8239 = call i32(%m2859$.CompilerCtx.type*) @m311$new_uid.i.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp8238)
%tmp_id.8240 = alloca i32
store i32 %.tmp8239, i32* %tmp_id.8240
%.tmp8241 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8242 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp8241, i32 0, i32 1
%.tmp8243 = load %m0$.File.type*, %m0$.File.type** %.tmp8242
%.tmp8245 = getelementptr [28 x i8], [28 x i8]*@.str8244, i32 0, i32 0
%.tmp8246 = load i32, i32* %tmp_id.8240
%.tmp8247 = load i8*, i8** %base_type.8237
%.tmp8248 = load i8*, i8** %base_type.8237
%.tmp8249 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base.8153
%.tmp8250 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp8249)
%.tmp8251 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8243, i8* %.tmp8245, i32 %.tmp8246, i8* %.tmp8247, i8* %.tmp8248, i8* %.tmp8250)
%.tmp8252 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.8011
%.tmp8253 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8252)
%new_base.8254 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp8253, %m2859$.AssignableInfo.type** %new_base.8254
%.tmp8255 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8256 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_base.8254
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp8255, %m2859$.AssignableInfo.type* %.tmp8256)
%.tmp8257 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base.8153
%.tmp8258 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8257, i32 0, i32 4
%.tmp8259 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8258
%.tmp8260 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8259, i32 0, i32 3
%.tmp8261 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8260
%.tmp8262 = icmp eq %m2859$.Type.type* %.tmp8261, null
br i1 %.tmp8262, label %.if.true.8263, label %.if.false.8263
.if.true.8263:
%.tmp8264 = getelementptr i8*, i8** %err_msg.8009, i32 0
%.tmp8266 = getelementptr [35 x i8], [35 x i8]*@.str8265, i32 0, i32 0
%.tmp8267 = load i8*, i8** %base_type.8237
%.tmp8268 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8264, i8* %.tmp8266, i8* %.tmp8267)
%.tmp8269 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8270 = load %m996$.Node.type*, %m996$.Node.type** %addr.8160
%.tmp8271 = load i8*, i8** %err_msg.8009
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp8269, %m996$.Node.type* %.tmp8270, i8* %.tmp8271)
%.tmp8272 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp8272
br label %.if.end.8263
.if.false.8263:
br label %.if.end.8263
.if.end.8263:
%.tmp8273 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_base.8254
%.tmp8274 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8273, i32 0, i32 4
%.tmp8275 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base.8153
%.tmp8276 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8275, i32 0, i32 4
%.tmp8277 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8276
%.tmp8278 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8277, i32 0, i32 3
%.tmp8279 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8278
store %m2859$.Type.type* %.tmp8279, %m2859$.Type.type** %.tmp8274
%.tmp8280 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8281 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_base.8254
%.tmp8282 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8281, i32 0, i32 4
%.tmp8283 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8282
%.tmp8284 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp8280, %m2859$.Type.type* %.tmp8283)
%base_type_2.8285 = alloca i8*
store i8* %.tmp8284, i8** %base_type_2.8285
%.tmp8286 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8287 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp8286, i32 0, i32 1
%.tmp8288 = load %m0$.File.type*, %m0$.File.type** %.tmp8287
%.tmp8290 = getelementptr [44 x i8], [44 x i8]*@.str8289, i32 0, i32 0
%.tmp8291 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_base.8254
%.tmp8292 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp8291)
%.tmp8293 = load i8*, i8** %base_type_2.8285
%.tmp8294 = load i8*, i8** %base_type_2.8285
%.tmp8295 = load i32, i32* %tmp_id.8240
%.tmp8296 = load i8*, i8** %index_type.8176
%.tmp8297 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %index_info.8170
%.tmp8298 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp8297)
%.tmp8299 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8288, i8* %.tmp8290, i8* %.tmp8292, i8* %.tmp8293, i8* %.tmp8294, i32 %.tmp8295, i8* %.tmp8296, i8* %.tmp8298)
%.tmp8300 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %new_base.8254
store %m2859$.AssignableInfo.type* %.tmp8300, %m2859$.AssignableInfo.type** %base.8153
%.tmp8301 = load %m996$.Node.type*, %m996$.Node.type** %addr.8160
%.tmp8302 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8301, i32 0, i32 9
%.tmp8303 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8302
%.tmp8304 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8303, i32 0, i32 9
%.tmp8305 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8304
%.tmp8306 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8305, i32 0, i32 9
%.tmp8307 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8306
store %m996$.Node.type* %.tmp8307, %m996$.Node.type** %addr.8160
br label %.for.start.8154
.for.end.8154:
%.tmp8308 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %base.8153
ret %m2859$.AssignableInfo.type* %.tmp8308
}
%m311$.StackHead.type = type {%m2614$.SYStack.type*}
define %m2859$.AssignableInfo.type* @m311$compile_assignable.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%curr_node = alloca %m996$.Node.type*
store %m996$.Node.type* %.curr_node.arg, %m996$.Node.type** %curr_node
%.tmp8309 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp8310 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8309, i32 0, i32 8
%.tmp8311 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8310
%.tmp8313 = getelementptr [16 x i8], [16 x i8]*@.str8312, i32 0, i32 0
%.tmp8314 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp8311, i8* %.tmp8313)
%assignable_start.8315 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp8314, %m996$.Node.type** %assignable_start.8315
%.tmp8316 = load %m996$.Node.type*, %m996$.Node.type** %assignable_start.8315
%.tmp8317 = call %m2614$.SYStack.type*(%m996$.Node.type*) @m2614$sy_algorithm.m2614$.SYStack.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8316)
%operator_stack.8318 = alloca %m2614$.SYStack.type*
store %m2614$.SYStack.type* %.tmp8317, %m2614$.SYStack.type** %operator_stack.8318
%.tmp8319 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* null, i32 1
%.tmp8320 = ptrtoint %m311$.StackHead.type* %.tmp8319 to i32
%.tmp8321 = call i8*(i32) @malloc(i32 %.tmp8320)
%.tmp8322 = bitcast i8* %.tmp8321 to %m311$.StackHead.type*
%stack.8323 = alloca %m311$.StackHead.type*
store %m311$.StackHead.type* %.tmp8322, %m311$.StackHead.type** %stack.8323
%.tmp8324 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack.8323
%.tmp8325 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* %.tmp8324, i32 0, i32 0
%.tmp8326 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %operator_stack.8318
store %m2614$.SYStack.type* %.tmp8326, %m2614$.SYStack.type** %.tmp8325
%.tmp8327 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8328 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack.8323
%.tmp8329 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m311$.StackHead.type*) @m311$compile_assignable_stack.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m311$.StackHead.typep(%m2859$.CompilerCtx.type* %.tmp8327, %m311$.StackHead.type* %.tmp8328)
%info.8330 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp8329, %m2859$.AssignableInfo.type** %info.8330
%.tmp8331 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.8330
%.tmp8332 = icmp eq %m2859$.AssignableInfo.type* %.tmp8331, null
br i1 %.tmp8332, label %.if.true.8333, label %.if.false.8333
.if.true.8333:
%.tmp8334 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.8330
ret %m2859$.AssignableInfo.type* %.tmp8334
br label %.if.end.8333
.if.false.8333:
br label %.if.end.8333
.if.end.8333:
%.tmp8335 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp8336 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8335, i32 0, i32 8
%.tmp8337 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8336
%.tmp8339 = getelementptr [5 x i8], [5 x i8]*@.str8338, i32 0, i32 0
%.tmp8340 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp8337, i8* %.tmp8339)
%cast.8341 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp8340, %m996$.Node.type** %cast.8341
%.tmp8342 = load %m996$.Node.type*, %m996$.Node.type** %cast.8341
%.tmp8343 = icmp ne %m996$.Node.type* %.tmp8342, null
br i1 %.tmp8343, label %.if.true.8344, label %.if.false.8344
.if.true.8344:
%.tmp8345 = load %m996$.Node.type*, %m996$.Node.type** %cast.8341
%.tmp8346 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8345, i32 0, i32 8
%.tmp8347 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8346
%.tmp8349 = getelementptr [5 x i8], [5 x i8]*@.str8348, i32 0, i32 0
%.tmp8350 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp8347, i8* %.tmp8349)
%cast_type.8351 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp8350, %m996$.Node.type** %cast_type.8351
%.tmp8352 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8353 = load %m996$.Node.type*, %m996$.Node.type** %cast_type.8351
%.tmp8354 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8353, i32 0, i32 8
%.tmp8355 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8354
%.tmp8356 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp8352, %m996$.Node.type* %.tmp8355)
%type.8357 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp8356, %m2859$.Type.type** %type.8357
%.tmp8358 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.8330
%.tmp8359 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp8358)
%prev_id.8360 = alloca i8*
store i8* %.tmp8359, i8** %prev_id.8360
%.tmp8361 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8362 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.8330
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp8361, %m2859$.AssignableInfo.type* %.tmp8362)
%.tmp8363 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8364 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.8330
%.tmp8365 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8364, i32 0, i32 4
%.tmp8366 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8365
%.tmp8367 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp8363, %m2859$.Type.type* %.tmp8366)
%from_type.8368 = alloca i8*
store i8* %.tmp8367, i8** %from_type.8368
%.tmp8369 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8370 = load %m2859$.Type.type*, %m2859$.Type.type** %type.8357
%.tmp8371 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp8369, %m2859$.Type.type* %.tmp8370)
%to_type.8372 = alloca i8*
store i8* %.tmp8371, i8** %to_type.8372
%.tmp8374 = getelementptr [8 x i8], [8 x i8]*@.str8373, i32 0, i32 0
%cast_fn.8375 = alloca i8*
store i8* %.tmp8374, i8** %cast_fn.8375
%.tmp8376 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.8330
%.tmp8377 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8376, i32 0, i32 4
%.tmp8378 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8377
%.tmp8379 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8378, i32 0, i32 1
%.tmp8380 = load i8*, i8** %.tmp8379
%.tmp8381 = icmp ne i8* %.tmp8380, null
br i1 %.tmp8381, label %.if.true.8382, label %.if.false.8382
.if.true.8382:
%.tmp8383 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.8330
%.tmp8384 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8383, i32 0, i32 4
%.tmp8385 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8384
%.tmp8386 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8385, i32 0, i32 1
%.tmp8387 = load i8*, i8** %.tmp8386
%.tmp8389 = getelementptr [6 x i8], [6 x i8]*@.str8388, i32 0, i32 0
%.tmp8390 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8387, i8* %.tmp8389)
%.tmp8391 = icmp eq i32 %.tmp8390, 0
br i1 %.tmp8391, label %.if.true.8392, label %.if.false.8392
.if.true.8392:
%.tmp8394 = getelementptr [48 x i8], [48 x i8]*@.str8393, i32 0, i32 0
%.tmp8395 = call i32(i8*,...) @printf(i8* %.tmp8394)
br label %.if.end.8392
.if.false.8392:
br label %.if.end.8392
.if.end.8392:
br label %.if.end.8382
.if.false.8382:
br label %.if.end.8382
.if.end.8382:
%.tmp8396 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.8330
%.tmp8397 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8396, i32 0, i32 4
%.tmp8398 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8397
%.tmp8399 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8398, i32 0, i32 0
%.tmp8400 = load i8*, i8** %.tmp8399
%.tmp8402 = getelementptr [4 x i8], [4 x i8]*@.str8401, i32 0, i32 0
%.tmp8403 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8400, i8* %.tmp8402)
%.tmp8404 = icmp ne i32 %.tmp8403, 0
%.tmp8405 = load %m2859$.Type.type*, %m2859$.Type.type** %type.8357
%.tmp8406 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8405, i32 0, i32 0
%.tmp8407 = load i8*, i8** %.tmp8406
%.tmp8409 = getelementptr [4 x i8], [4 x i8]*@.str8408, i32 0, i32 0
%.tmp8410 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8407, i8* %.tmp8409)
%.tmp8411 = icmp ne i32 %.tmp8410, 0
%.tmp8412 = and i1 %.tmp8404, %.tmp8411
br i1 %.tmp8412, label %.if.true.8413, label %.if.false.8413
.if.true.8413:
%.tmp8414 = load i8*, i8** %from_type.8368
%.tmp8415 = getelementptr i8, i8* %.tmp8414, i32 0
%.tmp8416 = load i8, i8* %.tmp8415
%.tmp8417 = icmp eq i8 %.tmp8416, 105
%.tmp8418 = load i8*, i8** %to_type.8372
%.tmp8419 = getelementptr i8, i8* %.tmp8418, i32 0
%.tmp8420 = load i8, i8* %.tmp8419
%.tmp8421 = icmp eq i8 %.tmp8420, 105
%.tmp8422 = and i1 %.tmp8417, %.tmp8421
br i1 %.tmp8422, label %.if.true.8423, label %.if.false.8423
.if.true.8423:
%from_size.8424 = alloca i32
store i32 0, i32* %from_size.8424
%to_size.8425 = alloca i32
store i32 0, i32* %to_size.8425
%.tmp8426 = load i8*, i8** %from_type.8368
%.tmp8428 = getelementptr [4 x i8], [4 x i8]*@.str8427, i32 0, i32 0
%.tmp8429 = getelementptr i32, i32* %from_size.8424, i32 0
%.tmp8430 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp8426, i8* %.tmp8428, i32* %.tmp8429)
%.tmp8431 = load i8*, i8** %to_type.8372
%.tmp8433 = getelementptr [4 x i8], [4 x i8]*@.str8432, i32 0, i32 0
%.tmp8434 = getelementptr i32, i32* %to_size.8425, i32 0
%.tmp8435 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp8431, i8* %.tmp8433, i32* %.tmp8434)
%.tmp8436 = load i32, i32* %from_size.8424
%.tmp8437 = load i32, i32* %to_size.8425
%.tmp8438 = icmp slt i32 %.tmp8436, %.tmp8437
br i1 %.tmp8438, label %.if.true.8439, label %.if.false.8439
.if.true.8439:
%.tmp8441 = getelementptr [5 x i8], [5 x i8]*@.str8440, i32 0, i32 0
store i8* %.tmp8441, i8** %cast_fn.8375
br label %.if.end.8439
.if.false.8439:
%.tmp8443 = getelementptr [6 x i8], [6 x i8]*@.str8442, i32 0, i32 0
store i8* %.tmp8443, i8** %cast_fn.8375
br label %.if.end.8439
.if.end.8439:
br label %.if.end.8423
.if.false.8423:
br label %.if.end.8423
.if.end.8423:
br label %.if.end.8413
.if.false.8413:
br label %.if.end.8413
.if.end.8413:
%.tmp8444 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8445 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp8444, i32 0, i32 1
%.tmp8446 = load %m0$.File.type*, %m0$.File.type** %.tmp8445
%.tmp8448 = getelementptr [21 x i8], [21 x i8]*@.str8447, i32 0, i32 0
%.tmp8449 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.8330
%.tmp8450 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp8449)
%.tmp8451 = load i8*, i8** %cast_fn.8375
%.tmp8452 = load i8*, i8** %from_type.8368
%.tmp8453 = load i8*, i8** %prev_id.8360
%.tmp8454 = load i8*, i8** %to_type.8372
%.tmp8455 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8446, i8* %.tmp8448, i8* %.tmp8450, i8* %.tmp8451, i8* %.tmp8452, i8* %.tmp8453, i8* %.tmp8454)
%.tmp8456 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.8330
%.tmp8457 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8456, i32 0, i32 4
%.tmp8458 = load %m2859$.Type.type*, %m2859$.Type.type** %type.8357
store %m2859$.Type.type* %.tmp8458, %m2859$.Type.type** %.tmp8457
br label %.if.end.8344
.if.false.8344:
br label %.if.end.8344
.if.end.8344:
%.tmp8459 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.8330
ret %m2859$.AssignableInfo.type* %.tmp8459
}
define %m2859$.AssignableInfo.type* @m311$compile_assignable_stack.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m311$.StackHead.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m311$.StackHead.type* %.stack.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stack = alloca %m311$.StackHead.type*
store %m311$.StackHead.type* %.stack.arg, %m311$.StackHead.type** %stack
%.tmp8460 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp8461 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* %.tmp8460, i32 0, i32 0
%.tmp8462 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %.tmp8461
%.tmp8463 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp8462, i32 0, i32 0
%.tmp8464 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8463
%.tmp8465 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8464, i32 0, i32 0
%.tmp8466 = load i8*, i8** %.tmp8465
%.tmp8468 = getelementptr [16 x i8], [16 x i8]*@.str8467, i32 0, i32 0
%.tmp8469 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8466, i8* %.tmp8468)
%.tmp8470 = icmp eq i32 %.tmp8469, 0
br i1 %.tmp8470, label %.if.true.8471, label %.if.false.8471
.if.true.8471:
%.tmp8472 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8473 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp8474 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* %.tmp8473, i32 0, i32 0
%.tmp8475 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %.tmp8474
%.tmp8476 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp8475, i32 0, i32 0
%.tmp8477 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8476
%.tmp8478 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_mono_assignable.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp8472, %m996$.Node.type* %.tmp8477)
ret %m2859$.AssignableInfo.type* %.tmp8478
br label %.if.end.8471
.if.false.8471:
br label %.if.end.8471
.if.end.8471:
%.tmp8479 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp8480 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* %.tmp8479, i32 0, i32 0
%.tmp8481 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %.tmp8480
%.tmp8482 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp8481, i32 0, i32 0
%.tmp8483 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8482
%.tmp8484 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8483, i32 0, i32 8
%.tmp8485 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8484
%operator.8486 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp8485, %m996$.Node.type** %operator.8486
%.tmp8487 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp8488 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* %.tmp8487, i32 0, i32 0
%.tmp8489 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp8490 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* %.tmp8489, i32 0, i32 0
%.tmp8491 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %.tmp8490
%.tmp8492 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp8491, i32 0, i32 1
%.tmp8493 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %.tmp8492
store %m2614$.SYStack.type* %.tmp8493, %m2614$.SYStack.type** %.tmp8488
%.tmp8494 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8495 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp8496 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m311$.StackHead.type*) @m311$compile_assignable_stack.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m311$.StackHead.typep(%m2859$.CompilerCtx.type* %.tmp8494, %m311$.StackHead.type* %.tmp8495)
%A.8497 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp8496, %m2859$.AssignableInfo.type** %A.8497
%.tmp8498 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %A.8497
%.tmp8499 = icmp eq %m2859$.AssignableInfo.type* %.tmp8498, null
br i1 %.tmp8499, label %.if.true.8500, label %.if.false.8500
.if.true.8500:
%.tmp8501 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %A.8497
ret %m2859$.AssignableInfo.type* %.tmp8501
br label %.if.end.8500
.if.false.8500:
br label %.if.end.8500
.if.end.8500:
%.tmp8502 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp8503 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* %.tmp8502, i32 0, i32 0
%.tmp8504 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp8505 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* %.tmp8504, i32 0, i32 0
%.tmp8506 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %.tmp8505
%.tmp8507 = getelementptr %m2614$.SYStack.type, %m2614$.SYStack.type* %.tmp8506, i32 0, i32 1
%.tmp8508 = load %m2614$.SYStack.type*, %m2614$.SYStack.type** %.tmp8507
store %m2614$.SYStack.type* %.tmp8508, %m2614$.SYStack.type** %.tmp8503
%.tmp8509 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8510 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp8511 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m311$.StackHead.type*) @m311$compile_assignable_stack.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m311$.StackHead.typep(%m2859$.CompilerCtx.type* %.tmp8509, %m311$.StackHead.type* %.tmp8510)
%B.8512 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp8511, %m2859$.AssignableInfo.type** %B.8512
%.tmp8513 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %B.8512
%.tmp8514 = icmp eq %m2859$.AssignableInfo.type* %.tmp8513, null
br i1 %.tmp8514, label %.if.true.8515, label %.if.false.8515
.if.true.8515:
%.tmp8516 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %B.8512
ret %m2859$.AssignableInfo.type* %.tmp8516
br label %.if.end.8515
.if.false.8515:
br label %.if.end.8515
.if.end.8515:
%.tmp8517 = bitcast ptr null to %m996$.Node.type*
%.tmp8518 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8517)
%op_info.8519 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp8518, %m2859$.AssignableInfo.type** %op_info.8519
%.tmp8520 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %op_info.8519
%.tmp8521 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8520, i32 0, i32 4
%.tmp8522 = load %m996$.Node.type*, %m996$.Node.type** %operator.8486
%.tmp8523 = call %m2859$.Type.type*(%m996$.Node.type*) @m311$operator_type.m2859$.Type.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8522)
store %m2859$.Type.type* %.tmp8523, %m2859$.Type.type** %.tmp8521
%.tmp8524 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8525 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %op_info.8519
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp8524, %m2859$.AssignableInfo.type* %.tmp8525)
%.tmp8526 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8527 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp8526, i32 0, i32 1
%.tmp8528 = load %m0$.File.type*, %m0$.File.type** %.tmp8527
%.tmp8530 = getelementptr [19 x i8], [19 x i8]*@.str8529, i32 0, i32 0
%.tmp8531 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %op_info.8519
%.tmp8532 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp8531)
%.tmp8533 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8534 = load %m996$.Node.type*, %m996$.Node.type** %operator.8486
%.tmp8535 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$operator_op.cp.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp8533, %m996$.Node.type* %.tmp8534)
%.tmp8536 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8537 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %A.8497
%.tmp8538 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8537, i32 0, i32 4
%.tmp8539 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8538
%.tmp8540 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp8536, %m2859$.Type.type* %.tmp8539)
%.tmp8541 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %A.8497
%.tmp8542 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp8541)
%.tmp8543 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %B.8512
%.tmp8544 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp8543)
%.tmp8545 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8528, i8* %.tmp8530, i8* %.tmp8532, i8* %.tmp8535, i8* %.tmp8540, i8* %.tmp8542, i8* %.tmp8544)
%.tmp8546 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %op_info.8519
ret %m2859$.AssignableInfo.type* %.tmp8546
}
define i8* @m311$operator_op.cp.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.op.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%op = alloca %m996$.Node.type*
store %m996$.Node.type* %.op.arg, %m996$.Node.type** %op
%.tmp8547 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8548 = icmp eq %m996$.Node.type* %.tmp8547, null
br i1 %.tmp8548, label %.if.true.8549, label %.if.false.8549
.if.true.8549:
%.tmp8550 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8551 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8553 = getelementptr [31 x i8], [31 x i8]*@.str8552, i32 0, i32 0
%.tmp8554 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp8550, %m996$.Node.type* %.tmp8551, i8* %.tmp8553)
%.tmp8555 = call i32(i8*,...) @printf(i8* %.tmp8554)
br label %.if.end.8549
.if.false.8549:
br label %.if.end.8549
.if.end.8549:
%.tmp8556 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8557 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8556, i32 0, i32 1
%.tmp8558 = load i8*, i8** %.tmp8557
%.tmp8560 = getelementptr [2 x i8], [2 x i8]*@.str8559, i32 0, i32 0
%.tmp8561 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8558, i8* %.tmp8560)
%.tmp8562 = icmp eq i32 %.tmp8561, 0
br i1 %.tmp8562, label %.if.true.8563, label %.if.false.8563
.if.true.8563:
%.tmp8565 = getelementptr [4 x i8], [4 x i8]*@.str8564, i32 0, i32 0
ret i8* %.tmp8565
br label %.if.end.8563
.if.false.8563:
%.tmp8566 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8567 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8566, i32 0, i32 1
%.tmp8568 = load i8*, i8** %.tmp8567
%.tmp8570 = getelementptr [2 x i8], [2 x i8]*@.str8569, i32 0, i32 0
%.tmp8571 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8568, i8* %.tmp8570)
%.tmp8572 = icmp eq i32 %.tmp8571, 0
br i1 %.tmp8572, label %.if.true.8573, label %.if.false.8573
.if.true.8573:
%.tmp8575 = getelementptr [4 x i8], [4 x i8]*@.str8574, i32 0, i32 0
ret i8* %.tmp8575
br label %.if.end.8573
.if.false.8573:
%.tmp8576 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8577 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8576, i32 0, i32 1
%.tmp8578 = load i8*, i8** %.tmp8577
%.tmp8580 = getelementptr [2 x i8], [2 x i8]*@.str8579, i32 0, i32 0
%.tmp8581 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8578, i8* %.tmp8580)
%.tmp8582 = icmp eq i32 %.tmp8581, 0
br i1 %.tmp8582, label %.if.true.8583, label %.if.false.8583
.if.true.8583:
%.tmp8585 = getelementptr [4 x i8], [4 x i8]*@.str8584, i32 0, i32 0
ret i8* %.tmp8585
br label %.if.end.8583
.if.false.8583:
%.tmp8586 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8587 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8586, i32 0, i32 1
%.tmp8588 = load i8*, i8** %.tmp8587
%.tmp8590 = getelementptr [2 x i8], [2 x i8]*@.str8589, i32 0, i32 0
%.tmp8591 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8588, i8* %.tmp8590)
%.tmp8592 = icmp eq i32 %.tmp8591, 0
br i1 %.tmp8592, label %.if.true.8593, label %.if.false.8593
.if.true.8593:
%.tmp8595 = getelementptr [5 x i8], [5 x i8]*@.str8594, i32 0, i32 0
ret i8* %.tmp8595
br label %.if.end.8593
.if.false.8593:
%.tmp8596 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8597 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8596, i32 0, i32 1
%.tmp8598 = load i8*, i8** %.tmp8597
%.tmp8600 = getelementptr [3 x i8], [3 x i8]*@.str8599, i32 0, i32 0
%.tmp8601 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8598, i8* %.tmp8600)
%.tmp8602 = icmp eq i32 %.tmp8601, 0
br i1 %.tmp8602, label %.if.true.8603, label %.if.false.8603
.if.true.8603:
%.tmp8605 = getelementptr [8 x i8], [8 x i8]*@.str8604, i32 0, i32 0
ret i8* %.tmp8605
br label %.if.end.8603
.if.false.8603:
%.tmp8606 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8607 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8606, i32 0, i32 1
%.tmp8608 = load i8*, i8** %.tmp8607
%.tmp8610 = getelementptr [3 x i8], [3 x i8]*@.str8609, i32 0, i32 0
%.tmp8611 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8608, i8* %.tmp8610)
%.tmp8612 = icmp eq i32 %.tmp8611, 0
br i1 %.tmp8612, label %.if.true.8613, label %.if.false.8613
.if.true.8613:
%.tmp8615 = getelementptr [8 x i8], [8 x i8]*@.str8614, i32 0, i32 0
ret i8* %.tmp8615
br label %.if.end.8613
.if.false.8613:
%.tmp8616 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8617 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8616, i32 0, i32 1
%.tmp8618 = load i8*, i8** %.tmp8617
%.tmp8620 = getelementptr [2 x i8], [2 x i8]*@.str8619, i32 0, i32 0
%.tmp8621 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8618, i8* %.tmp8620)
%.tmp8622 = icmp eq i32 %.tmp8621, 0
br i1 %.tmp8622, label %.if.true.8623, label %.if.false.8623
.if.true.8623:
%.tmp8625 = getelementptr [9 x i8], [9 x i8]*@.str8624, i32 0, i32 0
ret i8* %.tmp8625
br label %.if.end.8623
.if.false.8623:
%.tmp8626 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8627 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8626, i32 0, i32 1
%.tmp8628 = load i8*, i8** %.tmp8627
%.tmp8630 = getelementptr [2 x i8], [2 x i8]*@.str8629, i32 0, i32 0
%.tmp8631 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8628, i8* %.tmp8630)
%.tmp8632 = icmp eq i32 %.tmp8631, 0
br i1 %.tmp8632, label %.if.true.8633, label %.if.false.8633
.if.true.8633:
%.tmp8635 = getelementptr [9 x i8], [9 x i8]*@.str8634, i32 0, i32 0
ret i8* %.tmp8635
br label %.if.end.8633
.if.false.8633:
%.tmp8636 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8637 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8636, i32 0, i32 1
%.tmp8638 = load i8*, i8** %.tmp8637
%.tmp8640 = getelementptr [2 x i8], [2 x i8]*@.str8639, i32 0, i32 0
%.tmp8641 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8638, i8* %.tmp8640)
%.tmp8642 = icmp eq i32 %.tmp8641, 0
br i1 %.tmp8642, label %.if.true.8643, label %.if.false.8643
.if.true.8643:
%.tmp8645 = getelementptr [4 x i8], [4 x i8]*@.str8644, i32 0, i32 0
ret i8* %.tmp8645
br label %.if.end.8643
.if.false.8643:
%.tmp8646 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8647 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8646, i32 0, i32 1
%.tmp8648 = load i8*, i8** %.tmp8647
%.tmp8650 = getelementptr [2 x i8], [2 x i8]*@.str8649, i32 0, i32 0
%.tmp8651 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8648, i8* %.tmp8650)
%.tmp8652 = icmp eq i32 %.tmp8651, 0
br i1 %.tmp8652, label %.if.true.8653, label %.if.false.8653
.if.true.8653:
%.tmp8655 = getelementptr [3 x i8], [3 x i8]*@.str8654, i32 0, i32 0
ret i8* %.tmp8655
br label %.if.end.8653
.if.false.8653:
%.tmp8656 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8657 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8656, i32 0, i32 1
%.tmp8658 = load i8*, i8** %.tmp8657
%.tmp8660 = getelementptr [3 x i8], [3 x i8]*@.str8659, i32 0, i32 0
%.tmp8661 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8658, i8* %.tmp8660)
%.tmp8662 = icmp eq i32 %.tmp8661, 0
br i1 %.tmp8662, label %.if.true.8663, label %.if.false.8663
.if.true.8663:
%.tmp8665 = getelementptr [9 x i8], [9 x i8]*@.str8664, i32 0, i32 0
ret i8* %.tmp8665
br label %.if.end.8663
.if.false.8663:
%.tmp8666 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8667 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8666, i32 0, i32 1
%.tmp8668 = load i8*, i8** %.tmp8667
%.tmp8670 = getelementptr [3 x i8], [3 x i8]*@.str8669, i32 0, i32 0
%.tmp8671 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8668, i8* %.tmp8670)
%.tmp8672 = icmp eq i32 %.tmp8671, 0
br i1 %.tmp8672, label %.if.true.8673, label %.if.false.8673
.if.true.8673:
%.tmp8675 = getelementptr [9 x i8], [9 x i8]*@.str8674, i32 0, i32 0
ret i8* %.tmp8675
br label %.if.end.8673
.if.false.8673:
%.tmp8676 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8677 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8676, i32 0, i32 1
%.tmp8678 = load i8*, i8** %.tmp8677
%.tmp8680 = getelementptr [2 x i8], [2 x i8]*@.str8679, i32 0, i32 0
%.tmp8681 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8678, i8* %.tmp8680)
%.tmp8682 = icmp eq i32 %.tmp8681, 0
br i1 %.tmp8682, label %.if.true.8683, label %.if.false.8683
.if.true.8683:
%.tmp8685 = getelementptr [5 x i8], [5 x i8]*@.str8684, i32 0, i32 0
ret i8* %.tmp8685
br label %.if.end.8683
.if.false.8683:
%.tmp8686 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8687 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8689 = getelementptr [30 x i8], [30 x i8]*@.str8688, i32 0, i32 0
%.tmp8690 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp8686, %m996$.Node.type* %.tmp8687, i8* %.tmp8689)
%.tmp8691 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8692 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8691, i32 0, i32 1
%.tmp8693 = load i8*, i8** %.tmp8692
%.tmp8694 = call i32(i8*,...) @printf(i8* %.tmp8690, i8* %.tmp8693)
br label %.if.end.8683
.if.end.8683:
br label %.if.end.8673
.if.end.8673:
br label %.if.end.8663
.if.end.8663:
br label %.if.end.8653
.if.end.8653:
br label %.if.end.8643
.if.end.8643:
br label %.if.end.8633
.if.end.8633:
br label %.if.end.8623
.if.end.8623:
br label %.if.end.8613
.if.end.8613:
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
%.tmp8696 = getelementptr [4 x i8], [4 x i8]*@.str8695, i32 0, i32 0
ret i8* %.tmp8696
}
define %m2859$.Type.type* @m311$operator_type.m2859$.Type.typep.m996$.Node.typep(%m996$.Node.type* %.op.arg) {
%op = alloca %m996$.Node.type*
store %m996$.Node.type* %.op.arg, %m996$.Node.type** %op
%.tmp8697 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
%type.8698 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp8697, %m2859$.Type.type** %type.8698
%.tmp8699 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8700 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8699, i32 0, i32 1
%.tmp8701 = load i8*, i8** %.tmp8700
%.tmp8703 = getelementptr [3 x i8], [3 x i8]*@.str8702, i32 0, i32 0
%.tmp8704 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8701, i8* %.tmp8703)
%.tmp8705 = icmp eq i32 %.tmp8704, 0
%.tmp8706 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8707 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8706, i32 0, i32 1
%.tmp8708 = load i8*, i8** %.tmp8707
%.tmp8710 = getelementptr [3 x i8], [3 x i8]*@.str8709, i32 0, i32 0
%.tmp8711 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8708, i8* %.tmp8710)
%.tmp8712 = icmp eq i32 %.tmp8711, 0
%.tmp8713 = or i1 %.tmp8705, %.tmp8712
%.tmp8714 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8715 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8714, i32 0, i32 1
%.tmp8716 = load i8*, i8** %.tmp8715
%.tmp8718 = getelementptr [2 x i8], [2 x i8]*@.str8717, i32 0, i32 0
%.tmp8719 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8716, i8* %.tmp8718)
%.tmp8720 = icmp eq i32 %.tmp8719, 0
%.tmp8721 = or i1 %.tmp8713, %.tmp8720
%.tmp8722 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8723 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8722, i32 0, i32 1
%.tmp8724 = load i8*, i8** %.tmp8723
%.tmp8726 = getelementptr [2 x i8], [2 x i8]*@.str8725, i32 0, i32 0
%.tmp8727 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8724, i8* %.tmp8726)
%.tmp8728 = icmp eq i32 %.tmp8727, 0
%.tmp8729 = or i1 %.tmp8721, %.tmp8728
%.tmp8730 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8731 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8730, i32 0, i32 1
%.tmp8732 = load i8*, i8** %.tmp8731
%.tmp8734 = getelementptr [2 x i8], [2 x i8]*@.str8733, i32 0, i32 0
%.tmp8735 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8732, i8* %.tmp8734)
%.tmp8736 = icmp eq i32 %.tmp8735, 0
%.tmp8737 = or i1 %.tmp8729, %.tmp8736
%.tmp8738 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8739 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8738, i32 0, i32 1
%.tmp8740 = load i8*, i8** %.tmp8739
%.tmp8742 = getelementptr [2 x i8], [2 x i8]*@.str8741, i32 0, i32 0
%.tmp8743 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8740, i8* %.tmp8742)
%.tmp8744 = icmp eq i32 %.tmp8743, 0
%.tmp8745 = or i1 %.tmp8737, %.tmp8744
%.tmp8746 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8747 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8746, i32 0, i32 1
%.tmp8748 = load i8*, i8** %.tmp8747
%.tmp8750 = getelementptr [3 x i8], [3 x i8]*@.str8749, i32 0, i32 0
%.tmp8751 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8748, i8* %.tmp8750)
%.tmp8752 = icmp eq i32 %.tmp8751, 0
%.tmp8753 = or i1 %.tmp8745, %.tmp8752
%.tmp8754 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8755 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8754, i32 0, i32 1
%.tmp8756 = load i8*, i8** %.tmp8755
%.tmp8758 = getelementptr [3 x i8], [3 x i8]*@.str8757, i32 0, i32 0
%.tmp8759 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8756, i8* %.tmp8758)
%.tmp8760 = icmp eq i32 %.tmp8759, 0
%.tmp8761 = or i1 %.tmp8753, %.tmp8760
br i1 %.tmp8761, label %.if.true.8762, label %.if.false.8762
.if.true.8762:
%.tmp8763 = load %m2859$.Type.type*, %m2859$.Type.type** %type.8698
%.tmp8764 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8763, i32 0, i32 0
%.tmp8766 = getelementptr [5 x i8], [5 x i8]*@.str8765, i32 0, i32 0
store i8* %.tmp8766, i8** %.tmp8764
br label %.if.end.8762
.if.false.8762:
%.tmp8767 = load %m2859$.Type.type*, %m2859$.Type.type** %type.8698
%.tmp8768 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8767, i32 0, i32 0
%.tmp8770 = getelementptr [4 x i8], [4 x i8]*@.str8769, i32 0, i32 0
store i8* %.tmp8770, i8** %.tmp8768
br label %.if.end.8762
.if.end.8762:
%.tmp8771 = load %m2859$.Type.type*, %m2859$.Type.type** %type.8698
ret %m2859$.Type.type* %.tmp8771
}
define %m2859$.AssignableInfo.type* @m311$compile_mono_assignable.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%curr_node = alloca %m996$.Node.type*
store %m996$.Node.type* %.curr_node.arg, %m996$.Node.type** %curr_node
%.tmp8772 = bitcast ptr null to %m2859$.AssignableInfo.type*
%assignable_info.8773 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp8772, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8774 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%mono.8775 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp8774, %m996$.Node.type** %mono.8775
%.tmp8777 = getelementptr [1 x i8], [1 x i8]*@.str8776, i32 0, i32 0
%err_buf.8778 = alloca i8*
store i8* %.tmp8777, i8** %err_buf.8778
%.tmp8780 = getelementptr [1 x i8], [1 x i8]*@.str8779, i32 0, i32 0
%buf.8781 = alloca i8*
store i8* %.tmp8780, i8** %buf.8781
%.tmp8782 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp8783 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8782, i32 0, i32 8
%.tmp8784 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8783
%.tmp8785 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8784, i32 0, i32 0
%.tmp8786 = load i8*, i8** %.tmp8785
%.tmp8788 = getelementptr [7 x i8], [7 x i8]*@.str8787, i32 0, i32 0
%.tmp8789 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8786, i8* %.tmp8788)
%.tmp8790 = icmp eq i32 %.tmp8789, 0
br i1 %.tmp8790, label %.if.true.8791, label %.if.false.8791
.if.true.8791:
%.tmp8792 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp8793 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8792)
store %m2859$.AssignableInfo.type* %.tmp8793, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8794 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8795 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8794, i32 0, i32 4
%.tmp8796 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp8796, %m2859$.Type.type** %.tmp8795
%.tmp8797 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8798 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8797, i32 0, i32 4
%.tmp8799 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8798
%.tmp8800 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8799, i32 0, i32 0
%.tmp8802 = getelementptr [4 x i8], [4 x i8]*@.str8801, i32 0, i32 0
store i8* %.tmp8802, i8** %.tmp8800
%.tmp8803 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8804 = load i8, i8* @SCOPE_CONST
%.tmp8805 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp8806 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8805, i32 0, i32 8
%.tmp8807 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8806
%.tmp8808 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8807, i32 0, i32 1
%.tmp8809 = load i8*, i8** %.tmp8808
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp8803, i8 %.tmp8804, i8* %.tmp8809)
br label %.if.end.8791
.if.false.8791:
%.tmp8810 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp8811 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8810, i32 0, i32 8
%.tmp8812 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8811
%.tmp8813 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8812, i32 0, i32 0
%.tmp8814 = load i8*, i8** %.tmp8813
%.tmp8816 = getelementptr [5 x i8], [5 x i8]*@.str8815, i32 0, i32 0
%.tmp8817 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8814, i8* %.tmp8816)
%.tmp8818 = icmp eq i32 %.tmp8817, 0
br i1 %.tmp8818, label %.if.true.8819, label %.if.false.8819
.if.true.8819:
%.tmp8820 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp8821 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8820, i32 0, i32 8
%.tmp8822 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8821
%.tmp8823 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8822, i32 0, i32 1
%.tmp8824 = load i8*, i8** %.tmp8823
%.tmp8826 = getelementptr [5 x i8], [5 x i8]*@.str8825, i32 0, i32 0
%.tmp8827 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8824, i8* %.tmp8826)
%.tmp8828 = icmp ne i32 %.tmp8827, 0
br i1 %.tmp8828, label %.if.true.8829, label %.if.false.8829
.if.true.8829:
%.tmp8830 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8831 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp8833 = getelementptr [42 x i8], [42 x i8]*@.str8832, i32 0, i32 0
%.tmp8834 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp8830, %m996$.Node.type* %.tmp8831, i8* %.tmp8833)
%.tmp8835 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp8836 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8835, i32 0, i32 8
%.tmp8837 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8836
%.tmp8838 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8837, i32 0, i32 1
%.tmp8839 = load i8*, i8** %.tmp8838
%.tmp8840 = call i32(i8*,...) @printf(i8* %.tmp8834, i8* %.tmp8839)
%.tmp8841 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp8841
br label %.if.end.8829
.if.false.8829:
br label %.if.end.8829
.if.end.8829:
%.tmp8842 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp8843 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8842)
store %m2859$.AssignableInfo.type* %.tmp8843, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8844 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8845 = load i8, i8* @SCOPE_CONST
%.tmp8847 = getelementptr [5 x i8], [5 x i8]*@.str8846, i32 0, i32 0
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp8844, i8 %.tmp8845, i8* %.tmp8847)
%.tmp8848 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8849 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8848, i32 0, i32 4
%.tmp8850 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp8850, %m2859$.Type.type** %.tmp8849
%.tmp8851 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8852 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8851, i32 0, i32 4
%.tmp8853 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8852
%.tmp8854 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8853, i32 0, i32 0
%.tmp8856 = getelementptr [8 x i8], [8 x i8]*@.str8855, i32 0, i32 0
store i8* %.tmp8856, i8** %.tmp8854
br label %.if.end.8819
.if.false.8819:
%.tmp8857 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp8858 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8857, i32 0, i32 8
%.tmp8859 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8858
%.tmp8860 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8859, i32 0, i32 0
%.tmp8861 = load i8*, i8** %.tmp8860
%.tmp8863 = getelementptr [17 x i8], [17 x i8]*@.str8862, i32 0, i32 0
%.tmp8864 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8861, i8* %.tmp8863)
%.tmp8865 = icmp eq i32 %.tmp8864, 0
br i1 %.tmp8865, label %.if.true.8866, label %.if.false.8866
.if.true.8866:
%.tmp8867 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp8868 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8867)
store %m2859$.AssignableInfo.type* %.tmp8868, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8869 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp8870 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8869, i32 0, i32 8
%.tmp8871 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8870
%.tmp8872 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8871, i32 0, i32 8
%.tmp8873 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8872
%.tmp8875 = getelementptr [12 x i8], [12 x i8]*@.str8874, i32 0, i32 0
%.tmp8876 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp8873, i8* %.tmp8875)
%dest.8877 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp8876, %m996$.Node.type** %dest.8877
%.tmp8878 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8879 = load %m996$.Node.type*, %m996$.Node.type** %dest.8877
%.tmp8880 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_addr.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp8878, %m996$.Node.type* %.tmp8879)
%var_info.8881 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp8880, %m2859$.AssignableInfo.type** %var_info.8881
%.tmp8882 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %var_info.8881
%.tmp8883 = icmp eq %m2859$.AssignableInfo.type* %.tmp8882, null
br i1 %.tmp8883, label %.if.true.8884, label %.if.false.8884
.if.true.8884:
%.tmp8885 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp8885
br label %.if.end.8884
.if.false.8884:
br label %.if.end.8884
.if.end.8884:
%.tmp8886 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %var_info.8881
%.tmp8887 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8886, i32 0, i32 4
%.tmp8888 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8887
%.tmp8889 = icmp eq %m2859$.Type.type* %.tmp8888, null
br i1 %.tmp8889, label %.if.true.8890, label %.if.false.8890
.if.true.8890:
%.tmp8891 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp8891
br label %.if.end.8890
.if.false.8890:
br label %.if.end.8890
.if.end.8890:
%.tmp8892 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8893 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %var_info.8881
%.tmp8894 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8893, i32 0, i32 4
%.tmp8895 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8894
%.tmp8896 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp8892, %m2859$.Type.type* %.tmp8895)
%var_type_repr.8897 = alloca i8*
store i8* %.tmp8896, i8** %var_type_repr.8897
%.tmp8898 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8899 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp8898, %m2859$.AssignableInfo.type* %.tmp8899)
%.tmp8900 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8901 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8900, i32 0, i32 4
%.tmp8902 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %var_info.8881
%.tmp8903 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8902, i32 0, i32 4
%.tmp8904 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8903
store %m2859$.Type.type* %.tmp8904, %m2859$.Type.type** %.tmp8901
%.tmp8906 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp8907 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8906, i32 0, i32 8
%.tmp8908 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8907
%.tmp8909 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8908, i32 0, i32 8
%.tmp8910 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8909
%ptr.8911 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp8910, %m996$.Node.type** %ptr.8911
br label %.for.start.8905
.for.start.8905:
%.tmp8912 = load %m996$.Node.type*, %m996$.Node.type** %ptr.8911
%.tmp8913 = load %m996$.Node.type*, %m996$.Node.type** %dest.8877
%.tmp8914 = icmp ne %m996$.Node.type* %.tmp8912, %.tmp8913
br i1 %.tmp8914, label %.for.continue.8905, label %.for.end.8905
.for.continue.8905:
%.tmp8915 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
%type.8916 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp8915, %m2859$.Type.type** %type.8916
%.tmp8917 = load %m2859$.Type.type*, %m2859$.Type.type** %type.8916
%.tmp8918 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8917, i32 0, i32 3
%.tmp8919 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8920 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8919, i32 0, i32 4
%.tmp8921 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8920
store %m2859$.Type.type* %.tmp8921, %m2859$.Type.type** %.tmp8918
%.tmp8922 = load %m2859$.Type.type*, %m2859$.Type.type** %type.8916
%.tmp8923 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8922, i32 0, i32 0
%.tmp8925 = getelementptr [4 x i8], [4 x i8]*@.str8924, i32 0, i32 0
store i8* %.tmp8925, i8** %.tmp8923
%.tmp8926 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8927 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8926, i32 0, i32 4
%.tmp8928 = load %m2859$.Type.type*, %m2859$.Type.type** %type.8916
store %m2859$.Type.type* %.tmp8928, %m2859$.Type.type** %.tmp8927
%.tmp8929 = load %m996$.Node.type*, %m996$.Node.type** %ptr.8911
%.tmp8930 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8929, i32 0, i32 9
%.tmp8931 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8930
store %m996$.Node.type* %.tmp8931, %m996$.Node.type** %ptr.8911
br label %.for.start.8905
.for.end.8905:
%.tmp8932 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp8933 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8932, i32 0, i32 8
%.tmp8934 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8933
%.tmp8935 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8934, i32 0, i32 8
%.tmp8936 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8935
%.tmp8937 = load %m996$.Node.type*, %m996$.Node.type** %dest.8877
%.tmp8938 = icmp ne %m996$.Node.type* %.tmp8936, %.tmp8937
br i1 %.tmp8938, label %.if.true.8939, label %.if.false.8939
.if.true.8939:
%.tmp8940 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8941 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp8940, i32 0, i32 1
%.tmp8942 = load %m0$.File.type*, %m0$.File.type** %.tmp8941
%.tmp8944 = getelementptr [38 x i8], [38 x i8]*@.str8943, i32 0, i32 0
%.tmp8945 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8946 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp8945)
%.tmp8947 = load i8*, i8** %var_type_repr.8897
%.tmp8948 = load i8*, i8** %var_type_repr.8897
%.tmp8949 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %var_info.8881
%.tmp8950 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp8949)
%.tmp8951 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8942, i8* %.tmp8944, i8* %.tmp8946, i8* %.tmp8947, i8* %.tmp8948, i8* %.tmp8950)
br label %.if.end.8939
.if.false.8939:
%.tmp8952 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8953 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8952, i32 0, i32 4
%.tmp8954 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8953
%.tmp8955 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8954, i32 0, i32 0
%.tmp8956 = load i8*, i8** %.tmp8955
%.tmp8958 = getelementptr [9 x i8], [9 x i8]*@.str8957, i32 0, i32 0
%.tmp8959 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8956, i8* %.tmp8958)
%.tmp8960 = icmp eq i32 %.tmp8959, 0
br i1 %.tmp8960, label %.if.true.8961, label %.if.false.8961
.if.true.8961:
%.tmp8962 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %var_info.8881
store %m2859$.AssignableInfo.type* %.tmp8962, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8963 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
%type.8964 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp8963, %m2859$.Type.type** %type.8964
%.tmp8965 = load %m2859$.Type.type*, %m2859$.Type.type** %type.8964
%.tmp8966 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8965, i32 0, i32 3
%.tmp8967 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8968 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8967, i32 0, i32 4
%.tmp8969 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp8968
store %m2859$.Type.type* %.tmp8969, %m2859$.Type.type** %.tmp8966
%.tmp8970 = load %m2859$.Type.type*, %m2859$.Type.type** %type.8964
%.tmp8971 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp8970, i32 0, i32 0
%.tmp8973 = getelementptr [4 x i8], [4 x i8]*@.str8972, i32 0, i32 0
store i8* %.tmp8973, i8** %.tmp8971
%.tmp8974 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8975 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp8974, i32 0, i32 4
%.tmp8976 = load %m2859$.Type.type*, %m2859$.Type.type** %type.8964
store %m2859$.Type.type* %.tmp8976, %m2859$.Type.type** %.tmp8975
br label %.if.end.8961
.if.false.8961:
%.tmp8977 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp8978 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp8977, i32 0, i32 1
%.tmp8979 = load %m0$.File.type*, %m0$.File.type** %.tmp8978
%.tmp8981 = getelementptr [22 x i8], [22 x i8]*@.str8980, i32 0, i32 0
%.tmp8982 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp8983 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp8982)
%.tmp8984 = load i8*, i8** %var_type_repr.8897
%.tmp8985 = load i8*, i8** %var_type_repr.8897
%.tmp8986 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %var_info.8881
%.tmp8987 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp8986)
%.tmp8988 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8979, i8* %.tmp8981, i8* %.tmp8983, i8* %.tmp8984, i8* %.tmp8985, i8* %.tmp8987)
br label %.if.end.8961
.if.end.8961:
br label %.if.end.8939
.if.end.8939:
br label %.if.end.8866
.if.false.8866:
%.tmp8989 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp8990 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8989, i32 0, i32 8
%.tmp8991 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8990
%.tmp8992 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8991, i32 0, i32 0
%.tmp8993 = load i8*, i8** %.tmp8992
%.tmp8995 = getelementptr [8 x i8], [8 x i8]*@.str8994, i32 0, i32 0
%.tmp8996 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8993, i8* %.tmp8995)
%.tmp8997 = icmp eq i32 %.tmp8996, 0
br i1 %.tmp8997, label %.if.true.8998, label %.if.false.8998
.if.true.8998:
%.tmp8999 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp9000 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8999)
store %m2859$.AssignableInfo.type* %.tmp9000, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9001 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9002 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9001, i32 0, i32 4
%.tmp9003 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp9003, %m2859$.Type.type** %.tmp9002
%.tmp9004 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9005 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9004, i32 0, i32 4
%.tmp9006 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9005
%.tmp9007 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9006, i32 0, i32 0
%.tmp9009 = getelementptr [5 x i8], [5 x i8]*@.str9008, i32 0, i32 0
store i8* %.tmp9009, i8** %.tmp9007
%.tmp9010 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp9011 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9010, i32 0, i32 8
%.tmp9012 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9011
%.tmp9013 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9012, i32 0, i32 8
%.tmp9014 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9013
%.tmp9015 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9014, i32 0, i32 1
%.tmp9016 = load i8*, i8** %.tmp9015
%.tmp9018 = getelementptr [6 x i8], [6 x i8]*@.str9017, i32 0, i32 0
%.tmp9019 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9016, i8* %.tmp9018)
%.tmp9020 = icmp eq i32 %.tmp9019, 0
br i1 %.tmp9020, label %.if.true.9021, label %.if.false.9021
.if.true.9021:
%.tmp9022 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9023 = load i8, i8* @SCOPE_CONST
%.tmp9025 = getelementptr [2 x i8], [2 x i8]*@.str9024, i32 0, i32 0
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp9022, i8 %.tmp9023, i8* %.tmp9025)
br label %.if.end.9021
.if.false.9021:
%.tmp9026 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9027 = load i8, i8* @SCOPE_CONST
%.tmp9029 = getelementptr [2 x i8], [2 x i8]*@.str9028, i32 0, i32 0
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp9026, i8 %.tmp9027, i8* %.tmp9029)
br label %.if.end.9021
.if.end.9021:
br label %.if.end.8998
.if.false.8998:
%.tmp9030 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp9031 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9030, i32 0, i32 8
%.tmp9032 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9031
%.tmp9033 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9032, i32 0, i32 0
%.tmp9034 = load i8*, i8** %.tmp9033
%.tmp9036 = getelementptr [8 x i8], [8 x i8]*@.str9035, i32 0, i32 0
%.tmp9037 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9034, i8* %.tmp9036)
%.tmp9038 = icmp eq i32 %.tmp9037, 0
br i1 %.tmp9038, label %.if.true.9039, label %.if.false.9039
.if.true.9039:
%.tmp9040 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9041 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp9042 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9041, i32 0, i32 8
%.tmp9043 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9042
%.tmp9044 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9043, i32 0, i32 8
%.tmp9045 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9044
%.tmp9046 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_fn_call.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp9040, %m996$.Node.type* %.tmp9045)
store %m2859$.AssignableInfo.type* %.tmp9046, %m2859$.AssignableInfo.type** %assignable_info.8773
br label %.if.end.9039
.if.false.9039:
%.tmp9047 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp9048 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9047, i32 0, i32 8
%.tmp9049 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9048
%.tmp9050 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9049, i32 0, i32 0
%.tmp9051 = load i8*, i8** %.tmp9050
%.tmp9053 = getelementptr [7 x i8], [7 x i8]*@.str9052, i32 0, i32 0
%.tmp9054 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9051, i8* %.tmp9053)
%.tmp9055 = icmp eq i32 %.tmp9054, 0
br i1 %.tmp9055, label %.if.true.9056, label %.if.false.9056
.if.true.9056:
%.tmp9057 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9058 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp9059 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9058, i32 0, i32 8
%.tmp9060 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9059
%.tmp9061 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9060, i32 0, i32 1
%.tmp9062 = load i8*, i8** %.tmp9061
%.tmp9063 = call %m2859$.AssignableInfo.type*(%m2859$.CompilerCtx.type*,i8*) @m311$define_string.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.cp(%m2859$.CompilerCtx.type* %.tmp9057, i8* %.tmp9062)
%string_info.9064 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp9063, %m2859$.AssignableInfo.type** %string_info.9064
%.tmp9065 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp9066 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp9065)
store %m2859$.AssignableInfo.type* %.tmp9066, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9067 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9068 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
call void(%m2859$.CompilerCtx.type*,%m2859$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2859$.CompilerCtx.typep.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp9067, %m2859$.AssignableInfo.type* %.tmp9068)
%.tmp9069 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9070 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %string_info.9064
%.tmp9071 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9070, i32 0, i32 4
%.tmp9072 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9071
%.tmp9073 = call i8*(%m2859$.CompilerCtx.type*,%m2859$.Type.type*) @m2860$repr.cp.m2859$.CompilerCtx.typep.m2859$.Type.typep(%m2859$.CompilerCtx.type* %.tmp9069, %m2859$.Type.type* %.tmp9072)
%str_tr.9074 = alloca i8*
store i8* %.tmp9073, i8** %str_tr.9074
%.tmp9075 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9076 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp9075, i32 0, i32 1
%.tmp9077 = load %m0$.File.type*, %m0$.File.type** %.tmp9076
%.tmp9079 = getelementptr [44 x i8], [44 x i8]*@.str9078, i32 0, i32 0
%.tmp9080 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9081 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp9080)
%.tmp9082 = load i8*, i8** %str_tr.9074
%.tmp9083 = load i8*, i8** %str_tr.9074
%.tmp9084 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %string_info.9064
%.tmp9085 = call i8*(%m2859$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2859$.AssignableInfo.typep(%m2859$.AssignableInfo.type* %.tmp9084)
%.tmp9086 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9077, i8* %.tmp9079, i8* %.tmp9081, i8* %.tmp9082, i8* %.tmp9083, i8* %.tmp9085)
%.tmp9087 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9088 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9087, i32 0, i32 4
%.tmp9089 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp9089, %m2859$.Type.type** %.tmp9088
%.tmp9090 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9091 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9090, i32 0, i32 4
%.tmp9092 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9091
%.tmp9093 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9092, i32 0, i32 0
%.tmp9095 = getelementptr [4 x i8], [4 x i8]*@.str9094, i32 0, i32 0
store i8* %.tmp9095, i8** %.tmp9093
%.tmp9096 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9097 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9096, i32 0, i32 4
%.tmp9098 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9097
%.tmp9099 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9098, i32 0, i32 3
%.tmp9100 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp9100, %m2859$.Type.type** %.tmp9099
%.tmp9101 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9102 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9101, i32 0, i32 4
%.tmp9103 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9102
%.tmp9104 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9103, i32 0, i32 3
%.tmp9105 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9104
%.tmp9106 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9105, i32 0, i32 0
%.tmp9108 = getelementptr [4 x i8], [4 x i8]*@.str9107, i32 0, i32 0
store i8* %.tmp9108, i8** %.tmp9106
br label %.if.end.9056
.if.false.9056:
%.tmp9109 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp9110 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9109, i32 0, i32 8
%.tmp9111 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9110
%.tmp9112 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9111, i32 0, i32 0
%.tmp9113 = load i8*, i8** %.tmp9112
%.tmp9115 = getelementptr [4 x i8], [4 x i8]*@.str9114, i32 0, i32 0
%.tmp9116 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9113, i8* %.tmp9115)
%.tmp9117 = icmp eq i32 %.tmp9116, 0
br i1 %.tmp9117, label %.if.true.9118, label %.if.false.9118
.if.true.9118:
%.tmp9119 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp9120 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp9119)
store %m2859$.AssignableInfo.type* %.tmp9120, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9121 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp9122 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9121, i32 0, i32 8
%.tmp9123 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9122
%.tmp9124 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9123, i32 0, i32 1
%.tmp9125 = load i8*, i8** %.tmp9124
%.tmp9126 = call i32(i8*) @strlen(i8* %.tmp9125)
%chr_len.9127 = alloca i32
store i32 %.tmp9126, i32* %chr_len.9127
%.tmp9128 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9129 = load i8, i8* @SCOPE_CONST
%.tmp9131 = getelementptr [2 x i8], [2 x i8]*@.str9130, i32 0, i32 0
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp9128, i8 %.tmp9129, i8* %.tmp9131)
%.tmp9132 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9133 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9132, i32 0, i32 0
%.tmp9134 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp9135 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9134, i32 0, i32 8
%.tmp9136 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9135
%.tmp9137 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9136, i32 0, i32 1
%.tmp9138 = load i8*, i8** %.tmp9137
%.tmp9139 = call i8*(i8*) @m2413$chr_to_llvm.cp.cp(i8* %.tmp9138)
store i8* %.tmp9139, i8** %.tmp9133
%.tmp9140 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9141 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9140, i32 0, i32 0
%.tmp9142 = load i8*, i8** %.tmp9141
%.tmp9143 = icmp eq i8* %.tmp9142, null
br i1 %.tmp9143, label %.if.true.9144, label %.if.false.9144
.if.true.9144:
%.tmp9145 = getelementptr i8*, i8** %err_buf.8778, i32 0
%.tmp9147 = getelementptr [22 x i8], [22 x i8]*@.str9146, i32 0, i32 0
%.tmp9148 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp9149 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9148, i32 0, i32 8
%.tmp9150 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9149
%.tmp9151 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9150, i32 0, i32 1
%.tmp9152 = load i8*, i8** %.tmp9151
%.tmp9153 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9145, i8* %.tmp9147, i8* %.tmp9152)
%.tmp9154 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp9154
br label %.if.end.9144
.if.false.9144:
br label %.if.end.9144
.if.end.9144:
%.tmp9155 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9156 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9155, i32 0, i32 4
%.tmp9157 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp9157, %m2859$.Type.type** %.tmp9156
%.tmp9158 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9159 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9158, i32 0, i32 4
%.tmp9160 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9159
%.tmp9161 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9160, i32 0, i32 0
%.tmp9163 = getelementptr [4 x i8], [4 x i8]*@.str9162, i32 0, i32 0
store i8* %.tmp9163, i8** %.tmp9161
br label %.if.end.9118
.if.false.9118:
%.tmp9164 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9165 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp9167 = getelementptr [40 x i8], [40 x i8]*@.str9166, i32 0, i32 0
%.tmp9168 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp9164, %m996$.Node.type* %.tmp9165, i8* %.tmp9167)
%.tmp9169 = load %m996$.Node.type*, %m996$.Node.type** %mono.8775
%.tmp9170 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9169, i32 0, i32 8
%.tmp9171 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9170
%.tmp9172 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9171, i32 0, i32 0
%.tmp9173 = load i8*, i8** %.tmp9172
%.tmp9174 = call i32(i8*,...) @printf(i8* %.tmp9168, i8* %.tmp9173)
%.tmp9175 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp9175
br label %.if.end.9118
.if.end.9118:
br label %.if.end.9056
.if.end.9056:
br label %.if.end.9039
.if.end.9039:
br label %.if.end.8998
.if.end.8998:
br label %.if.end.8866
.if.end.8866:
br label %.if.end.8819
.if.end.8819:
br label %.if.end.8791
.if.end.8791:
%.tmp9176 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9177 = icmp eq %m2859$.AssignableInfo.type* %.tmp9176, null
br i1 %.tmp9177, label %.if.true.9178, label %.if.false.9178
.if.true.9178:
%.tmp9179 = bitcast ptr null to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp9179
br label %.if.end.9178
.if.false.9178:
br label %.if.end.9178
.if.end.9178:
%.tmp9180 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9181 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9180, i32 0, i32 5
%.tmp9182 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp9183 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9182, i32 0, i32 3
%.tmp9184 = load i32, i32* %.tmp9183
store i32 %.tmp9184, i32* %.tmp9181
%.tmp9185 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9186 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9185, i32 0, i32 6
%.tmp9187 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp9188 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9187, i32 0, i32 4
%.tmp9189 = load i32, i32* %.tmp9188
store i32 %.tmp9189, i32* %.tmp9186
%.tmp9190 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %assignable_info.8773
%.tmp9191 = bitcast %m2859$.AssignableInfo.type* %.tmp9190 to %m2859$.AssignableInfo.type*
ret %m2859$.AssignableInfo.type* %.tmp9191
}
define i8* @m311$type_abbr.cp.m2859$.Type.typep(%m2859$.Type.type* %.type.arg) {
%type = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.type.arg, %m2859$.Type.type** %type
%.tmp9192 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp9193 = icmp ne %m2859$.Type.type* %.tmp9192, null
%.tmp9195 = getelementptr [22 x i8], [22 x i8]*@.str9194, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp9193, i8* %.tmp9195)
%.tmp9196 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp9197 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9196, i32 0, i32 0
%.tmp9198 = load i8*, i8** %.tmp9197
%.tmp9199 = icmp ne i8* %.tmp9198, null
%.tmp9201 = getelementptr [59 x i8], [59 x i8]*@.str9200, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp9199, i8* %.tmp9201)
%.tmp9202 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp9203 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9202, i32 0, i32 0
%.tmp9204 = load i8*, i8** %.tmp9203
%.tmp9206 = getelementptr [4 x i8], [4 x i8]*@.str9205, i32 0, i32 0
%.tmp9207 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9204, i8* %.tmp9206)
%.tmp9208 = icmp eq i32 %.tmp9207, 0
br i1 %.tmp9208, label %.if.true.9209, label %.if.false.9209
.if.true.9209:
%.tmp9211 = getelementptr [2 x i8], [2 x i8]*@.str9210, i32 0, i32 0
ret i8* %.tmp9211
br label %.if.end.9209
.if.false.9209:
%.tmp9212 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp9213 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9212, i32 0, i32 0
%.tmp9214 = load i8*, i8** %.tmp9213
%.tmp9216 = getelementptr [5 x i8], [5 x i8]*@.str9215, i32 0, i32 0
%.tmp9217 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9214, i8* %.tmp9216)
%.tmp9218 = icmp eq i32 %.tmp9217, 0
br i1 %.tmp9218, label %.if.true.9219, label %.if.false.9219
.if.true.9219:
%.tmp9221 = getelementptr [2 x i8], [2 x i8]*@.str9220, i32 0, i32 0
ret i8* %.tmp9221
br label %.if.end.9219
.if.false.9219:
%.tmp9222 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp9223 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9222, i32 0, i32 0
%.tmp9224 = load i8*, i8** %.tmp9223
%.tmp9226 = getelementptr [5 x i8], [5 x i8]*@.str9225, i32 0, i32 0
%.tmp9227 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9224, i8* %.tmp9226)
%.tmp9228 = icmp eq i32 %.tmp9227, 0
br i1 %.tmp9228, label %.if.true.9229, label %.if.false.9229
.if.true.9229:
%.tmp9231 = getelementptr [2 x i8], [2 x i8]*@.str9230, i32 0, i32 0
ret i8* %.tmp9231
br label %.if.end.9229
.if.false.9229:
%.tmp9232 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp9233 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9232, i32 0, i32 0
%.tmp9234 = load i8*, i8** %.tmp9233
%.tmp9236 = getelementptr [4 x i8], [4 x i8]*@.str9235, i32 0, i32 0
%.tmp9237 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9234, i8* %.tmp9236)
%.tmp9238 = icmp eq i32 %.tmp9237, 0
br i1 %.tmp9238, label %.if.true.9239, label %.if.false.9239
.if.true.9239:
%.tmp9241 = getelementptr [2 x i8], [2 x i8]*@.str9240, i32 0, i32 0
ret i8* %.tmp9241
br label %.if.end.9239
.if.false.9239:
%.tmp9242 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp9243 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9242, i32 0, i32 0
%.tmp9244 = load i8*, i8** %.tmp9243
%.tmp9246 = getelementptr [4 x i8], [4 x i8]*@.str9245, i32 0, i32 0
%.tmp9247 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9244, i8* %.tmp9246)
%.tmp9248 = icmp eq i32 %.tmp9247, 0
br i1 %.tmp9248, label %.if.true.9249, label %.if.false.9249
.if.true.9249:
%.tmp9251 = getelementptr [1 x i8], [1 x i8]*@.str9250, i32 0, i32 0
%buf.9252 = alloca i8*
store i8* %.tmp9251, i8** %buf.9252
%.tmp9253 = getelementptr i8*, i8** %buf.9252, i32 0
%.tmp9255 = getelementptr [4 x i8], [4 x i8]*@.str9254, i32 0, i32 0
%.tmp9256 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp9257 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9256, i32 0, i32 3
%.tmp9258 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9257
%.tmp9259 = call i8*(%m2859$.Type.type*) @m311$type_abbr.cp.m2859$.Type.typep(%m2859$.Type.type* %.tmp9258)
%.tmp9260 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9253, i8* %.tmp9255, i8* %.tmp9259)
%.tmp9261 = load i8*, i8** %buf.9252
ret i8* %.tmp9261
br label %.if.end.9249
.if.false.9249:
%.tmp9262 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp9263 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9262, i32 0, i32 0
%.tmp9264 = load i8*, i8** %.tmp9263
%.tmp9266 = getelementptr [10 x i8], [10 x i8]*@.str9265, i32 0, i32 0
%.tmp9267 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9264, i8* %.tmp9266)
%.tmp9268 = icmp eq i32 %.tmp9267, 0
br i1 %.tmp9268, label %.if.true.9269, label %.if.false.9269
.if.true.9269:
%.tmp9270 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp9271 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9270, i32 0, i32 2
%.tmp9272 = load i8*, i8** %.tmp9271
ret i8* %.tmp9272
br label %.if.end.9269
.if.false.9269:
%.tmp9273 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp9274 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9273, i32 0, i32 0
%.tmp9275 = load i8*, i8** %.tmp9274
%.tmp9277 = getelementptr [7 x i8], [7 x i8]*@.str9276, i32 0, i32 0
%.tmp9278 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9275, i8* %.tmp9277)
%.tmp9279 = icmp eq i32 %.tmp9278, 0
br i1 %.tmp9279, label %.if.true.9280, label %.if.false.9280
.if.true.9280:
%.tmp9282 = getelementptr [2 x i8], [2 x i8]*@.str9281, i32 0, i32 0
%buf.9283 = alloca i8*
store i8* %.tmp9282, i8** %buf.9283
%.tmp9285 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp9286 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9285, i32 0, i32 3
%.tmp9287 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9286
%t.9288 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp9287, %m2859$.Type.type** %t.9288
br label %.for.start.9284
.for.start.9284:
%.tmp9289 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9288
%.tmp9290 = icmp ne %m2859$.Type.type* %.tmp9289, null
br i1 %.tmp9290, label %.for.continue.9284, label %.for.end.9284
.for.continue.9284:
%.tmp9291 = getelementptr i8*, i8** %buf.9283, i32 0
%.tmp9293 = getelementptr [5 x i8], [5 x i8]*@.str9292, i32 0, i32 0
%.tmp9294 = load i8*, i8** %buf.9283
%.tmp9295 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9288
%.tmp9296 = call i8*(%m2859$.Type.type*) @m311$type_abbr.cp.m2859$.Type.typep(%m2859$.Type.type* %.tmp9295)
%.tmp9297 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9291, i8* %.tmp9293, i8* %.tmp9294, i8* %.tmp9296)
%.tmp9298 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9288
%.tmp9299 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9298, i32 0, i32 4
%.tmp9300 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9299
store %m2859$.Type.type* %.tmp9300, %m2859$.Type.type** %t.9288
br label %.for.start.9284
.for.end.9284:
%.tmp9301 = load i8*, i8** %buf.9283
ret i8* %.tmp9301
br label %.if.end.9280
.if.false.9280:
%.tmp9302 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp9303 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9302, i32 0, i32 0
%.tmp9304 = load i8*, i8** %.tmp9303
%.tmp9306 = getelementptr [9 x i8], [9 x i8]*@.str9305, i32 0, i32 0
%.tmp9307 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9304, i8* %.tmp9306)
%.tmp9308 = icmp eq i32 %.tmp9307, 0
br i1 %.tmp9308, label %.if.true.9309, label %.if.false.9309
.if.true.9309:
%.tmp9311 = getelementptr [2 x i8], [2 x i8]*@.str9310, i32 0, i32 0
ret i8* %.tmp9311
br label %.if.end.9309
.if.false.9309:
%.tmp9312 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp9313 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9312, i32 0, i32 0
%.tmp9314 = load i8*, i8** %.tmp9313
%.tmp9316 = getelementptr [6 x i8], [6 x i8]*@.str9315, i32 0, i32 0
%.tmp9317 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9314, i8* %.tmp9316)
%.tmp9318 = icmp eq i32 %.tmp9317, 0
br i1 %.tmp9318, label %.if.true.9319, label %.if.false.9319
.if.true.9319:
%.tmp9321 = getelementptr [2 x i8], [2 x i8]*@.str9320, i32 0, i32 0
ret i8* %.tmp9321
br label %.if.end.9319
.if.false.9319:
%.tmp9323 = getelementptr [45 x i8], [45 x i8]*@.str9322, i32 0, i32 0
%.tmp9324 = load %m2859$.Type.type*, %m2859$.Type.type** %type
%.tmp9325 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9324, i32 0, i32 0
%.tmp9326 = load i8*, i8** %.tmp9325
%.tmp9327 = call i32(i8*,...) @printf(i8* %.tmp9323, i8* %.tmp9326)
br label %.if.end.9319
.if.end.9319:
br label %.if.end.9309
.if.end.9309:
br label %.if.end.9280
.if.end.9280:
br label %.if.end.9269
.if.end.9269:
br label %.if.end.9249
.if.end.9249:
br label %.if.end.9239
.if.end.9239:
br label %.if.end.9229
.if.end.9229:
br label %.if.end.9219
.if.end.9219:
br label %.if.end.9209
.if.end.9209:
%.tmp9328 = bitcast ptr null to i8*
ret i8* %.tmp9328
}
define %m2859$.AssignableInfo.type* @m311$define_string.m2859$.AssignableInfo.typep.m2859$.CompilerCtx.typep.cp(%m2859$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp9329 = bitcast ptr null to %m996$.Node.type*
%.tmp9330 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp9329)
%info.9331 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp9330, %m2859$.AssignableInfo.type** %info.9331
%.tmp9333 = getelementptr [1 x i8], [1 x i8]*@.str9332, i32 0, i32 0
%tmp_buff.9334 = alloca i8*
store i8* %.tmp9333, i8** %tmp_buff.9334
%.tmp9335 = getelementptr i8*, i8** %tmp_buff.9334, i32 0
%.tmp9337 = getelementptr [7 x i8], [7 x i8]*@.str9336, i32 0, i32 0
%.tmp9338 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9339 = call i32(%m2859$.CompilerCtx.type*) @m311$new_uid.i.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.tmp9338)
%.tmp9340 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9335, i8* %.tmp9337, i32 %.tmp9339)
%.tmp9341 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.9331
%.tmp9342 = load i8, i8* @SCOPE_GLOBAL
%.tmp9343 = load i8*, i8** %tmp_buff.9334
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp9341, i8 %.tmp9342, i8* %.tmp9343)
%.tmp9344 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.9331
%.tmp9345 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9344, i32 0, i32 4
%.tmp9346 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp9346, %m2859$.Type.type** %.tmp9345
%.tmp9347 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.9331
%.tmp9348 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9347, i32 0, i32 4
%.tmp9349 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9348
%.tmp9350 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9349, i32 0, i32 0
%.tmp9352 = getelementptr [6 x i8], [6 x i8]*@.str9351, i32 0, i32 0
store i8* %.tmp9352, i8** %.tmp9350
%.tmp9353 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.9331
%.tmp9354 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9353, i32 0, i32 4
%.tmp9355 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9354
%.tmp9356 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9355, i32 0, i32 3
%.tmp9357 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp9357, %m2859$.Type.type** %.tmp9356
%.tmp9358 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.9331
%.tmp9359 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9358, i32 0, i32 4
%.tmp9360 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9359
%.tmp9361 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9360, i32 0, i32 3
%.tmp9362 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9361
%.tmp9363 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9362, i32 0, i32 0
%.tmp9365 = getelementptr [4 x i8], [4 x i8]*@.str9364, i32 0, i32 0
store i8* %.tmp9365, i8** %.tmp9363
%.tmp9366 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.9331
%.tmp9367 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9366, i32 0, i32 4
%.tmp9368 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9367
%.tmp9369 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9368, i32 0, i32 3
%.tmp9370 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9369
%.tmp9371 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9370, i32 0, i32 4
%.tmp9372 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp9372, %m2859$.Type.type** %.tmp9371
%.tmp9373 = load i8*, i8** %text
%.tmp9374 = call i8*(i8*) @m2413$string_to_llvm.cp.cp(i8* %.tmp9373)
%identifier.9375 = alloca i8*
store i8* %.tmp9374, i8** %identifier.9375
%.tmp9376 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.9331
%.tmp9377 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9376, i32 0, i32 4
%.tmp9378 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9377
%.tmp9379 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9378, i32 0, i32 3
%.tmp9380 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9379
%.tmp9381 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9380, i32 0, i32 4
%.tmp9382 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9381
%.tmp9383 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9382, i32 0, i32 0
%.tmp9384 = getelementptr i8*, i8** %.tmp9383, i32 0
%.tmp9386 = getelementptr [3 x i8], [3 x i8]*@.str9385, i32 0, i32 0
%.tmp9387 = load i8*, i8** %identifier.9375
%.tmp9388 = call i32(i8*) @m2413$llvm_str_len.i.cp(i8* %.tmp9387)
%.tmp9389 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9384, i8* %.tmp9386, i32 %.tmp9388)
%.tmp9390 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9391 = load i8*, i8** %identifier.9375
%.tmp9393 = getelementptr [7 x i8], [7 x i8]*@.str9392, i32 0, i32 0
%.tmp9394 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.9331
call void(%m2859$.CompilerCtx.type*,i8*,i8*,%m2859$.AssignableInfo.type*,i1,i1) @m311$define_global.v.m2859$.CompilerCtx.typep.cp.cp.m2859$.AssignableInfo.typep.b.b(%m2859$.CompilerCtx.type* %.tmp9390, i8* %.tmp9391, i8* %.tmp9393, %m2859$.AssignableInfo.type* %.tmp9394, i1 0, i1 0)
%.tmp9395 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.9331
ret %m2859$.AssignableInfo.type* %.tmp9395
}
define void @m311$define_global.v.m2859$.CompilerCtx.typep.cp.cp.m2859$.AssignableInfo.typep.b.b(%m2859$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg, i8* %.type.arg, %m2859$.AssignableInfo.type* %.info.arg, i1 %.weak.arg, i1 %.compiled.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%type = alloca i8*
store i8* %.type.arg, i8** %type
%info = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.info.arg, %m2859$.AssignableInfo.type** %info
%weak = alloca i1
store i1 %.weak.arg, i1* %weak
%compiled = alloca i1
store i1 %.compiled.arg, i1* %compiled
%.tmp9396 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* null, i32 1
%.tmp9397 = ptrtoint %m2859$.GlobalName.type* %.tmp9396 to i32
%.tmp9398 = call i8*(i32) @malloc(i32 %.tmp9397)
%.tmp9399 = bitcast i8* %.tmp9398 to %m2859$.GlobalName.type*
%global.9400 = alloca %m2859$.GlobalName.type*
store %m2859$.GlobalName.type* %.tmp9399, %m2859$.GlobalName.type** %global.9400
%.tmp9401 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %global.9400
%.tmp9402 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp9401, i32 0, i32 0
%.tmp9403 = load i8*, i8** %id
store i8* %.tmp9403, i8** %.tmp9402
%.tmp9404 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %global.9400
%.tmp9405 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp9404, i32 0, i32 1
%.tmp9406 = load i8*, i8** %type
store i8* %.tmp9406, i8** %.tmp9405
%.tmp9407 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %global.9400
%.tmp9408 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp9407, i32 0, i32 4
%.tmp9409 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info
store %m2859$.AssignableInfo.type* %.tmp9409, %m2859$.AssignableInfo.type** %.tmp9408
%.tmp9410 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %global.9400
%.tmp9411 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp9410, i32 0, i32 2
%.tmp9412 = load i1, i1* %compiled
store i1 %.tmp9412, i1* %.tmp9411
%.tmp9413 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %global.9400
%.tmp9414 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp9413, i32 0, i32 5
store %m2859$.GlobalName.type* null, %m2859$.GlobalName.type** %.tmp9414
%.tmp9415 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %global.9400
%.tmp9416 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp9415, i32 0, i32 3
%.tmp9417 = load i1, i1* %weak
store i1 %.tmp9417, i1* %.tmp9416
%.tmp9418 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9419 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %global.9400
call void(%m2859$.CompilerCtx.type*,%m2859$.GlobalName.type*) @m311$append_global.v.m2859$.CompilerCtx.typep.m2859$.GlobalName.typep(%m2859$.CompilerCtx.type* %.tmp9418, %m2859$.GlobalName.type* %.tmp9419)
ret void
}
define void @m311$define_module.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp.cp(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.mod.arg, i8* %.as_name.arg, i8* %.abspath.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%mod = alloca %m996$.Node.type*
store %m996$.Node.type* %.mod.arg, %m996$.Node.type** %mod
%as_name = alloca i8*
store i8* %.as_name.arg, i8** %as_name
%abspath = alloca i8*
store i8* %.abspath.arg, i8** %abspath
%.tmp9420 = load %m996$.Node.type*, %m996$.Node.type** %mod
%.tmp9421 = call %m2859$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2859$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp9420)
%info.9422 = alloca %m2859$.AssignableInfo.type*
store %m2859$.AssignableInfo.type* %.tmp9421, %m2859$.AssignableInfo.type** %info.9422
%.tmp9423 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.9422
%.tmp9424 = load i8, i8* @SCOPE_CONST
%.tmp9425 = load i8*, i8** %abspath
call void(%m2859$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2859$.AssignableInfo.typep.c.cp(%m2859$.AssignableInfo.type* %.tmp9423, i8 %.tmp9424, i8* %.tmp9425)
%.tmp9426 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.9422
%.tmp9427 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9426, i32 0, i32 3
%.tmp9429 = getelementptr [7 x i8], [7 x i8]*@.str9428, i32 0, i32 0
store i8* %.tmp9429, i8** %.tmp9427
%.tmp9430 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.9422
%.tmp9431 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9430, i32 0, i32 4
store %m2859$.Type.type* null, %m2859$.Type.type** %.tmp9431
%.tmp9432 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9433 = load %m996$.Node.type*, %m996$.Node.type** %mod
%.tmp9434 = load i8*, i8** %as_name
%.tmp9435 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %info.9422
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2859$.AssignableInfo.type*) @m311$define_assignable.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp.m2859$.AssignableInfo.typep(%m2859$.CompilerCtx.type* %.tmp9432, %m996$.Node.type* %.tmp9433, i8* %.tmp9434, %m2859$.AssignableInfo.type* %.tmp9435)
ret void
}
define void @m311$append_anon_fn.v.m2859$.CompilerCtx.typep.cp(%m2859$.CompilerCtx.type* %.ctx.arg, i8* %.code.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%code = alloca i8*
store i8* %.code.arg, i8** %code
%.tmp9436 = getelementptr %m2859$.AnonFn.type, %m2859$.AnonFn.type* null, i32 1
%.tmp9437 = ptrtoint %m2859$.AnonFn.type* %.tmp9436 to i32
%.tmp9438 = call i8*(i32) @malloc(i32 %.tmp9437)
%.tmp9439 = bitcast i8* %.tmp9438 to %m2859$.AnonFn.type*
%fn.9440 = alloca %m2859$.AnonFn.type*
store %m2859$.AnonFn.type* %.tmp9439, %m2859$.AnonFn.type** %fn.9440
%.tmp9441 = load %m2859$.AnonFn.type*, %m2859$.AnonFn.type** %fn.9440
%.tmp9442 = getelementptr %m2859$.AnonFn.type, %m2859$.AnonFn.type* %.tmp9441, i32 0, i32 0
%.tmp9443 = load i8*, i8** %code
store i8* %.tmp9443, i8** %.tmp9442
%.tmp9444 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9445 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp9444, i32 0, i32 8
%.tmp9446 = load %m2859$.AnonFn.type*, %m2859$.AnonFn.type** %.tmp9445
%.tmp9447 = icmp eq %m2859$.AnonFn.type* %.tmp9446, null
br i1 %.tmp9447, label %.if.true.9448, label %.if.false.9448
.if.true.9448:
%.tmp9449 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9450 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp9449, i32 0, i32 8
%.tmp9451 = load %m2859$.AnonFn.type*, %m2859$.AnonFn.type** %fn.9440
store %m2859$.AnonFn.type* %.tmp9451, %m2859$.AnonFn.type** %.tmp9450
%.tmp9452 = load %m2859$.AnonFn.type*, %m2859$.AnonFn.type** %fn.9440
%.tmp9453 = getelementptr %m2859$.AnonFn.type, %m2859$.AnonFn.type* %.tmp9452, i32 0, i32 1
store %m2859$.AnonFn.type* null, %m2859$.AnonFn.type** %.tmp9453
br label %.if.end.9448
.if.false.9448:
%.tmp9454 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9455 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp9454, i32 0, i32 8
%.tmp9456 = load %m2859$.AnonFn.type*, %m2859$.AnonFn.type** %.tmp9455
%last.9457 = alloca %m2859$.AnonFn.type*
store %m2859$.AnonFn.type* %.tmp9456, %m2859$.AnonFn.type** %last.9457
br label %.for.start.9458
.for.start.9458:
%.tmp9459 = load %m2859$.AnonFn.type*, %m2859$.AnonFn.type** %last.9457
%.tmp9460 = getelementptr %m2859$.AnonFn.type, %m2859$.AnonFn.type* %.tmp9459, i32 0, i32 1
%.tmp9461 = load %m2859$.AnonFn.type*, %m2859$.AnonFn.type** %.tmp9460
%.tmp9462 = icmp ne %m2859$.AnonFn.type* %.tmp9461, null
br i1 %.tmp9462, label %.for.continue.9458, label %.for.end.9458
.for.continue.9458:
%.tmp9463 = load %m2859$.AnonFn.type*, %m2859$.AnonFn.type** %last.9457
%.tmp9464 = getelementptr %m2859$.AnonFn.type, %m2859$.AnonFn.type* %.tmp9463, i32 0, i32 1
%.tmp9465 = load %m2859$.AnonFn.type*, %m2859$.AnonFn.type** %.tmp9464
store %m2859$.AnonFn.type* %.tmp9465, %m2859$.AnonFn.type** %last.9457
br label %.for.start.9458
.for.end.9458:
%.tmp9466 = load %m2859$.AnonFn.type*, %m2859$.AnonFn.type** %last.9457
%.tmp9467 = getelementptr %m2859$.AnonFn.type, %m2859$.AnonFn.type* %.tmp9466, i32 0, i32 1
%.tmp9468 = load %m2859$.AnonFn.type*, %m2859$.AnonFn.type** %fn.9440
store %m2859$.AnonFn.type* %.tmp9468, %m2859$.AnonFn.type** %.tmp9467
br label %.if.end.9448
.if.end.9448:
ret void
}
define void @m311$compile_anon_fn.v.m2859$.CompilerCtx.typep(%m2859$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%.tmp9470 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9471 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp9470, i32 0, i32 8
%.tmp9472 = load %m2859$.AnonFn.type*, %m2859$.AnonFn.type** %.tmp9471
%fn.9473 = alloca %m2859$.AnonFn.type*
store %m2859$.AnonFn.type* %.tmp9472, %m2859$.AnonFn.type** %fn.9473
br label %.for.start.9469
.for.start.9469:
%.tmp9474 = load %m2859$.AnonFn.type*, %m2859$.AnonFn.type** %fn.9473
%.tmp9475 = icmp ne %m2859$.AnonFn.type* %.tmp9474, null
br i1 %.tmp9475, label %.for.continue.9469, label %.for.end.9469
.for.continue.9469:
%.tmp9476 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9477 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp9476, i32 0, i32 1
%.tmp9478 = load %m0$.File.type*, %m0$.File.type** %.tmp9477
%.tmp9480 = getelementptr [4 x i8], [4 x i8]*@.str9479, i32 0, i32 0
%.tmp9481 = load %m2859$.AnonFn.type*, %m2859$.AnonFn.type** %fn.9473
%.tmp9482 = getelementptr %m2859$.AnonFn.type, %m2859$.AnonFn.type* %.tmp9481, i32 0, i32 0
%.tmp9483 = load i8*, i8** %.tmp9482
%.tmp9484 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9478, i8* %.tmp9480, i8* %.tmp9483)
%.tmp9485 = load %m2859$.AnonFn.type*, %m2859$.AnonFn.type** %fn.9473
%.tmp9486 = getelementptr %m2859$.AnonFn.type, %m2859$.AnonFn.type* %.tmp9485, i32 0, i32 1
%.tmp9487 = load %m2859$.AnonFn.type*, %m2859$.AnonFn.type** %.tmp9486
store %m2859$.AnonFn.type* %.tmp9487, %m2859$.AnonFn.type** %fn.9473
br label %.for.start.9469
.for.end.9469:
%.tmp9488 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9489 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp9488, i32 0, i32 8
store %m2859$.AnonFn.type* null, %m2859$.AnonFn.type** %.tmp9489
ret void
}
define void @m311$append_global.v.m2859$.CompilerCtx.typep.m2859$.GlobalName.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%g = alloca %m2859$.GlobalName.type*
store %m2859$.GlobalName.type* %.g.arg, %m2859$.GlobalName.type** %g
%.tmp9490 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9491 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp9490, i32 0, i32 3
%.tmp9492 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %.tmp9491
%.tmp9493 = icmp eq %m2859$.GlobalName.type* %.tmp9492, null
br i1 %.tmp9493, label %.if.true.9494, label %.if.false.9494
.if.true.9494:
%.tmp9495 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9496 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp9495, i32 0, i32 3
%.tmp9497 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g
store %m2859$.GlobalName.type* %.tmp9497, %m2859$.GlobalName.type** %.tmp9496
ret void
br label %.if.end.9494
.if.false.9494:
br label %.if.end.9494
.if.end.9494:
%.tmp9498 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9499 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp9498, i32 0, i32 3
%.tmp9500 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %.tmp9499
%last_global.9501 = alloca %m2859$.GlobalName.type*
store %m2859$.GlobalName.type* %.tmp9500, %m2859$.GlobalName.type** %last_global.9501
%.tmp9503 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9504 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp9503, i32 0, i32 3
%.tmp9505 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %.tmp9504
%curr_global.9506 = alloca %m2859$.GlobalName.type*
store %m2859$.GlobalName.type* %.tmp9505, %m2859$.GlobalName.type** %curr_global.9506
br label %.for.start.9502
.for.start.9502:
%.tmp9507 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %curr_global.9506
%.tmp9508 = icmp ne %m2859$.GlobalName.type* %.tmp9507, null
br i1 %.tmp9508, label %.for.continue.9502, label %.for.end.9502
.for.continue.9502:
%.tmp9509 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %curr_global.9506
%.tmp9510 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp9509, i32 0, i32 4
%.tmp9511 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %.tmp9510
%.tmp9512 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9511, i32 0, i32 0
%.tmp9513 = load i8*, i8** %.tmp9512
%.tmp9514 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g
%.tmp9515 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp9514, i32 0, i32 4
%.tmp9516 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %.tmp9515
%.tmp9517 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9516, i32 0, i32 0
%.tmp9518 = load i8*, i8** %.tmp9517
%.tmp9519 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9513, i8* %.tmp9518)
%.tmp9520 = icmp eq i32 %.tmp9519, 0
br i1 %.tmp9520, label %.if.true.9521, label %.if.false.9521
.if.true.9521:
ret void
br label %.if.end.9521
.if.false.9521:
br label %.if.end.9521
.if.end.9521:
%.tmp9522 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %curr_global.9506
store %m2859$.GlobalName.type* %.tmp9522, %m2859$.GlobalName.type** %last_global.9501
%.tmp9523 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %curr_global.9506
%.tmp9524 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp9523, i32 0, i32 5
%.tmp9525 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %.tmp9524
store %m2859$.GlobalName.type* %.tmp9525, %m2859$.GlobalName.type** %curr_global.9506
br label %.for.start.9502
.for.end.9502:
%.tmp9526 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %last_global.9501
%.tmp9527 = getelementptr %m2859$.GlobalName.type, %m2859$.GlobalName.type* %.tmp9526, i32 0, i32 5
%.tmp9528 = load %m2859$.GlobalName.type*, %m2859$.GlobalName.type** %g
store %m2859$.GlobalName.type* %.tmp9528, %m2859$.GlobalName.type** %.tmp9527
ret void
}
define void @m311$append_error.v.m2859$.CompilerCtx.typep.m312$.Error.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m312$.Error.type* %.e.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%e = alloca %m312$.Error.type*
store %m312$.Error.type* %.e.arg, %m312$.Error.type** %e
%.tmp9529 = getelementptr %m2859$.ErrorList.type, %m2859$.ErrorList.type* null, i32 1
%.tmp9530 = ptrtoint %m2859$.ErrorList.type* %.tmp9529 to i32
%.tmp9531 = call i8*(i32) @malloc(i32 %.tmp9530)
%.tmp9532 = bitcast i8* %.tmp9531 to %m2859$.ErrorList.type*
%new_err.9533 = alloca %m2859$.ErrorList.type*
store %m2859$.ErrorList.type* %.tmp9532, %m2859$.ErrorList.type** %new_err.9533
%.tmp9534 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %new_err.9533
%.tmp9535 = getelementptr %m2859$.ErrorList.type, %m2859$.ErrorList.type* %.tmp9534, i32 0, i32 2
store i1 0, i1* %.tmp9535
%.tmp9536 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %new_err.9533
%.tmp9537 = getelementptr %m2859$.ErrorList.type, %m2859$.ErrorList.type* %.tmp9536, i32 0, i32 0
%.tmp9538 = load %m312$.Error.type*, %m312$.Error.type** %e
store %m312$.Error.type* %.tmp9538, %m312$.Error.type** %.tmp9537
%.tmp9539 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %new_err.9533
%.tmp9540 = getelementptr %m2859$.ErrorList.type, %m2859$.ErrorList.type* %.tmp9539, i32 0, i32 1
store %m2859$.ErrorList.type* null, %m2859$.ErrorList.type** %.tmp9540
%.tmp9541 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9542 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp9541, i32 0, i32 2
%.tmp9543 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %.tmp9542
%.tmp9544 = icmp eq %m2859$.ErrorList.type* %.tmp9543, null
br i1 %.tmp9544, label %.if.true.9545, label %.if.false.9545
.if.true.9545:
%.tmp9546 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9547 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp9546, i32 0, i32 2
%.tmp9548 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %new_err.9533
store %m2859$.ErrorList.type* %.tmp9548, %m2859$.ErrorList.type** %.tmp9547
ret void
br label %.if.end.9545
.if.false.9545:
br label %.if.end.9545
.if.end.9545:
%last.9549 = alloca %m2859$.ErrorList.type*
store %m2859$.ErrorList.type* null, %m2859$.ErrorList.type** %last.9549
%.tmp9551 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9552 = getelementptr %m2859$.CompilerCtx.type, %m2859$.CompilerCtx.type* %.tmp9551, i32 0, i32 2
%.tmp9553 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %.tmp9552
store %m2859$.ErrorList.type* %.tmp9553, %m2859$.ErrorList.type** %last.9549
br label %.for.start.9550
.for.start.9550:
%.tmp9554 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %last.9549
%.tmp9555 = getelementptr %m2859$.ErrorList.type, %m2859$.ErrorList.type* %.tmp9554, i32 0, i32 1
%.tmp9556 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %.tmp9555
%.tmp9557 = icmp ne %m2859$.ErrorList.type* %.tmp9556, null
br i1 %.tmp9557, label %.for.continue.9550, label %.for.end.9550
.for.continue.9550:
%.tmp9558 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %last.9549
%.tmp9559 = getelementptr %m2859$.ErrorList.type, %m2859$.ErrorList.type* %.tmp9558, i32 0, i32 1
%.tmp9560 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %.tmp9559
store %m2859$.ErrorList.type* %.tmp9560, %m2859$.ErrorList.type** %last.9549
br label %.for.start.9550
.for.end.9550:
%.tmp9561 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %last.9549
%.tmp9562 = getelementptr %m2859$.ErrorList.type, %m2859$.ErrorList.type* %.tmp9561, i32 0, i32 1
%.tmp9563 = load %m2859$.ErrorList.type*, %m2859$.ErrorList.type** %new_err.9533
store %m2859$.ErrorList.type* %.tmp9563, %m2859$.ErrorList.type** %.tmp9562
ret void
}
define i8* @m311$syn_function_name.cp.m996$.Node.typep(%m996$.Node.type* %.stmt.arg) {
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp9564 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9565 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9564, i32 0, i32 8
%.tmp9566 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9565
%.tmp9567 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9566, i32 0, i32 9
%.tmp9568 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9567
%.tmp9569 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9568, i32 0, i32 1
%.tmp9570 = load i8*, i8** %.tmp9569
ret i8* %.tmp9570
}
define %m996$.Node.type* @m311$skip_to_tag.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.node.arg, i8* %.tag.arg) {
%node = alloca %m996$.Node.type*
store %m996$.Node.type* %.node.arg, %m996$.Node.type** %node
%tag = alloca i8*
store i8* %.tag.arg, i8** %tag
%.tmp9572 = load %m996$.Node.type*, %m996$.Node.type** %node
%n.9573 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9572, %m996$.Node.type** %n.9573
br label %.for.start.9571
.for.start.9571:
%.tmp9574 = load %m996$.Node.type*, %m996$.Node.type** %n.9573
%.tmp9575 = icmp ne %m996$.Node.type* %.tmp9574, null
br i1 %.tmp9575, label %.for.continue.9571, label %.for.end.9571
.for.continue.9571:
%.tmp9576 = load %m996$.Node.type*, %m996$.Node.type** %n.9573
%.tmp9577 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9576, i32 0, i32 6
%.tmp9578 = load i8*, i8** %.tmp9577
%.tmp9579 = load i8*, i8** %tag
%.tmp9580 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9578, i8* %.tmp9579)
%.tmp9581 = icmp eq i32 %.tmp9580, 0
br i1 %.tmp9581, label %.if.true.9582, label %.if.false.9582
.if.true.9582:
%.tmp9583 = load %m996$.Node.type*, %m996$.Node.type** %n.9573
ret %m996$.Node.type* %.tmp9583
br label %.if.end.9582
.if.false.9582:
br label %.if.end.9582
.if.end.9582:
%.tmp9584 = load %m996$.Node.type*, %m996$.Node.type** %n.9573
%.tmp9585 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9584, i32 0, i32 9
%.tmp9586 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9585
store %m996$.Node.type* %.tmp9586, %m996$.Node.type** %n.9573
br label %.for.start.9571
.for.end.9571:
%.tmp9587 = bitcast ptr null to %m996$.Node.type*
ret %m996$.Node.type* %.tmp9587
}
define %m996$.Node.type* @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m996$.Node.type*
store %m996$.Node.type* %.node.arg, %m996$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp9589 = load %m996$.Node.type*, %m996$.Node.type** %node
%n.9590 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9589, %m996$.Node.type** %n.9590
br label %.for.start.9588
.for.start.9588:
%.tmp9591 = load %m996$.Node.type*, %m996$.Node.type** %n.9590
%.tmp9592 = icmp ne %m996$.Node.type* %.tmp9591, null
br i1 %.tmp9592, label %.for.continue.9588, label %.for.end.9588
.for.continue.9588:
%.tmp9593 = load %m996$.Node.type*, %m996$.Node.type** %n.9590
%.tmp9594 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9593, i32 0, i32 0
%.tmp9595 = load i8*, i8** %.tmp9594
%.tmp9596 = load i8*, i8** %type
%.tmp9597 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9595, i8* %.tmp9596)
%.tmp9598 = icmp eq i32 %.tmp9597, 0
br i1 %.tmp9598, label %.if.true.9599, label %.if.false.9599
.if.true.9599:
%.tmp9600 = load %m996$.Node.type*, %m996$.Node.type** %n.9590
ret %m996$.Node.type* %.tmp9600
br label %.if.end.9599
.if.false.9599:
br label %.if.end.9599
.if.end.9599:
%.tmp9601 = load %m996$.Node.type*, %m996$.Node.type** %n.9590
%.tmp9602 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9601, i32 0, i32 9
%.tmp9603 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9602
store %m996$.Node.type* %.tmp9603, %m996$.Node.type** %n.9590
br label %.for.start.9588
.for.end.9588:
%.tmp9604 = bitcast ptr null to %m996$.Node.type*
ret %m996$.Node.type* %.tmp9604
}
define %m2859$.Type.type* @m311$syn_function_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp9605 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
%function_type.9606 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp9605, %m2859$.Type.type** %function_type.9606
%.tmp9607 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9608 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9609 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9608, i32 0, i32 8
%.tmp9610 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9609
%.tmp9611 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp9607, %m996$.Node.type* %.tmp9610)
%return_value_type.9612 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp9611, %m2859$.Type.type** %return_value_type.9612
%.tmp9613 = load %m2859$.Type.type*, %m2859$.Type.type** %function_type.9606
%.tmp9614 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9613, i32 0, i32 0
%.tmp9616 = getelementptr [9 x i8], [9 x i8]*@.str9615, i32 0, i32 0
store i8* %.tmp9616, i8** %.tmp9614
%.tmp9617 = load %m2859$.Type.type*, %m2859$.Type.type** %function_type.9606
%.tmp9618 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9617, i32 0, i32 3
%.tmp9619 = load %m2859$.Type.type*, %m2859$.Type.type** %return_value_type.9612
store %m2859$.Type.type* %.tmp9619, %m2859$.Type.type** %.tmp9618
%.tmp9620 = load %m2859$.Type.type*, %m2859$.Type.type** %return_value_type.9612
%last_type.9621 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp9620, %m2859$.Type.type** %last_type.9621
%.tmp9622 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9623 = call %m996$.Node.type*(%m996$.Node.type*) @m311$syn_function_params.m996$.Node.typep.m996$.Node.typep(%m996$.Node.type* %.tmp9622)
%params.9624 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9623, %m996$.Node.type** %params.9624
%.tmp9626 = load %m996$.Node.type*, %m996$.Node.type** %params.9624
%param_ptr.9627 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9626, %m996$.Node.type** %param_ptr.9627
br label %.for.start.9625
.for.start.9625:
%.tmp9628 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9627
%.tmp9629 = icmp ne %m996$.Node.type* %.tmp9628, null
br i1 %.tmp9629, label %.for.continue.9625, label %.for.end.9625
.for.continue.9625:
%.tmp9630 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9627
%.tmp9631 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9630, i32 0, i32 0
%.tmp9632 = load i8*, i8** %.tmp9631
%.tmp9634 = getelementptr [5 x i8], [5 x i8]*@.str9633, i32 0, i32 0
%.tmp9635 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9632, i8* %.tmp9634)
%.tmp9636 = icmp eq i32 %.tmp9635, 0
br i1 %.tmp9636, label %.if.true.9637, label %.if.false.9637
.if.true.9637:
%.tmp9638 = load %m2859$.Type.type*, %m2859$.Type.type** %last_type.9621
%.tmp9639 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9638, i32 0, i32 4
%.tmp9640 = load %m2859$.Type.type*, %m2859$.Type.type** %last_type.9621
%.tmp9641 = call %m2859$.Type.type*(%m2859$.Type.type*) @m311$type_clone.m2859$.Type.typep.m2859$.Type.typep(%m2859$.Type.type* %.tmp9640)
store %m2859$.Type.type* %.tmp9641, %m2859$.Type.type** %.tmp9639
%.tmp9642 = load %m2859$.Type.type*, %m2859$.Type.type** %last_type.9621
%.tmp9643 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9642, i32 0, i32 4
%.tmp9644 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9643
%.tmp9645 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9644, i32 0, i32 4
store %m2859$.Type.type* null, %m2859$.Type.type** %.tmp9645
%.tmp9646 = load %m2859$.Type.type*, %m2859$.Type.type** %last_type.9621
%.tmp9647 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9646, i32 0, i32 4
%.tmp9648 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9647
store %m2859$.Type.type* %.tmp9648, %m2859$.Type.type** %last_type.9621
%.tmp9649 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9627
%.tmp9650 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9649, i32 0, i32 9
%.tmp9651 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9650
%.tmp9652 = icmp ne %m996$.Node.type* %.tmp9651, null
br i1 %.tmp9652, label %.if.true.9653, label %.if.false.9653
.if.true.9653:
%.tmp9654 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9627
%.tmp9655 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9654, i32 0, i32 9
%.tmp9656 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9655
store %m996$.Node.type* %.tmp9656, %m996$.Node.type** %param_ptr.9627
br label %.if.end.9653
.if.false.9653:
br label %.if.end.9653
.if.end.9653:
%.tmp9657 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9627
%.tmp9658 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9657, i32 0, i32 9
%.tmp9659 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9658
%.tmp9660 = icmp ne %m996$.Node.type* %.tmp9659, null
br i1 %.tmp9660, label %.if.true.9661, label %.if.false.9661
.if.true.9661:
%.tmp9662 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9627
%.tmp9663 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9662, i32 0, i32 9
%.tmp9664 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9663
store %m996$.Node.type* %.tmp9664, %m996$.Node.type** %param_ptr.9627
br label %.if.end.9661
.if.false.9661:
store %m996$.Node.type* null, %m996$.Node.type** %param_ptr.9627
br label %.if.end.9661
.if.end.9661:
br label %.if.end.9637
.if.false.9637:
%.tmp9665 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9666 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9627
%.tmp9667 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9666, i32 0, i32 8
%.tmp9668 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9667
%.tmp9669 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp9665, %m996$.Node.type* %.tmp9668)
%param_type.9670 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp9669, %m2859$.Type.type** %param_type.9670
%.tmp9671 = load %m2859$.Type.type*, %m2859$.Type.type** %last_type.9621
%.tmp9672 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9671, i32 0, i32 4
%.tmp9673 = load %m2859$.Type.type*, %m2859$.Type.type** %param_type.9670
store %m2859$.Type.type* %.tmp9673, %m2859$.Type.type** %.tmp9672
%.tmp9674 = load %m2859$.Type.type*, %m2859$.Type.type** %param_type.9670
store %m2859$.Type.type* %.tmp9674, %m2859$.Type.type** %last_type.9621
%.tmp9675 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9627
%.tmp9676 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9675, i32 0, i32 9
%.tmp9677 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9676
store %m996$.Node.type* %.tmp9677, %m996$.Node.type** %param_ptr.9627
%.tmp9678 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9627
%.tmp9679 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9678, i32 0, i32 9
%.tmp9680 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9679
%.tmp9681 = icmp ne %m996$.Node.type* %.tmp9680, null
br i1 %.tmp9681, label %.if.true.9682, label %.if.false.9682
.if.true.9682:
%.tmp9683 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9627
%.tmp9684 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9683, i32 0, i32 9
%.tmp9685 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9684
%.tmp9686 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9685, i32 0, i32 9
%.tmp9687 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9686
store %m996$.Node.type* %.tmp9687, %m996$.Node.type** %param_ptr.9627
br label %.if.end.9682
.if.false.9682:
store %m996$.Node.type* null, %m996$.Node.type** %param_ptr.9627
br label %.if.end.9682
.if.end.9682:
br label %.if.end.9637
.if.end.9637:
br label %.for.start.9625
.for.end.9625:
%.tmp9688 = load %m2859$.Type.type*, %m2859$.Type.type** %function_type.9606
ret %m2859$.Type.type* %.tmp9688
}
define %m996$.Node.type* @m311$syn_function_params.m996$.Node.typep.m996$.Node.typep(%m996$.Node.type* %.stmt.arg) {
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp9689 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9691 = getelementptr [10 x i8], [10 x i8]*@.str9690, i32 0, i32 0
%.tmp9692 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp9689, i8* %.tmp9691)
%params.9693 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9692, %m996$.Node.type** %params.9693
%.tmp9694 = load %m996$.Node.type*, %m996$.Node.type** %params.9693
%.tmp9695 = icmp eq %m996$.Node.type* %.tmp9694, null
br i1 %.tmp9695, label %.if.true.9696, label %.if.false.9696
.if.true.9696:
%.tmp9697 = bitcast ptr null to %m996$.Node.type*
ret %m996$.Node.type* %.tmp9697
br label %.if.end.9696
.if.false.9696:
br label %.if.end.9696
.if.end.9696:
%.tmp9698 = load %m996$.Node.type*, %m996$.Node.type** %params.9693
%.tmp9699 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9698, i32 0, i32 8
%.tmp9700 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9699
ret %m996$.Node.type* %.tmp9700
}
define %m2859$.Type.type* @m311$node_to_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.ctx.arg, %m2859$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp9701 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9702 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9701, i32 0, i32 0
%.tmp9703 = load i8*, i8** %.tmp9702
%.tmp9705 = getelementptr [11 x i8], [11 x i8]*@.str9704, i32 0, i32 0
%.tmp9706 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9703, i8* %.tmp9705)
%.tmp9707 = icmp eq i32 %.tmp9706, 0
br i1 %.tmp9707, label %.if.true.9708, label %.if.false.9708
.if.true.9708:
%.tmp9709 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9710 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9711 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9710, i32 0, i32 8
%.tmp9712 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9711
%.tmp9713 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp9709, %m996$.Node.type* %.tmp9712)
%t.9714 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp9713, %m2859$.Type.type** %t.9714
%.tmp9715 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9714
%.tmp9716 = icmp ne %m2859$.Type.type* %.tmp9715, null
%.tmp9717 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9718 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9717, i32 0, i32 9
%.tmp9719 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9718
%.tmp9720 = icmp ne %m996$.Node.type* %.tmp9719, null
%.tmp9721 = and i1 %.tmp9716, %.tmp9720
br i1 %.tmp9721, label %.if.true.9722, label %.if.false.9722
.if.true.9722:
%.tmp9723 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9724 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9723, i32 0, i32 9
%.tmp9725 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9724
%.tmp9726 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9725, i32 0, i32 0
%.tmp9727 = load i8*, i8** %.tmp9726
%.tmp9729 = getelementptr [13 x i8], [13 x i8]*@.str9728, i32 0, i32 0
%.tmp9730 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9727, i8* %.tmp9729)
%.tmp9731 = icmp eq i32 %.tmp9730, 0
br i1 %.tmp9731, label %.if.true.9732, label %.if.false.9732
.if.true.9732:
%.tmp9733 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
%fn_type.9734 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp9733, %m2859$.Type.type** %fn_type.9734
%.tmp9735 = load %m2859$.Type.type*, %m2859$.Type.type** %fn_type.9734
%.tmp9736 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9735, i32 0, i32 0
%.tmp9738 = getelementptr [9 x i8], [9 x i8]*@.str9737, i32 0, i32 0
store i8* %.tmp9738, i8** %.tmp9736
%.tmp9739 = load %m2859$.Type.type*, %m2859$.Type.type** %fn_type.9734
%.tmp9740 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9739, i32 0, i32 3
%.tmp9741 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9714
store %m2859$.Type.type* %.tmp9741, %m2859$.Type.type** %.tmp9740
%.tmp9742 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9743 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9742, i32 0, i32 9
%.tmp9744 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9743
%.tmp9745 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9744, i32 0, i32 8
%.tmp9746 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9745
%.tmp9747 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9746, i32 0, i32 9
%.tmp9748 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9747
%fst_operator.9749 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9748, %m996$.Node.type** %fst_operator.9749
%.tmp9750 = load %m996$.Node.type*, %m996$.Node.type** %fst_operator.9749
%.tmp9751 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9750, i32 0, i32 0
%.tmp9752 = load i8*, i8** %.tmp9751
%.tmp9754 = getelementptr [15 x i8], [15 x i8]*@.str9753, i32 0, i32 0
%.tmp9755 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9752, i8* %.tmp9754)
%.tmp9756 = icmp eq i32 %.tmp9755, 0
br i1 %.tmp9756, label %.if.true.9757, label %.if.false.9757
.if.true.9757:
%.tmp9758 = load %m2859$.Type.type*, %m2859$.Type.type** %fn_type.9734
%.tmp9759 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9758, i32 0, i32 3
%.tmp9760 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9759
%last_fn_value.9761 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp9760, %m2859$.Type.type** %last_fn_value.9761
%.tmp9763 = load %m996$.Node.type*, %m996$.Node.type** %fst_operator.9749
%.tmp9764 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9763, i32 0, i32 8
%.tmp9765 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9764
%t.9766 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9765, %m996$.Node.type** %t.9766
br label %.for.start.9762
.for.start.9762:
%.tmp9767 = load %m996$.Node.type*, %m996$.Node.type** %t.9766
%.tmp9768 = icmp ne %m996$.Node.type* %.tmp9767, null
br i1 %.tmp9768, label %.for.continue.9762, label %.for.end.9762
.for.continue.9762:
%.tmp9769 = load %m2859$.Type.type*, %m2859$.Type.type** %last_fn_value.9761
%.tmp9770 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9769, i32 0, i32 4
%.tmp9771 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9772 = load %m996$.Node.type*, %m996$.Node.type** %t.9766
%.tmp9773 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9772, i32 0, i32 8
%.tmp9774 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9773
%.tmp9775 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp9771, %m996$.Node.type* %.tmp9774)
store %m2859$.Type.type* %.tmp9775, %m2859$.Type.type** %.tmp9770
%.tmp9776 = load %m2859$.Type.type*, %m2859$.Type.type** %last_fn_value.9761
%.tmp9777 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9776, i32 0, i32 4
%.tmp9778 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9777
store %m2859$.Type.type* %.tmp9778, %m2859$.Type.type** %last_fn_value.9761
%.tmp9779 = load %m996$.Node.type*, %m996$.Node.type** %t.9766
%.tmp9780 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9779, i32 0, i32 9
%.tmp9781 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9780
%.tmp9782 = icmp ne %m996$.Node.type* %.tmp9781, null
br i1 %.tmp9782, label %.if.true.9783, label %.if.false.9783
.if.true.9783:
%.tmp9784 = load %m996$.Node.type*, %m996$.Node.type** %t.9766
%.tmp9785 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9784, i32 0, i32 9
%.tmp9786 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9785
store %m996$.Node.type* %.tmp9786, %m996$.Node.type** %t.9766
br label %.if.end.9783
.if.false.9783:
br label %.if.end.9783
.if.end.9783:
%.tmp9787 = load %m996$.Node.type*, %m996$.Node.type** %t.9766
%.tmp9788 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9787, i32 0, i32 9
%.tmp9789 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9788
store %m996$.Node.type* %.tmp9789, %m996$.Node.type** %t.9766
br label %.for.start.9762
.for.end.9762:
br label %.if.end.9757
.if.false.9757:
br label %.if.end.9757
.if.end.9757:
%.tmp9790 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
%t_ptr.9791 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp9790, %m2859$.Type.type** %t_ptr.9791
%.tmp9792 = load %m2859$.Type.type*, %m2859$.Type.type** %t_ptr.9791
%.tmp9793 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9792, i32 0, i32 0
%.tmp9795 = getelementptr [4 x i8], [4 x i8]*@.str9794, i32 0, i32 0
store i8* %.tmp9795, i8** %.tmp9793
%.tmp9796 = load %m2859$.Type.type*, %m2859$.Type.type** %t_ptr.9791
%.tmp9797 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9796, i32 0, i32 3
%.tmp9798 = load %m2859$.Type.type*, %m2859$.Type.type** %fn_type.9734
store %m2859$.Type.type* %.tmp9798, %m2859$.Type.type** %.tmp9797
%.tmp9799 = load %m2859$.Type.type*, %m2859$.Type.type** %t_ptr.9791
store %m2859$.Type.type* %.tmp9799, %m2859$.Type.type** %t.9714
br label %.if.end.9732
.if.false.9732:
br label %.if.end.9732
.if.end.9732:
br label %.if.end.9722
.if.false.9722:
br label %.if.end.9722
.if.end.9722:
%.tmp9800 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9714
ret %m2859$.Type.type* %.tmp9800
br label %.if.end.9708
.if.false.9708:
br label %.if.end.9708
.if.end.9708:
%.tmp9801 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
%t.9802 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp9801, %m2859$.Type.type** %t.9802
%.tmp9803 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9804 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9803, i32 0, i32 0
%.tmp9805 = load i8*, i8** %.tmp9804
%.tmp9807 = getelementptr [10 x i8], [10 x i8]*@.str9806, i32 0, i32 0
%.tmp9808 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9805, i8* %.tmp9807)
%.tmp9809 = icmp eq i32 %.tmp9808, 0
br i1 %.tmp9809, label %.if.true.9810, label %.if.false.9810
.if.true.9810:
%.tmp9811 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp9812 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9811, i32 0, i32 0
%.tmp9814 = getelementptr [7 x i8], [7 x i8]*@.str9813, i32 0, i32 0
store i8* %.tmp9814, i8** %.tmp9812
%.tmp9815 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp9816 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9815, i32 0, i32 1
store i8* null, i8** %.tmp9816
%.tmp9817 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9818 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9817, i32 0, i32 8
%.tmp9819 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9818
%.tmp9821 = getelementptr [5 x i8], [5 x i8]*@.str9820, i32 0, i32 0
%.tmp9822 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp9819, i8* %.tmp9821)
%curr_type.9823 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9822, %m996$.Node.type** %curr_type.9823
%.tmp9824 = load %m996$.Node.type*, %m996$.Node.type** %curr_type.9823
%.tmp9825 = icmp ne %m996$.Node.type* %.tmp9824, null
br i1 %.tmp9825, label %.if.true.9826, label %.if.false.9826
.if.true.9826:
%.tmp9827 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp9828 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9827, i32 0, i32 3
%.tmp9829 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9830 = load %m996$.Node.type*, %m996$.Node.type** %curr_type.9823
%.tmp9831 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9830, i32 0, i32 8
%.tmp9832 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9831
%.tmp9833 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp9829, %m996$.Node.type* %.tmp9832)
store %m2859$.Type.type* %.tmp9833, %m2859$.Type.type** %.tmp9828
%.tmp9834 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp9835 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9834, i32 0, i32 3
%.tmp9836 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9835
%.tmp9837 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9836, i32 0, i32 1
%.tmp9838 = load %m996$.Node.type*, %m996$.Node.type** %curr_type.9823
%.tmp9839 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9838, i32 0, i32 9
%.tmp9840 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9839
%.tmp9841 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9840, i32 0, i32 1
%.tmp9842 = load i8*, i8** %.tmp9841
store i8* %.tmp9842, i8** %.tmp9837
%.tmp9843 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp9844 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9843, i32 0, i32 3
%.tmp9845 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9844
%curr_t.9846 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp9845, %m2859$.Type.type** %curr_t.9846
%.tmp9848 = load %m996$.Node.type*, %m996$.Node.type** %curr_type.9823
%.tmp9849 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9848, i32 0, i32 9
%.tmp9850 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9849
%.tmp9852 = getelementptr [5 x i8], [5 x i8]*@.str9851, i32 0, i32 0
%.tmp9853 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp9850, i8* %.tmp9852)
store %m996$.Node.type* %.tmp9853, %m996$.Node.type** %curr_type.9823
br label %.for.start.9847
.for.start.9847:
%.tmp9854 = load %m996$.Node.type*, %m996$.Node.type** %curr_type.9823
%.tmp9855 = icmp ne %m996$.Node.type* %.tmp9854, null
br i1 %.tmp9855, label %.for.continue.9847, label %.for.end.9847
.for.continue.9847:
%.tmp9856 = load %m2859$.Type.type*, %m2859$.Type.type** %curr_t.9846
%.tmp9857 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9856, i32 0, i32 4
%.tmp9858 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9859 = load %m996$.Node.type*, %m996$.Node.type** %curr_type.9823
%.tmp9860 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9859, i32 0, i32 8
%.tmp9861 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9860
%.tmp9862 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp9858, %m996$.Node.type* %.tmp9861)
store %m2859$.Type.type* %.tmp9862, %m2859$.Type.type** %.tmp9857
%.tmp9863 = load %m2859$.Type.type*, %m2859$.Type.type** %curr_t.9846
%.tmp9864 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9863, i32 0, i32 4
%.tmp9865 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9864
%.tmp9866 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9865, i32 0, i32 1
%.tmp9867 = load %m996$.Node.type*, %m996$.Node.type** %curr_type.9823
%.tmp9868 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9867, i32 0, i32 9
%.tmp9869 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9868
%.tmp9870 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9869, i32 0, i32 1
%.tmp9871 = load i8*, i8** %.tmp9870
store i8* %.tmp9871, i8** %.tmp9866
%.tmp9872 = load %m2859$.Type.type*, %m2859$.Type.type** %curr_t.9846
%.tmp9873 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9872, i32 0, i32 4
%.tmp9874 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9873
store %m2859$.Type.type* %.tmp9874, %m2859$.Type.type** %curr_t.9846
%.tmp9875 = load %m996$.Node.type*, %m996$.Node.type** %curr_type.9823
%.tmp9876 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9875, i32 0, i32 9
%.tmp9877 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9876
%.tmp9879 = getelementptr [5 x i8], [5 x i8]*@.str9878, i32 0, i32 0
%.tmp9880 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp9877, i8* %.tmp9879)
store %m996$.Node.type* %.tmp9880, %m996$.Node.type** %curr_type.9823
br label %.for.start.9847
.for.end.9847:
br label %.if.end.9826
.if.false.9826:
br label %.if.end.9826
.if.end.9826:
br label %.if.end.9810
.if.false.9810:
%.tmp9881 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9882 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9881, i32 0, i32 0
%.tmp9883 = load i8*, i8** %.tmp9882
%.tmp9885 = getelementptr [12 x i8], [12 x i8]*@.str9884, i32 0, i32 0
%.tmp9886 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9883, i8* %.tmp9885)
%.tmp9887 = icmp eq i32 %.tmp9886, 0
br i1 %.tmp9887, label %.if.true.9888, label %.if.false.9888
.if.true.9888:
%.tmp9890 = getelementptr [1 x i8], [1 x i8]*@.str9889, i32 0, i32 0
%err_msg.9891 = alloca i8*
store i8* %.tmp9890, i8** %err_msg.9891
%.tmp9892 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9893 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9894 = call %m2859$.ScopeItem.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$find_defined.m2859$.ScopeItem.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp9892, %m996$.Node.type* %.tmp9893)
%base.9895 = alloca %m2859$.ScopeItem.type*
store %m2859$.ScopeItem.type* %.tmp9894, %m2859$.ScopeItem.type** %base.9895
%.tmp9896 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %base.9895
%.tmp9897 = icmp eq %m2859$.ScopeItem.type* %.tmp9896, null
br i1 %.tmp9897, label %.if.true.9898, label %.if.false.9898
.if.true.9898:
%.tmp9899 = getelementptr i8*, i8** %err_msg.9891, i32 0
%.tmp9901 = getelementptr [37 x i8], [37 x i8]*@.str9900, i32 0, i32 0
%.tmp9902 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9903 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9902, i32 0, i32 8
%.tmp9904 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9903
%.tmp9905 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9904, i32 0, i32 1
%.tmp9906 = load i8*, i8** %.tmp9905
%.tmp9907 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9899, i8* %.tmp9901, i8* %.tmp9906)
%.tmp9908 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp9909 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9910 = load i8*, i8** %err_msg.9891
call void(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp9908, %m996$.Node.type* %.tmp9909, i8* %.tmp9910)
%.tmp9911 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp9912 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9911, i32 0, i32 0
%.tmp9914 = getelementptr [6 x i8], [6 x i8]*@.str9913, i32 0, i32 0
store i8* %.tmp9914, i8** %.tmp9912
%.tmp9915 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
ret %m2859$.Type.type* %.tmp9915
br label %.if.end.9898
.if.false.9898:
br label %.if.end.9898
.if.end.9898:
%.tmp9916 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp9917 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9916, i32 0, i32 0
%.tmp9919 = getelementptr [10 x i8], [10 x i8]*@.str9918, i32 0, i32 0
store i8* %.tmp9919, i8** %.tmp9917
%.tmp9920 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp9921 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9920, i32 0, i32 1
%.tmp9922 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %base.9895
%.tmp9923 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp9922, i32 0, i32 0
%.tmp9924 = load i8*, i8** %.tmp9923
store i8* %.tmp9924, i8** %.tmp9921
%.tmp9925 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp9926 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9925, i32 0, i32 2
%.tmp9927 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %base.9895
%.tmp9928 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp9927, i32 0, i32 1
%.tmp9929 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %.tmp9928
%.tmp9930 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9929, i32 0, i32 0
%.tmp9931 = load i8*, i8** %.tmp9930
store i8* %.tmp9931, i8** %.tmp9926
%.tmp9932 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp9933 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9932, i32 0, i32 3
%.tmp9934 = load %m2859$.ScopeItem.type*, %m2859$.ScopeItem.type** %base.9895
%.tmp9935 = getelementptr %m2859$.ScopeItem.type, %m2859$.ScopeItem.type* %.tmp9934, i32 0, i32 1
%.tmp9936 = load %m2859$.AssignableInfo.type*, %m2859$.AssignableInfo.type** %.tmp9935
%.tmp9937 = getelementptr %m2859$.AssignableInfo.type, %m2859$.AssignableInfo.type* %.tmp9936, i32 0, i32 4
%.tmp9938 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9937
store %m2859$.Type.type* %.tmp9938, %m2859$.Type.type** %.tmp9933
br label %.if.end.9888
.if.false.9888:
%.tmp9939 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9940 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9939, i32 0, i32 0
%.tmp9941 = load i8*, i8** %.tmp9940
%.tmp9943 = getelementptr [5 x i8], [5 x i8]*@.str9942, i32 0, i32 0
%.tmp9944 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9941, i8* %.tmp9943)
%.tmp9945 = icmp eq i32 %.tmp9944, 0
br i1 %.tmp9945, label %.if.true.9946, label %.if.false.9946
.if.true.9946:
%.tmp9947 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp9948 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9947, i32 0, i32 0
%.tmp9950 = getelementptr [5 x i8], [5 x i8]*@.str9949, i32 0, i32 0
store i8* %.tmp9950, i8** %.tmp9948
%.tmp9951 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp9952 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9951, i32 0, i32 3
%.tmp9953 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp9953, %m2859$.Type.type** %.tmp9952
%.tmp9954 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp9955 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9954, i32 0, i32 3
%.tmp9956 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9955
%.tmp9957 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9956, i32 0, i32 0
%.tmp9959 = getelementptr [4 x i8], [4 x i8]*@.str9958, i32 0, i32 0
store i8* %.tmp9959, i8** %.tmp9957
%.tmp9960 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
%enum_union.9961 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp9960, %m2859$.Type.type** %enum_union.9961
%.tmp9962 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp9963 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9962, i32 0, i32 3
%.tmp9964 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp9963
%.tmp9965 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9964, i32 0, i32 4
%.tmp9966 = load %m2859$.Type.type*, %m2859$.Type.type** %enum_union.9961
store %m2859$.Type.type* %.tmp9966, %m2859$.Type.type** %.tmp9965
%.tmp9967 = load %m2859$.Type.type*, %m2859$.Type.type** %enum_union.9961
%.tmp9968 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9967, i32 0, i32 0
%.tmp9970 = getelementptr [6 x i8], [6 x i8]*@.str9969, i32 0, i32 0
store i8* %.tmp9970, i8** %.tmp9968
%.tmp9971 = bitcast ptr null to %m2859$.Type.type*
%union_children.9972 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp9971, %m2859$.Type.type** %union_children.9972
%.tmp9974 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9975 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9974, i32 0, i32 8
%.tmp9976 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9975
%.tmp9978 = getelementptr [5 x i8], [5 x i8]*@.str9977, i32 0, i32 0
%.tmp9979 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m996$next_tag.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp9976, i8* %.tmp9978)
%field.9980 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9979, %m996$.Node.type** %field.9980
br label %.for.start.9973
.for.start.9973:
%.tmp9981 = load %m996$.Node.type*, %m996$.Node.type** %field.9980
%.tmp9982 = icmp ne %m996$.Node.type* %.tmp9981, null
br i1 %.tmp9982, label %.for.continue.9973, label %.for.end.9973
.for.continue.9973:
%.tmp9983 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
%content.9984 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp9983, %m2859$.Type.type** %content.9984
%.tmp9985 = load %m2859$.Type.type*, %m2859$.Type.type** %content.9984
%.tmp9986 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9985, i32 0, i32 0
%.tmp9988 = getelementptr [11 x i8], [11 x i8]*@.str9987, i32 0, i32 0
store i8* %.tmp9988, i8** %.tmp9986
%.tmp9989 = load %m2859$.Type.type*, %m2859$.Type.type** %content.9984
%.tmp9990 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9989, i32 0, i32 5
%.tmp9991 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
store %m2859$.Type.type* %.tmp9991, %m2859$.Type.type** %.tmp9990
%.tmp9992 = load %m2859$.Type.type*, %m2859$.Type.type** %content.9984
%.tmp9993 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp9992, i32 0, i32 1
%.tmp9994 = load %m996$.Node.type*, %m996$.Node.type** %field.9980
%.tmp9995 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9994, i32 0, i32 1
%.tmp9996 = load i8*, i8** %.tmp9995
store i8* %.tmp9996, i8** %.tmp9993
%.tmp9997 = bitcast ptr null to %m2859$.Type.type*
%union.9998 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp9997, %m2859$.Type.type** %union.9998
%.tmp9999 = load %m996$.Node.type*, %m996$.Node.type** %field.9980
%.tmp10000 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9999, i32 0, i32 9
%.tmp10001 = load %m996$.Node.type*, %m996$.Node.type** %.tmp10000
%.tmp10002 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10001, i32 0, i32 0
%.tmp10003 = load i8*, i8** %.tmp10002
%.tmp10005 = getelementptr [11 x i8], [11 x i8]*@.str10004, i32 0, i32 0
%.tmp10006 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp10003, i8* %.tmp10005)
%.tmp10007 = icmp eq i32 %.tmp10006, 0
br i1 %.tmp10007, label %.if.true.10008, label %.if.false.10008
.if.true.10008:
%.tmp10010 = load %m996$.Node.type*, %m996$.Node.type** %field.9980
%.tmp10011 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10010, i32 0, i32 9
%.tmp10012 = load %m996$.Node.type*, %m996$.Node.type** %.tmp10011
%.tmp10013 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10012, i32 0, i32 8
%.tmp10014 = load %m996$.Node.type*, %m996$.Node.type** %.tmp10013
%.tmp10016 = getelementptr [10 x i8], [10 x i8]*@.str10015, i32 0, i32 0
%.tmp10017 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m996$next_tag.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp10014, i8* %.tmp10016)
%f.10018 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp10017, %m996$.Node.type** %f.10018
br label %.for.start.10009
.for.start.10009:
%.tmp10019 = load %m996$.Node.type*, %m996$.Node.type** %f.10018
%.tmp10020 = icmp ne %m996$.Node.type* %.tmp10019, null
br i1 %.tmp10020, label %.for.continue.10009, label %.for.end.10009
.for.continue.10009:
%.tmp10021 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp10022 = load %m996$.Node.type*, %m996$.Node.type** %f.10018
%.tmp10023 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10022, i32 0, i32 8
%.tmp10024 = load %m996$.Node.type*, %m996$.Node.type** %.tmp10023
%.tmp10025 = call %m2859$.Type.type*(%m2859$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2859$.Type.typep.m2859$.CompilerCtx.typep.m996$.Node.typep(%m2859$.CompilerCtx.type* %.tmp10021, %m996$.Node.type* %.tmp10024)
%field_type.10026 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp10025, %m2859$.Type.type** %field_type.10026
%.tmp10027 = load %m996$.Node.type*, %m996$.Node.type** %f.10018
%.tmp10028 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10027, i32 0, i32 9
%.tmp10029 = load %m996$.Node.type*, %m996$.Node.type** %.tmp10028
%.tmp10030 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10029, i32 0, i32 1
%.tmp10031 = load i8*, i8** %.tmp10030
%field_name.10032 = alloca i8*
store i8* %.tmp10031, i8** %field_name.10032
%.tmp10033 = load %m2859$.Type.type*, %m2859$.Type.type** %union.9998
%.tmp10034 = icmp eq %m2859$.Type.type* %.tmp10033, null
br i1 %.tmp10034, label %.if.true.10035, label %.if.false.10035
.if.true.10035:
%.tmp10036 = load %m2859$.Type.type*, %m2859$.Type.type** %field_type.10026
store %m2859$.Type.type* %.tmp10036, %m2859$.Type.type** %union.9998
%.tmp10037 = load %m2859$.Type.type*, %m2859$.Type.type** %union.9998
%.tmp10038 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10037, i32 0, i32 1
%.tmp10039 = load i8*, i8** %field_name.10032
store i8* %.tmp10039, i8** %.tmp10038
%.tmp10040 = load %m2859$.Type.type*, %m2859$.Type.type** %content.9984
%.tmp10041 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10040, i32 0, i32 3
%.tmp10042 = load %m2859$.Type.type*, %m2859$.Type.type** %union.9998
store %m2859$.Type.type* %.tmp10042, %m2859$.Type.type** %.tmp10041
br label %.if.end.10035
.if.false.10035:
%.tmp10043 = load %m2859$.Type.type*, %m2859$.Type.type** %union.9998
%.tmp10044 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10043, i32 0, i32 4
%.tmp10045 = load %m2859$.Type.type*, %m2859$.Type.type** %field_type.10026
store %m2859$.Type.type* %.tmp10045, %m2859$.Type.type** %.tmp10044
%.tmp10046 = load %m2859$.Type.type*, %m2859$.Type.type** %union.9998
%.tmp10047 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10046, i32 0, i32 4
%.tmp10048 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp10047
%.tmp10049 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10048, i32 0, i32 1
%.tmp10050 = load i8*, i8** %field_name.10032
store i8* %.tmp10050, i8** %.tmp10049
%.tmp10051 = load %m2859$.Type.type*, %m2859$.Type.type** %union.9998
%.tmp10052 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10051, i32 0, i32 4
%.tmp10053 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp10052
store %m2859$.Type.type* %.tmp10053, %m2859$.Type.type** %union.9998
br label %.if.end.10035
.if.end.10035:
%.tmp10054 = load %m996$.Node.type*, %m996$.Node.type** %f.10018
%.tmp10056 = getelementptr [10 x i8], [10 x i8]*@.str10055, i32 0, i32 0
%.tmp10057 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m996$next_tag.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp10054, i8* %.tmp10056)
store %m996$.Node.type* %.tmp10057, %m996$.Node.type** %f.10018
br label %.for.start.10009
.for.end.10009:
br label %.if.end.10008
.if.false.10008:
br label %.if.end.10008
.if.end.10008:
%.tmp10058 = load %m2859$.Type.type*, %m2859$.Type.type** %union_children.9972
%.tmp10059 = icmp eq %m2859$.Type.type* %.tmp10058, null
br i1 %.tmp10059, label %.if.true.10060, label %.if.false.10060
.if.true.10060:
%.tmp10061 = load %m2859$.Type.type*, %m2859$.Type.type** %content.9984
store %m2859$.Type.type* %.tmp10061, %m2859$.Type.type** %union_children.9972
%.tmp10062 = load %m2859$.Type.type*, %m2859$.Type.type** %enum_union.9961
%.tmp10063 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10062, i32 0, i32 3
%.tmp10064 = load %m2859$.Type.type*, %m2859$.Type.type** %union_children.9972
store %m2859$.Type.type* %.tmp10064, %m2859$.Type.type** %.tmp10063
br label %.if.end.10060
.if.false.10060:
%.tmp10065 = load %m2859$.Type.type*, %m2859$.Type.type** %union_children.9972
%.tmp10066 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10065, i32 0, i32 4
%.tmp10067 = load %m2859$.Type.type*, %m2859$.Type.type** %content.9984
store %m2859$.Type.type* %.tmp10067, %m2859$.Type.type** %.tmp10066
%.tmp10068 = load %m2859$.Type.type*, %m2859$.Type.type** %union_children.9972
%.tmp10069 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10068, i32 0, i32 4
%.tmp10070 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp10069
store %m2859$.Type.type* %.tmp10070, %m2859$.Type.type** %union_children.9972
br label %.if.end.10060
.if.end.10060:
%.tmp10071 = load %m996$.Node.type*, %m996$.Node.type** %field.9980
%.tmp10073 = getelementptr [5 x i8], [5 x i8]*@.str10072, i32 0, i32 0
%.tmp10074 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m996$next_tag.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp10071, i8* %.tmp10073)
store %m996$.Node.type* %.tmp10074, %m996$.Node.type** %field.9980
br label %.for.start.9973
.for.end.9973:
br label %.if.end.9946
.if.false.9946:
%.tmp10075 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp10076 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10075, i32 0, i32 1
%.tmp10077 = load i8*, i8** %.tmp10076
%.tmp10079 = getelementptr [4 x i8], [4 x i8]*@.str10078, i32 0, i32 0
%.tmp10080 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp10077, i8* %.tmp10079)
%.tmp10081 = icmp eq i32 %.tmp10080, 0
br i1 %.tmp10081, label %.if.true.10082, label %.if.false.10082
.if.true.10082:
%.tmp10083 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp10084 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10083, i32 0, i32 0
%.tmp10086 = getelementptr [4 x i8], [4 x i8]*@.str10085, i32 0, i32 0
store i8* %.tmp10086, i8** %.tmp10084
%.tmp10087 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp10088 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10087, i32 0, i32 3
%.tmp10089 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
store %m2859$.Type.type* %.tmp10089, %m2859$.Type.type** %.tmp10088
%.tmp10090 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp10091 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10090, i32 0, i32 3
%.tmp10092 = load %m2859$.Type.type*, %m2859$.Type.type** %.tmp10091
%.tmp10093 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10092, i32 0, i32 0
%.tmp10095 = getelementptr [4 x i8], [4 x i8]*@.str10094, i32 0, i32 0
store i8* %.tmp10095, i8** %.tmp10093
br label %.if.end.10082
.if.false.10082:
%.tmp10096 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp10097 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10096, i32 0, i32 0
%.tmp10098 = load i8*, i8** %.tmp10097
%.tmp10100 = getelementptr [5 x i8], [5 x i8]*@.str10099, i32 0, i32 0
%.tmp10101 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp10098, i8* %.tmp10100)
%.tmp10102 = icmp eq i32 %.tmp10101, 0
br i1 %.tmp10102, label %.if.true.10103, label %.if.false.10103
.if.true.10103:
%.tmp10104 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp10105 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10104, i32 0, i32 0
%.tmp10106 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp10107 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10106, i32 0, i32 1
%.tmp10108 = load i8*, i8** %.tmp10107
store i8* %.tmp10108, i8** %.tmp10105
br label %.if.end.10103
.if.false.10103:
%.tmp10109 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp10110 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10109, i32 0, i32 1
%.tmp10111 = load i8*, i8** %.tmp10110
%.tmp10113 = getelementptr [4 x i8], [4 x i8]*@.str10112, i32 0, i32 0
%.tmp10114 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp10111, i8* %.tmp10113)
%.tmp10115 = icmp eq i32 %.tmp10114, 0
br i1 %.tmp10115, label %.if.true.10116, label %.if.false.10116
.if.true.10116:
%.tmp10117 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
%.tmp10118 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10117, i32 0, i32 0
%.tmp10120 = getelementptr [7 x i8], [7 x i8]*@.str10119, i32 0, i32 0
store i8* %.tmp10120, i8** %.tmp10118
br label %.if.end.10116
.if.false.10116:
%.tmp10121 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp10122 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp10124 = getelementptr [54 x i8], [54 x i8]*@.str10123, i32 0, i32 0
%.tmp10125 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp10121, %m996$.Node.type* %.tmp10122, i8* %.tmp10124)
%.tmp10126 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp10127 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10126, i32 0, i32 0
%.tmp10128 = load i8*, i8** %.tmp10127
%.tmp10129 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp10130 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10129, i32 0, i32 1
%.tmp10131 = load i8*, i8** %.tmp10130
%.tmp10132 = call i32(i8*,...) @printf(i8* %.tmp10125, i8* %.tmp10128, i8* %.tmp10131)
%.tmp10133 = bitcast ptr null to %m2859$.Type.type*
ret %m2859$.Type.type* %.tmp10133
br label %.if.end.10116
.if.end.10116:
br label %.if.end.10103
.if.end.10103:
br label %.if.end.10082
.if.end.10082:
br label %.if.end.9946
.if.end.9946:
br label %.if.end.9888
.if.end.9888:
br label %.if.end.9810
.if.end.9810:
%.tmp10135 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp10136 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10135, i32 0, i32 9
%.tmp10137 = load %m996$.Node.type*, %m996$.Node.type** %.tmp10136
%ptr.10138 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp10137, %m996$.Node.type** %ptr.10138
br label %.for.start.10134
.for.start.10134:
%.tmp10139 = load %m996$.Node.type*, %m996$.Node.type** %ptr.10138
%.tmp10140 = icmp ne %m996$.Node.type* %.tmp10139, null
br i1 %.tmp10140, label %.for.continue.10134, label %.for.end.10134
.for.continue.10134:
%.tmp10141 = load %m996$.Node.type*, %m996$.Node.type** %ptr.10138
%.tmp10142 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10141, i32 0, i32 1
%.tmp10143 = load i8*, i8** %.tmp10142
%.tmp10145 = getelementptr [2 x i8], [2 x i8]*@.str10144, i32 0, i32 0
%.tmp10146 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp10143, i8* %.tmp10145)
%.tmp10147 = icmp eq i32 %.tmp10146, 0
br i1 %.tmp10147, label %.if.true.10148, label %.if.false.10148
.if.true.10148:
%.tmp10149 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
%pt.10150 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp10149, %m2859$.Type.type** %pt.10150
%.tmp10151 = load %m2859$.Type.type*, %m2859$.Type.type** %pt.10150
%.tmp10152 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10151, i32 0, i32 0
%.tmp10154 = getelementptr [4 x i8], [4 x i8]*@.str10153, i32 0, i32 0
store i8* %.tmp10154, i8** %.tmp10152
%.tmp10155 = load %m2859$.Type.type*, %m2859$.Type.type** %pt.10150
%.tmp10156 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10155, i32 0, i32 3
%.tmp10157 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
store %m2859$.Type.type* %.tmp10157, %m2859$.Type.type** %.tmp10156
%.tmp10158 = load %m2859$.Type.type*, %m2859$.Type.type** %pt.10150
store %m2859$.Type.type* %.tmp10158, %m2859$.Type.type** %t.9802
br label %.if.end.10148
.if.false.10148:
%.tmp10159 = load %m996$.Node.type*, %m996$.Node.type** %ptr.10138
%.tmp10160 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10159, i32 0, i32 1
%.tmp10161 = load i8*, i8** %.tmp10160
%.tmp10163 = getelementptr [2 x i8], [2 x i8]*@.str10162, i32 0, i32 0
%.tmp10164 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp10161, i8* %.tmp10163)
%.tmp10165 = icmp eq i32 %.tmp10164, 0
br i1 %.tmp10165, label %.if.true.10166, label %.if.false.10166
.if.true.10166:
%.tmp10167 = load %m996$.Node.type*, %m996$.Node.type** %ptr.10138
%.tmp10168 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10167, i32 0, i32 9
%.tmp10169 = load %m996$.Node.type*, %m996$.Node.type** %.tmp10168
%.tmp10170 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10169, i32 0, i32 1
%.tmp10171 = load i8*, i8** %.tmp10170
%.tmp10173 = getelementptr [2 x i8], [2 x i8]*@.str10172, i32 0, i32 0
%.tmp10174 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp10171, i8* %.tmp10173)
%.tmp10175 = icmp eq i32 %.tmp10174, 0
br i1 %.tmp10175, label %.if.true.10176, label %.if.false.10176
.if.true.10176:
%.tmp10177 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
%slice_type.10178 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp10177, %m2859$.Type.type** %slice_type.10178
%.tmp10179 = load %m2859$.Type.type*, %m2859$.Type.type** %slice_type.10178
%.tmp10180 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10179, i32 0, i32 0
%.tmp10182 = getelementptr [7 x i8], [7 x i8]*@.str10181, i32 0, i32 0
store i8* %.tmp10182, i8** %.tmp10180
%.tmp10183 = load %m2859$.Type.type*, %m2859$.Type.type** %slice_type.10178
%.tmp10184 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10183, i32 0, i32 1
%.tmp10186 = getelementptr [6 x i8], [6 x i8]*@.str10185, i32 0, i32 0
store i8* %.tmp10186, i8** %.tmp10184
%.tmp10187 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
%slice_c_array.10188 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp10187, %m2859$.Type.type** %slice_c_array.10188
%.tmp10189 = load %m2859$.Type.type*, %m2859$.Type.type** %slice_c_array.10188
%.tmp10190 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10189, i32 0, i32 0
%.tmp10192 = getelementptr [4 x i8], [4 x i8]*@.str10191, i32 0, i32 0
store i8* %.tmp10192, i8** %.tmp10190
%.tmp10193 = load %m2859$.Type.type*, %m2859$.Type.type** %slice_c_array.10188
%.tmp10194 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10193, i32 0, i32 1
%.tmp10196 = getelementptr [6 x i8], [6 x i8]*@.str10195, i32 0, i32 0
store i8* %.tmp10196, i8** %.tmp10194
%.tmp10197 = load %m2859$.Type.type*, %m2859$.Type.type** %slice_c_array.10188
%.tmp10198 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10197, i32 0, i32 3
%.tmp10199 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
store %m2859$.Type.type* %.tmp10199, %m2859$.Type.type** %.tmp10198
%.tmp10200 = load %m2859$.Type.type*, %m2859$.Type.type** %slice_type.10178
%.tmp10201 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10200, i32 0, i32 3
%.tmp10202 = load %m2859$.Type.type*, %m2859$.Type.type** %slice_c_array.10188
store %m2859$.Type.type* %.tmp10202, %m2859$.Type.type** %.tmp10201
%.tmp10203 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
%slice_len.10204 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp10203, %m2859$.Type.type** %slice_len.10204
%.tmp10205 = load %m2859$.Type.type*, %m2859$.Type.type** %slice_len.10204
%.tmp10206 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10205, i32 0, i32 0
%.tmp10208 = getelementptr [4 x i8], [4 x i8]*@.str10207, i32 0, i32 0
store i8* %.tmp10208, i8** %.tmp10206
%.tmp10209 = load %m2859$.Type.type*, %m2859$.Type.type** %slice_len.10204
%.tmp10210 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10209, i32 0, i32 1
%.tmp10212 = getelementptr [4 x i8], [4 x i8]*@.str10211, i32 0, i32 0
store i8* %.tmp10212, i8** %.tmp10210
%.tmp10213 = load %m2859$.Type.type*, %m2859$.Type.type** %slice_c_array.10188
%.tmp10214 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10213, i32 0, i32 4
%.tmp10215 = load %m2859$.Type.type*, %m2859$.Type.type** %slice_len.10204
store %m2859$.Type.type* %.tmp10215, %m2859$.Type.type** %.tmp10214
%.tmp10216 = call %m2859$.Type.type*() @m311$new_type.m2859$.Type.typep()
%slice_cap.10217 = alloca %m2859$.Type.type*
store %m2859$.Type.type* %.tmp10216, %m2859$.Type.type** %slice_cap.10217
%.tmp10218 = load %m2859$.Type.type*, %m2859$.Type.type** %slice_cap.10217
%.tmp10219 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10218, i32 0, i32 0
%.tmp10221 = getelementptr [4 x i8], [4 x i8]*@.str10220, i32 0, i32 0
store i8* %.tmp10221, i8** %.tmp10219
%.tmp10222 = load %m2859$.Type.type*, %m2859$.Type.type** %slice_cap.10217
%.tmp10223 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10222, i32 0, i32 1
%.tmp10225 = getelementptr [4 x i8], [4 x i8]*@.str10224, i32 0, i32 0
store i8* %.tmp10225, i8** %.tmp10223
%.tmp10226 = load %m2859$.Type.type*, %m2859$.Type.type** %slice_len.10204
%.tmp10227 = getelementptr %m2859$.Type.type, %m2859$.Type.type* %.tmp10226, i32 0, i32 4
%.tmp10228 = load %m2859$.Type.type*, %m2859$.Type.type** %slice_cap.10217
store %m2859$.Type.type* %.tmp10228, %m2859$.Type.type** %.tmp10227
%.tmp10229 = load %m2859$.Type.type*, %m2859$.Type.type** %slice_type.10178
store %m2859$.Type.type* %.tmp10229, %m2859$.Type.type** %t.9802
%.tmp10230 = load %m996$.Node.type*, %m996$.Node.type** %ptr.10138
%.tmp10231 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10230, i32 0, i32 9
%.tmp10232 = load %m996$.Node.type*, %m996$.Node.type** %.tmp10231
store %m996$.Node.type* %.tmp10232, %m996$.Node.type** %ptr.10138
br label %.if.end.10176
.if.false.10176:
br label %.if.end.10176
.if.end.10176:
br label %.if.end.10166
.if.false.10166:
%.tmp10233 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %ctx
%.tmp10234 = load %m996$.Node.type*, %m996$.Node.type** %ptr.10138
%.tmp10236 = getelementptr [49 x i8], [49 x i8]*@.str10235, i32 0, i32 0
%.tmp10237 = call i8*(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp10233, %m996$.Node.type* %.tmp10234, i8* %.tmp10236)
%.tmp10238 = load %m996$.Node.type*, %m996$.Node.type** %ptr.10138
%.tmp10239 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10238, i32 0, i32 1
%.tmp10240 = load i8*, i8** %.tmp10239
%.tmp10241 = call i32(i8*,...) @printf(i8* %.tmp10237, i8* %.tmp10240)
%.tmp10242 = bitcast ptr null to %m2859$.Type.type*
ret %m2859$.Type.type* %.tmp10242
br label %.if.end.10166
.if.end.10166:
br label %.if.end.10148
.if.end.10148:
%.tmp10243 = load %m996$.Node.type*, %m996$.Node.type** %ptr.10138
%.tmp10244 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp10243, i32 0, i32 9
%.tmp10245 = load %m996$.Node.type*, %m996$.Node.type** %.tmp10244
store %m996$.Node.type* %.tmp10245, %m996$.Node.type** %ptr.10138
br label %.for.start.10134
.for.end.10134:
%.tmp10246 = load %m2859$.Type.type*, %m2859$.Type.type** %t.9802
ret %m2859$.Type.type* %.tmp10246
}
define i1 @compile_file.b.cp.cp(i8* %.filename.arg, i8* %.outname.arg) {
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%outname = alloca i8*
store i8* %.outname.arg, i8** %outname
%.tmp10247 = load i32, i32* @STDERR
%.tmp10249 = getelementptr [2 x i8], [2 x i8]*@.str10248, i32 0, i32 0
%.tmp10250 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp10247, i8* %.tmp10249)
%stderr.10251 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp10250, %m0$.File.type** %stderr.10251
%.tmp10252 = call %m0$.File.type*() @tmpfile()
%llvm_code.10253 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp10252, %m0$.File.type** %llvm_code.10253
%.tmp10254 = load %m0$.File.type*, %m0$.File.type** %llvm_code.10253
%.tmp10255 = load i8*, i8** %filename
%.tmp10256 = call %m2859$.CompilerCtx.type*(%m0$.File.type*,i8*) @m311$new_context.m2859$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp10254, i8* %.tmp10255)
%compiler_ctx.10257 = alloca %m2859$.CompilerCtx.type*
store %m2859$.CompilerCtx.type* %.tmp10256, %m2859$.CompilerCtx.type** %compiler_ctx.10257
%.tmp10258 = load %m2859$.CompilerCtx.type*, %m2859$.CompilerCtx.type** %compiler_ctx.10257
%.tmp10259 = bitcast ptr null to %m996$.Node.type*
%.tmp10260 = load i8*, i8** %filename
%.tmp10261 = call i1(%m2859$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$compile_file.b.m2859$.CompilerCtx.typep.m996$.Node.typep.cp(%m2859$.CompilerCtx.type* %.tmp10258, %m996$.Node.type* %.tmp10259, i8* %.tmp10260)
br i1 %.tmp10261, label %.if.true.10262, label %.if.false.10262
.if.true.10262:
%.tmp10263 = load %m0$.File.type*, %m0$.File.type** %stderr.10251
%.tmp10265 = getelementptr [34 x i8], [34 x i8]*@.str10264, i32 0, i32 0
%.tmp10266 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp10263, i8* %.tmp10265)
ret i1 0
br label %.if.end.10262
.if.false.10262:
br label %.if.end.10262
.if.end.10262:
%.tmp10267 = load %m0$.File.type*, %m0$.File.type** %llvm_code.10253
%.tmp10268 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp10267)
%.tmp10269 = load %m0$.File.type*, %m0$.File.type** %llvm_code.10253
%.tmp10270 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp10269)
%llvm_code_size.10271 = alloca i32
store i32 %.tmp10270, i32* %llvm_code_size.10271
%.tmp10272 = load %m0$.File.type*, %m0$.File.type** %llvm_code.10253
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp10272)
%.tmp10274 = getelementptr [1 x i8], [1 x i8]*@.str10273, i32 0, i32 0
%cmd.10275 = alloca i8*
store i8* %.tmp10274, i8** %cmd.10275
%.tmp10276 = getelementptr i8*, i8** %cmd.10275, i32 0
%.tmp10278 = getelementptr [49 x i8], [49 x i8]*@.str10277, i32 0, i32 0
%.tmp10279 = load i8*, i8** %outname
%.tmp10280 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp10276, i8* %.tmp10278, i8* %.tmp10279)
%.tmp10281 = load i8*, i8** %cmd.10275
%.tmp10283 = getelementptr [2 x i8], [2 x i8]*@.str10282, i32 0, i32 0
%.tmp10284 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp10281, i8* %.tmp10283)
%proc.10285 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp10284, %m0$.File.type** %proc.10285
%.tmp10286 = load %m0$.File.type*, %m0$.File.type** %proc.10285
%.tmp10287 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp10286)
%.tmp10288 = load %m0$.File.type*, %m0$.File.type** %llvm_code.10253
%.tmp10289 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp10288)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp10287, i32 %.tmp10289)
%.tmp10290 = load %m0$.File.type*, %m0$.File.type** %proc.10285
%.tmp10291 = icmp eq %m0$.File.type* %.tmp10290, null
br i1 %.tmp10291, label %.if.true.10292, label %.if.false.10292
.if.true.10292:
%.tmp10293 = load %m0$.File.type*, %m0$.File.type** %stderr.10251
%.tmp10295 = getelementptr [28 x i8], [28 x i8]*@.str10294, i32 0, i32 0
%.tmp10296 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp10293, i8* %.tmp10295)
ret i1 0
br label %.if.end.10292
.if.false.10292:
br label %.if.end.10292
.if.end.10292:
%.tmp10297 = load %m0$.File.type*, %m0$.File.type** %proc.10285
%.tmp10298 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp10297)
%.tmp10299 = icmp ne i32 %.tmp10298, 0
br i1 %.tmp10299, label %.if.true.10300, label %.if.false.10300
.if.true.10300:
%.tmp10301 = load %m0$.File.type*, %m0$.File.type** %stderr.10251
%.tmp10303 = getelementptr [24 x i8], [24 x i8]*@.str10302, i32 0, i32 0
%.tmp10304 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp10301, i8* %.tmp10303)
ret i1 0
br label %.if.end.10300
.if.false.10300:
br label %.if.end.10300
.if.end.10300:
%.tmp10305 = getelementptr i8*, i8** %cmd.10275, i32 0
%.tmp10307 = getelementptr [17 x i8], [17 x i8]*@.str10306, i32 0, i32 0
%.tmp10308 = load i8*, i8** %outname
%.tmp10309 = load i8*, i8** %outname
%.tmp10310 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp10305, i8* %.tmp10307, i8* %.tmp10308, i8* %.tmp10309)
%.tmp10311 = load i8*, i8** %cmd.10275
%.tmp10313 = getelementptr [2 x i8], [2 x i8]*@.str10312, i32 0, i32 0
%.tmp10314 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp10311, i8* %.tmp10313)
%cc_proc.10315 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp10314, %m0$.File.type** %cc_proc.10315
%.tmp10316 = load %m0$.File.type*, %m0$.File.type** %cc_proc.10315
%.tmp10317 = icmp eq %m0$.File.type* %.tmp10316, null
br i1 %.tmp10317, label %.if.true.10318, label %.if.false.10318
.if.true.10318:
%.tmp10319 = load %m0$.File.type*, %m0$.File.type** %stderr.10251
%.tmp10321 = getelementptr [28 x i8], [28 x i8]*@.str10320, i32 0, i32 0
%.tmp10322 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp10319, i8* %.tmp10321)
ret i1 0
br label %.if.end.10318
.if.false.10318:
br label %.if.end.10318
.if.end.10318:
%.tmp10323 = load %m0$.File.type*, %m0$.File.type** %proc.10285
%.tmp10324 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp10323)
%.tmp10325 = icmp ne i32 %.tmp10324, 0
br i1 %.tmp10325, label %.if.true.10326, label %.if.false.10326
.if.true.10326:
%.tmp10327 = load %m0$.File.type*, %m0$.File.type** %stderr.10251
%.tmp10329 = getelementptr [22 x i8], [22 x i8]*@.str10328, i32 0, i32 0
%.tmp10330 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp10327, i8* %.tmp10329)
br label %.if.end.10326
.if.false.10326:
%.tmp10332 = getelementptr [32 x i8], [32 x i8]*@.str10331, i32 0, i32 0
%.tmp10333 = load i8*, i8** %outname
%.tmp10334 = call i32(i8*,...) @printf(i8* %.tmp10332, i8* %.tmp10333)
br label %.if.end.10326
.if.end.10326:
ret i1 1
}
%.Args.type = type {i8*,i8*,i8*,i8**}
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp10335 = load i32, i32* %argc
%.tmp10336 = load i8**, i8*** %argv
%.tmp10337 = call %.Args.type(i32,i8**) @check_args..Args.type.i.cpp(i32 %.tmp10335, i8** %.tmp10336)
%args.10338 = alloca %.Args.type
store %.Args.type %.tmp10337, %.Args.type* %args.10338
%.tmp10339 = getelementptr %.Args.type, %.Args.type* %args.10338, i32 0, i32 1
%.tmp10340 = load i8*, i8** %.tmp10339
%.tmp10341 = getelementptr %.Args.type, %.Args.type* %args.10338, i32 0, i32 2
%.tmp10342 = load i8*, i8** %.tmp10341
%.tmp10343 = call i1(i8*,i8*) @compile_file.b.cp.cp(i8* %.tmp10340, i8* %.tmp10342)
%.tmp10344 = icmp eq i1 %.tmp10343, 0
br i1 %.tmp10344, label %.if.true.10345, label %.if.false.10345
.if.true.10345:
ret i32 0
br label %.if.end.10345
.if.false.10345:
br label %.if.end.10345
.if.end.10345:
%.tmp10346 = getelementptr %.Args.type, %.Args.type* %args.10338, i32 0, i32 0
%.tmp10347 = load i8*, i8** %.tmp10346
%.tmp10349 = getelementptr [4 x i8], [4 x i8]*@.str10348, i32 0, i32 0
%.tmp10350 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp10347, i8* %.tmp10349)
%.tmp10351 = icmp eq i32 %.tmp10350, 0
br i1 %.tmp10351, label %.if.true.10352, label %.if.false.10352
.if.true.10352:
%.tmp10354 = getelementptr [1 x i8], [1 x i8]*@.str10353, i32 0, i32 0
%cmd.10355 = alloca i8*
store i8* %.tmp10354, i8** %cmd.10355
%.tmp10356 = getelementptr i8*, i8** %cmd.10355, i32 0
%.tmp10358 = getelementptr [5 x i8], [5 x i8]*@.str10357, i32 0, i32 0
%.tmp10359 = getelementptr %.Args.type, %.Args.type* %args.10338, i32 0, i32 2
%.tmp10360 = load i8*, i8** %.tmp10359
%.tmp10361 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp10356, i8* %.tmp10358, i8* %.tmp10360)
%.tmp10362 = load i8*, i8** %cmd.10355
%.tmp10363 = getelementptr %.Args.type, %.Args.type* %args.10338, i32 0, i32 3
%.tmp10364 = load i8**, i8*** %.tmp10363
%.tmp10365 = call i32(i8*,i8**) @execvp(i8* %.tmp10362, i8** %.tmp10364)
ret i32 %.tmp10365
br label %.if.end.10352
.if.false.10352:
br label %.if.end.10352
.if.end.10352:
ret i32 0
}
define %.Args.type @check_args..Args.type.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp10367 = getelementptr [22 x i8], [22 x i8]*@.str10366, i32 0, i32 0
%tmpl.10368 = alloca i8*
store i8* %.tmp10367, i8** %tmpl.10368
%args.10369 = alloca %.Args.type
%.tmp10370 = getelementptr %.Args.type, %.Args.type* %args.10369, i32 0, i32 0
store i8* null, i8** %.tmp10370
%.tmp10371 = getelementptr %.Args.type, %.Args.type* %args.10369, i32 0, i32 1
store i8* null, i8** %.tmp10371
%.tmp10372 = getelementptr %.Args.type, %.Args.type* %args.10369, i32 0, i32 2
store i8* null, i8** %.tmp10372
%.tmp10373 = getelementptr %.Args.type, %.Args.type* %args.10369, i32 0, i32 3
store i8** null, i8*** %.tmp10373
%.tmp10374 = load i32, i32* %argc
%.tmp10375 = icmp slt i32 %.tmp10374, 2
br i1 %.tmp10375, label %.if.true.10376, label %.if.false.10376
.if.true.10376:
%.tmp10377 = load i8*, i8** %tmpl.10368
%.tmp10378 = load i8**, i8*** %argv
%.tmp10379 = getelementptr i8*, i8** %.tmp10378, i32 0
%.tmp10380 = load i8*, i8** %.tmp10379
%.tmp10381 = call i32(i8*,...) @printf(i8* %.tmp10377, i8* %.tmp10380)
call void(i32) @exit(i32 1)
br label %.if.end.10376
.if.false.10376:
br label %.if.end.10376
.if.end.10376:
%fp.10382 = alloca i32
store i32 1, i32* %fp.10382
%.tmp10383 = getelementptr %.Args.type, %.Args.type* %args.10369, i32 0, i32 0
%.tmp10385 = getelementptr [8 x i8], [8 x i8]*@.str10384, i32 0, i32 0
store i8* %.tmp10385, i8** %.tmp10383
%.tmp10386 = load i8**, i8*** %argv
%.tmp10387 = getelementptr i8*, i8** %.tmp10386, i32 1
%.tmp10388 = load i8*, i8** %.tmp10387
%.tmp10390 = getelementptr [4 x i8], [4 x i8]*@.str10389, i32 0, i32 0
%.tmp10391 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp10388, i8* %.tmp10390)
%.tmp10392 = icmp eq i32 %.tmp10391, 0
br i1 %.tmp10392, label %.if.true.10393, label %.if.false.10393
.if.true.10393:
%.tmp10394 = getelementptr %.Args.type, %.Args.type* %args.10369, i32 0, i32 0
%.tmp10396 = getelementptr [4 x i8], [4 x i8]*@.str10395, i32 0, i32 0
store i8* %.tmp10396, i8** %.tmp10394
store i32 2, i32* %fp.10382
br label %.if.end.10393
.if.false.10393:
br label %.if.end.10393
.if.end.10393:
%.tmp10397 = load i32, i32* %argc
%.tmp10398 = load i32, i32* %fp.10382
%.tmp10399 = add i32 %.tmp10398, 1
%.tmp10400 = icmp slt i32 %.tmp10397, %.tmp10399
br i1 %.tmp10400, label %.if.true.10401, label %.if.false.10401
.if.true.10401:
%.tmp10402 = load i8*, i8** %tmpl.10368
%.tmp10403 = load i8**, i8*** %argv
%.tmp10404 = getelementptr i8*, i8** %.tmp10403, i32 0
%.tmp10405 = load i8*, i8** %.tmp10404
%.tmp10406 = call i32(i8*,...) @printf(i8* %.tmp10402, i8* %.tmp10405)
call void(i32) @exit(i32 1)
br label %.if.end.10401
.if.false.10401:
br label %.if.end.10401
.if.end.10401:
%.tmp10407 = getelementptr %.Args.type, %.Args.type* %args.10369, i32 0, i32 1
%.tmp10408 = load i32, i32* %fp.10382
%.tmp10409 = load i8**, i8*** %argv
%.tmp10410 = getelementptr i8*, i8** %.tmp10409, i32 %.tmp10408
%.tmp10411 = load i8*, i8** %.tmp10410
store i8* %.tmp10411, i8** %.tmp10407
%.tmp10412 = getelementptr %.Args.type, %.Args.type* %args.10369, i32 0, i32 1
%.tmp10413 = load i8*, i8** %.tmp10412
%.tmp10414 = call {i8*,i8*}(i8*) @m2$splitext.scpcp.cp(i8* %.tmp10413)
%ext.10415 = alloca {i8*,i8*}
store {i8*,i8*} %.tmp10414, {i8*,i8*}* %ext.10415
%.tmp10416 = getelementptr %.Args.type, %.Args.type* %args.10369, i32 0, i32 2
%.tmp10417 = getelementptr {i8*,i8*}, {i8*,i8*}* %ext.10415, i32 0, i32 0
%.tmp10418 = load i8*, i8** %.tmp10417
store i8* %.tmp10418, i8** %.tmp10416
%.tmp10419 = load i32, i32* %argc
%.tmp10420 = load i32, i32* %fp.10382
%.tmp10421 = sub i32 %.tmp10419, %.tmp10420
%.tmp10422 = add i32 %.tmp10421, 1
%ac.10423 = alloca i32
store i32 %.tmp10422, i32* %ac.10423
%.tmp10424 = getelementptr %.Args.type, %.Args.type* %args.10369, i32 0, i32 3
%.tmp10425 = load i32, i32* %ac.10423
%.tmp10426 = mul i32 8, %.tmp10425
%.tmp10427 = call i8*(i32) @malloc(i32 %.tmp10426)
%.tmp10428 = bitcast i8* %.tmp10427 to i8**
store i8** %.tmp10428, i8*** %.tmp10424
%.tmp10429 = getelementptr %.Args.type, %.Args.type* %args.10369, i32 0, i32 3
%.tmp10430 = load i8**, i8*** %.tmp10429
%.tmp10431 = getelementptr i8*, i8** %.tmp10430, i32 0
%.tmp10432 = getelementptr %.Args.type, %.Args.type* %args.10369, i32 0, i32 2
%.tmp10433 = load i8*, i8** %.tmp10432
store i8* %.tmp10433, i8** %.tmp10431
%i.10435 = alloca i32
store i32 0, i32* %i.10435
br label %.for.start.10434
.for.start.10434:
%.tmp10436 = load i32, i32* %i.10435
%.tmp10437 = load i32, i32* %argc
%.tmp10438 = load i32, i32* %fp.10382
%.tmp10439 = sub i32 %.tmp10437, %.tmp10438
%.tmp10440 = icmp slt i32 %.tmp10436, %.tmp10439
br i1 %.tmp10440, label %.for.continue.10434, label %.for.end.10434
.for.continue.10434:
%.tmp10441 = getelementptr %.Args.type, %.Args.type* %args.10369, i32 0, i32 3
%.tmp10442 = load i32, i32* %i.10435
%.tmp10443 = add i32 %.tmp10442, 1
%.tmp10444 = load i8**, i8*** %.tmp10441
%.tmp10445 = getelementptr i8*, i8** %.tmp10444, i32 %.tmp10443
%.tmp10446 = load i32, i32* %fp.10382
%.tmp10447 = load i32, i32* %i.10435
%.tmp10448 = add i32 %.tmp10446, %.tmp10447
%.tmp10449 = add i32 %.tmp10448, 1
%.tmp10450 = load i8**, i8*** %argv
%.tmp10451 = getelementptr i8*, i8** %.tmp10450, i32 %.tmp10449
%.tmp10452 = load i8*, i8** %.tmp10451
store i8* %.tmp10452, i8** %.tmp10445
%.tmp10453 = load i32, i32* %i.10435
%.tmp10454 = add i32 %.tmp10453, 1
store i32 %.tmp10454, i32* %i.10435
br label %.for.start.10434
.for.end.10434:
%.tmp10455 = load %.Args.type, %.Args.type* %args.10369
ret %.Args.type %.tmp10455
}
@.str308 = constant [2 x i8] c"r\00"
@.str389 = constant [1 x i8] c"\00"
@.str505 = constant [16 x i8] c"digit too large\00"
@.str513 = constant [7 x i8] c"NUMBER\00"
@.str543 = constant [15 x i8] c"WORD too large\00"
@.str551 = constant [5 x i8] c"WORD\00"
@.str572 = constant [7 x i8] c"STRING\00"
@.str593 = constant [15 x i8] c"char too large\00"
@.str614 = constant [4 x i8] c"CHR\00"
@.str622 = constant [3 x i8] c"NL\00"
@.str624 = constant [2 x i8] c"\0A\00"
@.str638 = constant [9 x i8] c"OPERATOR\00"
@.str640 = constant [2 x i8] c"-\00"
@.str667 = constant [8 x i8] c"COMMENT\00"
@.str676 = constant [47 x i8] c"%d:%d error: found non ascii token: '%c' (%d)\0A\00"
@.str691 = constant [9 x i8] c"OPERATOR\00"
@.str701 = constant [3 x i8] c"==\00"
@.str713 = constant [3 x i8] c"!=\00"
@.str725 = constant [3 x i8] c">=\00"
@.str737 = constant [3 x i8] c"<=\00"
@.str753 = constant [13 x i8] c"error on ..\0A\00"
@.str757 = constant [4 x i8] c"...\00"
@.str760 = constant [8 x i8] c"KEYWORD\00"
@.str775 = constant [4 x i8] c"EOF\00"
@.str777 = constant [1 x i8] c"\00"
@.str805 = constant [61 x i8] c"lexer: reached end of file while scanning for 'STRING' token\00"
@.str870 = constant [2 x i8] c"r\00"
@.str877 = constant [1 x i8] c"\00"
@.str915 = constant [1 x i8] c"\00"
@.str926 = constant [9 x i8] c"%4d | %s\00"
@.str935 = constant [1 x i8] c"\00"
@.str944 = constant [5 x i8] c"%s%s\00"
@.str956 = constant [5 x i8] c"\0A%s\0A\00"
@.str961 = constant [1 x i8] c"\00"
@.str968 = constant [24 x i8] c"[%s %d:%d] error: %s\0A%s\00"
@.str985 = constant [3 x i8] c"%s\00"
@.str991 = constant [3 x i8] c"%s\00"
@.str1027 = constant [1 x i8] c"\00"
@.str1031 = constant [1 x i8] c"\00"
@.str1045 = constant [1 x i8] c"\00"
@.str1053 = constant [1 x i8] c"\00"
@.str1093 = constant [2 x i8] c")\00"
@.str1104 = constant [2 x i8] c"]\00"
@.str1114 = constant [1 x i8] c"\00"
@.str1126 = constant [5 x i8] c"WORD\00"
@.str1135 = constant [2 x i8] c"=\00"
@.str1155 = constant [1 x i8] c"\00"
@.str1162 = constant [2 x i8] c"(\00"
@.str1184 = constant [2 x i8] c")\00"
@.str1192 = constant [19 x i8] c"Bracket not closed\00"
@.str1208 = constant [5 x i8] c"WORD\00"
@.str1217 = constant [7 x i8] c"STRING\00"
@.str1239 = constant [2 x i8] c"|\00"
@.str1265 = constant [2 x i8] c"+\00"
@.str1279 = constant [2 x i8] c"*\00"
@.str1293 = constant [2 x i8] c"?\00"
@.str1322 = constant [7 x i8] c"STRING\00"
@.str1347 = constant [50 x i8] c"Some characters are not allowed in this rule name\00"
@.str1363 = constant [5 x i8] c"WORD\00"
@.str1368 = constant [37 x i8] c"Identifier: {type: %s, value: '%s'}\0A\00"
@.str1382 = constant [31 x i8] c"rule identifier must be a WORD\00"
@.str1391 = constant [1 x i8] c"\00"
@.str1399 = constant [2 x i8] c"[\00"
@.str1430 = constant [2 x i8] c":\00"
@.str1441 = constant [1 x i8] c"\00"
@.str1445 = constant [35 x i8] c"expected : after rule name, got %s\00"
@.str1491 = constant [3 x i8] c"NL\00"
@.str1499 = constant [4 x i8] c"EOF\00"
@.str1505 = constant [58 x i8] c"[%d, %d]: rule must terminate with newline, got: '%s' %s\0A\00"
@.str1555 = constant [4 x i8] c"EOF\00"
@.str1564 = constant [3 x i8] c"NL\00"
@.str1601 = constant [1 x i8] c"\00"
@.str1834 = constant [1 x i8] c"\00"
@.str1874 = constant [22 x i8] c"Matcher type is null\0A\00"
@.str1887 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str1901 = constant [43 x i8] c"Unable to match token by value: %s != \22%s\22\00"
@.str1945 = constant [22 x i8] c"Matcher type is null\0A\00"
@.str1960 = constant [54 x i8] c"Unable to match token by type, expecing \22%s\22 got \22%s\22\00"
@.str2015 = constant [26 x i8] c"Unable to find alias rule\00"
@.str2043 = constant [33 x i8] c"CRITICAL: Parser not implemented\00"
@.str2128 = constant [1 x i8] c"\00"
@.str2132 = constant [29 x i8] c"Grammar rule '%s' not found.\00"
@.str2138 = constant [10 x i8] c"syntax.bn\00"
@.str2145 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str2165 = constant [4 x i8] c"EOF\00"
@.str2179 = constant [32 x i8] c"SyntaxError: parsing ended here\00"
@.str2315 = constant [2 x i8] c"\0A\00"
@.str2324 = constant [3 x i8] c"  \00"
@.str2333 = constant [7 x i8] c"(null)\00"
@.str2337 = constant [2 x i8] c"{\00"
@.str2343 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str2352 = constant [12 x i8] c"\22value\22: %s\00"
@.str2361 = constant [11 x i8] c"\22line\22: %d\00"
@.str2370 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str2379 = constant [9 x i8] c"\22next\22: \00"
@.str2391 = constant [13 x i8] c"\22children\22: \00"
@.str2404 = constant [2 x i8] c"}\00"
@.str2408 = constant [1998 x i8] c"
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

enum_field: \22(\22 elem_type=type WORD \22)\22

enum: \22enum\22 \22{\22 NL ( name=WORD (enum_field)? \22,\22 | NL )* \22}\22

basic_type: ( \22void\22 | \22int\22 | \22bool\22 | \22chr\22 | \22str\22 | enum | structdef | dotted_name | \22...\22 ) (\22[\22 \22]\22)* (\22*\22)*

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
@.str2411 = constant [1885 x i8] c"%%%1$s.tmp0 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 1
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
@.str2417 = constant [1 x i8] c"\00"
@.str2433 = constant [6 x i8] c"%s\5C22\00"
@.str2458 = constant [6 x i8] c"%s\5C0A\00"
@.str2472 = constant [6 x i8] c"%s\5C5C\00"
@.str2488 = constant [8 x i8] c"%s\5C%c%c\00"
@.str2506 = constant [5 x i8] c"%s%c\00"
@.str2515 = constant [5 x i8] c"%s%c\00"
@.str2526 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2563 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2568 = constant [3 x i8] c"%d\00"
@.str2576 = constant [6 x i8] c"'\5C%x'\00"
@.str2581 = constant [3 x i8] c"%d\00"
@.str2589 = constant [6 x i8] c"'\5C%c'\00"
@.str2596 = constant [3 x i8] c"10\00"
@.str2603 = constant [5 x i8] c"'%c'\00"
@.str2608 = constant [3 x i8] c"%d\00"
@.str2657 = constant [16 x i8] c"mono_assignable\00"
@.str2668 = constant [9 x i8] c"operator\00"
@.str2705 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2752 = constant [2 x i8] c"+\00"
@.str2759 = constant [2 x i8] c"-\00"
@.str2768 = constant [2 x i8] c"*\00"
@.str2775 = constant [2 x i8] c"/\00"
@.str2783 = constant [2 x i8] c"%\00"
@.str2792 = constant [3 x i8] c"==\00"
@.str2799 = constant [3 x i8] c"!=\00"
@.str2808 = constant [3 x i8] c">=\00"
@.str2815 = constant [3 x i8] c"<=\00"
@.str2824 = constant [2 x i8] c">\00"
@.str2831 = constant [2 x i8] c"<\00"
@.str2840 = constant [2 x i8] c"&\00"
@.str2848 = constant [2 x i8] c"|\00"
@.str2853 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
@.str2893 = constant [2 x i8] c"?\00"
@.str2899 = constant [54 x i8] c"called 'repr' with malformed type, container is null.\00"
@.str2905 = constant [4 x i8] c"int\00"
@.str2910 = constant [4 x i8] c"i32\00"
@.str2915 = constant [5 x i8] c"void\00"
@.str2920 = constant [5 x i8] c"void\00"
@.str2925 = constant [5 x i8] c"bool\00"
@.str2930 = constant [3 x i8] c"i1\00"
@.str2935 = constant [8 x i8] c"nullptr\00"
@.str2940 = constant [4 x i8] c"ptr\00"
@.str2945 = constant [4 x i8] c"chr\00"
@.str2950 = constant [3 x i8] c"i8\00"
@.str2955 = constant [9 x i8] c"function\00"
@.str2961 = constant [4 x i8] c"%s(\00"
@.str2987 = constant [4 x i8] c"%s,\00"
@.str2992 = constant [5 x i8] c"%s%s\00"
@.str3003 = constant [4 x i8] c"%s)\00"
@.str3011 = constant [4 x i8] c"ptr\00"
@.str3017 = constant [4 x i8] c"%s*\00"
@.str3029 = constant [7 x i8] c"struct\00"
@.str3035 = constant [2 x i8] c"{\00"
@.str3052 = constant [4 x i8] c"%s,\00"
@.str3057 = constant [5 x i8] c"%s%s\00"
@.str3068 = constant [4 x i8] c"%s}\00"
@.str3076 = constant [6 x i8] c"array\00"
@.str3082 = constant [10 x i8] c"[%s x %s]\00"
@.str3101 = constant [10 x i8] c"typealias\00"
@.str3107 = constant [5 x i8] c"%%%s\00"
@.str3117 = constant [7 x i8] c"vararg\00"
@.str3122 = constant [4 x i8] c"...\00"
@.str3127 = constant [5 x i8] c"enum\00"
@.str3132 = constant [1 x i8] c"\00"
@.str3144 = constant [10 x i8] c"{i32,i%d}\00"
@.str3152 = constant [11 x i8] c"enum_field\00"
@.str3165 = constant [6 x i8] c"error\00"
@.str3170 = constant [53 x i8] c":coffee-error: 'repr' not implemented for type '%s'\0A\00"
@.str3186 = constant [8 x i8] c"nullptr\00"
@.str3193 = constant [8 x i8] c"nullptr\00"
@.str3202 = constant [4 x i8] c"ptr\00"
@.str3209 = constant [4 x i8] c"ptr\00"
@.str3217 = constant [10 x i8] c"typealias\00"
@.str3231 = constant [10 x i8] c"typealias\00"
@.str3260 = constant [4 x i8] c"int\00"
@.str3268 = constant [6 x i8] c"union\00"
@.str3295 = constant [11 x i8] c"enum_field\00"
@.str3309 = constant [40 x i8] c"Type size not implemented for type: %s\0A\00"
@.str3352 = constant [12 x i8] c"COFFEE_ROOT\00"
@.str3359 = constant [5 x i8] c"HOME\00"
@.str3364 = constant [11 x i8] c"%s/.coffee\00"
@.str3454 = constant [1 x i8] c"\00"
@.str3498 = constant [1 x i8] c"\00"
@.str3502 = constant [5 x i8] c"%c%s\00"
@.str3512 = constant [1 x i8] c"\00"
@.str3516 = constant [7 x i8] c".tmp%d\00"
@.str3602 = constant [39 x i8] c"Grammar error unable to create context\00"
@.str3624 = constant [1 x i8] c"\00"
@.str3669 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str3685 = constant [1 x i8] c"\00"
@.str3689 = constant [26 x i8] c"Unable to open file: '%s'\00"
@.str3708 = constant [6 x i8] c"start\00"
@.str3794 = constant [6 x i8] c"start\00"
@.str3801 = constant [29 x i8] c"Expecting 'start' expression\00"
@.str3804 = constant [7 x i8] c"global\00"
@.str3816 = constant [13 x i8] c"head_comment\00"
@.str3860 = constant [1 x i8] c"\00"
@.str3884 = constant [7 x i8] c"string\00"
@.str3892 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3912 = constant [7 x i8] c"extern\00"
@.str3926 = constant [15 x i8] c"declare %s %s(\00"
@.str3962 = constant [3 x i8] c", \00"
@.str3968 = constant [3 x i8] c"%s\00"
@.str3980 = constant [3 x i8] c")\0A\00"
@.str3989 = constant [1 x i8] c"\00"
@.str3999 = constant [5 x i8] c"%s%s\00"
@.str4007 = constant [9 x i8] c"function\00"
@.str4013 = constant [5 x i8] c"main\00"
@.str4018 = constant [1 x i8] c"\00"
@.str4021 = constant [1 x i8] c"\00"
@.str4032 = constant [6 x i8] c"%s.%s\00"
@.str4048 = constant [1 x i8] c"\00"
@.str4051 = constant [1 x i8] c"\00"
@.str4057 = constant [3 x i8] c"NL\00"
@.str4065 = constant [7 x i8] c"global\00"
@.str4073 = constant [11 x i8] c"assignable\00"
@.str4104 = constant [9 x i8] c"variable\00"
@.str4116 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str4131 = constant [10 x i8] c"typealias\00"
@.str4153 = constant [11 x i8] c"%s.%s.type\00"
@.str4165 = constant [10 x i8] c"typealias\00"
@.str4187 = constant [5 x i8] c"type\00"
@.str4217 = constant [14 x i8] c"%s = type %s\0A\00"
@.str4230 = constant [7 x i8] c"extern\00"
@.str4248 = constant [7 x i8] c"extern\00"
@.str4289 = constant [7 x i8] c"extern\00"
@.str4301 = constant [9 x i8] c"function\00"
@.str4310 = constant [9 x i8] c"function\00"
@.str4349 = constant [14 x i8] c"define %s %s(\00"
@.str4378 = constant [3 x i8] c", \00"
@.str4384 = constant [5 x i8] c"type\00"
@.str4400 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str4415 = constant [5 x i8] c") {\0A\00"
@.str4419 = constant [9 x i8] c"function\00"
@.str4429 = constant [6 x i8] c"block\00"
@.str4444 = constant [3 x i8] c"}\0A\00"
@.str4450 = constant [7 x i8] c"import\00"
@.str4506 = constant [54 x i8] c"Unable to import '%s' no such file or directory. (%s)\00"
@.str4567 = constant [5 x i8] c"m%d$\00"
@.str4618 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str4625 = constant [1 x i8] c"\00"
@.str4629 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str4661 = constant [9 x i8] c"variable\00"
@.str4666 = constant [5 x i8] c"type\00"
@.str4698 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str4711 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str4723 = constant [6 x i8] c"block\00"
@.str4731 = constant [12 x i8] c"expressions\00"
@.str4762 = constant [7 x i8] c"struct\00"
@.str4767 = constant [7 x i8] c"WhAT!\0A\00"
@.str4807 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4819 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str4845 = constant [7 x i8] c"struct\00"
@.str4850 = constant [7 x i8] c"WhAT!\0A\00"
@.str4881 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4893 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4918 = constant [7 x i8] c"sizeof\00"
@.str4924 = constant [8 x i8] c"fn_args\00"
@.str4931 = constant [11 x i8] c"assignable\00"
@.str4959 = constant [4 x i8] c"int\00"
@.str4972 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4981 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4992 = constant [7 x i8] c"append\00"
@.str4998 = constant [8 x i8] c"fn_args\00"
@.str5005 = constant [11 x i8] c"assignable\00"
@.str5012 = constant [11 x i8] c"assignable\00"
@.str5034 = constant [1 x i8] c"\00"
@.str5038 = constant [5 x i8] c".b%d\00"
@.str5072 = constant [8 x i8] c"realloc\00"
@.str5081 = constant [9 x i8] c"function\00"
@.str5094 = constant [4 x i8] c"ptr\00"
@.str5111 = constant [4 x i8] c"chr\00"
@.str5128 = constant [4 x i8] c"ptr\00"
@.str5149 = constant [4 x i8] c"chr\00"
@.str5170 = constant [4 x i8] c"int\00"
@.str5173 = constant [8 x i8] c"realloc\00"
@.str5175 = constant [7 x i8] c"extern\00"
@.str5182 = constant [4 x i8] c"len\00"
@.str5188 = constant [8 x i8] c"fn_args\00"
@.str5195 = constant [11 x i8] c"assignable\00"
@.str5203 = constant [1 x i8] c"\00"
@.str5219 = constant [46 x i8] c"Imports %s must not start with '/' character.\00"
@.str5240 = constant [13 x i8] c"%s/lib/%s.bn\00"
@.str5246 = constant [1 x i8] c"\00"
@.str5252 = constant [6 x i8] c"%s.bn\00"
@.str5257 = constant [9 x i8] c"%s/%s.bn\00"
@.str5281 = constant [35 x i8] c"unable to compile function address\00"
@.str5287 = constant [8 x i8] c"fn_args\00"
@.str5296 = constant [11 x i8] c"enum_field\00"
@.str5301 = constant [10 x i8] c"Info: %s\0A\00"
@.str5336 = constant [1 x i8] c"\00"
@.str5340 = constant [39 x i8] c"Field named %s was not defined in enum\00"
@.str5352 = constant [1 x i8] c"\00"
@.str5355 = constant [1 x i8] c"\00"
@.str5380 = constant [21 x i8] c"(%s) Found type: %s\0A\00"
@.str5401 = constant [13 x i8] c"padding: %d\0A\00"
@.str5411 = constant [11 x i8] c"assignable\00"
@.str5425 = constant [6 x i8] c"%s,%s\00"
@.str5435 = constant [9 x i8] c"%s,%s %s\00"
@.str5450 = constant [11 x i8] c"assignable\00"
@.str5456 = constant [7 x i8] c"error\0A\00"
@.str5464 = constant [7 x i8] c"%s,i%d\00"
@.str5470 = constant [9 x i8] c"%s,i%d 0\00"
@.str5488 = constant [21 x i8] c"%s = alloca {i32%s}\0A\00"
@.str5497 = constant [34 x i8] c"store {i32%s} {i32 %d%s}, %s* %s\0A\00"
@.str5513 = constant [33 x i8] c"... = bitcast {i32%s}* %s to %s\0A\00"
@.str5519 = constant [24 x i8] c"... = load %s, %s* ...\0A\00"
@.str5523 = constant [1 x i8] c"\00"
@.str5526 = constant [1 x i8] c"\00"
@.str5534 = constant [4 x i8] c"ptr\00"
@.str5554 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str5578 = constant [11 x i8] c"assignable\00"
@.str5602 = constant [11 x i8] c"assignable\00"
@.str5614 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str5632 = constant [5 x i8] c"%s, \00"
@.str5657 = constant [7 x i8] c"vararg\00"
@.str5670 = constant [1 x i8] c"\00"
@.str5674 = constant [58 x i8] c"types.Type for argument %d does not match: '%s', got '%s'\00"
@.str5691 = constant [8 x i8] c"%s%s %s\00"
@.str5708 = constant [7 x i8] c"vararg\00"
@.str5719 = constant [11 x i8] c"assignable\00"
@.str5728 = constant [7 x i8] c"vararg\00"
@.str5734 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str5770 = constant [7 x i8] c"vararg\00"
@.str5781 = constant [42 x i8] c"Function '%s' takes %d arguments, 0 given\00"
@.str5799 = constant [5 x i8] c"void\00"
@.str5807 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str5839 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str5854 = constant [1 x i8] c"\00"
@.str5867 = constant [7 x i8] c"return\00"
@.str5873 = constant [9 x i8] c"function\00"
@.str5882 = constant [40 x i8] c"'return' used outside of function scope\00"
@.str5891 = constant [3 x i8] c"NL\00"
@.str5916 = constant [1 x i8] c"\00"
@.str5920 = constant [67 x i8] c"trying to return '%s' from function declared with return type '%s'\00"
@.str5939 = constant [11 x i8] c"ret %s %s\0A\00"
@.str5952 = constant [10 x i8] c"ret void\0A\00"
@.str5956 = constant [3 x i8] c"NL\00"
@.str5962 = constant [8 x i8] c"fn_call\00"
@.str5973 = constant [12 x i8] c"declaration\00"
@.str5982 = constant [11 x i8] c"assignment\00"
@.str5990 = constant [11 x i8] c"assignable\00"
@.str6018 = constant [1 x i8] c"\00"
@.str6022 = constant [37 x i8] c"cannot assign type '%s' to type '%s'\00"
@.str6051 = constant [4 x i8] c"ptr\00"
@.str6060 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6070 = constant [9 x i8] c"if_block\00"
@.str6078 = constant [9 x i8] c"for_loop\00"
@.str6086 = constant [8 x i8] c"keyword\00"
@.str6092 = constant [4 x i8] c"for\00"
@.str6099 = constant [1 x i8] c"\00"
@.str6103 = constant [42 x i8] c"'%s' keyword used outside 'for' statement\00"
@.str6119 = constant [6 x i8] c"break\00"
@.str6127 = constant [15 x i8] c"br label %%%s\0A\00"
@.str6138 = constant [9 x i8] c"continue\00"
@.str6146 = constant [15 x i8] c"br label %%%s\0A\00"
@.str6153 = constant [9 x i8] c"function\00"
@.str6162 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str6193 = constant [4 x i8] c"ptr\00"
@.str6202 = constant [4 x i8] c"chr\00"
@.str6213 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str6222 = constant [9 x i8] c"function\00"
@.str6235 = constant [5 x i8] c"void\00"
@.str6265 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str6267 = constant [7 x i8] c"extern\00"
@.str6275 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str6284 = constant [9 x i8] c"function\00"
@.str6299 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str6301 = constant [7 x i8] c"extern\00"
@.str6309 = constant [5 x i8] c"mmap\00"
@.str6318 = constant [9 x i8] c"function\00"
@.str6344 = constant [4 x i8] c"int\00"
@.str6356 = constant [4 x i8] c"int\00"
@.str6368 = constant [4 x i8] c"int\00"
@.str6380 = constant [4 x i8] c"int\00"
@.str6392 = constant [4 x i8] c"int\00"
@.str6398 = constant [5 x i8] c"mmap\00"
@.str6400 = constant [7 x i8] c"extern\00"
@.str6406 = constant [5 x i8] c"WORD\00"
@.str6429 = constant [9 x i8] c"function\00"
@.str6453 = constant [4 x i8] c"ptr\00"
@.str6462 = constant [7 x i8] c"struct\00"
@.str6476 = constant [1 x i8] c"\00"
@.str6480 = constant [5 x i8] c"@.%d\00"
@.str6494 = constant [101 x i8] c"%%.tmem%d = call i8*(i8*,i32,i32,i32,i32,i32) @mmap(i8* null, i32 72, i32 7, i32 34, i32 -1, i32 0)\0A\00"
@.str6501 = constant [100 x i8] c"call void(i8*,i8*,i8*) @llvm.init.trampoline(i8* %%.tmem%d, i8* bitcast (%s* %s to i8*), i8* null)\0A\00"
@.str6512 = constant [66 x i8] c"%%.trmp%d = call i8*(i8*) @llvm.adjust.trampoline(i8* %%.tmem%d)\0A\00"
@.str6520 = constant [35 x i8] c"%s = bitcast i8* %%.trmp%d to %s*\0A\00"
@.str6541 = constant [14 x i8] c"define %s %s(\00"
@.str6549 = constant [9 x i8] c"function\00"
@.str6557 = constant [13 x i8] c"%s nest %%.0\00"
@.str6584 = constant [3 x i8] c", \00"
@.str6590 = constant [5 x i8] c"type\00"
@.str6606 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str6621 = constant [5 x i8] c") {\0A\00"
@.str6629 = constant [6 x i8] c"block\00"
@.str6642 = constant [3 x i8] c"}\0A\00"
@.str6668 = constant [12 x i8] c"expressions\00"
@.str6684 = constant [3 x i8] c"NL\00"
@.str6701 = constant [7 x i8] c"return\00"
@.str6709 = constant [5 x i8] c"void\00"
@.str6720 = constant [21 x i8] c"Missing return value\00"
@.str6725 = constant [10 x i8] c"ret void\0A\00"
@.str6742 = constant [14 x i8] c".for.start.%d\00"
@.str6747 = constant [12 x i8] c".for.end.%d\00"
@.str6752 = constant [4 x i8] c"for\00"
@.str6760 = constant [12 x i8] c"declaration\00"
@.str6771 = constant [11 x i8] c"assignment\00"
@.str6781 = constant [9 x i8] c"OPERATOR\00"
@.str6788 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str6799 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str6806 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str6813 = constant [9 x i8] c"OPERATOR\00"
@.str6824 = constant [9 x i8] c"OPERATOR\00"
@.str6831 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str6843 = constant [9 x i8] c"OPERATOR\00"
@.str6848 = constant [6 x i8] c"block\00"
@.str6853 = constant [11 x i8] c"else_block\00"
@.str6863 = constant [13 x i8] c".for.else.%d\00"
@.str6870 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str6885 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str6904 = constant [15 x i8] c"br label %%%s\0A\00"
@.str6914 = constant [15 x i8] c".for.else.%d:\0A\00"
@.str6921 = constant [6 x i8] c"block\00"
@.str6930 = constant [15 x i8] c"br label %%%s\0A\00"
@.str6937 = constant [5 x i8] c"%s:\0A\00"
@.str6951 = constant [5 x i8] c"type\00"
@.str6966 = constant [11 x i8] c"assignable\00"
@.str6981 = constant [9 x i8] c"variable\00"
@.str6986 = constant [5 x i8] c"WORD\00"
@.str6995 = constant [31 x i8] c"unable to get declaration name\00"
@.str7013 = constant [1 x i8] c"\00"
@.str7017 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str7027 = constant [1 x i8] c"\00"
@.str7031 = constant [6 x i8] c"%s.%d\00"
@.str7081 = constant [1 x i8] c"\00"
@.str7085 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str7102 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str7114 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str7155 = constant [4 x i8] c"int\00"
@.str7162 = constant [4 x i8] c"chr\00"
@.str7170 = constant [5 x i8] c"bool\00"
@.str7179 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str7188 = constant [4 x i8] c"ptr\00"
@.str7196 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str7199 = constant [5 x i8] c"null\00"
@.str7207 = constant [7 x i8] c"struct\00"
@.str7228 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str7248 = constant [10 x i8] c"typealias\00"
@.str7271 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str7291 = constant [6 x i8] c"error\00"
@.str7298 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str7315 = constant [11 x i8] c"assignable\00"
@.str7332 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str7347 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str7354 = constant [6 x i8] c"block\00"
@.str7363 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str7370 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str7377 = constant [11 x i8] c"elif_block\00"
@.str7389 = constant [11 x i8] c"else_block\00"
@.str7399 = constant [6 x i8] c"block\00"
@.str7409 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str7416 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str7437 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str7446 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str7480 = constant [1 x i8] c"\00"
@.str7491 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str7511 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str7545 = constant [7 x i8] c"module\00"
@.str7598 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str7628 = constant [1 x i8] c"\00"
@.str7631 = constant [1 x i8] c"\00"
@.str7639 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str7647 = constant [9 x i8] c"function\00"
@.str7654 = constant [7 x i8] c"extern\00"
@.str7666 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str7687 = constant [9 x i8] c"variable\00"
@.str7709 = constant [4 x i8] c"ptr\00"
@.str7728 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str7752 = constant [10 x i8] c"typealias\00"
@.str7763 = constant [7 x i8] c"struct\00"
@.str7769 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str7821 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str7842 = constant [9 x i8] c"variable\00"
@.str7853 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str7874 = constant [9 x i8] c"variable\00"
@.str7883 = constant [10 x i8] c"typealias\00"
@.str7893 = constant [5 x i8] c"enum\00"
@.str7898 = constant [1 x i8] c"\00"
@.str7902 = constant [37 x i8] c"cannot get attribute %s from type %s\00"
@.str7949 = constant [1 x i8] c"\00"
@.str7953 = constant [34 x i8] c"Enum '%s' has no field named '%s'\00"
@.str7971 = constant [12 x i8] c"destination\00"
@.str7980 = constant [2 x i8] c"(\00"
@.str7999 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str8007 = constant [1 x i8] c"\00"
@.str8015 = constant [17 x i8] c"addr_destination\00"
@.str8022 = constant [16 x i8] c"mono_assignable\00"
@.str8030 = constant [11 x i8] c"assignable\00"
@.str8044 = constant [12 x i8] c"destination\00"
@.str8049 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str8077 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str8096 = constant [7 x i8] c"module\00"
@.str8118 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str8189 = constant [6 x i8] c"slice\00"
@.str8202 = constant [45 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 0\0A\00"
@.str8244 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str8265 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str8289 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str8312 = constant [16 x i8] c"mono_assignable\00"
@.str8338 = constant [5 x i8] c"cast\00"
@.str8348 = constant [5 x i8] c"type\00"
@.str8373 = constant [8 x i8] c"bitcast\00"
@.str8388 = constant [6 x i8] c"slice\00"
@.str8393 = constant [48 x i8] c"Casting array to slices is not implemented yet\0A\00"
@.str8401 = constant [4 x i8] c"ptr\00"
@.str8408 = constant [4 x i8] c"ptr\00"
@.str8427 = constant [4 x i8] c"i%d\00"
@.str8432 = constant [4 x i8] c"i%d\00"
@.str8440 = constant [5 x i8] c"sext\00"
@.str8442 = constant [6 x i8] c"trunc\00"
@.str8447 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str8467 = constant [16 x i8] c"mono_assignable\00"
@.str8529 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str8552 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str8559 = constant [2 x i8] c"+\00"
@.str8564 = constant [4 x i8] c"add\00"
@.str8569 = constant [2 x i8] c"-\00"
@.str8574 = constant [4 x i8] c"sub\00"
@.str8579 = constant [2 x i8] c"*\00"
@.str8584 = constant [4 x i8] c"mul\00"
@.str8589 = constant [2 x i8] c"/\00"
@.str8594 = constant [5 x i8] c"sdiv\00"
@.str8599 = constant [3 x i8] c"==\00"
@.str8604 = constant [8 x i8] c"icmp eq\00"
@.str8609 = constant [3 x i8] c"!=\00"
@.str8614 = constant [8 x i8] c"icmp ne\00"
@.str8619 = constant [2 x i8] c">\00"
@.str8624 = constant [9 x i8] c"icmp sgt\00"
@.str8629 = constant [2 x i8] c"<\00"
@.str8634 = constant [9 x i8] c"icmp slt\00"
@.str8639 = constant [2 x i8] c"&\00"
@.str8644 = constant [4 x i8] c"and\00"
@.str8649 = constant [2 x i8] c"|\00"
@.str8654 = constant [3 x i8] c"or\00"
@.str8659 = constant [3 x i8] c">=\00"
@.str8664 = constant [9 x i8] c"icmp sge\00"
@.str8669 = constant [3 x i8] c"<=\00"
@.str8674 = constant [9 x i8] c"icmp sle\00"
@.str8679 = constant [2 x i8] c"%\00"
@.str8684 = constant [5 x i8] c"srem\00"
@.str8688 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str8695 = constant [4 x i8] c"add\00"
@.str8702 = constant [3 x i8] c"==\00"
@.str8709 = constant [3 x i8] c"!=\00"
@.str8717 = constant [2 x i8] c"|\00"
@.str8725 = constant [2 x i8] c"&\00"
@.str8733 = constant [2 x i8] c">\00"
@.str8741 = constant [2 x i8] c"<\00"
@.str8749 = constant [3 x i8] c">=\00"
@.str8757 = constant [3 x i8] c"<=\00"
@.str8765 = constant [5 x i8] c"bool\00"
@.str8769 = constant [4 x i8] c"int\00"
@.str8776 = constant [1 x i8] c"\00"
@.str8779 = constant [1 x i8] c"\00"
@.str8787 = constant [7 x i8] c"NUMBER\00"
@.str8801 = constant [4 x i8] c"int\00"
@.str8815 = constant [5 x i8] c"WORD\00"
@.str8825 = constant [5 x i8] c"null\00"
@.str8832 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str8846 = constant [5 x i8] c"null\00"
@.str8855 = constant [8 x i8] c"nullptr\00"
@.str8862 = constant [17 x i8] c"addr_destination\00"
@.str8874 = constant [12 x i8] c"destination\00"
@.str8924 = constant [4 x i8] c"ptr\00"
@.str8943 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str8957 = constant [9 x i8] c"function\00"
@.str8972 = constant [4 x i8] c"ptr\00"
@.str8980 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str8994 = constant [8 x i8] c"boolean\00"
@.str9008 = constant [5 x i8] c"bool\00"
@.str9017 = constant [6 x i8] c"false\00"
@.str9024 = constant [2 x i8] c"0\00"
@.str9028 = constant [2 x i8] c"1\00"
@.str9035 = constant [8 x i8] c"fn_call\00"
@.str9052 = constant [7 x i8] c"STRING\00"
@.str9078 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str9094 = constant [4 x i8] c"ptr\00"
@.str9107 = constant [4 x i8] c"chr\00"
@.str9114 = constant [4 x i8] c"CHR\00"
@.str9130 = constant [2 x i8] c"0\00"
@.str9146 = constant [22 x i8] c"Invalid character: %s\00"
@.str9162 = constant [4 x i8] c"chr\00"
@.str9166 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str9194 = constant [22 x i8] c"called 'abbr' on null\00"
@.str9200 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str9205 = constant [4 x i8] c"int\00"
@.str9210 = constant [2 x i8] c"i\00"
@.str9215 = constant [5 x i8] c"bool\00"
@.str9220 = constant [2 x i8] c"b\00"
@.str9225 = constant [5 x i8] c"void\00"
@.str9230 = constant [2 x i8] c"v\00"
@.str9235 = constant [4 x i8] c"chr\00"
@.str9240 = constant [2 x i8] c"c\00"
@.str9245 = constant [4 x i8] c"ptr\00"
@.str9250 = constant [1 x i8] c"\00"
@.str9254 = constant [4 x i8] c"%sp\00"
@.str9265 = constant [10 x i8] c"typealias\00"
@.str9276 = constant [7 x i8] c"struct\00"
@.str9281 = constant [2 x i8] c"s\00"
@.str9292 = constant [5 x i8] c"%s%s\00"
@.str9305 = constant [9 x i8] c"function\00"
@.str9310 = constant [2 x i8] c"f\00"
@.str9315 = constant [6 x i8] c"error\00"
@.str9320 = constant [2 x i8] c"?\00"
@.str9322 = constant [45 x i8] c":coffee-error: unable to abbreviate type %s\0A\00"
@.str9332 = constant [1 x i8] c"\00"
@.str9336 = constant [7 x i8] c".str%d\00"
@.str9351 = constant [6 x i8] c"array\00"
@.str9364 = constant [4 x i8] c"chr\00"
@.str9385 = constant [3 x i8] c"%d\00"
@.str9392 = constant [7 x i8] c"string\00"
@.str9428 = constant [7 x i8] c"module\00"
@.str9479 = constant [4 x i8] c"%s\0A\00"
@.str9615 = constant [9 x i8] c"function\00"
@.str9633 = constant [5 x i8] c"WORD\00"
@.str9690 = constant [10 x i8] c"fn_params\00"
@.str9704 = constant [11 x i8] c"basic_type\00"
@.str9728 = constant [13 x i8] c"type_trailer\00"
@.str9737 = constant [9 x i8] c"function\00"
@.str9753 = constant [15 x i8] c"type_fn_params\00"
@.str9794 = constant [4 x i8] c"ptr\00"
@.str9806 = constant [10 x i8] c"structdef\00"
@.str9813 = constant [7 x i8] c"struct\00"
@.str9820 = constant [5 x i8] c"type\00"
@.str9851 = constant [5 x i8] c"type\00"
@.str9878 = constant [5 x i8] c"type\00"
@.str9884 = constant [12 x i8] c"dotted_name\00"
@.str9889 = constant [1 x i8] c"\00"
@.str9900 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str9913 = constant [6 x i8] c"error\00"
@.str9918 = constant [10 x i8] c"typealias\00"
@.str9942 = constant [5 x i8] c"enum\00"
@.str9949 = constant [5 x i8] c"enum\00"
@.str9958 = constant [4 x i8] c"int\00"
@.str9969 = constant [6 x i8] c"union\00"
@.str9977 = constant [5 x i8] c"name\00"
@.str9987 = constant [11 x i8] c"enum_field\00"
@.str10004 = constant [11 x i8] c"enum_field\00"
@.str10015 = constant [10 x i8] c"elem_type\00"
@.str10055 = constant [10 x i8] c"elem_type\00"
@.str10072 = constant [5 x i8] c"name\00"
@.str10078 = constant [4 x i8] c"str\00"
@.str10085 = constant [4 x i8] c"ptr\00"
@.str10094 = constant [4 x i8] c"chr\00"
@.str10099 = constant [5 x i8] c"WORD\00"
@.str10112 = constant [4 x i8] c"...\00"
@.str10119 = constant [7 x i8] c"vararg\00"
@.str10123 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str10144 = constant [2 x i8] c"*\00"
@.str10153 = constant [4 x i8] c"ptr\00"
@.str10162 = constant [2 x i8] c"[\00"
@.str10172 = constant [2 x i8] c"]\00"
@.str10181 = constant [7 x i8] c"struct\00"
@.str10185 = constant [6 x i8] c"slice\00"
@.str10191 = constant [4 x i8] c"ptr\00"
@.str10195 = constant [6 x i8] c"c_arr\00"
@.str10207 = constant [4 x i8] c"int\00"
@.str10211 = constant [4 x i8] c"len\00"
@.str10220 = constant [4 x i8] c"int\00"
@.str10224 = constant [4 x i8] c"cap\00"
@.str10235 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
@.str10248 = constant [2 x i8] c"w\00"
@.str10264 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str10273 = constant [1 x i8] c"\00"
@.str10277 = constant [49 x i8] c"tee debug.ll | llc -opaque-pointers - -o debug.s\00"
@.str10282 = constant [2 x i8] c"w\00"
@.str10294 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str10302 = constant [24 x i8] c"error on llc execution\0A\00"
@.str10306 = constant [17 x i8] c"cc debug.s -o %s\00"
@.str10312 = constant [2 x i8] c"w\00"
@.str10320 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str10328 = constant [22 x i8] c"error on cc execution\00"
@.str10331 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str10348 = constant [4 x i8] c"run\00"
@.str10353 = constant [1 x i8] c"\00"
@.str10357 = constant [5 x i8] c"./%s\00"
@.str10366 = constant [22 x i8] c"Usage: %s <filename>\0A\00"
@.str10384 = constant [8 x i8] c"compile\00"
@.str10389 = constant [4 x i8] c"run\00"
@.str10395 = constant [4 x i8] c"run\00"
