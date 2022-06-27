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
%.tmp1634 = load %m996$.Node.type*, %m996$.Node.type** %parent
%.tmp1635 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1634, i32 0, i32 8
%.tmp1636 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1635
%.tmp1637 = icmp eq %m996$.Node.type* %.tmp1636, null
br i1 %.tmp1637, label %.if.true.1638, label %.if.false.1638
.if.true.1638:
%.tmp1639 = load %m996$.Node.type*, %m996$.Node.type** %parent
%.tmp1640 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1639, i32 0, i32 8
%.tmp1641 = load %m996$.Node.type*, %m996$.Node.type** %child
store %m996$.Node.type* %.tmp1641, %m996$.Node.type** %.tmp1640
br label %.if.end.1638
.if.false.1638:
%.tmp1642 = load %m996$.Node.type*, %m996$.Node.type** %parent
%.tmp1643 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1642, i32 0, i32 8
%.tmp1644 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1643
%c.1645 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp1644, %m996$.Node.type** %c.1645
br label %.for.start.1646
.for.start.1646:
%.tmp1647 = load %m996$.Node.type*, %m996$.Node.type** %c.1645
%.tmp1648 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1647, i32 0, i32 9
%.tmp1649 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1648
%.tmp1650 = icmp ne %m996$.Node.type* %.tmp1649, null
br i1 %.tmp1650, label %.for.continue.1646, label %.for.end.1646
.for.continue.1646:
%.tmp1651 = load %m996$.Node.type*, %m996$.Node.type** %c.1645
%.tmp1652 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1651, i32 0, i32 9
%.tmp1653 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1652
store %m996$.Node.type* %.tmp1653, %m996$.Node.type** %c.1645
br label %.for.start.1646
.for.end.1646:
%.tmp1654 = load %m996$.Node.type*, %m996$.Node.type** %c.1645
%.tmp1655 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1654, i32 0, i32 9
%.tmp1656 = load %m996$.Node.type*, %m996$.Node.type** %child
store %m996$.Node.type* %.tmp1656, %m996$.Node.type** %.tmp1655
br label %.if.end.1638
.if.end.1638:
%.tmp1657 = load %m996$.Node.type*, %m996$.Node.type** %child
%.tmp1658 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1657, i32 0, i32 9
store %m996$.Node.type* null, %m996$.Node.type** %.tmp1658
ret void
}
define void @m996$child_pop.v.m996$.Node.typep(%m996$.Node.type* %.parent.arg) {
%parent = alloca %m996$.Node.type*
store %m996$.Node.type* %.parent.arg, %m996$.Node.type** %parent
%.tmp1659 = load %m996$.Node.type*, %m996$.Node.type** %parent
%.tmp1660 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1659, i32 0, i32 8
%.tmp1661 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1660
%.tmp1662 = icmp eq %m996$.Node.type* %.tmp1661, null
br i1 %.tmp1662, label %.if.true.1663, label %.if.false.1663
.if.true.1663:
ret void
br label %.if.end.1663
.if.false.1663:
br label %.if.end.1663
.if.end.1663:
%.tmp1664 = load %m996$.Node.type*, %m996$.Node.type** %parent
%.tmp1665 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1664, i32 0, i32 8
%.tmp1666 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1665
%c.1667 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp1666, %m996$.Node.type** %c.1667
%.tmp1668 = load %m996$.Node.type*, %m996$.Node.type** %c.1667
%.tmp1669 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1668, i32 0, i32 9
%.tmp1670 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1669
%.tmp1671 = icmp eq %m996$.Node.type* %.tmp1670, null
br i1 %.tmp1671, label %.if.true.1672, label %.if.false.1672
.if.true.1672:
%.tmp1673 = load %m996$.Node.type*, %m996$.Node.type** %c.1667
%.tmp1674 = bitcast %m996$.Node.type* %.tmp1673 to i8*
call void(i8*) @free(i8* %.tmp1674)
%.tmp1675 = load %m996$.Node.type*, %m996$.Node.type** %parent
%.tmp1676 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1675, i32 0, i32 8
store %m996$.Node.type* null, %m996$.Node.type** %.tmp1676
ret void
br label %.if.end.1672
.if.false.1672:
br label %.if.end.1672
.if.end.1672:
br label %.for.start.1677
.for.start.1677:
%.tmp1678 = load %m996$.Node.type*, %m996$.Node.type** %c.1667
%.tmp1679 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1678, i32 0, i32 9
%.tmp1680 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1679
%.tmp1681 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1680, i32 0, i32 9
%.tmp1682 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1681
%.tmp1683 = icmp ne %m996$.Node.type* %.tmp1682, null
br i1 %.tmp1683, label %.for.continue.1677, label %.for.end.1677
.for.continue.1677:
%.tmp1684 = load %m996$.Node.type*, %m996$.Node.type** %c.1667
%.tmp1685 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1684, i32 0, i32 9
%.tmp1686 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1685
store %m996$.Node.type* %.tmp1686, %m996$.Node.type** %c.1667
br label %.for.start.1677
.for.end.1677:
%.tmp1687 = load %m996$.Node.type*, %m996$.Node.type** %c.1667
%.tmp1688 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1687, i32 0, i32 9
%.tmp1689 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1688
%.tmp1690 = bitcast %m996$.Node.type* %.tmp1689 to i8*
call void(i8*) @free(i8* %.tmp1690)
%.tmp1691 = load %m996$.Node.type*, %m996$.Node.type** %c.1667
%.tmp1692 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1691, i32 0, i32 9
store %m996$.Node.type* null, %m996$.Node.type** %.tmp1692
ret void
}
%m996$.AstContext.type = type {%m313$.Token.type*,%m996$.Rule.type**,%m312$.Error.type*,i32,i32}
define %m996$.AstContext.type* @m996$next_token.m996$.AstContext.typep.m996$.AstContext.typep(%m996$.AstContext.type* %.ctx.arg) {
%ctx = alloca %m996$.AstContext.type*
store %m996$.AstContext.type* %.ctx.arg, %m996$.AstContext.type** %ctx
%.tmp1693 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1694 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1693, i32 0, i32 0
%.tmp1695 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1696 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1695, i32 0, i32 0
%.tmp1697 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1696
%.tmp1698 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1697, i32 0, i32 5
%.tmp1699 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1698
store %m313$.Token.type* %.tmp1699, %m313$.Token.type** %.tmp1694
%.tmp1700 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1701 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1700, i32 0, i32 0
%.tmp1702 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1701
%ct.1703 = alloca %m313$.Token.type*
store %m313$.Token.type* %.tmp1702, %m313$.Token.type** %ct.1703
%.tmp1704 = load %m313$.Token.type*, %m313$.Token.type** %ct.1703
%.tmp1705 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1704, i32 0, i32 2
%.tmp1706 = load i32, i32* %.tmp1705
%.tmp1707 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1708 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1707, i32 0, i32 3
%.tmp1709 = load i32, i32* %.tmp1708
%.tmp1710 = icmp sgt i32 %.tmp1706, %.tmp1709
br i1 %.tmp1710, label %.if.true.1711, label %.if.false.1711
.if.true.1711:
%.tmp1712 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1713 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1712, i32 0, i32 3
%.tmp1714 = load %m313$.Token.type*, %m313$.Token.type** %ct.1703
%.tmp1715 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1714, i32 0, i32 2
%.tmp1716 = load i32, i32* %.tmp1715
store i32 %.tmp1716, i32* %.tmp1713
%.tmp1717 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1718 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1717, i32 0, i32 4
%.tmp1719 = load %m313$.Token.type*, %m313$.Token.type** %ct.1703
%.tmp1720 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1719, i32 0, i32 3
%.tmp1721 = load i32, i32* %.tmp1720
store i32 %.tmp1721, i32* %.tmp1718
br label %.if.end.1711
.if.false.1711:
%.tmp1722 = load %m313$.Token.type*, %m313$.Token.type** %ct.1703
%.tmp1723 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1722, i32 0, i32 2
%.tmp1724 = load i32, i32* %.tmp1723
%.tmp1725 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1726 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1725, i32 0, i32 3
%.tmp1727 = load i32, i32* %.tmp1726
%.tmp1728 = icmp eq i32 %.tmp1724, %.tmp1727
br i1 %.tmp1728, label %.if.true.1729, label %.if.false.1729
.if.true.1729:
%.tmp1730 = load %m313$.Token.type*, %m313$.Token.type** %ct.1703
%.tmp1731 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1730, i32 0, i32 3
%.tmp1732 = load i32, i32* %.tmp1731
%.tmp1733 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1734 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1733, i32 0, i32 4
%.tmp1735 = load i32, i32* %.tmp1734
%.tmp1736 = icmp sgt i32 %.tmp1732, %.tmp1735
br i1 %.tmp1736, label %.if.true.1737, label %.if.false.1737
.if.true.1737:
%.tmp1738 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1739 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1738, i32 0, i32 4
%.tmp1740 = load %m313$.Token.type*, %m313$.Token.type** %ct.1703
%.tmp1741 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1740, i32 0, i32 3
%.tmp1742 = load i32, i32* %.tmp1741
store i32 %.tmp1742, i32* %.tmp1739
br label %.if.end.1737
.if.false.1737:
br label %.if.end.1737
.if.end.1737:
br label %.if.end.1729
.if.false.1729:
br label %.if.end.1729
.if.end.1729:
br label %.if.end.1711
.if.end.1711:
%.tmp1743 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
ret %m996$.AstContext.type* %.tmp1743
}
define %m996$.Rule.type* @m996$find_rule.m996$.Rule.typep.m996$.Rule.typepp.cp(%m996$.Rule.type** %.grammar.arg, i8* %.rule_name.arg) {
%grammar = alloca %m996$.Rule.type**
store %m996$.Rule.type** %.grammar.arg, %m996$.Rule.type*** %grammar
%rule_name = alloca i8*
store i8* %.rule_name.arg, i8** %rule_name
%i.1745 = alloca i32
store i32 0, i32* %i.1745
br label %.for.start.1744
.for.start.1744:
%.tmp1746 = load i32, i32* %i.1745
%.tmp1747 = load %m996$.Rule.type**, %m996$.Rule.type*** %grammar
%.tmp1748 = getelementptr %m996$.Rule.type*, %m996$.Rule.type** %.tmp1747, i32 %.tmp1746
%.tmp1749 = load %m996$.Rule.type*, %m996$.Rule.type** %.tmp1748
%.tmp1750 = icmp ne %m996$.Rule.type* %.tmp1749, null
br i1 %.tmp1750, label %.for.continue.1744, label %.for.end.1744
.for.continue.1744:
%.tmp1751 = load i32, i32* %i.1745
%.tmp1752 = load %m996$.Rule.type**, %m996$.Rule.type*** %grammar
%.tmp1753 = getelementptr %m996$.Rule.type*, %m996$.Rule.type** %.tmp1752, i32 %.tmp1751
%.tmp1754 = load %m996$.Rule.type*, %m996$.Rule.type** %.tmp1753
%rule.1755 = alloca %m996$.Rule.type*
store %m996$.Rule.type* %.tmp1754, %m996$.Rule.type** %rule.1755
%.tmp1756 = load %m996$.Rule.type*, %m996$.Rule.type** %rule.1755
%.tmp1757 = getelementptr %m996$.Rule.type, %m996$.Rule.type* %.tmp1756, i32 0, i32 0
%.tmp1758 = load i8*, i8** %.tmp1757
%.tmp1759 = load i8*, i8** %rule_name
%.tmp1760 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1758, i8* %.tmp1759)
%.tmp1761 = icmp eq i32 %.tmp1760, 0
br i1 %.tmp1761, label %.if.true.1762, label %.if.false.1762
.if.true.1762:
%.tmp1763 = load %m996$.Rule.type*, %m996$.Rule.type** %rule.1755
ret %m996$.Rule.type* %.tmp1763
br label %.if.end.1762
.if.false.1762:
br label %.if.end.1762
.if.end.1762:
%.tmp1764 = load i32, i32* %i.1745
%.tmp1765 = add i32 %.tmp1764, 1
store i32 %.tmp1765, i32* %i.1745
br label %.for.start.1744
.for.end.1744:
%.tmp1766 = bitcast ptr null to %m996$.Rule.type*
ret %m996$.Rule.type* %.tmp1766
}
%m996$.ParseResult.type = type {%m312$.Error.type*,%m996$.Node.type*}
define %m996$.ParseResult.type* @m996$parse_to_ast.m996$.ParseResult.typep.m996$.AstContext.typep.m996$.Rule.typep(%m996$.AstContext.type* %.c.arg, %m996$.Rule.type* %.rule.arg) {
%c = alloca %m996$.AstContext.type*
store %m996$.AstContext.type* %.c.arg, %m996$.AstContext.type** %c
%rule = alloca %m996$.Rule.type*
store %m996$.Rule.type* %.rule.arg, %m996$.Rule.type** %rule
%.tmp1767 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* null, i32 1
%.tmp1768 = ptrtoint %m996$.ParseResult.type* %.tmp1767 to i32
%.tmp1769 = call i8*(i32) @malloc(i32 %.tmp1768)
%.tmp1770 = bitcast i8* %.tmp1769 to %m996$.ParseResult.type*
%res.1771 = alloca %m996$.ParseResult.type*
store %m996$.ParseResult.type* %.tmp1770, %m996$.ParseResult.type** %res.1771
%.tmp1772 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.1771
%.tmp1773 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp1772, i32 0, i32 0
store %m312$.Error.type* null, %m312$.Error.type** %.tmp1773
%.tmp1774 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.1771
%.tmp1775 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp1774, i32 0, i32 1
%.tmp1776 = load %m996$.AstContext.type*, %m996$.AstContext.type** %c
%.tmp1777 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1776, i32 0, i32 0
%.tmp1778 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1777
%.tmp1779 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp1780 = getelementptr %m996$.Rule.type, %m996$.Rule.type* %.tmp1779, i32 0, i32 0
%.tmp1781 = load i8*, i8** %.tmp1780
%.tmp1782 = bitcast ptr null to i8*
%.tmp1783 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp1784 = getelementptr %m996$.Rule.type, %m996$.Rule.type* %.tmp1783, i32 0, i32 2
%.tmp1785 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp1784
%.tmp1786 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1785, i32 0, i32 1
%.tmp1787 = load i8*, i8** %.tmp1786
%.tmp1788 = call %m996$.Node.type*(%m313$.Token.type*,i8*,i8*,i8*) @m996$new_node.m996$.Node.typep.m313$.Token.typep.cp.cp.cp(%m313$.Token.type* %.tmp1778, i8* %.tmp1781, i8* %.tmp1782, i8* %.tmp1787)
store %m996$.Node.type* %.tmp1788, %m996$.Node.type** %.tmp1775
%.tmp1789 = load %m996$.AstContext.type*, %m996$.AstContext.type** %c
%.tmp1790 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1789, i32 0, i32 0
%.tmp1791 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1790
%start_match.1792 = alloca %m313$.Token.type*
store %m313$.Token.type* %.tmp1791, %m313$.Token.type** %start_match.1792
%.tmp1793 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.1771
%.tmp1794 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp1793, i32 0, i32 1
%.tmp1795 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1794
%.tmp1796 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp1795, i32 0, i32 5
%.tmp1797 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp1798 = getelementptr %m996$.Rule.type, %m996$.Rule.type* %.tmp1797, i32 0, i32 1
%.tmp1799 = load i8*, i8** %.tmp1798
store i8* %.tmp1799, i8** %.tmp1796
%.tmp1800 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.1771
%.tmp1801 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp1800, i32 0, i32 0
%.tmp1802 = load %m996$.AstContext.type*, %m996$.AstContext.type** %c
%.tmp1803 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp1804 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp1805 = getelementptr %m996$.Rule.type, %m996$.Rule.type* %.tmp1804, i32 0, i32 2
%.tmp1806 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp1805
%.tmp1807 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.1771
%.tmp1808 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp1807, i32 0, i32 1
%.tmp1809 = load %m996$.Node.type*, %m996$.Node.type** %.tmp1808
%.tmp1810 = call %m312$.Error.type*(%m996$.AstContext.type*,%m996$.Rule.type*,%m996$.Matcher.type*,%m996$.Node.type*) @m996$execute_matcher.m312$.Error.typep.m996$.AstContext.typep.m996$.Rule.typep.m996$.Matcher.typep.m996$.Node.typep(%m996$.AstContext.type* %.tmp1802, %m996$.Rule.type* %.tmp1803, %m996$.Matcher.type* %.tmp1806, %m996$.Node.type* %.tmp1809)
store %m312$.Error.type* %.tmp1810, %m312$.Error.type** %.tmp1801
%.tmp1811 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.1771
ret %m996$.ParseResult.type* %.tmp1811
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
%.tmp1812 = bitcast ptr null to %m312$.Error.type*
%err.1813 = alloca %m312$.Error.type*
store %m312$.Error.type* %.tmp1812, %m312$.Error.type** %err.1813
%.tmp1815 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%m.1816 = alloca %m996$.Matcher.type*
store %m996$.Matcher.type* %.tmp1815, %m996$.Matcher.type** %m.1816
br label %.for.start.1814
.for.start.1814:
%.tmp1817 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1816
%.tmp1818 = icmp ne %m996$.Matcher.type* %.tmp1817, null
br i1 %.tmp1818, label %.for.continue.1814, label %.for.end.1814
.for.continue.1814:
%.tmp1819 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1820 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp1821 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1816
%.tmp1822 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp1823 = call %m312$.Error.type*(%m996$.AstContext.type*,%m996$.Rule.type*,%m996$.Matcher.type*,%m996$.Node.type*) @m996$execute_matcher_straight.m312$.Error.typep.m996$.AstContext.typep.m996$.Rule.typep.m996$.Matcher.typep.m996$.Node.typep(%m996$.AstContext.type* %.tmp1819, %m996$.Rule.type* %.tmp1820, %m996$.Matcher.type* %.tmp1821, %m996$.Node.type* %.tmp1822)
store %m312$.Error.type* %.tmp1823, %m312$.Error.type** %err.1813
%.tmp1824 = load %m312$.Error.type*, %m312$.Error.type** %err.1813
%.tmp1825 = icmp eq %m312$.Error.type* %.tmp1824, null
br i1 %.tmp1825, label %.if.true.1826, label %.if.false.1826
.if.true.1826:
br label %.for.end.1814
br label %.if.end.1826
.if.false.1826:
br label %.if.end.1826
.if.end.1826:
%.tmp1827 = load %m996$.Matcher.type*, %m996$.Matcher.type** %m.1816
%.tmp1828 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1827, i32 0, i32 2
%.tmp1829 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp1828
store %m996$.Matcher.type* %.tmp1829, %m996$.Matcher.type** %m.1816
br label %.for.start.1814
.for.end.1814:
%.tmp1830 = load %m312$.Error.type*, %m312$.Error.type** %err.1813
ret %m312$.Error.type* %.tmp1830
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
%.tmp1832 = getelementptr [1 x i8], [1 x i8]*@.str1831, i32 0, i32 0
%buf.1833 = alloca i8*
store i8* %.tmp1832, i8** %buf.1833
%.tmp1834 = bitcast ptr null to %m312$.Error.type*
%err.1835 = alloca %m312$.Error.type*
store %m312$.Error.type* %.tmp1834, %m312$.Error.type** %err.1835
%.tmp1836 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1837 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1836, i32 0, i32 0
%.tmp1838 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1837
%anchor.1839 = alloca %m313$.Token.type*
store %m313$.Token.type* %.tmp1838, %m313$.Token.type** %anchor.1839
%.tmp1840 = bitcast ptr null to %m996$.Node.type*
%child.1841 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp1840, %m996$.Node.type** %child.1841
%.tmp1842 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1843 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1842, i32 0, i32 5
%.tmp1844 = load i8, i8* %.tmp1843
%.tmp1845 = load i8, i8* @TYPE_IGNORE
%.tmp1846 = icmp eq i8 %.tmp1844, %.tmp1845
br i1 %.tmp1846, label %.if.true.1847, label %.if.false.1847
.if.true.1847:
%.tmp1848 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1849 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1848, i32 0, i32 4
%.tmp1850 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp1849
%.tmp1851 = icmp ne %m996$.Matcher.type* %.tmp1850, null
br i1 %.tmp1851, label %.if.true.1852, label %.if.false.1852
.if.true.1852:
%.tmp1853 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1854 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp1855 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1856 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1855, i32 0, i32 4
%.tmp1857 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp1856
%.tmp1858 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp1859 = call %m312$.Error.type*(%m996$.AstContext.type*,%m996$.Rule.type*,%m996$.Matcher.type*,%m996$.Node.type*) @m996$execute_matcher.m312$.Error.typep.m996$.AstContext.typep.m996$.Rule.typep.m996$.Matcher.typep.m996$.Node.typep(%m996$.AstContext.type* %.tmp1853, %m996$.Rule.type* %.tmp1854, %m996$.Matcher.type* %.tmp1857, %m996$.Node.type* %.tmp1858)
store %m312$.Error.type* %.tmp1859, %m312$.Error.type** %err.1835
br label %.if.end.1852
.if.false.1852:
br label %.if.end.1852
.if.end.1852:
br label %.if.end.1847
.if.false.1847:
%.tmp1860 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1861 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1860, i32 0, i32 5
%.tmp1862 = load i8, i8* %.tmp1861
%.tmp1863 = load i8, i8* @TYPE_VALUE
%.tmp1864 = icmp eq i8 %.tmp1862, %.tmp1863
br i1 %.tmp1864, label %.if.true.1865, label %.if.false.1865
.if.true.1865:
%.tmp1866 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1867 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1866, i32 0, i32 6
%.tmp1868 = load i8*, i8** %.tmp1867
%.tmp1869 = icmp eq i8* %.tmp1868, null
br i1 %.tmp1869, label %.if.true.1870, label %.if.false.1870
.if.true.1870:
%.tmp1872 = getelementptr [22 x i8], [22 x i8]*@.str1871, i32 0, i32 0
%.tmp1873 = call i32(i8*,...) @printf(i8* %.tmp1872)
br label %.if.end.1870
.if.false.1870:
br label %.if.end.1870
.if.end.1870:
%.tmp1874 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1875 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1874, i32 0, i32 6
%.tmp1876 = load i8*, i8** %.tmp1875
%.tmp1877 = call i32(i8*) @strlen(i8* %.tmp1876)
%.tmp1878 = sub i32 %.tmp1877, 1
%.tmp1879 = call i8*(i32) @malloc(i32 %.tmp1878)
%buf.1880 = alloca i8*
store i8* %.tmp1879, i8** %buf.1880
%.tmp1881 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1882 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1881, i32 0, i32 6
%.tmp1883 = load i8*, i8** %.tmp1882
%.tmp1885 = getelementptr [8 x i8], [8 x i8]*@.str1884, i32 0, i32 0
%.tmp1886 = load i8*, i8** %buf.1880
%.tmp1887 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp1883, i8* %.tmp1885, i8* %.tmp1886)
%.tmp1888 = load i8*, i8** %buf.1880
%.tmp1889 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1890 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1889, i32 0, i32 0
%.tmp1891 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1890
%.tmp1892 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1891, i32 0, i32 1
%.tmp1893 = load i8*, i8** %.tmp1892
%.tmp1894 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1888, i8* %.tmp1893)
%.tmp1895 = icmp ne i32 %.tmp1894, 0
br i1 %.tmp1895, label %.if.true.1896, label %.if.false.1896
.if.true.1896:
%.tmp1897 = getelementptr i8*, i8** %buf.1880, i32 0
%.tmp1899 = getelementptr [43 x i8], [43 x i8]*@.str1898, i32 0, i32 0
%.tmp1900 = load i8*, i8** %buf.1880
%.tmp1901 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1902 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1901, i32 0, i32 0
%.tmp1903 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1902
%.tmp1904 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1903, i32 0, i32 1
%.tmp1905 = load i8*, i8** %.tmp1904
%.tmp1906 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1897, i8* %.tmp1899, i8* %.tmp1900, i8* %.tmp1905)
%.tmp1907 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1908 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1907, i32 0, i32 0
%.tmp1909 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1908
%.tmp1910 = load i8*, i8** %buf.1880
%.tmp1911 = call %m312$.Error.type*(%m313$.Token.type*,i8*) @m312$from.m312$.Error.typep.m313$.Token.typep.cp(%m313$.Token.type* %.tmp1909, i8* %.tmp1910)
ret %m312$.Error.type* %.tmp1911
br label %.if.end.1896
.if.false.1896:
br label %.if.end.1896
.if.end.1896:
%.tmp1912 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1913 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1912, i32 0, i32 0
%.tmp1914 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1913
%.tmp1915 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1916 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1915, i32 0, i32 0
%.tmp1917 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1916
%.tmp1918 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1917, i32 0, i32 0
%.tmp1919 = load i8*, i8** %.tmp1918
%.tmp1920 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1921 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1920, i32 0, i32 0
%.tmp1922 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1921
%.tmp1923 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1922, i32 0, i32 1
%.tmp1924 = load i8*, i8** %.tmp1923
%.tmp1925 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1926 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1925, i32 0, i32 1
%.tmp1927 = load i8*, i8** %.tmp1926
%.tmp1928 = call %m996$.Node.type*(%m313$.Token.type*,i8*,i8*,i8*) @m996$new_node.m996$.Node.typep.m313$.Token.typep.cp.cp.cp(%m313$.Token.type* %.tmp1914, i8* %.tmp1919, i8* %.tmp1924, i8* %.tmp1927)
store %m996$.Node.type* %.tmp1928, %m996$.Node.type** %child.1841
%.tmp1929 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1930 = call %m996$.AstContext.type*(%m996$.AstContext.type*) @m996$next_token.m996$.AstContext.typep.m996$.AstContext.typep(%m996$.AstContext.type* %.tmp1929)
store %m996$.AstContext.type* %.tmp1930, %m996$.AstContext.type** %ctx
br label %.if.end.1865
.if.false.1865:
%.tmp1931 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1932 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1931, i32 0, i32 5
%.tmp1933 = load i8, i8* %.tmp1932
%.tmp1934 = load i8, i8* @TYPE_TYPE
%.tmp1935 = icmp eq i8 %.tmp1933, %.tmp1934
br i1 %.tmp1935, label %.if.true.1936, label %.if.false.1936
.if.true.1936:
%.tmp1937 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1938 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1937, i32 0, i32 6
%.tmp1939 = load i8*, i8** %.tmp1938
%.tmp1940 = icmp eq i8* %.tmp1939, null
br i1 %.tmp1940, label %.if.true.1941, label %.if.false.1941
.if.true.1941:
%.tmp1943 = getelementptr [22 x i8], [22 x i8]*@.str1942, i32 0, i32 0
%.tmp1944 = call i32(i8*,...) @printf(i8* %.tmp1943)
br label %.if.end.1941
.if.false.1941:
br label %.if.end.1941
.if.end.1941:
%.tmp1945 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1946 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1945, i32 0, i32 6
%.tmp1947 = load i8*, i8** %.tmp1946
%.tmp1948 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1949 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1948, i32 0, i32 0
%.tmp1950 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1949
%.tmp1951 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1950, i32 0, i32 0
%.tmp1952 = load i8*, i8** %.tmp1951
%.tmp1953 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp1947, i8* %.tmp1952)
%.tmp1954 = icmp ne i32 %.tmp1953, 0
br i1 %.tmp1954, label %.if.true.1955, label %.if.false.1955
.if.true.1955:
%.tmp1956 = getelementptr i8*, i8** %buf.1833, i32 0
%.tmp1958 = getelementptr [54 x i8], [54 x i8]*@.str1957, i32 0, i32 0
%.tmp1959 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1960 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1959, i32 0, i32 6
%.tmp1961 = load i8*, i8** %.tmp1960
%.tmp1962 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1963 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1962, i32 0, i32 0
%.tmp1964 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1963
%.tmp1965 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1964, i32 0, i32 0
%.tmp1966 = load i8*, i8** %.tmp1965
%.tmp1967 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp1956, i8* %.tmp1958, i8* %.tmp1961, i8* %.tmp1966)
%.tmp1968 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1969 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1968, i32 0, i32 0
%.tmp1970 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1969
%.tmp1971 = load i8*, i8** %buf.1833
%.tmp1972 = call %m312$.Error.type*(%m313$.Token.type*,i8*) @m312$from.m312$.Error.typep.m313$.Token.typep.cp(%m313$.Token.type* %.tmp1970, i8* %.tmp1971)
ret %m312$.Error.type* %.tmp1972
br label %.if.end.1955
.if.false.1955:
br label %.if.end.1955
.if.end.1955:
%.tmp1973 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1974 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1973, i32 0, i32 0
%.tmp1975 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1974
%.tmp1976 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1977 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1976, i32 0, i32 0
%.tmp1978 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1977
%.tmp1979 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1978, i32 0, i32 0
%.tmp1980 = load i8*, i8** %.tmp1979
%.tmp1981 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1982 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1981, i32 0, i32 0
%.tmp1983 = load %m313$.Token.type*, %m313$.Token.type** %.tmp1982
%.tmp1984 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp1983, i32 0, i32 1
%.tmp1985 = load i8*, i8** %.tmp1984
%.tmp1986 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1987 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1986, i32 0, i32 1
%.tmp1988 = load i8*, i8** %.tmp1987
%.tmp1989 = call %m996$.Node.type*(%m313$.Token.type*,i8*,i8*,i8*) @m996$new_node.m996$.Node.typep.m313$.Token.typep.cp.cp.cp(%m313$.Token.type* %.tmp1975, i8* %.tmp1980, i8* %.tmp1985, i8* %.tmp1988)
store %m996$.Node.type* %.tmp1989, %m996$.Node.type** %child.1841
%.tmp1990 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1991 = call %m996$.AstContext.type*(%m996$.AstContext.type*) @m996$next_token.m996$.AstContext.typep.m996$.AstContext.typep(%m996$.AstContext.type* %.tmp1990)
store %m996$.AstContext.type* %.tmp1991, %m996$.AstContext.type** %ctx
br label %.if.end.1936
.if.false.1936:
%.tmp1992 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp1993 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp1992, i32 0, i32 5
%.tmp1994 = load i8, i8* %.tmp1993
%.tmp1995 = load i8, i8* @TYPE_ALIAS
%.tmp1996 = icmp eq i8 %.tmp1994, %.tmp1995
br i1 %.tmp1996, label %.if.true.1997, label %.if.false.1997
.if.true.1997:
%.tmp1998 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp1999 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp1998, i32 0, i32 1
%.tmp2000 = load %m996$.Rule.type**, %m996$.Rule.type*** %.tmp1999
%.tmp2001 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2002 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp2001, i32 0, i32 6
%.tmp2003 = load i8*, i8** %.tmp2002
%.tmp2004 = call %m996$.Rule.type*(%m996$.Rule.type**,i8*) @m996$find_rule.m996$.Rule.typep.m996$.Rule.typepp.cp(%m996$.Rule.type** %.tmp2000, i8* %.tmp2003)
%alias_rule.2005 = alloca %m996$.Rule.type*
store %m996$.Rule.type* %.tmp2004, %m996$.Rule.type** %alias_rule.2005
%.tmp2006 = load %m996$.Rule.type*, %m996$.Rule.type** %alias_rule.2005
%.tmp2007 = icmp eq %m996$.Rule.type* %.tmp2006, null
br i1 %.tmp2007, label %.if.true.2008, label %.if.false.2008
.if.true.2008:
%.tmp2009 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp2010 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp2009, i32 0, i32 0
%.tmp2011 = load %m313$.Token.type*, %m313$.Token.type** %.tmp2010
%.tmp2013 = getelementptr [26 x i8], [26 x i8]*@.str2012, i32 0, i32 0
%.tmp2014 = call %m312$.Error.type*(%m313$.Token.type*,i8*) @m312$from.m312$.Error.typep.m313$.Token.typep.cp(%m313$.Token.type* %.tmp2011, i8* %.tmp2013)
ret %m312$.Error.type* %.tmp2014
br label %.if.end.2008
.if.false.2008:
br label %.if.end.2008
.if.end.2008:
%.tmp2015 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp2016 = load %m996$.Rule.type*, %m996$.Rule.type** %alias_rule.2005
%.tmp2017 = call %m996$.ParseResult.type*(%m996$.AstContext.type*,%m996$.Rule.type*) @m996$parse_to_ast.m996$.ParseResult.typep.m996$.AstContext.typep.m996$.Rule.typep(%m996$.AstContext.type* %.tmp2015, %m996$.Rule.type* %.tmp2016)
%parse_result.2018 = alloca %m996$.ParseResult.type*
store %m996$.ParseResult.type* %.tmp2017, %m996$.ParseResult.type** %parse_result.2018
%.tmp2019 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %parse_result.2018
%.tmp2020 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2019, i32 0, i32 0
%.tmp2021 = load %m312$.Error.type*, %m312$.Error.type** %.tmp2020
%.tmp2022 = icmp ne %m312$.Error.type* %.tmp2021, null
br i1 %.tmp2022, label %.if.true.2023, label %.if.false.2023
.if.true.2023:
%.tmp2024 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %parse_result.2018
%.tmp2025 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2024, i32 0, i32 0
%.tmp2026 = load %m312$.Error.type*, %m312$.Error.type** %.tmp2025
ret %m312$.Error.type* %.tmp2026
br label %.if.end.2023
.if.false.2023:
br label %.if.end.2023
.if.end.2023:
%.tmp2027 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %parse_result.2018
%.tmp2028 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2027, i32 0, i32 1
%.tmp2029 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2028
store %m996$.Node.type* %.tmp2029, %m996$.Node.type** %child.1841
%.tmp2030 = load %m996$.Node.type*, %m996$.Node.type** %child.1841
%.tmp2031 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2030, i32 0, i32 5
%.tmp2032 = load %m996$.Rule.type*, %m996$.Rule.type** %alias_rule.2005
%.tmp2033 = getelementptr %m996$.Rule.type, %m996$.Rule.type* %.tmp2032, i32 0, i32 1
%.tmp2034 = load i8*, i8** %.tmp2033
store i8* %.tmp2034, i8** %.tmp2031
br label %.if.end.1997
.if.false.1997:
%.tmp2036 = getelementptr [33 x i8], [33 x i8]*@.str2035, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp2036)
br label %.if.end.1997
.if.end.1997:
br label %.if.end.1936
.if.end.1936:
br label %.if.end.1865
.if.end.1865:
br label %.if.end.1847
.if.end.1847:
%.tmp2037 = load %m996$.Node.type*, %m996$.Node.type** %child.1841
%.tmp2038 = icmp ne %m996$.Node.type* %.tmp2037, null
br i1 %.tmp2038, label %.if.true.2039, label %.if.false.2039
.if.true.2039:
%.tmp2040 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp2041 = load %m996$.Node.type*, %m996$.Node.type** %child.1841
call void(%m996$.Node.type*,%m996$.Node.type*) @m996$child_append.v.m996$.Node.typep.m996$.Node.typep(%m996$.Node.type* %.tmp2040, %m996$.Node.type* %.tmp2041)
br label %.if.end.2039
.if.false.2039:
br label %.if.end.2039
.if.end.2039:
%.tmp2042 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2043 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp2042, i32 0, i32 0
%.tmp2044 = load i8, i8* %.tmp2043
%.tmp2045 = icmp eq i8 %.tmp2044, 63
%.tmp2046 = load %m312$.Error.type*, %m312$.Error.type** %err.1835
%.tmp2047 = icmp ne %m312$.Error.type* %.tmp2046, null
%.tmp2048 = and i1 %.tmp2045, %.tmp2047
br i1 %.tmp2048, label %.if.true.2049, label %.if.false.2049
.if.true.2049:
store %m312$.Error.type* null, %m312$.Error.type** %err.1835
br label %.if.end.2049
.if.false.2049:
%.tmp2050 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2051 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp2050, i32 0, i32 0
%.tmp2052 = load i8, i8* %.tmp2051
%.tmp2053 = icmp eq i8 %.tmp2052, 42
br i1 %.tmp2053, label %.if.true.2054, label %.if.false.2054
.if.true.2054:
%.tmp2055 = load %m312$.Error.type*, %m312$.Error.type** %err.1835
%.tmp2056 = icmp ne %m312$.Error.type* %.tmp2055, null
br i1 %.tmp2056, label %.if.true.2057, label %.if.false.2057
.if.true.2057:
store %m312$.Error.type* null, %m312$.Error.type** %err.1835
br label %.if.end.2057
.if.false.2057:
%.tmp2058 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp2059 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp2060 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2061 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp2062 = call %m312$.Error.type*(%m996$.AstContext.type*,%m996$.Rule.type*,%m996$.Matcher.type*,%m996$.Node.type*) @m996$execute_matcher.m312$.Error.typep.m996$.AstContext.typep.m996$.Rule.typep.m996$.Matcher.typep.m996$.Node.typep(%m996$.AstContext.type* %.tmp2058, %m996$.Rule.type* %.tmp2059, %m996$.Matcher.type* %.tmp2060, %m996$.Node.type* %.tmp2061)
ret %m312$.Error.type* %.tmp2062
br label %.if.end.2057
.if.end.2057:
br label %.if.end.2054
.if.false.2054:
%.tmp2063 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2064 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp2063, i32 0, i32 0
%.tmp2065 = load i8, i8* %.tmp2064
%.tmp2066 = icmp eq i8 %.tmp2065, 43
%.tmp2067 = load %m312$.Error.type*, %m312$.Error.type** %err.1835
%.tmp2068 = icmp eq %m312$.Error.type* %.tmp2067, null
%.tmp2069 = and i1 %.tmp2066, %.tmp2068
br i1 %.tmp2069, label %.if.true.2070, label %.if.false.2070
.if.true.2070:
%.tmp2071 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp2072 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp2073 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2074 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp2075 = call %m312$.Error.type*(%m996$.AstContext.type*,%m996$.Rule.type*,%m996$.Matcher.type*,%m996$.Node.type*) @m996$execute_matcher.m312$.Error.typep.m996$.AstContext.typep.m996$.Rule.typep.m996$.Matcher.typep.m996$.Node.typep(%m996$.AstContext.type* %.tmp2071, %m996$.Rule.type* %.tmp2072, %m996$.Matcher.type* %.tmp2073, %m996$.Node.type* %.tmp2074)
store %m312$.Error.type* %.tmp2075, %m312$.Error.type** %err.1835
%.tmp2076 = load %m312$.Error.type*, %m312$.Error.type** %err.1835
%.tmp2077 = icmp ne %m312$.Error.type* %.tmp2076, null
br i1 %.tmp2077, label %.if.true.2078, label %.if.false.2078
.if.true.2078:
store %m312$.Error.type* null, %m312$.Error.type** %err.1835
br label %.if.end.2078
.if.false.2078:
%.tmp2079 = bitcast ptr null to %m312$.Error.type*
ret %m312$.Error.type* %.tmp2079
br label %.if.end.2078
.if.end.2078:
br label %.if.end.2070
.if.false.2070:
br label %.if.end.2070
.if.end.2070:
br label %.if.end.2054
.if.end.2054:
br label %.if.end.2049
.if.end.2049:
%.tmp2080 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2081 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp2080, i32 0, i32 3
%.tmp2082 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp2081
%.tmp2083 = icmp ne %m996$.Matcher.type* %.tmp2082, null
%.tmp2084 = load %m312$.Error.type*, %m312$.Error.type** %err.1835
%.tmp2085 = icmp eq %m312$.Error.type* %.tmp2084, null
%.tmp2086 = and i1 %.tmp2083, %.tmp2085
br i1 %.tmp2086, label %.if.true.2087, label %.if.false.2087
.if.true.2087:
%.tmp2088 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp2089 = load %m996$.Rule.type*, %m996$.Rule.type** %rule
%.tmp2090 = load %m996$.Matcher.type*, %m996$.Matcher.type** %matcher
%.tmp2091 = getelementptr %m996$.Matcher.type, %m996$.Matcher.type* %.tmp2090, i32 0, i32 3
%.tmp2092 = load %m996$.Matcher.type*, %m996$.Matcher.type** %.tmp2091
%.tmp2093 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp2094 = call %m312$.Error.type*(%m996$.AstContext.type*,%m996$.Rule.type*,%m996$.Matcher.type*,%m996$.Node.type*) @m996$execute_matcher.m312$.Error.typep.m996$.AstContext.typep.m996$.Rule.typep.m996$.Matcher.typep.m996$.Node.typep(%m996$.AstContext.type* %.tmp2088, %m996$.Rule.type* %.tmp2089, %m996$.Matcher.type* %.tmp2092, %m996$.Node.type* %.tmp2093)
store %m312$.Error.type* %.tmp2094, %m312$.Error.type** %err.1835
br label %.if.end.2087
.if.false.2087:
br label %.if.end.2087
.if.end.2087:
%.tmp2095 = load %m312$.Error.type*, %m312$.Error.type** %err.1835
%.tmp2096 = icmp ne %m312$.Error.type* %.tmp2095, null
br i1 %.tmp2096, label %.if.true.2097, label %.if.false.2097
.if.true.2097:
%.tmp2098 = load %m996$.AstContext.type*, %m996$.AstContext.type** %ctx
%.tmp2099 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %.tmp2098, i32 0, i32 0
%.tmp2100 = load %m313$.Token.type*, %m313$.Token.type** %anchor.1839
store %m313$.Token.type* %.tmp2100, %m313$.Token.type** %.tmp2099
%.tmp2101 = load %m996$.Node.type*, %m996$.Node.type** %child.1841
%.tmp2102 = icmp ne %m996$.Node.type* %.tmp2101, null
br i1 %.tmp2102, label %.if.true.2103, label %.if.false.2103
.if.true.2103:
%.tmp2104 = load %m996$.Node.type*, %m996$.Node.type** %root
call void(%m996$.Node.type*) @m996$child_pop.v.m996$.Node.typep(%m996$.Node.type* %.tmp2104)
br label %.if.end.2103
.if.false.2103:
br label %.if.end.2103
.if.end.2103:
br label %.if.end.2097
.if.false.2097:
br label %.if.end.2097
.if.end.2097:
%.tmp2105 = load %m312$.Error.type*, %m312$.Error.type** %err.1835
ret %m312$.Error.type* %.tmp2105
}
define %m996$.ParseResult.type* @m996$ast.m996$.ParseResult.typep.m996$.Rule.typepp.cp.m313$.Token.typep(%m996$.Rule.type** %.grammar.arg, i8* %.start.arg, %m313$.Token.type* %.tokens.arg) {
%grammar = alloca %m996$.Rule.type**
store %m996$.Rule.type** %.grammar.arg, %m996$.Rule.type*** %grammar
%start = alloca i8*
store i8* %.start.arg, i8** %start
%tokens = alloca %m313$.Token.type*
store %m313$.Token.type* %.tokens.arg, %m313$.Token.type** %tokens
%.tmp2106 = load %m996$.Rule.type**, %m996$.Rule.type*** %grammar
%.tmp2107 = load i8*, i8** %start
%.tmp2108 = call %m996$.Rule.type*(%m996$.Rule.type**,i8*) @m996$find_rule.m996$.Rule.typep.m996$.Rule.typepp.cp(%m996$.Rule.type** %.tmp2106, i8* %.tmp2107)
%start_matcher.2109 = alloca %m996$.Rule.type*
store %m996$.Rule.type* %.tmp2108, %m996$.Rule.type** %start_matcher.2109
%.tmp2110 = load %m996$.Rule.type*, %m996$.Rule.type** %start_matcher.2109
%.tmp2111 = icmp eq %m996$.Rule.type* %.tmp2110, null
br i1 %.tmp2111, label %.if.true.2112, label %.if.false.2112
.if.true.2112:
%.tmp2113 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* null, i32 1
%.tmp2114 = ptrtoint %m996$.ParseResult.type* %.tmp2113 to i32
%.tmp2115 = call i8*(i32) @malloc(i32 %.tmp2114)
%.tmp2116 = bitcast i8* %.tmp2115 to %m996$.ParseResult.type*
%res.2117 = alloca %m996$.ParseResult.type*
store %m996$.ParseResult.type* %.tmp2116, %m996$.ParseResult.type** %res.2117
%.tmp2118 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.2117
%.tmp2119 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2118, i32 0, i32 1
store %m996$.Node.type* null, %m996$.Node.type** %.tmp2119
%.tmp2121 = getelementptr [1 x i8], [1 x i8]*@.str2120, i32 0, i32 0
%buf.2122 = alloca i8*
store i8* %.tmp2121, i8** %buf.2122
%.tmp2123 = getelementptr i8*, i8** %buf.2122, i32 0
%.tmp2125 = getelementptr [29 x i8], [29 x i8]*@.str2124, i32 0, i32 0
%.tmp2126 = load i8*, i8** %start
%.tmp2127 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2123, i8* %.tmp2125, i8* %.tmp2126)
%.tmp2128 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.2117
%.tmp2129 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2128, i32 0, i32 0
%.tmp2131 = getelementptr [10 x i8], [10 x i8]*@.str2130, i32 0, i32 0
%.tmp2132 = load i8*, i8** %buf.2122
%.tmp2133 = call %m312$.Error.type*(i8*,i32,i32,i8*) @m312$new.m312$.Error.typep.cp.i.i.cp(i8* %.tmp2131, i32 0, i32 0, i8* %.tmp2132)
store %m312$.Error.type* %.tmp2133, %m312$.Error.type** %.tmp2129
%.tmp2134 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.2117
ret %m996$.ParseResult.type* %.tmp2134
br label %.if.end.2112
.if.false.2112:
br label %.if.end.2112
.if.end.2112:
%.tmp2135 = load %m996$.Rule.type*, %m996$.Rule.type** %start_matcher.2109
%.tmp2136 = icmp ne %m996$.Rule.type* %.tmp2135, null
%.tmp2138 = getelementptr [44 x i8], [44 x i8]*@.str2137, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2136, i8* %.tmp2138)
%c.2139 = alloca %m996$.AstContext.type
%.tmp2140 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2139, i32 0, i32 0
store %m313$.Token.type* null, %m313$.Token.type** %.tmp2140
%.tmp2141 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2139, i32 0, i32 1
store %m996$.Rule.type** null, %m996$.Rule.type*** %.tmp2141
%.tmp2142 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2139, i32 0, i32 2
store %m312$.Error.type* null, %m312$.Error.type** %.tmp2142
%.tmp2143 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2139, i32 0, i32 3
store i32 0, i32* %.tmp2143
%.tmp2144 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2139, i32 0, i32 4
store i32 0, i32* %.tmp2144
%.tmp2145 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2139, i32 0, i32 0
%.tmp2146 = load %m313$.Token.type*, %m313$.Token.type** %tokens
store %m313$.Token.type* %.tmp2146, %m313$.Token.type** %.tmp2145
%.tmp2147 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2139, i32 0, i32 1
%.tmp2148 = load %m996$.Rule.type**, %m996$.Rule.type*** %grammar
store %m996$.Rule.type** %.tmp2148, %m996$.Rule.type*** %.tmp2147
%.tmp2149 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2139, i32 0
%.tmp2150 = load %m996$.Rule.type*, %m996$.Rule.type** %start_matcher.2109
%.tmp2151 = call %m996$.ParseResult.type*(%m996$.AstContext.type*,%m996$.Rule.type*) @m996$parse_to_ast.m996$.ParseResult.typep.m996$.AstContext.typep.m996$.Rule.typep(%m996$.AstContext.type* %.tmp2149, %m996$.Rule.type* %.tmp2150)
%res.2152 = alloca %m996$.ParseResult.type*
store %m996$.ParseResult.type* %.tmp2151, %m996$.ParseResult.type** %res.2152
%.tmp2153 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2139, i32 0, i32 0
%.tmp2154 = load %m313$.Token.type*, %m313$.Token.type** %.tmp2153
%.tmp2155 = getelementptr %m313$.Token.type, %m313$.Token.type* %.tmp2154, i32 0, i32 0
%.tmp2156 = load i8*, i8** %.tmp2155
%.tmp2158 = getelementptr [4 x i8], [4 x i8]*@.str2157, i32 0, i32 0
%.tmp2159 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2156, i8* %.tmp2158)
%.tmp2160 = icmp ne i32 %.tmp2159, 0
%.tmp2161 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.2152
%.tmp2162 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2161, i32 0, i32 0
%.tmp2163 = load %m312$.Error.type*, %m312$.Error.type** %.tmp2162
%.tmp2164 = icmp eq %m312$.Error.type* %.tmp2163, null
%.tmp2165 = and i1 %.tmp2160, %.tmp2164
br i1 %.tmp2165, label %.if.true.2166, label %.if.false.2166
.if.true.2166:
%.tmp2167 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.2152
%.tmp2168 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2167, i32 0, i32 0
%.tmp2169 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2139, i32 0, i32 0
%.tmp2170 = load %m313$.Token.type*, %m313$.Token.type** %.tmp2169
%.tmp2172 = getelementptr [32 x i8], [32 x i8]*@.str2171, i32 0, i32 0
%.tmp2173 = call %m312$.Error.type*(%m313$.Token.type*,i8*) @m312$from.m312$.Error.typep.m313$.Token.typep.cp(%m313$.Token.type* %.tmp2170, i8* %.tmp2172)
store %m312$.Error.type* %.tmp2173, %m312$.Error.type** %.tmp2168
%.tmp2174 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.2152
%.tmp2175 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2174, i32 0, i32 0
%.tmp2176 = load %m312$.Error.type*, %m312$.Error.type** %.tmp2175
%.tmp2177 = getelementptr %m312$.Error.type, %m312$.Error.type* %.tmp2176, i32 0, i32 0
%.tmp2178 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2139, i32 0, i32 3
%.tmp2179 = load i32, i32* %.tmp2178
store i32 %.tmp2179, i32* %.tmp2177
%.tmp2180 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.2152
%.tmp2181 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp2180, i32 0, i32 0
%.tmp2182 = load %m312$.Error.type*, %m312$.Error.type** %.tmp2181
%.tmp2183 = getelementptr %m312$.Error.type, %m312$.Error.type* %.tmp2182, i32 0, i32 1
%.tmp2184 = getelementptr %m996$.AstContext.type, %m996$.AstContext.type* %c.2139, i32 0, i32 4
%.tmp2185 = load i32, i32* %.tmp2184
store i32 %.tmp2185, i32* %.tmp2183
br label %.if.end.2166
.if.false.2166:
br label %.if.end.2166
.if.end.2166:
%.tmp2186 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %res.2152
ret %m996$.ParseResult.type* %.tmp2186
}
define %m996$.Node.type* @m996$find_tag.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.root.arg, i8* %.tag.arg) {
%root = alloca %m996$.Node.type*
store %m996$.Node.type* %.root.arg, %m996$.Node.type** %root
%tag = alloca i8*
store i8* %.tag.arg, i8** %tag
%.tmp2187 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp2188 = icmp eq %m996$.Node.type* %.tmp2187, null
br i1 %.tmp2188, label %.if.true.2189, label %.if.false.2189
.if.true.2189:
%.tmp2190 = bitcast ptr null to %m996$.Node.type*
ret %m996$.Node.type* %.tmp2190
br label %.if.end.2189
.if.false.2189:
br label %.if.end.2189
.if.end.2189:
%.tmp2191 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp2192 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2191, i32 0, i32 6
%.tmp2193 = load i8*, i8** %.tmp2192
%.tmp2194 = load i8*, i8** %tag
%.tmp2195 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2193, i8* %.tmp2194)
%.tmp2196 = icmp eq i32 %.tmp2195, 0
br i1 %.tmp2196, label %.if.true.2197, label %.if.false.2197
.if.true.2197:
%.tmp2198 = load %m996$.Node.type*, %m996$.Node.type** %root
ret %m996$.Node.type* %.tmp2198
br label %.if.end.2197
.if.false.2197:
br label %.if.end.2197
.if.end.2197:
%.tmp2200 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp2201 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2200, i32 0, i32 9
%.tmp2202 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2201
%n.2203 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp2202, %m996$.Node.type** %n.2203
br label %.for.start.2199
.for.start.2199:
%.tmp2204 = load %m996$.Node.type*, %m996$.Node.type** %n.2203
%.tmp2205 = icmp ne %m996$.Node.type* %.tmp2204, null
br i1 %.tmp2205, label %.for.continue.2199, label %.for.end.2199
.for.continue.2199:
%.tmp2206 = load %m996$.Node.type*, %m996$.Node.type** %n.2203
%.tmp2207 = load i8*, i8** %tag
%.tmp2208 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m996$find_tag.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp2206, i8* %.tmp2207)
%node.2209 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp2208, %m996$.Node.type** %node.2209
%.tmp2210 = load %m996$.Node.type*, %m996$.Node.type** %node.2209
%.tmp2211 = icmp ne %m996$.Node.type* %.tmp2210, null
br i1 %.tmp2211, label %.if.true.2212, label %.if.false.2212
.if.true.2212:
%.tmp2213 = load %m996$.Node.type*, %m996$.Node.type** %node.2209
ret %m996$.Node.type* %.tmp2213
br label %.if.end.2212
.if.false.2212:
br label %.if.end.2212
.if.end.2212:
%.tmp2214 = load %m996$.Node.type*, %m996$.Node.type** %n.2203
%.tmp2215 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2214, i32 0, i32 9
%.tmp2216 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2215
store %m996$.Node.type* %.tmp2216, %m996$.Node.type** %n.2203
br label %.for.start.2199
.for.end.2199:
%.tmp2218 = load %m996$.Node.type*, %m996$.Node.type** %root
%.tmp2219 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2218, i32 0, i32 8
%.tmp2220 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2219
%n.2221 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp2220, %m996$.Node.type** %n.2221
br label %.for.start.2217
.for.start.2217:
%.tmp2222 = load %m996$.Node.type*, %m996$.Node.type** %n.2221
%.tmp2223 = icmp ne %m996$.Node.type* %.tmp2222, null
br i1 %.tmp2223, label %.for.continue.2217, label %.for.end.2217
.for.continue.2217:
%.tmp2224 = load %m996$.Node.type*, %m996$.Node.type** %n.2221
%.tmp2225 = load i8*, i8** %tag
%.tmp2226 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m996$find_tag.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp2224, i8* %.tmp2225)
%node.2227 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp2226, %m996$.Node.type** %node.2227
%.tmp2228 = load %m996$.Node.type*, %m996$.Node.type** %node.2227
%.tmp2229 = icmp ne %m996$.Node.type* %.tmp2228, null
br i1 %.tmp2229, label %.if.true.2230, label %.if.false.2230
.if.true.2230:
%.tmp2231 = load %m996$.Node.type*, %m996$.Node.type** %node.2227
ret %m996$.Node.type* %.tmp2231
br label %.if.end.2230
.if.false.2230:
br label %.if.end.2230
.if.end.2230:
%.tmp2232 = load %m996$.Node.type*, %m996$.Node.type** %n.2221
%.tmp2233 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2232, i32 0, i32 9
%.tmp2234 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2233
store %m996$.Node.type* %.tmp2234, %m996$.Node.type** %n.2221
br label %.for.start.2217
.for.end.2217:
%.tmp2235 = bitcast ptr null to %m996$.Node.type*
ret %m996$.Node.type* %.tmp2235
}
define i8* @m2236$node_to_string.cp.m996$.Node.typep(%m996$.Node.type* %.n.arg) {
%n = alloca %m996$.Node.type*
store %m996$.Node.type* %.n.arg, %m996$.Node.type** %n
%.tmp2237 = call %m0$.File.type*() @tmpfile()
%tmp.2238 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2237, %m0$.File.type** %tmp.2238
%.tmp2239 = load %m996$.Node.type*, %m996$.Node.type** %n
%.tmp2240 = load %m0$.File.type*, %m0$.File.type** %tmp.2238
call void(%m996$.Node.type*,%m0$.File.type*,i32) @m2236$_node_to_string.v.m996$.Node.typep.m0$.File.typep.i(%m996$.Node.type* %.tmp2239, %m0$.File.type* %.tmp2240, i32 1)
%.tmp2241 = load %m0$.File.type*, %m0$.File.type** %tmp.2238
%.tmp2242 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp2241)
%.tmp2243 = load %m0$.File.type*, %m0$.File.type** %tmp.2238
%.tmp2244 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp2243)
%str_len.2245 = alloca i32
store i32 %.tmp2244, i32* %str_len.2245
%.tmp2246 = load %m0$.File.type*, %m0$.File.type** %tmp.2238
%.tmp2247 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp2246)
%tmp_fd.2248 = alloca i32
store i32 %.tmp2247, i32* %tmp_fd.2248
%.tmp2249 = load i32, i32* %tmp_fd.2248
%.tmp2250 = load i32, i32* @SEEK_SET
%.tmp2251 = call i32(i32,i32,i32) @lseek(i32 %.tmp2249, i32 0, i32 %.tmp2250)
%.tmp2252 = load i32, i32* %str_len.2245
%.tmp2253 = call i8*(i32) @malloc(i32 %.tmp2252)
%buf.2254 = alloca i8*
store i8* %.tmp2253, i8** %buf.2254
%.tmp2255 = load i32, i32* %tmp_fd.2248
%.tmp2256 = load i8*, i8** %buf.2254
%.tmp2257 = load i32, i32* %str_len.2245
%.tmp2258 = call i32(i32,i8*,i32) @read(i32 %.tmp2255, i8* %.tmp2256, i32 %.tmp2257)
%read.2259 = alloca i32
store i32 %.tmp2258, i32* %read.2259
%.tmp2260 = load i32, i32* %read.2259
%.tmp2261 = load i32, i32* %str_len.2245
%.tmp2262 = icmp ne i32 %.tmp2260, %.tmp2261
br i1 %.tmp2262, label %.if.true.2263, label %.if.false.2263
.if.true.2263:
%.tmp2264 = load i8*, i8** %buf.2254
call void(i8*) @free(i8* %.tmp2264)
store i8* null, i8** %buf.2254
br label %.if.end.2263
.if.false.2263:
br label %.if.end.2263
.if.end.2263:
%.tmp2265 = load i8*, i8** %buf.2254
ret i8* %.tmp2265
}
define void @m2236$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp2266 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2268 = getelementptr [2 x i8], [2 x i8]*@.str2267, i32 0, i32 0
%.tmp2269 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2266, i8* %.tmp2268)
%i.2271 = alloca i32
store i32 0, i32* %i.2271
br label %.for.start.2270
.for.start.2270:
%.tmp2272 = load i32, i32* %i.2271
%.tmp2273 = load i32, i32* %indent
%.tmp2274 = icmp slt i32 %.tmp2272, %.tmp2273
br i1 %.tmp2274, label %.for.continue.2270, label %.for.end.2270
.for.continue.2270:
%.tmp2275 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2277 = getelementptr [3 x i8], [3 x i8]*@.str2276, i32 0, i32 0
%.tmp2278 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2275, i8* %.tmp2277)
%.tmp2279 = load i32, i32* %i.2271
%.tmp2280 = add i32 %.tmp2279, 1
store i32 %.tmp2280, i32* %i.2271
br label %.for.start.2270
.for.end.2270:
ret void
}
define void @m2236$_node_to_string.v.m996$.Node.typep.m0$.File.typep.i(%m996$.Node.type* %.node.arg, %m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%node = alloca %m996$.Node.type*
store %m996$.Node.type* %.node.arg, %m996$.Node.type** %node
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp2281 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2282 = icmp eq %m996$.Node.type* %.tmp2281, null
br i1 %.tmp2282, label %.if.true.2283, label %.if.false.2283
.if.true.2283:
%.tmp2284 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2286 = getelementptr [7 x i8], [7 x i8]*@.str2285, i32 0, i32 0
%.tmp2287 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2284, i8* %.tmp2286)
ret void
br label %.if.end.2283
.if.false.2283:
br label %.if.end.2283
.if.end.2283:
%.tmp2288 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2290 = getelementptr [2 x i8], [2 x i8]*@.str2289, i32 0, i32 0
%.tmp2291 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2288, i8* %.tmp2290)
%.tmp2292 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2293 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2236$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2292, i32 %.tmp2293)
%.tmp2294 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2296 = getelementptr [13 x i8], [13 x i8]*@.str2295, i32 0, i32 0
%.tmp2297 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2298 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2297, i32 0, i32 0
%.tmp2299 = load i8*, i8** %.tmp2298
%.tmp2300 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2294, i8* %.tmp2296, i8* %.tmp2299)
%.tmp2301 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2302 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2236$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2301, i32 %.tmp2302)
%.tmp2303 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2305 = getelementptr [12 x i8], [12 x i8]*@.str2304, i32 0, i32 0
%.tmp2306 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2307 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2306, i32 0, i32 1
%.tmp2308 = load i8*, i8** %.tmp2307
%.tmp2309 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2303, i8* %.tmp2305, i8* %.tmp2308)
%.tmp2310 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2311 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2236$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2310, i32 %.tmp2311)
%.tmp2312 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2314 = getelementptr [11 x i8], [11 x i8]*@.str2313, i32 0, i32 0
%.tmp2315 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2316 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2315, i32 0, i32 3
%.tmp2317 = load i32, i32* %.tmp2316
%.tmp2318 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2312, i8* %.tmp2314, i32 %.tmp2317)
%.tmp2319 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2320 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2236$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2319, i32 %.tmp2320)
%.tmp2321 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2323 = getelementptr [19 x i8], [19 x i8]*@.str2322, i32 0, i32 0
%.tmp2324 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2325 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2324, i32 0, i32 4
%.tmp2326 = load i32, i32* %.tmp2325
%.tmp2327 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2321, i8* %.tmp2323, i32 %.tmp2326)
%.tmp2328 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2329 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2236$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2328, i32 %.tmp2329)
%.tmp2330 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2332 = getelementptr [9 x i8], [9 x i8]*@.str2331, i32 0, i32 0
%.tmp2333 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2330, i8* %.tmp2332)
%.tmp2334 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2335 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2334, i32 0, i32 9
%.tmp2336 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2335
%.tmp2337 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2338 = load i32, i32* %indent
%.tmp2339 = add i32 %.tmp2338, 1
call void(%m996$.Node.type*,%m0$.File.type*,i32) @m2236$_node_to_string.v.m996$.Node.typep.m0$.File.typep.i(%m996$.Node.type* %.tmp2336, %m0$.File.type* %.tmp2337, i32 %.tmp2339)
%.tmp2340 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2341 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m2236$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2340, i32 %.tmp2341)
%.tmp2342 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2344 = getelementptr [13 x i8], [13 x i8]*@.str2343, i32 0, i32 0
%.tmp2345 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2342, i8* %.tmp2344)
%.tmp2346 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp2347 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2346, i32 0, i32 8
%.tmp2348 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2347
%.tmp2349 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2350 = load i32, i32* %indent
%.tmp2351 = add i32 %.tmp2350, 1
call void(%m996$.Node.type*,%m0$.File.type*,i32) @m2236$_node_to_string.v.m996$.Node.typep.m0$.File.typep.i(%m996$.Node.type* %.tmp2348, %m0$.File.type* %.tmp2349, i32 %.tmp2351)
%.tmp2352 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2353 = load i32, i32* %indent
%.tmp2354 = sub i32 %.tmp2353, 1
call void(%m0$.File.type*,i32) @m2236$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp2352, i32 %.tmp2354)
%.tmp2355 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp2357 = getelementptr [2 x i8], [2 x i8]*@.str2356, i32 0, i32 0
%.tmp2358 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2355, i8* %.tmp2357)
ret void
}
define i8* @m2359$grammar.cp() {
%.tmp2361 = getelementptr [1959 x i8], [1959 x i8]*@.str2360, i32 0, i32 0
ret i8* %.tmp2361
}
define i8* @m2362$append_tmpl.cp() {
%.tmp2364 = getelementptr [1885 x i8], [1885 x i8]*@.str2363, i32 0, i32 0
ret i8* %.tmp2364
}
define i8* @m2365$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp2366 = load i8*, i8** %text
%.tmp2367 = call i32(i8*) @strlen(i8* %.tmp2366)
%str_len.2368 = alloca i32
store i32 %.tmp2367, i32* %str_len.2368
%.tmp2370 = getelementptr [1 x i8], [1 x i8]*@.str2369, i32 0, i32 0
%buf.2371 = alloca i8*
store i8* %.tmp2370, i8** %buf.2371
%i.2373 = alloca i32
store i32 1, i32* %i.2373
br label %.for.start.2372
.for.start.2372:
%.tmp2374 = load i32, i32* %i.2373
%.tmp2375 = load i32, i32* %str_len.2368
%.tmp2376 = sub i32 %.tmp2375, 1
%.tmp2377 = icmp slt i32 %.tmp2374, %.tmp2376
br i1 %.tmp2377, label %.for.continue.2372, label %.for.end.2372
.for.continue.2372:
%.tmp2378 = load i32, i32* %i.2373
%.tmp2379 = load i8*, i8** %text
%.tmp2380 = getelementptr i8, i8* %.tmp2379, i32 %.tmp2378
%.tmp2381 = load i8, i8* %.tmp2380
%.tmp2382 = icmp eq i8 %.tmp2381, 34
br i1 %.tmp2382, label %.if.true.2383, label %.if.false.2383
.if.true.2383:
%.tmp2384 = getelementptr i8*, i8** %buf.2371, i32 0
%.tmp2386 = getelementptr [6 x i8], [6 x i8]*@.str2385, i32 0, i32 0
%.tmp2387 = load i8*, i8** %buf.2371
%.tmp2388 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2384, i8* %.tmp2386, i8* %.tmp2387)
br label %.if.end.2383
.if.false.2383:
%.tmp2389 = load i32, i32* %i.2373
%.tmp2390 = load i8*, i8** %text
%.tmp2391 = getelementptr i8, i8* %.tmp2390, i32 %.tmp2389
%.tmp2392 = load i8, i8* %.tmp2391
%.tmp2393 = icmp eq i8 %.tmp2392, 92
br i1 %.tmp2393, label %.if.true.2394, label %.if.false.2394
.if.true.2394:
%.tmp2395 = load i32, i32* %i.2373
%.tmp2396 = add i32 %.tmp2395, 1
%.tmp2397 = load i8*, i8** %text
%.tmp2398 = getelementptr i8, i8* %.tmp2397, i32 %.tmp2396
%.tmp2399 = load i8, i8* %.tmp2398
%.tmp2400 = icmp eq i8 %.tmp2399, 110
%.tmp2401 = load i32, i32* %i.2373
%.tmp2402 = add i32 %.tmp2401, 1
%.tmp2403 = load i8*, i8** %text
%.tmp2404 = getelementptr i8, i8* %.tmp2403, i32 %.tmp2402
%.tmp2405 = load i8, i8* %.tmp2404
%.tmp2406 = icmp eq i8 %.tmp2405, 78
%.tmp2407 = or i1 %.tmp2400, %.tmp2406
br i1 %.tmp2407, label %.if.true.2408, label %.if.false.2408
.if.true.2408:
%.tmp2409 = getelementptr i8*, i8** %buf.2371, i32 0
%.tmp2411 = getelementptr [6 x i8], [6 x i8]*@.str2410, i32 0, i32 0
%.tmp2412 = load i8*, i8** %buf.2371
%.tmp2413 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2409, i8* %.tmp2411, i8* %.tmp2412)
%.tmp2414 = load i32, i32* %i.2373
%.tmp2415 = add i32 %.tmp2414, 1
store i32 %.tmp2415, i32* %i.2373
br label %.if.end.2408
.if.false.2408:
%.tmp2416 = load i32, i32* %i.2373
%.tmp2417 = add i32 %.tmp2416, 1
%.tmp2418 = load i8*, i8** %text
%.tmp2419 = getelementptr i8, i8* %.tmp2418, i32 %.tmp2417
%.tmp2420 = load i8, i8* %.tmp2419
%.tmp2421 = icmp eq i8 %.tmp2420, 92
br i1 %.tmp2421, label %.if.true.2422, label %.if.false.2422
.if.true.2422:
%.tmp2423 = getelementptr i8*, i8** %buf.2371, i32 0
%.tmp2425 = getelementptr [6 x i8], [6 x i8]*@.str2424, i32 0, i32 0
%.tmp2426 = load i8*, i8** %buf.2371
%.tmp2427 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2423, i8* %.tmp2425, i8* %.tmp2426)
%.tmp2428 = load i32, i32* %i.2373
%.tmp2429 = add i32 %.tmp2428, 1
store i32 %.tmp2429, i32* %i.2373
br label %.if.end.2422
.if.false.2422:
%.tmp2430 = load i32, i32* %i.2373
%.tmp2431 = add i32 %.tmp2430, 1
%.tmp2432 = load i8*, i8** %text
%.tmp2433 = getelementptr i8, i8* %.tmp2432, i32 %.tmp2431
%.tmp2434 = load i8, i8* %.tmp2433
%.tmp2435 = icmp eq i8 %.tmp2434, 120
br i1 %.tmp2435, label %.if.true.2436, label %.if.false.2436
.if.true.2436:
%.tmp2437 = load i32, i32* %i.2373
%.tmp2438 = add i32 %.tmp2437, 2
store i32 %.tmp2438, i32* %i.2373
%.tmp2439 = getelementptr i8*, i8** %buf.2371, i32 0
%.tmp2441 = getelementptr [8 x i8], [8 x i8]*@.str2440, i32 0, i32 0
%.tmp2442 = load i8*, i8** %buf.2371
%.tmp2443 = load i32, i32* %i.2373
%.tmp2444 = load i8*, i8** %text
%.tmp2445 = getelementptr i8, i8* %.tmp2444, i32 %.tmp2443
%.tmp2446 = load i8, i8* %.tmp2445
%.tmp2447 = call i8(i8) @toupper(i8 %.tmp2446)
%.tmp2448 = load i32, i32* %i.2373
%.tmp2449 = add i32 %.tmp2448, 1
%.tmp2450 = load i8*, i8** %text
%.tmp2451 = getelementptr i8, i8* %.tmp2450, i32 %.tmp2449
%.tmp2452 = load i8, i8* %.tmp2451
%.tmp2453 = call i8(i8) @toupper(i8 %.tmp2452)
%.tmp2454 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2439, i8* %.tmp2441, i8* %.tmp2442, i8 %.tmp2447, i8 %.tmp2453)
%.tmp2455 = load i32, i32* %i.2373
%.tmp2456 = add i32 %.tmp2455, 1
store i32 %.tmp2456, i32* %i.2373
br label %.if.end.2436
.if.false.2436:
%.tmp2457 = getelementptr i8*, i8** %buf.2371, i32 0
%.tmp2459 = getelementptr [5 x i8], [5 x i8]*@.str2458, i32 0, i32 0
%.tmp2460 = load i8*, i8** %buf.2371
%.tmp2461 = load i32, i32* %i.2373
%.tmp2462 = load i8*, i8** %text
%.tmp2463 = getelementptr i8, i8* %.tmp2462, i32 %.tmp2461
%.tmp2464 = load i8, i8* %.tmp2463
%.tmp2465 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2457, i8* %.tmp2459, i8* %.tmp2460, i8 %.tmp2464)
br label %.if.end.2436
.if.end.2436:
br label %.if.end.2422
.if.end.2422:
br label %.if.end.2408
.if.end.2408:
br label %.if.end.2394
.if.false.2394:
%.tmp2466 = getelementptr i8*, i8** %buf.2371, i32 0
%.tmp2468 = getelementptr [5 x i8], [5 x i8]*@.str2467, i32 0, i32 0
%.tmp2469 = load i8*, i8** %buf.2371
%.tmp2470 = load i32, i32* %i.2373
%.tmp2471 = load i8*, i8** %text
%.tmp2472 = getelementptr i8, i8* %.tmp2471, i32 %.tmp2470
%.tmp2473 = load i8, i8* %.tmp2472
%.tmp2474 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2466, i8* %.tmp2468, i8* %.tmp2469, i8 %.tmp2473)
br label %.if.end.2394
.if.end.2394:
br label %.if.end.2383
.if.end.2383:
%.tmp2475 = load i32, i32* %i.2373
%.tmp2476 = add i32 %.tmp2475, 1
store i32 %.tmp2476, i32* %i.2373
br label %.for.start.2372
.for.end.2372:
%.tmp2477 = getelementptr i8*, i8** %buf.2371, i32 0
%.tmp2479 = getelementptr [9 x i8], [9 x i8]*@.str2478, i32 0, i32 0
%.tmp2480 = load i8*, i8** %buf.2371
%.tmp2481 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2477, i8* %.tmp2479, i8* %.tmp2480)
%.tmp2482 = load i8*, i8** %buf.2371
ret i8* %.tmp2482
}
define i32 @m2365$llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len.2483 = alloca i32
store i32 0, i32* %len.2483
%i.2485 = alloca i32
store i32 2, i32* %i.2485
br label %.for.start.2484
.for.start.2484:
%.tmp2486 = load i32, i32* %i.2485
%.tmp2487 = load i8*, i8** %text
%.tmp2488 = getelementptr i8, i8* %.tmp2487, i32 %.tmp2486
%.tmp2489 = load i8, i8* %.tmp2488
%.tmp2490 = icmp ne i8 %.tmp2489, 0
br i1 %.tmp2490, label %.for.continue.2484, label %.for.end.2484
.for.continue.2484:
%.tmp2491 = load i32, i32* %i.2485
%.tmp2492 = load i8*, i8** %text
%.tmp2493 = getelementptr i8, i8* %.tmp2492, i32 %.tmp2491
%.tmp2494 = load i8, i8* %.tmp2493
%.tmp2495 = icmp eq i8 %.tmp2494, 92
br i1 %.tmp2495, label %.if.true.2496, label %.if.false.2496
.if.true.2496:
%.tmp2497 = load i32, i32* %i.2485
%.tmp2498 = add i32 %.tmp2497, 2
store i32 %.tmp2498, i32* %i.2485
br label %.if.end.2496
.if.false.2496:
br label %.if.end.2496
.if.end.2496:
%.tmp2499 = load i32, i32* %len.2483
%.tmp2500 = add i32 %.tmp2499, 1
store i32 %.tmp2500, i32* %len.2483
%.tmp2501 = load i32, i32* %i.2485
%.tmp2502 = add i32 %.tmp2501, 1
store i32 %.tmp2502, i32* %i.2485
br label %.for.start.2484
.for.end.2484:
%.tmp2503 = load i32, i32* %len.2483
%.tmp2504 = sub i32 %.tmp2503, 1
ret i32 %.tmp2504
}
define i8* @m2365$chr_to_llvm.cp.cp(i8* %.chr_repr.arg) {
%chr_repr = alloca i8*
store i8* %.chr_repr.arg, i8** %chr_repr
%intval.2505 = alloca i32
store i32 0, i32* %intval.2505
%buf.2506 = alloca i8*
store i8* null, i8** %buf.2506
%chrval.2507 = alloca i8
store i8 0, i8* %chrval.2507
%.tmp2508 = load i8*, i8** %chr_repr
%.tmp2509 = call i32(i8*) @strlen(i8* %.tmp2508)
%chr_len.2510 = alloca i32
store i32 %.tmp2509, i32* %chr_len.2510
%.tmp2511 = load i32, i32* %chr_len.2510
%.tmp2512 = icmp eq i32 %.tmp2511, 6
br i1 %.tmp2512, label %.if.true.2513, label %.if.false.2513
.if.true.2513:
%.tmp2514 = load i8*, i8** %chr_repr
%.tmp2516 = getelementptr [7 x i8], [7 x i8]*@.str2515, i32 0, i32 0
%.tmp2517 = getelementptr i32, i32* %intval.2505, i32 0
%.tmp2518 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2514, i8* %.tmp2516, i32* %.tmp2517)
%.tmp2519 = getelementptr i8*, i8** %buf.2506, i32 0
%.tmp2521 = getelementptr [3 x i8], [3 x i8]*@.str2520, i32 0, i32 0
%.tmp2522 = load i32, i32* %intval.2505
%.tmp2523 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2519, i8* %.tmp2521, i32 %.tmp2522)
br label %.if.end.2513
.if.false.2513:
%.tmp2524 = load i32, i32* %chr_len.2510
%.tmp2525 = icmp eq i32 %.tmp2524, 5
br i1 %.tmp2525, label %.if.true.2526, label %.if.false.2526
.if.true.2526:
%.tmp2527 = load i8*, i8** %chr_repr
%.tmp2529 = getelementptr [6 x i8], [6 x i8]*@.str2528, i32 0, i32 0
%.tmp2530 = getelementptr i32, i32* %intval.2505, i32 0
%.tmp2531 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2527, i8* %.tmp2529, i32* %.tmp2530)
%.tmp2532 = getelementptr i8*, i8** %buf.2506, i32 0
%.tmp2534 = getelementptr [3 x i8], [3 x i8]*@.str2533, i32 0, i32 0
%.tmp2535 = load i32, i32* %intval.2505
%.tmp2536 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2532, i8* %.tmp2534, i32 %.tmp2535)
br label %.if.end.2526
.if.false.2526:
%.tmp2537 = load i32, i32* %chr_len.2510
%.tmp2538 = icmp eq i32 %.tmp2537, 4
br i1 %.tmp2538, label %.if.true.2539, label %.if.false.2539
.if.true.2539:
%.tmp2540 = load i8*, i8** %chr_repr
%.tmp2542 = getelementptr [6 x i8], [6 x i8]*@.str2541, i32 0, i32 0
%.tmp2543 = getelementptr i8, i8* %chrval.2507, i32 0
%.tmp2544 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2540, i8* %.tmp2542, i8* %.tmp2543)
%.tmp2545 = load i8, i8* %chrval.2507
%.tmp2546 = icmp eq i8 %.tmp2545, 110
br i1 %.tmp2546, label %.if.true.2547, label %.if.false.2547
.if.true.2547:
%.tmp2549 = getelementptr [3 x i8], [3 x i8]*@.str2548, i32 0, i32 0
store i8* %.tmp2549, i8** %buf.2506
br label %.if.end.2547
.if.false.2547:
%.tmp2550 = bitcast ptr null to i8*
ret i8* %.tmp2550
br label %.if.end.2547
.if.end.2547:
br label %.if.end.2539
.if.false.2539:
%.tmp2551 = load i32, i32* %chr_len.2510
%.tmp2552 = icmp eq i32 %.tmp2551, 3
br i1 %.tmp2552, label %.if.true.2553, label %.if.false.2553
.if.true.2553:
%.tmp2554 = load i8*, i8** %chr_repr
%.tmp2556 = getelementptr [5 x i8], [5 x i8]*@.str2555, i32 0, i32 0
%.tmp2557 = getelementptr i32, i32* %intval.2505, i32 0
%.tmp2558 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp2554, i8* %.tmp2556, i32* %.tmp2557)
%.tmp2559 = getelementptr i8*, i8** %buf.2506, i32 0
%.tmp2561 = getelementptr [3 x i8], [3 x i8]*@.str2560, i32 0, i32 0
%.tmp2562 = load i32, i32* %intval.2505
%.tmp2563 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2559, i8* %.tmp2561, i32 %.tmp2562)
br label %.if.end.2553
.if.false.2553:
%.tmp2564 = bitcast ptr null to i8*
ret i8* %.tmp2564
br label %.if.end.2553
.if.end.2553:
br label %.if.end.2539
.if.end.2539:
br label %.if.end.2526
.if.end.2526:
br label %.if.end.2513
.if.end.2513:
%.tmp2565 = load i8*, i8** %buf.2506
ret i8* %.tmp2565
}
%m2566$.SYStack.type = type {%m996$.Node.type*,%m2566$.SYStack.type*}
@SYStack_size = constant i32 16
define %m2566$.SYStack.type* @m2566$stack_new.m2566$.SYStack.typep() {
%.tmp2567 = load i32, i32* @SYStack_size
%.tmp2568 = call i8*(i32) @malloc(i32 %.tmp2567)
%.tmp2569 = bitcast i8* %.tmp2568 to %m2566$.SYStack.type*
%s.2570 = alloca %m2566$.SYStack.type*
store %m2566$.SYStack.type* %.tmp2569, %m2566$.SYStack.type** %s.2570
%.tmp2571 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %s.2570
%.tmp2572 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp2571, i32 0, i32 0
store %m996$.Node.type* null, %m996$.Node.type** %.tmp2572
%.tmp2573 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %s.2570
%.tmp2574 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp2573, i32 0, i32 1
store %m2566$.SYStack.type* null, %m2566$.SYStack.type** %.tmp2574
%.tmp2575 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %s.2570
ret %m2566$.SYStack.type* %.tmp2575
}
define %m2566$.SYStack.type* @m2566$sy_algorithm.m2566$.SYStack.typep.m996$.Node.typep(%m996$.Node.type* %.assignable.arg) {
%assignable = alloca %m996$.Node.type*
store %m996$.Node.type* %.assignable.arg, %m996$.Node.type** %assignable
%.tmp2576 = call %m2566$.SYStack.type*() @m2566$stack_new.m2566$.SYStack.typep()
%out_stack.2577 = alloca %m2566$.SYStack.type*
store %m2566$.SYStack.type* %.tmp2576, %m2566$.SYStack.type** %out_stack.2577
%.tmp2578 = call %m2566$.SYStack.type*() @m2566$stack_new.m2566$.SYStack.typep()
%op_stack.2579 = alloca %m2566$.SYStack.type*
store %m2566$.SYStack.type* %.tmp2578, %m2566$.SYStack.type** %op_stack.2579
%.tmp2580 = call %m2566$.SYStack.type*() @m2566$stack_new.m2566$.SYStack.typep()
%token_stack.2581 = alloca %m2566$.SYStack.type*
store %m2566$.SYStack.type* %.tmp2580, %m2566$.SYStack.type** %token_stack.2581
%ptr.2582 = alloca %m996$.Node.type*
store %m996$.Node.type* null, %m996$.Node.type** %ptr.2582
%.tmp2584 = load %m996$.Node.type*, %m996$.Node.type** %assignable
store %m996$.Node.type* %.tmp2584, %m996$.Node.type** %ptr.2582
br label %.for.start.2583
.for.start.2583:
%.tmp2585 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2582
%.tmp2586 = icmp ne %m996$.Node.type* %.tmp2585, null
br i1 %.tmp2586, label %.for.continue.2583, label %.for.end.2583
.for.continue.2583:
%.tmp2587 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %token_stack.2581
%.tmp2588 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2582
%.tmp2589 = call %m2566$.SYStack.type*(%m2566$.SYStack.type*,%m996$.Node.type*) @m2566$stack_push.m2566$.SYStack.typep.m2566$.SYStack.typep.m996$.Node.typep(%m2566$.SYStack.type* %.tmp2587, %m996$.Node.type* %.tmp2588)
store %m2566$.SYStack.type* %.tmp2589, %m2566$.SYStack.type** %token_stack.2581
%.tmp2590 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2582
%.tmp2591 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2590, i32 0, i32 9
%.tmp2592 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2591
store %m996$.Node.type* %.tmp2592, %m996$.Node.type** %ptr.2582
br label %.for.start.2583
.for.end.2583:
%.tmp2594 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %token_stack.2581
%.tmp2595 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp2594, i32 0, i32 0
%.tmp2596 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2595
store %m996$.Node.type* %.tmp2596, %m996$.Node.type** %ptr.2582
br label %.for.start.2593
.for.start.2593:
%.tmp2597 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2582
%.tmp2598 = icmp ne %m996$.Node.type* %.tmp2597, null
br i1 %.tmp2598, label %.for.continue.2593, label %.for.end.2593
.for.continue.2593:
%.tmp2599 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %token_stack.2581
%cs.2600 = alloca %m2566$.SYStack.type*
store %m2566$.SYStack.type* %.tmp2599, %m2566$.SYStack.type** %cs.2600
%.tmp2601 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %token_stack.2581
%.tmp2602 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp2601, i32 0, i32 1
%.tmp2603 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %.tmp2602
store %m2566$.SYStack.type* %.tmp2603, %m2566$.SYStack.type** %token_stack.2581
%.tmp2604 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %cs.2600
%.tmp2605 = bitcast %m2566$.SYStack.type* %.tmp2604 to i8*
call void(i8*) @free(i8* %.tmp2605)
%.tmp2606 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2582
%.tmp2607 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2606, i32 0, i32 0
%.tmp2608 = load i8*, i8** %.tmp2607
%.tmp2610 = getelementptr [16 x i8], [16 x i8]*@.str2609, i32 0, i32 0
%.tmp2611 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2608, i8* %.tmp2610)
%.tmp2612 = icmp eq i32 %.tmp2611, 0
br i1 %.tmp2612, label %.if.true.2613, label %.if.false.2613
.if.true.2613:
%.tmp2614 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %out_stack.2577
%.tmp2615 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2582
%.tmp2616 = call %m2566$.SYStack.type*(%m2566$.SYStack.type*,%m996$.Node.type*) @m2566$stack_push.m2566$.SYStack.typep.m2566$.SYStack.typep.m996$.Node.typep(%m2566$.SYStack.type* %.tmp2614, %m996$.Node.type* %.tmp2615)
store %m2566$.SYStack.type* %.tmp2616, %m2566$.SYStack.type** %out_stack.2577
br label %.if.end.2613
.if.false.2613:
%.tmp2617 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2582
%.tmp2618 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2617, i32 0, i32 0
%.tmp2619 = load i8*, i8** %.tmp2618
%.tmp2621 = getelementptr [9 x i8], [9 x i8]*@.str2620, i32 0, i32 0
%.tmp2622 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2619, i8* %.tmp2621)
%.tmp2623 = icmp eq i32 %.tmp2622, 0
br i1 %.tmp2623, label %.if.true.2624, label %.if.false.2624
.if.true.2624:
%quit.2625 = alloca i1
store i1 0, i1* %quit.2625
br label %.for.start.2626
.for.start.2626:
%.tmp2627 = load i1, i1* %quit.2625
%.tmp2628 = icmp eq i1 %.tmp2627, 0
br i1 %.tmp2628, label %.for.continue.2626, label %.for.end.2626
.for.continue.2626:
%.tmp2629 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %op_stack.2579
%.tmp2630 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp2629, i32 0, i32 0
%.tmp2631 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2630
%.tmp2632 = icmp eq %m996$.Node.type* %.tmp2631, null
br i1 %.tmp2632, label %.if.true.2633, label %.if.false.2633
.if.true.2633:
store i1 1, i1* %quit.2625
br label %.if.end.2633
.if.false.2633:
%.tmp2634 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %op_stack.2579
%.tmp2635 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp2634, i32 0, i32 0
%.tmp2636 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2635
%.tmp2637 = call i32(%m996$.Node.type*) @m2566$op_precedence.i.m996$.Node.typep(%m996$.Node.type* %.tmp2636)
%.tmp2638 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2582
%.tmp2639 = call i32(%m996$.Node.type*) @m2566$op_precedence.i.m996$.Node.typep(%m996$.Node.type* %.tmp2638)
%.tmp2640 = icmp slt i32 %.tmp2637, %.tmp2639
br i1 %.tmp2640, label %.if.true.2641, label %.if.false.2641
.if.true.2641:
%.tmp2642 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %op_stack.2579
%top.2643 = alloca %m2566$.SYStack.type*
store %m2566$.SYStack.type* %.tmp2642, %m2566$.SYStack.type** %top.2643
%.tmp2644 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %op_stack.2579
%.tmp2645 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp2644, i32 0, i32 1
%.tmp2646 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %.tmp2645
store %m2566$.SYStack.type* %.tmp2646, %m2566$.SYStack.type** %op_stack.2579
%.tmp2647 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %out_stack.2577
%.tmp2648 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %top.2643
%.tmp2649 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp2648, i32 0, i32 0
%.tmp2650 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2649
%.tmp2651 = call %m2566$.SYStack.type*(%m2566$.SYStack.type*,%m996$.Node.type*) @m2566$stack_push.m2566$.SYStack.typep.m2566$.SYStack.typep.m996$.Node.typep(%m2566$.SYStack.type* %.tmp2647, %m996$.Node.type* %.tmp2650)
store %m2566$.SYStack.type* %.tmp2651, %m2566$.SYStack.type** %out_stack.2577
%.tmp2652 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %top.2643
%.tmp2653 = bitcast %m2566$.SYStack.type* %.tmp2652 to i8*
call void(i8*) @free(i8* %.tmp2653)
br label %.if.end.2641
.if.false.2641:
store i1 1, i1* %quit.2625
br label %.if.end.2641
.if.end.2641:
br label %.if.end.2633
.if.end.2633:
br label %.for.start.2626
.for.end.2626:
%.tmp2654 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %op_stack.2579
%.tmp2655 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2582
%.tmp2656 = call %m2566$.SYStack.type*(%m2566$.SYStack.type*,%m996$.Node.type*) @m2566$stack_push.m2566$.SYStack.typep.m2566$.SYStack.typep.m996$.Node.typep(%m2566$.SYStack.type* %.tmp2654, %m996$.Node.type* %.tmp2655)
store %m2566$.SYStack.type* %.tmp2656, %m2566$.SYStack.type** %op_stack.2579
br label %.if.end.2624
.if.false.2624:
%.tmp2658 = getelementptr [68 x i8], [68 x i8]*@.str2657, i32 0, i32 0
%.tmp2659 = load %m996$.Node.type*, %m996$.Node.type** %ptr.2582
%.tmp2660 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2659, i32 0, i32 0
%.tmp2661 = load i8*, i8** %.tmp2660
%.tmp2662 = call i32(i8*,...) @printf(i8* %.tmp2658, i8* %.tmp2661)
br label %.if.end.2624
.if.end.2624:
br label %.if.end.2613
.if.end.2613:
%.tmp2663 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %token_stack.2581
%.tmp2664 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp2663, i32 0, i32 0
%.tmp2665 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2664
store %m996$.Node.type* %.tmp2665, %m996$.Node.type** %ptr.2582
br label %.for.start.2593
.for.end.2593:
br label %.for.start.2666
.for.start.2666:
%.tmp2667 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %op_stack.2579
%.tmp2668 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp2667, i32 0, i32 0
%.tmp2669 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2668
%.tmp2670 = icmp ne %m996$.Node.type* %.tmp2669, null
br i1 %.tmp2670, label %.for.continue.2666, label %.for.end.2666
.for.continue.2666:
%.tmp2671 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %op_stack.2579
%.tmp2672 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp2671, i32 0, i32 0
%.tmp2673 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2672
%node.2674 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp2673, %m996$.Node.type** %node.2674
%.tmp2675 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %op_stack.2579
%s.2676 = alloca %m2566$.SYStack.type*
store %m2566$.SYStack.type* %.tmp2675, %m2566$.SYStack.type** %s.2676
%.tmp2677 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %op_stack.2579
%.tmp2678 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp2677, i32 0, i32 1
%.tmp2679 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %.tmp2678
store %m2566$.SYStack.type* %.tmp2679, %m2566$.SYStack.type** %op_stack.2579
%.tmp2680 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %s.2676
%.tmp2681 = bitcast %m2566$.SYStack.type* %.tmp2680 to i8*
call void(i8*) @free(i8* %.tmp2681)
%.tmp2682 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %out_stack.2577
%.tmp2683 = load %m996$.Node.type*, %m996$.Node.type** %node.2674
%.tmp2684 = call %m2566$.SYStack.type*(%m2566$.SYStack.type*,%m996$.Node.type*) @m2566$stack_push.m2566$.SYStack.typep.m2566$.SYStack.typep.m996$.Node.typep(%m2566$.SYStack.type* %.tmp2682, %m996$.Node.type* %.tmp2683)
store %m2566$.SYStack.type* %.tmp2684, %m2566$.SYStack.type** %out_stack.2577
br label %.for.start.2666
.for.end.2666:
%.tmp2685 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %out_stack.2577
ret %m2566$.SYStack.type* %.tmp2685
}
define %m2566$.SYStack.type* @m2566$stack_push.m2566$.SYStack.typep.m2566$.SYStack.typep.m996$.Node.typep(%m2566$.SYStack.type* %.curr_stack.arg, %m996$.Node.type* %.node.arg) {
%curr_stack = alloca %m2566$.SYStack.type*
store %m2566$.SYStack.type* %.curr_stack.arg, %m2566$.SYStack.type** %curr_stack
%node = alloca %m996$.Node.type*
store %m996$.Node.type* %.node.arg, %m996$.Node.type** %node
%.tmp2686 = load i32, i32* @SYStack_size
%.tmp2687 = call i8*(i32) @malloc(i32 %.tmp2686)
%.tmp2688 = bitcast i8* %.tmp2687 to %m2566$.SYStack.type*
%s.2689 = alloca %m2566$.SYStack.type*
store %m2566$.SYStack.type* %.tmp2688, %m2566$.SYStack.type** %s.2689
%.tmp2690 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %s.2689
%.tmp2691 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp2690, i32 0, i32 0
%.tmp2692 = load %m996$.Node.type*, %m996$.Node.type** %node
store %m996$.Node.type* %.tmp2692, %m996$.Node.type** %.tmp2691
%.tmp2693 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %s.2689
%.tmp2694 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp2693, i32 0, i32 1
%.tmp2695 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %curr_stack
store %m2566$.SYStack.type* %.tmp2695, %m2566$.SYStack.type** %.tmp2694
%.tmp2696 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %s.2689
ret %m2566$.SYStack.type* %.tmp2696
}
define i32 @m2566$op_precedence.i.m996$.Node.typep(%m996$.Node.type* %.n.arg) {
%n = alloca %m996$.Node.type*
store %m996$.Node.type* %.n.arg, %m996$.Node.type** %n
%.tmp2697 = load %m996$.Node.type*, %m996$.Node.type** %n
%.tmp2698 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2697, i32 0, i32 8
%.tmp2699 = load %m996$.Node.type*, %m996$.Node.type** %.tmp2698
%op.2700 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp2699, %m996$.Node.type** %op.2700
%.tmp2701 = load %m996$.Node.type*, %m996$.Node.type** %op.2700
%.tmp2702 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2701, i32 0, i32 1
%.tmp2703 = load i8*, i8** %.tmp2702
%.tmp2705 = getelementptr [2 x i8], [2 x i8]*@.str2704, i32 0, i32 0
%.tmp2706 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2703, i8* %.tmp2705)
%.tmp2707 = icmp eq i32 %.tmp2706, 0
%.tmp2708 = load %m996$.Node.type*, %m996$.Node.type** %op.2700
%.tmp2709 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2708, i32 0, i32 1
%.tmp2710 = load i8*, i8** %.tmp2709
%.tmp2712 = getelementptr [2 x i8], [2 x i8]*@.str2711, i32 0, i32 0
%.tmp2713 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2710, i8* %.tmp2712)
%.tmp2714 = icmp eq i32 %.tmp2713, 0
%.tmp2715 = or i1 %.tmp2707, %.tmp2714
br i1 %.tmp2715, label %.if.true.2716, label %.if.false.2716
.if.true.2716:
ret i32 4
br label %.if.end.2716
.if.false.2716:
%.tmp2717 = load %m996$.Node.type*, %m996$.Node.type** %op.2700
%.tmp2718 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2717, i32 0, i32 1
%.tmp2719 = load i8*, i8** %.tmp2718
%.tmp2721 = getelementptr [2 x i8], [2 x i8]*@.str2720, i32 0, i32 0
%.tmp2722 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2719, i8* %.tmp2721)
%.tmp2723 = icmp eq i32 %.tmp2722, 0
%.tmp2724 = load %m996$.Node.type*, %m996$.Node.type** %op.2700
%.tmp2725 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2724, i32 0, i32 1
%.tmp2726 = load i8*, i8** %.tmp2725
%.tmp2728 = getelementptr [2 x i8], [2 x i8]*@.str2727, i32 0, i32 0
%.tmp2729 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2726, i8* %.tmp2728)
%.tmp2730 = icmp eq i32 %.tmp2729, 0
%.tmp2731 = or i1 %.tmp2723, %.tmp2730
%.tmp2732 = load %m996$.Node.type*, %m996$.Node.type** %op.2700
%.tmp2733 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2732, i32 0, i32 1
%.tmp2734 = load i8*, i8** %.tmp2733
%.tmp2736 = getelementptr [2 x i8], [2 x i8]*@.str2735, i32 0, i32 0
%.tmp2737 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2734, i8* %.tmp2736)
%.tmp2738 = icmp eq i32 %.tmp2737, 0
%.tmp2739 = or i1 %.tmp2731, %.tmp2738
br i1 %.tmp2739, label %.if.true.2740, label %.if.false.2740
.if.true.2740:
ret i32 3
br label %.if.end.2740
.if.false.2740:
%.tmp2741 = load %m996$.Node.type*, %m996$.Node.type** %op.2700
%.tmp2742 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2741, i32 0, i32 1
%.tmp2743 = load i8*, i8** %.tmp2742
%.tmp2745 = getelementptr [3 x i8], [3 x i8]*@.str2744, i32 0, i32 0
%.tmp2746 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2743, i8* %.tmp2745)
%.tmp2747 = icmp eq i32 %.tmp2746, 0
%.tmp2748 = load %m996$.Node.type*, %m996$.Node.type** %op.2700
%.tmp2749 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2748, i32 0, i32 1
%.tmp2750 = load i8*, i8** %.tmp2749
%.tmp2752 = getelementptr [3 x i8], [3 x i8]*@.str2751, i32 0, i32 0
%.tmp2753 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2750, i8* %.tmp2752)
%.tmp2754 = icmp eq i32 %.tmp2753, 0
%.tmp2755 = or i1 %.tmp2747, %.tmp2754
br i1 %.tmp2755, label %.if.true.2756, label %.if.false.2756
.if.true.2756:
ret i32 7
br label %.if.end.2756
.if.false.2756:
%.tmp2757 = load %m996$.Node.type*, %m996$.Node.type** %op.2700
%.tmp2758 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2757, i32 0, i32 1
%.tmp2759 = load i8*, i8** %.tmp2758
%.tmp2761 = getelementptr [3 x i8], [3 x i8]*@.str2760, i32 0, i32 0
%.tmp2762 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2759, i8* %.tmp2761)
%.tmp2763 = icmp eq i32 %.tmp2762, 0
%.tmp2764 = load %m996$.Node.type*, %m996$.Node.type** %op.2700
%.tmp2765 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2764, i32 0, i32 1
%.tmp2766 = load i8*, i8** %.tmp2765
%.tmp2768 = getelementptr [3 x i8], [3 x i8]*@.str2767, i32 0, i32 0
%.tmp2769 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2766, i8* %.tmp2768)
%.tmp2770 = icmp eq i32 %.tmp2769, 0
%.tmp2771 = or i1 %.tmp2763, %.tmp2770
br i1 %.tmp2771, label %.if.true.2772, label %.if.false.2772
.if.true.2772:
ret i32 6
br label %.if.end.2772
.if.false.2772:
%.tmp2773 = load %m996$.Node.type*, %m996$.Node.type** %op.2700
%.tmp2774 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2773, i32 0, i32 1
%.tmp2775 = load i8*, i8** %.tmp2774
%.tmp2777 = getelementptr [2 x i8], [2 x i8]*@.str2776, i32 0, i32 0
%.tmp2778 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2775, i8* %.tmp2777)
%.tmp2779 = icmp eq i32 %.tmp2778, 0
%.tmp2780 = load %m996$.Node.type*, %m996$.Node.type** %op.2700
%.tmp2781 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2780, i32 0, i32 1
%.tmp2782 = load i8*, i8** %.tmp2781
%.tmp2784 = getelementptr [2 x i8], [2 x i8]*@.str2783, i32 0, i32 0
%.tmp2785 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2782, i8* %.tmp2784)
%.tmp2786 = icmp eq i32 %.tmp2785, 0
%.tmp2787 = or i1 %.tmp2779, %.tmp2786
br i1 %.tmp2787, label %.if.true.2788, label %.if.false.2788
.if.true.2788:
ret i32 6
br label %.if.end.2788
.if.false.2788:
%.tmp2789 = load %m996$.Node.type*, %m996$.Node.type** %op.2700
%.tmp2790 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2789, i32 0, i32 1
%.tmp2791 = load i8*, i8** %.tmp2790
%.tmp2793 = getelementptr [2 x i8], [2 x i8]*@.str2792, i32 0, i32 0
%.tmp2794 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2791, i8* %.tmp2793)
%.tmp2795 = icmp eq i32 %.tmp2794, 0
br i1 %.tmp2795, label %.if.true.2796, label %.if.false.2796
.if.true.2796:
ret i32 11
br label %.if.end.2796
.if.false.2796:
%.tmp2797 = load %m996$.Node.type*, %m996$.Node.type** %op.2700
%.tmp2798 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2797, i32 0, i32 1
%.tmp2799 = load i8*, i8** %.tmp2798
%.tmp2801 = getelementptr [2 x i8], [2 x i8]*@.str2800, i32 0, i32 0
%.tmp2802 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2799, i8* %.tmp2801)
%.tmp2803 = icmp eq i32 %.tmp2802, 0
br i1 %.tmp2803, label %.if.true.2804, label %.if.false.2804
.if.true.2804:
ret i32 12
br label %.if.end.2804
.if.false.2804:
br label %.if.end.2804
.if.end.2804:
br label %.if.end.2796
.if.end.2796:
br label %.if.end.2788
.if.end.2788:
br label %.if.end.2772
.if.end.2772:
br label %.if.end.2756
.if.end.2756:
br label %.if.end.2740
.if.end.2740:
br label %.if.end.2716
.if.end.2716:
%.tmp2806 = getelementptr [65 x i8], [65 x i8]*@.str2805, i32 0, i32 0
%.tmp2807 = load %m996$.Node.type*, %m996$.Node.type** %op.2700
%.tmp2808 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp2807, i32 0, i32 1
%.tmp2809 = load i8*, i8** %.tmp2808
%.tmp2810 = call i32(i8*,...) @printf(i8* %.tmp2806, i8* %.tmp2809)
ret i32 4
}
%m2811$.Type.type = type {i8*,i8*,i8*,%m2811$.Type.type*,%m2811$.Type.type*}
%m2811$.ErrorList.type = type {%m312$.Error.type*,%m2811$.ErrorList.type*,i1}
%m2811$.AssignableInfo.type = type {i8*,i8,i8*,i8*,%m2811$.Type.type*,i32,i32,i8*}
%m2811$.ScopeItem.type = type {i8*,%m2811$.AssignableInfo.type*,%m2811$.ScopeItem.type*}
%m2811$.Scope.type = type {i8*,%m2811$.ScopeItem.type*,i8*,i8*,i8*,%m2811$.Scope.type*,%m2811$.Type.type*}
%m2811$.GlobalName.type = type {i8*,i8*,i1,i1,%m2811$.AssignableInfo.type*,%m2811$.GlobalName.type*}
%m2811$.ModuleLookup.type = type {i8*,i8*,%m2811$.ModuleLookup.type*,%m2811$.Scope.type*}
%m2811$.AnonFn.type = type {i8*,%m2811$.AnonFn.type*}
%m2811$.CompilerCtx.type = type {%m996$.Node.type*,%m0$.File.type*,%m2811$.ErrorList.type*,%m2811$.GlobalName.type*,%m996$.Rule.type**,i32,%m2811$.ModuleLookup.type*,i8*,%m2811$.AnonFn.type*}
define i8* @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.Type.type* %.type.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%type = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.type.arg, %m2811$.Type.type** %type
%.tmp2813 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2814 = icmp eq %m2811$.Type.type* %.tmp2813, null
br i1 %.tmp2814, label %.if.true.2815, label %.if.false.2815
.if.true.2815:
%.tmp2817 = getelementptr [2 x i8], [2 x i8]*@.str2816, i32 0, i32 0
ret i8* %.tmp2817
br label %.if.end.2815
.if.false.2815:
br label %.if.end.2815
.if.end.2815:
%.tmp2818 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2819 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2818, i32 0, i32 0
%.tmp2820 = load i8*, i8** %.tmp2819
%.tmp2821 = icmp ne i8* %.tmp2820, null
%.tmp2823 = getelementptr [54 x i8], [54 x i8]*@.str2822, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2821, i8* %.tmp2823)
%buf.2824 = alloca i8*
store i8* null, i8** %buf.2824
%.tmp2825 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2826 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2825, i32 0, i32 0
%.tmp2827 = load i8*, i8** %.tmp2826
%.tmp2829 = getelementptr [4 x i8], [4 x i8]*@.str2828, i32 0, i32 0
%.tmp2830 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2827, i8* %.tmp2829)
%.tmp2831 = icmp eq i32 %.tmp2830, 0
br i1 %.tmp2831, label %.if.true.2832, label %.if.false.2832
.if.true.2832:
%.tmp2834 = getelementptr [4 x i8], [4 x i8]*@.str2833, i32 0, i32 0
ret i8* %.tmp2834
br label %.if.end.2832
.if.false.2832:
%.tmp2835 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2836 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2835, i32 0, i32 0
%.tmp2837 = load i8*, i8** %.tmp2836
%.tmp2839 = getelementptr [5 x i8], [5 x i8]*@.str2838, i32 0, i32 0
%.tmp2840 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2837, i8* %.tmp2839)
%.tmp2841 = icmp eq i32 %.tmp2840, 0
br i1 %.tmp2841, label %.if.true.2842, label %.if.false.2842
.if.true.2842:
%.tmp2844 = getelementptr [5 x i8], [5 x i8]*@.str2843, i32 0, i32 0
ret i8* %.tmp2844
br label %.if.end.2842
.if.false.2842:
%.tmp2845 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2846 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2845, i32 0, i32 0
%.tmp2847 = load i8*, i8** %.tmp2846
%.tmp2849 = getelementptr [5 x i8], [5 x i8]*@.str2848, i32 0, i32 0
%.tmp2850 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2847, i8* %.tmp2849)
%.tmp2851 = icmp eq i32 %.tmp2850, 0
br i1 %.tmp2851, label %.if.true.2852, label %.if.false.2852
.if.true.2852:
%.tmp2854 = getelementptr [3 x i8], [3 x i8]*@.str2853, i32 0, i32 0
ret i8* %.tmp2854
br label %.if.end.2852
.if.false.2852:
%.tmp2855 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2856 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2855, i32 0, i32 0
%.tmp2857 = load i8*, i8** %.tmp2856
%.tmp2859 = getelementptr [8 x i8], [8 x i8]*@.str2858, i32 0, i32 0
%.tmp2860 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2857, i8* %.tmp2859)
%.tmp2861 = icmp eq i32 %.tmp2860, 0
br i1 %.tmp2861, label %.if.true.2862, label %.if.false.2862
.if.true.2862:
%.tmp2864 = getelementptr [4 x i8], [4 x i8]*@.str2863, i32 0, i32 0
ret i8* %.tmp2864
br label %.if.end.2862
.if.false.2862:
%.tmp2865 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2866 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2865, i32 0, i32 0
%.tmp2867 = load i8*, i8** %.tmp2866
%.tmp2869 = getelementptr [4 x i8], [4 x i8]*@.str2868, i32 0, i32 0
%.tmp2870 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2867, i8* %.tmp2869)
%.tmp2871 = icmp eq i32 %.tmp2870, 0
br i1 %.tmp2871, label %.if.true.2872, label %.if.false.2872
.if.true.2872:
%.tmp2874 = getelementptr [3 x i8], [3 x i8]*@.str2873, i32 0, i32 0
ret i8* %.tmp2874
br label %.if.end.2872
.if.false.2872:
%.tmp2875 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2876 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2875, i32 0, i32 0
%.tmp2877 = load i8*, i8** %.tmp2876
%.tmp2879 = getelementptr [9 x i8], [9 x i8]*@.str2878, i32 0, i32 0
%.tmp2880 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2877, i8* %.tmp2879)
%.tmp2881 = icmp eq i32 %.tmp2880, 0
br i1 %.tmp2881, label %.if.true.2882, label %.if.false.2882
.if.true.2882:
%.tmp2883 = getelementptr i8*, i8** %buf.2824, i32 0
%.tmp2885 = getelementptr [4 x i8], [4 x i8]*@.str2884, i32 0, i32 0
%.tmp2886 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp2887 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2888 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2887, i32 0, i32 3
%.tmp2889 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp2888
%.tmp2890 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp2886, %m2811$.Type.type* %.tmp2889)
%.tmp2891 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2883, i8* %.tmp2885, i8* %.tmp2890)
%.tmp2893 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2894 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2893, i32 0, i32 3
%.tmp2895 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp2894
%.tmp2896 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2895, i32 0, i32 4
%.tmp2897 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp2896
%p.2898 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp2897, %m2811$.Type.type** %p.2898
br label %.for.start.2892
.for.start.2892:
%.tmp2899 = load %m2811$.Type.type*, %m2811$.Type.type** %p.2898
%.tmp2900 = icmp ne %m2811$.Type.type* %.tmp2899, null
br i1 %.tmp2900, label %.for.continue.2892, label %.for.end.2892
.for.continue.2892:
%.tmp2901 = load %m2811$.Type.type*, %m2811$.Type.type** %p.2898
%.tmp2902 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2903 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2902, i32 0, i32 3
%.tmp2904 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp2903
%.tmp2905 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2904, i32 0, i32 4
%.tmp2906 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp2905
%.tmp2907 = icmp ne %m2811$.Type.type* %.tmp2901, %.tmp2906
br i1 %.tmp2907, label %.if.true.2908, label %.if.false.2908
.if.true.2908:
%.tmp2909 = getelementptr i8*, i8** %buf.2824, i32 0
%.tmp2911 = getelementptr [4 x i8], [4 x i8]*@.str2910, i32 0, i32 0
%.tmp2912 = load i8*, i8** %buf.2824
%.tmp2913 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2909, i8* %.tmp2911, i8* %.tmp2912)
br label %.if.end.2908
.if.false.2908:
br label %.if.end.2908
.if.end.2908:
%.tmp2914 = getelementptr i8*, i8** %buf.2824, i32 0
%.tmp2916 = getelementptr [5 x i8], [5 x i8]*@.str2915, i32 0, i32 0
%.tmp2917 = load i8*, i8** %buf.2824
%.tmp2918 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp2919 = load %m2811$.Type.type*, %m2811$.Type.type** %p.2898
%.tmp2920 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp2918, %m2811$.Type.type* %.tmp2919)
%.tmp2921 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2914, i8* %.tmp2916, i8* %.tmp2917, i8* %.tmp2920)
%.tmp2922 = load %m2811$.Type.type*, %m2811$.Type.type** %p.2898
%.tmp2923 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2922, i32 0, i32 4
%.tmp2924 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp2923
store %m2811$.Type.type* %.tmp2924, %m2811$.Type.type** %p.2898
br label %.for.start.2892
.for.end.2892:
%.tmp2925 = getelementptr i8*, i8** %buf.2824, i32 0
%.tmp2927 = getelementptr [4 x i8], [4 x i8]*@.str2926, i32 0, i32 0
%.tmp2928 = load i8*, i8** %buf.2824
%.tmp2929 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2925, i8* %.tmp2927, i8* %.tmp2928)
%.tmp2930 = load i8*, i8** %buf.2824
ret i8* %.tmp2930
br label %.if.end.2882
.if.false.2882:
%.tmp2931 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2932 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2931, i32 0, i32 0
%.tmp2933 = load i8*, i8** %.tmp2932
%.tmp2935 = getelementptr [4 x i8], [4 x i8]*@.str2934, i32 0, i32 0
%.tmp2936 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2933, i8* %.tmp2935)
%.tmp2937 = icmp eq i32 %.tmp2936, 0
br i1 %.tmp2937, label %.if.true.2938, label %.if.false.2938
.if.true.2938:
%.tmp2939 = getelementptr i8*, i8** %buf.2824, i32 0
%.tmp2941 = getelementptr [4 x i8], [4 x i8]*@.str2940, i32 0, i32 0
%.tmp2942 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp2943 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2944 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2943, i32 0, i32 3
%.tmp2945 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp2944
%.tmp2946 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp2942, %m2811$.Type.type* %.tmp2945)
%.tmp2947 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2939, i8* %.tmp2941, i8* %.tmp2946)
%.tmp2948 = load i8*, i8** %buf.2824
ret i8* %.tmp2948
br label %.if.end.2938
.if.false.2938:
%.tmp2949 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2950 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2949, i32 0, i32 0
%.tmp2951 = load i8*, i8** %.tmp2950
%.tmp2953 = getelementptr [7 x i8], [7 x i8]*@.str2952, i32 0, i32 0
%.tmp2954 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2951, i8* %.tmp2953)
%.tmp2955 = icmp eq i32 %.tmp2954, 0
br i1 %.tmp2955, label %.if.true.2956, label %.if.false.2956
.if.true.2956:
%.tmp2957 = getelementptr i8*, i8** %buf.2824, i32 0
%.tmp2959 = getelementptr [2 x i8], [2 x i8]*@.str2958, i32 0, i32 0
%.tmp2960 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2957, i8* %.tmp2959)
%.tmp2962 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2963 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2962, i32 0, i32 3
%.tmp2964 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp2963
%t.2965 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp2964, %m2811$.Type.type** %t.2965
br label %.for.start.2961
.for.start.2961:
%.tmp2966 = load %m2811$.Type.type*, %m2811$.Type.type** %t.2965
%.tmp2967 = icmp ne %m2811$.Type.type* %.tmp2966, null
br i1 %.tmp2967, label %.for.continue.2961, label %.for.end.2961
.for.continue.2961:
%.tmp2968 = load %m2811$.Type.type*, %m2811$.Type.type** %t.2965
%.tmp2969 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2970 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2969, i32 0, i32 3
%.tmp2971 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp2970
%.tmp2972 = icmp ne %m2811$.Type.type* %.tmp2968, %.tmp2971
br i1 %.tmp2972, label %.if.true.2973, label %.if.false.2973
.if.true.2973:
%.tmp2974 = getelementptr i8*, i8** %buf.2824, i32 0
%.tmp2976 = getelementptr [4 x i8], [4 x i8]*@.str2975, i32 0, i32 0
%.tmp2977 = load i8*, i8** %buf.2824
%.tmp2978 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2974, i8* %.tmp2976, i8* %.tmp2977)
br label %.if.end.2973
.if.false.2973:
br label %.if.end.2973
.if.end.2973:
%.tmp2979 = getelementptr i8*, i8** %buf.2824, i32 0
%.tmp2981 = getelementptr [5 x i8], [5 x i8]*@.str2980, i32 0, i32 0
%.tmp2982 = load i8*, i8** %buf.2824
%.tmp2983 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp2984 = load %m2811$.Type.type*, %m2811$.Type.type** %t.2965
%.tmp2985 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp2983, %m2811$.Type.type* %.tmp2984)
%.tmp2986 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2979, i8* %.tmp2981, i8* %.tmp2982, i8* %.tmp2985)
%.tmp2987 = load %m2811$.Type.type*, %m2811$.Type.type** %t.2965
%.tmp2988 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2987, i32 0, i32 4
%.tmp2989 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp2988
store %m2811$.Type.type* %.tmp2989, %m2811$.Type.type** %t.2965
br label %.for.start.2961
.for.end.2961:
%.tmp2990 = getelementptr i8*, i8** %buf.2824, i32 0
%.tmp2992 = getelementptr [4 x i8], [4 x i8]*@.str2991, i32 0, i32 0
%.tmp2993 = load i8*, i8** %buf.2824
%.tmp2994 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2990, i8* %.tmp2992, i8* %.tmp2993)
%.tmp2995 = load i8*, i8** %buf.2824
ret i8* %.tmp2995
br label %.if.end.2956
.if.false.2956:
%.tmp2996 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp2997 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp2996, i32 0, i32 0
%.tmp2998 = load i8*, i8** %.tmp2997
%.tmp3000 = getelementptr [6 x i8], [6 x i8]*@.str2999, i32 0, i32 0
%.tmp3001 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp2998, i8* %.tmp3000)
%.tmp3002 = icmp eq i32 %.tmp3001, 0
br i1 %.tmp3002, label %.if.true.3003, label %.if.false.3003
.if.true.3003:
%.tmp3004 = getelementptr i8*, i8** %buf.2824, i32 0
%.tmp3006 = getelementptr [10 x i8], [10 x i8]*@.str3005, i32 0, i32 0
%.tmp3007 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp3008 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3007, i32 0, i32 3
%.tmp3009 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3008
%.tmp3010 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3009, i32 0, i32 4
%.tmp3011 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3010
%.tmp3012 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3011, i32 0, i32 0
%.tmp3013 = load i8*, i8** %.tmp3012
%.tmp3014 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3015 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp3016 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3015, i32 0, i32 3
%.tmp3017 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3016
%.tmp3018 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp3014, %m2811$.Type.type* %.tmp3017)
%.tmp3019 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3004, i8* %.tmp3006, i8* %.tmp3013, i8* %.tmp3018)
%.tmp3020 = load i8*, i8** %buf.2824
ret i8* %.tmp3020
br label %.if.end.3003
.if.false.3003:
%.tmp3021 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp3022 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3021, i32 0, i32 0
%.tmp3023 = load i8*, i8** %.tmp3022
%.tmp3025 = getelementptr [10 x i8], [10 x i8]*@.str3024, i32 0, i32 0
%.tmp3026 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3023, i8* %.tmp3025)
%.tmp3027 = icmp eq i32 %.tmp3026, 0
br i1 %.tmp3027, label %.if.true.3028, label %.if.false.3028
.if.true.3028:
%.tmp3029 = getelementptr i8*, i8** %buf.2824, i32 0
%.tmp3031 = getelementptr [5 x i8], [5 x i8]*@.str3030, i32 0, i32 0
%.tmp3032 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp3033 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3032, i32 0, i32 2
%.tmp3034 = load i8*, i8** %.tmp3033
%.tmp3035 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3029, i8* %.tmp3031, i8* %.tmp3034)
%.tmp3036 = load i8*, i8** %buf.2824
ret i8* %.tmp3036
br label %.if.end.3028
.if.false.3028:
%.tmp3037 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp3038 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3037, i32 0, i32 0
%.tmp3039 = load i8*, i8** %.tmp3038
%.tmp3041 = getelementptr [7 x i8], [7 x i8]*@.str3040, i32 0, i32 0
%.tmp3042 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3039, i8* %.tmp3041)
%.tmp3043 = icmp eq i32 %.tmp3042, 0
br i1 %.tmp3043, label %.if.true.3044, label %.if.false.3044
.if.true.3044:
%.tmp3046 = getelementptr [4 x i8], [4 x i8]*@.str3045, i32 0, i32 0
ret i8* %.tmp3046
br label %.if.end.3044
.if.false.3044:
%.tmp3047 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp3048 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3047, i32 0, i32 0
%.tmp3049 = load i8*, i8** %.tmp3048
%.tmp3051 = getelementptr [6 x i8], [6 x i8]*@.str3050, i32 0, i32 0
%.tmp3052 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3049, i8* %.tmp3051)
%.tmp3053 = icmp eq i32 %.tmp3052, 0
br i1 %.tmp3053, label %.if.true.3054, label %.if.false.3054
.if.true.3054:
br label %.if.end.3054
.if.false.3054:
%.tmp3056 = getelementptr [53 x i8], [53 x i8]*@.str3055, i32 0, i32 0
%.tmp3057 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp3058 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3057, i32 0, i32 0
%.tmp3059 = load i8*, i8** %.tmp3058
%.tmp3060 = call i32(i8*,...) @printf(i8* %.tmp3056, i8* %.tmp3059)
br label %.if.end.3054
.if.end.3054:
br label %.if.end.3044
.if.end.3044:
br label %.if.end.3028
.if.end.3028:
br label %.if.end.3003
.if.end.3003:
br label %.if.end.2956
.if.end.2956:
br label %.if.end.2938
.if.end.2938:
br label %.if.end.2882
.if.end.2882:
br label %.if.end.2872
.if.end.2872:
br label %.if.end.2862
.if.end.2862:
br label %.if.end.2852
.if.end.2852:
br label %.if.end.2842
.if.end.2842:
br label %.if.end.2832
.if.end.2832:
%.tmp3061 = bitcast ptr null to i8*
ret i8* %.tmp3061
}
define i1 @m2812$cmp.b.m2811$.CompilerCtx.typep.m2811$.Type.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.Type.type* %.a.arg, %m2811$.Type.type* %.b.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%a = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.a.arg, %m2811$.Type.type** %a
%b = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.b.arg, %m2811$.Type.type** %b
%.tmp3062 = load %m2811$.Type.type*, %m2811$.Type.type** %a
%.tmp3063 = icmp eq %m2811$.Type.type* %.tmp3062, null
%.tmp3064 = load %m2811$.Type.type*, %m2811$.Type.type** %b
%.tmp3065 = icmp eq %m2811$.Type.type* %.tmp3064, null
%.tmp3066 = or i1 %.tmp3063, %.tmp3065
br i1 %.tmp3066, label %.if.true.3067, label %.if.false.3067
.if.true.3067:
ret i1 0
br label %.if.end.3067
.if.false.3067:
br label %.if.end.3067
.if.end.3067:
%.tmp3068 = load %m2811$.Type.type*, %m2811$.Type.type** %a
%.tmp3069 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3068, i32 0, i32 0
%.tmp3070 = load i8*, i8** %.tmp3069
%.tmp3072 = getelementptr [8 x i8], [8 x i8]*@.str3071, i32 0, i32 0
%.tmp3073 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3070, i8* %.tmp3072)
%.tmp3074 = icmp eq i32 %.tmp3073, 0
%.tmp3075 = load %m2811$.Type.type*, %m2811$.Type.type** %b
%.tmp3076 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3075, i32 0, i32 0
%.tmp3077 = load i8*, i8** %.tmp3076
%.tmp3079 = getelementptr [8 x i8], [8 x i8]*@.str3078, i32 0, i32 0
%.tmp3080 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3077, i8* %.tmp3079)
%.tmp3081 = icmp eq i32 %.tmp3080, 0
%.tmp3082 = or i1 %.tmp3074, %.tmp3081
br i1 %.tmp3082, label %.if.true.3083, label %.if.false.3083
.if.true.3083:
%.tmp3084 = load %m2811$.Type.type*, %m2811$.Type.type** %a
%.tmp3085 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3084, i32 0, i32 0
%.tmp3086 = load i8*, i8** %.tmp3085
%.tmp3088 = getelementptr [4 x i8], [4 x i8]*@.str3087, i32 0, i32 0
%.tmp3089 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3086, i8* %.tmp3088)
%.tmp3090 = icmp eq i32 %.tmp3089, 0
%.tmp3091 = load %m2811$.Type.type*, %m2811$.Type.type** %b
%.tmp3092 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3091, i32 0, i32 0
%.tmp3093 = load i8*, i8** %.tmp3092
%.tmp3095 = getelementptr [4 x i8], [4 x i8]*@.str3094, i32 0, i32 0
%.tmp3096 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3093, i8* %.tmp3095)
%.tmp3097 = icmp eq i32 %.tmp3096, 0
%.tmp3098 = or i1 %.tmp3090, %.tmp3097
ret i1 %.tmp3098
br label %.if.end.3083
.if.false.3083:
br label %.if.end.3083
.if.end.3083:
%.tmp3099 = load %m2811$.Type.type*, %m2811$.Type.type** %a
%.tmp3100 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3099, i32 0, i32 0
%.tmp3101 = load i8*, i8** %.tmp3100
%.tmp3103 = getelementptr [10 x i8], [10 x i8]*@.str3102, i32 0, i32 0
%.tmp3104 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3101, i8* %.tmp3103)
%.tmp3105 = icmp eq i32 %.tmp3104, 0
br i1 %.tmp3105, label %.if.true.3106, label %.if.false.3106
.if.true.3106:
%.tmp3107 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3108 = load %m2811$.Type.type*, %m2811$.Type.type** %a
%.tmp3109 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3108, i32 0, i32 3
%.tmp3110 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3109
%.tmp3111 = load %m2811$.Type.type*, %m2811$.Type.type** %b
%.tmp3112 = call i1(%m2811$.CompilerCtx.type*,%m2811$.Type.type*,%m2811$.Type.type*) @m2812$cmp.b.m2811$.CompilerCtx.typep.m2811$.Type.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp3107, %m2811$.Type.type* %.tmp3110, %m2811$.Type.type* %.tmp3111)
ret i1 %.tmp3112
br label %.if.end.3106
.if.false.3106:
br label %.if.end.3106
.if.end.3106:
%.tmp3113 = load %m2811$.Type.type*, %m2811$.Type.type** %b
%.tmp3114 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3113, i32 0, i32 0
%.tmp3115 = load i8*, i8** %.tmp3114
%.tmp3117 = getelementptr [10 x i8], [10 x i8]*@.str3116, i32 0, i32 0
%.tmp3118 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3115, i8* %.tmp3117)
%.tmp3119 = icmp eq i32 %.tmp3118, 0
br i1 %.tmp3119, label %.if.true.3120, label %.if.false.3120
.if.true.3120:
%.tmp3121 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3122 = load %m2811$.Type.type*, %m2811$.Type.type** %a
%.tmp3123 = load %m2811$.Type.type*, %m2811$.Type.type** %b
%.tmp3124 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3123, i32 0, i32 3
%.tmp3125 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3124
%.tmp3126 = call i1(%m2811$.CompilerCtx.type*,%m2811$.Type.type*,%m2811$.Type.type*) @m2812$cmp.b.m2811$.CompilerCtx.typep.m2811$.Type.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp3121, %m2811$.Type.type* %.tmp3122, %m2811$.Type.type* %.tmp3125)
ret i1 %.tmp3126
br label %.if.end.3120
.if.false.3120:
br label %.if.end.3120
.if.end.3120:
%.tmp3127 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3128 = load %m2811$.Type.type*, %m2811$.Type.type** %a
%.tmp3129 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp3127, %m2811$.Type.type* %.tmp3128)
%a_repr.3130 = alloca i8*
store i8* %.tmp3129, i8** %a_repr.3130
%.tmp3131 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3132 = load %m2811$.Type.type*, %m2811$.Type.type** %b
%.tmp3133 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp3131, %m2811$.Type.type* %.tmp3132)
%b_repr.3134 = alloca i8*
store i8* %.tmp3133, i8** %b_repr.3134
%.tmp3135 = load i8*, i8** %a_repr.3130
%.tmp3136 = load i8*, i8** %b_repr.3134
%.tmp3137 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3135, i8* %.tmp3136)
%.tmp3138 = icmp eq i32 %.tmp3137, 0
ret i1 %.tmp3138
}
@DEBUG_INTERNALS = constant i1 0
define %m2811$.Type.type* @m311$type_clone.m2811$.Type.typep.m2811$.Type.typep(%m2811$.Type.type* %.t.arg) {
%t = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.t.arg, %m2811$.Type.type** %t
%.tmp3139 = load %m2811$.Type.type*, %m2811$.Type.type** %t
%.tmp3140 = icmp eq %m2811$.Type.type* %.tmp3139, null
br i1 %.tmp3140, label %.if.true.3141, label %.if.false.3141
.if.true.3141:
%.tmp3142 = bitcast ptr null to %m2811$.Type.type*
ret %m2811$.Type.type* %.tmp3142
br label %.if.end.3141
.if.false.3141:
br label %.if.end.3141
.if.end.3141:
%.tmp3143 = getelementptr %m2811$.Type.type, %m2811$.Type.type* null, i32 1
%.tmp3144 = ptrtoint %m2811$.Type.type* %.tmp3143 to i32
%.tmp3145 = call i8*(i32) @malloc(i32 %.tmp3144)
%.tmp3146 = bitcast i8* %.tmp3145 to %m2811$.Type.type*
%clone.3147 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp3146, %m2811$.Type.type** %clone.3147
%.tmp3148 = load %m2811$.Type.type*, %m2811$.Type.type** %clone.3147
%.tmp3149 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3148, i32 0, i32 3
%.tmp3150 = load %m2811$.Type.type*, %m2811$.Type.type** %t
%.tmp3151 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3150, i32 0, i32 3
%.tmp3152 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3151
store %m2811$.Type.type* %.tmp3152, %m2811$.Type.type** %.tmp3149
%.tmp3153 = load %m2811$.Type.type*, %m2811$.Type.type** %clone.3147
%.tmp3154 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3153, i32 0, i32 4
%.tmp3155 = load %m2811$.Type.type*, %m2811$.Type.type** %t
%.tmp3156 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3155, i32 0, i32 4
%.tmp3157 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3156
%.tmp3158 = call %m2811$.Type.type*(%m2811$.Type.type*) @m311$type_clone.m2811$.Type.typep.m2811$.Type.typep(%m2811$.Type.type* %.tmp3157)
store %m2811$.Type.type* %.tmp3158, %m2811$.Type.type** %.tmp3154
%.tmp3159 = load %m2811$.Type.type*, %m2811$.Type.type** %clone.3147
%.tmp3160 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3159, i32 0, i32 2
%.tmp3161 = load %m2811$.Type.type*, %m2811$.Type.type** %t
%.tmp3162 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3161, i32 0, i32 2
%.tmp3163 = load i8*, i8** %.tmp3162
store i8* %.tmp3163, i8** %.tmp3160
%.tmp3164 = load %m2811$.Type.type*, %m2811$.Type.type** %clone.3147
%.tmp3165 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3164, i32 0, i32 0
%.tmp3166 = load %m2811$.Type.type*, %m2811$.Type.type** %t
%.tmp3167 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3166, i32 0, i32 0
%.tmp3168 = load i8*, i8** %.tmp3167
store i8* %.tmp3168, i8** %.tmp3165
%.tmp3169 = load %m2811$.Type.type*, %m2811$.Type.type** %clone.3147
%.tmp3170 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3169, i32 0, i32 1
%.tmp3171 = load %m2811$.Type.type*, %m2811$.Type.type** %t
%.tmp3172 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3171, i32 0, i32 1
%.tmp3173 = load i8*, i8** %.tmp3172
store i8* %.tmp3173, i8** %.tmp3170
%.tmp3174 = load %m2811$.Type.type*, %m2811$.Type.type** %clone.3147
ret %m2811$.Type.type* %.tmp3174
}
define i8* @m311$get_root.cp() {
%.tmp3176 = getelementptr [12 x i8], [12 x i8]*@.str3175, i32 0, i32 0
%.tmp3177 = call i8*(i8*) @getenv(i8* %.tmp3176)
%project_root.3178 = alloca i8*
store i8* %.tmp3177, i8** %project_root.3178
%.tmp3179 = load i8*, i8** %project_root.3178
%.tmp3180 = icmp eq i8* %.tmp3179, null
br i1 %.tmp3180, label %.if.true.3181, label %.if.false.3181
.if.true.3181:
%.tmp3183 = getelementptr [5 x i8], [5 x i8]*@.str3182, i32 0, i32 0
%.tmp3184 = call i8*(i8*) @getenv(i8* %.tmp3183)
%home.3185 = alloca i8*
store i8* %.tmp3184, i8** %home.3185
%.tmp3186 = getelementptr i8*, i8** %project_root.3178, i32 0
%.tmp3188 = getelementptr [11 x i8], [11 x i8]*@.str3187, i32 0, i32 0
%.tmp3189 = load i8*, i8** %home.3185
%.tmp3190 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3186, i8* %.tmp3188, i8* %.tmp3189)
br label %.if.end.3181
.if.false.3181:
br label %.if.end.3181
.if.end.3181:
%.tmp3191 = load i8*, i8** %project_root.3178
ret i8* %.tmp3191
}
define %m2811$.Type.type* @m311$new_type.m2811$.Type.typep() {
%.tmp3192 = getelementptr %m2811$.Type.type, %m2811$.Type.type* null, i32 1
%.tmp3193 = ptrtoint %m2811$.Type.type* %.tmp3192 to i32
%.tmp3194 = call i8*(i32) @malloc(i32 %.tmp3193)
%.tmp3195 = bitcast i8* %.tmp3194 to %m2811$.Type.type*
%type.3196 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp3195, %m2811$.Type.type** %type.3196
%.tmp3197 = load %m2811$.Type.type*, %m2811$.Type.type** %type.3196
%.tmp3198 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3197, i32 0, i32 1
store i8* null, i8** %.tmp3198
%.tmp3199 = load %m2811$.Type.type*, %m2811$.Type.type** %type.3196
%.tmp3200 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3199, i32 0, i32 2
store i8* null, i8** %.tmp3200
%.tmp3201 = load %m2811$.Type.type*, %m2811$.Type.type** %type.3196
%.tmp3202 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3201, i32 0, i32 0
store i8* null, i8** %.tmp3202
%.tmp3203 = load %m2811$.Type.type*, %m2811$.Type.type** %type.3196
%.tmp3204 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3203, i32 0, i32 3
store %m2811$.Type.type* null, %m2811$.Type.type** %.tmp3204
%.tmp3205 = load %m2811$.Type.type*, %m2811$.Type.type** %type.3196
%.tmp3206 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3205, i32 0, i32 4
store %m2811$.Type.type* null, %m2811$.Type.type** %.tmp3206
%.tmp3207 = load %m2811$.Type.type*, %m2811$.Type.type** %type.3196
ret %m2811$.Type.type* %.tmp3207
}
define void @m311$copy_type.v.m2811$.Type.typep.m2811$.Type.typep(%m2811$.Type.type* %.dest.arg, %m2811$.Type.type* %.src.arg) {
%dest = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.dest.arg, %m2811$.Type.type** %dest
%src = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.src.arg, %m2811$.Type.type** %src
%.tmp3208 = load %m2811$.Type.type*, %m2811$.Type.type** %dest
%.tmp3209 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3208, i32 0, i32 0
%.tmp3210 = load %m2811$.Type.type*, %m2811$.Type.type** %src
%.tmp3211 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3210, i32 0, i32 0
%.tmp3212 = load i8*, i8** %.tmp3211
store i8* %.tmp3212, i8** %.tmp3209
%.tmp3213 = load %m2811$.Type.type*, %m2811$.Type.type** %dest
%.tmp3214 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3213, i32 0, i32 1
%.tmp3215 = load %m2811$.Type.type*, %m2811$.Type.type** %src
%.tmp3216 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3215, i32 0, i32 1
%.tmp3217 = load i8*, i8** %.tmp3216
store i8* %.tmp3217, i8** %.tmp3214
%.tmp3218 = load %m2811$.Type.type*, %m2811$.Type.type** %dest
%.tmp3219 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3218, i32 0, i32 2
%.tmp3220 = load %m2811$.Type.type*, %m2811$.Type.type** %src
%.tmp3221 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3220, i32 0, i32 2
%.tmp3222 = load i8*, i8** %.tmp3221
store i8* %.tmp3222, i8** %.tmp3219
%.tmp3223 = load %m2811$.Type.type*, %m2811$.Type.type** %dest
%.tmp3224 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3223, i32 0, i32 3
%.tmp3225 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3224
%.tmp3226 = load %m2811$.Type.type*, %m2811$.Type.type** %src
%.tmp3227 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3226, i32 0, i32 3
%.tmp3228 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3227
%.tmp3229 = icmp ne %m2811$.Type.type* %.tmp3225, %.tmp3228
br i1 %.tmp3229, label %.if.true.3230, label %.if.false.3230
.if.true.3230:
%.tmp3231 = load %m2811$.Type.type*, %m2811$.Type.type** %dest
%.tmp3232 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3231, i32 0, i32 3
%.tmp3233 = load %m2811$.Type.type*, %m2811$.Type.type** %src
%.tmp3234 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3233, i32 0, i32 3
%.tmp3235 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3234
store %m2811$.Type.type* %.tmp3235, %m2811$.Type.type** %.tmp3232
%.tmp3236 = load %m2811$.Type.type*, %m2811$.Type.type** %dest
%.tmp3237 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3236, i32 0, i32 3
%.tmp3238 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3237
%.tmp3239 = load %m2811$.Type.type*, %m2811$.Type.type** %src
%.tmp3240 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3239, i32 0, i32 3
%.tmp3241 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3240
call void(%m2811$.Type.type*,%m2811$.Type.type*) @m311$copy_type.v.m2811$.Type.typep.m2811$.Type.typep(%m2811$.Type.type* %.tmp3238, %m2811$.Type.type* %.tmp3241)
br label %.if.end.3230
.if.false.3230:
br label %.if.end.3230
.if.end.3230:
%.tmp3242 = load %m2811$.Type.type*, %m2811$.Type.type** %dest
%.tmp3243 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3242, i32 0, i32 4
%.tmp3244 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3243
%.tmp3245 = load %m2811$.Type.type*, %m2811$.Type.type** %src
%.tmp3246 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3245, i32 0, i32 4
%.tmp3247 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3246
%.tmp3248 = icmp ne %m2811$.Type.type* %.tmp3244, %.tmp3247
br i1 %.tmp3248, label %.if.true.3249, label %.if.false.3249
.if.true.3249:
%.tmp3250 = load %m2811$.Type.type*, %m2811$.Type.type** %dest
%.tmp3251 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3250, i32 0, i32 4
%.tmp3252 = load %m2811$.Type.type*, %m2811$.Type.type** %src
%.tmp3253 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3252, i32 0, i32 4
%.tmp3254 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3253
store %m2811$.Type.type* %.tmp3254, %m2811$.Type.type** %.tmp3251
%.tmp3255 = load %m2811$.Type.type*, %m2811$.Type.type** %dest
%.tmp3256 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3255, i32 0, i32 4
%.tmp3257 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3256
%.tmp3258 = load %m2811$.Type.type*, %m2811$.Type.type** %src
%.tmp3259 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3258, i32 0, i32 4
%.tmp3260 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3259
call void(%m2811$.Type.type*,%m2811$.Type.type*) @m311$copy_type.v.m2811$.Type.typep.m2811$.Type.typep(%m2811$.Type.type* %.tmp3257, %m2811$.Type.type* %.tmp3260)
br label %.if.end.3249
.if.false.3249:
br label %.if.end.3249
.if.end.3249:
ret void
}
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m2811$.AssignableInfo.type* @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.node.arg) {
%node = alloca %m996$.Node.type*
store %m996$.Node.type* %.node.arg, %m996$.Node.type** %node
%.tmp3261 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* null, i32 1
%.tmp3262 = ptrtoint %m2811$.AssignableInfo.type* %.tmp3261 to i32
%.tmp3263 = call i8*(i32) @malloc(i32 %.tmp3262)
%.tmp3264 = bitcast i8* %.tmp3263 to %m2811$.AssignableInfo.type*
%ptr.3265 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp3264, %m2811$.AssignableInfo.type** %ptr.3265
%.tmp3266 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %ptr.3265
%.tmp3267 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3266, i32 0, i32 1
%.tmp3268 = load i8, i8* @SCOPE_CONST
store i8 %.tmp3268, i8* %.tmp3267
%.tmp3269 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %ptr.3265
%.tmp3270 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3269, i32 0, i32 0
store i8* null, i8** %.tmp3270
%.tmp3271 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %ptr.3265
%.tmp3272 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3271, i32 0, i32 3
store i8* null, i8** %.tmp3272
%.tmp3273 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %ptr.3265
%.tmp3274 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3273, i32 0, i32 2
%.tmp3276 = getelementptr [1 x i8], [1 x i8]*@.str3275, i32 0, i32 0
store i8* %.tmp3276, i8** %.tmp3274
%.tmp3277 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %ptr.3265
%.tmp3278 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3277, i32 0, i32 4
store %m2811$.Type.type* null, %m2811$.Type.type** %.tmp3278
%.tmp3279 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp3280 = icmp ne %m996$.Node.type* %.tmp3279, null
br i1 %.tmp3280, label %.if.true.3281, label %.if.false.3281
.if.true.3281:
%.tmp3282 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %ptr.3265
%.tmp3283 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3282, i32 0, i32 5
%.tmp3284 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp3285 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3284, i32 0, i32 3
%.tmp3286 = load i32, i32* %.tmp3285
store i32 %.tmp3286, i32* %.tmp3283
%.tmp3287 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %ptr.3265
%.tmp3288 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3287, i32 0, i32 6
%.tmp3289 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp3290 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3289, i32 0, i32 4
%.tmp3291 = load i32, i32* %.tmp3290
store i32 %.tmp3291, i32* %.tmp3288
%.tmp3292 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %ptr.3265
%.tmp3293 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3292, i32 0, i32 7
%.tmp3294 = load %m996$.Node.type*, %m996$.Node.type** %node
%.tmp3295 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3294, i32 0, i32 2
%.tmp3296 = load i8*, i8** %.tmp3295
store i8* %.tmp3296, i8** %.tmp3293
br label %.if.end.3281
.if.false.3281:
%.tmp3297 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %ptr.3265
%.tmp3298 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3297, i32 0, i32 5
store i32 0, i32* %.tmp3298
%.tmp3299 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %ptr.3265
%.tmp3300 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3299, i32 0, i32 6
store i32 0, i32* %.tmp3300
%.tmp3301 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %ptr.3265
%.tmp3302 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3301, i32 0, i32 7
store i8* null, i8** %.tmp3302
br label %.if.end.3281
.if.end.3281:
%.tmp3303 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %ptr.3265
ret %m2811$.AssignableInfo.type* %.tmp3303
}
define void @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.info.arg, %m2811$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp3304 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp3305 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3304, i32 0, i32 0
%.tmp3306 = load i8*, i8** %id
store i8* %.tmp3306, i8** %.tmp3305
%.tmp3307 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp3308 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3307, i32 0, i32 1
%.tmp3309 = load i8, i8* %scope
store i8 %.tmp3309, i8* %.tmp3308
ret void
}
define i8* @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.info.arg) {
%info = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.info.arg, %m2811$.AssignableInfo.type** %info
%.tmp3310 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp3311 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3310, i32 0, i32 1
%.tmp3312 = load i8, i8* %.tmp3311
%.tmp3313 = load i8, i8* @SCOPE_CONST
%.tmp3314 = icmp eq i8 %.tmp3312, %.tmp3313
br i1 %.tmp3314, label %.if.true.3315, label %.if.false.3315
.if.true.3315:
%.tmp3316 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp3317 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3316, i32 0, i32 0
%.tmp3318 = load i8*, i8** %.tmp3317
ret i8* %.tmp3318
br label %.if.end.3315
.if.false.3315:
br label %.if.end.3315
.if.end.3315:
%.tmp3320 = getelementptr [1 x i8], [1 x i8]*@.str3319, i32 0, i32 0
%buf.3321 = alloca i8*
store i8* %.tmp3320, i8** %buf.3321
%.tmp3322 = getelementptr i8*, i8** %buf.3321, i32 0
%.tmp3324 = getelementptr [5 x i8], [5 x i8]*@.str3323, i32 0, i32 0
%.tmp3325 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp3326 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3325, i32 0, i32 1
%.tmp3327 = load i8, i8* %.tmp3326
%.tmp3328 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp3329 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3328, i32 0, i32 0
%.tmp3330 = load i8*, i8** %.tmp3329
%.tmp3331 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3322, i8* %.tmp3324, i8 %.tmp3327, i8* %.tmp3330)
%.tmp3332 = load i8*, i8** %buf.3321
ret i8* %.tmp3332
}
define void @m311$set_assignable_tmp_id.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%info = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.info.arg, %m2811$.AssignableInfo.type** %info
%.tmp3334 = getelementptr [1 x i8], [1 x i8]*@.str3333, i32 0, i32 0
%tmp_buff.3335 = alloca i8*
store i8* %.tmp3334, i8** %tmp_buff.3335
%.tmp3336 = getelementptr i8*, i8** %tmp_buff.3335, i32 0
%.tmp3338 = getelementptr [7 x i8], [7 x i8]*@.str3337, i32 0, i32 0
%.tmp3339 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3340 = call i32(%m2811$.CompilerCtx.type*) @m311$new_uid.i.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp3339)
%.tmp3341 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3336, i8* %.tmp3338, i32 %.tmp3340)
%.tmp3342 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp3343 = load i8, i8* @SCOPE_LOCAL
%.tmp3344 = load i8*, i8** %tmp_buff.3335
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp3342, i8 %.tmp3343, i8* %.tmp3344)
ret void
}
define %m2811$.ModuleLookup.type* @m311$get_module.m2811$.ModuleLookup.typep.m2811$.CompilerCtx.typep.cp(%m2811$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp3346 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3347 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3346, i32 0, i32 6
%.tmp3348 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %.tmp3347
%m.3349 = alloca %m2811$.ModuleLookup.type*
store %m2811$.ModuleLookup.type* %.tmp3348, %m2811$.ModuleLookup.type** %m.3349
br label %.for.start.3345
.for.start.3345:
%.tmp3350 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.3349
%.tmp3351 = icmp ne %m2811$.ModuleLookup.type* %.tmp3350, null
br i1 %.tmp3351, label %.for.continue.3345, label %.for.end.3345
.for.continue.3345:
%.tmp3352 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.3349
%.tmp3353 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp3352, i32 0, i32 0
%.tmp3354 = load i8*, i8** %.tmp3353
%.tmp3355 = load i8*, i8** %filename
%.tmp3356 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3354, i8* %.tmp3355)
%.tmp3357 = icmp eq i32 %.tmp3356, 0
br i1 %.tmp3357, label %.if.true.3358, label %.if.false.3358
.if.true.3358:
%.tmp3359 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.3349
ret %m2811$.ModuleLookup.type* %.tmp3359
br label %.if.end.3358
.if.false.3358:
br label %.if.end.3358
.if.end.3358:
%.tmp3360 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.3349
%.tmp3361 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp3360, i32 0, i32 2
%.tmp3362 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %.tmp3361
store %m2811$.ModuleLookup.type* %.tmp3362, %m2811$.ModuleLookup.type** %m.3349
br label %.for.start.3345
.for.end.3345:
%.tmp3363 = bitcast ptr null to %m2811$.ModuleLookup.type*
ret %m2811$.ModuleLookup.type* %.tmp3363
}
define %m2811$.ModuleLookup.type* @m311$get_current_module.m2811$.ModuleLookup.typep.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%.tmp3364 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3365 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3366 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3365, i32 0, i32 7
%.tmp3367 = load i8*, i8** %.tmp3366
%.tmp3368 = call %m2811$.ModuleLookup.type*(%m2811$.CompilerCtx.type*,i8*) @m311$get_module.m2811$.ModuleLookup.typep.m2811$.CompilerCtx.typep.cp(%m2811$.CompilerCtx.type* %.tmp3364, i8* %.tmp3367)
ret %m2811$.ModuleLookup.type* %.tmp3368
}
define i32 @m311$new_uid.i.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%.tmp3369 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3370 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3369, i32 0, i32 5
%.tmp3371 = load i32, i32* %.tmp3370
%uid.3372 = alloca i32
store i32 %.tmp3371, i32* %uid.3372
%.tmp3373 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3374 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3373, i32 0, i32 5
%.tmp3375 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3376 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3375, i32 0, i32 5
%.tmp3377 = load i32, i32* %.tmp3376
%.tmp3378 = add i32 %.tmp3377, 1
store i32 %.tmp3378, i32* %.tmp3374
%.tmp3379 = load i32, i32* %uid.3372
ret i32 %.tmp3379
}
define %m2811$.CompilerCtx.type* @m311$new_context.m2811$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp3380 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* null, i32 1
%.tmp3381 = ptrtoint %m2811$.CompilerCtx.type* %.tmp3380 to i32
%.tmp3382 = call i8*(i32) @malloc(i32 %.tmp3381)
%.tmp3383 = bitcast i8* %.tmp3382 to %m2811$.CompilerCtx.type*
%ctx.3384 = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.tmp3383, %m2811$.CompilerCtx.type** %ctx.3384
%.tmp3385 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx.3384
%.tmp3386 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3385, i32 0, i32 1
%.tmp3387 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp3387, %m0$.File.type** %.tmp3386
%.tmp3388 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx.3384
%.tmp3389 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3388, i32 0, i32 0
%.tmp3390 = bitcast ptr null to %m996$.Node.type*
store %m996$.Node.type* %.tmp3390, %m996$.Node.type** %.tmp3389
%.tmp3391 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx.3384
%.tmp3392 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3391, i32 0, i32 2
store %m2811$.ErrorList.type* null, %m2811$.ErrorList.type** %.tmp3392
%.tmp3393 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx.3384
%.tmp3394 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3393, i32 0, i32 5
store i32 0, i32* %.tmp3394
%.tmp3395 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx.3384
%.tmp3396 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3395, i32 0, i32 3
store %m2811$.GlobalName.type* null, %m2811$.GlobalName.type** %.tmp3396
%.tmp3397 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx.3384
%.tmp3398 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3397, i32 0, i32 8
store %m2811$.AnonFn.type* null, %m2811$.AnonFn.type** %.tmp3398
%.tmp3399 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx.3384
%.tmp3400 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3399, i32 0, i32 7
%.tmp3401 = load i8*, i8** %filename
store i8* %.tmp3401, i8** %.tmp3400
%.tmp3402 = call i8*() @m2359$grammar.cp()
%.tmp3403 = call %m0$.File.type*(i8*) @m1$str_as_file.m0$.File.typep.cp(i8* %.tmp3402)
%grammar_file.3404 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp3403, %m0$.File.type** %grammar_file.3404
%.tmp3405 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3404
%.tmp3406 = icmp eq %m0$.File.type* %.tmp3405, null
br i1 %.tmp3406, label %.if.true.3407, label %.if.false.3407
.if.true.3407:
%.tmp3408 = bitcast ptr null to %m2811$.CompilerCtx.type*
ret %m2811$.CompilerCtx.type* %.tmp3408
br label %.if.end.3407
.if.false.3407:
br label %.if.end.3407
.if.end.3407:
%.tmp3409 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3404
%.tmp3410 = call %m996$.ParsingContext.type*(%m0$.File.type*) @m996$new_context.m996$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp3409)
%grammar_ctx.3411 = alloca %m996$.ParsingContext.type*
store %m996$.ParsingContext.type* %.tmp3410, %m996$.ParsingContext.type** %grammar_ctx.3411
%.tmp3412 = load %m0$.File.type*, %m0$.File.type** %grammar_file.3404
%.tmp3413 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp3412)
%.tmp3414 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx.3384
%.tmp3415 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3414, i32 0, i32 4
%.tmp3416 = load %m996$.ParsingContext.type*, %m996$.ParsingContext.type** %grammar_ctx.3411
%.tmp3417 = call %m996$.Rule.type**(%m996$.ParsingContext.type*) @m996$parse_grammar.m996$.Rule.typepp.m996$.ParsingContext.typep(%m996$.ParsingContext.type* %.tmp3416)
store %m996$.Rule.type** %.tmp3417, %m996$.Rule.type*** %.tmp3415
%.tmp3418 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx.3384
%.tmp3419 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3418, i32 0, i32 4
%.tmp3420 = load %m996$.Rule.type**, %m996$.Rule.type*** %.tmp3419
%.tmp3421 = icmp eq %m996$.Rule.type** %.tmp3420, null
br i1 %.tmp3421, label %.if.true.3422, label %.if.false.3422
.if.true.3422:
%.tmp3424 = getelementptr [39 x i8], [39 x i8]*@.str3423, i32 0, i32 0
%.tmp3425 = call i32(i8*,...) @printf(i8* %.tmp3424)
call void(i32) @exit(i32 1)
br label %.if.end.3422
.if.false.3422:
br label %.if.end.3422
.if.end.3422:
%.tmp3426 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx.3384
%.tmp3427 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3426, i32 0, i32 6
%.tmp3428 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* null, i32 1
%.tmp3429 = ptrtoint %m2811$.ModuleLookup.type* %.tmp3428 to i32
%.tmp3430 = call i8*(i32) @malloc(i32 %.tmp3429)
%.tmp3431 = bitcast i8* %.tmp3430 to %m2811$.ModuleLookup.type*
store %m2811$.ModuleLookup.type* %.tmp3431, %m2811$.ModuleLookup.type** %.tmp3427
%.tmp3432 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx.3384
%.tmp3433 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3432, i32 0, i32 6
%.tmp3434 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %.tmp3433
%.tmp3435 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp3434, i32 0, i32 0
%.tmp3436 = load i8*, i8** %filename
store i8* %.tmp3436, i8** %.tmp3435
%.tmp3437 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx.3384
%.tmp3438 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3437, i32 0, i32 6
%.tmp3439 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %.tmp3438
%.tmp3440 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp3439, i32 0, i32 3
store %m2811$.Scope.type* null, %m2811$.Scope.type** %.tmp3440
%.tmp3441 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx.3384
%.tmp3442 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3441, i32 0, i32 6
%.tmp3443 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %.tmp3442
%.tmp3444 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp3443, i32 0, i32 1
%.tmp3446 = getelementptr [1 x i8], [1 x i8]*@.str3445, i32 0, i32 0
store i8* %.tmp3446, i8** %.tmp3444
%.tmp3447 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx.3384
%.tmp3448 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3447, i32 0, i32 6
%.tmp3449 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %.tmp3448
%.tmp3450 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp3449, i32 0, i32 2
store %m2811$.ModuleLookup.type* null, %m2811$.ModuleLookup.type** %.tmp3450
%.tmp3451 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx.3384
%.tmp3452 = bitcast %m2811$.CompilerCtx.type* %.tmp3451 to %m2811$.CompilerCtx.type*
ret %m2811$.CompilerCtx.type* %.tmp3452
}
define void @m311$push_scope.v.m2811$.CompilerCtx.typep.cp.cp.cp.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.ctx.arg, i8* %.type.arg, i8* %.begin_id.arg, i8* %.end_id.arg, %m2811$.Type.type* %.t.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%type = alloca i8*
store i8* %.type.arg, i8** %type
%begin_id = alloca i8*
store i8* %.begin_id.arg, i8** %begin_id
%end_id = alloca i8*
store i8* %.end_id.arg, i8** %end_id
%t = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.t.arg, %m2811$.Type.type** %t
%.tmp3453 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* null, i32 1
%.tmp3454 = ptrtoint %m2811$.Scope.type* %.tmp3453 to i32
%.tmp3455 = call i8*(i32) @malloc(i32 %.tmp3454)
%.tmp3456 = bitcast i8* %.tmp3455 to %m2811$.Scope.type*
%s.3457 = alloca %m2811$.Scope.type*
store %m2811$.Scope.type* %.tmp3456, %m2811$.Scope.type** %s.3457
%.tmp3458 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3459 = call %m2811$.ModuleLookup.type*(%m2811$.CompilerCtx.type*) @m311$get_current_module.m2811$.ModuleLookup.typep.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp3458)
%m.3460 = alloca %m2811$.ModuleLookup.type*
store %m2811$.ModuleLookup.type* %.tmp3459, %m2811$.ModuleLookup.type** %m.3460
%.tmp3461 = load %m2811$.Scope.type*, %m2811$.Scope.type** %s.3457
%.tmp3462 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp3461, i32 0, i32 5
%.tmp3463 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.3460
%.tmp3464 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp3463, i32 0, i32 3
%.tmp3465 = load %m2811$.Scope.type*, %m2811$.Scope.type** %.tmp3464
store %m2811$.Scope.type* %.tmp3465, %m2811$.Scope.type** %.tmp3462
%.tmp3466 = load %m2811$.Scope.type*, %m2811$.Scope.type** %s.3457
%.tmp3467 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp3466, i32 0, i32 1
store %m2811$.ScopeItem.type* null, %m2811$.ScopeItem.type** %.tmp3467
%.tmp3468 = load %m2811$.Scope.type*, %m2811$.Scope.type** %s.3457
%.tmp3469 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp3468, i32 0, i32 2
%.tmp3470 = load i8*, i8** %type
store i8* %.tmp3470, i8** %.tmp3469
%.tmp3471 = load %m2811$.Scope.type*, %m2811$.Scope.type** %s.3457
%.tmp3472 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp3471, i32 0, i32 3
%.tmp3473 = load i8*, i8** %begin_id
store i8* %.tmp3473, i8** %.tmp3472
%.tmp3474 = load %m2811$.Scope.type*, %m2811$.Scope.type** %s.3457
%.tmp3475 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp3474, i32 0, i32 4
%.tmp3476 = load i8*, i8** %end_id
store i8* %.tmp3476, i8** %.tmp3475
%.tmp3477 = load %m2811$.Scope.type*, %m2811$.Scope.type** %s.3457
%.tmp3478 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp3477, i32 0, i32 6
%.tmp3479 = load %m2811$.Type.type*, %m2811$.Type.type** %t
store %m2811$.Type.type* %.tmp3479, %m2811$.Type.type** %.tmp3478
%.tmp3480 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.3460
%.tmp3481 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp3480, i32 0, i32 3
%.tmp3482 = load %m2811$.Scope.type*, %m2811$.Scope.type** %s.3457
store %m2811$.Scope.type* %.tmp3482, %m2811$.Scope.type** %.tmp3481
ret void
}
define void @m311$pop_scope.v.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%.tmp3483 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3484 = call %m2811$.ModuleLookup.type*(%m2811$.CompilerCtx.type*) @m311$get_current_module.m2811$.ModuleLookup.typep.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp3483)
%m.3485 = alloca %m2811$.ModuleLookup.type*
store %m2811$.ModuleLookup.type* %.tmp3484, %m2811$.ModuleLookup.type** %m.3485
%.tmp3486 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.3485
%.tmp3487 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp3486, i32 0, i32 3
%.tmp3488 = load %m2811$.Scope.type*, %m2811$.Scope.type** %.tmp3487
%.tmp3489 = icmp ne %m2811$.Scope.type* %.tmp3488, null
%.tmp3491 = getelementptr [61 x i8], [61 x i8]*@.str3490, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp3489, i8* %.tmp3491)
%.tmp3492 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.3485
%.tmp3493 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp3492, i32 0, i32 3
%.tmp3494 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.3485
%.tmp3495 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp3494, i32 0, i32 3
%.tmp3496 = load %m2811$.Scope.type*, %m2811$.Scope.type** %.tmp3495
%.tmp3497 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp3496, i32 0, i32 5
%.tmp3498 = load %m2811$.Scope.type*, %m2811$.Scope.type** %.tmp3497
store %m2811$.Scope.type* %.tmp3498, %m2811$.Scope.type** %.tmp3493
ret void
}
define i1 @m311$compile_file.b.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, i8* %.filepath.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp3499 = load i8*, i8** %filepath
%.tmp3500 = load i32, i32* @O_RDONLY
%.tmp3501 = call i32(i8*,i32) @open(i8* %.tmp3499, i32 %.tmp3500)
%input_fd.3502 = alloca i32
store i32 %.tmp3501, i32* %input_fd.3502
%.tmp3503 = load i32, i32* %input_fd.3502
%.tmp3504 = icmp sle i32 %.tmp3503, 0
br i1 %.tmp3504, label %.if.true.3505, label %.if.false.3505
.if.true.3505:
%.tmp3507 = getelementptr [1 x i8], [1 x i8]*@.str3506, i32 0, i32 0
%err_msg.3508 = alloca i8*
store i8* %.tmp3507, i8** %err_msg.3508
%.tmp3509 = getelementptr i8*, i8** %err_msg.3508, i32 0
%.tmp3511 = getelementptr [26 x i8], [26 x i8]*@.str3510, i32 0, i32 0
%.tmp3512 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp3513 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3509, i8* %.tmp3511, %m996$.Node.type* %.tmp3512)
%.tmp3514 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3515 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp3516 = load i8*, i8** %err_msg.3508
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp3514, %m996$.Node.type* %.tmp3515, i8* %.tmp3516)
ret i1 0
br label %.if.end.3505
.if.false.3505:
br label %.if.end.3505
.if.end.3505:
%.tmp3517 = load i32, i32* %input_fd.3502
%.tmp3518 = call %m314$.PeekerInfo.type*(i32) @m314$new.m314$.PeekerInfo.typep.i(i32 %.tmp3517)
%p.3519 = alloca %m314$.PeekerInfo.type*
store %m314$.PeekerInfo.type* %.tmp3518, %m314$.PeekerInfo.type** %p.3519
%.tmp3520 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p.3519
%.tmp3521 = getelementptr %m314$.PeekerInfo.type, %m314$.PeekerInfo.type* %.tmp3520, i32 0, i32 6
%.tmp3522 = load i8*, i8** %filepath
store i8* %.tmp3522, i8** %.tmp3521
%.tmp3523 = load %m314$.PeekerInfo.type*, %m314$.PeekerInfo.type** %p.3519
%.tmp3524 = call %m313$.Token.type*(%m314$.PeekerInfo.type*,i1) @m313$tokenize.m313$.Token.typep.m314$.PeekerInfo.typep.b(%m314$.PeekerInfo.type* %.tmp3523, i1 0)
%tokens.3525 = alloca %m313$.Token.type*
store %m313$.Token.type* %.tmp3524, %m313$.Token.type** %tokens.3525
%.tmp3526 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3527 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3526, i32 0, i32 4
%.tmp3528 = load %m996$.Rule.type**, %m996$.Rule.type*** %.tmp3527
%.tmp3530 = getelementptr [6 x i8], [6 x i8]*@.str3529, i32 0, i32 0
%.tmp3531 = load %m313$.Token.type*, %m313$.Token.type** %tokens.3525
%.tmp3532 = call %m996$.ParseResult.type*(%m996$.Rule.type**,i8*,%m313$.Token.type*) @m996$ast.m996$.ParseResult.typep.m996$.Rule.typepp.cp.m313$.Token.typep(%m996$.Rule.type** %.tmp3528, i8* %.tmp3530, %m313$.Token.type* %.tmp3531)
%ast.3533 = alloca %m996$.ParseResult.type*
store %m996$.ParseResult.type* %.tmp3532, %m996$.ParseResult.type** %ast.3533
%.tmp3534 = load i32, i32* %input_fd.3502
%.tmp3535 = call i32(i32) @close(i32 %.tmp3534)
%.tmp3536 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %ast.3533
%.tmp3537 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp3536, i32 0, i32 0
%.tmp3538 = load %m312$.Error.type*, %m312$.Error.type** %.tmp3537
%.tmp3539 = icmp ne %m312$.Error.type* %.tmp3538, null
br i1 %.tmp3539, label %.if.true.3540, label %.if.false.3540
.if.true.3540:
%.tmp3541 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3542 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %ast.3533
%.tmp3543 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp3542, i32 0, i32 0
%.tmp3544 = load %m312$.Error.type*, %m312$.Error.type** %.tmp3543
call void(%m2811$.CompilerCtx.type*,%m312$.Error.type*) @m311$append_error.v.m2811$.CompilerCtx.typep.m312$.Error.typep(%m2811$.CompilerCtx.type* %.tmp3541, %m312$.Error.type* %.tmp3544)
%.tmp3545 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
call void(%m2811$.CompilerCtx.type*) @m311$report_errors.v.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp3545)
ret i1 1
br label %.if.end.3540
.if.false.3540:
br label %.if.end.3540
.if.end.3540:
%.tmp3546 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3547 = load %m996$.ParseResult.type*, %m996$.ParseResult.type** %ast.3533
%.tmp3548 = getelementptr %m996$.ParseResult.type, %m996$.ParseResult.type* %.tmp3547, i32 0, i32 1
%.tmp3549 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3548
%.tmp3550 = call i1(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile.b.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp3546, %m996$.Node.type* %.tmp3549)
ret i1 %.tmp3550
}
define void @m311$report_errors.v.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%.tmp3551 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3552 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3551, i32 0, i32 2
%.tmp3553 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %.tmp3552
%.tmp3554 = icmp ne %m2811$.ErrorList.type* %.tmp3553, null
br i1 %.tmp3554, label %.if.true.3555, label %.if.false.3555
.if.true.3555:
%.tmp3557 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3558 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3557, i32 0, i32 2
%.tmp3559 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %.tmp3558
%err.3560 = alloca %m2811$.ErrorList.type*
store %m2811$.ErrorList.type* %.tmp3559, %m2811$.ErrorList.type** %err.3560
br label %.for.start.3556
.for.start.3556:
%.tmp3561 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %err.3560
%.tmp3562 = icmp ne %m2811$.ErrorList.type* %.tmp3561, null
br i1 %.tmp3562, label %.for.continue.3556, label %.for.end.3556
.for.continue.3556:
%.tmp3563 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %err.3560
%.tmp3564 = getelementptr %m2811$.ErrorList.type, %m2811$.ErrorList.type* %.tmp3563, i32 0, i32 2
%.tmp3565 = load i1, i1* %.tmp3564
%.tmp3566 = icmp eq i1 %.tmp3565, 0
br i1 %.tmp3566, label %.if.true.3567, label %.if.false.3567
.if.true.3567:
%.tmp3568 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %err.3560
%.tmp3569 = getelementptr %m2811$.ErrorList.type, %m2811$.ErrorList.type* %.tmp3568, i32 0, i32 0
%.tmp3570 = load %m312$.Error.type*, %m312$.Error.type** %.tmp3569
call void(%m312$.Error.type*) @m312$report.v.m312$.Error.typep(%m312$.Error.type* %.tmp3570)
%.tmp3571 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %err.3560
%.tmp3572 = getelementptr %m2811$.ErrorList.type, %m2811$.ErrorList.type* %.tmp3571, i32 0, i32 2
store i1 1, i1* %.tmp3572
br label %.if.end.3567
.if.false.3567:
br label %.if.end.3567
.if.end.3567:
%.tmp3573 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %err.3560
%.tmp3574 = getelementptr %m2811$.ErrorList.type, %m2811$.ErrorList.type* %.tmp3573, i32 0, i32 1
%.tmp3575 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %.tmp3574
store %m2811$.ErrorList.type* %.tmp3575, %m2811$.ErrorList.type** %err.3560
br label %.for.start.3556
.for.end.3556:
br label %.if.end.3555
.if.false.3555:
br label %.if.end.3555
.if.end.3555:
ret void
}
define i1 @m311$compile.b.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.ast.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%ast = alloca %m996$.Node.type*
store %m996$.Node.type* %.ast.arg, %m996$.Node.type** %ast
%.tmp3576 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3577 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3576, i32 0, i32 2
%.tmp3578 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %.tmp3577
%.tmp3579 = icmp eq %m2811$.ErrorList.type* %.tmp3578, null
br i1 %.tmp3579, label %.if.true.3580, label %.if.false.3580
.if.true.3580:
%.tmp3581 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3582 = load %m996$.Node.type*, %m996$.Node.type** %ast
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_ast.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp3581, %m996$.Node.type* %.tmp3582)
br label %.if.end.3580
.if.false.3580:
br label %.if.end.3580
.if.end.3580:
%.tmp3583 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3584 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3583, i32 0, i32 2
%.tmp3585 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %.tmp3584
%.tmp3586 = icmp ne %m2811$.ErrorList.type* %.tmp3585, null
br i1 %.tmp3586, label %.if.true.3587, label %.if.false.3587
.if.true.3587:
%.tmp3588 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
call void(%m2811$.CompilerCtx.type*) @m311$report_errors.v.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp3588)
ret i1 1
br label %.if.end.3587
.if.false.3587:
br label %.if.end.3587
.if.end.3587:
ret i1 0
}
define void @m311$mark_weak_global.v.m2811$.CompilerCtx.typep.cp(%m2811$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp3590 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3591 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3590, i32 0, i32 3
%.tmp3592 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %.tmp3591
%g.3593 = alloca %m2811$.GlobalName.type*
store %m2811$.GlobalName.type* %.tmp3592, %m2811$.GlobalName.type** %g.3593
br label %.for.start.3589
.for.start.3589:
%.tmp3594 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g.3593
%.tmp3595 = icmp ne %m2811$.GlobalName.type* %.tmp3594, null
br i1 %.tmp3595, label %.for.continue.3589, label %.for.end.3589
.for.continue.3589:
%.tmp3596 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g.3593
%.tmp3597 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp3596, i32 0, i32 3
%.tmp3598 = load i1, i1* %.tmp3597
%.tmp3599 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g.3593
%.tmp3600 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp3599, i32 0, i32 0
%.tmp3601 = load i8*, i8** %.tmp3600
%.tmp3602 = load i8*, i8** %id
%.tmp3603 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3601, i8* %.tmp3602)
%.tmp3604 = icmp eq i32 %.tmp3603, 0
%.tmp3605 = and i1 %.tmp3598, %.tmp3604
br i1 %.tmp3605, label %.if.true.3606, label %.if.false.3606
.if.true.3606:
%.tmp3607 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g.3593
%.tmp3608 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp3607, i32 0, i32 2
store i1 1, i1* %.tmp3608
br label %.for.end.3589
br label %.if.end.3606
.if.false.3606:
br label %.if.end.3606
.if.end.3606:
%.tmp3609 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g.3593
%.tmp3610 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp3609, i32 0, i32 5
%.tmp3611 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %.tmp3610
store %m2811$.GlobalName.type* %.tmp3611, %m2811$.GlobalName.type** %g.3593
br label %.for.start.3589
.for.end.3589:
ret void
}
define void @m311$compile_ast.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.ast.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%ast = alloca %m996$.Node.type*
store %m996$.Node.type* %.ast.arg, %m996$.Node.type** %ast
%.tmp3612 = load %m996$.Node.type*, %m996$.Node.type** %ast
%.tmp3613 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3612, i32 0, i32 0
%.tmp3614 = load i8*, i8** %.tmp3613
%.tmp3616 = getelementptr [6 x i8], [6 x i8]*@.str3615, i32 0, i32 0
%.tmp3617 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3614, i8* %.tmp3616)
%.tmp3618 = icmp ne i32 %.tmp3617, 0
br i1 %.tmp3618, label %.if.true.3619, label %.if.false.3619
.if.true.3619:
%.tmp3620 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3621 = load %m996$.Node.type*, %m996$.Node.type** %ast
%.tmp3623 = getelementptr [29 x i8], [29 x i8]*@.str3622, i32 0, i32 0
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp3620, %m996$.Node.type* %.tmp3621, i8* %.tmp3623)
ret void
br label %.if.end.3619
.if.false.3619:
br label %.if.end.3619
.if.end.3619:
%.tmp3624 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3626 = getelementptr [7 x i8], [7 x i8]*@.str3625, i32 0, i32 0
%.tmp3627 = bitcast ptr null to i8*
%.tmp3628 = bitcast ptr null to i8*
%.tmp3629 = bitcast ptr null to %m2811$.Type.type*
call void(%m2811$.CompilerCtx.type*,i8*,i8*,i8*,%m2811$.Type.type*) @m311$push_scope.v.m2811$.CompilerCtx.typep.cp.cp.cp.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp3624, i8* %.tmp3626, i8* %.tmp3627, i8* %.tmp3628, %m2811$.Type.type* %.tmp3629)
%.tmp3630 = load %m996$.Node.type*, %m996$.Node.type** %ast
%.tmp3631 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3630, i32 0, i32 8
%.tmp3632 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3631
%start.3633 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp3632, %m996$.Node.type** %start.3633
%.tmp3634 = load %m996$.Node.type*, %m996$.Node.type** %start.3633
%.tmp3635 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3634, i32 0, i32 0
%.tmp3636 = load i8*, i8** %.tmp3635
%.tmp3638 = getelementptr [13 x i8], [13 x i8]*@.str3637, i32 0, i32 0
%.tmp3639 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3636, i8* %.tmp3638)
%.tmp3640 = icmp eq i32 %.tmp3639, 0
br i1 %.tmp3640, label %.if.true.3641, label %.if.false.3641
.if.true.3641:
%.tmp3642 = load %m996$.Node.type*, %m996$.Node.type** %start.3633
%.tmp3643 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3642, i32 0, i32 9
%.tmp3644 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3643
store %m996$.Node.type* %.tmp3644, %m996$.Node.type** %start.3633
br label %.if.end.3641
.if.false.3641:
br label %.if.end.3641
.if.end.3641:
%.tmp3646 = load %m996$.Node.type*, %m996$.Node.type** %start.3633
%stmt.3647 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp3646, %m996$.Node.type** %stmt.3647
br label %.for.start.3645
.for.start.3645:
%.tmp3648 = load %m996$.Node.type*, %m996$.Node.type** %stmt.3647
%.tmp3649 = icmp ne %m996$.Node.type* %.tmp3648, null
br i1 %.tmp3649, label %.for.continue.3645, label %.for.end.3645
.for.continue.3645:
%.tmp3650 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3651 = load %m996$.Node.type*, %m996$.Node.type** %stmt.3647
%.tmp3652 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3651, i32 0, i32 8
%.tmp3653 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3652
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i1) @m311$compile_statement.v.m2811$.CompilerCtx.typep.m996$.Node.typep.b(%m2811$.CompilerCtx.type* %.tmp3650, %m996$.Node.type* %.tmp3653, i1 1)
%.tmp3654 = load %m996$.Node.type*, %m996$.Node.type** %stmt.3647
%.tmp3655 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3654, i32 0, i32 9
%.tmp3656 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3655
store %m996$.Node.type* %.tmp3656, %m996$.Node.type** %stmt.3647
br label %.for.start.3645
.for.end.3645:
%.tmp3657 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3658 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3657, i32 0, i32 2
%.tmp3659 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %.tmp3658
%.tmp3660 = icmp ne %m2811$.ErrorList.type* %.tmp3659, null
br i1 %.tmp3660, label %.if.true.3661, label %.if.false.3661
.if.true.3661:
ret void
br label %.if.end.3661
.if.false.3661:
br label %.if.end.3661
.if.end.3661:
%.tmp3663 = load %m996$.Node.type*, %m996$.Node.type** %start.3633
%s.3664 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp3663, %m996$.Node.type** %s.3664
br label %.for.start.3662
.for.start.3662:
%.tmp3665 = load %m996$.Node.type*, %m996$.Node.type** %s.3664
%.tmp3666 = icmp ne %m996$.Node.type* %.tmp3665, null
br i1 %.tmp3666, label %.for.continue.3662, label %.for.end.3662
.for.continue.3662:
%.tmp3667 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3668 = load %m996$.Node.type*, %m996$.Node.type** %s.3664
%.tmp3669 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3668, i32 0, i32 8
%.tmp3670 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3669
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i1) @m311$compile_statement.v.m2811$.CompilerCtx.typep.m996$.Node.typep.b(%m2811$.CompilerCtx.type* %.tmp3667, %m996$.Node.type* %.tmp3670, i1 0)
%.tmp3671 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
call void(%m2811$.CompilerCtx.type*) @m311$compile_anon_fn.v.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp3671)
%.tmp3672 = load %m996$.Node.type*, %m996$.Node.type** %s.3664
%.tmp3673 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3672, i32 0, i32 9
%.tmp3674 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3673
store %m996$.Node.type* %.tmp3674, %m996$.Node.type** %s.3664
br label %.for.start.3662
.for.end.3662:
%.tmp3675 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3676 = call %m2811$.ModuleLookup.type*(%m2811$.CompilerCtx.type*) @m311$get_current_module.m2811$.ModuleLookup.typep.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp3675)
%mod.3677 = alloca %m2811$.ModuleLookup.type*
store %m2811$.ModuleLookup.type* %.tmp3676, %m2811$.ModuleLookup.type** %mod.3677
%.tmp3678 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.3677
%.tmp3679 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp3678, i32 0, i32 1
%.tmp3680 = load i8*, i8** %.tmp3679
%.tmp3682 = getelementptr [1 x i8], [1 x i8]*@.str3681, i32 0, i32 0
%.tmp3683 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3680, i8* %.tmp3682)
%.tmp3684 = icmp eq i32 %.tmp3683, 0
br i1 %.tmp3684, label %.if.true.3685, label %.if.false.3685
.if.true.3685:
%.tmp3687 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3688 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3687, i32 0, i32 3
%.tmp3689 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %.tmp3688
%g.3690 = alloca %m2811$.GlobalName.type*
store %m2811$.GlobalName.type* %.tmp3689, %m2811$.GlobalName.type** %g.3690
br label %.for.start.3686
.for.start.3686:
%.tmp3691 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g.3690
%.tmp3692 = icmp ne %m2811$.GlobalName.type* %.tmp3691, null
br i1 %.tmp3692, label %.for.continue.3686, label %.for.end.3686
.for.continue.3686:
%.tmp3693 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3694 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g.3690
call void(%m2811$.CompilerCtx.type*,%m2811$.GlobalName.type*) @m311$compile_global.v.m2811$.CompilerCtx.typep.m2811$.GlobalName.typep(%m2811$.CompilerCtx.type* %.tmp3693, %m2811$.GlobalName.type* %.tmp3694)
%.tmp3695 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g.3690
%.tmp3696 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp3695, i32 0, i32 5
%.tmp3697 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %.tmp3696
store %m2811$.GlobalName.type* %.tmp3697, %m2811$.GlobalName.type** %g.3690
br label %.for.start.3686
.for.end.3686:
br label %.if.end.3685
.if.false.3685:
br label %.if.end.3685
.if.end.3685:
ret void
}
define void @m311$compile_global.v.m2811$.CompilerCtx.typep.m2811$.GlobalName.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%g = alloca %m2811$.GlobalName.type*
store %m2811$.GlobalName.type* %.g.arg, %m2811$.GlobalName.type** %g
%.tmp3698 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g
%.tmp3699 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp3698, i32 0, i32 2
%.tmp3700 = load i1, i1* %.tmp3699
br i1 %.tmp3700, label %.if.true.3701, label %.if.false.3701
.if.true.3701:
ret void
br label %.if.end.3701
.if.false.3701:
br label %.if.end.3701
.if.end.3701:
%.tmp3702 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g
%.tmp3703 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp3702, i32 0, i32 1
%.tmp3704 = load i8*, i8** %.tmp3703
%.tmp3706 = getelementptr [7 x i8], [7 x i8]*@.str3705, i32 0, i32 0
%.tmp3707 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3704, i8* %.tmp3706)
%.tmp3708 = icmp eq i32 %.tmp3707, 0
br i1 %.tmp3708, label %.if.true.3709, label %.if.false.3709
.if.true.3709:
%.tmp3710 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3711 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3710, i32 0, i32 1
%.tmp3712 = load %m0$.File.type*, %m0$.File.type** %.tmp3711
%.tmp3714 = getelementptr [21 x i8], [21 x i8]*@.str3713, i32 0, i32 0
%.tmp3715 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g
%.tmp3716 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp3715, i32 0, i32 4
%.tmp3717 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %.tmp3716
%.tmp3718 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp3717)
%.tmp3719 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3720 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g
%.tmp3721 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp3720, i32 0, i32 4
%.tmp3722 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %.tmp3721
%.tmp3723 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3722, i32 0, i32 4
%.tmp3724 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3723
%.tmp3725 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp3719, %m2811$.Type.type* %.tmp3724)
%.tmp3726 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g
%.tmp3727 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp3726, i32 0, i32 0
%.tmp3728 = load i8*, i8** %.tmp3727
%.tmp3729 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3712, i8* %.tmp3714, i8* %.tmp3718, i8* %.tmp3725, i8* %.tmp3728)
br label %.if.end.3709
.if.false.3709:
%.tmp3730 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g
%.tmp3731 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp3730, i32 0, i32 1
%.tmp3732 = load i8*, i8** %.tmp3731
%.tmp3734 = getelementptr [7 x i8], [7 x i8]*@.str3733, i32 0, i32 0
%.tmp3735 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3732, i8* %.tmp3734)
%.tmp3736 = icmp eq i32 %.tmp3735, 0
br i1 %.tmp3736, label %.if.true.3737, label %.if.false.3737
.if.true.3737:
%.tmp3738 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3739 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g
%.tmp3740 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp3739, i32 0, i32 4
%.tmp3741 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %.tmp3740
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$compile_extern.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp3738, %m2811$.AssignableInfo.type* %.tmp3741)
br label %.if.end.3737
.if.false.3737:
br label %.if.end.3737
.if.end.3737:
br label %.if.end.3709
.if.end.3709:
%.tmp3742 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g
%.tmp3743 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp3742, i32 0, i32 2
store i1 1, i1* %.tmp3743
ret void
}
define void @m311$compile_extern.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%info = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.info.arg, %m2811$.AssignableInfo.type** %info
%.tmp3744 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3745 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3744, i32 0, i32 1
%.tmp3746 = load %m0$.File.type*, %m0$.File.type** %.tmp3745
%.tmp3748 = getelementptr [15 x i8], [15 x i8]*@.str3747, i32 0, i32 0
%.tmp3749 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3750 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp3751 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3750, i32 0, i32 4
%.tmp3752 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3751
%.tmp3753 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3752, i32 0, i32 3
%.tmp3754 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3753
%.tmp3755 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp3749, %m2811$.Type.type* %.tmp3754)
%.tmp3756 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp3757 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp3756)
%.tmp3758 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3746, i8* %.tmp3748, i8* %.tmp3755, i8* %.tmp3757)
%.tmp3760 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp3761 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3760, i32 0, i32 4
%.tmp3762 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3761
%.tmp3763 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3762, i32 0, i32 3
%.tmp3764 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3763
%.tmp3765 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3764, i32 0, i32 4
%.tmp3766 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3765
%pt.3767 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp3766, %m2811$.Type.type** %pt.3767
br label %.for.start.3759
.for.start.3759:
%.tmp3768 = load %m2811$.Type.type*, %m2811$.Type.type** %pt.3767
%.tmp3769 = icmp ne %m2811$.Type.type* %.tmp3768, null
br i1 %.tmp3769, label %.for.continue.3759, label %.for.end.3759
.for.continue.3759:
%.tmp3770 = load %m2811$.Type.type*, %m2811$.Type.type** %pt.3767
%.tmp3771 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp3772 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3771, i32 0, i32 4
%.tmp3773 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3772
%.tmp3774 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3773, i32 0, i32 3
%.tmp3775 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3774
%.tmp3776 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3775, i32 0, i32 4
%.tmp3777 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3776
%.tmp3778 = icmp ne %m2811$.Type.type* %.tmp3770, %.tmp3777
br i1 %.tmp3778, label %.if.true.3779, label %.if.false.3779
.if.true.3779:
%.tmp3780 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3781 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3780, i32 0, i32 1
%.tmp3782 = load %m0$.File.type*, %m0$.File.type** %.tmp3781
%.tmp3784 = getelementptr [3 x i8], [3 x i8]*@.str3783, i32 0, i32 0
%.tmp3785 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3782, i8* %.tmp3784)
br label %.if.end.3779
.if.false.3779:
br label %.if.end.3779
.if.end.3779:
%.tmp3786 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3787 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3786, i32 0, i32 1
%.tmp3788 = load %m0$.File.type*, %m0$.File.type** %.tmp3787
%.tmp3790 = getelementptr [3 x i8], [3 x i8]*@.str3789, i32 0, i32 0
%.tmp3791 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3792 = load %m2811$.Type.type*, %m2811$.Type.type** %pt.3767
%.tmp3793 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp3791, %m2811$.Type.type* %.tmp3792)
%.tmp3794 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3788, i8* %.tmp3790, i8* %.tmp3793)
%.tmp3795 = load %m2811$.Type.type*, %m2811$.Type.type** %pt.3767
%.tmp3796 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3795, i32 0, i32 4
%.tmp3797 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3796
store %m2811$.Type.type* %.tmp3797, %m2811$.Type.type** %pt.3767
br label %.for.start.3759
.for.end.3759:
%.tmp3798 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3799 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3798, i32 0, i32 1
%.tmp3800 = load %m0$.File.type*, %m0$.File.type** %.tmp3799
%.tmp3802 = getelementptr [3 x i8], [3 x i8]*@.str3801, i32 0, i32 0
%.tmp3803 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3800, i8* %.tmp3802)
ret void
}
define i8* @m311$get_mod_prefix.cp.m2811$.CompilerCtx.typep.cp(%m2811$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp3804 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3805 = call %m2811$.ModuleLookup.type*(%m2811$.CompilerCtx.type*) @m311$get_current_module.m2811$.ModuleLookup.typep.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp3804)
%m.3806 = alloca %m2811$.ModuleLookup.type*
store %m2811$.ModuleLookup.type* %.tmp3805, %m2811$.ModuleLookup.type** %m.3806
%.tmp3807 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.3806
%.tmp3808 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp3807, i32 0, i32 1
%.tmp3809 = load i8*, i8** %.tmp3808
ret i8* %.tmp3809
}
define i8* @m311$name_mangle.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.fn.arg, i8* %.original_name.arg, %m2811$.Type.type* %.type.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%fn = alloca %m996$.Node.type*
store %m996$.Node.type* %.fn.arg, %m996$.Node.type** %fn
%original_name = alloca i8*
store i8* %.original_name.arg, i8** %original_name
%type = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.type.arg, %m2811$.Type.type** %type
%.tmp3811 = getelementptr [1 x i8], [1 x i8]*@.str3810, i32 0, i32 0
%mangled_name.3812 = alloca i8*
store i8* %.tmp3811, i8** %mangled_name.3812
%.tmp3813 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3814 = load %m996$.Node.type*, %m996$.Node.type** %fn
%.tmp3815 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3814, i32 0, i32 2
%.tmp3816 = load i8*, i8** %.tmp3815
%.tmp3817 = call i8*(%m2811$.CompilerCtx.type*,i8*) @m311$get_mod_prefix.cp.m2811$.CompilerCtx.typep.cp(%m2811$.CompilerCtx.type* %.tmp3813, i8* %.tmp3816)
%prefix.3818 = alloca i8*
store i8* %.tmp3817, i8** %prefix.3818
%.tmp3819 = getelementptr i8*, i8** %mangled_name.3812, i32 0
%.tmp3821 = getelementptr [5 x i8], [5 x i8]*@.str3820, i32 0, i32 0
%.tmp3822 = load i8*, i8** %prefix.3818
%.tmp3823 = load i8*, i8** %original_name
%.tmp3824 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3819, i8* %.tmp3821, i8* %.tmp3822, i8* %.tmp3823)
%.tmp3825 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp3826 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3825, i32 0, i32 0
%.tmp3827 = load i8*, i8** %.tmp3826
%.tmp3829 = getelementptr [9 x i8], [9 x i8]*@.str3828, i32 0, i32 0
%.tmp3830 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3827, i8* %.tmp3829)
%.tmp3831 = icmp eq i32 %.tmp3830, 0
br i1 %.tmp3831, label %.if.true.3832, label %.if.false.3832
.if.true.3832:
%.tmp3833 = load i8*, i8** %mangled_name.3812
%.tmp3835 = getelementptr [5 x i8], [5 x i8]*@.str3834, i32 0, i32 0
%.tmp3836 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3833, i8* %.tmp3835)
%.tmp3837 = icmp ne i32 %.tmp3836, 0
br i1 %.tmp3837, label %.if.true.3838, label %.if.false.3838
.if.true.3838:
%.tmp3840 = getelementptr [1 x i8], [1 x i8]*@.str3839, i32 0, i32 0
%tmp_buff.3841 = alloca i8*
store i8* %.tmp3840, i8** %tmp_buff.3841
%.tmp3843 = getelementptr [1 x i8], [1 x i8]*@.str3842, i32 0, i32 0
%swap_var.3844 = alloca i8*
store i8* %.tmp3843, i8** %swap_var.3844
%.tmp3846 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp3847 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3846, i32 0, i32 3
%.tmp3848 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3847
%tp.3849 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp3848, %m2811$.Type.type** %tp.3849
br label %.for.start.3845
.for.start.3845:
%.tmp3850 = load %m2811$.Type.type*, %m2811$.Type.type** %tp.3849
%.tmp3851 = icmp ne %m2811$.Type.type* %.tmp3850, null
br i1 %.tmp3851, label %.for.continue.3845, label %.for.end.3845
.for.continue.3845:
%.tmp3852 = getelementptr i8*, i8** %tmp_buff.3841, i32 0
%.tmp3854 = getelementptr [6 x i8], [6 x i8]*@.str3853, i32 0, i32 0
%.tmp3855 = load i8*, i8** %mangled_name.3812
%.tmp3856 = load %m2811$.Type.type*, %m2811$.Type.type** %tp.3849
%.tmp3857 = call i8*(%m2811$.Type.type*) @m311$type_abbr.cp.m2811$.Type.typep(%m2811$.Type.type* %.tmp3856)
%.tmp3858 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3852, i8* %.tmp3854, i8* %.tmp3855, i8* %.tmp3857)
%.tmp3859 = load i8*, i8** %tmp_buff.3841
store i8* %.tmp3859, i8** %swap_var.3844
%.tmp3860 = load i8*, i8** %mangled_name.3812
store i8* %.tmp3860, i8** %tmp_buff.3841
%.tmp3861 = load i8*, i8** %swap_var.3844
store i8* %.tmp3861, i8** %mangled_name.3812
%.tmp3862 = load i8*, i8** %tmp_buff.3841
call void(i8*) @free(i8* %.tmp3862)
%.tmp3863 = load %m2811$.Type.type*, %m2811$.Type.type** %tp.3849
%.tmp3864 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp3863, i32 0, i32 4
%.tmp3865 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3864
store %m2811$.Type.type* %.tmp3865, %m2811$.Type.type** %tp.3849
br label %.for.start.3845
.for.end.3845:
br label %.if.end.3838
.if.false.3838:
br label %.if.end.3838
.if.end.3838:
br label %.if.end.3832
.if.false.3832:
br label %.if.end.3832
.if.end.3832:
%.tmp3866 = load i8*, i8** %mangled_name.3812
ret i8* %.tmp3866
}
define void @m311$compile_statement.v.m2811$.CompilerCtx.typep.m996$.Node.typep.b(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info.3867 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* null, %m2811$.AssignableInfo.type** %info.3867
%return_type.3868 = alloca %m2811$.Type.type*
store %m2811$.Type.type* null, %m2811$.Type.type** %return_type.3868
%.tmp3870 = getelementptr [1 x i8], [1 x i8]*@.str3869, i32 0, i32 0
%err_buf.3871 = alloca i8*
store i8* %.tmp3870, i8** %err_buf.3871
%.tmp3873 = getelementptr [1 x i8], [1 x i8]*@.str3872, i32 0, i32 0
%tmp_buff.3874 = alloca i8*
store i8* %.tmp3873, i8** %tmp_buff.3874
%.tmp3875 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp3876 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3875, i32 0, i32 0
%.tmp3877 = load i8*, i8** %.tmp3876
%.tmp3879 = getelementptr [3 x i8], [3 x i8]*@.str3878, i32 0, i32 0
%.tmp3880 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3877, i8* %.tmp3879)
%.tmp3881 = icmp eq i32 %.tmp3880, 0
br i1 %.tmp3881, label %.if.true.3882, label %.if.false.3882
.if.true.3882:
ret void
br label %.if.end.3882
.if.false.3882:
%.tmp3883 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp3884 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3883, i32 0, i32 0
%.tmp3885 = load i8*, i8** %.tmp3884
%.tmp3887 = getelementptr [7 x i8], [7 x i8]*@.str3886, i32 0, i32 0
%.tmp3888 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3885, i8* %.tmp3887)
%.tmp3889 = icmp eq i32 %.tmp3888, 0
br i1 %.tmp3889, label %.if.true.3890, label %.if.false.3890
.if.true.3890:
%.tmp3891 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp3892 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3891, i32 0, i32 8
%.tmp3893 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3892
%.tmp3895 = getelementptr [11 x i8], [11 x i8]*@.str3894, i32 0, i32 0
%.tmp3896 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp3893, i8* %.tmp3895)
%assignable.3897 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp3896, %m996$.Node.type** %assignable.3897
%.tmp3898 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3899 = load %m996$.Node.type*, %m996$.Node.type** %assignable.3897
%.tmp3900 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp3898, %m996$.Node.type* %.tmp3899)
%a_info.3901 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp3900, %m2811$.AssignableInfo.type** %a_info.3901
%.tmp3902 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.3901
%.tmp3903 = icmp eq %m2811$.AssignableInfo.type* %.tmp3902, null
br i1 %.tmp3903, label %.if.true.3904, label %.if.false.3904
.if.true.3904:
ret void
br label %.if.end.3904
.if.false.3904:
br label %.if.end.3904
.if.end.3904:
%.tmp3905 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp3906 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp3905)
store %m2811$.AssignableInfo.type* %.tmp3906, %m2811$.AssignableInfo.type** %info.3867
%.tmp3907 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp3908 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3907, i32 0, i32 8
%.tmp3909 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3908
%.tmp3910 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3909, i32 0, i32 9
%.tmp3911 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3910
%.tmp3912 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3911, i32 0, i32 1
%.tmp3913 = load i8*, i8** %.tmp3912
%global_name.3914 = alloca i8*
store i8* %.tmp3913, i8** %global_name.3914
%.tmp3915 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp3916 = load i8, i8* @SCOPE_GLOBAL
%.tmp3917 = load i8*, i8** %global_name.3914
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp3915, i8 %.tmp3916, i8* %.tmp3917)
%.tmp3918 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp3919 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3918, i32 0, i32 4
%.tmp3920 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.3901
%.tmp3921 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3920, i32 0, i32 4
%.tmp3922 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3921
store %m2811$.Type.type* %.tmp3922, %m2811$.Type.type** %.tmp3919
%.tmp3923 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp3924 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3923, i32 0, i32 3
%.tmp3926 = getelementptr [9 x i8], [9 x i8]*@.str3925, i32 0, i32 0
store i8* %.tmp3926, i8** %.tmp3924
%.tmp3927 = load i1, i1* %shallow
%.tmp3928 = icmp eq i1 %.tmp3927, 1
br i1 %.tmp3928, label %.if.true.3929, label %.if.false.3929
.if.true.3929:
%.tmp3930 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3931 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp3932 = load i8*, i8** %global_name.3914
%.tmp3933 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2811$.AssignableInfo.type*) @m311$define_assignable.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp3930, %m996$.Node.type* %.tmp3931, i8* %.tmp3932, %m2811$.AssignableInfo.type* %.tmp3933)
br label %.if.end.3929
.if.false.3929:
%.tmp3934 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3935 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp3934, i32 0, i32 1
%.tmp3936 = load %m0$.File.type*, %m0$.File.type** %.tmp3935
%.tmp3938 = getelementptr [21 x i8], [21 x i8]*@.str3937, i32 0, i32 0
%.tmp3939 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp3940 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp3939)
%.tmp3941 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3942 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp3943 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3942, i32 0, i32 4
%.tmp3944 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp3943
%.tmp3945 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp3941, %m2811$.Type.type* %.tmp3944)
%.tmp3946 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.3901
%.tmp3947 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp3946)
%.tmp3948 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3936, i8* %.tmp3938, i8* %.tmp3940, i8* %.tmp3945, i8* %.tmp3947)
br label %.if.end.3929
.if.end.3929:
br label %.if.end.3890
.if.false.3890:
%.tmp3949 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp3950 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3949, i32 0, i32 0
%.tmp3951 = load i8*, i8** %.tmp3950
%.tmp3953 = getelementptr [10 x i8], [10 x i8]*@.str3952, i32 0, i32 0
%.tmp3954 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp3951, i8* %.tmp3953)
%.tmp3955 = icmp eq i32 %.tmp3954, 0
br i1 %.tmp3955, label %.if.true.3956, label %.if.false.3956
.if.true.3956:
%.tmp3957 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp3958 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3957, i32 0, i32 8
%.tmp3959 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3958
%.tmp3960 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3959, i32 0, i32 9
%.tmp3961 = load %m996$.Node.type*, %m996$.Node.type** %.tmp3960
%.tmp3962 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3961, i32 0, i32 1
%.tmp3963 = load i8*, i8** %.tmp3962
%type_name.3964 = alloca i8*
store i8* %.tmp3963, i8** %type_name.3964
%.tmp3965 = load i1, i1* %shallow
%.tmp3966 = icmp eq i1 %.tmp3965, 1
br i1 %.tmp3966, label %.if.true.3967, label %.if.false.3967
.if.true.3967:
%.tmp3968 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp3969 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp3968)
store %m2811$.AssignableInfo.type* %.tmp3969, %m2811$.AssignableInfo.type** %info.3867
%.tmp3970 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp3971 = call %m2811$.ModuleLookup.type*(%m2811$.CompilerCtx.type*) @m311$get_current_module.m2811$.ModuleLookup.typep.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp3970)
%mod_from.3972 = alloca %m2811$.ModuleLookup.type*
store %m2811$.ModuleLookup.type* %.tmp3971, %m2811$.ModuleLookup.type** %mod_from.3972
%.tmp3973 = getelementptr i8*, i8** %tmp_buff.3874, i32 0
%.tmp3975 = getelementptr [11 x i8], [11 x i8]*@.str3974, i32 0, i32 0
%.tmp3976 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod_from.3972
%.tmp3977 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp3976, i32 0, i32 1
%.tmp3978 = load i8*, i8** %.tmp3977
%.tmp3979 = load i8*, i8** %type_name.3964
%.tmp3980 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3973, i8* %.tmp3975, i8* %.tmp3978, i8* %.tmp3979)
%.tmp3981 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp3982 = load i8, i8* @SCOPE_LOCAL
%.tmp3983 = load i8*, i8** %tmp_buff.3874
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp3981, i8 %.tmp3982, i8* %.tmp3983)
%.tmp3984 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp3985 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3984, i32 0, i32 3
%.tmp3987 = getelementptr [10 x i8], [10 x i8]*@.str3986, i32 0, i32 0
store i8* %.tmp3987, i8** %.tmp3985
%.tmp3988 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp3989 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3988, i32 0, i32 5
%.tmp3990 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp3991 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3990, i32 0, i32 3
%.tmp3992 = load i32, i32* %.tmp3991
store i32 %.tmp3992, i32* %.tmp3989
%.tmp3993 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp3994 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3993, i32 0, i32 6
%.tmp3995 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp3996 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp3995, i32 0, i32 4
%.tmp3997 = load i32, i32* %.tmp3996
store i32 %.tmp3997, i32* %.tmp3994
%.tmp3998 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp3999 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp3998, i32 0, i32 4
%.tmp4000 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp4000, %m2811$.Type.type** %.tmp3999
%.tmp4001 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4002 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4003 = load i8*, i8** %type_name.3964
%.tmp4004 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2811$.AssignableInfo.type*) @m311$define_assignable.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp4001, %m996$.Node.type* %.tmp4002, i8* %.tmp4003, %m2811$.AssignableInfo.type* %.tmp4004)
%.tmp4005 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4006 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4005, i32 0, i32 8
%.tmp4007 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4006
%.tmp4009 = getelementptr [5 x i8], [5 x i8]*@.str4008, i32 0, i32 0
%.tmp4010 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp4007, i8* %.tmp4009)
%type_decl.4011 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4010, %m996$.Node.type** %type_decl.4011
%.tmp4012 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4013 = load %m996$.Node.type*, %m996$.Node.type** %type_decl.4011
%.tmp4014 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4013, i32 0, i32 8
%.tmp4015 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4014
%.tmp4016 = call %m2811$.Type.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp4012, %m996$.Node.type* %.tmp4015)
%type_struct.4017 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp4016, %m2811$.Type.type** %type_struct.4017
%.tmp4018 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp4019 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4018, i32 0, i32 4
%.tmp4020 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4019
%.tmp4021 = load %m2811$.Type.type*, %m2811$.Type.type** %type_struct.4017
call void(%m2811$.Type.type*,%m2811$.Type.type*) @m311$copy_type.v.m2811$.Type.typep.m2811$.Type.typep(%m2811$.Type.type* %.tmp4020, %m2811$.Type.type* %.tmp4021)
%.tmp4022 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp4023 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4022, i32 0, i32 4
%.tmp4024 = load %m2811$.Type.type*, %m2811$.Type.type** %type_struct.4017
store %m2811$.Type.type* %.tmp4024, %m2811$.Type.type** %.tmp4023
br label %.if.end.3967
.if.false.3967:
%.tmp4025 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4026 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4027 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4026, i32 0, i32 7
%.tmp4028 = load i8*, i8** %.tmp4027
%.tmp4029 = load i8*, i8** %type_name.3964
%.tmp4030 = call %m2811$.ScopeItem.type*(%m2811$.CompilerCtx.type*,i8*,i8*) @m311$find_defined_str.m2811$.ScopeItem.typep.m2811$.CompilerCtx.typep.cp.cp(%m2811$.CompilerCtx.type* %.tmp4025, i8* %.tmp4028, i8* %.tmp4029)
%scope.4031 = alloca %m2811$.ScopeItem.type*
store %m2811$.ScopeItem.type* %.tmp4030, %m2811$.ScopeItem.type** %scope.4031
%.tmp4032 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %scope.4031
%.tmp4033 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp4032, i32 0, i32 1
%.tmp4034 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %.tmp4033
store %m2811$.AssignableInfo.type* %.tmp4034, %m2811$.AssignableInfo.type** %info.3867
%.tmp4035 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4036 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4035, i32 0, i32 1
%.tmp4037 = load %m0$.File.type*, %m0$.File.type** %.tmp4036
%.tmp4039 = getelementptr [14 x i8], [14 x i8]*@.str4038, i32 0, i32 0
%.tmp4040 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp4041 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp4040)
%.tmp4042 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4043 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp4044 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4043, i32 0, i32 4
%.tmp4045 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4044
%.tmp4046 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4042, %m2811$.Type.type* %.tmp4045)
%.tmp4047 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4037, i8* %.tmp4039, i8* %.tmp4041, i8* %.tmp4046)
br label %.if.end.3967
.if.end.3967:
br label %.if.end.3956
.if.false.3956:
%.tmp4048 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4049 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4048, i32 0, i32 0
%.tmp4050 = load i8*, i8** %.tmp4049
%.tmp4052 = getelementptr [7 x i8], [7 x i8]*@.str4051, i32 0, i32 0
%.tmp4053 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4050, i8* %.tmp4052)
%.tmp4054 = icmp eq i32 %.tmp4053, 0
br i1 %.tmp4054, label %.if.true.4055, label %.if.false.4055
.if.true.4055:
%.tmp4056 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4057 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp4056)
store %m2811$.AssignableInfo.type* %.tmp4057, %m2811$.AssignableInfo.type** %info.3867
%.tmp4058 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp4059 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4058, i32 0, i32 4
%.tmp4060 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4061 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4062 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4061, i32 0, i32 8
%.tmp4063 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4062
%.tmp4064 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4063, i32 0, i32 9
%.tmp4065 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4064
%.tmp4066 = call %m2811$.Type.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$syn_function_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp4060, %m996$.Node.type* %.tmp4065)
store %m2811$.Type.type* %.tmp4066, %m2811$.Type.type** %.tmp4059
%.tmp4067 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp4068 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4067, i32 0, i32 3
%.tmp4070 = getelementptr [7 x i8], [7 x i8]*@.str4069, i32 0, i32 0
store i8* %.tmp4070, i8** %.tmp4068
%.tmp4071 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4072 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4071, i32 0, i32 8
%.tmp4073 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4072
%.tmp4074 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4073, i32 0, i32 9
%.tmp4075 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4074
%.tmp4076 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4075, i32 0, i32 9
%.tmp4077 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4076
%.tmp4078 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4077, i32 0, i32 1
%.tmp4079 = load i8*, i8** %.tmp4078
%fn_name.4080 = alloca i8*
store i8* %.tmp4079, i8** %fn_name.4080
%.tmp4081 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp4082 = load i8, i8* @SCOPE_GLOBAL
%.tmp4083 = load i8*, i8** %fn_name.4080
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp4081, i8 %.tmp4082, i8* %.tmp4083)
%.tmp4084 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp4084, %m2811$.Type.type** %return_type.3868
%.tmp4085 = load %m2811$.Type.type*, %m2811$.Type.type** %return_type.3868
%.tmp4086 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4085, i32 0, i32 0
%.tmp4087 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp4088 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4087, i32 0, i32 4
%.tmp4089 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4088
%.tmp4090 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4089, i32 0, i32 3
%.tmp4091 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4090
%.tmp4092 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4091, i32 0, i32 0
%.tmp4093 = load i8*, i8** %.tmp4092
store i8* %.tmp4093, i8** %.tmp4086
%.tmp4094 = load %m2811$.Type.type*, %m2811$.Type.type** %return_type.3868
%.tmp4095 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4094, i32 0, i32 3
%.tmp4096 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp4097 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4096, i32 0, i32 4
%.tmp4098 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4097
%.tmp4099 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4098, i32 0, i32 3
%.tmp4100 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4099
%.tmp4101 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4100, i32 0, i32 3
%.tmp4102 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4101
store %m2811$.Type.type* %.tmp4102, %m2811$.Type.type** %.tmp4095
%.tmp4103 = load i1, i1* %shallow
%.tmp4104 = icmp eq i1 %.tmp4103, 0
br i1 %.tmp4104, label %.if.true.4105, label %.if.false.4105
.if.true.4105:
%.tmp4106 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4107 = load i8*, i8** %fn_name.4080
call void(%m2811$.CompilerCtx.type*,i8*) @m311$mark_weak_global.v.m2811$.CompilerCtx.typep.cp(%m2811$.CompilerCtx.type* %.tmp4106, i8* %.tmp4107)
%.tmp4108 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4109 = load i8*, i8** %fn_name.4080
%.tmp4111 = getelementptr [7 x i8], [7 x i8]*@.str4110, i32 0, i32 0
%.tmp4112 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
call void(%m2811$.CompilerCtx.type*,i8*,i8*,%m2811$.AssignableInfo.type*,i1,i1) @m311$define_global.v.m2811$.CompilerCtx.typep.cp.cp.m2811$.AssignableInfo.typep.b.b(%m2811$.CompilerCtx.type* %.tmp4108, i8* %.tmp4109, i8* %.tmp4111, %m2811$.AssignableInfo.type* %.tmp4112, i1 1, i1 1)
%.tmp4113 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4114 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$compile_extern.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp4113, %m2811$.AssignableInfo.type* %.tmp4114)
br label %.if.end.4105
.if.false.4105:
%.tmp4115 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4116 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4117 = load i8*, i8** %fn_name.4080
%.tmp4118 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2811$.AssignableInfo.type*) @m311$define_assignable.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp4115, %m996$.Node.type* %.tmp4116, i8* %.tmp4117, %m2811$.AssignableInfo.type* %.tmp4118)
br label %.if.end.4105
.if.end.4105:
br label %.if.end.4055
.if.false.4055:
%.tmp4119 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4120 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4119, i32 0, i32 0
%.tmp4121 = load i8*, i8** %.tmp4120
%.tmp4123 = getelementptr [9 x i8], [9 x i8]*@.str4122, i32 0, i32 0
%.tmp4124 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4121, i8* %.tmp4123)
%.tmp4125 = icmp eq i32 %.tmp4124, 0
br i1 %.tmp4125, label %.if.true.4126, label %.if.false.4126
.if.true.4126:
%.tmp4127 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4128 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp4127)
store %m2811$.AssignableInfo.type* %.tmp4128, %m2811$.AssignableInfo.type** %info.3867
%.tmp4129 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp4130 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4129, i32 0, i32 3
%.tmp4132 = getelementptr [9 x i8], [9 x i8]*@.str4131, i32 0, i32 0
store i8* %.tmp4132, i8** %.tmp4130
%.tmp4133 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp4134 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4133, i32 0, i32 4
%.tmp4135 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4136 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4137 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4136, i32 0, i32 8
%.tmp4138 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4137
%.tmp4139 = call %m2811$.Type.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$syn_function_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp4135, %m996$.Node.type* %.tmp4138)
store %m2811$.Type.type* %.tmp4139, %m2811$.Type.type** %.tmp4134
%.tmp4140 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4141 = call i8*(%m996$.Node.type*) @m311$syn_function_name.cp.m996$.Node.typep(%m996$.Node.type* %.tmp4140)
%name.4142 = alloca i8*
store i8* %.tmp4141, i8** %name.4142
%.tmp4143 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4144 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4145 = load i8*, i8** %name.4142
%.tmp4146 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp4147 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4146, i32 0, i32 4
%.tmp4148 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4147
%.tmp4149 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2811$.Type.type*) @m311$name_mangle.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4143, %m996$.Node.type* %.tmp4144, i8* %.tmp4145, %m2811$.Type.type* %.tmp4148)
store i8* %.tmp4149, i8** %tmp_buff.3874
%.tmp4150 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp4151 = load i8, i8* @SCOPE_GLOBAL
%.tmp4152 = load i8*, i8** %tmp_buff.3874
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp4150, i8 %.tmp4151, i8* %.tmp4152)
%.tmp4153 = load i1, i1* %shallow
%.tmp4154 = icmp eq i1 %.tmp4153, 1
br i1 %.tmp4154, label %.if.true.4155, label %.if.false.4155
.if.true.4155:
%.tmp4156 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4157 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4158 = load i8*, i8** %name.4142
%.tmp4159 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2811$.AssignableInfo.type*) @m311$define_assignable.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp4156, %m996$.Node.type* %.tmp4157, i8* %.tmp4158, %m2811$.AssignableInfo.type* %.tmp4159)
br label %.if.end.4155
.if.false.4155:
%.tmp4160 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp4160, %m2811$.Type.type** %return_type.3868
%.tmp4161 = load %m2811$.Type.type*, %m2811$.Type.type** %return_type.3868
%.tmp4162 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp4163 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4162, i32 0, i32 4
%.tmp4164 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4163
%.tmp4165 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4164, i32 0, i32 3
%.tmp4166 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4165
call void(%m2811$.Type.type*,%m2811$.Type.type*) @m311$copy_type.v.m2811$.Type.typep.m2811$.Type.typep(%m2811$.Type.type* %.tmp4161, %m2811$.Type.type* %.tmp4166)
%.tmp4167 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4168 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4167, i32 0, i32 1
%.tmp4169 = load %m0$.File.type*, %m0$.File.type** %.tmp4168
%.tmp4171 = getelementptr [14 x i8], [14 x i8]*@.str4170, i32 0, i32 0
%.tmp4172 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4173 = load %m2811$.Type.type*, %m2811$.Type.type** %return_type.3868
%.tmp4174 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4172, %m2811$.Type.type* %.tmp4173)
%.tmp4175 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.3867
%.tmp4176 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp4175)
%.tmp4177 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4169, i8* %.tmp4171, i8* %.tmp4174, i8* %.tmp4176)
%.tmp4178 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4179 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4178, i32 0, i32 8
%.tmp4180 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4179
%.tmp4181 = call %m996$.Node.type*(%m996$.Node.type*) @m311$syn_function_params.m996$.Node.typep.m996$.Node.typep(%m996$.Node.type* %.tmp4180)
%params.4182 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4181, %m996$.Node.type** %params.4182
%param_type.4183 = alloca %m2811$.Type.type*
store %m2811$.Type.type* null, %m2811$.Type.type** %param_type.4183
%.tmp4185 = load %m996$.Node.type*, %m996$.Node.type** %params.4182
%param_ptr.4186 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4185, %m996$.Node.type** %param_ptr.4186
br label %.for.start.4184
.for.start.4184:
%.tmp4187 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4186
%.tmp4188 = icmp ne %m996$.Node.type* %.tmp4187, null
br i1 %.tmp4188, label %.for.continue.4184, label %.for.end.4184
.for.continue.4184:
%.tmp4189 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4186
%.tmp4190 = load %m996$.Node.type*, %m996$.Node.type** %params.4182
%.tmp4191 = icmp ne %m996$.Node.type* %.tmp4189, %.tmp4190
br i1 %.tmp4191, label %.if.true.4192, label %.if.false.4192
.if.true.4192:
%.tmp4193 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4186
%.tmp4194 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4193, i32 0, i32 9
%.tmp4195 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4194
store %m996$.Node.type* %.tmp4195, %m996$.Node.type** %param_ptr.4186
%.tmp4196 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4197 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4196, i32 0, i32 1
%.tmp4198 = load %m0$.File.type*, %m0$.File.type** %.tmp4197
%.tmp4200 = getelementptr [3 x i8], [3 x i8]*@.str4199, i32 0, i32 0
%.tmp4201 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4198, i8* %.tmp4200)
br label %.if.end.4192
.if.false.4192:
br label %.if.end.4192
.if.end.4192:
%.tmp4202 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4186
%.tmp4203 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4202, i32 0, i32 0
%.tmp4204 = load i8*, i8** %.tmp4203
%.tmp4206 = getelementptr [5 x i8], [5 x i8]*@.str4205, i32 0, i32 0
%.tmp4207 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4204, i8* %.tmp4206)
%.tmp4208 = icmp eq i32 %.tmp4207, 0
br i1 %.tmp4208, label %.if.true.4209, label %.if.false.4209
.if.true.4209:
%.tmp4210 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4211 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4186
%.tmp4212 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4211, i32 0, i32 8
%.tmp4213 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4212
%.tmp4214 = call %m2811$.Type.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp4210, %m996$.Node.type* %.tmp4213)
store %m2811$.Type.type* %.tmp4214, %m2811$.Type.type** %param_type.4183
%.tmp4215 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4186
%.tmp4216 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4215, i32 0, i32 9
%.tmp4217 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4216
store %m996$.Node.type* %.tmp4217, %m996$.Node.type** %param_ptr.4186
br label %.if.end.4209
.if.false.4209:
br label %.if.end.4209
.if.end.4209:
%.tmp4218 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4219 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4218, i32 0, i32 1
%.tmp4220 = load %m0$.File.type*, %m0$.File.type** %.tmp4219
%.tmp4222 = getelementptr [13 x i8], [13 x i8]*@.str4221, i32 0, i32 0
%.tmp4223 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4224 = load %m2811$.Type.type*, %m2811$.Type.type** %param_type.4183
%.tmp4225 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4223, %m2811$.Type.type* %.tmp4224)
%.tmp4226 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4186
%.tmp4227 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4226, i32 0, i32 1
%.tmp4228 = load i8*, i8** %.tmp4227
%.tmp4229 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4220, i8* %.tmp4222, i8* %.tmp4225, i8* %.tmp4228)
%.tmp4230 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4186
%.tmp4231 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4230, i32 0, i32 9
%.tmp4232 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4231
store %m996$.Node.type* %.tmp4232, %m996$.Node.type** %param_ptr.4186
br label %.for.start.4184
.for.end.4184:
%.tmp4233 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4234 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4233, i32 0, i32 1
%.tmp4235 = load %m0$.File.type*, %m0$.File.type** %.tmp4234
%.tmp4237 = getelementptr [5 x i8], [5 x i8]*@.str4236, i32 0, i32 0
%.tmp4238 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4235, i8* %.tmp4237)
%.tmp4239 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4241 = getelementptr [9 x i8], [9 x i8]*@.str4240, i32 0, i32 0
%.tmp4242 = bitcast ptr null to i8*
%.tmp4243 = bitcast ptr null to i8*
%.tmp4244 = load %m2811$.Type.type*, %m2811$.Type.type** %return_type.3868
call void(%m2811$.CompilerCtx.type*,i8*,i8*,i8*,%m2811$.Type.type*) @m311$push_scope.v.m2811$.CompilerCtx.typep.cp.cp.cp.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4239, i8* %.tmp4241, i8* %.tmp4242, i8* %.tmp4243, %m2811$.Type.type* %.tmp4244)
%.tmp4245 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4246 = load %m996$.Node.type*, %m996$.Node.type** %params.4182
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_fn_params.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp4245, %m996$.Node.type* %.tmp4246)
%.tmp4247 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4248 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4247, i32 0, i32 8
%.tmp4249 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4248
%.tmp4251 = getelementptr [6 x i8], [6 x i8]*@.str4250, i32 0, i32 0
%.tmp4252 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp4249, i8* %.tmp4251)
%fn_block.4253 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4252, %m996$.Node.type** %fn_block.4253
%.tmp4254 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4255 = load %m996$.Node.type*, %m996$.Node.type** %fn_block.4253
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_block.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp4254, %m996$.Node.type* %.tmp4255)
%.tmp4256 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
call void(%m2811$.CompilerCtx.type*) @m311$pop_scope.v.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp4256)
%.tmp4257 = bitcast ptr null to %m996$.Node.type*
%last_valid_instruction.4258 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4257, %m996$.Node.type** %last_valid_instruction.4258
%.tmp4259 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4260 = load %m996$.Node.type*, %m996$.Node.type** %fn_block.4253
%.tmp4261 = load %m2811$.Type.type*, %m2811$.Type.type** %return_type.3868
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,%m2811$.Type.type*) @m311$check_n_add_implicit_return.v.m2811$.CompilerCtx.typep.m996$.Node.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4259, %m996$.Node.type* %.tmp4260, %m2811$.Type.type* %.tmp4261)
%.tmp4262 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4263 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4262, i32 0, i32 1
%.tmp4264 = load %m0$.File.type*, %m0$.File.type** %.tmp4263
%.tmp4266 = getelementptr [3 x i8], [3 x i8]*@.str4265, i32 0, i32 0
%.tmp4267 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4264, i8* %.tmp4266)
br label %.if.end.4155
.if.end.4155:
br label %.if.end.4126
.if.false.4126:
%.tmp4268 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4269 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4268, i32 0, i32 0
%.tmp4270 = load i8*, i8** %.tmp4269
%.tmp4272 = getelementptr [7 x i8], [7 x i8]*@.str4271, i32 0, i32 0
%.tmp4273 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4270, i8* %.tmp4272)
%.tmp4274 = icmp eq i32 %.tmp4273, 0
br i1 %.tmp4274, label %.if.true.4275, label %.if.false.4275
.if.true.4275:
%.tmp4276 = load i1, i1* %shallow
%.tmp4277 = icmp eq i1 %.tmp4276, 1
br i1 %.tmp4277, label %.if.true.4278, label %.if.false.4278
.if.true.4278:
%.tmp4279 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4280 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4279, i32 0, i32 8
%.tmp4281 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4280
%.tmp4282 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4281, i32 0, i32 9
%.tmp4283 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4282
%.tmp4284 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4283, i32 0, i32 1
%.tmp4285 = load i8*, i8** %.tmp4284
%mod_name.4286 = alloca i8*
store i8* %.tmp4285, i8** %mod_name.4286
%.tmp4287 = load i8*, i8** %mod_name.4286
%.tmp4288 = call i32(i8*) @strlen(i8* %.tmp4287)
%mod_name_len.4289 = alloca i32
store i32 %.tmp4288, i32* %mod_name_len.4289
%.tmp4290 = load i32, i32* %mod_name_len.4289
%.tmp4291 = sub i32 %.tmp4290, 1
%.tmp4292 = call i8*(i32) @malloc(i32 %.tmp4291)
%trimmed_path.4293 = alloca i8*
store i8* %.tmp4292, i8** %trimmed_path.4293
%i.4295 = alloca i32
store i32 1, i32* %i.4295
br label %.for.start.4294
.for.start.4294:
%.tmp4296 = load i32, i32* %i.4295
%.tmp4297 = load i32, i32* %mod_name_len.4289
%.tmp4298 = sub i32 %.tmp4297, 1
%.tmp4299 = icmp slt i32 %.tmp4296, %.tmp4298
br i1 %.tmp4299, label %.for.continue.4294, label %.for.end.4294
.for.continue.4294:
%.tmp4300 = load i32, i32* %i.4295
%.tmp4301 = sub i32 %.tmp4300, 1
%.tmp4302 = load i8*, i8** %trimmed_path.4293
%.tmp4303 = getelementptr i8, i8* %.tmp4302, i32 %.tmp4301
%.tmp4304 = load i32, i32* %i.4295
%.tmp4305 = load i8*, i8** %mod_name.4286
%.tmp4306 = getelementptr i8, i8* %.tmp4305, i32 %.tmp4304
%.tmp4307 = load i8, i8* %.tmp4306
store i8 %.tmp4307, i8* %.tmp4303
%.tmp4308 = load i32, i32* %i.4295
%.tmp4309 = add i32 %.tmp4308, 1
store i32 %.tmp4309, i32* %i.4295
br label %.for.start.4294
.for.end.4294:
%.tmp4310 = load i32, i32* %mod_name_len.4289
%.tmp4311 = sub i32 %.tmp4310, 2
%.tmp4312 = load i8*, i8** %trimmed_path.4293
%.tmp4313 = getelementptr i8, i8* %.tmp4312, i32 %.tmp4311
store i8 0, i8* %.tmp4313
%.tmp4314 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4315 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4316 = load i8*, i8** %trimmed_path.4293
%.tmp4317 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$resolve_import_path.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp4314, %m996$.Node.type* %.tmp4315, i8* %.tmp4316)
%mod_abspath.4318 = alloca i8*
store i8* %.tmp4317, i8** %mod_abspath.4318
%.tmp4319 = load i8*, i8** %mod_abspath.4318
%.tmp4320 = call i8*(i32) @malloc(i32 4096)
%.tmp4321 = call i8*(i8*,i8*) @realpath(i8* %.tmp4319, i8* %.tmp4320)
%relpath.4322 = alloca i8*
store i8* %.tmp4321, i8** %relpath.4322
%.tmp4323 = load i8*, i8** %relpath.4322
%.tmp4324 = icmp eq i8* %.tmp4323, null
br i1 %.tmp4324, label %.if.true.4325, label %.if.false.4325
.if.true.4325:
%.tmp4326 = getelementptr i8*, i8** %err_buf.3871, i32 0
%.tmp4328 = getelementptr [54 x i8], [54 x i8]*@.str4327, i32 0, i32 0
%.tmp4329 = load i8*, i8** %mod_name.4286
%.tmp4330 = load i8*, i8** %mod_abspath.4318
%.tmp4331 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4326, i8* %.tmp4328, i8* %.tmp4329, i8* %.tmp4330)
%.tmp4332 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4333 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4334 = load i8*, i8** %err_buf.3871
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp4332, %m996$.Node.type* %.tmp4333, i8* %.tmp4334)
ret void
br label %.if.end.4325
.if.false.4325:
br label %.if.end.4325
.if.end.4325:
%.tmp4335 = load i8*, i8** %relpath.4322
store i8* %.tmp4335, i8** %mod_abspath.4318
%m.4336 = alloca %m2811$.ModuleLookup.type*
store %m2811$.ModuleLookup.type* null, %m2811$.ModuleLookup.type** %m.4336
%.tmp4337 = bitcast ptr null to %m2811$.ModuleLookup.type*
%mod.4338 = alloca %m2811$.ModuleLookup.type*
store %m2811$.ModuleLookup.type* %.tmp4337, %m2811$.ModuleLookup.type** %mod.4338
%.tmp4340 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4341 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4340, i32 0, i32 6
%.tmp4342 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %.tmp4341
store %m2811$.ModuleLookup.type* %.tmp4342, %m2811$.ModuleLookup.type** %m.4336
br label %.for.start.4339
.for.start.4339:
%.tmp4343 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.4336
%.tmp4344 = icmp ne %m2811$.ModuleLookup.type* %.tmp4343, null
%.tmp4345 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.4338
%.tmp4346 = icmp eq %m2811$.ModuleLookup.type* %.tmp4345, null
%.tmp4347 = and i1 %.tmp4344, %.tmp4346
br i1 %.tmp4347, label %.for.continue.4339, label %.for.end.4339
.for.continue.4339:
%.tmp4348 = load i8*, i8** %mod_abspath.4318
%.tmp4349 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.4336
%.tmp4350 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp4349, i32 0, i32 0
%.tmp4351 = load i8*, i8** %.tmp4350
%.tmp4352 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4348, i8* %.tmp4351)
%.tmp4353 = icmp eq i32 %.tmp4352, 0
br i1 %.tmp4353, label %.if.true.4354, label %.if.false.4354
.if.true.4354:
%.tmp4355 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.4336
store %m2811$.ModuleLookup.type* %.tmp4355, %m2811$.ModuleLookup.type** %mod.4338
br label %.if.end.4354
.if.false.4354:
br label %.if.end.4354
.if.end.4354:
%.tmp4356 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.4336
%.tmp4357 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp4356, i32 0, i32 2
%.tmp4358 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %.tmp4357
store %m2811$.ModuleLookup.type* %.tmp4358, %m2811$.ModuleLookup.type** %m.4336
br label %.for.start.4339
.for.end.4339:
%.tmp4359 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4360 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4359, i32 0, i32 8
%.tmp4361 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4360
%.tmp4362 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4361, i32 0, i32 9
%.tmp4363 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4362
%.tmp4364 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4363, i32 0, i32 9
%.tmp4365 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4364
%.tmp4366 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4365, i32 0, i32 9
%.tmp4367 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4366
%.tmp4368 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4367, i32 0, i32 1
%.tmp4369 = load i8*, i8** %.tmp4368
%asname.4370 = alloca i8*
store i8* %.tmp4369, i8** %asname.4370
%.tmp4371 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.4338
%.tmp4372 = icmp eq %m2811$.ModuleLookup.type* %.tmp4371, null
br i1 %.tmp4372, label %.if.true.4373, label %.if.false.4373
.if.true.4373:
%.tmp4374 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* null, i32 1
%.tmp4375 = ptrtoint %m2811$.ModuleLookup.type* %.tmp4374 to i32
%.tmp4376 = call i8*(i32) @malloc(i32 %.tmp4375)
%.tmp4377 = bitcast i8* %.tmp4376 to %m2811$.ModuleLookup.type*
store %m2811$.ModuleLookup.type* %.tmp4377, %m2811$.ModuleLookup.type** %mod.4338
%.tmp4378 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.4338
%.tmp4379 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp4378, i32 0, i32 0
%.tmp4380 = load i8*, i8** %mod_abspath.4318
store i8* %.tmp4380, i8** %.tmp4379
%.tmp4381 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.4338
%.tmp4382 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp4381, i32 0, i32 2
store %m2811$.ModuleLookup.type* null, %m2811$.ModuleLookup.type** %.tmp4382
%.tmp4383 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.4338
%.tmp4384 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp4383, i32 0, i32 3
store %m2811$.Scope.type* null, %m2811$.Scope.type** %.tmp4384
%.tmp4385 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.4338
%.tmp4386 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp4385, i32 0, i32 1
%.tmp4387 = getelementptr i8*, i8** %.tmp4386, i32 0
%.tmp4389 = getelementptr [5 x i8], [5 x i8]*@.str4388, i32 0, i32 0
%.tmp4390 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4391 = call i32(%m2811$.CompilerCtx.type*) @m311$new_uid.i.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp4390)
%.tmp4392 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4387, i8* %.tmp4389, i32 %.tmp4391)
%.tmp4394 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4395 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4394, i32 0, i32 6
%.tmp4396 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %.tmp4395
store %m2811$.ModuleLookup.type* %.tmp4396, %m2811$.ModuleLookup.type** %m.4336
br label %.for.start.4393
.for.start.4393:
%.tmp4397 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.4336
%.tmp4398 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp4397, i32 0, i32 2
%.tmp4399 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %.tmp4398
%.tmp4400 = icmp ne %m2811$.ModuleLookup.type* %.tmp4399, null
br i1 %.tmp4400, label %.for.continue.4393, label %.for.end.4393
.for.continue.4393:
%.tmp4401 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.4336
%.tmp4402 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp4401, i32 0, i32 2
%.tmp4403 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %.tmp4402
store %m2811$.ModuleLookup.type* %.tmp4403, %m2811$.ModuleLookup.type** %m.4336
br label %.for.start.4393
.for.end.4393:
%.tmp4404 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %m.4336
%.tmp4405 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp4404, i32 0, i32 2
%.tmp4406 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.4338
store %m2811$.ModuleLookup.type* %.tmp4406, %m2811$.ModuleLookup.type** %.tmp4405
%.tmp4407 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4408 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4409 = load i8*, i8** %asname.4370
%.tmp4410 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.4338
%.tmp4411 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp4410, i32 0, i32 0
%.tmp4412 = load i8*, i8** %.tmp4411
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*,i8*) @m311$define_module.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp.cp(%m2811$.CompilerCtx.type* %.tmp4407, %m996$.Node.type* %.tmp4408, i8* %.tmp4409, i8* %.tmp4412)
%.tmp4413 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4414 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4413, i32 0, i32 7
%.tmp4415 = load i8*, i8** %.tmp4414
%curr_mod.4416 = alloca i8*
store i8* %.tmp4415, i8** %curr_mod.4416
%.tmp4417 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4418 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4417, i32 0, i32 7
%.tmp4419 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.4338
%.tmp4420 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp4419, i32 0, i32 0
%.tmp4421 = load i8*, i8** %.tmp4420
store i8* %.tmp4421, i8** %.tmp4418
%.tmp4422 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4423 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4424 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.4338
%.tmp4425 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp4424, i32 0, i32 0
%.tmp4426 = load i8*, i8** %.tmp4425
%.tmp4427 = call i1(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$compile_file.b.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp4422, %m996$.Node.type* %.tmp4423, i8* %.tmp4426)
%.tmp4428 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4429 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4428, i32 0, i32 7
%.tmp4430 = load i8*, i8** %curr_mod.4416
store i8* %.tmp4430, i8** %.tmp4429
br label %.if.end.4373
.if.false.4373:
%.tmp4431 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4432 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4433 = load i8*, i8** %asname.4370
%.tmp4434 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.4338
%.tmp4435 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp4434, i32 0, i32 0
%.tmp4436 = load i8*, i8** %.tmp4435
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*,i8*) @m311$define_module.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp.cp(%m2811$.CompilerCtx.type* %.tmp4431, %m996$.Node.type* %.tmp4432, i8* %.tmp4433, i8* %.tmp4436)
br label %.if.end.4373
.if.end.4373:
br label %.if.end.4278
.if.false.4278:
br label %.if.end.4278
.if.end.4278:
br label %.if.end.4275
.if.false.4275:
%.tmp4437 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4438 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4440 = getelementptr [40 x i8], [40 x i8]*@.str4439, i32 0, i32 0
%.tmp4441 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp4437, %m996$.Node.type* %.tmp4438, i8* %.tmp4440)
%.tmp4442 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4443 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4442, i32 0, i32 0
%.tmp4444 = load i8*, i8** %.tmp4443
%.tmp4445 = call i32(i8*,...) @printf(i8* %.tmp4441, i8* %.tmp4444)
br label %.if.end.4275
.if.end.4275:
br label %.if.end.4126
.if.end.4126:
br label %.if.end.4055
.if.end.4055:
br label %.if.end.3956
.if.end.3956:
br label %.if.end.3890
.if.end.3890:
br label %.if.end.3882
.if.end.3882:
ret void
}
define i8* @m311$err_tmpl.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp4447 = getelementptr [1 x i8], [1 x i8]*@.str4446, i32 0, i32 0
%buf.4448 = alloca i8*
store i8* %.tmp4447, i8** %buf.4448
%.tmp4449 = getelementptr i8*, i8** %buf.4448, i32 0
%.tmp4451 = getelementptr [31 x i8], [31 x i8]*@.str4450, i32 0, i32 0
%.tmp4452 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4453 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4452, i32 0, i32 7
%.tmp4454 = load i8*, i8** %.tmp4453
%.tmp4455 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4456 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4455, i32 0, i32 3
%.tmp4457 = load i32, i32* %.tmp4456
%.tmp4458 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4459 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4458, i32 0, i32 4
%.tmp4460 = load i32, i32* %.tmp4459
%.tmp4461 = load i8*, i8** %msg
%.tmp4462 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4449, i8* %.tmp4451, i8* %.tmp4454, i32 %.tmp4457, i32 %.tmp4460, i8* %.tmp4461)
%.tmp4463 = load i8*, i8** %buf.4448
ret i8* %.tmp4463
}
define void @m311$compile_fn_params.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.fn_params.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%fn_params = alloca %m996$.Node.type*
store %m996$.Node.type* %.fn_params.arg, %m996$.Node.type** %fn_params
%param_type.4464 = alloca %m2811$.Type.type*
store %m2811$.Type.type* null, %m2811$.Type.type** %param_type.4464
%.tmp4466 = load %m996$.Node.type*, %m996$.Node.type** %fn_params
%param_ptr.4467 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4466, %m996$.Node.type** %param_ptr.4467
br label %.for.start.4465
.for.start.4465:
%.tmp4468 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4467
%.tmp4469 = icmp ne %m996$.Node.type* %.tmp4468, null
br i1 %.tmp4469, label %.for.continue.4465, label %.for.end.4465
.for.continue.4465:
%.tmp4470 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4467
%.tmp4471 = load %m996$.Node.type*, %m996$.Node.type** %fn_params
%.tmp4472 = icmp ne %m996$.Node.type* %.tmp4470, %.tmp4471
br i1 %.tmp4472, label %.if.true.4473, label %.if.false.4473
.if.true.4473:
%.tmp4474 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4467
%.tmp4475 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4474, i32 0, i32 9
%.tmp4476 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4475
store %m996$.Node.type* %.tmp4476, %m996$.Node.type** %param_ptr.4467
br label %.if.end.4473
.if.false.4473:
br label %.if.end.4473
.if.end.4473:
%.tmp4477 = load %m996$.Node.type*, %m996$.Node.type** %fn_params
%.tmp4478 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp4477)
%param_info.4479 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp4478, %m2811$.AssignableInfo.type** %param_info.4479
%.tmp4480 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %param_info.4479
%.tmp4481 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4480, i32 0, i32 3
%.tmp4483 = getelementptr [9 x i8], [9 x i8]*@.str4482, i32 0, i32 0
store i8* %.tmp4483, i8** %.tmp4481
%.tmp4484 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4467
%.tmp4485 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4484, i32 0, i32 0
%.tmp4486 = load i8*, i8** %.tmp4485
%.tmp4488 = getelementptr [5 x i8], [5 x i8]*@.str4487, i32 0, i32 0
%.tmp4489 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4486, i8* %.tmp4488)
%.tmp4490 = icmp eq i32 %.tmp4489, 0
br i1 %.tmp4490, label %.if.true.4491, label %.if.false.4491
.if.true.4491:
%.tmp4492 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4493 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4467
%.tmp4494 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4493, i32 0, i32 8
%.tmp4495 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4494
%.tmp4496 = call %m2811$.Type.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp4492, %m996$.Node.type* %.tmp4495)
store %m2811$.Type.type* %.tmp4496, %m2811$.Type.type** %param_type.4464
%.tmp4497 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4467
%.tmp4498 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4497, i32 0, i32 9
%.tmp4499 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4498
store %m996$.Node.type* %.tmp4499, %m996$.Node.type** %param_ptr.4467
br label %.if.end.4491
.if.false.4491:
br label %.if.end.4491
.if.end.4491:
%.tmp4500 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %param_info.4479
%.tmp4501 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4500, i32 0, i32 4
%.tmp4502 = load %m2811$.Type.type*, %m2811$.Type.type** %param_type.4464
store %m2811$.Type.type* %.tmp4502, %m2811$.Type.type** %.tmp4501
%.tmp4503 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4467
%.tmp4504 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4503, i32 0, i32 1
%.tmp4505 = load i8*, i8** %.tmp4504
%var_name.4506 = alloca i8*
store i8* %.tmp4505, i8** %var_name.4506
%.tmp4507 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %param_info.4479
%.tmp4508 = load i8, i8* @SCOPE_LOCAL
%.tmp4509 = load i8*, i8** %var_name.4506
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp4507, i8 %.tmp4508, i8* %.tmp4509)
%.tmp4510 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4511 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %param_info.4479
%.tmp4512 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4511, i32 0, i32 4
%.tmp4513 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4512
%.tmp4514 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4510, %m2811$.Type.type* %.tmp4513)
%param_info_tr.4515 = alloca i8*
store i8* %.tmp4514, i8** %param_info_tr.4515
%.tmp4516 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4517 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4516, i32 0, i32 1
%.tmp4518 = load %m0$.File.type*, %m0$.File.type** %.tmp4517
%.tmp4520 = getelementptr [16 x i8], [16 x i8]*@.str4519, i32 0, i32 0
%.tmp4521 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %param_info.4479
%.tmp4522 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp4521)
%.tmp4523 = load i8*, i8** %param_info_tr.4515
%.tmp4524 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4518, i8* %.tmp4520, i8* %.tmp4522, i8* %.tmp4523)
%.tmp4525 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4526 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4467
%.tmp4527 = load i8*, i8** %var_name.4506
%.tmp4528 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %param_info.4479
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2811$.AssignableInfo.type*) @m311$define_assignable.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp4525, %m996$.Node.type* %.tmp4526, i8* %.tmp4527, %m2811$.AssignableInfo.type* %.tmp4528)
%.tmp4529 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4530 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4529, i32 0, i32 1
%.tmp4531 = load %m0$.File.type*, %m0$.File.type** %.tmp4530
%.tmp4533 = getelementptr [28 x i8], [28 x i8]*@.str4532, i32 0, i32 0
%.tmp4534 = load i8*, i8** %param_info_tr.4515
%.tmp4535 = load i8*, i8** %var_name.4506
%.tmp4536 = load i8*, i8** %param_info_tr.4515
%.tmp4537 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %param_info.4479
%.tmp4538 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp4537)
%.tmp4539 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4531, i8* %.tmp4533, i8* %.tmp4534, i8* %.tmp4535, i8* %.tmp4536, i8* %.tmp4538)
%.tmp4540 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.4467
%.tmp4541 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4540, i32 0, i32 9
%.tmp4542 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4541
store %m996$.Node.type* %.tmp4542, %m996$.Node.type** %param_ptr.4467
br label %.for.start.4465
.for.end.4465:
ret void
}
define void @m311$compile_block.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp4543 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4545 = getelementptr [6 x i8], [6 x i8]*@.str4544, i32 0, i32 0
%.tmp4546 = bitcast ptr null to i8*
%.tmp4547 = bitcast ptr null to i8*
%.tmp4548 = bitcast ptr null to %m2811$.Type.type*
call void(%m2811$.CompilerCtx.type*,i8*,i8*,i8*,%m2811$.Type.type*) @m311$push_scope.v.m2811$.CompilerCtx.typep.cp.cp.cp.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4543, i8* %.tmp4545, i8* %.tmp4546, i8* %.tmp4547, %m2811$.Type.type* %.tmp4548)
%.tmp4549 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4550 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4549, i32 0, i32 8
%.tmp4551 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4550
%.tmp4553 = getelementptr [12 x i8], [12 x i8]*@.str4552, i32 0, i32 0
%.tmp4554 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp4551, i8* %.tmp4553)
%exprs.4555 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4554, %m996$.Node.type** %exprs.4555
%.tmp4556 = load %m996$.Node.type*, %m996$.Node.type** %exprs.4555
%.tmp4557 = icmp ne %m996$.Node.type* %.tmp4556, null
br i1 %.tmp4557, label %.if.true.4558, label %.if.false.4558
.if.true.4558:
%.tmp4560 = load %m996$.Node.type*, %m996$.Node.type** %exprs.4555
%.tmp4561 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4560, i32 0, i32 8
%.tmp4562 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4561
%b.4563 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4562, %m996$.Node.type** %b.4563
br label %.for.start.4559
.for.start.4559:
%.tmp4564 = load %m996$.Node.type*, %m996$.Node.type** %b.4563
%.tmp4565 = icmp ne %m996$.Node.type* %.tmp4564, null
br i1 %.tmp4565, label %.for.continue.4559, label %.for.end.4559
.for.continue.4559:
%.tmp4566 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4567 = load %m996$.Node.type*, %m996$.Node.type** %b.4563
%.tmp4568 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4567, i32 0, i32 8
%.tmp4569 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4568
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_expression.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp4566, %m996$.Node.type* %.tmp4569)
%.tmp4570 = load %m996$.Node.type*, %m996$.Node.type** %b.4563
%.tmp4571 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4570, i32 0, i32 9
%.tmp4572 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4571
store %m996$.Node.type* %.tmp4572, %m996$.Node.type** %b.4563
br label %.for.start.4559
.for.end.4559:
br label %.if.end.4558
.if.false.4558:
br label %.if.end.4558
.if.end.4558:
%.tmp4573 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
call void(%m2811$.CompilerCtx.type*) @m311$pop_scope.v.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp4573)
ret void
}
define %m2811$.AssignableInfo.type* @m311$get_struct_attr.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep.i(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, i32 %.attr_id.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%.tmp4574 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4575 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4576 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_addr.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp4574, %m996$.Node.type* %.tmp4575)
%val.4577 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp4576, %m2811$.AssignableInfo.type** %val.4577
%.tmp4578 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %val.4577
%.tmp4579 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4578, i32 0, i32 4
%.tmp4580 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4579
%.tmp4581 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4580, i32 0, i32 0
%.tmp4582 = load i8*, i8** %.tmp4581
%.tmp4584 = getelementptr [7 x i8], [7 x i8]*@.str4583, i32 0, i32 0
%.tmp4585 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4582, i8* %.tmp4584)
%.tmp4586 = icmp ne i32 %.tmp4585, 0
br i1 %.tmp4586, label %.if.true.4587, label %.if.false.4587
.if.true.4587:
%.tmp4589 = getelementptr [7 x i8], [7 x i8]*@.str4588, i32 0, i32 0
%.tmp4590 = call i32(i8*,...) @printf(i8* %.tmp4589)
%.tmp4591 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp4591
br label %.if.end.4587
.if.false.4587:
br label %.if.end.4587
.if.end.4587:
%.tmp4592 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %val.4577
%.tmp4593 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4592, i32 0, i32 4
%.tmp4594 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4593
%.tmp4595 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4594, i32 0, i32 3
%.tmp4596 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4595
%node_type.4597 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp4596, %m2811$.Type.type** %node_type.4597
%i.4599 = alloca i32
store i32 0, i32* %i.4599
br label %.for.start.4598
.for.start.4598:
%.tmp4600 = load i32, i32* %i.4599
%.tmp4601 = load i32, i32* %attr_id
%.tmp4602 = icmp slt i32 %.tmp4600, %.tmp4601
br i1 %.tmp4602, label %.for.continue.4598, label %.for.end.4598
.for.continue.4598:
%.tmp4603 = load %m2811$.Type.type*, %m2811$.Type.type** %node_type.4597
%.tmp4604 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4603, i32 0, i32 4
%.tmp4605 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4604
store %m2811$.Type.type* %.tmp4605, %m2811$.Type.type** %node_type.4597
%.tmp4606 = load i32, i32* %i.4599
%.tmp4607 = add i32 %.tmp4606, 1
store i32 %.tmp4607, i32* %i.4599
br label %.for.start.4598
.for.end.4598:
%.tmp4608 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4609 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp4608)
%info.4610 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp4609, %m2811$.AssignableInfo.type** %info.4610
%.tmp4611 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.4610
%.tmp4612 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4611, i32 0, i32 4
%.tmp4613 = load %m2811$.Type.type*, %m2811$.Type.type** %node_type.4597
store %m2811$.Type.type* %.tmp4613, %m2811$.Type.type** %.tmp4612
%.tmp4614 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4615 = call i32(%m2811$.CompilerCtx.type*) @m311$new_uid.i.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp4614)
%tmp_id.4616 = alloca i32
store i32 %.tmp4615, i32* %tmp_id.4616
%.tmp4617 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4618 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %val.4577
%.tmp4619 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4618, i32 0, i32 4
%.tmp4620 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4619
%.tmp4621 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4617, %m2811$.Type.type* %.tmp4620)
%type_as_str.4622 = alloca i8*
store i8* %.tmp4621, i8** %type_as_str.4622
%.tmp4623 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4624 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.4610
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp4623, %m2811$.AssignableInfo.type* %.tmp4624)
%.tmp4625 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4626 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4625, i32 0, i32 1
%.tmp4627 = load %m0$.File.type*, %m0$.File.type** %.tmp4626
%.tmp4629 = getelementptr [52 x i8], [52 x i8]*@.str4628, i32 0, i32 0
%.tmp4630 = load i32, i32* %tmp_id.4616
%.tmp4631 = load i8*, i8** %type_as_str.4622
%.tmp4632 = load i8*, i8** %type_as_str.4622
%.tmp4633 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %val.4577
%.tmp4634 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp4633)
%.tmp4635 = load i32, i32* %attr_id
%.tmp4636 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4627, i8* %.tmp4629, i32 %.tmp4630, i8* %.tmp4631, i8* %.tmp4632, i8* %.tmp4634, i32 %.tmp4635)
%.tmp4637 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4638 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4637, i32 0, i32 1
%.tmp4639 = load %m0$.File.type*, %m0$.File.type** %.tmp4638
%.tmp4641 = getelementptr [28 x i8], [28 x i8]*@.str4640, i32 0, i32 0
%.tmp4642 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.4610
%.tmp4643 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp4642)
%.tmp4644 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4645 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.4610
%.tmp4646 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4645, i32 0, i32 4
%.tmp4647 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4646
%.tmp4648 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4644, %m2811$.Type.type* %.tmp4647)
%.tmp4649 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4650 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.4610
%.tmp4651 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4650, i32 0, i32 4
%.tmp4652 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4651
%.tmp4653 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4649, %m2811$.Type.type* %.tmp4652)
%.tmp4654 = load i32, i32* %tmp_id.4616
%.tmp4655 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4639, i8* %.tmp4641, i8* %.tmp4643, i8* %.tmp4648, i8* %.tmp4653, i32 %.tmp4654)
%.tmp4656 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.4610
ret %m2811$.AssignableInfo.type* %.tmp4656
}
define void @m311$set_struct_attr.v.m2811$.CompilerCtx.typep.m996$.Node.typep.i.cp(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, i32 %.attr_id.arg, i8* %.attr.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%attr_id = alloca i32
store i32 %.attr_id.arg, i32* %attr_id
%attr = alloca i8*
store i8* %.attr.arg, i8** %attr
%.tmp4657 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4658 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4659 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_addr.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp4657, %m996$.Node.type* %.tmp4658)
%val.4660 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp4659, %m2811$.AssignableInfo.type** %val.4660
%.tmp4661 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %val.4660
%.tmp4662 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4661, i32 0, i32 4
%.tmp4663 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4662
%.tmp4664 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4663, i32 0, i32 0
%.tmp4665 = load i8*, i8** %.tmp4664
%.tmp4667 = getelementptr [7 x i8], [7 x i8]*@.str4666, i32 0, i32 0
%.tmp4668 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4665, i8* %.tmp4667)
%.tmp4669 = icmp ne i32 %.tmp4668, 0
br i1 %.tmp4669, label %.if.true.4670, label %.if.false.4670
.if.true.4670:
%.tmp4672 = getelementptr [7 x i8], [7 x i8]*@.str4671, i32 0, i32 0
%.tmp4673 = call i32(i8*,...) @printf(i8* %.tmp4672)
ret void
br label %.if.end.4670
.if.false.4670:
br label %.if.end.4670
.if.end.4670:
%.tmp4674 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %val.4660
%.tmp4675 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4674, i32 0, i32 4
%.tmp4676 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4675
%.tmp4677 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4676, i32 0, i32 3
%.tmp4678 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4677
%node_type.4679 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp4678, %m2811$.Type.type** %node_type.4679
%i.4681 = alloca i32
store i32 0, i32* %i.4681
br label %.for.start.4680
.for.start.4680:
%.tmp4682 = load i32, i32* %i.4681
%.tmp4683 = load i32, i32* %attr_id
%.tmp4684 = icmp slt i32 %.tmp4682, %.tmp4683
br i1 %.tmp4684, label %.for.continue.4680, label %.for.end.4680
.for.continue.4680:
%.tmp4685 = load %m2811$.Type.type*, %m2811$.Type.type** %node_type.4679
%.tmp4686 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4685, i32 0, i32 4
%.tmp4687 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4686
store %m2811$.Type.type* %.tmp4687, %m2811$.Type.type** %node_type.4679
%.tmp4688 = load i32, i32* %i.4681
%.tmp4689 = add i32 %.tmp4688, 1
store i32 %.tmp4689, i32* %i.4681
br label %.for.start.4680
.for.end.4680:
%.tmp4690 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4691 = call i32(%m2811$.CompilerCtx.type*) @m311$new_uid.i.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp4690)
%tmp_id.4692 = alloca i32
store i32 %.tmp4691, i32* %tmp_id.4692
%.tmp4693 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4694 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %val.4660
%.tmp4695 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4694, i32 0, i32 4
%.tmp4696 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4695
%.tmp4697 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4693, %m2811$.Type.type* %.tmp4696)
%type_as_str.4698 = alloca i8*
store i8* %.tmp4697, i8** %type_as_str.4698
%.tmp4699 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4700 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4699, i32 0, i32 1
%.tmp4701 = load %m0$.File.type*, %m0$.File.type** %.tmp4700
%.tmp4703 = getelementptr [52 x i8], [52 x i8]*@.str4702, i32 0, i32 0
%.tmp4704 = load i32, i32* %tmp_id.4692
%.tmp4705 = load i8*, i8** %type_as_str.4698
%.tmp4706 = load i8*, i8** %type_as_str.4698
%.tmp4707 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %val.4660
%.tmp4708 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp4707)
%.tmp4709 = load i32, i32* %attr_id
%.tmp4710 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4701, i8* %.tmp4703, i32 %.tmp4704, i8* %.tmp4705, i8* %.tmp4706, i8* %.tmp4708, i32 %.tmp4709)
%.tmp4711 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4712 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4711, i32 0, i32 1
%.tmp4713 = load %m0$.File.type*, %m0$.File.type** %.tmp4712
%.tmp4715 = getelementptr [18 x i8], [18 x i8]*@.str4714, i32 0, i32 0
%.tmp4716 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4717 = load %m2811$.Type.type*, %m2811$.Type.type** %node_type.4679
%.tmp4718 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4716, %m2811$.Type.type* %.tmp4717)
%.tmp4719 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4720 = load %m2811$.Type.type*, %m2811$.Type.type** %node_type.4679
%.tmp4721 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4719, %m2811$.Type.type* %.tmp4720)
%.tmp4722 = load i8*, i8** %attr
%.tmp4723 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4713, i8* %.tmp4715, i8* %.tmp4718, i8* %.tmp4721, i8* %.tmp4722)
ret void
}
define %m2811$.AssignableInfo.type* @m311$compile_builtin.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp4724 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4725 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4724, i32 0, i32 8
%.tmp4726 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4725
%.tmp4727 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4726, i32 0, i32 8
%.tmp4728 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4727
%dotted.4729 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4728, %m996$.Node.type** %dotted.4729
%.tmp4730 = load %m996$.Node.type*, %m996$.Node.type** %dotted.4729
%.tmp4731 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4730, i32 0, i32 9
%.tmp4732 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4731
%.tmp4733 = icmp ne %m996$.Node.type* %.tmp4732, null
br i1 %.tmp4733, label %.if.true.4734, label %.if.false.4734
.if.true.4734:
%.tmp4735 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp4735
br label %.if.end.4734
.if.false.4734:
br label %.if.end.4734
.if.end.4734:
%.tmp4736 = load %m996$.Node.type*, %m996$.Node.type** %dotted.4729
%.tmp4737 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4736, i32 0, i32 1
%.tmp4738 = load i8*, i8** %.tmp4737
%.tmp4740 = getelementptr [7 x i8], [7 x i8]*@.str4739, i32 0, i32 0
%.tmp4741 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4738, i8* %.tmp4740)
%.tmp4742 = icmp eq i32 %.tmp4741, 0
br i1 %.tmp4742, label %.if.true.4743, label %.if.false.4743
.if.true.4743:
%.tmp4744 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4746 = getelementptr [8 x i8], [8 x i8]*@.str4745, i32 0, i32 0
%.tmp4747 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp4744, i8* %.tmp4746)
%args.4748 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4747, %m996$.Node.type** %args.4748
%.tmp4749 = load %m996$.Node.type*, %m996$.Node.type** %args.4748
%.tmp4750 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4749, i32 0, i32 8
%.tmp4751 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4750
%.tmp4753 = getelementptr [11 x i8], [11 x i8]*@.str4752, i32 0, i32 0
%.tmp4754 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp4751, i8* %.tmp4753)
%value.4755 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4754, %m996$.Node.type** %value.4755
%.tmp4756 = load %m996$.Node.type*, %m996$.Node.type** %value.4755
%.tmp4757 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4756, i32 0, i32 8
%.tmp4758 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4757
%.tmp4759 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4758, i32 0, i32 8
%.tmp4760 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4759
%.tmp4761 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4760, i32 0, i32 8
%.tmp4762 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4761
%.tmp4763 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4762, i32 0, i32 8
%.tmp4764 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4763
store %m996$.Node.type* %.tmp4764, %m996$.Node.type** %value.4755
%.tmp4765 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4766 = call i32(%m2811$.CompilerCtx.type*) @m311$new_uid.i.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp4765)
%tmp_id.4767 = alloca i32
store i32 %.tmp4766, i32* %tmp_id.4767
%.tmp4768 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4769 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp4768)
%info.4770 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp4769, %m2811$.AssignableInfo.type** %info.4770
%.tmp4771 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4772 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.4770
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp4771, %m2811$.AssignableInfo.type* %.tmp4772)
%.tmp4773 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.4770
%.tmp4774 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4773, i32 0, i32 4
%.tmp4775 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp4775, %m2811$.Type.type** %.tmp4774
%.tmp4776 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.4770
%.tmp4777 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4776, i32 0, i32 4
%.tmp4778 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4777
%.tmp4779 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4778, i32 0, i32 0
%.tmp4781 = getelementptr [4 x i8], [4 x i8]*@.str4780, i32 0, i32 0
store i8* %.tmp4781, i8** %.tmp4779
%.tmp4782 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4783 = load %m996$.Node.type*, %m996$.Node.type** %value.4755
%.tmp4784 = call %m2811$.Type.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp4782, %m996$.Node.type* %.tmp4783)
%inspected_type.4785 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp4784, %m2811$.Type.type** %inspected_type.4785
%.tmp4786 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4787 = load %m2811$.Type.type*, %m2811$.Type.type** %inspected_type.4785
%.tmp4788 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4786, %m2811$.Type.type* %.tmp4787)
%type_as_str.4789 = alloca i8*
store i8* %.tmp4788, i8** %type_as_str.4789
%.tmp4790 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4791 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4790, i32 0, i32 1
%.tmp4792 = load %m0$.File.type*, %m0$.File.type** %.tmp4791
%.tmp4794 = getelementptr [46 x i8], [46 x i8]*@.str4793, i32 0, i32 0
%.tmp4795 = load i32, i32* %tmp_id.4767
%.tmp4796 = load i8*, i8** %type_as_str.4789
%.tmp4797 = load i8*, i8** %type_as_str.4789
%.tmp4798 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4792, i8* %.tmp4794, i32 %.tmp4795, i8* %.tmp4796, i8* %.tmp4797)
%.tmp4799 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4800 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4799, i32 0, i32 1
%.tmp4801 = load %m0$.File.type*, %m0$.File.type** %.tmp4800
%.tmp4803 = getelementptr [35 x i8], [35 x i8]*@.str4802, i32 0, i32 0
%.tmp4804 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.4770
%.tmp4805 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp4804)
%.tmp4806 = load i8*, i8** %type_as_str.4789
%.tmp4807 = load i32, i32* %tmp_id.4767
%.tmp4808 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4801, i8* %.tmp4803, i8* %.tmp4805, i8* %.tmp4806, i32 %.tmp4807)
%.tmp4809 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.4770
ret %m2811$.AssignableInfo.type* %.tmp4809
br label %.if.end.4743
.if.false.4743:
%.tmp4810 = load %m996$.Node.type*, %m996$.Node.type** %dotted.4729
%.tmp4811 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4810, i32 0, i32 1
%.tmp4812 = load i8*, i8** %.tmp4811
%.tmp4814 = getelementptr [7 x i8], [7 x i8]*@.str4813, i32 0, i32 0
%.tmp4815 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp4812, i8* %.tmp4814)
%.tmp4816 = icmp eq i32 %.tmp4815, 0
br i1 %.tmp4816, label %.if.true.4817, label %.if.false.4817
.if.true.4817:
%.tmp4818 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4820 = getelementptr [8 x i8], [8 x i8]*@.str4819, i32 0, i32 0
%.tmp4821 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp4818, i8* %.tmp4820)
%args.4822 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4821, %m996$.Node.type** %args.4822
%.tmp4823 = load %m996$.Node.type*, %m996$.Node.type** %args.4822
%.tmp4824 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4823, i32 0, i32 8
%.tmp4825 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4824
%.tmp4827 = getelementptr [11 x i8], [11 x i8]*@.str4826, i32 0, i32 0
%.tmp4828 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp4825, i8* %.tmp4827)
%array.4829 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4828, %m996$.Node.type** %array.4829
%.tmp4830 = load %m996$.Node.type*, %m996$.Node.type** %array.4829
%.tmp4831 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp4830, i32 0, i32 9
%.tmp4832 = load %m996$.Node.type*, %m996$.Node.type** %.tmp4831
%.tmp4834 = getelementptr [11 x i8], [11 x i8]*@.str4833, i32 0, i32 0
%.tmp4835 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp4832, i8* %.tmp4834)
%value.4836 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp4835, %m996$.Node.type** %value.4836
%.tmp4837 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4838 = load %m996$.Node.type*, %m996$.Node.type** %value.4836
%.tmp4839 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp4837, %m996$.Node.type* %.tmp4838)
%value_info.4840 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp4839, %m2811$.AssignableInfo.type** %value_info.4840
%.tmp4841 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4842 = load %m996$.Node.type*, %m996$.Node.type** %array.4829
%.tmp4843 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_addr.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp4841, %m996$.Node.type* %.tmp4842)
%array_info.4844 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp4843, %m2811$.AssignableInfo.type** %array_info.4844
%.tmp4845 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4846 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp4845)
%info.4847 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp4846, %m2811$.AssignableInfo.type** %info.4847
%.tmp4848 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4849 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.4847
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp4848, %m2811$.AssignableInfo.type* %.tmp4849)
%.tmp4850 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.4847
%.tmp4851 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4850, i32 0, i32 4
%.tmp4852 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %array_info.4844
%.tmp4853 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4852, i32 0, i32 4
%.tmp4854 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4853
store %m2811$.Type.type* %.tmp4854, %m2811$.Type.type** %.tmp4851
%.tmp4856 = getelementptr [1 x i8], [1 x i8]*@.str4855, i32 0, i32 0
%builtin_prefix.4857 = alloca i8*
store i8* %.tmp4856, i8** %builtin_prefix.4857
%.tmp4858 = getelementptr i8*, i8** %builtin_prefix.4857, i32 0
%.tmp4860 = getelementptr [5 x i8], [5 x i8]*@.str4859, i32 0, i32 0
%.tmp4861 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4862 = call i32(%m2811$.CompilerCtx.type*) @m311$new_uid.i.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp4861)
%.tmp4863 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4858, i8* %.tmp4860, i32 %.tmp4862)
%.tmp4864 = call i8*() @m2362$append_tmpl.cp()
%tmpl.4865 = alloca i8*
store i8* %.tmp4864, i8** %tmpl.4865
%.tmp4866 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4867 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp4866, i32 0, i32 1
%.tmp4868 = load %m0$.File.type*, %m0$.File.type** %.tmp4867
%.tmp4869 = load i8*, i8** %tmpl.4865
%.tmp4870 = load i8*, i8** %builtin_prefix.4857
%.tmp4871 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4872 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %array_info.4844
%.tmp4873 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4872, i32 0, i32 4
%.tmp4874 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4873
%.tmp4875 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4871, %m2811$.Type.type* %.tmp4874)
%.tmp4876 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %array_info.4844
%.tmp4877 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp4876)
%.tmp4878 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4879 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %value_info.4840
%.tmp4880 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4879, i32 0, i32 4
%.tmp4881 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4880
%.tmp4882 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp4878, %m2811$.Type.type* %.tmp4881)
%.tmp4883 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %value_info.4840
%.tmp4884 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp4883)
%.tmp4885 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.4847
%.tmp4886 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp4885)
%.tmp4887 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4868, i8* %.tmp4869, i8* %.tmp4870, i8* %.tmp4875, i8* %.tmp4877, i8* %.tmp4882, i8* %.tmp4884, i8* %.tmp4886)
%.tmp4888 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp4889 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp4888)
%info_g.4890 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp4889, %m2811$.AssignableInfo.type** %info_g.4890
%.tmp4891 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_g.4890
%.tmp4892 = load i8, i8* @SCOPE_GLOBAL
%.tmp4894 = getelementptr [8 x i8], [8 x i8]*@.str4893, i32 0, i32 0
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp4891, i8 %.tmp4892, i8* %.tmp4894)
%.tmp4895 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_g.4890
%.tmp4896 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4895, i32 0, i32 4
%.tmp4897 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp4897, %m2811$.Type.type** %.tmp4896
%.tmp4898 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_g.4890
%.tmp4899 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4898, i32 0, i32 4
%.tmp4900 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4899
%.tmp4901 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4900, i32 0, i32 0
%.tmp4903 = getelementptr [9 x i8], [9 x i8]*@.str4902, i32 0, i32 0
store i8* %.tmp4903, i8** %.tmp4901
%.tmp4904 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_g.4890
%.tmp4905 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4904, i32 0, i32 4
%.tmp4906 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4905
%.tmp4907 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4906, i32 0, i32 3
%.tmp4908 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp4908, %m2811$.Type.type** %.tmp4907
%.tmp4909 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_g.4890
%.tmp4910 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4909, i32 0, i32 4
%.tmp4911 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4910
%.tmp4912 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4911, i32 0, i32 3
%.tmp4913 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4912
%.tmp4914 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4913, i32 0, i32 0
%.tmp4916 = getelementptr [4 x i8], [4 x i8]*@.str4915, i32 0, i32 0
store i8* %.tmp4916, i8** %.tmp4914
%.tmp4917 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_g.4890
%.tmp4918 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4917, i32 0, i32 4
%.tmp4919 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4918
%.tmp4920 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4919, i32 0, i32 3
%.tmp4921 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4920
%.tmp4922 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4921, i32 0, i32 3
%.tmp4923 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp4923, %m2811$.Type.type** %.tmp4922
%.tmp4924 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_g.4890
%.tmp4925 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4924, i32 0, i32 4
%.tmp4926 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4925
%.tmp4927 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4926, i32 0, i32 3
%.tmp4928 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4927
%.tmp4929 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4928, i32 0, i32 3
%.tmp4930 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4929
%.tmp4931 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4930, i32 0, i32 0
%.tmp4933 = getelementptr [4 x i8], [4 x i8]*@.str4932, i32 0, i32 0
store i8* %.tmp4933, i8** %.tmp4931
%.tmp4934 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_g.4890
%.tmp4935 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4934, i32 0, i32 4
%.tmp4936 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4935
%.tmp4937 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4936, i32 0, i32 3
%.tmp4938 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4937
%.tmp4939 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4938, i32 0, i32 4
%.tmp4940 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp4940, %m2811$.Type.type** %.tmp4939
%.tmp4941 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_g.4890
%.tmp4942 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4941, i32 0, i32 4
%.tmp4943 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4942
%.tmp4944 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4943, i32 0, i32 3
%.tmp4945 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4944
%.tmp4946 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4945, i32 0, i32 4
%.tmp4947 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4946
%.tmp4948 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4947, i32 0, i32 0
%.tmp4950 = getelementptr [4 x i8], [4 x i8]*@.str4949, i32 0, i32 0
store i8* %.tmp4950, i8** %.tmp4948
%.tmp4951 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_g.4890
%.tmp4952 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4951, i32 0, i32 4
%.tmp4953 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4952
%.tmp4954 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4953, i32 0, i32 3
%.tmp4955 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4954
%.tmp4956 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4955, i32 0, i32 4
%.tmp4957 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4956
%.tmp4958 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4957, i32 0, i32 3
%.tmp4959 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp4959, %m2811$.Type.type** %.tmp4958
%.tmp4960 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_g.4890
%.tmp4961 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4960, i32 0, i32 4
%.tmp4962 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4961
%.tmp4963 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4962, i32 0, i32 3
%.tmp4964 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4963
%.tmp4965 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4964, i32 0, i32 4
%.tmp4966 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4965
%.tmp4967 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4966, i32 0, i32 3
%.tmp4968 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4967
%.tmp4969 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4968, i32 0, i32 0
%.tmp4971 = getelementptr [4 x i8], [4 x i8]*@.str4970, i32 0, i32 0
store i8* %.tmp4971, i8** %.tmp4969
%.tmp4972 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_g.4890
%.tmp4973 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4972, i32 0, i32 4
%.tmp4974 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4973
%.tmp4975 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4974, i32 0, i32 3
%.tmp4976 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4975
%.tmp4977 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4976, i32 0, i32 4
%.tmp4978 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4977
%.tmp4979 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4978, i32 0, i32 4
%.tmp4980 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp4980, %m2811$.Type.type** %.tmp4979
%.tmp4981 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_g.4890
%.tmp4982 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp4981, i32 0, i32 4
%.tmp4983 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4982
%.tmp4984 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4983, i32 0, i32 3
%.tmp4985 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4984
%.tmp4986 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4985, i32 0, i32 4
%.tmp4987 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4986
%.tmp4988 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4987, i32 0, i32 4
%.tmp4989 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp4988
%.tmp4990 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp4989, i32 0, i32 0
%.tmp4992 = getelementptr [4 x i8], [4 x i8]*@.str4991, i32 0, i32 0
store i8* %.tmp4992, i8** %.tmp4990
%.tmp4993 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp4995 = getelementptr [8 x i8], [8 x i8]*@.str4994, i32 0, i32 0
%.tmp4997 = getelementptr [7 x i8], [7 x i8]*@.str4996, i32 0, i32 0
%.tmp4998 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_g.4890
call void(%m2811$.CompilerCtx.type*,i8*,i8*,%m2811$.AssignableInfo.type*,i1,i1) @m311$define_global.v.m2811$.CompilerCtx.typep.cp.cp.m2811$.AssignableInfo.typep.b.b(%m2811$.CompilerCtx.type* %.tmp4993, i8* %.tmp4995, i8* %.tmp4997, %m2811$.AssignableInfo.type* %.tmp4998, i1 1, i1 0)
%.tmp4999 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.4847
ret %m2811$.AssignableInfo.type* %.tmp4999
br label %.if.end.4817
.if.false.4817:
%.tmp5000 = load %m996$.Node.type*, %m996$.Node.type** %dotted.4729
%.tmp5001 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5000, i32 0, i32 1
%.tmp5002 = load i8*, i8** %.tmp5001
%.tmp5004 = getelementptr [4 x i8], [4 x i8]*@.str5003, i32 0, i32 0
%.tmp5005 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5002, i8* %.tmp5004)
%.tmp5006 = icmp eq i32 %.tmp5005, 0
br i1 %.tmp5006, label %.if.true.5007, label %.if.false.5007
.if.true.5007:
%.tmp5008 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5010 = getelementptr [8 x i8], [8 x i8]*@.str5009, i32 0, i32 0
%.tmp5011 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5008, i8* %.tmp5010)
%args.5012 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5011, %m996$.Node.type** %args.5012
%.tmp5013 = load %m996$.Node.type*, %m996$.Node.type** %args.5012
%.tmp5014 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5013, i32 0, i32 8
%.tmp5015 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5014
%.tmp5017 = getelementptr [11 x i8], [11 x i8]*@.str5016, i32 0, i32 0
%.tmp5018 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5015, i8* %.tmp5017)
%value.5019 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5018, %m996$.Node.type** %value.5019
%.tmp5020 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5021 = load %m996$.Node.type*, %m996$.Node.type** %value.5019
%.tmp5022 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i32) @m311$get_struct_attr.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep.i(%m2811$.CompilerCtx.type* %.tmp5020, %m996$.Node.type* %.tmp5021, i32 1)
ret %m2811$.AssignableInfo.type* %.tmp5022
br label %.if.end.5007
.if.false.5007:
br label %.if.end.5007
.if.end.5007:
br label %.if.end.4817
.if.end.4817:
br label %.if.end.4743
.if.end.4743:
%.tmp5023 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp5023
}
define i8* @m311$resolve_import_path.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, i8* %.import_str.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%import_str = alloca i8*
store i8* %.import_str.arg, i8** %import_str
%.tmp5025 = getelementptr [1 x i8], [1 x i8]*@.str5024, i32 0, i32 0
%err_buf.5026 = alloca i8*
store i8* %.tmp5025, i8** %err_buf.5026
%.tmp5027 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5028 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp5027, i32 0, i32 7
%.tmp5029 = load i8*, i8** %.tmp5028
%mod_abspath.5030 = alloca i8*
store i8* %.tmp5029, i8** %mod_abspath.5030
%.tmp5031 = load i8*, i8** %mod_abspath.5030
%.tmp5032 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp5031)
%dirname.5033 = alloca i8*
store i8* %.tmp5032, i8** %dirname.5033
%.tmp5034 = load i8*, i8** %import_str
%.tmp5035 = getelementptr i8, i8* %.tmp5034, i32 0
%.tmp5036 = load i8, i8* %.tmp5035
%.tmp5037 = icmp eq i8 %.tmp5036, 47
br i1 %.tmp5037, label %.if.true.5038, label %.if.false.5038
.if.true.5038:
%.tmp5039 = getelementptr i8*, i8** %err_buf.5026, i32 0
%.tmp5041 = getelementptr [46 x i8], [46 x i8]*@.str5040, i32 0, i32 0
%.tmp5042 = load i8*, i8** %import_str
%.tmp5043 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5039, i8* %.tmp5041, i8* %.tmp5042)
%.tmp5044 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5045 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5046 = load i8*, i8** %err_buf.5026
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp5044, %m996$.Node.type* %.tmp5045, i8* %.tmp5046)
%.tmp5047 = bitcast ptr null to i8*
ret i8* %.tmp5047
br label %.if.end.5038
.if.false.5038:
br label %.if.end.5038
.if.end.5038:
%.tmp5048 = load i8*, i8** %import_str
%.tmp5049 = getelementptr i8, i8* %.tmp5048, i32 0
%.tmp5050 = load i8, i8* %.tmp5049
%.tmp5051 = icmp ne i8 %.tmp5050, 46
%.tmp5052 = load i8*, i8** %import_str
%.tmp5053 = getelementptr i8, i8* %.tmp5052, i32 1
%.tmp5054 = load i8, i8* %.tmp5053
%.tmp5055 = icmp ne i8 %.tmp5054, 47
%.tmp5056 = and i1 %.tmp5051, %.tmp5055
br i1 %.tmp5056, label %.if.true.5057, label %.if.false.5057
.if.true.5057:
%.tmp5058 = call i8*() @m311$get_root.cp()
%root.5059 = alloca i8*
store i8* %.tmp5058, i8** %root.5059
%.tmp5060 = getelementptr i8*, i8** %mod_abspath.5030, i32 0
%.tmp5062 = getelementptr [13 x i8], [13 x i8]*@.str5061, i32 0, i32 0
%.tmp5063 = load i8*, i8** %root.5059
%.tmp5064 = load i8*, i8** %import_str
%.tmp5065 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5060, i8* %.tmp5062, i8* %.tmp5063, i8* %.tmp5064)
br label %.if.end.5057
.if.false.5057:
%.tmp5066 = load i8*, i8** %dirname.5033
%.tmp5068 = getelementptr [1 x i8], [1 x i8]*@.str5067, i32 0, i32 0
%.tmp5069 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5066, i8* %.tmp5068)
%.tmp5070 = icmp eq i32 %.tmp5069, 0
br i1 %.tmp5070, label %.if.true.5071, label %.if.false.5071
.if.true.5071:
%.tmp5072 = getelementptr i8*, i8** %mod_abspath.5030, i32 0
%.tmp5074 = getelementptr [6 x i8], [6 x i8]*@.str5073, i32 0, i32 0
%.tmp5075 = load i8*, i8** %import_str
%.tmp5076 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5072, i8* %.tmp5074, i8* %.tmp5075)
br label %.if.end.5071
.if.false.5071:
%.tmp5077 = getelementptr i8*, i8** %mod_abspath.5030, i32 0
%.tmp5079 = getelementptr [9 x i8], [9 x i8]*@.str5078, i32 0, i32 0
%.tmp5080 = load i8*, i8** %dirname.5033
%.tmp5081 = load i8*, i8** %import_str
%.tmp5082 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5077, i8* %.tmp5079, i8* %.tmp5080, i8* %.tmp5081)
br label %.if.end.5071
.if.end.5071:
br label %.if.end.5057
.if.end.5057:
%.tmp5083 = load i8*, i8** %mod_abspath.5030
ret i8* %.tmp5083
}
define %m2811$.AssignableInfo.type* @m311$compile_fn_call.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp5084 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5085 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5086 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_builtin.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp5084, %m996$.Node.type* %.tmp5085)
%info.5087 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp5086, %m2811$.AssignableInfo.type** %info.5087
%.tmp5088 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5089 = icmp ne %m2811$.AssignableInfo.type* %.tmp5088, null
br i1 %.tmp5089, label %.if.true.5090, label %.if.false.5090
.if.true.5090:
%.tmp5091 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
ret %m2811$.AssignableInfo.type* %.tmp5091
br label %.if.end.5090
.if.false.5090:
br label %.if.end.5090
.if.end.5090:
%.tmp5092 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5093 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5094 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_addr.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp5092, %m996$.Node.type* %.tmp5093)
store %m2811$.AssignableInfo.type* %.tmp5094, %m2811$.AssignableInfo.type** %info.5087
%.tmp5095 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5096 = icmp eq %m2811$.AssignableInfo.type* %.tmp5095, null
br i1 %.tmp5096, label %.if.true.5097, label %.if.false.5097
.if.true.5097:
%.tmp5098 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp5098, label %.if.true.5099, label %.if.false.5099
.if.true.5099:
%.tmp5100 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5101 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5103 = getelementptr [35 x i8], [35 x i8]*@.str5102, i32 0, i32 0
%.tmp5104 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp5100, %m996$.Node.type* %.tmp5101, i8* %.tmp5103)
%.tmp5105 = call i32(i8*,...) @printf(i8* %.tmp5104)
br label %.if.end.5099
.if.false.5099:
br label %.if.end.5099
.if.end.5099:
%.tmp5106 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp5106
br label %.if.end.5097
.if.false.5097:
br label %.if.end.5097
.if.end.5097:
%.tmp5107 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5109 = getelementptr [8 x i8], [8 x i8]*@.str5108, i32 0, i32 0
%.tmp5110 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5107, i8* %.tmp5109)
%args.5111 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5110, %m996$.Node.type** %args.5111
%.tmp5113 = getelementptr [1 x i8], [1 x i8]*@.str5112, i32 0, i32 0
%params_buff.5114 = alloca i8*
store i8* %.tmp5113, i8** %params_buff.5114
%.tmp5116 = getelementptr [1 x i8], [1 x i8]*@.str5115, i32 0, i32 0
%tmp.5117 = alloca i8*
store i8* %.tmp5116, i8** %tmp.5117
%.tmp5118 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5119 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5118, i32 0, i32 4
%.tmp5120 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5119
%.tmp5121 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5120, i32 0, i32 0
%.tmp5122 = load i8*, i8** %.tmp5121
%.tmp5124 = getelementptr [4 x i8], [4 x i8]*@.str5123, i32 0, i32 0
%.tmp5125 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5122, i8* %.tmp5124)
%.tmp5126 = icmp eq i32 %.tmp5125, 0
br i1 %.tmp5126, label %.if.true.5127, label %.if.false.5127
.if.true.5127:
%.tmp5128 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5129 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp5128)
%new_info.5130 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp5129, %m2811$.AssignableInfo.type** %new_info.5130
%.tmp5131 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5132 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_info.5130
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp5131, %m2811$.AssignableInfo.type* %.tmp5132)
%.tmp5133 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_info.5130
%.tmp5134 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5133, i32 0, i32 4
%.tmp5135 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5136 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5135, i32 0, i32 4
%.tmp5137 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5136
%.tmp5138 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5137, i32 0, i32 3
%.tmp5139 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5138
store %m2811$.Type.type* %.tmp5139, %m2811$.Type.type** %.tmp5134
%.tmp5140 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5141 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp5140, i32 0, i32 1
%.tmp5142 = load %m0$.File.type*, %m0$.File.type** %.tmp5141
%.tmp5144 = getelementptr [22 x i8], [22 x i8]*@.str5143, i32 0, i32 0
%.tmp5145 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_info.5130
%.tmp5146 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp5145)
%.tmp5147 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5148 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5149 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5148, i32 0, i32 4
%.tmp5150 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5149
%.tmp5151 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5147, %m2811$.Type.type* %.tmp5150)
%.tmp5152 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5153 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5154 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5153, i32 0, i32 4
%.tmp5155 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5154
%.tmp5156 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5152, %m2811$.Type.type* %.tmp5155)
%.tmp5157 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5158 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp5157)
%.tmp5159 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5142, i8* %.tmp5144, i8* %.tmp5146, i8* %.tmp5151, i8* %.tmp5156, i8* %.tmp5158)
%.tmp5160 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_info.5130
store %m2811$.AssignableInfo.type* %.tmp5160, %m2811$.AssignableInfo.type** %info.5087
br label %.if.end.5127
.if.false.5127:
br label %.if.end.5127
.if.end.5127:
%.tmp5161 = load %m996$.Node.type*, %m996$.Node.type** %args.5111
%.tmp5162 = icmp ne %m996$.Node.type* %.tmp5161, null
br i1 %.tmp5162, label %.if.true.5163, label %.if.false.5163
.if.true.5163:
%.tmp5164 = load %m996$.Node.type*, %m996$.Node.type** %args.5111
%.tmp5165 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5164, i32 0, i32 8
%.tmp5166 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5165
%.tmp5168 = getelementptr [11 x i8], [11 x i8]*@.str5167, i32 0, i32 0
%.tmp5169 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5166, i8* %.tmp5168)
%start.5170 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5169, %m996$.Node.type** %start.5170
%argno.5171 = alloca i32
store i32 1, i32* %argno.5171
%.tmp5172 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5173 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5172, i32 0, i32 4
%.tmp5174 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5173
%.tmp5175 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5174, i32 0, i32 3
%.tmp5176 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5175
%.tmp5177 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5176, i32 0, i32 4
%.tmp5178 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5177
%expect_type.5179 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp5178, %m2811$.Type.type** %expect_type.5179
%provided_args.5180 = alloca i32
store i32 0, i32* %provided_args.5180
%.tmp5182 = load %m996$.Node.type*, %m996$.Node.type** %start.5170
%pp.5183 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5182, %m996$.Node.type** %pp.5183
br label %.for.start.5181
.for.start.5181:
%.tmp5184 = load %m996$.Node.type*, %m996$.Node.type** %pp.5183
%.tmp5185 = icmp ne %m996$.Node.type* %.tmp5184, null
br i1 %.tmp5185, label %.for.continue.5181, label %.for.end.5181
.for.continue.5181:
%.tmp5186 = load i32, i32* %provided_args.5180
%.tmp5187 = add i32 %.tmp5186, 1
store i32 %.tmp5187, i32* %provided_args.5180
%.tmp5188 = load %m996$.Node.type*, %m996$.Node.type** %pp.5183
%.tmp5189 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5188, i32 0, i32 9
%.tmp5190 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5189
%.tmp5192 = getelementptr [11 x i8], [11 x i8]*@.str5191, i32 0, i32 0
%.tmp5193 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5190, i8* %.tmp5192)
store %m996$.Node.type* %.tmp5193, %m996$.Node.type** %pp.5183
br label %.for.start.5181
.for.end.5181:
%.tmp5195 = load %m996$.Node.type*, %m996$.Node.type** %start.5170
%pp.5196 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5195, %m996$.Node.type** %pp.5196
br label %.for.start.5194
.for.start.5194:
%.tmp5197 = load %m996$.Node.type*, %m996$.Node.type** %pp.5196
%.tmp5198 = icmp ne %m996$.Node.type* %.tmp5197, null
br i1 %.tmp5198, label %.for.continue.5194, label %.for.end.5194
.for.continue.5194:
%.tmp5199 = load %m2811$.Type.type*, %m2811$.Type.type** %expect_type.5179
%.tmp5200 = icmp eq %m2811$.Type.type* %.tmp5199, null
br i1 %.tmp5200, label %.if.true.5201, label %.if.false.5201
.if.true.5201:
%.tmp5202 = getelementptr i8*, i8** %tmp.5117, i32 0
%.tmp5204 = getelementptr [43 x i8], [43 x i8]*@.str5203, i32 0, i32 0
%.tmp5205 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5206 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5205, i32 0, i32 2
%.tmp5207 = load i8*, i8** %.tmp5206
%.tmp5208 = load i32, i32* %argno.5171
%.tmp5209 = sub i32 %.tmp5208, 1
%.tmp5210 = load i32, i32* %provided_args.5180
%.tmp5211 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5202, i8* %.tmp5204, i8* %.tmp5207, i32 %.tmp5209, i32 %.tmp5210)
%.tmp5212 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5213 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5214 = load i8*, i8** %tmp.5117
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp5212, %m996$.Node.type* %.tmp5213, i8* %.tmp5214)
%.tmp5215 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp5215
br label %.if.end.5201
.if.false.5201:
br label %.if.end.5201
.if.end.5201:
%.tmp5216 = load %m996$.Node.type*, %m996$.Node.type** %pp.5196
%.tmp5217 = load %m996$.Node.type*, %m996$.Node.type** %start.5170
%.tmp5218 = icmp ne %m996$.Node.type* %.tmp5216, %.tmp5217
br i1 %.tmp5218, label %.if.true.5219, label %.if.false.5219
.if.true.5219:
%.tmp5220 = getelementptr i8*, i8** %tmp.5117, i32 0
%.tmp5222 = getelementptr [5 x i8], [5 x i8]*@.str5221, i32 0, i32 0
%.tmp5223 = load i8*, i8** %params_buff.5114
%.tmp5224 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5220, i8* %.tmp5222, i8* %.tmp5223)
%.tmp5225 = load i8*, i8** %params_buff.5114
%tmp_buff.5226 = alloca i8*
store i8* %.tmp5225, i8** %tmp_buff.5226
%.tmp5227 = load i8*, i8** %tmp.5117
store i8* %.tmp5227, i8** %params_buff.5114
%.tmp5228 = load i8*, i8** %tmp_buff.5226
store i8* %.tmp5228, i8** %tmp.5117
%.tmp5229 = load i8*, i8** %tmp.5117
call void(i8*) @free(i8* %.tmp5229)
br label %.if.end.5219
.if.false.5219:
br label %.if.end.5219
.if.end.5219:
%.tmp5230 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5231 = load %m996$.Node.type*, %m996$.Node.type** %pp.5196
%.tmp5232 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp5230, %m996$.Node.type* %.tmp5231)
%a_info.5233 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp5232, %m2811$.AssignableInfo.type** %a_info.5233
%.tmp5234 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.5233
%.tmp5235 = icmp eq %m2811$.AssignableInfo.type* %.tmp5234, null
br i1 %.tmp5235, label %.if.true.5236, label %.if.false.5236
.if.true.5236:
%.tmp5237 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp5237
br label %.if.end.5236
.if.false.5236:
br label %.if.end.5236
.if.end.5236:
%.tmp5238 = load %m2811$.Type.type*, %m2811$.Type.type** %expect_type.5179
%.tmp5239 = call %m2811$.Type.type*(%m2811$.Type.type*) @m311$type_clone.m2811$.Type.typep.m2811$.Type.typep(%m2811$.Type.type* %.tmp5238)
%exp.5240 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp5239, %m2811$.Type.type** %exp.5240
%.tmp5241 = load %m2811$.Type.type*, %m2811$.Type.type** %exp.5240
%.tmp5242 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5241, i32 0, i32 4
store %m2811$.Type.type* null, %m2811$.Type.type** %.tmp5242
%.tmp5243 = load %m2811$.Type.type*, %m2811$.Type.type** %expect_type.5179
%.tmp5244 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5243, i32 0, i32 0
%.tmp5245 = load i8*, i8** %.tmp5244
%.tmp5247 = getelementptr [7 x i8], [7 x i8]*@.str5246, i32 0, i32 0
%.tmp5248 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5245, i8* %.tmp5247)
%.tmp5249 = icmp ne i32 %.tmp5248, 0
%.tmp5250 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5251 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.5233
%.tmp5252 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5251, i32 0, i32 4
%.tmp5253 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5252
%.tmp5254 = load %m2811$.Type.type*, %m2811$.Type.type** %exp.5240
%.tmp5255 = call i1(%m2811$.CompilerCtx.type*,%m2811$.Type.type*,%m2811$.Type.type*) @m2812$cmp.b.m2811$.CompilerCtx.typep.m2811$.Type.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5250, %m2811$.Type.type* %.tmp5253, %m2811$.Type.type* %.tmp5254)
%.tmp5256 = icmp eq i1 %.tmp5255, 0
%.tmp5257 = and i1 %.tmp5249, %.tmp5256
br i1 %.tmp5257, label %.if.true.5258, label %.if.false.5258
.if.true.5258:
%.tmp5260 = getelementptr [1 x i8], [1 x i8]*@.str5259, i32 0, i32 0
%err_buf.5261 = alloca i8*
store i8* %.tmp5260, i8** %err_buf.5261
%.tmp5262 = getelementptr i8*, i8** %err_buf.5261, i32 0
%.tmp5264 = getelementptr [58 x i8], [58 x i8]*@.str5263, i32 0, i32 0
%.tmp5265 = load i32, i32* %argno.5171
%.tmp5266 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5267 = load %m2811$.Type.type*, %m2811$.Type.type** %exp.5240
%.tmp5268 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5266, %m2811$.Type.type* %.tmp5267)
%.tmp5269 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5270 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.5233
%.tmp5271 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5270, i32 0, i32 4
%.tmp5272 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5271
%.tmp5273 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5269, %m2811$.Type.type* %.tmp5272)
%.tmp5274 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5262, i8* %.tmp5264, i32 %.tmp5265, i8* %.tmp5268, i8* %.tmp5273)
%.tmp5275 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5276 = load %m996$.Node.type*, %m996$.Node.type** %pp.5196
%.tmp5277 = load i8*, i8** %err_buf.5261
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp5275, %m996$.Node.type* %.tmp5276, i8* %.tmp5277)
%.tmp5278 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp5278
br label %.if.end.5258
.if.false.5258:
br label %.if.end.5258
.if.end.5258:
%.tmp5279 = getelementptr i8*, i8** %params_buff.5114, i32 0
%.tmp5281 = getelementptr [8 x i8], [8 x i8]*@.str5280, i32 0, i32 0
%.tmp5282 = load i8*, i8** %params_buff.5114
%.tmp5283 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5284 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.5233
%.tmp5285 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5284, i32 0, i32 4
%.tmp5286 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5285
%.tmp5287 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5283, %m2811$.Type.type* %.tmp5286)
%.tmp5288 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.5233
%.tmp5289 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp5288)
%.tmp5290 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5279, i8* %.tmp5281, i8* %.tmp5282, i8* %.tmp5287, i8* %.tmp5289)
%.tmp5291 = load %m996$.Node.type*, %m996$.Node.type** %pp.5196
%.tmp5292 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5291, i32 0, i32 9
%.tmp5293 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5292
store %m996$.Node.type* %.tmp5293, %m996$.Node.type** %pp.5196
%.tmp5294 = load %m2811$.Type.type*, %m2811$.Type.type** %expect_type.5179
%.tmp5295 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5294, i32 0, i32 0
%.tmp5296 = load i8*, i8** %.tmp5295
%.tmp5298 = getelementptr [7 x i8], [7 x i8]*@.str5297, i32 0, i32 0
%.tmp5299 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5296, i8* %.tmp5298)
%.tmp5300 = icmp ne i32 %.tmp5299, 0
br i1 %.tmp5300, label %.if.true.5301, label %.if.false.5301
.if.true.5301:
%.tmp5302 = load %m2811$.Type.type*, %m2811$.Type.type** %expect_type.5179
%.tmp5303 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5302, i32 0, i32 4
%.tmp5304 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5303
store %m2811$.Type.type* %.tmp5304, %m2811$.Type.type** %expect_type.5179
br label %.if.end.5301
.if.false.5301:
br label %.if.end.5301
.if.end.5301:
%.tmp5305 = load i32, i32* %argno.5171
%.tmp5306 = add i32 %.tmp5305, 1
store i32 %.tmp5306, i32* %argno.5171
%.tmp5307 = load %m996$.Node.type*, %m996$.Node.type** %pp.5196
%.tmp5309 = getelementptr [11 x i8], [11 x i8]*@.str5308, i32 0, i32 0
%.tmp5310 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5307, i8* %.tmp5309)
store %m996$.Node.type* %.tmp5310, %m996$.Node.type** %pp.5196
br label %.for.start.5194
.for.end.5194:
%.tmp5311 = load %m2811$.Type.type*, %m2811$.Type.type** %expect_type.5179
%.tmp5312 = icmp ne %m2811$.Type.type* %.tmp5311, null
br i1 %.tmp5312, label %.if.true.5313, label %.if.false.5313
.if.true.5313:
%.tmp5314 = load %m2811$.Type.type*, %m2811$.Type.type** %expect_type.5179
%.tmp5315 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5314, i32 0, i32 0
%.tmp5316 = load i8*, i8** %.tmp5315
%.tmp5318 = getelementptr [7 x i8], [7 x i8]*@.str5317, i32 0, i32 0
%.tmp5319 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5316, i8* %.tmp5318)
%.tmp5320 = icmp ne i32 %.tmp5319, 0
br i1 %.tmp5320, label %.if.true.5321, label %.if.false.5321
.if.true.5321:
%.tmp5322 = getelementptr i8*, i8** %tmp.5117, i32 0
%.tmp5324 = getelementptr [43 x i8], [43 x i8]*@.str5323, i32 0, i32 0
%.tmp5325 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5326 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5325, i32 0, i32 2
%.tmp5327 = load i8*, i8** %.tmp5326
%.tmp5328 = load i32, i32* %argno.5171
%.tmp5329 = load i32, i32* %provided_args.5180
%.tmp5330 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5322, i8* %.tmp5324, i8* %.tmp5327, i32 %.tmp5328, i32 %.tmp5329)
%.tmp5331 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5332 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5333 = load i8*, i8** %tmp.5117
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp5331, %m996$.Node.type* %.tmp5332, i8* %.tmp5333)
%.tmp5334 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp5334
br label %.if.end.5321
.if.false.5321:
br label %.if.end.5321
.if.end.5321:
br label %.if.end.5313
.if.false.5313:
br label %.if.end.5313
.if.end.5313:
br label %.if.end.5163
.if.false.5163:
%.tmp5335 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5336 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5335, i32 0, i32 4
%.tmp5337 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5336
%.tmp5338 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5337, i32 0, i32 3
%.tmp5339 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5338
%.tmp5340 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5339, i32 0, i32 4
%.tmp5341 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5340
%.tmp5342 = icmp ne %m2811$.Type.type* %.tmp5341, null
br i1 %.tmp5342, label %.if.true.5343, label %.if.false.5343
.if.true.5343:
%args_required.5344 = alloca i32
store i32 0, i32* %args_required.5344
%.tmp5346 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5347 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5346, i32 0, i32 4
%.tmp5348 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5347
%.tmp5349 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5348, i32 0, i32 3
%.tmp5350 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5349
%.tmp5351 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5350, i32 0, i32 4
%.tmp5352 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5351
%pp.5353 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp5352, %m2811$.Type.type** %pp.5353
br label %.for.start.5345
.for.start.5345:
%.tmp5354 = load %m2811$.Type.type*, %m2811$.Type.type** %pp.5353
%.tmp5355 = icmp ne %m2811$.Type.type* %.tmp5354, null
br i1 %.tmp5355, label %.for.continue.5345, label %.for.else.5345
.for.continue.5345:
%.tmp5356 = load %m2811$.Type.type*, %m2811$.Type.type** %pp.5353
%.tmp5357 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5356, i32 0, i32 0
%.tmp5358 = load i8*, i8** %.tmp5357
%.tmp5360 = getelementptr [7 x i8], [7 x i8]*@.str5359, i32 0, i32 0
%.tmp5361 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5358, i8* %.tmp5360)
%.tmp5362 = icmp eq i32 %.tmp5361, 0
br i1 %.tmp5362, label %.if.true.5363, label %.if.false.5363
.if.true.5363:
br label %.for.end.5345
br label %.if.end.5363
.if.false.5363:
br label %.if.end.5363
.if.end.5363:
%.tmp5364 = load i32, i32* %args_required.5344
%.tmp5365 = add i32 %.tmp5364, 1
store i32 %.tmp5365, i32* %args_required.5344
%.tmp5366 = load %m2811$.Type.type*, %m2811$.Type.type** %pp.5353
%.tmp5367 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5366, i32 0, i32 4
%.tmp5368 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5367
store %m2811$.Type.type* %.tmp5368, %m2811$.Type.type** %pp.5353
br label %.for.start.5345
.for.else.5345:
%.tmp5369 = getelementptr i8*, i8** %tmp.5117, i32 0
%.tmp5371 = getelementptr [42 x i8], [42 x i8]*@.str5370, i32 0, i32 0
%.tmp5372 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5373 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5372, i32 0, i32 2
%.tmp5374 = load i8*, i8** %.tmp5373
%.tmp5375 = load i32, i32* %args_required.5344
%.tmp5376 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5369, i8* %.tmp5371, i8* %.tmp5374, i32 %.tmp5375)
%.tmp5377 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5378 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5379 = load i8*, i8** %tmp.5117
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp5377, %m996$.Node.type* %.tmp5378, i8* %.tmp5379)
%.tmp5380 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp5380
br label %.for.end.5345
.for.end.5345:
br label %.if.end.5343
.if.false.5343:
br label %.if.end.5343
.if.end.5343:
br label %.if.end.5163
.if.end.5163:
%.tmp5381 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5382 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5383 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5382, i32 0, i32 4
%.tmp5384 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5383
%.tmp5385 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5384, i32 0, i32 3
%.tmp5386 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5385
%.tmp5387 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5381, %m2811$.Type.type* %.tmp5386)
%.tmp5389 = getelementptr [5 x i8], [5 x i8]*@.str5388, i32 0, i32 0
%.tmp5390 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5387, i8* %.tmp5389)
%.tmp5391 = icmp eq i32 %.tmp5390, 0
br i1 %.tmp5391, label %.if.true.5392, label %.if.false.5392
.if.true.5392:
%.tmp5393 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5394 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp5393, i32 0, i32 1
%.tmp5395 = load %m0$.File.type*, %m0$.File.type** %.tmp5394
%.tmp5397 = getelementptr [16 x i8], [16 x i8]*@.str5396, i32 0, i32 0
%.tmp5398 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5399 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5400 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5399, i32 0, i32 4
%.tmp5401 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5400
%.tmp5402 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5398, %m2811$.Type.type* %.tmp5401)
%.tmp5403 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5404 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp5403)
%.tmp5405 = load i8*, i8** %params_buff.5114
%.tmp5406 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5395, i8* %.tmp5397, i8* %.tmp5402, i8* %.tmp5404, i8* %.tmp5405)
%.tmp5407 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp5407
br label %.if.end.5392
.if.false.5392:
br label %.if.end.5392
.if.end.5392:
%.tmp5408 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5409 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp5408)
%call_info.5410 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp5409, %m2811$.AssignableInfo.type** %call_info.5410
%.tmp5411 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5412 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %call_info.5410
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp5411, %m2811$.AssignableInfo.type* %.tmp5412)
%.tmp5413 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %call_info.5410
%.tmp5414 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5413, i32 0, i32 4
%.tmp5415 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5416 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5415, i32 0, i32 4
%.tmp5417 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5416
%.tmp5418 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5417, i32 0, i32 3
%.tmp5419 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5418
%.tmp5420 = call %m2811$.Type.type*(%m2811$.Type.type*) @m311$type_clone.m2811$.Type.typep.m2811$.Type.typep(%m2811$.Type.type* %.tmp5419)
store %m2811$.Type.type* %.tmp5420, %m2811$.Type.type** %.tmp5414
%.tmp5421 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %call_info.5410
%.tmp5422 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5421, i32 0, i32 4
%.tmp5423 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5422
%.tmp5424 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5423, i32 0, i32 4
store %m2811$.Type.type* null, %m2811$.Type.type** %.tmp5424
%.tmp5425 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5426 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp5425, i32 0, i32 1
%.tmp5427 = load %m0$.File.type*, %m0$.File.type** %.tmp5426
%.tmp5429 = getelementptr [21 x i8], [21 x i8]*@.str5428, i32 0, i32 0
%.tmp5430 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %call_info.5410
%.tmp5431 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp5430)
%.tmp5432 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5433 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5434 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5433, i32 0, i32 4
%.tmp5435 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5434
%.tmp5436 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5432, %m2811$.Type.type* %.tmp5435)
%.tmp5437 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5087
%.tmp5438 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp5437)
%.tmp5439 = load i8*, i8** %params_buff.5114
%.tmp5440 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5427, i8* %.tmp5429, i8* %.tmp5431, i8* %.tmp5436, i8* %.tmp5438, i8* %.tmp5439)
%.tmp5441 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %call_info.5410
%.tmp5442 = bitcast %m2811$.AssignableInfo.type* %.tmp5441 to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp5442
}
define void @m311$compile_expression.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp5444 = getelementptr [1 x i8], [1 x i8]*@.str5443, i32 0, i32 0
%err_msg.5445 = alloca i8*
store i8* %.tmp5444, i8** %err_msg.5445
%.tmp5446 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5447 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5446, i32 0, i32 0
%.tmp5448 = load i8*, i8** %.tmp5447
%expr_type.5449 = alloca i8*
store i8* %.tmp5448, i8** %expr_type.5449
%.tmp5450 = bitcast ptr null to %m2811$.AssignableInfo.type*
%info.5451 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp5450, %m2811$.AssignableInfo.type** %info.5451
%assignable.5452 = alloca %m996$.Node.type*
store %m996$.Node.type* null, %m996$.Node.type** %assignable.5452
%.tmp5453 = bitcast ptr null to %m2811$.AssignableInfo.type*
%a_info.5454 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp5453, %m2811$.AssignableInfo.type** %a_info.5454
%.tmp5455 = load i8*, i8** %expr_type.5449
%.tmp5457 = getelementptr [7 x i8], [7 x i8]*@.str5456, i32 0, i32 0
%.tmp5458 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5455, i8* %.tmp5457)
%.tmp5459 = icmp eq i32 %.tmp5458, 0
br i1 %.tmp5459, label %.if.true.5460, label %.if.false.5460
.if.true.5460:
%.tmp5461 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5463 = getelementptr [9 x i8], [9 x i8]*@.str5462, i32 0, i32 0
%.tmp5464 = call %m2811$.Scope.type*(%m2811$.CompilerCtx.type*,i8*) @m311$get_scope.m2811$.Scope.typep.m2811$.CompilerCtx.typep.cp(%m2811$.CompilerCtx.type* %.tmp5461, i8* %.tmp5463)
%fn_scope.5465 = alloca %m2811$.Scope.type*
store %m2811$.Scope.type* %.tmp5464, %m2811$.Scope.type** %fn_scope.5465
%.tmp5466 = load %m2811$.Scope.type*, %m2811$.Scope.type** %fn_scope.5465
%.tmp5467 = icmp eq %m2811$.Scope.type* %.tmp5466, null
br i1 %.tmp5467, label %.if.true.5468, label %.if.false.5468
.if.true.5468:
%.tmp5469 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5470 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5472 = getelementptr [40 x i8], [40 x i8]*@.str5471, i32 0, i32 0
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp5469, %m996$.Node.type* %.tmp5470, i8* %.tmp5472)
ret void
br label %.if.end.5468
.if.false.5468:
br label %.if.end.5468
.if.end.5468:
%.tmp5473 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5474 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5473, i32 0, i32 8
%.tmp5475 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5474
%.tmp5476 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5475, i32 0, i32 9
%.tmp5477 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5476
%.tmp5478 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5477, i32 0, i32 0
%.tmp5479 = load i8*, i8** %.tmp5478
%.tmp5481 = getelementptr [3 x i8], [3 x i8]*@.str5480, i32 0, i32 0
%.tmp5482 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5479, i8* %.tmp5481)
%.tmp5483 = icmp ne i32 %.tmp5482, 0
br i1 %.tmp5483, label %.if.true.5484, label %.if.false.5484
.if.true.5484:
%.tmp5485 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5486 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5487 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5486, i32 0, i32 8
%.tmp5488 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5487
%.tmp5489 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5488, i32 0, i32 9
%.tmp5490 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5489
%.tmp5491 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp5485, %m996$.Node.type* %.tmp5490)
store %m2811$.AssignableInfo.type* %.tmp5491, %m2811$.AssignableInfo.type** %info.5451
%.tmp5492 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5451
%.tmp5493 = icmp eq %m2811$.AssignableInfo.type* %.tmp5492, null
br i1 %.tmp5493, label %.if.true.5494, label %.if.false.5494
.if.true.5494:
ret void
br label %.if.end.5494
.if.false.5494:
br label %.if.end.5494
.if.end.5494:
%.tmp5495 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5496 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5451
%.tmp5497 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5496, i32 0, i32 4
%.tmp5498 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5497
%.tmp5499 = load %m2811$.Scope.type*, %m2811$.Scope.type** %fn_scope.5465
%.tmp5500 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp5499, i32 0, i32 6
%.tmp5501 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5500
%.tmp5502 = call i1(%m2811$.CompilerCtx.type*,%m2811$.Type.type*,%m2811$.Type.type*) @m2812$cmp.b.m2811$.CompilerCtx.typep.m2811$.Type.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5495, %m2811$.Type.type* %.tmp5498, %m2811$.Type.type* %.tmp5501)
%.tmp5503 = icmp eq i1 %.tmp5502, 0
br i1 %.tmp5503, label %.if.true.5504, label %.if.false.5504
.if.true.5504:
%.tmp5506 = getelementptr [1 x i8], [1 x i8]*@.str5505, i32 0, i32 0
%buf.5507 = alloca i8*
store i8* %.tmp5506, i8** %buf.5507
%.tmp5508 = getelementptr i8*, i8** %buf.5507, i32 0
%.tmp5510 = getelementptr [67 x i8], [67 x i8]*@.str5509, i32 0, i32 0
%.tmp5511 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5512 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5451
%.tmp5513 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5512, i32 0, i32 4
%.tmp5514 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5513
%.tmp5515 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5511, %m2811$.Type.type* %.tmp5514)
%.tmp5516 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5517 = load %m2811$.Scope.type*, %m2811$.Scope.type** %fn_scope.5465
%.tmp5518 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp5517, i32 0, i32 6
%.tmp5519 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5518
%.tmp5520 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5516, %m2811$.Type.type* %.tmp5519)
%.tmp5521 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5508, i8* %.tmp5510, i8* %.tmp5515, i8* %.tmp5520)
%.tmp5522 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5523 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5524 = load i8*, i8** %buf.5507
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp5522, %m996$.Node.type* %.tmp5523, i8* %.tmp5524)
ret void
br label %.if.end.5504
.if.false.5504:
br label %.if.end.5504
.if.end.5504:
%.tmp5525 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5526 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp5525, i32 0, i32 1
%.tmp5527 = load %m0$.File.type*, %m0$.File.type** %.tmp5526
%.tmp5529 = getelementptr [11 x i8], [11 x i8]*@.str5528, i32 0, i32 0
%.tmp5530 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5531 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5451
%.tmp5532 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5531, i32 0, i32 4
%.tmp5533 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5532
%.tmp5534 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5530, %m2811$.Type.type* %.tmp5533)
%.tmp5535 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.5451
%.tmp5536 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp5535)
%.tmp5537 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5527, i8* %.tmp5529, i8* %.tmp5534, i8* %.tmp5536)
br label %.if.end.5484
.if.false.5484:
%.tmp5538 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5539 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp5538, i32 0, i32 1
%.tmp5540 = load %m0$.File.type*, %m0$.File.type** %.tmp5539
%.tmp5542 = getelementptr [10 x i8], [10 x i8]*@.str5541, i32 0, i32 0
%.tmp5543 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5540, i8* %.tmp5542)
br label %.if.end.5484
.if.end.5484:
br label %.if.end.5460
.if.false.5460:
%.tmp5544 = load i8*, i8** %expr_type.5449
%.tmp5546 = getelementptr [3 x i8], [3 x i8]*@.str5545, i32 0, i32 0
%.tmp5547 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5544, i8* %.tmp5546)
%.tmp5548 = icmp eq i32 %.tmp5547, 0
br i1 %.tmp5548, label %.if.true.5549, label %.if.false.5549
.if.true.5549:
br label %.if.end.5549
.if.false.5549:
%.tmp5550 = load i8*, i8** %expr_type.5449
%.tmp5552 = getelementptr [8 x i8], [8 x i8]*@.str5551, i32 0, i32 0
%.tmp5553 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5550, i8* %.tmp5552)
%.tmp5554 = icmp eq i32 %.tmp5553, 0
br i1 %.tmp5554, label %.if.true.5555, label %.if.false.5555
.if.true.5555:
%.tmp5556 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5557 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5558 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5557, i32 0, i32 8
%.tmp5559 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5558
%.tmp5560 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_fn_call.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp5556, %m996$.Node.type* %.tmp5559)
br label %.if.end.5555
.if.false.5555:
%.tmp5561 = load i8*, i8** %expr_type.5449
%.tmp5563 = getelementptr [12 x i8], [12 x i8]*@.str5562, i32 0, i32 0
%.tmp5564 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5561, i8* %.tmp5563)
%.tmp5565 = icmp eq i32 %.tmp5564, 0
br i1 %.tmp5565, label %.if.true.5566, label %.if.false.5566
.if.true.5566:
%.tmp5567 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5568 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5569 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_declaration.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp5567, %m996$.Node.type* %.tmp5568)
br label %.if.end.5566
.if.false.5566:
%.tmp5570 = load i8*, i8** %expr_type.5449
%.tmp5572 = getelementptr [11 x i8], [11 x i8]*@.str5571, i32 0, i32 0
%.tmp5573 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5570, i8* %.tmp5572)
%.tmp5574 = icmp eq i32 %.tmp5573, 0
br i1 %.tmp5574, label %.if.true.5575, label %.if.false.5575
.if.true.5575:
%.tmp5576 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5577 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5576, i32 0, i32 8
%.tmp5578 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5577
%.tmp5580 = getelementptr [11 x i8], [11 x i8]*@.str5579, i32 0, i32 0
%.tmp5581 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5578, i8* %.tmp5580)
store %m996$.Node.type* %.tmp5581, %m996$.Node.type** %assignable.5452
%.tmp5582 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5583 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5584 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5583, i32 0, i32 8
%.tmp5585 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5584
%.tmp5586 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_addr.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp5582, %m996$.Node.type* %.tmp5585)
%dest.5587 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp5586, %m2811$.AssignableInfo.type** %dest.5587
%.tmp5588 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %dest.5587
%.tmp5589 = icmp eq %m2811$.AssignableInfo.type* %.tmp5588, null
br i1 %.tmp5589, label %.if.true.5590, label %.if.false.5590
.if.true.5590:
ret void
br label %.if.end.5590
.if.false.5590:
br label %.if.end.5590
.if.end.5590:
%.tmp5591 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5592 = load %m996$.Node.type*, %m996$.Node.type** %assignable.5452
%.tmp5593 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp5591, %m996$.Node.type* %.tmp5592)
store %m2811$.AssignableInfo.type* %.tmp5593, %m2811$.AssignableInfo.type** %a_info.5454
%.tmp5594 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.5454
%.tmp5595 = icmp eq %m2811$.AssignableInfo.type* %.tmp5594, null
br i1 %.tmp5595, label %.if.true.5596, label %.if.false.5596
.if.true.5596:
ret void
br label %.if.end.5596
.if.false.5596:
br label %.if.end.5596
.if.end.5596:
%.tmp5597 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5598 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.5454
%.tmp5599 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5598, i32 0, i32 4
%.tmp5600 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5599
%.tmp5601 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %dest.5587
%.tmp5602 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5601, i32 0, i32 4
%.tmp5603 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5602
%.tmp5604 = call i1(%m2811$.CompilerCtx.type*,%m2811$.Type.type*,%m2811$.Type.type*) @m2812$cmp.b.m2811$.CompilerCtx.typep.m2811$.Type.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5597, %m2811$.Type.type* %.tmp5600, %m2811$.Type.type* %.tmp5603)
%.tmp5605 = icmp eq i1 %.tmp5604, 0
br i1 %.tmp5605, label %.if.true.5606, label %.if.false.5606
.if.true.5606:
%.tmp5608 = getelementptr [1 x i8], [1 x i8]*@.str5607, i32 0, i32 0
%err_buf.5609 = alloca i8*
store i8* %.tmp5608, i8** %err_buf.5609
%.tmp5610 = getelementptr i8*, i8** %err_buf.5609, i32 0
%.tmp5612 = getelementptr [37 x i8], [37 x i8]*@.str5611, i32 0, i32 0
%.tmp5613 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5614 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.5454
%.tmp5615 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5614, i32 0, i32 4
%.tmp5616 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5615
%.tmp5617 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5613, %m2811$.Type.type* %.tmp5616)
%.tmp5618 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5619 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %dest.5587
%.tmp5620 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5619, i32 0, i32 4
%.tmp5621 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5620
%.tmp5622 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5618, %m2811$.Type.type* %.tmp5621)
%.tmp5623 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5610, i8* %.tmp5612, i8* %.tmp5617, i8* %.tmp5622)
%.tmp5624 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5625 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5626 = load i8*, i8** %err_buf.5609
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp5624, %m996$.Node.type* %.tmp5625, i8* %.tmp5626)
br label %.if.end.5606
.if.false.5606:
br label %.if.end.5606
.if.end.5606:
%.tmp5627 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5628 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %dest.5587
%.tmp5629 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5628, i32 0, i32 4
%.tmp5630 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5629
%.tmp5631 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5627, %m2811$.Type.type* %.tmp5630)
%dest_tr.5632 = alloca i8*
store i8* %.tmp5631, i8** %dest_tr.5632
%.tmp5633 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5634 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.5454
%.tmp5635 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5634, i32 0, i32 4
%.tmp5636 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5635
%.tmp5637 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp5633, %m2811$.Type.type* %.tmp5636)
%src_tr.5638 = alloca i8*
store i8* %.tmp5637, i8** %src_tr.5638
%.tmp5639 = load i8*, i8** %src_tr.5638
%.tmp5641 = getelementptr [4 x i8], [4 x i8]*@.str5640, i32 0, i32 0
%.tmp5642 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5639, i8* %.tmp5641)
%.tmp5643 = icmp eq i32 %.tmp5642, 0
br i1 %.tmp5643, label %.if.true.5644, label %.if.false.5644
.if.true.5644:
%.tmp5645 = load i8*, i8** %dest_tr.5632
store i8* %.tmp5645, i8** %src_tr.5638
br label %.if.end.5644
.if.false.5644:
br label %.if.end.5644
.if.end.5644:
%.tmp5646 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5647 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp5646, i32 0, i32 1
%.tmp5648 = load %m0$.File.type*, %m0$.File.type** %.tmp5647
%.tmp5650 = getelementptr [21 x i8], [21 x i8]*@.str5649, i32 0, i32 0
%.tmp5651 = load i8*, i8** %src_tr.5638
%.tmp5652 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.5454
%.tmp5653 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp5652)
%.tmp5654 = load i8*, i8** %dest_tr.5632
%.tmp5655 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %dest.5587
%.tmp5656 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp5655)
%.tmp5657 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5648, i8* %.tmp5650, i8* %.tmp5651, i8* %.tmp5653, i8* %.tmp5654, i8* %.tmp5656)
br label %.if.end.5575
.if.false.5575:
%.tmp5658 = load i8*, i8** %expr_type.5449
%.tmp5660 = getelementptr [9 x i8], [9 x i8]*@.str5659, i32 0, i32 0
%.tmp5661 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5658, i8* %.tmp5660)
%.tmp5662 = icmp eq i32 %.tmp5661, 0
br i1 %.tmp5662, label %.if.true.5663, label %.if.false.5663
.if.true.5663:
%.tmp5664 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5665 = load %m996$.Node.type*, %m996$.Node.type** %stmt
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_if_block.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp5664, %m996$.Node.type* %.tmp5665)
br label %.if.end.5663
.if.false.5663:
%.tmp5666 = load i8*, i8** %expr_type.5449
%.tmp5668 = getelementptr [9 x i8], [9 x i8]*@.str5667, i32 0, i32 0
%.tmp5669 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5666, i8* %.tmp5668)
%.tmp5670 = icmp eq i32 %.tmp5669, 0
br i1 %.tmp5670, label %.if.true.5671, label %.if.false.5671
.if.true.5671:
%.tmp5672 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5673 = load %m996$.Node.type*, %m996$.Node.type** %stmt
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_for_loop.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp5672, %m996$.Node.type* %.tmp5673)
br label %.if.end.5671
.if.false.5671:
%.tmp5674 = load i8*, i8** %expr_type.5449
%.tmp5676 = getelementptr [8 x i8], [8 x i8]*@.str5675, i32 0, i32 0
%.tmp5677 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5674, i8* %.tmp5676)
%.tmp5678 = icmp eq i32 %.tmp5677, 0
br i1 %.tmp5678, label %.if.true.5679, label %.if.false.5679
.if.true.5679:
%.tmp5680 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5682 = getelementptr [4 x i8], [4 x i8]*@.str5681, i32 0, i32 0
%.tmp5683 = call %m2811$.Scope.type*(%m2811$.CompilerCtx.type*,i8*) @m311$get_scope.m2811$.Scope.typep.m2811$.CompilerCtx.typep.cp(%m2811$.CompilerCtx.type* %.tmp5680, i8* %.tmp5682)
%for_scope.5684 = alloca %m2811$.Scope.type*
store %m2811$.Scope.type* %.tmp5683, %m2811$.Scope.type** %for_scope.5684
%.tmp5685 = load %m2811$.Scope.type*, %m2811$.Scope.type** %for_scope.5684
%.tmp5686 = icmp eq %m2811$.Scope.type* %.tmp5685, null
br i1 %.tmp5686, label %.if.true.5687, label %.if.false.5687
.if.true.5687:
%.tmp5689 = getelementptr [1 x i8], [1 x i8]*@.str5688, i32 0, i32 0
%buf.5690 = alloca i8*
store i8* %.tmp5689, i8** %buf.5690
%.tmp5691 = getelementptr i8*, i8** %buf.5690, i32 0
%.tmp5693 = getelementptr [42 x i8], [42 x i8]*@.str5692, i32 0, i32 0
%.tmp5694 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5695 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5694, i32 0, i32 8
%.tmp5696 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5695
%.tmp5697 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5696, i32 0, i32 1
%.tmp5698 = load i8*, i8** %.tmp5697
%.tmp5699 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5691, i8* %.tmp5693, i8* %.tmp5698)
%.tmp5700 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5701 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5702 = load i8*, i8** %buf.5690
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp5700, %m996$.Node.type* %.tmp5701, i8* %.tmp5702)
ret void
br label %.if.end.5687
.if.false.5687:
br label %.if.end.5687
.if.end.5687:
%.tmp5703 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5704 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5703, i32 0, i32 8
%.tmp5705 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5704
%.tmp5706 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5705, i32 0, i32 1
%.tmp5707 = load i8*, i8** %.tmp5706
%.tmp5709 = getelementptr [6 x i8], [6 x i8]*@.str5708, i32 0, i32 0
%.tmp5710 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5707, i8* %.tmp5709)
%.tmp5711 = icmp eq i32 %.tmp5710, 0
br i1 %.tmp5711, label %.if.true.5712, label %.if.false.5712
.if.true.5712:
%.tmp5713 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5714 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp5713, i32 0, i32 1
%.tmp5715 = load %m0$.File.type*, %m0$.File.type** %.tmp5714
%.tmp5717 = getelementptr [15 x i8], [15 x i8]*@.str5716, i32 0, i32 0
%.tmp5718 = load %m2811$.Scope.type*, %m2811$.Scope.type** %for_scope.5684
%.tmp5719 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp5718, i32 0, i32 4
%.tmp5720 = load i8*, i8** %.tmp5719
%.tmp5721 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5715, i8* %.tmp5717, i8* %.tmp5720)
br label %.if.end.5712
.if.false.5712:
%.tmp5722 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5723 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5722, i32 0, i32 8
%.tmp5724 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5723
%.tmp5725 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5724, i32 0, i32 1
%.tmp5726 = load i8*, i8** %.tmp5725
%.tmp5728 = getelementptr [9 x i8], [9 x i8]*@.str5727, i32 0, i32 0
%.tmp5729 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5726, i8* %.tmp5728)
%.tmp5730 = icmp eq i32 %.tmp5729, 0
br i1 %.tmp5730, label %.if.true.5731, label %.if.false.5731
.if.true.5731:
%.tmp5732 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5733 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp5732, i32 0, i32 1
%.tmp5734 = load %m0$.File.type*, %m0$.File.type** %.tmp5733
%.tmp5736 = getelementptr [15 x i8], [15 x i8]*@.str5735, i32 0, i32 0
%.tmp5737 = load %m2811$.Scope.type*, %m2811$.Scope.type** %for_scope.5684
%.tmp5738 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp5737, i32 0, i32 3
%.tmp5739 = load i8*, i8** %.tmp5738
%.tmp5740 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5734, i8* %.tmp5736, i8* %.tmp5739)
br label %.if.end.5731
.if.false.5731:
br label %.if.end.5731
.if.end.5731:
br label %.if.end.5712
.if.end.5712:
br label %.if.end.5679
.if.false.5679:
%.tmp5741 = load i8*, i8** %expr_type.5449
%.tmp5743 = getelementptr [9 x i8], [9 x i8]*@.str5742, i32 0, i32 0
%.tmp5744 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5741, i8* %.tmp5743)
%.tmp5745 = icmp eq i32 %.tmp5744, 0
br i1 %.tmp5745, label %.if.true.5746, label %.if.false.5746
.if.true.5746:
%.tmp5747 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5748 = load %m996$.Node.type*, %m996$.Node.type** %stmt
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_closure.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp5747, %m996$.Node.type* %.tmp5748)
br label %.if.end.5746
.if.false.5746:
%.tmp5749 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5750 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5752 = getelementptr [34 x i8], [34 x i8]*@.str5751, i32 0, i32 0
%.tmp5753 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp5749, %m996$.Node.type* %.tmp5750, i8* %.tmp5752)
%.tmp5754 = load i8*, i8** %expr_type.5449
%.tmp5755 = call i32(i8*,...) @printf(i8* %.tmp5753, i8* %.tmp5754)
br label %.if.end.5746
.if.end.5746:
br label %.if.end.5679
.if.end.5679:
br label %.if.end.5671
.if.end.5671:
br label %.if.end.5663
.if.end.5663:
br label %.if.end.5575
.if.end.5575:
br label %.if.end.5566
.if.end.5566:
br label %.if.end.5555
.if.end.5555:
br label %.if.end.5549
.if.end.5549:
br label %.if.end.5460
.if.end.5460:
ret void
}
define %m2811$.Scope.type* @m311$get_scope.m2811$.Scope.typep.m2811$.CompilerCtx.typep.cp(%m2811$.CompilerCtx.type* %.ctx.arg, i8* %.scope_type.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%scope_type = alloca i8*
store i8* %.scope_type.arg, i8** %scope_type
%.tmp5756 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5757 = call %m2811$.ModuleLookup.type*(%m2811$.CompilerCtx.type*) @m311$get_current_module.m2811$.ModuleLookup.typep.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp5756)
%mod.5758 = alloca %m2811$.ModuleLookup.type*
store %m2811$.ModuleLookup.type* %.tmp5757, %m2811$.ModuleLookup.type** %mod.5758
%.tmp5760 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.5758
%.tmp5761 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp5760, i32 0, i32 3
%.tmp5762 = load %m2811$.Scope.type*, %m2811$.Scope.type** %.tmp5761
%s.5763 = alloca %m2811$.Scope.type*
store %m2811$.Scope.type* %.tmp5762, %m2811$.Scope.type** %s.5763
br label %.for.start.5759
.for.start.5759:
%.tmp5764 = load %m2811$.Scope.type*, %m2811$.Scope.type** %s.5763
%.tmp5765 = icmp ne %m2811$.Scope.type* %.tmp5764, null
br i1 %.tmp5765, label %.for.continue.5759, label %.for.end.5759
.for.continue.5759:
%.tmp5766 = load %m2811$.Scope.type*, %m2811$.Scope.type** %s.5763
%.tmp5767 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp5766, i32 0, i32 2
%.tmp5768 = load i8*, i8** %.tmp5767
%.tmp5769 = load i8*, i8** %scope_type
%.tmp5770 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp5768, i8* %.tmp5769)
%.tmp5771 = icmp eq i32 %.tmp5770, 0
br i1 %.tmp5771, label %.if.true.5772, label %.if.false.5772
.if.true.5772:
%.tmp5773 = load %m2811$.Scope.type*, %m2811$.Scope.type** %s.5763
ret %m2811$.Scope.type* %.tmp5773
br label %.if.end.5772
.if.false.5772:
br label %.if.end.5772
.if.end.5772:
%.tmp5774 = load %m2811$.Scope.type*, %m2811$.Scope.type** %s.5763
%.tmp5775 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp5774, i32 0, i32 5
%.tmp5776 = load %m2811$.Scope.type*, %m2811$.Scope.type** %.tmp5775
store %m2811$.Scope.type* %.tmp5776, %m2811$.Scope.type** %s.5763
br label %.for.start.5759
.for.end.5759:
%.tmp5777 = bitcast ptr null to %m2811$.Scope.type*
ret %m2811$.Scope.type* %.tmp5777
}
define %m2811$.Type.type* @m311$type_ptr_of_chr.m2811$.Type.typep() {
%.tmp5778 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
%t.5779 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp5778, %m2811$.Type.type** %t.5779
%.tmp5780 = load %m2811$.Type.type*, %m2811$.Type.type** %t.5779
%.tmp5781 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5780, i32 0, i32 0
%.tmp5783 = getelementptr [4 x i8], [4 x i8]*@.str5782, i32 0, i32 0
store i8* %.tmp5783, i8** %.tmp5781
%.tmp5784 = load %m2811$.Type.type*, %m2811$.Type.type** %t.5779
%.tmp5785 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5784, i32 0, i32 3
%.tmp5786 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5786, %m2811$.Type.type** %.tmp5785
%.tmp5787 = load %m2811$.Type.type*, %m2811$.Type.type** %t.5779
%.tmp5788 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5787, i32 0, i32 3
%.tmp5789 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5788
%.tmp5790 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5789, i32 0, i32 0
%.tmp5792 = getelementptr [4 x i8], [4 x i8]*@.str5791, i32 0, i32 0
store i8* %.tmp5792, i8** %.tmp5790
%.tmp5793 = load %m2811$.Type.type*, %m2811$.Type.type** %t.5779
ret %m2811$.Type.type* %.tmp5793
}
define void @m311$compile_closure.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp5794 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5795 = call i32(%m2811$.CompilerCtx.type*) @m311$new_uid.i.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp5794)
%cj_id.5796 = alloca i32
store i32 %.tmp5795, i32* %cj_id.5796
%.tmp5797 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5798 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp5797)
%info_lit.5799 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp5798, %m2811$.AssignableInfo.type** %info_lit.5799
%.tmp5800 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_lit.5799
%.tmp5801 = load i8, i8* @SCOPE_GLOBAL
%.tmp5803 = getelementptr [21 x i8], [21 x i8]*@.str5802, i32 0, i32 0
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp5800, i8 %.tmp5801, i8* %.tmp5803)
%.tmp5804 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_lit.5799
%.tmp5805 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5804, i32 0, i32 4
%.tmp5806 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5806, %m2811$.Type.type** %.tmp5805
%.tmp5807 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_lit.5799
%.tmp5808 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5807, i32 0, i32 4
%.tmp5809 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5808
%.tmp5810 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5809, i32 0, i32 0
%.tmp5812 = getelementptr [9 x i8], [9 x i8]*@.str5811, i32 0, i32 0
store i8* %.tmp5812, i8** %.tmp5810
%.tmp5813 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_lit.5799
%.tmp5814 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5813, i32 0, i32 4
%.tmp5815 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5814
%.tmp5816 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5815, i32 0, i32 3
%.tmp5817 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5817, %m2811$.Type.type** %.tmp5816
%.tmp5818 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_lit.5799
%.tmp5819 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5818, i32 0, i32 4
%.tmp5820 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5819
%.tmp5821 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5820, i32 0, i32 3
%.tmp5822 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5821
%.tmp5823 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5822, i32 0, i32 0
%.tmp5825 = getelementptr [5 x i8], [5 x i8]*@.str5824, i32 0, i32 0
store i8* %.tmp5825, i8** %.tmp5823
%.tmp5826 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_lit.5799
%.tmp5827 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5826, i32 0, i32 4
%.tmp5828 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5827
%.tmp5829 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5828, i32 0, i32 3
%.tmp5830 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5829
%.tmp5831 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5830, i32 0, i32 4
%.tmp5832 = call %m2811$.Type.type*() @m311$type_ptr_of_chr.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5832, %m2811$.Type.type** %.tmp5831
%.tmp5833 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_lit.5799
%.tmp5834 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5833, i32 0, i32 4
%.tmp5835 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5834
%.tmp5836 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5835, i32 0, i32 3
%.tmp5837 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5836
%.tmp5838 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5837, i32 0, i32 4
%.tmp5839 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5838
%.tmp5840 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5839, i32 0, i32 4
%.tmp5841 = call %m2811$.Type.type*() @m311$type_ptr_of_chr.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5841, %m2811$.Type.type** %.tmp5840
%.tmp5842 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_lit.5799
%.tmp5843 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5842, i32 0, i32 4
%.tmp5844 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5843
%.tmp5845 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5844, i32 0, i32 3
%.tmp5846 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5845
%.tmp5847 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5846, i32 0, i32 4
%.tmp5848 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5847
%.tmp5849 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5848, i32 0, i32 4
%.tmp5850 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5849
%.tmp5851 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5850, i32 0, i32 4
%.tmp5852 = call %m2811$.Type.type*() @m311$type_ptr_of_chr.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5852, %m2811$.Type.type** %.tmp5851
%.tmp5853 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5855 = getelementptr [21 x i8], [21 x i8]*@.str5854, i32 0, i32 0
%.tmp5857 = getelementptr [7 x i8], [7 x i8]*@.str5856, i32 0, i32 0
%.tmp5858 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_lit.5799
call void(%m2811$.CompilerCtx.type*,i8*,i8*,%m2811$.AssignableInfo.type*,i1,i1) @m311$define_global.v.m2811$.CompilerCtx.typep.cp.cp.m2811$.AssignableInfo.typep.b.b(%m2811$.CompilerCtx.type* %.tmp5853, i8* %.tmp5855, i8* %.tmp5857, %m2811$.AssignableInfo.type* %.tmp5858, i1 1, i1 0)
%.tmp5859 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5860 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp5859)
%info_lat.5861 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp5860, %m2811$.AssignableInfo.type** %info_lat.5861
%.tmp5862 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_lat.5861
%.tmp5863 = load i8, i8* @SCOPE_GLOBAL
%.tmp5865 = getelementptr [23 x i8], [23 x i8]*@.str5864, i32 0, i32 0
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp5862, i8 %.tmp5863, i8* %.tmp5865)
%.tmp5866 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_lat.5861
%.tmp5867 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5866, i32 0, i32 4
%.tmp5868 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5868, %m2811$.Type.type** %.tmp5867
%.tmp5869 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_lat.5861
%.tmp5870 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5869, i32 0, i32 4
%.tmp5871 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5870
%.tmp5872 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5871, i32 0, i32 0
%.tmp5874 = getelementptr [9 x i8], [9 x i8]*@.str5873, i32 0, i32 0
store i8* %.tmp5874, i8** %.tmp5872
%.tmp5875 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_lat.5861
%.tmp5876 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5875, i32 0, i32 4
%.tmp5877 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5876
%.tmp5878 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5877, i32 0, i32 3
%.tmp5879 = call %m2811$.Type.type*() @m311$type_ptr_of_chr.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5879, %m2811$.Type.type** %.tmp5878
%.tmp5880 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_lat.5861
%.tmp5881 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5880, i32 0, i32 4
%.tmp5882 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5881
%.tmp5883 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5882, i32 0, i32 3
%.tmp5884 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5883
%.tmp5885 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5884, i32 0, i32 4
%.tmp5886 = call %m2811$.Type.type*() @m311$type_ptr_of_chr.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5886, %m2811$.Type.type** %.tmp5885
%.tmp5887 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5889 = getelementptr [23 x i8], [23 x i8]*@.str5888, i32 0, i32 0
%.tmp5891 = getelementptr [7 x i8], [7 x i8]*@.str5890, i32 0, i32 0
%.tmp5892 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_lat.5861
call void(%m2811$.CompilerCtx.type*,i8*,i8*,%m2811$.AssignableInfo.type*,i1,i1) @m311$define_global.v.m2811$.CompilerCtx.typep.cp.cp.m2811$.AssignableInfo.typep.b.b(%m2811$.CompilerCtx.type* %.tmp5887, i8* %.tmp5889, i8* %.tmp5891, %m2811$.AssignableInfo.type* %.tmp5892, i1 1, i1 0)
%.tmp5893 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5894 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp5893)
%info_mmap.5895 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp5894, %m2811$.AssignableInfo.type** %info_mmap.5895
%.tmp5896 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_mmap.5895
%.tmp5897 = load i8, i8* @SCOPE_GLOBAL
%.tmp5899 = getelementptr [5 x i8], [5 x i8]*@.str5898, i32 0, i32 0
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp5896, i8 %.tmp5897, i8* %.tmp5899)
%.tmp5900 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_mmap.5895
%.tmp5901 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5900, i32 0, i32 4
%.tmp5902 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5902, %m2811$.Type.type** %.tmp5901
%.tmp5903 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_mmap.5895
%.tmp5904 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5903, i32 0, i32 4
%.tmp5905 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5904
%.tmp5906 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5905, i32 0, i32 0
%.tmp5908 = getelementptr [9 x i8], [9 x i8]*@.str5907, i32 0, i32 0
store i8* %.tmp5908, i8** %.tmp5906
%.tmp5909 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_mmap.5895
%.tmp5910 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5909, i32 0, i32 4
%.tmp5911 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5910
%.tmp5912 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5911, i32 0, i32 3
%.tmp5913 = call %m2811$.Type.type*() @m311$type_ptr_of_chr.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5913, %m2811$.Type.type** %.tmp5912
%.tmp5914 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_mmap.5895
%.tmp5915 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp5914, i32 0, i32 4
%.tmp5916 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5915
%.tmp5917 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5916, i32 0, i32 3
%.tmp5918 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5917
%lt.5919 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp5918, %m2811$.Type.type** %lt.5919
%.tmp5920 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5921 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5920, i32 0, i32 4
%.tmp5922 = call %m2811$.Type.type*() @m311$type_ptr_of_chr.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5922, %m2811$.Type.type** %.tmp5921
%.tmp5923 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5924 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5923, i32 0, i32 4
%.tmp5925 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5924
store %m2811$.Type.type* %.tmp5925, %m2811$.Type.type** %lt.5919
%.tmp5926 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5927 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5926, i32 0, i32 4
%.tmp5928 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5928, %m2811$.Type.type** %.tmp5927
%.tmp5929 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5930 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5929, i32 0, i32 4
%.tmp5931 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5930
%.tmp5932 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5931, i32 0, i32 0
%.tmp5934 = getelementptr [4 x i8], [4 x i8]*@.str5933, i32 0, i32 0
store i8* %.tmp5934, i8** %.tmp5932
%.tmp5935 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5936 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5935, i32 0, i32 4
%.tmp5937 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5936
store %m2811$.Type.type* %.tmp5937, %m2811$.Type.type** %lt.5919
%.tmp5938 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5939 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5938, i32 0, i32 4
%.tmp5940 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5940, %m2811$.Type.type** %.tmp5939
%.tmp5941 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5942 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5941, i32 0, i32 4
%.tmp5943 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5942
%.tmp5944 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5943, i32 0, i32 0
%.tmp5946 = getelementptr [4 x i8], [4 x i8]*@.str5945, i32 0, i32 0
store i8* %.tmp5946, i8** %.tmp5944
%.tmp5947 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5948 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5947, i32 0, i32 4
%.tmp5949 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5948
store %m2811$.Type.type* %.tmp5949, %m2811$.Type.type** %lt.5919
%.tmp5950 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5951 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5950, i32 0, i32 4
%.tmp5952 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5952, %m2811$.Type.type** %.tmp5951
%.tmp5953 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5954 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5953, i32 0, i32 4
%.tmp5955 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5954
%.tmp5956 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5955, i32 0, i32 0
%.tmp5958 = getelementptr [4 x i8], [4 x i8]*@.str5957, i32 0, i32 0
store i8* %.tmp5958, i8** %.tmp5956
%.tmp5959 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5960 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5959, i32 0, i32 4
%.tmp5961 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5960
store %m2811$.Type.type* %.tmp5961, %m2811$.Type.type** %lt.5919
%.tmp5962 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5963 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5962, i32 0, i32 4
%.tmp5964 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5964, %m2811$.Type.type** %.tmp5963
%.tmp5965 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5966 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5965, i32 0, i32 4
%.tmp5967 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5966
%.tmp5968 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5967, i32 0, i32 0
%.tmp5970 = getelementptr [4 x i8], [4 x i8]*@.str5969, i32 0, i32 0
store i8* %.tmp5970, i8** %.tmp5968
%.tmp5971 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5972 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5971, i32 0, i32 4
%.tmp5973 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5972
store %m2811$.Type.type* %.tmp5973, %m2811$.Type.type** %lt.5919
%.tmp5974 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5975 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5974, i32 0, i32 4
%.tmp5976 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp5976, %m2811$.Type.type** %.tmp5975
%.tmp5977 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5978 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5977, i32 0, i32 4
%.tmp5979 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5978
%.tmp5980 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5979, i32 0, i32 0
%.tmp5982 = getelementptr [4 x i8], [4 x i8]*@.str5981, i32 0, i32 0
store i8* %.tmp5982, i8** %.tmp5980
%.tmp5983 = load %m2811$.Type.type*, %m2811$.Type.type** %lt.5919
%.tmp5984 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp5983, i32 0, i32 4
%.tmp5985 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp5984
store %m2811$.Type.type* %.tmp5985, %m2811$.Type.type** %lt.5919
%.tmp5986 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp5988 = getelementptr [5 x i8], [5 x i8]*@.str5987, i32 0, i32 0
%.tmp5990 = getelementptr [7 x i8], [7 x i8]*@.str5989, i32 0, i32 0
%.tmp5991 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info_mmap.5895
call void(%m2811$.CompilerCtx.type*,i8*,i8*,%m2811$.AssignableInfo.type*,i1,i1) @m311$define_global.v.m2811$.CompilerCtx.typep.cp.cp.m2811$.AssignableInfo.typep.b.b(%m2811$.CompilerCtx.type* %.tmp5986, i8* %.tmp5988, i8* %.tmp5990, %m2811$.AssignableInfo.type* %.tmp5991, i1 1, i1 0)
%.tmp5992 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp5993 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5992, i32 0, i32 8
%.tmp5994 = load %m996$.Node.type*, %m996$.Node.type** %.tmp5993
%.tmp5996 = getelementptr [5 x i8], [5 x i8]*@.str5995, i32 0, i32 0
%.tmp5997 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp5994, i8* %.tmp5996)
%fn_name_node.5998 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp5997, %m996$.Node.type** %fn_name_node.5998
%.tmp5999 = load %m996$.Node.type*, %m996$.Node.type** %fn_name_node.5998
%.tmp6000 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp5999, i32 0, i32 1
%.tmp6001 = load i8*, i8** %.tmp6000
%fn_name.6002 = alloca i8*
store i8* %.tmp6001, i8** %fn_name.6002
%.tmp6003 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6004 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp6003)
%info.6005 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp6004, %m2811$.AssignableInfo.type** %info.6005
%.tmp6006 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6005
%.tmp6007 = load i8, i8* @SCOPE_LOCAL
%.tmp6008 = load i8*, i8** %fn_name.6002
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp6006, i8 %.tmp6007, i8* %.tmp6008)
%.tmp6009 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6005
%.tmp6010 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6009, i32 0, i32 4
%.tmp6011 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6012 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6013 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6012, i32 0, i32 8
%.tmp6014 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6013
%.tmp6015 = call %m2811$.Type.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$syn_function_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp6011, %m996$.Node.type* %.tmp6014)
store %m2811$.Type.type* %.tmp6015, %m2811$.Type.type** %.tmp6010
%.tmp6016 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6005
%.tmp6017 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6016, i32 0, i32 3
%.tmp6019 = getelementptr [9 x i8], [9 x i8]*@.str6018, i32 0, i32 0
store i8* %.tmp6019, i8** %.tmp6017
%.tmp6020 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6021 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6022 = load i8*, i8** %fn_name.6002
%.tmp6023 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6005
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2811$.AssignableInfo.type*) @m311$define_assignable.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp6020, %m996$.Node.type* %.tmp6021, i8* %.tmp6022, %m2811$.AssignableInfo.type* %.tmp6023)
%.tmp6024 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6025 = call i32(%m2811$.CompilerCtx.type*) @m311$new_uid.i.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp6024)
%closure_id.6026 = alloca i32
store i32 %.tmp6025, i32* %closure_id.6026
%.tmp6027 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6005
%.tmp6028 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6027, i32 0, i32 4
%.tmp6029 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6028
%.tmp6030 = call %m2811$.Type.type*(%m2811$.Type.type*) @m311$type_clone.m2811$.Type.typep.m2811$.Type.typep(%m2811$.Type.type* %.tmp6029)
%closure_type.6031 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp6030, %m2811$.Type.type** %closure_type.6031
%.tmp6032 = load %m2811$.Type.type*, %m2811$.Type.type** %closure_type.6031
%.tmp6033 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6032, i32 0, i32 3
%.tmp6034 = load %m2811$.Type.type*, %m2811$.Type.type** %closure_type.6031
%.tmp6035 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6034, i32 0, i32 3
%.tmp6036 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6035
%.tmp6037 = call %m2811$.Type.type*(%m2811$.Type.type*) @m311$type_clone.m2811$.Type.typep.m2811$.Type.typep(%m2811$.Type.type* %.tmp6036)
store %m2811$.Type.type* %.tmp6037, %m2811$.Type.type** %.tmp6033
%.tmp6038 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
%ctx_param.6039 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp6038, %m2811$.Type.type** %ctx_param.6039
%.tmp6040 = load %m2811$.Type.type*, %m2811$.Type.type** %ctx_param.6039
%.tmp6041 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6040, i32 0, i32 0
%.tmp6043 = getelementptr [4 x i8], [4 x i8]*@.str6042, i32 0, i32 0
store i8* %.tmp6043, i8** %.tmp6041
%.tmp6044 = load %m2811$.Type.type*, %m2811$.Type.type** %ctx_param.6039
%.tmp6045 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6044, i32 0, i32 3
%.tmp6046 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp6046, %m2811$.Type.type** %.tmp6045
%.tmp6047 = load %m2811$.Type.type*, %m2811$.Type.type** %ctx_param.6039
%.tmp6048 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6047, i32 0, i32 3
%.tmp6049 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6048
%.tmp6050 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6049, i32 0, i32 0
%.tmp6052 = getelementptr [7 x i8], [7 x i8]*@.str6051, i32 0, i32 0
store i8* %.tmp6052, i8** %.tmp6050
%.tmp6053 = load %m2811$.Type.type*, %m2811$.Type.type** %ctx_param.6039
%.tmp6054 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6053, i32 0, i32 4
%.tmp6055 = load %m2811$.Type.type*, %m2811$.Type.type** %closure_type.6031
%.tmp6056 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6055, i32 0, i32 3
%.tmp6057 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6056
%.tmp6058 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6057, i32 0, i32 4
%.tmp6059 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6058
store %m2811$.Type.type* %.tmp6059, %m2811$.Type.type** %.tmp6054
%.tmp6060 = load %m2811$.Type.type*, %m2811$.Type.type** %closure_type.6031
%.tmp6061 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6060, i32 0, i32 3
%.tmp6062 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6061
%.tmp6063 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6062, i32 0, i32 4
%.tmp6064 = load %m2811$.Type.type*, %m2811$.Type.type** %ctx_param.6039
store %m2811$.Type.type* %.tmp6064, %m2811$.Type.type** %.tmp6063
%.tmp6066 = getelementptr [1 x i8], [1 x i8]*@.str6065, i32 0, i32 0
%closure_name.6067 = alloca i8*
store i8* %.tmp6066, i8** %closure_name.6067
%.tmp6068 = getelementptr i8*, i8** %closure_name.6067, i32 0
%.tmp6070 = getelementptr [5 x i8], [5 x i8]*@.str6069, i32 0, i32 0
%.tmp6071 = load i32, i32* %closure_id.6026
%.tmp6072 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6068, i8* %.tmp6070, i32 %.tmp6071)
%.tmp6073 = load %m2811$.Type.type*, %m2811$.Type.type** %closure_type.6031
%.tmp6074 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6073, i32 0, i32 3
%.tmp6075 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6074
%.tmp6076 = call %m2811$.Type.type*(%m2811$.Type.type*) @m311$type_clone.m2811$.Type.typep.m2811$.Type.typep(%m2811$.Type.type* %.tmp6075)
%ret_type.6077 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp6076, %m2811$.Type.type** %ret_type.6077
%.tmp6078 = load %m2811$.Type.type*, %m2811$.Type.type** %ret_type.6077
%.tmp6079 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6078, i32 0, i32 3
store %m2811$.Type.type* null, %m2811$.Type.type** %.tmp6079
%.tmp6080 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6081 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6080, i32 0, i32 1
%.tmp6082 = load %m0$.File.type*, %m0$.File.type** %.tmp6081
%.tmp6084 = getelementptr [101 x i8], [101 x i8]*@.str6083, i32 0, i32 0
%.tmp6085 = load i32, i32* %closure_id.6026
%.tmp6086 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6082, i8* %.tmp6084, i32 %.tmp6085)
%.tmp6087 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6088 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6087, i32 0, i32 1
%.tmp6089 = load %m0$.File.type*, %m0$.File.type** %.tmp6088
%.tmp6091 = getelementptr [100 x i8], [100 x i8]*@.str6090, i32 0, i32 0
%.tmp6092 = load i32, i32* %closure_id.6026
%.tmp6093 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6094 = load %m2811$.Type.type*, %m2811$.Type.type** %closure_type.6031
%.tmp6095 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6093, %m2811$.Type.type* %.tmp6094)
%.tmp6096 = load i8*, i8** %closure_name.6067
%.tmp6097 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6089, i8* %.tmp6091, i32 %.tmp6092, i8* %.tmp6095, i8* %.tmp6096)
%.tmp6098 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6099 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6098, i32 0, i32 1
%.tmp6100 = load %m0$.File.type*, %m0$.File.type** %.tmp6099
%.tmp6102 = getelementptr [66 x i8], [66 x i8]*@.str6101, i32 0, i32 0
%.tmp6103 = load i32, i32* %closure_id.6026
%.tmp6104 = load i32, i32* %closure_id.6026
%.tmp6105 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6100, i8* %.tmp6102, i32 %.tmp6103, i32 %.tmp6104)
%.tmp6106 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6107 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6106, i32 0, i32 1
%.tmp6108 = load %m0$.File.type*, %m0$.File.type** %.tmp6107
%.tmp6110 = getelementptr [35 x i8], [35 x i8]*@.str6109, i32 0, i32 0
%.tmp6111 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6005
%.tmp6112 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp6111)
%.tmp6113 = load i32, i32* %closure_id.6026
%.tmp6114 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6115 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6005
%.tmp6116 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6115, i32 0, i32 4
%.tmp6117 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6116
%.tmp6118 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6114, %m2811$.Type.type* %.tmp6117)
%.tmp6119 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6108, i8* %.tmp6110, i8* %.tmp6112, i32 %.tmp6113, i8* %.tmp6118)
%.tmp6120 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6121 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6120, i32 0, i32 1
%.tmp6122 = load %m0$.File.type*, %m0$.File.type** %.tmp6121
%bkp_ctx.6123 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6122, %m0$.File.type** %bkp_ctx.6123
%.tmp6124 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6125 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6124, i32 0, i32 1
%.tmp6126 = call %m0$.File.type*() @tmpfile()
store %m0$.File.type* %.tmp6126, %m0$.File.type** %.tmp6125
%.tmp6127 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6128 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6127, i32 0, i32 1
%.tmp6129 = load %m0$.File.type*, %m0$.File.type** %.tmp6128
%.tmp6131 = getelementptr [14 x i8], [14 x i8]*@.str6130, i32 0, i32 0
%.tmp6132 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6133 = load %m2811$.Type.type*, %m2811$.Type.type** %ret_type.6077
%.tmp6134 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6132, %m2811$.Type.type* %.tmp6133)
%.tmp6135 = load i8*, i8** %closure_name.6067
%.tmp6136 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6129, i8* %.tmp6131, i8* %.tmp6134, i8* %.tmp6135)
%.tmp6137 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6139 = getelementptr [9 x i8], [9 x i8]*@.str6138, i32 0, i32 0
%.tmp6140 = bitcast ptr null to i8*
%.tmp6141 = bitcast ptr null to i8*
%.tmp6142 = load %m2811$.Type.type*, %m2811$.Type.type** %ret_type.6077
call void(%m2811$.CompilerCtx.type*,i8*,i8*,i8*,%m2811$.Type.type*) @m311$push_scope.v.m2811$.CompilerCtx.typep.cp.cp.cp.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6137, i8* %.tmp6139, i8* %.tmp6140, i8* %.tmp6141, %m2811$.Type.type* %.tmp6142)
%.tmp6143 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6144 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6143, i32 0, i32 1
%.tmp6145 = load %m0$.File.type*, %m0$.File.type** %.tmp6144
%.tmp6147 = getelementptr [13 x i8], [13 x i8]*@.str6146, i32 0, i32 0
%.tmp6148 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6149 = load %m2811$.Type.type*, %m2811$.Type.type** %ctx_param.6039
%.tmp6150 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6148, %m2811$.Type.type* %.tmp6149)
%.tmp6151 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6145, i8* %.tmp6147, i8* %.tmp6150)
%.tmp6152 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6153 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6152, i32 0, i32 8
%.tmp6154 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6153
%.tmp6155 = call %m996$.Node.type*(%m996$.Node.type*) @m311$syn_function_params.m996$.Node.typep.m996$.Node.typep(%m996$.Node.type* %.tmp6154)
%params.6156 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6155, %m996$.Node.type** %params.6156
%param_type.6157 = alloca %m2811$.Type.type*
store %m2811$.Type.type* null, %m2811$.Type.type** %param_type.6157
%.tmp6159 = load %m996$.Node.type*, %m996$.Node.type** %params.6156
%param_ptr.6160 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6159, %m996$.Node.type** %param_ptr.6160
br label %.for.start.6158
.for.start.6158:
%.tmp6161 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.6160
%.tmp6162 = icmp ne %m996$.Node.type* %.tmp6161, null
br i1 %.tmp6162, label %.for.continue.6158, label %.for.end.6158
.for.continue.6158:
%.tmp6163 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.6160
%.tmp6164 = load %m996$.Node.type*, %m996$.Node.type** %params.6156
%.tmp6165 = icmp ne %m996$.Node.type* %.tmp6163, %.tmp6164
br i1 %.tmp6165, label %.if.true.6166, label %.if.false.6166
.if.true.6166:
%.tmp6167 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.6160
%.tmp6168 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6167, i32 0, i32 9
%.tmp6169 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6168
store %m996$.Node.type* %.tmp6169, %m996$.Node.type** %param_ptr.6160
br label %.if.end.6166
.if.false.6166:
br label %.if.end.6166
.if.end.6166:
%.tmp6170 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6171 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6170, i32 0, i32 1
%.tmp6172 = load %m0$.File.type*, %m0$.File.type** %.tmp6171
%.tmp6174 = getelementptr [3 x i8], [3 x i8]*@.str6173, i32 0, i32 0
%.tmp6175 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6172, i8* %.tmp6174)
%.tmp6176 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.6160
%.tmp6177 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6176, i32 0, i32 0
%.tmp6178 = load i8*, i8** %.tmp6177
%.tmp6180 = getelementptr [5 x i8], [5 x i8]*@.str6179, i32 0, i32 0
%.tmp6181 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6178, i8* %.tmp6180)
%.tmp6182 = icmp eq i32 %.tmp6181, 0
br i1 %.tmp6182, label %.if.true.6183, label %.if.false.6183
.if.true.6183:
%.tmp6184 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6185 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.6160
%.tmp6186 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6185, i32 0, i32 8
%.tmp6187 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6186
%.tmp6188 = call %m2811$.Type.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp6184, %m996$.Node.type* %.tmp6187)
store %m2811$.Type.type* %.tmp6188, %m2811$.Type.type** %param_type.6157
%.tmp6189 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.6160
%.tmp6190 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6189, i32 0, i32 9
%.tmp6191 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6190
store %m996$.Node.type* %.tmp6191, %m996$.Node.type** %param_ptr.6160
br label %.if.end.6183
.if.false.6183:
br label %.if.end.6183
.if.end.6183:
%.tmp6192 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6193 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6192, i32 0, i32 1
%.tmp6194 = load %m0$.File.type*, %m0$.File.type** %.tmp6193
%.tmp6196 = getelementptr [13 x i8], [13 x i8]*@.str6195, i32 0, i32 0
%.tmp6197 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6198 = load %m2811$.Type.type*, %m2811$.Type.type** %param_type.6157
%.tmp6199 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6197, %m2811$.Type.type* %.tmp6198)
%.tmp6200 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.6160
%.tmp6201 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6200, i32 0, i32 1
%.tmp6202 = load i8*, i8** %.tmp6201
%.tmp6203 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6194, i8* %.tmp6196, i8* %.tmp6199, i8* %.tmp6202)
%.tmp6204 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.6160
%.tmp6205 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6204, i32 0, i32 9
%.tmp6206 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6205
store %m996$.Node.type* %.tmp6206, %m996$.Node.type** %param_ptr.6160
br label %.for.start.6158
.for.end.6158:
%.tmp6207 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6208 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6207, i32 0, i32 1
%.tmp6209 = load %m0$.File.type*, %m0$.File.type** %.tmp6208
%.tmp6211 = getelementptr [5 x i8], [5 x i8]*@.str6210, i32 0, i32 0
%.tmp6212 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6209, i8* %.tmp6211)
%.tmp6213 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6214 = load %m996$.Node.type*, %m996$.Node.type** %params.6156
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_fn_params.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp6213, %m996$.Node.type* %.tmp6214)
%.tmp6215 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6216 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6215, i32 0, i32 8
%.tmp6217 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6216
%.tmp6219 = getelementptr [6 x i8], [6 x i8]*@.str6218, i32 0, i32 0
%.tmp6220 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6217, i8* %.tmp6219)
%block.6221 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6220, %m996$.Node.type** %block.6221
%.tmp6222 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6223 = load %m996$.Node.type*, %m996$.Node.type** %block.6221
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_block.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp6222, %m996$.Node.type* %.tmp6223)
%.tmp6224 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6225 = load %m996$.Node.type*, %m996$.Node.type** %block.6221
%.tmp6226 = load %m2811$.Type.type*, %m2811$.Type.type** %ret_type.6077
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,%m2811$.Type.type*) @m311$check_n_add_implicit_return.v.m2811$.CompilerCtx.typep.m996$.Node.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6224, %m996$.Node.type* %.tmp6225, %m2811$.Type.type* %.tmp6226)
%.tmp6227 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
call void(%m2811$.CompilerCtx.type*) @m311$pop_scope.v.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp6227)
%.tmp6228 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6229 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6228, i32 0, i32 1
%.tmp6230 = load %m0$.File.type*, %m0$.File.type** %.tmp6229
%.tmp6232 = getelementptr [3 x i8], [3 x i8]*@.str6231, i32 0, i32 0
%.tmp6233 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6230, i8* %.tmp6232)
%.tmp6234 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6235 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6234, i32 0, i32 1
%.tmp6236 = load %m0$.File.type*, %m0$.File.type** %.tmp6235
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp6236)
%.tmp6237 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6238 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6237, i32 0, i32 1
%.tmp6239 = load %m0$.File.type*, %m0$.File.type** %.tmp6238
%.tmp6240 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6239)
%.tmp6241 = call i8*(i32) @m1$readall.cp.i(i32 %.tmp6240)
%code.6242 = alloca i8*
store i8* %.tmp6241, i8** %code.6242
%.tmp6243 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6244 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6243, i32 0, i32 1
%.tmp6245 = load %m0$.File.type*, %m0$.File.type** %.tmp6244
%.tmp6246 = call i32(%m0$.File.type*) @fclose(%m0$.File.type* %.tmp6245)
%.tmp6247 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6248 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6247, i32 0, i32 1
%.tmp6249 = load %m0$.File.type*, %m0$.File.type** %bkp_ctx.6123
store %m0$.File.type* %.tmp6249, %m0$.File.type** %.tmp6248
%.tmp6250 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6251 = load i8*, i8** %code.6242
call void(%m2811$.CompilerCtx.type*,i8*) @m311$append_anon_fn.v.m2811$.CompilerCtx.typep.cp(%m2811$.CompilerCtx.type* %.tmp6250, i8* %.tmp6251)
ret void
}
define void @m311$check_n_add_implicit_return.v.m2811$.CompilerCtx.typep.m996$.Node.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, %m2811$.Type.type* %.return_type.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%return_type = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.return_type.arg, %m2811$.Type.type** %return_type
%.tmp6252 = bitcast ptr null to %m996$.Node.type*
%li.6253 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6252, %m996$.Node.type** %li.6253
%.tmp6254 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6255 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6254, i32 0, i32 8
%.tmp6256 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6255
%.tmp6258 = getelementptr [12 x i8], [12 x i8]*@.str6257, i32 0, i32 0
%.tmp6259 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6256, i8* %.tmp6258)
%exprs.6260 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6259, %m996$.Node.type** %exprs.6260
%.tmp6262 = load %m996$.Node.type*, %m996$.Node.type** %exprs.6260
%.tmp6263 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6262, i32 0, i32 8
%.tmp6264 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6263
%ci.6265 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6264, %m996$.Node.type** %ci.6265
br label %.for.start.6261
.for.start.6261:
%.tmp6266 = load %m996$.Node.type*, %m996$.Node.type** %ci.6265
%.tmp6267 = icmp ne %m996$.Node.type* %.tmp6266, null
br i1 %.tmp6267, label %.for.continue.6261, label %.for.end.6261
.for.continue.6261:
%.tmp6268 = load %m996$.Node.type*, %m996$.Node.type** %ci.6265
%.tmp6269 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6268, i32 0, i32 8
%.tmp6270 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6269
%.tmp6271 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6270, i32 0, i32 0
%.tmp6272 = load i8*, i8** %.tmp6271
%.tmp6274 = getelementptr [3 x i8], [3 x i8]*@.str6273, i32 0, i32 0
%.tmp6275 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6272, i8* %.tmp6274)
%.tmp6276 = icmp ne i32 %.tmp6275, 0
br i1 %.tmp6276, label %.if.true.6277, label %.if.false.6277
.if.true.6277:
%.tmp6278 = load %m996$.Node.type*, %m996$.Node.type** %ci.6265
store %m996$.Node.type* %.tmp6278, %m996$.Node.type** %li.6253
br label %.if.end.6277
.if.false.6277:
br label %.if.end.6277
.if.end.6277:
%.tmp6279 = load %m996$.Node.type*, %m996$.Node.type** %ci.6265
%.tmp6280 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6279, i32 0, i32 9
%.tmp6281 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6280
store %m996$.Node.type* %.tmp6281, %m996$.Node.type** %ci.6265
br label %.for.start.6261
.for.end.6261:
%.tmp6282 = load %m996$.Node.type*, %m996$.Node.type** %li.6253
%.tmp6283 = icmp ne %m996$.Node.type* %.tmp6282, null
br i1 %.tmp6283, label %.if.true.6284, label %.if.false.6284
.if.true.6284:
%.tmp6285 = load %m996$.Node.type*, %m996$.Node.type** %li.6253
%.tmp6286 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6285, i32 0, i32 8
%.tmp6287 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6286
%.tmp6288 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6287, i32 0, i32 0
%.tmp6289 = load i8*, i8** %.tmp6288
%.tmp6291 = getelementptr [7 x i8], [7 x i8]*@.str6290, i32 0, i32 0
%.tmp6292 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6289, i8* %.tmp6291)
%.tmp6293 = icmp eq i32 %.tmp6292, 0
br i1 %.tmp6293, label %.if.true.6294, label %.if.false.6294
.if.true.6294:
ret void
br label %.if.end.6294
.if.false.6294:
br label %.if.end.6294
.if.end.6294:
br label %.if.end.6284
.if.false.6284:
br label %.if.end.6284
.if.end.6284:
%.tmp6295 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6296 = load %m2811$.Type.type*, %m2811$.Type.type** %return_type
%.tmp6297 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6295, %m2811$.Type.type* %.tmp6296)
%.tmp6299 = getelementptr [5 x i8], [5 x i8]*@.str6298, i32 0, i32 0
%.tmp6300 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6297, i8* %.tmp6299)
%.tmp6301 = icmp ne i32 %.tmp6300, 0
br i1 %.tmp6301, label %.if.true.6302, label %.if.false.6302
.if.true.6302:
%.tmp6303 = load %m996$.Node.type*, %m996$.Node.type** %li.6253
%.tmp6304 = icmp ne %m996$.Node.type* %.tmp6303, null
br i1 %.tmp6304, label %.if.true.6305, label %.if.false.6305
.if.true.6305:
%.tmp6306 = load %m996$.Node.type*, %m996$.Node.type** %li.6253
store %m996$.Node.type* %.tmp6306, %m996$.Node.type** %stmt
br label %.if.end.6305
.if.false.6305:
br label %.if.end.6305
.if.end.6305:
%.tmp6307 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6308 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6310 = getelementptr [21 x i8], [21 x i8]*@.str6309, i32 0, i32 0
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp6307, %m996$.Node.type* %.tmp6308, i8* %.tmp6310)
br label %.if.end.6302
.if.false.6302:
%.tmp6311 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6312 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6311, i32 0, i32 1
%.tmp6313 = load %m0$.File.type*, %m0$.File.type** %.tmp6312
%.tmp6315 = getelementptr [10 x i8], [10 x i8]*@.str6314, i32 0, i32 0
%.tmp6316 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6313, i8* %.tmp6315)
br label %.if.end.6302
.if.end.6302:
ret void
}
define void @m311$compile_for_loop.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp6317 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6318 = call i32(%m2811$.CompilerCtx.type*) @m311$new_uid.i.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp6317)
%for_id.6319 = alloca i32
store i32 %.tmp6318, i32* %for_id.6319
%.tmp6320 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6321 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6320, i32 0, i32 8
%.tmp6322 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6321
%.tmp6323 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6322, i32 0, i32 9
%.tmp6324 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6323
%init_stmt.6325 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6324, %m996$.Node.type** %init_stmt.6325
%.tmp6326 = bitcast ptr null to i8*
%begin_lbl.6327 = alloca i8*
store i8* %.tmp6326, i8** %begin_lbl.6327
%.tmp6328 = bitcast ptr null to i8*
%end_lbl.6329 = alloca i8*
store i8* %.tmp6328, i8** %end_lbl.6329
%.tmp6330 = getelementptr i8*, i8** %begin_lbl.6327, i32 0
%.tmp6332 = getelementptr [14 x i8], [14 x i8]*@.str6331, i32 0, i32 0
%.tmp6333 = load i32, i32* %for_id.6319
%.tmp6334 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6330, i8* %.tmp6332, i32 %.tmp6333)
%.tmp6335 = getelementptr i8*, i8** %end_lbl.6329, i32 0
%.tmp6337 = getelementptr [12 x i8], [12 x i8]*@.str6336, i32 0, i32 0
%.tmp6338 = load i32, i32* %for_id.6319
%.tmp6339 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6335, i8* %.tmp6337, i32 %.tmp6338)
%.tmp6340 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6342 = getelementptr [4 x i8], [4 x i8]*@.str6341, i32 0, i32 0
%.tmp6343 = load i8*, i8** %begin_lbl.6327
%.tmp6344 = load i8*, i8** %end_lbl.6329
%.tmp6345 = bitcast ptr null to %m2811$.Type.type*
call void(%m2811$.CompilerCtx.type*,i8*,i8*,i8*,%m2811$.Type.type*) @m311$push_scope.v.m2811$.CompilerCtx.typep.cp.cp.cp.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6340, i8* %.tmp6342, i8* %.tmp6343, i8* %.tmp6344, %m2811$.Type.type* %.tmp6345)
%.tmp6346 = load %m996$.Node.type*, %m996$.Node.type** %init_stmt.6325
%.tmp6347 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6346, i32 0, i32 0
%.tmp6348 = load i8*, i8** %.tmp6347
%.tmp6350 = getelementptr [12 x i8], [12 x i8]*@.str6349, i32 0, i32 0
%.tmp6351 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6348, i8* %.tmp6350)
%.tmp6352 = icmp eq i32 %.tmp6351, 0
br i1 %.tmp6352, label %.if.true.6353, label %.if.false.6353
.if.true.6353:
%.tmp6354 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6355 = load %m996$.Node.type*, %m996$.Node.type** %init_stmt.6325
%.tmp6356 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_declaration.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp6354, %m996$.Node.type* %.tmp6355)
br label %.if.end.6353
.if.false.6353:
%.tmp6357 = load %m996$.Node.type*, %m996$.Node.type** %init_stmt.6325
%.tmp6358 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6357, i32 0, i32 0
%.tmp6359 = load i8*, i8** %.tmp6358
%.tmp6361 = getelementptr [11 x i8], [11 x i8]*@.str6360, i32 0, i32 0
%.tmp6362 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6359, i8* %.tmp6361)
%.tmp6363 = icmp eq i32 %.tmp6362, 0
br i1 %.tmp6363, label %.if.true.6364, label %.if.false.6364
.if.true.6364:
%.tmp6365 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6366 = load %m996$.Node.type*, %m996$.Node.type** %init_stmt.6325
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_expression.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp6365, %m996$.Node.type* %.tmp6366)
br label %.if.end.6364
.if.false.6364:
%.tmp6367 = load %m996$.Node.type*, %m996$.Node.type** %init_stmt.6325
%.tmp6368 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6367, i32 0, i32 0
%.tmp6369 = load i8*, i8** %.tmp6368
%.tmp6371 = getelementptr [9 x i8], [9 x i8]*@.str6370, i32 0, i32 0
%.tmp6372 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6369, i8* %.tmp6371)
%.tmp6373 = icmp eq i32 %.tmp6372, 0
br i1 %.tmp6373, label %.if.true.6374, label %.if.false.6374
.if.true.6374:
br label %.if.end.6374
.if.false.6374:
%.tmp6375 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6376 = load %m996$.Node.type*, %m996$.Node.type** %init_stmt.6325
%.tmp6378 = getelementptr [66 x i8], [66 x i8]*@.str6377, i32 0, i32 0
%.tmp6379 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp6375, %m996$.Node.type* %.tmp6376, i8* %.tmp6378)
%.tmp6380 = load %m996$.Node.type*, %m996$.Node.type** %init_stmt.6325
%.tmp6381 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6380, i32 0, i32 0
%.tmp6382 = load i8*, i8** %.tmp6381
%.tmp6383 = call i32(i8*,...) @printf(i8* %.tmp6379, i8* %.tmp6382)
%.tmp6384 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
call void(%m2811$.CompilerCtx.type*) @m311$pop_scope.v.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp6384)
ret void
br label %.if.end.6374
.if.end.6374:
br label %.if.end.6364
.if.end.6364:
br label %.if.end.6353
.if.end.6353:
%.tmp6385 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6386 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6385, i32 0, i32 1
%.tmp6387 = load %m0$.File.type*, %m0$.File.type** %.tmp6386
%.tmp6389 = getelementptr [26 x i8], [26 x i8]*@.str6388, i32 0, i32 0
%.tmp6390 = load i32, i32* %for_id.6319
%.tmp6391 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6387, i8* %.tmp6389, i32 %.tmp6390)
%.tmp6392 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6393 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6392, i32 0, i32 1
%.tmp6394 = load %m0$.File.type*, %m0$.File.type** %.tmp6393
%.tmp6396 = getelementptr [16 x i8], [16 x i8]*@.str6395, i32 0, i32 0
%.tmp6397 = load i32, i32* %for_id.6319
%.tmp6398 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6394, i8* %.tmp6396, i32 %.tmp6397)
%.tmp6399 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6400 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6399, i32 0, i32 8
%.tmp6401 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6400
%.tmp6403 = getelementptr [9 x i8], [9 x i8]*@.str6402, i32 0, i32 0
%.tmp6404 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6401, i8* %.tmp6403)
%fst_colon.6405 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6404, %m996$.Node.type** %fst_colon.6405
%.tmp6406 = load %m996$.Node.type*, %m996$.Node.type** %fst_colon.6405
%.tmp6407 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6406, i32 0, i32 9
%.tmp6408 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6407
%condition.6409 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6408, %m996$.Node.type** %condition.6409
%.tmp6410 = load %m996$.Node.type*, %m996$.Node.type** %condition.6409
%.tmp6411 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6410, i32 0, i32 0
%.tmp6412 = load i8*, i8** %.tmp6411
%.tmp6414 = getelementptr [9 x i8], [9 x i8]*@.str6413, i32 0, i32 0
%.tmp6415 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6412, i8* %.tmp6414)
%.tmp6416 = icmp eq i32 %.tmp6415, 0
br i1 %.tmp6416, label %.if.true.6417, label %.if.false.6417
.if.true.6417:
%.tmp6418 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6419 = load %m996$.Node.type*, %m996$.Node.type** %condition.6409
%.tmp6421 = getelementptr [39 x i8], [39 x i8]*@.str6420, i32 0, i32 0
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp6418, %m996$.Node.type* %.tmp6419, i8* %.tmp6421)
ret void
br label %.if.end.6417
.if.false.6417:
br label %.if.end.6417
.if.end.6417:
%.tmp6422 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6423 = load %m996$.Node.type*, %m996$.Node.type** %condition.6409
%.tmp6424 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp6422, %m996$.Node.type* %.tmp6423)
%condition_info.6425 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp6424, %m2811$.AssignableInfo.type** %condition_info.6425
%.tmp6426 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %condition_info.6425
%.tmp6427 = icmp eq %m2811$.AssignableInfo.type* %.tmp6426, null
br i1 %.tmp6427, label %.if.true.6428, label %.if.false.6428
.if.true.6428:
ret void
br label %.if.end.6428
.if.false.6428:
br label %.if.end.6428
.if.end.6428:
%.tmp6429 = load %m996$.Node.type*, %m996$.Node.type** %fst_colon.6405
%.tmp6430 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6429, i32 0, i32 9
%.tmp6431 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6430
%.tmp6433 = getelementptr [9 x i8], [9 x i8]*@.str6432, i32 0, i32 0
%.tmp6434 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6431, i8* %.tmp6433)
%snd_colon.6435 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6434, %m996$.Node.type** %snd_colon.6435
%.tmp6436 = load %m996$.Node.type*, %m996$.Node.type** %snd_colon.6435
%.tmp6438 = getelementptr [6 x i8], [6 x i8]*@.str6437, i32 0, i32 0
%.tmp6439 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6436, i8* %.tmp6438)
%for_body.6440 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6439, %m996$.Node.type** %for_body.6440
%.tmp6441 = load %m996$.Node.type*, %m996$.Node.type** %for_body.6440
%.tmp6443 = getelementptr [11 x i8], [11 x i8]*@.str6442, i32 0, i32 0
%.tmp6444 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6441, i8* %.tmp6443)
%else_block.6445 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6444, %m996$.Node.type** %else_block.6445
%.tmp6446 = load i8*, i8** %end_lbl.6329
%on_end.6447 = alloca i8*
store i8* %.tmp6446, i8** %on_end.6447
%.tmp6448 = load %m996$.Node.type*, %m996$.Node.type** %else_block.6445
%.tmp6449 = icmp ne %m996$.Node.type* %.tmp6448, null
br i1 %.tmp6449, label %.if.true.6450, label %.if.false.6450
.if.true.6450:
%.tmp6451 = getelementptr i8*, i8** %on_end.6447, i32 0
%.tmp6453 = getelementptr [13 x i8], [13 x i8]*@.str6452, i32 0, i32 0
%.tmp6454 = load i32, i32* %for_id.6319
%.tmp6455 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6451, i8* %.tmp6453, i32 %.tmp6454)
br label %.if.end.6450
.if.false.6450:
br label %.if.end.6450
.if.end.6450:
%.tmp6456 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6457 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6456, i32 0, i32 1
%.tmp6458 = load %m0$.File.type*, %m0$.File.type** %.tmp6457
%.tmp6460 = getelementptr [48 x i8], [48 x i8]*@.str6459, i32 0, i32 0
%.tmp6461 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6462 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %condition_info.6425
%.tmp6463 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6462, i32 0, i32 4
%.tmp6464 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6463
%.tmp6465 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6461, %m2811$.Type.type* %.tmp6464)
%.tmp6466 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %condition_info.6425
%.tmp6467 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp6466)
%.tmp6468 = load i32, i32* %for_id.6319
%.tmp6469 = load i8*, i8** %on_end.6447
%.tmp6470 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6458, i8* %.tmp6460, i8* %.tmp6465, i8* %.tmp6467, i32 %.tmp6468, i8* %.tmp6469)
%.tmp6471 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6472 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6471, i32 0, i32 1
%.tmp6473 = load %m0$.File.type*, %m0$.File.type** %.tmp6472
%.tmp6475 = getelementptr [19 x i8], [19 x i8]*@.str6474, i32 0, i32 0
%.tmp6476 = load i32, i32* %for_id.6319
%.tmp6477 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6473, i8* %.tmp6475, i32 %.tmp6476)
%.tmp6478 = load %m996$.Node.type*, %m996$.Node.type** %snd_colon.6435
%.tmp6479 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6478, i32 0, i32 9
%.tmp6480 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6479
%increment.6481 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6480, %m996$.Node.type** %increment.6481
%.tmp6482 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6483 = load %m996$.Node.type*, %m996$.Node.type** %for_body.6440
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_block.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp6482, %m996$.Node.type* %.tmp6483)
%.tmp6484 = load %m996$.Node.type*, %m996$.Node.type** %increment.6481
%.tmp6485 = load %m996$.Node.type*, %m996$.Node.type** %for_body.6440
%.tmp6486 = icmp ne %m996$.Node.type* %.tmp6484, %.tmp6485
br i1 %.tmp6486, label %.if.true.6487, label %.if.false.6487
.if.true.6487:
%.tmp6488 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6489 = load %m996$.Node.type*, %m996$.Node.type** %increment.6481
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_expression.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp6488, %m996$.Node.type* %.tmp6489)
br label %.if.end.6487
.if.false.6487:
br label %.if.end.6487
.if.end.6487:
%.tmp6490 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6491 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6490, i32 0, i32 1
%.tmp6492 = load %m0$.File.type*, %m0$.File.type** %.tmp6491
%.tmp6494 = getelementptr [15 x i8], [15 x i8]*@.str6493, i32 0, i32 0
%.tmp6495 = load i8*, i8** %begin_lbl.6327
%.tmp6496 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6492, i8* %.tmp6494, i8* %.tmp6495)
%.tmp6497 = load %m996$.Node.type*, %m996$.Node.type** %else_block.6445
%.tmp6498 = icmp ne %m996$.Node.type* %.tmp6497, null
br i1 %.tmp6498, label %.if.true.6499, label %.if.false.6499
.if.true.6499:
%.tmp6500 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6501 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6500, i32 0, i32 1
%.tmp6502 = load %m0$.File.type*, %m0$.File.type** %.tmp6501
%.tmp6504 = getelementptr [15 x i8], [15 x i8]*@.str6503, i32 0, i32 0
%.tmp6505 = load i32, i32* %for_id.6319
%.tmp6506 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6502, i8* %.tmp6504, i32 %.tmp6505)
%.tmp6507 = load %m996$.Node.type*, %m996$.Node.type** %else_block.6445
%.tmp6508 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6507, i32 0, i32 8
%.tmp6509 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6508
%.tmp6511 = getelementptr [6 x i8], [6 x i8]*@.str6510, i32 0, i32 0
%.tmp6512 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6509, i8* %.tmp6511)
%block.6513 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6512, %m996$.Node.type** %block.6513
%.tmp6514 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6515 = load %m996$.Node.type*, %m996$.Node.type** %block.6513
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_block.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp6514, %m996$.Node.type* %.tmp6515)
%.tmp6516 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6517 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6516, i32 0, i32 1
%.tmp6518 = load %m0$.File.type*, %m0$.File.type** %.tmp6517
%.tmp6520 = getelementptr [15 x i8], [15 x i8]*@.str6519, i32 0, i32 0
%.tmp6521 = load i8*, i8** %end_lbl.6329
%.tmp6522 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6518, i8* %.tmp6520, i8* %.tmp6521)
br label %.if.end.6499
.if.false.6499:
br label %.if.end.6499
.if.end.6499:
%.tmp6523 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6524 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6523, i32 0, i32 1
%.tmp6525 = load %m0$.File.type*, %m0$.File.type** %.tmp6524
%.tmp6527 = getelementptr [5 x i8], [5 x i8]*@.str6526, i32 0, i32 0
%.tmp6528 = load i8*, i8** %end_lbl.6329
%.tmp6529 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6525, i8* %.tmp6527, i8* %.tmp6528)
%.tmp6530 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
call void(%m2811$.CompilerCtx.type*) @m311$pop_scope.v.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp6530)
ret void
}
define %m2811$.AssignableInfo.type* @m311$compile_declaration.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp6531 = bitcast ptr null to %m2811$.Type.type*
%decl_type.6532 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp6531, %m2811$.Type.type** %decl_type.6532
%.tmp6533 = bitcast ptr null to %m2811$.AssignableInfo.type*
%a_info.6534 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp6533, %m2811$.AssignableInfo.type** %a_info.6534
%.tmp6535 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6536 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6535, i32 0, i32 8
%.tmp6537 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6536
%.tmp6538 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6537, i32 0, i32 0
%.tmp6539 = load i8*, i8** %.tmp6538
%.tmp6541 = getelementptr [5 x i8], [5 x i8]*@.str6540, i32 0, i32 0
%.tmp6542 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6539, i8* %.tmp6541)
%.tmp6543 = icmp eq i32 %.tmp6542, 0
br i1 %.tmp6543, label %.if.true.6544, label %.if.false.6544
.if.true.6544:
%.tmp6545 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6546 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6547 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6546, i32 0, i32 8
%.tmp6548 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6547
%.tmp6549 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6548, i32 0, i32 8
%.tmp6550 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6549
%.tmp6551 = call %m2811$.Type.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp6545, %m996$.Node.type* %.tmp6550)
store %m2811$.Type.type* %.tmp6551, %m2811$.Type.type** %decl_type.6532
br label %.if.end.6544
.if.false.6544:
br label %.if.end.6544
.if.end.6544:
%.tmp6552 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6553 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6552, i32 0, i32 8
%.tmp6554 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6553
%.tmp6556 = getelementptr [11 x i8], [11 x i8]*@.str6555, i32 0, i32 0
%.tmp6557 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6554, i8* %.tmp6556)
%assignable.6558 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6557, %m996$.Node.type** %assignable.6558
%.tmp6559 = load %m996$.Node.type*, %m996$.Node.type** %assignable.6558
%.tmp6560 = icmp ne %m996$.Node.type* %.tmp6559, null
br i1 %.tmp6560, label %.if.true.6561, label %.if.false.6561
.if.true.6561:
%.tmp6562 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6563 = load %m996$.Node.type*, %m996$.Node.type** %assignable.6558
%.tmp6564 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp6562, %m996$.Node.type* %.tmp6563)
store %m2811$.AssignableInfo.type* %.tmp6564, %m2811$.AssignableInfo.type** %a_info.6534
br label %.if.end.6561
.if.false.6561:
br label %.if.end.6561
.if.end.6561:
%.tmp6565 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6566 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp6565)
%info.6567 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp6566, %m2811$.AssignableInfo.type** %info.6567
%.tmp6568 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6567
%.tmp6569 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6568, i32 0, i32 3
%.tmp6571 = getelementptr [9 x i8], [9 x i8]*@.str6570, i32 0, i32 0
store i8* %.tmp6571, i8** %.tmp6569
%.tmp6572 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6573 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6572, i32 0, i32 8
%.tmp6574 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6573
%.tmp6576 = getelementptr [5 x i8], [5 x i8]*@.str6575, i32 0, i32 0
%.tmp6577 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6574, i8* %.tmp6576)
%var_name.6578 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6577, %m996$.Node.type** %var_name.6578
%.tmp6579 = load %m996$.Node.type*, %m996$.Node.type** %var_name.6578
%.tmp6580 = icmp eq %m996$.Node.type* %.tmp6579, null
br i1 %.tmp6580, label %.if.true.6581, label %.if.false.6581
.if.true.6581:
%.tmp6582 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6583 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6585 = getelementptr [31 x i8], [31 x i8]*@.str6584, i32 0, i32 0
%.tmp6586 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp6582, %m996$.Node.type* %.tmp6583, i8* %.tmp6585)
%.tmp6587 = call i32(i8*,...) @printf(i8* %.tmp6586)
%.tmp6588 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp6588
br label %.if.end.6581
.if.false.6581:
br label %.if.end.6581
.if.end.6581:
%.tmp6589 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6590 = call %m2811$.ModuleLookup.type*(%m2811$.CompilerCtx.type*) @m311$get_current_module.m2811$.ModuleLookup.typep.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp6589)
%mod.6591 = alloca %m2811$.ModuleLookup.type*
store %m2811$.ModuleLookup.type* %.tmp6590, %m2811$.ModuleLookup.type** %mod.6591
%.tmp6592 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6593 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.6591
%.tmp6594 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp6593, i32 0, i32 3
%.tmp6595 = load %m2811$.Scope.type*, %m2811$.Scope.type** %.tmp6594
%.tmp6596 = load %m996$.Node.type*, %m996$.Node.type** %var_name.6578
%.tmp6597 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6596, i32 0, i32 1
%.tmp6598 = load i8*, i8** %.tmp6597
%.tmp6599 = call %m2811$.ScopeItem.type*(%m2811$.CompilerCtx.type*,%m2811$.Scope.type*,i8*) @m311$find_defined_here.m2811$.ScopeItem.typep.m2811$.CompilerCtx.typep.m2811$.Scope.typep.cp(%m2811$.CompilerCtx.type* %.tmp6592, %m2811$.Scope.type* %.tmp6595, i8* %.tmp6598)
%.tmp6600 = icmp ne %m2811$.ScopeItem.type* %.tmp6599, null
br i1 %.tmp6600, label %.if.true.6601, label %.if.false.6601
.if.true.6601:
%.tmp6603 = getelementptr [1 x i8], [1 x i8]*@.str6602, i32 0, i32 0
%err_buf.6604 = alloca i8*
store i8* %.tmp6603, i8** %err_buf.6604
%.tmp6605 = getelementptr i8*, i8** %err_buf.6604, i32 0
%.tmp6607 = getelementptr [43 x i8], [43 x i8]*@.str6606, i32 0, i32 0
%.tmp6608 = load %m996$.Node.type*, %m996$.Node.type** %var_name.6578
%.tmp6609 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6608, i32 0, i32 1
%.tmp6610 = load i8*, i8** %.tmp6609
%.tmp6611 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6605, i8* %.tmp6607, i8* %.tmp6610)
%.tmp6612 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6613 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6614 = load i8*, i8** %err_buf.6604
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp6612, %m996$.Node.type* %.tmp6613, i8* %.tmp6614)
%.tmp6615 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp6615
br label %.if.end.6601
.if.false.6601:
br label %.if.end.6601
.if.end.6601:
%.tmp6617 = getelementptr [1 x i8], [1 x i8]*@.str6616, i32 0, i32 0
%var_id.6618 = alloca i8*
store i8* %.tmp6617, i8** %var_id.6618
%.tmp6619 = getelementptr i8*, i8** %var_id.6618, i32 0
%.tmp6621 = getelementptr [6 x i8], [6 x i8]*@.str6620, i32 0, i32 0
%.tmp6622 = load %m996$.Node.type*, %m996$.Node.type** %var_name.6578
%.tmp6623 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6622, i32 0, i32 1
%.tmp6624 = load i8*, i8** %.tmp6623
%.tmp6625 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6626 = call i32(%m2811$.CompilerCtx.type*) @m311$new_uid.i.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp6625)
%.tmp6627 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6619, i8* %.tmp6621, i8* %.tmp6624, i32 %.tmp6626)
%.tmp6628 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6567
%.tmp6629 = load i8, i8* @SCOPE_LOCAL
%.tmp6630 = load i8*, i8** %var_id.6618
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp6628, i8 %.tmp6629, i8* %.tmp6630)
%.tmp6631 = load %m2811$.Type.type*, %m2811$.Type.type** %decl_type.6532
%.tmp6632 = icmp ne %m2811$.Type.type* %.tmp6631, null
br i1 %.tmp6632, label %.if.true.6633, label %.if.false.6633
.if.true.6633:
%.tmp6634 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6567
%.tmp6635 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6634, i32 0, i32 4
%.tmp6636 = load %m2811$.Type.type*, %m2811$.Type.type** %decl_type.6532
store %m2811$.Type.type* %.tmp6636, %m2811$.Type.type** %.tmp6635
br label %.if.end.6633
.if.false.6633:
%.tmp6637 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.6534
%.tmp6638 = icmp ne %m2811$.AssignableInfo.type* %.tmp6637, null
br i1 %.tmp6638, label %.if.true.6639, label %.if.false.6639
.if.true.6639:
%.tmp6640 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6567
%.tmp6641 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6640, i32 0, i32 4
%.tmp6642 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.6534
%.tmp6643 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6642, i32 0, i32 4
%.tmp6644 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6643
store %m2811$.Type.type* %.tmp6644, %m2811$.Type.type** %.tmp6641
br label %.if.end.6639
.if.false.6639:
br label %.if.end.6639
.if.end.6639:
br label %.if.end.6633
.if.end.6633:
%.tmp6645 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6646 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6567
%.tmp6647 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6646, i32 0, i32 4
%.tmp6648 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6647
%.tmp6649 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6645, %m2811$.Type.type* %.tmp6648)
%var_type_repr.6650 = alloca i8*
store i8* %.tmp6649, i8** %var_type_repr.6650
%.tmp6651 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.6534
%.tmp6652 = icmp ne %m2811$.AssignableInfo.type* %.tmp6651, null
br i1 %.tmp6652, label %.if.true.6653, label %.if.false.6653
.if.true.6653:
%.tmp6654 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6655 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.6534
%.tmp6656 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6655, i32 0, i32 4
%.tmp6657 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6656
%.tmp6658 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6654, %m2811$.Type.type* %.tmp6657)
%a_type_repr.6659 = alloca i8*
store i8* %.tmp6658, i8** %a_type_repr.6659
%.tmp6660 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6661 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.6534
%.tmp6662 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6661, i32 0, i32 4
%.tmp6663 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6662
%.tmp6664 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6567
%.tmp6665 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6664, i32 0, i32 4
%.tmp6666 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6665
%.tmp6667 = call i1(%m2811$.CompilerCtx.type*,%m2811$.Type.type*,%m2811$.Type.type*) @m2812$cmp.b.m2811$.CompilerCtx.typep.m2811$.Type.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6660, %m2811$.Type.type* %.tmp6663, %m2811$.Type.type* %.tmp6666)
%.tmp6668 = icmp eq i1 %.tmp6667, 0
br i1 %.tmp6668, label %.if.true.6669, label %.if.false.6669
.if.true.6669:
%.tmp6671 = getelementptr [1 x i8], [1 x i8]*@.str6670, i32 0, i32 0
%err_msg.6672 = alloca i8*
store i8* %.tmp6671, i8** %err_msg.6672
%.tmp6673 = getelementptr i8*, i8** %err_msg.6672, i32 0
%.tmp6675 = getelementptr [49 x i8], [49 x i8]*@.str6674, i32 0, i32 0
%.tmp6676 = load i8*, i8** %a_type_repr.6659
%.tmp6677 = load i8*, i8** %var_type_repr.6650
%.tmp6678 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6673, i8* %.tmp6675, i8* %.tmp6676, i8* %.tmp6677)
%.tmp6679 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6680 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6681 = load i8*, i8** %err_msg.6672
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp6679, %m996$.Node.type* %.tmp6680, i8* %.tmp6681)
br label %.if.end.6669
.if.false.6669:
br label %.if.end.6669
.if.end.6669:
br label %.if.end.6653
.if.false.6653:
br label %.if.end.6653
.if.end.6653:
%.tmp6682 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6683 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6684 = load %m996$.Node.type*, %m996$.Node.type** %var_name.6578
%.tmp6685 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6684, i32 0, i32 1
%.tmp6686 = load i8*, i8** %.tmp6685
%.tmp6687 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6567
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2811$.AssignableInfo.type*) @m311$define_assignable.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp6682, %m996$.Node.type* %.tmp6683, i8* %.tmp6686, %m2811$.AssignableInfo.type* %.tmp6687)
%.tmp6688 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6689 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6688, i32 0, i32 1
%.tmp6690 = load %m0$.File.type*, %m0$.File.type** %.tmp6689
%.tmp6692 = getelementptr [16 x i8], [16 x i8]*@.str6691, i32 0, i32 0
%.tmp6693 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6567
%.tmp6694 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp6693)
%.tmp6695 = load i8*, i8** %var_type_repr.6650
%.tmp6696 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6690, i8* %.tmp6692, i8* %.tmp6694, i8* %.tmp6695)
%.tmp6697 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.6534
%.tmp6698 = icmp ne %m2811$.AssignableInfo.type* %.tmp6697, null
br i1 %.tmp6698, label %.if.true.6699, label %.if.false.6699
.if.true.6699:
%.tmp6700 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6701 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6700, i32 0, i32 1
%.tmp6702 = load %m0$.File.type*, %m0$.File.type** %.tmp6701
%.tmp6704 = getelementptr [21 x i8], [21 x i8]*@.str6703, i32 0, i32 0
%.tmp6705 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6706 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.6534
%.tmp6707 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6706, i32 0, i32 4
%.tmp6708 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6707
%.tmp6709 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6705, %m2811$.Type.type* %.tmp6708)
%.tmp6710 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.6534
%.tmp6711 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp6710)
%.tmp6712 = load i8*, i8** %var_type_repr.6650
%.tmp6713 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6567
%.tmp6714 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp6713)
%.tmp6715 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6702, i8* %.tmp6704, i8* %.tmp6709, i8* %.tmp6711, i8* %.tmp6712, i8* %.tmp6714)
br label %.if.end.6699
.if.false.6699:
%.tmp6716 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6717 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6718 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6567
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,%m2811$.AssignableInfo.type*) @m311$compile_zero_value.v.m2811$.CompilerCtx.typep.m996$.Node.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp6716, %m996$.Node.type* %.tmp6717, %m2811$.AssignableInfo.type* %.tmp6718)
br label %.if.end.6699
.if.end.6699:
%.tmp6719 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.6567
ret %m2811$.AssignableInfo.type* %.tmp6719
}
define void @m311$compile_zero_value.v.m2811$.CompilerCtx.typep.m996$.Node.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, %m2811$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%info = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.info.arg, %m2811$.AssignableInfo.type** %info
%.tmp6720 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp6721 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6720, i32 0, i32 4
%.tmp6722 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6721
%.tmp6723 = icmp eq %m2811$.Type.type* %.tmp6722, null
br i1 %.tmp6723, label %.if.true.6724, label %.if.false.6724
.if.true.6724:
ret void
br label %.if.end.6724
.if.false.6724:
br label %.if.end.6724
.if.end.6724:
%.tmp6725 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6726 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp6727 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6726, i32 0, i32 4
%.tmp6728 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6727
%.tmp6729 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6725, %m2811$.Type.type* %.tmp6728)
%t_repr.6730 = alloca i8*
store i8* %.tmp6729, i8** %t_repr.6730
%.tmp6731 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp6732 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp6731)
%id.6733 = alloca i8*
store i8* %.tmp6732, i8** %id.6733
%field_id.6734 = alloca i32
store i32 0, i32* %field_id.6734
%field.6735 = alloca %m2811$.Type.type*
store %m2811$.Type.type* null, %m2811$.Type.type** %field.6735
%field_info.6736 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* null, %m2811$.AssignableInfo.type** %field_info.6736
%.tmp6737 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp6738 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6737, i32 0, i32 4
%.tmp6739 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6738
%t.6740 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp6739, %m2811$.Type.type** %t.6740
%.tmp6741 = load %m2811$.Type.type*, %m2811$.Type.type** %t.6740
%.tmp6742 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6741, i32 0, i32 0
%.tmp6743 = load i8*, i8** %.tmp6742
%.tmp6745 = getelementptr [4 x i8], [4 x i8]*@.str6744, i32 0, i32 0
%.tmp6746 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6743, i8* %.tmp6745)
%.tmp6747 = icmp eq i32 %.tmp6746, 0
%.tmp6748 = load %m2811$.Type.type*, %m2811$.Type.type** %t.6740
%.tmp6749 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6748, i32 0, i32 0
%.tmp6750 = load i8*, i8** %.tmp6749
%.tmp6752 = getelementptr [4 x i8], [4 x i8]*@.str6751, i32 0, i32 0
%.tmp6753 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6750, i8* %.tmp6752)
%.tmp6754 = icmp eq i32 %.tmp6753, 0
%.tmp6755 = or i1 %.tmp6747, %.tmp6754
%.tmp6756 = load %m2811$.Type.type*, %m2811$.Type.type** %t.6740
%.tmp6757 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6756, i32 0, i32 0
%.tmp6758 = load i8*, i8** %.tmp6757
%.tmp6760 = getelementptr [5 x i8], [5 x i8]*@.str6759, i32 0, i32 0
%.tmp6761 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6758, i8* %.tmp6760)
%.tmp6762 = icmp eq i32 %.tmp6761, 0
%.tmp6763 = or i1 %.tmp6755, %.tmp6762
br i1 %.tmp6763, label %.if.true.6764, label %.if.false.6764
.if.true.6764:
%.tmp6765 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6766 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6765, i32 0, i32 1
%.tmp6767 = load %m0$.File.type*, %m0$.File.type** %.tmp6766
%.tmp6769 = getelementptr [21 x i8], [21 x i8]*@.str6768, i32 0, i32 0
%.tmp6770 = load i8*, i8** %t_repr.6730
%.tmp6771 = load i8*, i8** %t_repr.6730
%.tmp6772 = load i8*, i8** %id.6733
%.tmp6773 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6767, i8* %.tmp6769, i8* %.tmp6770, i32 0, i8* %.tmp6771, i8* %.tmp6772)
br label %.if.end.6764
.if.false.6764:
%.tmp6774 = load %m2811$.Type.type*, %m2811$.Type.type** %t.6740
%.tmp6775 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6774, i32 0, i32 0
%.tmp6776 = load i8*, i8** %.tmp6775
%.tmp6778 = getelementptr [4 x i8], [4 x i8]*@.str6777, i32 0, i32 0
%.tmp6779 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6776, i8* %.tmp6778)
%.tmp6780 = icmp eq i32 %.tmp6779, 0
br i1 %.tmp6780, label %.if.true.6781, label %.if.false.6781
.if.true.6781:
%.tmp6782 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6783 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6782, i32 0, i32 1
%.tmp6784 = load %m0$.File.type*, %m0$.File.type** %.tmp6783
%.tmp6786 = getelementptr [21 x i8], [21 x i8]*@.str6785, i32 0, i32 0
%.tmp6787 = load i8*, i8** %t_repr.6730
%.tmp6789 = getelementptr [5 x i8], [5 x i8]*@.str6788, i32 0, i32 0
%.tmp6790 = load i8*, i8** %t_repr.6730
%.tmp6791 = load i8*, i8** %id.6733
%.tmp6792 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6784, i8* %.tmp6786, i8* %.tmp6787, i8* %.tmp6789, i8* %.tmp6790, i8* %.tmp6791)
br label %.if.end.6781
.if.false.6781:
%.tmp6793 = load %m2811$.Type.type*, %m2811$.Type.type** %t.6740
%.tmp6794 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6793, i32 0, i32 0
%.tmp6795 = load i8*, i8** %.tmp6794
%.tmp6797 = getelementptr [7 x i8], [7 x i8]*@.str6796, i32 0, i32 0
%.tmp6798 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6795, i8* %.tmp6797)
%.tmp6799 = icmp eq i32 %.tmp6798, 0
br i1 %.tmp6799, label %.if.true.6800, label %.if.false.6800
.if.true.6800:
%.tmp6802 = load %m2811$.Type.type*, %m2811$.Type.type** %t.6740
%.tmp6803 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6802, i32 0, i32 3
%.tmp6804 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6803
store %m2811$.Type.type* %.tmp6804, %m2811$.Type.type** %field.6735
br label %.for.start.6801
.for.start.6801:
%.tmp6805 = load %m2811$.Type.type*, %m2811$.Type.type** %field.6735
%.tmp6806 = icmp ne %m2811$.Type.type* %.tmp6805, null
br i1 %.tmp6806, label %.for.continue.6801, label %.for.end.6801
.for.continue.6801:
%.tmp6807 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6808 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp6807)
store %m2811$.AssignableInfo.type* %.tmp6808, %m2811$.AssignableInfo.type** %field_info.6736
%.tmp6809 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6810 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %field_info.6736
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp6809, %m2811$.AssignableInfo.type* %.tmp6810)
%.tmp6811 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %field_info.6736
%.tmp6812 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6811, i32 0, i32 4
%.tmp6813 = load %m2811$.Type.type*, %m2811$.Type.type** %field.6735
store %m2811$.Type.type* %.tmp6813, %m2811$.Type.type** %.tmp6812
%.tmp6814 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6815 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6814, i32 0, i32 1
%.tmp6816 = load %m0$.File.type*, %m0$.File.type** %.tmp6815
%.tmp6818 = getelementptr [46 x i8], [46 x i8]*@.str6817, i32 0, i32 0
%.tmp6819 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %field_info.6736
%.tmp6820 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp6819)
%.tmp6821 = load i8*, i8** %t_repr.6730
%.tmp6822 = load i8*, i8** %t_repr.6730
%.tmp6823 = load i8*, i8** %id.6733
%.tmp6824 = load i32, i32* %field_id.6734
%.tmp6825 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6816, i8* %.tmp6818, i8* %.tmp6820, i8* %.tmp6821, i8* %.tmp6822, i8* %.tmp6823, i32 %.tmp6824)
%.tmp6826 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6827 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6828 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %field_info.6736
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,%m2811$.AssignableInfo.type*) @m311$compile_zero_value.v.m2811$.CompilerCtx.typep.m996$.Node.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp6826, %m996$.Node.type* %.tmp6827, %m2811$.AssignableInfo.type* %.tmp6828)
%.tmp6829 = load i32, i32* %field_id.6734
%.tmp6830 = add i32 %.tmp6829, 1
store i32 %.tmp6830, i32* %field_id.6734
%.tmp6831 = load %m2811$.Type.type*, %m2811$.Type.type** %field.6735
%.tmp6832 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6831, i32 0, i32 4
%.tmp6833 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6832
store %m2811$.Type.type* %.tmp6833, %m2811$.Type.type** %field.6735
br label %.for.start.6801
.for.end.6801:
br label %.if.end.6800
.if.false.6800:
%.tmp6834 = load %m2811$.Type.type*, %m2811$.Type.type** %t.6740
%.tmp6835 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6834, i32 0, i32 0
%.tmp6836 = load i8*, i8** %.tmp6835
%.tmp6838 = getelementptr [10 x i8], [10 x i8]*@.str6837, i32 0, i32 0
%.tmp6839 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6836, i8* %.tmp6838)
%.tmp6840 = icmp eq i32 %.tmp6839, 0
br i1 %.tmp6840, label %.if.true.6841, label %.if.false.6841
.if.true.6841:
%.tmp6843 = load %m2811$.Type.type*, %m2811$.Type.type** %t.6740
%.tmp6844 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6843, i32 0, i32 3
%.tmp6845 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6844
%.tmp6846 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6845, i32 0, i32 3
%.tmp6847 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6846
store %m2811$.Type.type* %.tmp6847, %m2811$.Type.type** %field.6735
br label %.for.start.6842
.for.start.6842:
%.tmp6848 = load %m2811$.Type.type*, %m2811$.Type.type** %field.6735
%.tmp6849 = icmp ne %m2811$.Type.type* %.tmp6848, null
br i1 %.tmp6849, label %.for.continue.6842, label %.for.end.6842
.for.continue.6842:
%.tmp6850 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6851 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp6850)
store %m2811$.AssignableInfo.type* %.tmp6851, %m2811$.AssignableInfo.type** %field_info.6736
%.tmp6852 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6853 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %field_info.6736
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp6852, %m2811$.AssignableInfo.type* %.tmp6853)
%.tmp6854 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %field_info.6736
%.tmp6855 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6854, i32 0, i32 4
%.tmp6856 = load %m2811$.Type.type*, %m2811$.Type.type** %field.6735
store %m2811$.Type.type* %.tmp6856, %m2811$.Type.type** %.tmp6855
%.tmp6857 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6858 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6857, i32 0, i32 1
%.tmp6859 = load %m0$.File.type*, %m0$.File.type** %.tmp6858
%.tmp6861 = getelementptr [46 x i8], [46 x i8]*@.str6860, i32 0, i32 0
%.tmp6862 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %field_info.6736
%.tmp6863 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp6862)
%.tmp6864 = load i8*, i8** %t_repr.6730
%.tmp6865 = load i8*, i8** %t_repr.6730
%.tmp6866 = load i8*, i8** %id.6733
%.tmp6867 = load i32, i32* %field_id.6734
%.tmp6868 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6859, i8* %.tmp6861, i8* %.tmp6863, i8* %.tmp6864, i8* %.tmp6865, i8* %.tmp6866, i32 %.tmp6867)
%.tmp6869 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6870 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6871 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %field_info.6736
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,%m2811$.AssignableInfo.type*) @m311$compile_zero_value.v.m2811$.CompilerCtx.typep.m996$.Node.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp6869, %m996$.Node.type* %.tmp6870, %m2811$.AssignableInfo.type* %.tmp6871)
%.tmp6872 = load i32, i32* %field_id.6734
%.tmp6873 = add i32 %.tmp6872, 1
store i32 %.tmp6873, i32* %field_id.6734
%.tmp6874 = load %m2811$.Type.type*, %m2811$.Type.type** %field.6735
%.tmp6875 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6874, i32 0, i32 4
%.tmp6876 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6875
store %m2811$.Type.type* %.tmp6876, %m2811$.Type.type** %field.6735
br label %.for.start.6842
.for.end.6842:
br label %.if.end.6841
.if.false.6841:
%.tmp6877 = load %m2811$.Type.type*, %m2811$.Type.type** %t.6740
%.tmp6878 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6877, i32 0, i32 0
%.tmp6879 = load i8*, i8** %.tmp6878
%.tmp6881 = getelementptr [6 x i8], [6 x i8]*@.str6880, i32 0, i32 0
%.tmp6882 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6879, i8* %.tmp6881)
%.tmp6883 = icmp eq i32 %.tmp6882, 0
br i1 %.tmp6883, label %.if.true.6884, label %.if.false.6884
.if.true.6884:
ret void
br label %.if.end.6884
.if.false.6884:
%.tmp6885 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6886 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6888 = getelementptr [44 x i8], [44 x i8]*@.str6887, i32 0, i32 0
%.tmp6889 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp6885, %m996$.Node.type* %.tmp6886, i8* %.tmp6888)
%.tmp6890 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp6891 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6890, i32 0, i32 4
%.tmp6892 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6891
%.tmp6893 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp6892, i32 0, i32 0
%.tmp6894 = load i8*, i8** %.tmp6893
%.tmp6895 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6896 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp6897 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6896, i32 0, i32 4
%.tmp6898 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6897
%.tmp6899 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6895, %m2811$.Type.type* %.tmp6898)
%.tmp6900 = call i32(i8*,...) @printf(i8* %.tmp6889, i8* %.tmp6894, i8* %.tmp6899)
ret void
br label %.if.end.6884
.if.end.6884:
br label %.if.end.6841
.if.end.6841:
br label %.if.end.6800
.if.end.6800:
br label %.if.end.6781
.if.end.6781:
br label %.if.end.6764
.if.end.6764:
ret void
}
define void @m311$compile_if_block.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp6901 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6902 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6901, i32 0, i32 8
%.tmp6903 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6902
%.tmp6905 = getelementptr [11 x i8], [11 x i8]*@.str6904, i32 0, i32 0
%.tmp6906 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6903, i8* %.tmp6905)
%assignable.6907 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6906, %m996$.Node.type** %assignable.6907
%.tmp6908 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6909 = load %m996$.Node.type*, %m996$.Node.type** %assignable.6907
%.tmp6910 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp6908, %m996$.Node.type* %.tmp6909)
%a_info.6911 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp6910, %m2811$.AssignableInfo.type** %a_info.6911
%.tmp6912 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.6911
%.tmp6913 = icmp eq %m2811$.AssignableInfo.type* %.tmp6912, null
br i1 %.tmp6913, label %.if.true.6914, label %.if.false.6914
.if.true.6914:
ret void
br label %.if.end.6914
.if.false.6914:
br label %.if.end.6914
.if.end.6914:
%.tmp6915 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6916 = call i32(%m2811$.CompilerCtx.type*) @m311$new_uid.i.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp6915)
%if_id.6917 = alloca i32
store i32 %.tmp6916, i32* %if_id.6917
%.tmp6918 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6919 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6918, i32 0, i32 1
%.tmp6920 = load %m0$.File.type*, %m0$.File.type** %.tmp6919
%.tmp6922 = getelementptr [53 x i8], [53 x i8]*@.str6921, i32 0, i32 0
%.tmp6923 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6924 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.6911
%.tmp6925 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp6924, i32 0, i32 4
%.tmp6926 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp6925
%.tmp6927 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp6923, %m2811$.Type.type* %.tmp6926)
%.tmp6928 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %a_info.6911
%.tmp6929 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp6928)
%.tmp6930 = load i32, i32* %if_id.6917
%.tmp6931 = load i32, i32* %if_id.6917
%.tmp6932 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6920, i8* %.tmp6922, i8* %.tmp6927, i8* %.tmp6929, i32 %.tmp6930, i32 %.tmp6931)
%.tmp6933 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6934 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6933, i32 0, i32 1
%.tmp6935 = load %m0$.File.type*, %m0$.File.type** %.tmp6934
%.tmp6937 = getelementptr [14 x i8], [14 x i8]*@.str6936, i32 0, i32 0
%.tmp6938 = load i32, i32* %if_id.6917
%.tmp6939 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6935, i8* %.tmp6937, i32 %.tmp6938)
%.tmp6940 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6941 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6940, i32 0, i32 8
%.tmp6942 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6941
%.tmp6944 = getelementptr [6 x i8], [6 x i8]*@.str6943, i32 0, i32 0
%.tmp6945 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6942, i8* %.tmp6944)
%block.6946 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6945, %m996$.Node.type** %block.6946
%.tmp6947 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6948 = load %m996$.Node.type*, %m996$.Node.type** %block.6946
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_block.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp6947, %m996$.Node.type* %.tmp6948)
%.tmp6949 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6950 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6949, i32 0, i32 1
%.tmp6951 = load %m0$.File.type*, %m0$.File.type** %.tmp6950
%.tmp6953 = getelementptr [23 x i8], [23 x i8]*@.str6952, i32 0, i32 0
%.tmp6954 = load i32, i32* %if_id.6917
%.tmp6955 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6951, i8* %.tmp6953, i32 %.tmp6954)
%.tmp6956 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6957 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6956, i32 0, i32 1
%.tmp6958 = load %m0$.File.type*, %m0$.File.type** %.tmp6957
%.tmp6960 = getelementptr [15 x i8], [15 x i8]*@.str6959, i32 0, i32 0
%.tmp6961 = load i32, i32* %if_id.6917
%.tmp6962 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6958, i8* %.tmp6960, i32 %.tmp6961)
%.tmp6963 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp6964 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6963, i32 0, i32 8
%.tmp6965 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6964
%.tmp6967 = getelementptr [11 x i8], [11 x i8]*@.str6966, i32 0, i32 0
%.tmp6968 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6965, i8* %.tmp6967)
%else_block.6969 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp6968, %m996$.Node.type** %else_block.6969
%.tmp6970 = load %m996$.Node.type*, %m996$.Node.type** %else_block.6969
%.tmp6971 = icmp ne %m996$.Node.type* %.tmp6970, null
br i1 %.tmp6971, label %.if.true.6972, label %.if.false.6972
.if.true.6972:
%.tmp6973 = load %m996$.Node.type*, %m996$.Node.type** %else_block.6969
%.tmp6974 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6973, i32 0, i32 8
%.tmp6975 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6974
%.tmp6976 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6975, i32 0, i32 0
%.tmp6977 = load i8*, i8** %.tmp6976
%.tmp6979 = getelementptr [11 x i8], [11 x i8]*@.str6978, i32 0, i32 0
%.tmp6980 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp6977, i8* %.tmp6979)
%.tmp6981 = icmp eq i32 %.tmp6980, 0
br i1 %.tmp6981, label %.if.true.6982, label %.if.false.6982
.if.true.6982:
%.tmp6983 = load %m996$.Node.type*, %m996$.Node.type** %else_block.6969
%.tmp6984 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6983, i32 0, i32 8
%.tmp6985 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6984
%.tmp6986 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp6985, i32 0, i32 8
%.tmp6987 = load %m996$.Node.type*, %m996$.Node.type** %.tmp6986
%.tmp6989 = getelementptr [6 x i8], [6 x i8]*@.str6988, i32 0, i32 0
%.tmp6990 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp6987, i8* %.tmp6989)
store %m996$.Node.type* %.tmp6990, %m996$.Node.type** %block.6946
%.tmp6991 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6992 = load %m996$.Node.type*, %m996$.Node.type** %block.6946
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_block.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp6991, %m996$.Node.type* %.tmp6992)
br label %.if.end.6982
.if.false.6982:
%.tmp6993 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6994 = load %m996$.Node.type*, %m996$.Node.type** %else_block.6969
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_if_block.v.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp6993, %m996$.Node.type* %.tmp6994)
br label %.if.end.6982
.if.end.6982:
br label %.if.end.6972
.if.false.6972:
br label %.if.end.6972
.if.end.6972:
%.tmp6995 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp6996 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp6995, i32 0, i32 1
%.tmp6997 = load %m0$.File.type*, %m0$.File.type** %.tmp6996
%.tmp6999 = getelementptr [23 x i8], [23 x i8]*@.str6998, i32 0, i32 0
%.tmp7000 = load i32, i32* %if_id.6917
%.tmp7001 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6997, i8* %.tmp6999, i32 %.tmp7000)
%.tmp7002 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7003 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp7002, i32 0, i32 1
%.tmp7004 = load %m0$.File.type*, %m0$.File.type** %.tmp7003
%.tmp7006 = getelementptr [13 x i8], [13 x i8]*@.str7005, i32 0, i32 0
%.tmp7007 = load i32, i32* %if_id.6917
%.tmp7008 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7004, i8* %.tmp7006, i32 %.tmp7007)
ret void
}
define void @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%curr_node = alloca %m996$.Node.type*
store %m996$.Node.type* %.curr_node.arg, %m996$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp7009 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp7010 = icmp ne %m996$.Node.type* %.tmp7009, null
br i1 %.tmp7010, label %.if.true.7011, label %.if.false.7011
.if.true.7011:
%.tmp7012 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7013 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp7012, i32 0, i32 7
%.tmp7014 = load i8*, i8** %.tmp7013
%.tmp7015 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp7016 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7015, i32 0, i32 3
%.tmp7017 = load i32, i32* %.tmp7016
%.tmp7018 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp7019 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7018, i32 0, i32 4
%.tmp7020 = load i32, i32* %.tmp7019
%.tmp7021 = load i8*, i8** %msg
%.tmp7022 = call %m312$.Error.type*(i8*,i32,i32,i8*) @m312$new.m312$.Error.typep.cp.i.i.cp(i8* %.tmp7014, i32 %.tmp7017, i32 %.tmp7020, i8* %.tmp7021)
%err.7023 = alloca %m312$.Error.type*
store %m312$.Error.type* %.tmp7022, %m312$.Error.type** %err.7023
%.tmp7024 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7025 = load %m312$.Error.type*, %m312$.Error.type** %err.7023
call void(%m2811$.CompilerCtx.type*,%m312$.Error.type*) @m311$append_error.v.m2811$.CompilerCtx.typep.m312$.Error.typep(%m2811$.CompilerCtx.type* %.tmp7024, %m312$.Error.type* %.tmp7025)
br label %.if.end.7011
.if.false.7011:
%.tmp7027 = getelementptr [61 x i8], [61 x i8]*@.str7026, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp7027)
br label %.if.end.7011
.if.end.7011:
ret void
}
define void @m311$define_assignable.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg, i8* %.name.arg, %m2811$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.info.arg, %m2811$.AssignableInfo.type** %info
%.tmp7028 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7029 = call %m2811$.ModuleLookup.type*(%m2811$.CompilerCtx.type*) @m311$get_current_module.m2811$.ModuleLookup.typep.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp7028)
%mod.7030 = alloca %m2811$.ModuleLookup.type*
store %m2811$.ModuleLookup.type* %.tmp7029, %m2811$.ModuleLookup.type** %mod.7030
%.tmp7031 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.7030
%.tmp7032 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp7031, i32 0, i32 3
%.tmp7033 = load %m2811$.Scope.type*, %m2811$.Scope.type** %.tmp7032
%.tmp7034 = icmp ne %m2811$.Scope.type* %.tmp7033, null
%.tmp7036 = getelementptr [82 x i8], [82 x i8]*@.str7035, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7034, i8* %.tmp7036)
%.tmp7037 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.7030
%.tmp7038 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp7037, i32 0, i32 3
%.tmp7039 = load %m2811$.Scope.type*, %m2811$.Scope.type** %.tmp7038
%current_scope.7040 = alloca %m2811$.Scope.type*
store %m2811$.Scope.type* %.tmp7039, %m2811$.Scope.type** %current_scope.7040
%.tmp7041 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* null, i32 1
%.tmp7042 = ptrtoint %m2811$.ScopeItem.type* %.tmp7041 to i32
%.tmp7043 = call i8*(i32) @malloc(i32 %.tmp7042)
%.tmp7044 = bitcast i8* %.tmp7043 to %m2811$.ScopeItem.type*
%newitem.7045 = alloca %m2811$.ScopeItem.type*
store %m2811$.ScopeItem.type* %.tmp7044, %m2811$.ScopeItem.type** %newitem.7045
%.tmp7046 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %newitem.7045
%.tmp7047 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp7046, i32 0, i32 0
%.tmp7048 = load i8*, i8** %name
store i8* %.tmp7048, i8** %.tmp7047
%.tmp7049 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %newitem.7045
%.tmp7050 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp7049, i32 0, i32 1
%.tmp7051 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
store %m2811$.AssignableInfo.type* %.tmp7051, %m2811$.AssignableInfo.type** %.tmp7050
%.tmp7052 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %newitem.7045
%.tmp7053 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp7052, i32 0, i32 2
store %m2811$.ScopeItem.type* null, %m2811$.ScopeItem.type** %.tmp7053
%.tmp7054 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp7055 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7054, i32 0, i32 2
%.tmp7056 = load i8*, i8** %name
store i8* %.tmp7056, i8** %.tmp7055
%.tmp7057 = load %m2811$.Scope.type*, %m2811$.Scope.type** %current_scope.7040
%.tmp7058 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp7057, i32 0, i32 1
%.tmp7059 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %.tmp7058
%.tmp7060 = icmp eq %m2811$.ScopeItem.type* %.tmp7059, null
br i1 %.tmp7060, label %.if.true.7061, label %.if.false.7061
.if.true.7061:
%.tmp7062 = load %m2811$.Scope.type*, %m2811$.Scope.type** %current_scope.7040
%.tmp7063 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp7062, i32 0, i32 1
%.tmp7064 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %newitem.7045
store %m2811$.ScopeItem.type* %.tmp7064, %m2811$.ScopeItem.type** %.tmp7063
ret void
br label %.if.end.7061
.if.false.7061:
br label %.if.end.7061
.if.end.7061:
%.tmp7065 = load %m2811$.Scope.type*, %m2811$.Scope.type** %current_scope.7040
%.tmp7066 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp7065, i32 0, i32 1
%.tmp7067 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %.tmp7066
%last_item.7068 = alloca %m2811$.ScopeItem.type*
store %m2811$.ScopeItem.type* %.tmp7067, %m2811$.ScopeItem.type** %last_item.7068
%.tmp7070 = getelementptr [1 x i8], [1 x i8]*@.str7069, i32 0, i32 0
%err_buf.7071 = alloca i8*
store i8* %.tmp7070, i8** %err_buf.7071
%.tmp7072 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %last_item.7068
%.tmp7073 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp7072, i32 0, i32 0
%.tmp7074 = load i8*, i8** %.tmp7073
%.tmp7075 = load i8*, i8** %name
%.tmp7076 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7074, i8* %.tmp7075)
%.tmp7077 = icmp eq i32 %.tmp7076, 0
br i1 %.tmp7077, label %.if.true.7078, label %.if.false.7078
.if.true.7078:
%.tmp7079 = getelementptr i8*, i8** %err_buf.7071, i32 0
%.tmp7081 = getelementptr [43 x i8], [43 x i8]*@.str7080, i32 0, i32 0
%.tmp7082 = load i8*, i8** %name
%.tmp7083 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7079, i8* %.tmp7081, i8* %.tmp7082)
%.tmp7084 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7085 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7086 = load i8*, i8** %err_buf.7071
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp7084, %m996$.Node.type* %.tmp7085, i8* %.tmp7086)
br label %.if.end.7078
.if.false.7078:
br label %.if.end.7078
.if.end.7078:
br label %.for.start.7087
.for.start.7087:
%.tmp7088 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %last_item.7068
%.tmp7089 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp7088, i32 0, i32 2
%.tmp7090 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %.tmp7089
%.tmp7091 = icmp ne %m2811$.ScopeItem.type* %.tmp7090, null
br i1 %.tmp7091, label %.for.continue.7087, label %.for.else.7087
.for.continue.7087:
%.tmp7092 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %last_item.7068
%.tmp7093 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp7092, i32 0, i32 0
%.tmp7094 = load i8*, i8** %.tmp7093
%.tmp7095 = load i8*, i8** %name
%.tmp7096 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7094, i8* %.tmp7095)
%.tmp7097 = icmp eq i32 %.tmp7096, 0
br i1 %.tmp7097, label %.if.true.7098, label %.if.false.7098
.if.true.7098:
%.tmp7099 = getelementptr i8*, i8** %err_buf.7071, i32 0
%.tmp7101 = getelementptr [43 x i8], [43 x i8]*@.str7100, i32 0, i32 0
%.tmp7102 = load i8*, i8** %name
%.tmp7103 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7099, i8* %.tmp7101, i8* %.tmp7102)
%.tmp7104 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7105 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7106 = load i8*, i8** %err_buf.7071
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp7104, %m996$.Node.type* %.tmp7105, i8* %.tmp7106)
br label %.for.end.7087
br label %.if.end.7098
.if.false.7098:
br label %.if.end.7098
.if.end.7098:
%.tmp7107 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %last_item.7068
%.tmp7108 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp7107, i32 0, i32 2
%.tmp7109 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %.tmp7108
store %m2811$.ScopeItem.type* %.tmp7109, %m2811$.ScopeItem.type** %last_item.7068
br label %.for.start.7087
.for.else.7087:
%.tmp7110 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %last_item.7068
%.tmp7111 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp7110, i32 0, i32 2
%.tmp7112 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %newitem.7045
store %m2811$.ScopeItem.type* %.tmp7112, %m2811$.ScopeItem.type** %.tmp7111
br label %.for.end.7087
.for.end.7087:
ret void
}
define %m2811$.ScopeItem.type* @m311$find_defined_in.m2811$.ScopeItem.typep.m2811$.CompilerCtx.typep.cp.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m996$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m996$.Node.type*
store %m996$.Node.type* %.dotted_name.arg, %m996$.Node.type** %dotted_name
%.tmp7113 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7114 = load i8*, i8** %module
%.tmp7115 = load %m996$.Node.type*, %m996$.Node.type** %dotted_name
%.tmp7116 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7115, i32 0, i32 1
%.tmp7117 = load i8*, i8** %.tmp7116
%.tmp7118 = call %m2811$.ScopeItem.type*(%m2811$.CompilerCtx.type*,i8*,i8*) @m311$find_defined_str.m2811$.ScopeItem.typep.m2811$.CompilerCtx.typep.cp.cp(%m2811$.CompilerCtx.type* %.tmp7113, i8* %.tmp7114, i8* %.tmp7117)
%found.7119 = alloca %m2811$.ScopeItem.type*
store %m2811$.ScopeItem.type* %.tmp7118, %m2811$.ScopeItem.type** %found.7119
%.tmp7120 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %found.7119
%.tmp7121 = icmp eq %m2811$.ScopeItem.type* %.tmp7120, null
br i1 %.tmp7121, label %.if.true.7122, label %.if.false.7122
.if.true.7122:
%.tmp7123 = bitcast ptr null to %m2811$.ScopeItem.type*
ret %m2811$.ScopeItem.type* %.tmp7123
br label %.if.end.7122
.if.false.7122:
br label %.if.end.7122
.if.end.7122:
br label %.for.start.7124
.for.start.7124:
%.tmp7125 = load %m996$.Node.type*, %m996$.Node.type** %dotted_name
%.tmp7126 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7125, i32 0, i32 9
%.tmp7127 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7126
%.tmp7128 = icmp ne %m996$.Node.type* %.tmp7127, null
%.tmp7129 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %found.7119
%.tmp7130 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp7129, i32 0, i32 1
%.tmp7131 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %.tmp7130
%.tmp7132 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7131, i32 0, i32 3
%.tmp7133 = load i8*, i8** %.tmp7132
%.tmp7135 = getelementptr [7 x i8], [7 x i8]*@.str7134, i32 0, i32 0
%.tmp7136 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7133, i8* %.tmp7135)
%.tmp7137 = icmp eq i32 %.tmp7136, 0
%.tmp7138 = and i1 %.tmp7128, %.tmp7137
br i1 %.tmp7138, label %.for.continue.7124, label %.for.end.7124
.for.continue.7124:
%.tmp7139 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7140 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %found.7119
%.tmp7141 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp7140, i32 0, i32 1
%.tmp7142 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %.tmp7141
%.tmp7143 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7142, i32 0, i32 0
%.tmp7144 = load i8*, i8** %.tmp7143
%.tmp7145 = load %m996$.Node.type*, %m996$.Node.type** %dotted_name
%.tmp7146 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7145, i32 0, i32 9
%.tmp7147 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7146
%.tmp7148 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7147, i32 0, i32 9
%.tmp7149 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7148
%.tmp7150 = call %m2811$.ScopeItem.type*(%m2811$.CompilerCtx.type*,i8*,%m996$.Node.type*) @m311$find_defined_in.m2811$.ScopeItem.typep.m2811$.CompilerCtx.typep.cp.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp7139, i8* %.tmp7144, %m996$.Node.type* %.tmp7149)
store %m2811$.ScopeItem.type* %.tmp7150, %m2811$.ScopeItem.type** %found.7119
%.tmp7151 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %found.7119
%.tmp7152 = icmp eq %m2811$.ScopeItem.type* %.tmp7151, null
br i1 %.tmp7152, label %.if.true.7153, label %.if.false.7153
.if.true.7153:
%.tmp7154 = bitcast ptr null to %m2811$.ScopeItem.type*
ret %m2811$.ScopeItem.type* %.tmp7154
br label %.if.end.7153
.if.false.7153:
br label %.if.end.7153
.if.end.7153:
br label %.for.start.7124
.for.end.7124:
%.tmp7155 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %found.7119
ret %m2811$.ScopeItem.type* %.tmp7155
}
define %m2811$.ScopeItem.type* @m311$find_defined_here.m2811$.ScopeItem.typep.m2811$.CompilerCtx.typep.m2811$.Scope.typep.cp(%m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.Scope.type* %.s.arg, i8* %.name.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%s = alloca %m2811$.Scope.type*
store %m2811$.Scope.type* %.s.arg, %m2811$.Scope.type** %s
%name = alloca i8*
store i8* %.name.arg, i8** %name
%.tmp7156 = load %m2811$.Scope.type*, %m2811$.Scope.type** %s
%.tmp7157 = icmp eq %m2811$.Scope.type* %.tmp7156, null
br i1 %.tmp7157, label %.if.true.7158, label %.if.false.7158
.if.true.7158:
%.tmp7159 = bitcast ptr null to %m2811$.ScopeItem.type*
ret %m2811$.ScopeItem.type* %.tmp7159
br label %.if.end.7158
.if.false.7158:
br label %.if.end.7158
.if.end.7158:
%.tmp7161 = load %m2811$.Scope.type*, %m2811$.Scope.type** %s
%.tmp7162 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp7161, i32 0, i32 1
%.tmp7163 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %.tmp7162
%item.7164 = alloca %m2811$.ScopeItem.type*
store %m2811$.ScopeItem.type* %.tmp7163, %m2811$.ScopeItem.type** %item.7164
br label %.for.start.7160
.for.start.7160:
%.tmp7165 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %item.7164
%.tmp7166 = icmp ne %m2811$.ScopeItem.type* %.tmp7165, null
br i1 %.tmp7166, label %.for.continue.7160, label %.for.end.7160
.for.continue.7160:
%.tmp7167 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %item.7164
%.tmp7168 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp7167, i32 0, i32 0
%.tmp7169 = load i8*, i8** %.tmp7168
%.tmp7170 = load i8*, i8** %name
%.tmp7171 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7169, i8* %.tmp7170)
%.tmp7172 = icmp eq i32 %.tmp7171, 0
br i1 %.tmp7172, label %.if.true.7173, label %.if.false.7173
.if.true.7173:
%.tmp7174 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %item.7164
ret %m2811$.ScopeItem.type* %.tmp7174
br label %.if.end.7173
.if.false.7173:
br label %.if.end.7173
.if.end.7173:
%.tmp7175 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %item.7164
%.tmp7176 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp7175, i32 0, i32 2
%.tmp7177 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %.tmp7176
store %m2811$.ScopeItem.type* %.tmp7177, %m2811$.ScopeItem.type** %item.7164
br label %.for.start.7160
.for.end.7160:
%.tmp7178 = bitcast ptr null to %m2811$.ScopeItem.type*
ret %m2811$.ScopeItem.type* %.tmp7178
}
define %m2811$.ScopeItem.type* @m311$find_defined_str.m2811$.ScopeItem.typep.m2811$.CompilerCtx.typep.cp.cp(%m2811$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp7179 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7180 = load i8*, i8** %module
%.tmp7181 = call %m2811$.ModuleLookup.type*(%m2811$.CompilerCtx.type*,i8*) @m311$get_module.m2811$.ModuleLookup.typep.m2811$.CompilerCtx.typep.cp(%m2811$.CompilerCtx.type* %.tmp7179, i8* %.tmp7180)
%mod.7182 = alloca %m2811$.ModuleLookup.type*
store %m2811$.ModuleLookup.type* %.tmp7181, %m2811$.ModuleLookup.type** %mod.7182
%.tmp7183 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.7182
%.tmp7184 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp7183, i32 0, i32 3
%.tmp7185 = load %m2811$.Scope.type*, %m2811$.Scope.type** %.tmp7184
%.tmp7186 = icmp ne %m2811$.Scope.type* %.tmp7185, null
%.tmp7188 = getelementptr [77 x i8], [77 x i8]*@.str7187, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp7186, i8* %.tmp7188)
%.tmp7190 = load %m2811$.ModuleLookup.type*, %m2811$.ModuleLookup.type** %mod.7182
%.tmp7191 = getelementptr %m2811$.ModuleLookup.type, %m2811$.ModuleLookup.type* %.tmp7190, i32 0, i32 3
%.tmp7192 = load %m2811$.Scope.type*, %m2811$.Scope.type** %.tmp7191
%s.7193 = alloca %m2811$.Scope.type*
store %m2811$.Scope.type* %.tmp7192, %m2811$.Scope.type** %s.7193
br label %.for.start.7189
.for.start.7189:
%.tmp7194 = load %m2811$.Scope.type*, %m2811$.Scope.type** %s.7193
%.tmp7195 = icmp ne %m2811$.Scope.type* %.tmp7194, null
br i1 %.tmp7195, label %.for.continue.7189, label %.for.end.7189
.for.continue.7189:
%.tmp7196 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7197 = load %m2811$.Scope.type*, %m2811$.Scope.type** %s.7193
%.tmp7198 = load i8*, i8** %assignable_name
%.tmp7199 = call %m2811$.ScopeItem.type*(%m2811$.CompilerCtx.type*,%m2811$.Scope.type*,i8*) @m311$find_defined_here.m2811$.ScopeItem.typep.m2811$.CompilerCtx.typep.m2811$.Scope.typep.cp(%m2811$.CompilerCtx.type* %.tmp7196, %m2811$.Scope.type* %.tmp7197, i8* %.tmp7198)
%item.7200 = alloca %m2811$.ScopeItem.type*
store %m2811$.ScopeItem.type* %.tmp7199, %m2811$.ScopeItem.type** %item.7200
%.tmp7201 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %item.7200
%.tmp7202 = icmp ne %m2811$.ScopeItem.type* %.tmp7201, null
br i1 %.tmp7202, label %.if.true.7203, label %.if.false.7203
.if.true.7203:
%.tmp7204 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %item.7200
ret %m2811$.ScopeItem.type* %.tmp7204
br label %.if.end.7203
.if.false.7203:
br label %.if.end.7203
.if.end.7203:
%.tmp7205 = load %m2811$.Scope.type*, %m2811$.Scope.type** %s.7193
%.tmp7206 = getelementptr %m2811$.Scope.type, %m2811$.Scope.type* %.tmp7205, i32 0, i32 5
%.tmp7207 = load %m2811$.Scope.type*, %m2811$.Scope.type** %.tmp7206
store %m2811$.Scope.type* %.tmp7207, %m2811$.Scope.type** %s.7193
br label %.for.start.7189
.for.end.7189:
%.tmp7208 = bitcast ptr null to %m2811$.ScopeItem.type*
ret %m2811$.ScopeItem.type* %.tmp7208
}
define %m2811$.ScopeItem.type* @m311$find_defined.m2811$.ScopeItem.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%dotted_name = alloca %m996$.Node.type*
store %m996$.Node.type* %.dotted_name.arg, %m996$.Node.type** %dotted_name
%.tmp7209 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7210 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7211 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp7210, i32 0, i32 7
%.tmp7212 = load i8*, i8** %.tmp7211
%.tmp7213 = load %m996$.Node.type*, %m996$.Node.type** %dotted_name
%.tmp7214 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7213, i32 0, i32 8
%.tmp7215 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7214
%.tmp7216 = call %m2811$.ScopeItem.type*(%m2811$.CompilerCtx.type*,i8*,%m996$.Node.type*) @m311$find_defined_in.m2811$.ScopeItem.typep.m2811$.CompilerCtx.typep.cp.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp7209, i8* %.tmp7212, %m996$.Node.type* %.tmp7215)
ret %m2811$.ScopeItem.type* %.tmp7216
}
define %m2811$.AssignableInfo.type* @m311$get_dotted_name.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.dot_name_ptr.arg, %m2811$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m996$.Node.type*
store %m996$.Node.type* %.dot_name_ptr.arg, %m996$.Node.type** %dot_name_ptr
%info = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.info.arg, %m2811$.AssignableInfo.type** %info
%.tmp7218 = getelementptr [1 x i8], [1 x i8]*@.str7217, i32 0, i32 0
%err_msg.7219 = alloca i8*
store i8* %.tmp7218, i8** %err_msg.7219
%.tmp7221 = getelementptr [1 x i8], [1 x i8]*@.str7220, i32 0, i32 0
%buf.7222 = alloca i8*
store i8* %.tmp7221, i8** %buf.7222
%.tmp7223 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp7224 = icmp eq %m2811$.AssignableInfo.type* %.tmp7223, null
br i1 %.tmp7224, label %.if.true.7225, label %.if.false.7225
.if.true.7225:
%.tmp7226 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7227 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7229 = getelementptr [54 x i8], [54 x i8]*@.str7228, i32 0, i32 0
%.tmp7230 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp7226, %m996$.Node.type* %.tmp7227, i8* %.tmp7229)
%.tmp7231 = call i32(i8*,...) @printf(i8* %.tmp7230)
%.tmp7232 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp7232
br label %.if.end.7225
.if.false.7225:
br label %.if.end.7225
.if.end.7225:
%.tmp7233 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp7234 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7233, i32 0, i32 3
%.tmp7235 = load i8*, i8** %.tmp7234
%.tmp7237 = getelementptr [9 x i8], [9 x i8]*@.str7236, i32 0, i32 0
%.tmp7238 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7235, i8* %.tmp7237)
%.tmp7239 = icmp eq i32 %.tmp7238, 0
%.tmp7240 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp7241 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7240, i32 0, i32 3
%.tmp7242 = load i8*, i8** %.tmp7241
%.tmp7244 = getelementptr [7 x i8], [7 x i8]*@.str7243, i32 0, i32 0
%.tmp7245 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7242, i8* %.tmp7244)
%.tmp7246 = icmp eq i32 %.tmp7245, 0
%.tmp7247 = or i1 %.tmp7239, %.tmp7246
br i1 %.tmp7247, label %.if.true.7248, label %.if.false.7248
.if.true.7248:
%.tmp7249 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7250 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7249, i32 0, i32 9
%.tmp7251 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7250
%.tmp7252 = icmp ne %m996$.Node.type* %.tmp7251, null
br i1 %.tmp7252, label %.if.true.7253, label %.if.false.7253
.if.true.7253:
%.tmp7254 = getelementptr i8*, i8** %err_msg.7219, i32 0
%.tmp7256 = getelementptr [46 x i8], [46 x i8]*@.str7255, i32 0, i32 0
%.tmp7257 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7258 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7257, i32 0, i32 9
%.tmp7259 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7258
%.tmp7260 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7259, i32 0, i32 9
%.tmp7261 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7260
%.tmp7262 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7261, i32 0, i32 1
%.tmp7263 = load i8*, i8** %.tmp7262
%.tmp7264 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7265 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7264, i32 0, i32 1
%.tmp7266 = load i8*, i8** %.tmp7265
%.tmp7267 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7254, i8* %.tmp7256, i8* %.tmp7263, i8* %.tmp7266)
%.tmp7268 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7269 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7270 = load i8*, i8** %err_msg.7219
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp7268, %m996$.Node.type* %.tmp7269, i8* %.tmp7270)
%.tmp7271 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp7271
br label %.if.end.7253
.if.false.7253:
br label %.if.end.7253
.if.end.7253:
%.tmp7272 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
ret %m2811$.AssignableInfo.type* %.tmp7272
br label %.if.end.7248
.if.false.7248:
%.tmp7273 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp7274 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7273, i32 0, i32 3
%.tmp7275 = load i8*, i8** %.tmp7274
%.tmp7277 = getelementptr [9 x i8], [9 x i8]*@.str7276, i32 0, i32 0
%.tmp7278 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7275, i8* %.tmp7277)
%.tmp7279 = icmp eq i32 %.tmp7278, 0
%.tmp7280 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7281 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7280, i32 0, i32 9
%.tmp7282 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7281
%.tmp7283 = icmp ne %m996$.Node.type* %.tmp7282, null
%.tmp7284 = and i1 %.tmp7279, %.tmp7283
br i1 %.tmp7284, label %.if.true.7285, label %.if.false.7285
.if.true.7285:
%.tmp7286 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%base_var.7287 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp7286, %m2811$.AssignableInfo.type** %base_var.7287
%.tmp7288 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base_var.7287
%.tmp7289 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7288, i32 0, i32 4
%.tmp7290 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7289
%struct_info.7291 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp7290, %m2811$.Type.type** %struct_info.7291
br label %.for.start.7292
.for.start.7292:
%.tmp7293 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base_var.7287
%.tmp7294 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7293, i32 0, i32 4
%.tmp7295 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7294
%.tmp7296 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7295, i32 0, i32 0
%.tmp7297 = load i8*, i8** %.tmp7296
%.tmp7299 = getelementptr [4 x i8], [4 x i8]*@.str7298, i32 0, i32 0
%.tmp7300 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7297, i8* %.tmp7299)
%.tmp7301 = icmp eq i32 %.tmp7300, 0
br i1 %.tmp7301, label %.for.continue.7292, label %.for.end.7292
.for.continue.7292:
%.tmp7302 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7303 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp7302)
%new_base.7304 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp7303, %m2811$.AssignableInfo.type** %new_base.7304
%.tmp7305 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7306 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_base.7304
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp7305, %m2811$.AssignableInfo.type* %.tmp7306)
%.tmp7307 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_base.7304
%.tmp7308 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7307, i32 0, i32 4
%.tmp7309 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base_var.7287
%.tmp7310 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7309, i32 0, i32 4
%.tmp7311 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7310
%.tmp7312 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7311, i32 0, i32 3
%.tmp7313 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7312
store %m2811$.Type.type* %.tmp7313, %m2811$.Type.type** %.tmp7308
%.tmp7314 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7315 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp7314, i32 0, i32 1
%.tmp7316 = load %m0$.File.type*, %m0$.File.type** %.tmp7315
%.tmp7318 = getelementptr [23 x i8], [23 x i8]*@.str7317, i32 0, i32 0
%.tmp7319 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_base.7304
%.tmp7320 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp7319)
%.tmp7321 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7322 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_base.7304
%.tmp7323 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7322, i32 0, i32 4
%.tmp7324 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7323
%.tmp7325 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp7321, %m2811$.Type.type* %.tmp7324)
%.tmp7326 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7327 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base_var.7287
%.tmp7328 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7327, i32 0, i32 4
%.tmp7329 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7328
%.tmp7330 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp7326, %m2811$.Type.type* %.tmp7329)
%.tmp7331 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base_var.7287
%.tmp7332 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp7331)
%.tmp7333 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7316, i8* %.tmp7318, i8* %.tmp7320, i8* %.tmp7325, i8* %.tmp7330, i8* %.tmp7332)
%.tmp7334 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_base.7304
store %m2811$.AssignableInfo.type* %.tmp7334, %m2811$.AssignableInfo.type** %base_var.7287
%.tmp7335 = load %m2811$.Type.type*, %m2811$.Type.type** %struct_info.7291
%.tmp7336 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7335, i32 0, i32 3
%.tmp7337 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7336
store %m2811$.Type.type* %.tmp7337, %m2811$.Type.type** %struct_info.7291
br label %.for.start.7292
.for.end.7292:
%.tmp7338 = load %m2811$.Type.type*, %m2811$.Type.type** %struct_info.7291
%.tmp7339 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7338, i32 0, i32 0
%.tmp7340 = load i8*, i8** %.tmp7339
%.tmp7342 = getelementptr [10 x i8], [10 x i8]*@.str7341, i32 0, i32 0
%.tmp7343 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7340, i8* %.tmp7342)
%.tmp7344 = icmp eq i32 %.tmp7343, 0
br i1 %.tmp7344, label %.if.true.7345, label %.if.false.7345
.if.true.7345:
%.tmp7346 = load %m2811$.Type.type*, %m2811$.Type.type** %struct_info.7291
%.tmp7347 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7346, i32 0, i32 3
%.tmp7348 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7347
store %m2811$.Type.type* %.tmp7348, %m2811$.Type.type** %struct_info.7291
br label %.if.end.7345
.if.false.7345:
br label %.if.end.7345
.if.end.7345:
%.tmp7349 = load %m2811$.Type.type*, %m2811$.Type.type** %struct_info.7291
%.tmp7350 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7349, i32 0, i32 0
%.tmp7351 = load i8*, i8** %.tmp7350
%.tmp7353 = getelementptr [7 x i8], [7 x i8]*@.str7352, i32 0, i32 0
%.tmp7354 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7351, i8* %.tmp7353)
%.tmp7355 = icmp ne i32 %.tmp7354, 0
br i1 %.tmp7355, label %.if.true.7356, label %.if.false.7356
.if.true.7356:
%.tmp7357 = getelementptr i8*, i8** %err_msg.7219, i32 0
%.tmp7359 = getelementptr [48 x i8], [48 x i8]*@.str7358, i32 0, i32 0
%.tmp7360 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7361 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7360, i32 0, i32 9
%.tmp7362 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7361
%.tmp7363 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7362, i32 0, i32 9
%.tmp7364 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7363
%.tmp7365 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7364, i32 0, i32 1
%.tmp7366 = load i8*, i8** %.tmp7365
%.tmp7367 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7368 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7367, i32 0, i32 1
%.tmp7369 = load i8*, i8** %.tmp7368
%.tmp7370 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7357, i8* %.tmp7359, i8* %.tmp7366, i8* %.tmp7369)
%.tmp7371 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7372 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7373 = load i8*, i8** %err_msg.7219
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp7371, %m996$.Node.type* %.tmp7372, i8* %.tmp7373)
%.tmp7374 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp7374
br label %.if.end.7356
.if.false.7356:
br label %.if.end.7356
.if.end.7356:
%.tmp7375 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7376 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7375, i32 0, i32 9
%.tmp7377 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7376
%.tmp7378 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7377, i32 0, i32 9
%.tmp7379 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7378
%.tmp7380 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7379, i32 0, i32 1
%.tmp7381 = load i8*, i8** %.tmp7380
%field_name.7382 = alloca i8*
store i8* %.tmp7381, i8** %field_name.7382
%field_id.7383 = alloca i32
store i32 0, i32* %field_id.7383
%.tmp7384 = bitcast ptr null to %m2811$.Type.type*
%found_field.7385 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp7384, %m2811$.Type.type** %found_field.7385
%.tmp7387 = load %m2811$.Type.type*, %m2811$.Type.type** %struct_info.7291
%.tmp7388 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7387, i32 0, i32 3
%.tmp7389 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7388
%field.7390 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp7389, %m2811$.Type.type** %field.7390
br label %.for.start.7386
.for.start.7386:
%.tmp7391 = load %m2811$.Type.type*, %m2811$.Type.type** %field.7390
%.tmp7392 = icmp ne %m2811$.Type.type* %.tmp7391, null
br i1 %.tmp7392, label %.for.continue.7386, label %.for.end.7386
.for.continue.7386:
%.tmp7393 = load %m2811$.Type.type*, %m2811$.Type.type** %field.7390
%.tmp7394 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7393, i32 0, i32 1
%.tmp7395 = load i8*, i8** %.tmp7394
%.tmp7396 = load i8*, i8** %field_name.7382
%.tmp7397 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7395, i8* %.tmp7396)
%.tmp7398 = icmp eq i32 %.tmp7397, 0
br i1 %.tmp7398, label %.if.true.7399, label %.if.false.7399
.if.true.7399:
%.tmp7400 = load %m2811$.Type.type*, %m2811$.Type.type** %field.7390
store %m2811$.Type.type* %.tmp7400, %m2811$.Type.type** %found_field.7385
br label %.for.end.7386
br label %.if.end.7399
.if.false.7399:
%.tmp7401 = load i32, i32* %field_id.7383
%.tmp7402 = add i32 %.tmp7401, 1
store i32 %.tmp7402, i32* %field_id.7383
br label %.if.end.7399
.if.end.7399:
%.tmp7403 = load %m2811$.Type.type*, %m2811$.Type.type** %field.7390
%.tmp7404 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7403, i32 0, i32 4
%.tmp7405 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7404
store %m2811$.Type.type* %.tmp7405, %m2811$.Type.type** %field.7390
br label %.for.start.7386
.for.end.7386:
%.tmp7406 = load %m2811$.Type.type*, %m2811$.Type.type** %found_field.7385
%.tmp7407 = icmp eq %m2811$.Type.type* %.tmp7406, null
br i1 %.tmp7407, label %.if.true.7408, label %.if.false.7408
.if.true.7408:
%.tmp7409 = getelementptr i8*, i8** %err_msg.7219, i32 0
%.tmp7411 = getelementptr [34 x i8], [34 x i8]*@.str7410, i32 0, i32 0
%.tmp7412 = load i8*, i8** %field_name.7382
%.tmp7413 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7414 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7413, i32 0, i32 1
%.tmp7415 = load i8*, i8** %.tmp7414
%.tmp7416 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7409, i8* %.tmp7411, i8* %.tmp7412, i8* %.tmp7415)
%.tmp7417 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7418 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7419 = load i8*, i8** %err_msg.7219
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp7417, %m996$.Node.type* %.tmp7418, i8* %.tmp7419)
%.tmp7420 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp7420
br label %.if.end.7408
.if.false.7408:
br label %.if.end.7408
.if.end.7408:
%.tmp7421 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7422 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp7421)
%new_info.7423 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp7422, %m2811$.AssignableInfo.type** %new_info.7423
%.tmp7424 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_info.7423
%.tmp7425 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7424, i32 0, i32 4
%.tmp7426 = load %m2811$.Type.type*, %m2811$.Type.type** %found_field.7385
store %m2811$.Type.type* %.tmp7426, %m2811$.Type.type** %.tmp7425
%.tmp7427 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7428 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_info.7423
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp7427, %m2811$.AssignableInfo.type* %.tmp7428)
%.tmp7429 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_info.7423
%.tmp7430 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7429, i32 0, i32 3
%.tmp7432 = getelementptr [9 x i8], [9 x i8]*@.str7431, i32 0, i32 0
store i8* %.tmp7432, i8** %.tmp7430
%.tmp7433 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7434 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base_var.7287
%.tmp7435 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7434, i32 0, i32 4
%.tmp7436 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7435
%.tmp7437 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp7433, %m2811$.Type.type* %.tmp7436)
%info_tr.7438 = alloca i8*
store i8* %.tmp7437, i8** %info_tr.7438
%.tmp7439 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7440 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp7439, i32 0, i32 1
%.tmp7441 = load %m0$.File.type*, %m0$.File.type** %.tmp7440
%.tmp7443 = getelementptr [46 x i8], [46 x i8]*@.str7442, i32 0, i32 0
%.tmp7444 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_info.7423
%.tmp7445 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp7444)
%.tmp7446 = load i8*, i8** %info_tr.7438
%.tmp7447 = load i8*, i8** %info_tr.7438
%.tmp7448 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base_var.7287
%.tmp7449 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp7448)
%.tmp7450 = load i32, i32* %field_id.7383
%.tmp7451 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7441, i8* %.tmp7443, i8* %.tmp7445, i8* %.tmp7446, i8* %.tmp7447, i8* %.tmp7449, i32 %.tmp7450)
%.tmp7452 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7453 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7454 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7453, i32 0, i32 9
%.tmp7455 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7454
%.tmp7456 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7455, i32 0, i32 9
%.tmp7457 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7456
%.tmp7458 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_info.7423
%.tmp7459 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,%m2811$.AssignableInfo.type*) @m311$get_dotted_name.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp7452, %m996$.Node.type* %.tmp7457, %m2811$.AssignableInfo.type* %.tmp7458)
ret %m2811$.AssignableInfo.type* %.tmp7459
br label %.if.end.7285
.if.false.7285:
%.tmp7460 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp7461 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7460, i32 0, i32 3
%.tmp7462 = load i8*, i8** %.tmp7461
%.tmp7464 = getelementptr [9 x i8], [9 x i8]*@.str7463, i32 0, i32 0
%.tmp7465 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7462, i8* %.tmp7464)
%.tmp7466 = icmp eq i32 %.tmp7465, 0
br i1 %.tmp7466, label %.if.true.7467, label %.if.false.7467
.if.true.7467:
%.tmp7468 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
ret %m2811$.AssignableInfo.type* %.tmp7468
br label %.if.end.7467
.if.false.7467:
br label %.if.end.7467
.if.end.7467:
br label %.if.end.7285
.if.end.7285:
br label %.if.end.7248
.if.end.7248:
%.tmp7469 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7470 = load %m996$.Node.type*, %m996$.Node.type** %dot_name_ptr
%.tmp7472 = getelementptr [43 x i8], [43 x i8]*@.str7471, i32 0, i32 0
%.tmp7473 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp7469, %m996$.Node.type* %.tmp7470, i8* %.tmp7472)
%.tmp7474 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
%.tmp7475 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7474, i32 0, i32 3
%.tmp7476 = load i8*, i8** %.tmp7475
%.tmp7477 = call i32(i8*,...) @printf(i8* %.tmp7473, i8* %.tmp7476)
%.tmp7478 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp7478
}
define %m2811$.AssignableInfo.type* @m311$compile_addr.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp7480 = getelementptr [1 x i8], [1 x i8]*@.str7479, i32 0, i32 0
%err_msg.7481 = alloca i8*
store i8* %.tmp7480, i8** %err_msg.7481
%.tmp7482 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%curr_node.7483 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp7482, %m996$.Node.type** %curr_node.7483
%.tmp7484 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.7483
%.tmp7485 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7484, i32 0, i32 0
%.tmp7486 = load i8*, i8** %.tmp7485
%.tmp7488 = getelementptr [17 x i8], [17 x i8]*@.str7487, i32 0, i32 0
%.tmp7489 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7486, i8* %.tmp7488)
%.tmp7490 = icmp eq i32 %.tmp7489, 0
%.tmp7491 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.7483
%.tmp7492 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7491, i32 0, i32 0
%.tmp7493 = load i8*, i8** %.tmp7492
%.tmp7495 = getelementptr [16 x i8], [16 x i8]*@.str7494, i32 0, i32 0
%.tmp7496 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7493, i8* %.tmp7495)
%.tmp7497 = icmp eq i32 %.tmp7496, 0
%.tmp7498 = or i1 %.tmp7490, %.tmp7497
%.tmp7499 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.7483
%.tmp7500 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7499, i32 0, i32 0
%.tmp7501 = load i8*, i8** %.tmp7500
%.tmp7503 = getelementptr [11 x i8], [11 x i8]*@.str7502, i32 0, i32 0
%.tmp7504 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7501, i8* %.tmp7503)
%.tmp7505 = icmp eq i32 %.tmp7504, 0
%.tmp7506 = or i1 %.tmp7498, %.tmp7505
br i1 %.tmp7506, label %.if.true.7507, label %.if.false.7507
.if.true.7507:
%.tmp7508 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7509 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7510 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7509, i32 0, i32 8
%.tmp7511 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7510
%.tmp7512 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_addr.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp7508, %m996$.Node.type* %.tmp7511)
ret %m2811$.AssignableInfo.type* %.tmp7512
br label %.if.end.7507
.if.false.7507:
br label %.if.end.7507
.if.end.7507:
%.tmp7513 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.7483
%.tmp7514 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7513, i32 0, i32 0
%.tmp7515 = load i8*, i8** %.tmp7514
%.tmp7517 = getelementptr [12 x i8], [12 x i8]*@.str7516, i32 0, i32 0
%.tmp7518 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7515, i8* %.tmp7517)
%.tmp7519 = icmp ne i32 %.tmp7518, 0
br i1 %.tmp7519, label %.if.true.7520, label %.if.false.7520
.if.true.7520:
%.tmp7522 = getelementptr [92 x i8], [92 x i8]*@.str7521, i32 0, i32 0
%.tmp7523 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.7483
%.tmp7524 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7523, i32 0, i32 0
%.tmp7525 = load i8*, i8** %.tmp7524
%.tmp7526 = call i32(i8*,...) @printf(i8* %.tmp7522, i8* %.tmp7525)
%.tmp7527 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp7528 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7527, i32 0, i32 8
%.tmp7529 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7528
store %m996$.Node.type* %.tmp7529, %m996$.Node.type** %curr_node.7483
br label %.if.end.7520
.if.false.7520:
br label %.if.end.7520
.if.end.7520:
%.tmp7530 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.7483
%.tmp7531 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7530, i32 0, i32 8
%.tmp7532 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7531
%assignable_name.7533 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp7532, %m996$.Node.type** %assignable_name.7533
%.tmp7534 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7535 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7536 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp7535, i32 0, i32 7
%.tmp7537 = load i8*, i8** %.tmp7536
%.tmp7538 = load %m996$.Node.type*, %m996$.Node.type** %assignable_name.7533
%.tmp7539 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7538, i32 0, i32 8
%.tmp7540 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7539
%.tmp7541 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7540, i32 0, i32 1
%.tmp7542 = load i8*, i8** %.tmp7541
%.tmp7543 = call %m2811$.ScopeItem.type*(%m2811$.CompilerCtx.type*,i8*,i8*) @m311$find_defined_str.m2811$.ScopeItem.typep.m2811$.CompilerCtx.typep.cp.cp(%m2811$.CompilerCtx.type* %.tmp7534, i8* %.tmp7537, i8* %.tmp7542)
%scope_info.7544 = alloca %m2811$.ScopeItem.type*
store %m2811$.ScopeItem.type* %.tmp7543, %m2811$.ScopeItem.type** %scope_info.7544
%.tmp7545 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %scope_info.7544
%.tmp7546 = icmp eq %m2811$.ScopeItem.type* %.tmp7545, null
br i1 %.tmp7546, label %.if.true.7547, label %.if.false.7547
.if.true.7547:
%.tmp7548 = getelementptr i8*, i8** %err_msg.7481, i32 0
%.tmp7550 = getelementptr [41 x i8], [41 x i8]*@.str7549, i32 0, i32 0
%.tmp7551 = load %m996$.Node.type*, %m996$.Node.type** %assignable_name.7533
%.tmp7552 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7551, i32 0, i32 8
%.tmp7553 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7552
%.tmp7554 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7553, i32 0, i32 1
%.tmp7555 = load i8*, i8** %.tmp7554
%.tmp7556 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7548, i8* %.tmp7550, i8* %.tmp7555)
%.tmp7557 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7558 = load %m996$.Node.type*, %m996$.Node.type** %assignable_name.7533
%.tmp7559 = load i8*, i8** %err_msg.7481
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp7557, %m996$.Node.type* %.tmp7558, i8* %.tmp7559)
%.tmp7560 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp7560
br label %.if.end.7547
.if.false.7547:
br label %.if.end.7547
.if.end.7547:
%.tmp7561 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %scope_info.7544
%.tmp7562 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp7561, i32 0, i32 1
%.tmp7563 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %.tmp7562
%info.7564 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp7563, %m2811$.AssignableInfo.type** %info.7564
%.tmp7565 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.7564
%.tmp7566 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7565, i32 0, i32 3
%.tmp7567 = load i8*, i8** %.tmp7566
%.tmp7569 = getelementptr [7 x i8], [7 x i8]*@.str7568, i32 0, i32 0
%.tmp7570 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7567, i8* %.tmp7569)
%.tmp7571 = icmp eq i32 %.tmp7570, 0
br i1 %.tmp7571, label %.if.true.7572, label %.if.false.7572
.if.true.7572:
%.tmp7573 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7574 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.7564
%.tmp7575 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp7574)
%.tmp7576 = load %m996$.Node.type*, %m996$.Node.type** %assignable_name.7533
%.tmp7577 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7576, i32 0, i32 8
%.tmp7578 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7577
%.tmp7579 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7578, i32 0, i32 9
%.tmp7580 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7579
%.tmp7581 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7580, i32 0, i32 9
%.tmp7582 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7581
%.tmp7583 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7582, i32 0, i32 1
%.tmp7584 = load i8*, i8** %.tmp7583
%.tmp7585 = call %m2811$.ScopeItem.type*(%m2811$.CompilerCtx.type*,i8*,i8*) @m311$find_defined_str.m2811$.ScopeItem.typep.m2811$.CompilerCtx.typep.cp.cp(%m2811$.CompilerCtx.type* %.tmp7573, i8* %.tmp7575, i8* %.tmp7584)
store %m2811$.ScopeItem.type* %.tmp7585, %m2811$.ScopeItem.type** %scope_info.7544
%.tmp7586 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %scope_info.7544
%.tmp7587 = icmp eq %m2811$.ScopeItem.type* %.tmp7586, null
br i1 %.tmp7587, label %.if.true.7588, label %.if.false.7588
.if.true.7588:
%.tmp7589 = getelementptr i8*, i8** %err_msg.7481, i32 0
%.tmp7591 = getelementptr [31 x i8], [31 x i8]*@.str7590, i32 0, i32 0
%.tmp7592 = load %m996$.Node.type*, %m996$.Node.type** %assignable_name.7533
%.tmp7593 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7592, i32 0, i32 8
%.tmp7594 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7593
%.tmp7595 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7594, i32 0, i32 9
%.tmp7596 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7595
%.tmp7597 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7596, i32 0, i32 9
%.tmp7598 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7597
%.tmp7599 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7598, i32 0, i32 1
%.tmp7600 = load i8*, i8** %.tmp7599
%.tmp7601 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.7564
%.tmp7602 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp7601)
%.tmp7603 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7589, i8* %.tmp7591, i8* %.tmp7600, i8* %.tmp7602)
%.tmp7604 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7605 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.7483
%.tmp7606 = load i8*, i8** %err_msg.7481
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp7604, %m996$.Node.type* %.tmp7605, i8* %.tmp7606)
%.tmp7607 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp7607
br label %.if.end.7588
.if.false.7588:
br label %.if.end.7588
.if.end.7588:
%.tmp7608 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %scope_info.7544
%.tmp7609 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp7608, i32 0, i32 1
%.tmp7610 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %.tmp7609
store %m2811$.AssignableInfo.type* %.tmp7610, %m2811$.AssignableInfo.type** %info.7564
%.tmp7611 = load %m996$.Node.type*, %m996$.Node.type** %assignable_name.7533
%.tmp7612 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7611, i32 0, i32 8
%.tmp7613 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7612
%.tmp7614 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7613, i32 0, i32 9
%.tmp7615 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7614
%.tmp7616 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7615, i32 0, i32 9
%.tmp7617 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7616
store %m996$.Node.type* %.tmp7617, %m996$.Node.type** %assignable_name.7533
br label %.if.end.7572
.if.false.7572:
%.tmp7618 = load %m996$.Node.type*, %m996$.Node.type** %assignable_name.7533
%.tmp7619 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7618, i32 0, i32 8
%.tmp7620 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7619
store %m996$.Node.type* %.tmp7620, %m996$.Node.type** %assignable_name.7533
br label %.if.end.7572
.if.end.7572:
%.tmp7621 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7622 = load %m996$.Node.type*, %m996$.Node.type** %assignable_name.7533
%.tmp7623 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.7564
%.tmp7624 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,%m2811$.AssignableInfo.type*) @m311$get_dotted_name.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp7621, %m996$.Node.type* %.tmp7622, %m2811$.AssignableInfo.type* %.tmp7623)
%base.7625 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp7624, %m2811$.AssignableInfo.type** %base.7625
%.tmp7627 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.7483
%.tmp7628 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7627, i32 0, i32 8
%.tmp7629 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7628
%.tmp7630 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7629, i32 0, i32 9
%.tmp7631 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7630
%addr.7632 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp7631, %m996$.Node.type** %addr.7632
br label %.for.start.7626
.for.start.7626:
%.tmp7633 = load %m996$.Node.type*, %m996$.Node.type** %addr.7632
%.tmp7634 = icmp ne %m996$.Node.type* %.tmp7633, null
br i1 %.tmp7634, label %.for.continue.7626, label %.for.end.7626
.for.continue.7626:
%.tmp7635 = load %m996$.Node.type*, %m996$.Node.type** %addr.7632
%.tmp7636 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7635, i32 0, i32 9
%.tmp7637 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7636
%index.7638 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp7637, %m996$.Node.type** %index.7638
%.tmp7639 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7640 = load %m996$.Node.type*, %m996$.Node.type** %index.7638
%.tmp7641 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_assignable.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp7639, %m996$.Node.type* %.tmp7640)
%index_info.7642 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp7641, %m2811$.AssignableInfo.type** %index_info.7642
%.tmp7643 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7644 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %index_info.7642
%.tmp7645 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7644, i32 0, i32 4
%.tmp7646 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7645
%.tmp7647 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp7643, %m2811$.Type.type* %.tmp7646)
%index_type.7648 = alloca i8*
store i8* %.tmp7647, i8** %index_type.7648
%.tmp7649 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base.7625
%.tmp7650 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7649, i32 0, i32 4
%.tmp7651 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7650
%.tmp7652 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7651, i32 0, i32 1
%.tmp7653 = load i8*, i8** %.tmp7652
%.tmp7654 = icmp ne i8* %.tmp7653, null
br i1 %.tmp7654, label %.if.true.7655, label %.if.false.7655
.if.true.7655:
%.tmp7656 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base.7625
%.tmp7657 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7656, i32 0, i32 4
%.tmp7658 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7657
%.tmp7659 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7658, i32 0, i32 1
%.tmp7660 = load i8*, i8** %.tmp7659
%.tmp7662 = getelementptr [6 x i8], [6 x i8]*@.str7661, i32 0, i32 0
%.tmp7663 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7660, i8* %.tmp7662)
%.tmp7664 = icmp eq i32 %.tmp7663, 0
br i1 %.tmp7664, label %.if.true.7665, label %.if.false.7665
.if.true.7665:
%.tmp7666 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.7483
%.tmp7667 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp7666)
%new_base.7668 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp7667, %m2811$.AssignableInfo.type** %new_base.7668
%.tmp7669 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7670 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_base.7668
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp7669, %m2811$.AssignableInfo.type* %.tmp7670)
%.tmp7671 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7672 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp7671, i32 0, i32 1
%.tmp7673 = load %m0$.File.type*, %m0$.File.type** %.tmp7672
%.tmp7675 = getelementptr [45 x i8], [45 x i8]*@.str7674, i32 0, i32 0
%.tmp7676 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_base.7668
%.tmp7677 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp7676)
%.tmp7678 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7679 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base.7625
%.tmp7680 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7679, i32 0, i32 4
%.tmp7681 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7680
%.tmp7682 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp7678, %m2811$.Type.type* %.tmp7681)
%.tmp7683 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7684 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base.7625
%.tmp7685 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7684, i32 0, i32 4
%.tmp7686 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7685
%.tmp7687 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp7683, %m2811$.Type.type* %.tmp7686)
%.tmp7688 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base.7625
%.tmp7689 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp7688)
%.tmp7690 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7673, i8* %.tmp7675, i8* %.tmp7677, i8* %.tmp7682, i8* %.tmp7687, i8* %.tmp7689)
%.tmp7691 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_base.7668
%.tmp7692 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7691, i32 0, i32 4
%.tmp7693 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base.7625
%.tmp7694 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7693, i32 0, i32 4
%.tmp7695 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7694
%.tmp7696 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7695, i32 0, i32 3
%.tmp7697 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7696
%.tmp7698 = call %m2811$.Type.type*(%m2811$.Type.type*) @m311$type_clone.m2811$.Type.typep.m2811$.Type.typep(%m2811$.Type.type* %.tmp7697)
store %m2811$.Type.type* %.tmp7698, %m2811$.Type.type** %.tmp7692
%.tmp7699 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_base.7668
%.tmp7700 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7699, i32 0, i32 4
%.tmp7701 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7700
%.tmp7702 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7701, i32 0, i32 4
store %m2811$.Type.type* null, %m2811$.Type.type** %.tmp7702
%.tmp7703 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_base.7668
store %m2811$.AssignableInfo.type* %.tmp7703, %m2811$.AssignableInfo.type** %base.7625
br label %.if.end.7665
.if.false.7665:
br label %.if.end.7665
.if.end.7665:
br label %.if.end.7655
.if.false.7655:
br label %.if.end.7655
.if.end.7655:
%.tmp7704 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7705 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base.7625
%.tmp7706 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7705, i32 0, i32 4
%.tmp7707 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7706
%.tmp7708 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp7704, %m2811$.Type.type* %.tmp7707)
%base_type.7709 = alloca i8*
store i8* %.tmp7708, i8** %base_type.7709
%.tmp7710 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7711 = call i32(%m2811$.CompilerCtx.type*) @m311$new_uid.i.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp7710)
%tmp_id.7712 = alloca i32
store i32 %.tmp7711, i32* %tmp_id.7712
%.tmp7713 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7714 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp7713, i32 0, i32 1
%.tmp7715 = load %m0$.File.type*, %m0$.File.type** %.tmp7714
%.tmp7717 = getelementptr [28 x i8], [28 x i8]*@.str7716, i32 0, i32 0
%.tmp7718 = load i32, i32* %tmp_id.7712
%.tmp7719 = load i8*, i8** %base_type.7709
%.tmp7720 = load i8*, i8** %base_type.7709
%.tmp7721 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base.7625
%.tmp7722 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp7721)
%.tmp7723 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7715, i8* %.tmp7717, i32 %.tmp7718, i8* %.tmp7719, i8* %.tmp7720, i8* %.tmp7722)
%.tmp7724 = load %m996$.Node.type*, %m996$.Node.type** %curr_node.7483
%.tmp7725 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp7724)
%new_base.7726 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp7725, %m2811$.AssignableInfo.type** %new_base.7726
%.tmp7727 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7728 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_base.7726
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp7727, %m2811$.AssignableInfo.type* %.tmp7728)
%.tmp7729 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base.7625
%.tmp7730 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7729, i32 0, i32 4
%.tmp7731 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7730
%.tmp7732 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7731, i32 0, i32 3
%.tmp7733 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7732
%.tmp7734 = icmp eq %m2811$.Type.type* %.tmp7733, null
br i1 %.tmp7734, label %.if.true.7735, label %.if.false.7735
.if.true.7735:
%.tmp7736 = getelementptr i8*, i8** %err_msg.7481, i32 0
%.tmp7738 = getelementptr [35 x i8], [35 x i8]*@.str7737, i32 0, i32 0
%.tmp7739 = load i8*, i8** %base_type.7709
%.tmp7740 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp7736, i8* %.tmp7738, i8* %.tmp7739)
%.tmp7741 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7742 = load %m996$.Node.type*, %m996$.Node.type** %addr.7632
%.tmp7743 = load i8*, i8** %err_msg.7481
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp7741, %m996$.Node.type* %.tmp7742, i8* %.tmp7743)
%.tmp7744 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp7744
br label %.if.end.7735
.if.false.7735:
br label %.if.end.7735
.if.end.7735:
%.tmp7745 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_base.7726
%.tmp7746 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7745, i32 0, i32 4
%.tmp7747 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base.7625
%.tmp7748 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7747, i32 0, i32 4
%.tmp7749 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7748
%.tmp7750 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7749, i32 0, i32 3
%.tmp7751 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7750
store %m2811$.Type.type* %.tmp7751, %m2811$.Type.type** %.tmp7746
%.tmp7752 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7753 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_base.7726
%.tmp7754 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7753, i32 0, i32 4
%.tmp7755 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7754
%.tmp7756 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp7752, %m2811$.Type.type* %.tmp7755)
%base_type_2.7757 = alloca i8*
store i8* %.tmp7756, i8** %base_type_2.7757
%.tmp7758 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7759 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp7758, i32 0, i32 1
%.tmp7760 = load %m0$.File.type*, %m0$.File.type** %.tmp7759
%.tmp7762 = getelementptr [44 x i8], [44 x i8]*@.str7761, i32 0, i32 0
%.tmp7763 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_base.7726
%.tmp7764 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp7763)
%.tmp7765 = load i8*, i8** %base_type_2.7757
%.tmp7766 = load i8*, i8** %base_type_2.7757
%.tmp7767 = load i32, i32* %tmp_id.7712
%.tmp7768 = load i8*, i8** %index_type.7648
%.tmp7769 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %index_info.7642
%.tmp7770 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp7769)
%.tmp7771 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7760, i8* %.tmp7762, i8* %.tmp7764, i8* %.tmp7765, i8* %.tmp7766, i32 %.tmp7767, i8* %.tmp7768, i8* %.tmp7770)
%.tmp7772 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %new_base.7726
store %m2811$.AssignableInfo.type* %.tmp7772, %m2811$.AssignableInfo.type** %base.7625
%.tmp7773 = load %m996$.Node.type*, %m996$.Node.type** %addr.7632
%.tmp7774 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7773, i32 0, i32 9
%.tmp7775 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7774
%.tmp7776 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7775, i32 0, i32 9
%.tmp7777 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7776
%.tmp7778 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7777, i32 0, i32 9
%.tmp7779 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7778
store %m996$.Node.type* %.tmp7779, %m996$.Node.type** %addr.7632
br label %.for.start.7626
.for.end.7626:
%.tmp7780 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %base.7625
ret %m2811$.AssignableInfo.type* %.tmp7780
}
%m311$.StackHead.type = type {%m2566$.SYStack.type*}
define %m2811$.AssignableInfo.type* @m311$compile_assignable.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%curr_node = alloca %m996$.Node.type*
store %m996$.Node.type* %.curr_node.arg, %m996$.Node.type** %curr_node
%.tmp7781 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp7782 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7781, i32 0, i32 8
%.tmp7783 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7782
%.tmp7785 = getelementptr [16 x i8], [16 x i8]*@.str7784, i32 0, i32 0
%.tmp7786 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp7783, i8* %.tmp7785)
%assignable_start.7787 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp7786, %m996$.Node.type** %assignable_start.7787
%.tmp7788 = load %m996$.Node.type*, %m996$.Node.type** %assignable_start.7787
%.tmp7789 = call %m2566$.SYStack.type*(%m996$.Node.type*) @m2566$sy_algorithm.m2566$.SYStack.typep.m996$.Node.typep(%m996$.Node.type* %.tmp7788)
%operator_stack.7790 = alloca %m2566$.SYStack.type*
store %m2566$.SYStack.type* %.tmp7789, %m2566$.SYStack.type** %operator_stack.7790
%.tmp7791 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* null, i32 1
%.tmp7792 = ptrtoint %m311$.StackHead.type* %.tmp7791 to i32
%.tmp7793 = call i8*(i32) @malloc(i32 %.tmp7792)
%.tmp7794 = bitcast i8* %.tmp7793 to %m311$.StackHead.type*
%stack.7795 = alloca %m311$.StackHead.type*
store %m311$.StackHead.type* %.tmp7794, %m311$.StackHead.type** %stack.7795
%.tmp7796 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack.7795
%.tmp7797 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* %.tmp7796, i32 0, i32 0
%.tmp7798 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %operator_stack.7790
store %m2566$.SYStack.type* %.tmp7798, %m2566$.SYStack.type** %.tmp7797
%.tmp7799 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7800 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack.7795
%.tmp7801 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m311$.StackHead.type*) @m311$compile_assignable_stack.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m311$.StackHead.typep(%m2811$.CompilerCtx.type* %.tmp7799, %m311$.StackHead.type* %.tmp7800)
%info.7802 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp7801, %m2811$.AssignableInfo.type** %info.7802
%.tmp7803 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.7802
%.tmp7804 = icmp eq %m2811$.AssignableInfo.type* %.tmp7803, null
br i1 %.tmp7804, label %.if.true.7805, label %.if.false.7805
.if.true.7805:
%.tmp7806 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.7802
ret %m2811$.AssignableInfo.type* %.tmp7806
br label %.if.end.7805
.if.false.7805:
br label %.if.end.7805
.if.end.7805:
%.tmp7807 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp7808 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7807, i32 0, i32 8
%.tmp7809 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7808
%.tmp7811 = getelementptr [5 x i8], [5 x i8]*@.str7810, i32 0, i32 0
%.tmp7812 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp7809, i8* %.tmp7811)
%cast.7813 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp7812, %m996$.Node.type** %cast.7813
%.tmp7814 = load %m996$.Node.type*, %m996$.Node.type** %cast.7813
%.tmp7815 = icmp ne %m996$.Node.type* %.tmp7814, null
br i1 %.tmp7815, label %.if.true.7816, label %.if.false.7816
.if.true.7816:
%.tmp7817 = load %m996$.Node.type*, %m996$.Node.type** %cast.7813
%.tmp7818 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7817, i32 0, i32 8
%.tmp7819 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7818
%.tmp7821 = getelementptr [5 x i8], [5 x i8]*@.str7820, i32 0, i32 0
%.tmp7822 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp7819, i8* %.tmp7821)
%cast_type.7823 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp7822, %m996$.Node.type** %cast_type.7823
%.tmp7824 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7825 = load %m996$.Node.type*, %m996$.Node.type** %cast_type.7823
%.tmp7826 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7825, i32 0, i32 8
%.tmp7827 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7826
%.tmp7828 = call %m2811$.Type.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp7824, %m996$.Node.type* %.tmp7827)
%type.7829 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp7828, %m2811$.Type.type** %type.7829
%.tmp7830 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.7802
%.tmp7831 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp7830)
%prev_id.7832 = alloca i8*
store i8* %.tmp7831, i8** %prev_id.7832
%.tmp7833 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7834 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.7802
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp7833, %m2811$.AssignableInfo.type* %.tmp7834)
%.tmp7835 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7836 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.7802
%.tmp7837 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7836, i32 0, i32 4
%.tmp7838 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7837
%.tmp7839 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp7835, %m2811$.Type.type* %.tmp7838)
%from_type.7840 = alloca i8*
store i8* %.tmp7839, i8** %from_type.7840
%.tmp7841 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7842 = load %m2811$.Type.type*, %m2811$.Type.type** %type.7829
%.tmp7843 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp7841, %m2811$.Type.type* %.tmp7842)
%to_type.7844 = alloca i8*
store i8* %.tmp7843, i8** %to_type.7844
%.tmp7846 = getelementptr [8 x i8], [8 x i8]*@.str7845, i32 0, i32 0
%cast_fn.7847 = alloca i8*
store i8* %.tmp7846, i8** %cast_fn.7847
%.tmp7848 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.7802
%.tmp7849 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7848, i32 0, i32 4
%.tmp7850 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7849
%.tmp7851 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7850, i32 0, i32 1
%.tmp7852 = load i8*, i8** %.tmp7851
%.tmp7853 = icmp ne i8* %.tmp7852, null
br i1 %.tmp7853, label %.if.true.7854, label %.if.false.7854
.if.true.7854:
%.tmp7855 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.7802
%.tmp7856 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7855, i32 0, i32 4
%.tmp7857 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7856
%.tmp7858 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7857, i32 0, i32 1
%.tmp7859 = load i8*, i8** %.tmp7858
%.tmp7861 = getelementptr [6 x i8], [6 x i8]*@.str7860, i32 0, i32 0
%.tmp7862 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7859, i8* %.tmp7861)
%.tmp7863 = icmp eq i32 %.tmp7862, 0
br i1 %.tmp7863, label %.if.true.7864, label %.if.false.7864
.if.true.7864:
%.tmp7866 = getelementptr [48 x i8], [48 x i8]*@.str7865, i32 0, i32 0
%.tmp7867 = call i32(i8*,...) @printf(i8* %.tmp7866)
br label %.if.end.7864
.if.false.7864:
br label %.if.end.7864
.if.end.7864:
br label %.if.end.7854
.if.false.7854:
br label %.if.end.7854
.if.end.7854:
%.tmp7868 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.7802
%.tmp7869 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7868, i32 0, i32 4
%.tmp7870 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp7869
%.tmp7871 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7870, i32 0, i32 0
%.tmp7872 = load i8*, i8** %.tmp7871
%.tmp7874 = getelementptr [4 x i8], [4 x i8]*@.str7873, i32 0, i32 0
%.tmp7875 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7872, i8* %.tmp7874)
%.tmp7876 = icmp ne i32 %.tmp7875, 0
%.tmp7877 = load %m2811$.Type.type*, %m2811$.Type.type** %type.7829
%.tmp7878 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp7877, i32 0, i32 0
%.tmp7879 = load i8*, i8** %.tmp7878
%.tmp7881 = getelementptr [4 x i8], [4 x i8]*@.str7880, i32 0, i32 0
%.tmp7882 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7879, i8* %.tmp7881)
%.tmp7883 = icmp ne i32 %.tmp7882, 0
%.tmp7884 = and i1 %.tmp7876, %.tmp7883
br i1 %.tmp7884, label %.if.true.7885, label %.if.false.7885
.if.true.7885:
%.tmp7886 = load i8*, i8** %from_type.7840
%.tmp7887 = getelementptr i8, i8* %.tmp7886, i32 0
%.tmp7888 = load i8, i8* %.tmp7887
%.tmp7889 = icmp eq i8 %.tmp7888, 105
%.tmp7890 = load i8*, i8** %to_type.7844
%.tmp7891 = getelementptr i8, i8* %.tmp7890, i32 0
%.tmp7892 = load i8, i8* %.tmp7891
%.tmp7893 = icmp eq i8 %.tmp7892, 105
%.tmp7894 = and i1 %.tmp7889, %.tmp7893
br i1 %.tmp7894, label %.if.true.7895, label %.if.false.7895
.if.true.7895:
%from_size.7896 = alloca i32
store i32 0, i32* %from_size.7896
%to_size.7897 = alloca i32
store i32 0, i32* %to_size.7897
%.tmp7898 = load i8*, i8** %from_type.7840
%.tmp7900 = getelementptr [4 x i8], [4 x i8]*@.str7899, i32 0, i32 0
%.tmp7901 = getelementptr i32, i32* %from_size.7896, i32 0
%.tmp7902 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7898, i8* %.tmp7900, i32* %.tmp7901)
%.tmp7903 = load i8*, i8** %to_type.7844
%.tmp7905 = getelementptr [4 x i8], [4 x i8]*@.str7904, i32 0, i32 0
%.tmp7906 = getelementptr i32, i32* %to_size.7897, i32 0
%.tmp7907 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp7903, i8* %.tmp7905, i32* %.tmp7906)
%.tmp7908 = load i32, i32* %from_size.7896
%.tmp7909 = load i32, i32* %to_size.7897
%.tmp7910 = icmp slt i32 %.tmp7908, %.tmp7909
br i1 %.tmp7910, label %.if.true.7911, label %.if.false.7911
.if.true.7911:
%.tmp7913 = getelementptr [5 x i8], [5 x i8]*@.str7912, i32 0, i32 0
store i8* %.tmp7913, i8** %cast_fn.7847
br label %.if.end.7911
.if.false.7911:
%.tmp7915 = getelementptr [6 x i8], [6 x i8]*@.str7914, i32 0, i32 0
store i8* %.tmp7915, i8** %cast_fn.7847
br label %.if.end.7911
.if.end.7911:
br label %.if.end.7895
.if.false.7895:
br label %.if.end.7895
.if.end.7895:
br label %.if.end.7885
.if.false.7885:
br label %.if.end.7885
.if.end.7885:
%.tmp7916 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7917 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp7916, i32 0, i32 1
%.tmp7918 = load %m0$.File.type*, %m0$.File.type** %.tmp7917
%.tmp7920 = getelementptr [21 x i8], [21 x i8]*@.str7919, i32 0, i32 0
%.tmp7921 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.7802
%.tmp7922 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp7921)
%.tmp7923 = load i8*, i8** %cast_fn.7847
%.tmp7924 = load i8*, i8** %from_type.7840
%.tmp7925 = load i8*, i8** %prev_id.7832
%.tmp7926 = load i8*, i8** %to_type.7844
%.tmp7927 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp7918, i8* %.tmp7920, i8* %.tmp7922, i8* %.tmp7923, i8* %.tmp7924, i8* %.tmp7925, i8* %.tmp7926)
%.tmp7928 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.7802
%.tmp7929 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7928, i32 0, i32 4
%.tmp7930 = load %m2811$.Type.type*, %m2811$.Type.type** %type.7829
store %m2811$.Type.type* %.tmp7930, %m2811$.Type.type** %.tmp7929
br label %.if.end.7816
.if.false.7816:
br label %.if.end.7816
.if.end.7816:
%.tmp7931 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.7802
ret %m2811$.AssignableInfo.type* %.tmp7931
}
define %m2811$.AssignableInfo.type* @m311$compile_assignable_stack.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m311$.StackHead.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m311$.StackHead.type* %.stack.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stack = alloca %m311$.StackHead.type*
store %m311$.StackHead.type* %.stack.arg, %m311$.StackHead.type** %stack
%.tmp7932 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp7933 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* %.tmp7932, i32 0, i32 0
%.tmp7934 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %.tmp7933
%.tmp7935 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp7934, i32 0, i32 0
%.tmp7936 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7935
%.tmp7937 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7936, i32 0, i32 0
%.tmp7938 = load i8*, i8** %.tmp7937
%.tmp7940 = getelementptr [16 x i8], [16 x i8]*@.str7939, i32 0, i32 0
%.tmp7941 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp7938, i8* %.tmp7940)
%.tmp7942 = icmp eq i32 %.tmp7941, 0
br i1 %.tmp7942, label %.if.true.7943, label %.if.false.7943
.if.true.7943:
%.tmp7944 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7945 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp7946 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* %.tmp7945, i32 0, i32 0
%.tmp7947 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %.tmp7946
%.tmp7948 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp7947, i32 0, i32 0
%.tmp7949 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7948
%.tmp7950 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_mono_assignable.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp7944, %m996$.Node.type* %.tmp7949)
ret %m2811$.AssignableInfo.type* %.tmp7950
br label %.if.end.7943
.if.false.7943:
br label %.if.end.7943
.if.end.7943:
%.tmp7951 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp7952 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* %.tmp7951, i32 0, i32 0
%.tmp7953 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %.tmp7952
%.tmp7954 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp7953, i32 0, i32 0
%.tmp7955 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7954
%.tmp7956 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp7955, i32 0, i32 8
%.tmp7957 = load %m996$.Node.type*, %m996$.Node.type** %.tmp7956
%operator.7958 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp7957, %m996$.Node.type** %operator.7958
%.tmp7959 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp7960 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* %.tmp7959, i32 0, i32 0
%.tmp7961 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp7962 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* %.tmp7961, i32 0, i32 0
%.tmp7963 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %.tmp7962
%.tmp7964 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp7963, i32 0, i32 1
%.tmp7965 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %.tmp7964
store %m2566$.SYStack.type* %.tmp7965, %m2566$.SYStack.type** %.tmp7960
%.tmp7966 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7967 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp7968 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m311$.StackHead.type*) @m311$compile_assignable_stack.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m311$.StackHead.typep(%m2811$.CompilerCtx.type* %.tmp7966, %m311$.StackHead.type* %.tmp7967)
%A.7969 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp7968, %m2811$.AssignableInfo.type** %A.7969
%.tmp7970 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %A.7969
%.tmp7971 = icmp eq %m2811$.AssignableInfo.type* %.tmp7970, null
br i1 %.tmp7971, label %.if.true.7972, label %.if.false.7972
.if.true.7972:
%.tmp7973 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %A.7969
ret %m2811$.AssignableInfo.type* %.tmp7973
br label %.if.end.7972
.if.false.7972:
br label %.if.end.7972
.if.end.7972:
%.tmp7974 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp7975 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* %.tmp7974, i32 0, i32 0
%.tmp7976 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp7977 = getelementptr %m311$.StackHead.type, %m311$.StackHead.type* %.tmp7976, i32 0, i32 0
%.tmp7978 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %.tmp7977
%.tmp7979 = getelementptr %m2566$.SYStack.type, %m2566$.SYStack.type* %.tmp7978, i32 0, i32 1
%.tmp7980 = load %m2566$.SYStack.type*, %m2566$.SYStack.type** %.tmp7979
store %m2566$.SYStack.type* %.tmp7980, %m2566$.SYStack.type** %.tmp7975
%.tmp7981 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7982 = load %m311$.StackHead.type*, %m311$.StackHead.type** %stack
%.tmp7983 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m311$.StackHead.type*) @m311$compile_assignable_stack.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m311$.StackHead.typep(%m2811$.CompilerCtx.type* %.tmp7981, %m311$.StackHead.type* %.tmp7982)
%B.7984 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp7983, %m2811$.AssignableInfo.type** %B.7984
%.tmp7985 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %B.7984
%.tmp7986 = icmp eq %m2811$.AssignableInfo.type* %.tmp7985, null
br i1 %.tmp7986, label %.if.true.7987, label %.if.false.7987
.if.true.7987:
%.tmp7988 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %B.7984
ret %m2811$.AssignableInfo.type* %.tmp7988
br label %.if.end.7987
.if.false.7987:
br label %.if.end.7987
.if.end.7987:
%.tmp7989 = bitcast ptr null to %m996$.Node.type*
%.tmp7990 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp7989)
%op_info.7991 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp7990, %m2811$.AssignableInfo.type** %op_info.7991
%.tmp7992 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %op_info.7991
%.tmp7993 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp7992, i32 0, i32 4
%.tmp7994 = load %m996$.Node.type*, %m996$.Node.type** %operator.7958
%.tmp7995 = call %m2811$.Type.type*(%m996$.Node.type*) @m311$operator_type.m2811$.Type.typep.m996$.Node.typep(%m996$.Node.type* %.tmp7994)
store %m2811$.Type.type* %.tmp7995, %m2811$.Type.type** %.tmp7993
%.tmp7996 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7997 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %op_info.7991
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp7996, %m2811$.AssignableInfo.type* %.tmp7997)
%.tmp7998 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp7999 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp7998, i32 0, i32 1
%.tmp8000 = load %m0$.File.type*, %m0$.File.type** %.tmp7999
%.tmp8002 = getelementptr [19 x i8], [19 x i8]*@.str8001, i32 0, i32 0
%.tmp8003 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %op_info.7991
%.tmp8004 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp8003)
%.tmp8005 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8006 = load %m996$.Node.type*, %m996$.Node.type** %operator.7958
%.tmp8007 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$operator_op.cp.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp8005, %m996$.Node.type* %.tmp8006)
%.tmp8008 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8009 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %A.7969
%.tmp8010 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8009, i32 0, i32 4
%.tmp8011 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8010
%.tmp8012 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp8008, %m2811$.Type.type* %.tmp8011)
%.tmp8013 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %A.7969
%.tmp8014 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp8013)
%.tmp8015 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %B.7984
%.tmp8016 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp8015)
%.tmp8017 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8000, i8* %.tmp8002, i8* %.tmp8004, i8* %.tmp8007, i8* %.tmp8012, i8* %.tmp8014, i8* %.tmp8016)
%.tmp8018 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %op_info.7991
ret %m2811$.AssignableInfo.type* %.tmp8018
}
define i8* @m311$operator_op.cp.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.op.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%op = alloca %m996$.Node.type*
store %m996$.Node.type* %.op.arg, %m996$.Node.type** %op
%.tmp8019 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8020 = icmp eq %m996$.Node.type* %.tmp8019, null
br i1 %.tmp8020, label %.if.true.8021, label %.if.false.8021
.if.true.8021:
%.tmp8022 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8023 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8025 = getelementptr [31 x i8], [31 x i8]*@.str8024, i32 0, i32 0
%.tmp8026 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp8022, %m996$.Node.type* %.tmp8023, i8* %.tmp8025)
%.tmp8027 = call i32(i8*,...) @printf(i8* %.tmp8026)
br label %.if.end.8021
.if.false.8021:
br label %.if.end.8021
.if.end.8021:
%.tmp8028 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8029 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8028, i32 0, i32 1
%.tmp8030 = load i8*, i8** %.tmp8029
%.tmp8032 = getelementptr [2 x i8], [2 x i8]*@.str8031, i32 0, i32 0
%.tmp8033 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8030, i8* %.tmp8032)
%.tmp8034 = icmp eq i32 %.tmp8033, 0
br i1 %.tmp8034, label %.if.true.8035, label %.if.false.8035
.if.true.8035:
%.tmp8037 = getelementptr [4 x i8], [4 x i8]*@.str8036, i32 0, i32 0
ret i8* %.tmp8037
br label %.if.end.8035
.if.false.8035:
%.tmp8038 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8039 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8038, i32 0, i32 1
%.tmp8040 = load i8*, i8** %.tmp8039
%.tmp8042 = getelementptr [2 x i8], [2 x i8]*@.str8041, i32 0, i32 0
%.tmp8043 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8040, i8* %.tmp8042)
%.tmp8044 = icmp eq i32 %.tmp8043, 0
br i1 %.tmp8044, label %.if.true.8045, label %.if.false.8045
.if.true.8045:
%.tmp8047 = getelementptr [4 x i8], [4 x i8]*@.str8046, i32 0, i32 0
ret i8* %.tmp8047
br label %.if.end.8045
.if.false.8045:
%.tmp8048 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8049 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8048, i32 0, i32 1
%.tmp8050 = load i8*, i8** %.tmp8049
%.tmp8052 = getelementptr [2 x i8], [2 x i8]*@.str8051, i32 0, i32 0
%.tmp8053 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8050, i8* %.tmp8052)
%.tmp8054 = icmp eq i32 %.tmp8053, 0
br i1 %.tmp8054, label %.if.true.8055, label %.if.false.8055
.if.true.8055:
%.tmp8057 = getelementptr [4 x i8], [4 x i8]*@.str8056, i32 0, i32 0
ret i8* %.tmp8057
br label %.if.end.8055
.if.false.8055:
%.tmp8058 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8059 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8058, i32 0, i32 1
%.tmp8060 = load i8*, i8** %.tmp8059
%.tmp8062 = getelementptr [2 x i8], [2 x i8]*@.str8061, i32 0, i32 0
%.tmp8063 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8060, i8* %.tmp8062)
%.tmp8064 = icmp eq i32 %.tmp8063, 0
br i1 %.tmp8064, label %.if.true.8065, label %.if.false.8065
.if.true.8065:
%.tmp8067 = getelementptr [5 x i8], [5 x i8]*@.str8066, i32 0, i32 0
ret i8* %.tmp8067
br label %.if.end.8065
.if.false.8065:
%.tmp8068 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8069 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8068, i32 0, i32 1
%.tmp8070 = load i8*, i8** %.tmp8069
%.tmp8072 = getelementptr [3 x i8], [3 x i8]*@.str8071, i32 0, i32 0
%.tmp8073 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8070, i8* %.tmp8072)
%.tmp8074 = icmp eq i32 %.tmp8073, 0
br i1 %.tmp8074, label %.if.true.8075, label %.if.false.8075
.if.true.8075:
%.tmp8077 = getelementptr [8 x i8], [8 x i8]*@.str8076, i32 0, i32 0
ret i8* %.tmp8077
br label %.if.end.8075
.if.false.8075:
%.tmp8078 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8079 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8078, i32 0, i32 1
%.tmp8080 = load i8*, i8** %.tmp8079
%.tmp8082 = getelementptr [3 x i8], [3 x i8]*@.str8081, i32 0, i32 0
%.tmp8083 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8080, i8* %.tmp8082)
%.tmp8084 = icmp eq i32 %.tmp8083, 0
br i1 %.tmp8084, label %.if.true.8085, label %.if.false.8085
.if.true.8085:
%.tmp8087 = getelementptr [8 x i8], [8 x i8]*@.str8086, i32 0, i32 0
ret i8* %.tmp8087
br label %.if.end.8085
.if.false.8085:
%.tmp8088 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8089 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8088, i32 0, i32 1
%.tmp8090 = load i8*, i8** %.tmp8089
%.tmp8092 = getelementptr [2 x i8], [2 x i8]*@.str8091, i32 0, i32 0
%.tmp8093 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8090, i8* %.tmp8092)
%.tmp8094 = icmp eq i32 %.tmp8093, 0
br i1 %.tmp8094, label %.if.true.8095, label %.if.false.8095
.if.true.8095:
%.tmp8097 = getelementptr [9 x i8], [9 x i8]*@.str8096, i32 0, i32 0
ret i8* %.tmp8097
br label %.if.end.8095
.if.false.8095:
%.tmp8098 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8099 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8098, i32 0, i32 1
%.tmp8100 = load i8*, i8** %.tmp8099
%.tmp8102 = getelementptr [2 x i8], [2 x i8]*@.str8101, i32 0, i32 0
%.tmp8103 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8100, i8* %.tmp8102)
%.tmp8104 = icmp eq i32 %.tmp8103, 0
br i1 %.tmp8104, label %.if.true.8105, label %.if.false.8105
.if.true.8105:
%.tmp8107 = getelementptr [9 x i8], [9 x i8]*@.str8106, i32 0, i32 0
ret i8* %.tmp8107
br label %.if.end.8105
.if.false.8105:
%.tmp8108 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8109 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8108, i32 0, i32 1
%.tmp8110 = load i8*, i8** %.tmp8109
%.tmp8112 = getelementptr [2 x i8], [2 x i8]*@.str8111, i32 0, i32 0
%.tmp8113 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8110, i8* %.tmp8112)
%.tmp8114 = icmp eq i32 %.tmp8113, 0
br i1 %.tmp8114, label %.if.true.8115, label %.if.false.8115
.if.true.8115:
%.tmp8117 = getelementptr [4 x i8], [4 x i8]*@.str8116, i32 0, i32 0
ret i8* %.tmp8117
br label %.if.end.8115
.if.false.8115:
%.tmp8118 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8119 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8118, i32 0, i32 1
%.tmp8120 = load i8*, i8** %.tmp8119
%.tmp8122 = getelementptr [2 x i8], [2 x i8]*@.str8121, i32 0, i32 0
%.tmp8123 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8120, i8* %.tmp8122)
%.tmp8124 = icmp eq i32 %.tmp8123, 0
br i1 %.tmp8124, label %.if.true.8125, label %.if.false.8125
.if.true.8125:
%.tmp8127 = getelementptr [3 x i8], [3 x i8]*@.str8126, i32 0, i32 0
ret i8* %.tmp8127
br label %.if.end.8125
.if.false.8125:
%.tmp8128 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8129 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8128, i32 0, i32 1
%.tmp8130 = load i8*, i8** %.tmp8129
%.tmp8132 = getelementptr [3 x i8], [3 x i8]*@.str8131, i32 0, i32 0
%.tmp8133 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8130, i8* %.tmp8132)
%.tmp8134 = icmp eq i32 %.tmp8133, 0
br i1 %.tmp8134, label %.if.true.8135, label %.if.false.8135
.if.true.8135:
%.tmp8137 = getelementptr [9 x i8], [9 x i8]*@.str8136, i32 0, i32 0
ret i8* %.tmp8137
br label %.if.end.8135
.if.false.8135:
%.tmp8138 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8139 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8138, i32 0, i32 1
%.tmp8140 = load i8*, i8** %.tmp8139
%.tmp8142 = getelementptr [3 x i8], [3 x i8]*@.str8141, i32 0, i32 0
%.tmp8143 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8140, i8* %.tmp8142)
%.tmp8144 = icmp eq i32 %.tmp8143, 0
br i1 %.tmp8144, label %.if.true.8145, label %.if.false.8145
.if.true.8145:
%.tmp8147 = getelementptr [9 x i8], [9 x i8]*@.str8146, i32 0, i32 0
ret i8* %.tmp8147
br label %.if.end.8145
.if.false.8145:
%.tmp8148 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8149 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8148, i32 0, i32 1
%.tmp8150 = load i8*, i8** %.tmp8149
%.tmp8152 = getelementptr [2 x i8], [2 x i8]*@.str8151, i32 0, i32 0
%.tmp8153 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8150, i8* %.tmp8152)
%.tmp8154 = icmp eq i32 %.tmp8153, 0
br i1 %.tmp8154, label %.if.true.8155, label %.if.false.8155
.if.true.8155:
%.tmp8157 = getelementptr [5 x i8], [5 x i8]*@.str8156, i32 0, i32 0
ret i8* %.tmp8157
br label %.if.end.8155
.if.false.8155:
%.tmp8158 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8159 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8161 = getelementptr [30 x i8], [30 x i8]*@.str8160, i32 0, i32 0
%.tmp8162 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp8158, %m996$.Node.type* %.tmp8159, i8* %.tmp8161)
%.tmp8163 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8164 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8163, i32 0, i32 1
%.tmp8165 = load i8*, i8** %.tmp8164
%.tmp8166 = call i32(i8*,...) @printf(i8* %.tmp8162, i8* %.tmp8165)
br label %.if.end.8155
.if.end.8155:
br label %.if.end.8145
.if.end.8145:
br label %.if.end.8135
.if.end.8135:
br label %.if.end.8125
.if.end.8125:
br label %.if.end.8115
.if.end.8115:
br label %.if.end.8105
.if.end.8105:
br label %.if.end.8095
.if.end.8095:
br label %.if.end.8085
.if.end.8085:
br label %.if.end.8075
.if.end.8075:
br label %.if.end.8065
.if.end.8065:
br label %.if.end.8055
.if.end.8055:
br label %.if.end.8045
.if.end.8045:
br label %.if.end.8035
.if.end.8035:
%.tmp8168 = getelementptr [4 x i8], [4 x i8]*@.str8167, i32 0, i32 0
ret i8* %.tmp8168
}
define %m2811$.Type.type* @m311$operator_type.m2811$.Type.typep.m996$.Node.typep(%m996$.Node.type* %.op.arg) {
%op = alloca %m996$.Node.type*
store %m996$.Node.type* %.op.arg, %m996$.Node.type** %op
%.tmp8169 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
%type.8170 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp8169, %m2811$.Type.type** %type.8170
%.tmp8171 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8172 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8171, i32 0, i32 1
%.tmp8173 = load i8*, i8** %.tmp8172
%.tmp8175 = getelementptr [3 x i8], [3 x i8]*@.str8174, i32 0, i32 0
%.tmp8176 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8173, i8* %.tmp8175)
%.tmp8177 = icmp eq i32 %.tmp8176, 0
%.tmp8178 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8179 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8178, i32 0, i32 1
%.tmp8180 = load i8*, i8** %.tmp8179
%.tmp8182 = getelementptr [3 x i8], [3 x i8]*@.str8181, i32 0, i32 0
%.tmp8183 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8180, i8* %.tmp8182)
%.tmp8184 = icmp eq i32 %.tmp8183, 0
%.tmp8185 = or i1 %.tmp8177, %.tmp8184
%.tmp8186 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8187 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8186, i32 0, i32 1
%.tmp8188 = load i8*, i8** %.tmp8187
%.tmp8190 = getelementptr [2 x i8], [2 x i8]*@.str8189, i32 0, i32 0
%.tmp8191 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8188, i8* %.tmp8190)
%.tmp8192 = icmp eq i32 %.tmp8191, 0
%.tmp8193 = or i1 %.tmp8185, %.tmp8192
%.tmp8194 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8195 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8194, i32 0, i32 1
%.tmp8196 = load i8*, i8** %.tmp8195
%.tmp8198 = getelementptr [2 x i8], [2 x i8]*@.str8197, i32 0, i32 0
%.tmp8199 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8196, i8* %.tmp8198)
%.tmp8200 = icmp eq i32 %.tmp8199, 0
%.tmp8201 = or i1 %.tmp8193, %.tmp8200
%.tmp8202 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8203 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8202, i32 0, i32 1
%.tmp8204 = load i8*, i8** %.tmp8203
%.tmp8206 = getelementptr [2 x i8], [2 x i8]*@.str8205, i32 0, i32 0
%.tmp8207 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8204, i8* %.tmp8206)
%.tmp8208 = icmp eq i32 %.tmp8207, 0
%.tmp8209 = or i1 %.tmp8201, %.tmp8208
%.tmp8210 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8211 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8210, i32 0, i32 1
%.tmp8212 = load i8*, i8** %.tmp8211
%.tmp8214 = getelementptr [2 x i8], [2 x i8]*@.str8213, i32 0, i32 0
%.tmp8215 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8212, i8* %.tmp8214)
%.tmp8216 = icmp eq i32 %.tmp8215, 0
%.tmp8217 = or i1 %.tmp8209, %.tmp8216
%.tmp8218 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8219 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8218, i32 0, i32 1
%.tmp8220 = load i8*, i8** %.tmp8219
%.tmp8222 = getelementptr [3 x i8], [3 x i8]*@.str8221, i32 0, i32 0
%.tmp8223 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8220, i8* %.tmp8222)
%.tmp8224 = icmp eq i32 %.tmp8223, 0
%.tmp8225 = or i1 %.tmp8217, %.tmp8224
%.tmp8226 = load %m996$.Node.type*, %m996$.Node.type** %op
%.tmp8227 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8226, i32 0, i32 1
%.tmp8228 = load i8*, i8** %.tmp8227
%.tmp8230 = getelementptr [3 x i8], [3 x i8]*@.str8229, i32 0, i32 0
%.tmp8231 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8228, i8* %.tmp8230)
%.tmp8232 = icmp eq i32 %.tmp8231, 0
%.tmp8233 = or i1 %.tmp8225, %.tmp8232
br i1 %.tmp8233, label %.if.true.8234, label %.if.false.8234
.if.true.8234:
%.tmp8235 = load %m2811$.Type.type*, %m2811$.Type.type** %type.8170
%.tmp8236 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8235, i32 0, i32 0
%.tmp8238 = getelementptr [5 x i8], [5 x i8]*@.str8237, i32 0, i32 0
store i8* %.tmp8238, i8** %.tmp8236
br label %.if.end.8234
.if.false.8234:
%.tmp8239 = load %m2811$.Type.type*, %m2811$.Type.type** %type.8170
%.tmp8240 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8239, i32 0, i32 0
%.tmp8242 = getelementptr [4 x i8], [4 x i8]*@.str8241, i32 0, i32 0
store i8* %.tmp8242, i8** %.tmp8240
br label %.if.end.8234
.if.end.8234:
%.tmp8243 = load %m2811$.Type.type*, %m2811$.Type.type** %type.8170
ret %m2811$.Type.type* %.tmp8243
}
define %m2811$.AssignableInfo.type* @m311$compile_mono_assignable.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.curr_node.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%curr_node = alloca %m996$.Node.type*
store %m996$.Node.type* %.curr_node.arg, %m996$.Node.type** %curr_node
%.tmp8244 = bitcast ptr null to %m2811$.AssignableInfo.type*
%assignable_info.8245 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp8244, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8246 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%mono.8247 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp8246, %m996$.Node.type** %mono.8247
%.tmp8249 = getelementptr [1 x i8], [1 x i8]*@.str8248, i32 0, i32 0
%err_buf.8250 = alloca i8*
store i8* %.tmp8249, i8** %err_buf.8250
%.tmp8252 = getelementptr [1 x i8], [1 x i8]*@.str8251, i32 0, i32 0
%buf.8253 = alloca i8*
store i8* %.tmp8252, i8** %buf.8253
%.tmp8254 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8255 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8254, i32 0, i32 8
%.tmp8256 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8255
%.tmp8257 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8256, i32 0, i32 0
%.tmp8258 = load i8*, i8** %.tmp8257
%.tmp8260 = getelementptr [7 x i8], [7 x i8]*@.str8259, i32 0, i32 0
%.tmp8261 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8258, i8* %.tmp8260)
%.tmp8262 = icmp eq i32 %.tmp8261, 0
br i1 %.tmp8262, label %.if.true.8263, label %.if.false.8263
.if.true.8263:
%.tmp8264 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp8265 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8264)
store %m2811$.AssignableInfo.type* %.tmp8265, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8266 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8267 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8266, i32 0, i32 4
%.tmp8268 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp8268, %m2811$.Type.type** %.tmp8267
%.tmp8269 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8270 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8269, i32 0, i32 4
%.tmp8271 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8270
%.tmp8272 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8271, i32 0, i32 0
%.tmp8274 = getelementptr [4 x i8], [4 x i8]*@.str8273, i32 0, i32 0
store i8* %.tmp8274, i8** %.tmp8272
%.tmp8275 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8276 = load i8, i8* @SCOPE_CONST
%.tmp8277 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8278 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8277, i32 0, i32 8
%.tmp8279 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8278
%.tmp8280 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8279, i32 0, i32 1
%.tmp8281 = load i8*, i8** %.tmp8280
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp8275, i8 %.tmp8276, i8* %.tmp8281)
br label %.if.end.8263
.if.false.8263:
%.tmp8282 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8283 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8282, i32 0, i32 8
%.tmp8284 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8283
%.tmp8285 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8284, i32 0, i32 0
%.tmp8286 = load i8*, i8** %.tmp8285
%.tmp8288 = getelementptr [5 x i8], [5 x i8]*@.str8287, i32 0, i32 0
%.tmp8289 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8286, i8* %.tmp8288)
%.tmp8290 = icmp eq i32 %.tmp8289, 0
br i1 %.tmp8290, label %.if.true.8291, label %.if.false.8291
.if.true.8291:
%.tmp8292 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8293 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8292, i32 0, i32 8
%.tmp8294 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8293
%.tmp8295 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8294, i32 0, i32 1
%.tmp8296 = load i8*, i8** %.tmp8295
%.tmp8298 = getelementptr [5 x i8], [5 x i8]*@.str8297, i32 0, i32 0
%.tmp8299 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8296, i8* %.tmp8298)
%.tmp8300 = icmp ne i32 %.tmp8299, 0
br i1 %.tmp8300, label %.if.true.8301, label %.if.false.8301
.if.true.8301:
%.tmp8302 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8303 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp8305 = getelementptr [42 x i8], [42 x i8]*@.str8304, i32 0, i32 0
%.tmp8306 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp8302, %m996$.Node.type* %.tmp8303, i8* %.tmp8305)
%.tmp8307 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8308 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8307, i32 0, i32 8
%.tmp8309 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8308
%.tmp8310 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8309, i32 0, i32 1
%.tmp8311 = load i8*, i8** %.tmp8310
%.tmp8312 = call i32(i8*,...) @printf(i8* %.tmp8306, i8* %.tmp8311)
%.tmp8313 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp8313
br label %.if.end.8301
.if.false.8301:
br label %.if.end.8301
.if.end.8301:
%.tmp8314 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp8315 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8314)
store %m2811$.AssignableInfo.type* %.tmp8315, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8316 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8317 = load i8, i8* @SCOPE_CONST
%.tmp8319 = getelementptr [5 x i8], [5 x i8]*@.str8318, i32 0, i32 0
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp8316, i8 %.tmp8317, i8* %.tmp8319)
%.tmp8320 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8321 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8320, i32 0, i32 4
%.tmp8322 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp8322, %m2811$.Type.type** %.tmp8321
%.tmp8323 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8324 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8323, i32 0, i32 4
%.tmp8325 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8324
%.tmp8326 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8325, i32 0, i32 0
%.tmp8328 = getelementptr [8 x i8], [8 x i8]*@.str8327, i32 0, i32 0
store i8* %.tmp8328, i8** %.tmp8326
br label %.if.end.8291
.if.false.8291:
%.tmp8329 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8330 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8329, i32 0, i32 8
%.tmp8331 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8330
%.tmp8332 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8331, i32 0, i32 0
%.tmp8333 = load i8*, i8** %.tmp8332
%.tmp8335 = getelementptr [17 x i8], [17 x i8]*@.str8334, i32 0, i32 0
%.tmp8336 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8333, i8* %.tmp8335)
%.tmp8337 = icmp eq i32 %.tmp8336, 0
br i1 %.tmp8337, label %.if.true.8338, label %.if.false.8338
.if.true.8338:
%.tmp8339 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp8340 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8339)
store %m2811$.AssignableInfo.type* %.tmp8340, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8341 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8342 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8341, i32 0, i32 8
%.tmp8343 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8342
%.tmp8344 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8343, i32 0, i32 8
%.tmp8345 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8344
%.tmp8347 = getelementptr [12 x i8], [12 x i8]*@.str8346, i32 0, i32 0
%.tmp8348 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp8345, i8* %.tmp8347)
%dest.8349 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp8348, %m996$.Node.type** %dest.8349
%.tmp8350 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8351 = load %m996$.Node.type*, %m996$.Node.type** %dest.8349
%.tmp8352 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_addr.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp8350, %m996$.Node.type* %.tmp8351)
%var_info.8353 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp8352, %m2811$.AssignableInfo.type** %var_info.8353
%.tmp8354 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %var_info.8353
%.tmp8355 = icmp eq %m2811$.AssignableInfo.type* %.tmp8354, null
br i1 %.tmp8355, label %.if.true.8356, label %.if.false.8356
.if.true.8356:
%.tmp8357 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp8357
br label %.if.end.8356
.if.false.8356:
br label %.if.end.8356
.if.end.8356:
%.tmp8358 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %var_info.8353
%.tmp8359 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8358, i32 0, i32 4
%.tmp8360 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8359
%.tmp8361 = icmp eq %m2811$.Type.type* %.tmp8360, null
br i1 %.tmp8361, label %.if.true.8362, label %.if.false.8362
.if.true.8362:
%.tmp8363 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp8363
br label %.if.end.8362
.if.false.8362:
br label %.if.end.8362
.if.end.8362:
%.tmp8364 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8365 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %var_info.8353
%.tmp8366 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8365, i32 0, i32 4
%.tmp8367 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8366
%.tmp8368 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp8364, %m2811$.Type.type* %.tmp8367)
%var_type_repr.8369 = alloca i8*
store i8* %.tmp8368, i8** %var_type_repr.8369
%.tmp8370 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8371 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp8370, %m2811$.AssignableInfo.type* %.tmp8371)
%.tmp8372 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8373 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8372, i32 0, i32 4
%.tmp8374 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %var_info.8353
%.tmp8375 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8374, i32 0, i32 4
%.tmp8376 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8375
store %m2811$.Type.type* %.tmp8376, %m2811$.Type.type** %.tmp8373
%.tmp8378 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8379 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8378, i32 0, i32 8
%.tmp8380 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8379
%.tmp8381 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8380, i32 0, i32 8
%.tmp8382 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8381
%ptr.8383 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp8382, %m996$.Node.type** %ptr.8383
br label %.for.start.8377
.for.start.8377:
%.tmp8384 = load %m996$.Node.type*, %m996$.Node.type** %ptr.8383
%.tmp8385 = load %m996$.Node.type*, %m996$.Node.type** %dest.8349
%.tmp8386 = icmp ne %m996$.Node.type* %.tmp8384, %.tmp8385
br i1 %.tmp8386, label %.for.continue.8377, label %.for.end.8377
.for.continue.8377:
%.tmp8387 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
%type.8388 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp8387, %m2811$.Type.type** %type.8388
%.tmp8389 = load %m2811$.Type.type*, %m2811$.Type.type** %type.8388
%.tmp8390 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8389, i32 0, i32 3
%.tmp8391 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8392 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8391, i32 0, i32 4
%.tmp8393 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8392
store %m2811$.Type.type* %.tmp8393, %m2811$.Type.type** %.tmp8390
%.tmp8394 = load %m2811$.Type.type*, %m2811$.Type.type** %type.8388
%.tmp8395 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8394, i32 0, i32 0
%.tmp8397 = getelementptr [4 x i8], [4 x i8]*@.str8396, i32 0, i32 0
store i8* %.tmp8397, i8** %.tmp8395
%.tmp8398 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8399 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8398, i32 0, i32 4
%.tmp8400 = load %m2811$.Type.type*, %m2811$.Type.type** %type.8388
store %m2811$.Type.type* %.tmp8400, %m2811$.Type.type** %.tmp8399
%.tmp8401 = load %m996$.Node.type*, %m996$.Node.type** %ptr.8383
%.tmp8402 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8401, i32 0, i32 9
%.tmp8403 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8402
store %m996$.Node.type* %.tmp8403, %m996$.Node.type** %ptr.8383
br label %.for.start.8377
.for.end.8377:
%.tmp8404 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8405 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8404, i32 0, i32 8
%.tmp8406 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8405
%.tmp8407 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8406, i32 0, i32 8
%.tmp8408 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8407
%.tmp8409 = load %m996$.Node.type*, %m996$.Node.type** %dest.8349
%.tmp8410 = icmp ne %m996$.Node.type* %.tmp8408, %.tmp8409
br i1 %.tmp8410, label %.if.true.8411, label %.if.false.8411
.if.true.8411:
%.tmp8412 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8413 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp8412, i32 0, i32 1
%.tmp8414 = load %m0$.File.type*, %m0$.File.type** %.tmp8413
%.tmp8416 = getelementptr [38 x i8], [38 x i8]*@.str8415, i32 0, i32 0
%.tmp8417 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8418 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp8417)
%.tmp8419 = load i8*, i8** %var_type_repr.8369
%.tmp8420 = load i8*, i8** %var_type_repr.8369
%.tmp8421 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %var_info.8353
%.tmp8422 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp8421)
%.tmp8423 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8414, i8* %.tmp8416, i8* %.tmp8418, i8* %.tmp8419, i8* %.tmp8420, i8* %.tmp8422)
br label %.if.end.8411
.if.false.8411:
%.tmp8424 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8425 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8424, i32 0, i32 4
%.tmp8426 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8425
%.tmp8427 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8426, i32 0, i32 0
%.tmp8428 = load i8*, i8** %.tmp8427
%.tmp8430 = getelementptr [9 x i8], [9 x i8]*@.str8429, i32 0, i32 0
%.tmp8431 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8428, i8* %.tmp8430)
%.tmp8432 = icmp eq i32 %.tmp8431, 0
br i1 %.tmp8432, label %.if.true.8433, label %.if.false.8433
.if.true.8433:
%.tmp8434 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %var_info.8353
store %m2811$.AssignableInfo.type* %.tmp8434, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8435 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
%type.8436 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp8435, %m2811$.Type.type** %type.8436
%.tmp8437 = load %m2811$.Type.type*, %m2811$.Type.type** %type.8436
%.tmp8438 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8437, i32 0, i32 3
%.tmp8439 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8440 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8439, i32 0, i32 4
%.tmp8441 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8440
store %m2811$.Type.type* %.tmp8441, %m2811$.Type.type** %.tmp8438
%.tmp8442 = load %m2811$.Type.type*, %m2811$.Type.type** %type.8436
%.tmp8443 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8442, i32 0, i32 0
%.tmp8445 = getelementptr [4 x i8], [4 x i8]*@.str8444, i32 0, i32 0
store i8* %.tmp8445, i8** %.tmp8443
%.tmp8446 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8447 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8446, i32 0, i32 4
%.tmp8448 = load %m2811$.Type.type*, %m2811$.Type.type** %type.8436
store %m2811$.Type.type* %.tmp8448, %m2811$.Type.type** %.tmp8447
br label %.if.end.8433
.if.false.8433:
%.tmp8449 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8450 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp8449, i32 0, i32 1
%.tmp8451 = load %m0$.File.type*, %m0$.File.type** %.tmp8450
%.tmp8453 = getelementptr [22 x i8], [22 x i8]*@.str8452, i32 0, i32 0
%.tmp8454 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8455 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp8454)
%.tmp8456 = load i8*, i8** %var_type_repr.8369
%.tmp8457 = load i8*, i8** %var_type_repr.8369
%.tmp8458 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %var_info.8353
%.tmp8459 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp8458)
%.tmp8460 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8451, i8* %.tmp8453, i8* %.tmp8455, i8* %.tmp8456, i8* %.tmp8457, i8* %.tmp8459)
br label %.if.end.8433
.if.end.8433:
br label %.if.end.8411
.if.end.8411:
br label %.if.end.8338
.if.false.8338:
%.tmp8461 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8462 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8461, i32 0, i32 8
%.tmp8463 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8462
%.tmp8464 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8463, i32 0, i32 0
%.tmp8465 = load i8*, i8** %.tmp8464
%.tmp8467 = getelementptr [8 x i8], [8 x i8]*@.str8466, i32 0, i32 0
%.tmp8468 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8465, i8* %.tmp8467)
%.tmp8469 = icmp eq i32 %.tmp8468, 0
br i1 %.tmp8469, label %.if.true.8470, label %.if.false.8470
.if.true.8470:
%.tmp8471 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp8472 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8471)
store %m2811$.AssignableInfo.type* %.tmp8472, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8473 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8474 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8473, i32 0, i32 4
%.tmp8475 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp8475, %m2811$.Type.type** %.tmp8474
%.tmp8476 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8477 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8476, i32 0, i32 4
%.tmp8478 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8477
%.tmp8479 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8478, i32 0, i32 0
%.tmp8481 = getelementptr [5 x i8], [5 x i8]*@.str8480, i32 0, i32 0
store i8* %.tmp8481, i8** %.tmp8479
%.tmp8482 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8483 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8482, i32 0, i32 8
%.tmp8484 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8483
%.tmp8485 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8484, i32 0, i32 8
%.tmp8486 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8485
%.tmp8487 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8486, i32 0, i32 1
%.tmp8488 = load i8*, i8** %.tmp8487
%.tmp8490 = getelementptr [6 x i8], [6 x i8]*@.str8489, i32 0, i32 0
%.tmp8491 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8488, i8* %.tmp8490)
%.tmp8492 = icmp eq i32 %.tmp8491, 0
br i1 %.tmp8492, label %.if.true.8493, label %.if.false.8493
.if.true.8493:
%.tmp8494 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8495 = load i8, i8* @SCOPE_CONST
%.tmp8497 = getelementptr [2 x i8], [2 x i8]*@.str8496, i32 0, i32 0
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp8494, i8 %.tmp8495, i8* %.tmp8497)
br label %.if.end.8493
.if.false.8493:
%.tmp8498 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8499 = load i8, i8* @SCOPE_CONST
%.tmp8501 = getelementptr [2 x i8], [2 x i8]*@.str8500, i32 0, i32 0
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp8498, i8 %.tmp8499, i8* %.tmp8501)
br label %.if.end.8493
.if.end.8493:
br label %.if.end.8470
.if.false.8470:
%.tmp8502 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8503 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8502, i32 0, i32 8
%.tmp8504 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8503
%.tmp8505 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8504, i32 0, i32 0
%.tmp8506 = load i8*, i8** %.tmp8505
%.tmp8508 = getelementptr [8 x i8], [8 x i8]*@.str8507, i32 0, i32 0
%.tmp8509 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8506, i8* %.tmp8508)
%.tmp8510 = icmp eq i32 %.tmp8509, 0
br i1 %.tmp8510, label %.if.true.8511, label %.if.false.8511
.if.true.8511:
%.tmp8512 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8513 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8514 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8513, i32 0, i32 8
%.tmp8515 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8514
%.tmp8516 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8515, i32 0, i32 8
%.tmp8517 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8516
%.tmp8518 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$compile_fn_call.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp8512, %m996$.Node.type* %.tmp8517)
store %m2811$.AssignableInfo.type* %.tmp8518, %m2811$.AssignableInfo.type** %assignable_info.8245
br label %.if.end.8511
.if.false.8511:
%.tmp8519 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8520 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8519, i32 0, i32 8
%.tmp8521 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8520
%.tmp8522 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8521, i32 0, i32 0
%.tmp8523 = load i8*, i8** %.tmp8522
%.tmp8525 = getelementptr [7 x i8], [7 x i8]*@.str8524, i32 0, i32 0
%.tmp8526 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8523, i8* %.tmp8525)
%.tmp8527 = icmp eq i32 %.tmp8526, 0
br i1 %.tmp8527, label %.if.true.8528, label %.if.false.8528
.if.true.8528:
%.tmp8529 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8530 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8531 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8530, i32 0, i32 8
%.tmp8532 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8531
%.tmp8533 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8532, i32 0, i32 1
%.tmp8534 = load i8*, i8** %.tmp8533
%.tmp8535 = call %m2811$.AssignableInfo.type*(%m2811$.CompilerCtx.type*,i8*) @m311$define_string.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.cp(%m2811$.CompilerCtx.type* %.tmp8529, i8* %.tmp8534)
%string_info.8536 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp8535, %m2811$.AssignableInfo.type** %string_info.8536
%.tmp8537 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp8538 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8537)
store %m2811$.AssignableInfo.type* %.tmp8538, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8539 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8540 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
call void(%m2811$.CompilerCtx.type*,%m2811$.AssignableInfo.type*) @m311$set_assignable_tmp_id.v.m2811$.CompilerCtx.typep.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp8539, %m2811$.AssignableInfo.type* %.tmp8540)
%.tmp8541 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8542 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %string_info.8536
%.tmp8543 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8542, i32 0, i32 4
%.tmp8544 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8543
%.tmp8545 = call i8*(%m2811$.CompilerCtx.type*,%m2811$.Type.type*) @m2812$repr.cp.m2811$.CompilerCtx.typep.m2811$.Type.typep(%m2811$.CompilerCtx.type* %.tmp8541, %m2811$.Type.type* %.tmp8544)
%str_tr.8546 = alloca i8*
store i8* %.tmp8545, i8** %str_tr.8546
%.tmp8547 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8548 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp8547, i32 0, i32 1
%.tmp8549 = load %m0$.File.type*, %m0$.File.type** %.tmp8548
%.tmp8551 = getelementptr [44 x i8], [44 x i8]*@.str8550, i32 0, i32 0
%.tmp8552 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8553 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp8552)
%.tmp8554 = load i8*, i8** %str_tr.8546
%.tmp8555 = load i8*, i8** %str_tr.8546
%.tmp8556 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %string_info.8536
%.tmp8557 = call i8*(%m2811$.AssignableInfo.type*) @m311$repr_assignable_id.cp.m2811$.AssignableInfo.typep(%m2811$.AssignableInfo.type* %.tmp8556)
%.tmp8558 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8549, i8* %.tmp8551, i8* %.tmp8553, i8* %.tmp8554, i8* %.tmp8555, i8* %.tmp8557)
%.tmp8559 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8560 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8559, i32 0, i32 4
%.tmp8561 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp8561, %m2811$.Type.type** %.tmp8560
%.tmp8562 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8563 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8562, i32 0, i32 4
%.tmp8564 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8563
%.tmp8565 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8564, i32 0, i32 0
%.tmp8567 = getelementptr [4 x i8], [4 x i8]*@.str8566, i32 0, i32 0
store i8* %.tmp8567, i8** %.tmp8565
%.tmp8568 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8569 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8568, i32 0, i32 4
%.tmp8570 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8569
%.tmp8571 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8570, i32 0, i32 3
%.tmp8572 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp8572, %m2811$.Type.type** %.tmp8571
%.tmp8573 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8574 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8573, i32 0, i32 4
%.tmp8575 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8574
%.tmp8576 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8575, i32 0, i32 3
%.tmp8577 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8576
%.tmp8578 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8577, i32 0, i32 0
%.tmp8580 = getelementptr [4 x i8], [4 x i8]*@.str8579, i32 0, i32 0
store i8* %.tmp8580, i8** %.tmp8578
br label %.if.end.8528
.if.false.8528:
%.tmp8581 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8582 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8581, i32 0, i32 8
%.tmp8583 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8582
%.tmp8584 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8583, i32 0, i32 0
%.tmp8585 = load i8*, i8** %.tmp8584
%.tmp8587 = getelementptr [4 x i8], [4 x i8]*@.str8586, i32 0, i32 0
%.tmp8588 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8585, i8* %.tmp8587)
%.tmp8589 = icmp eq i32 %.tmp8588, 0
br i1 %.tmp8589, label %.if.true.8590, label %.if.false.8590
.if.true.8590:
%.tmp8591 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp8592 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8591)
store %m2811$.AssignableInfo.type* %.tmp8592, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8593 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8594 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8593, i32 0, i32 8
%.tmp8595 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8594
%.tmp8596 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8595, i32 0, i32 1
%.tmp8597 = load i8*, i8** %.tmp8596
%.tmp8598 = call i32(i8*) @strlen(i8* %.tmp8597)
%chr_len.8599 = alloca i32
store i32 %.tmp8598, i32* %chr_len.8599
%.tmp8600 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8601 = load i8, i8* @SCOPE_CONST
%.tmp8603 = getelementptr [2 x i8], [2 x i8]*@.str8602, i32 0, i32 0
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp8600, i8 %.tmp8601, i8* %.tmp8603)
%.tmp8604 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8605 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8604, i32 0, i32 0
%.tmp8606 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8607 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8606, i32 0, i32 8
%.tmp8608 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8607
%.tmp8609 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8608, i32 0, i32 1
%.tmp8610 = load i8*, i8** %.tmp8609
%.tmp8611 = call i8*(i8*) @m2365$chr_to_llvm.cp.cp(i8* %.tmp8610)
store i8* %.tmp8611, i8** %.tmp8605
%.tmp8612 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8613 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8612, i32 0, i32 0
%.tmp8614 = load i8*, i8** %.tmp8613
%.tmp8615 = icmp eq i8* %.tmp8614, null
br i1 %.tmp8615, label %.if.true.8616, label %.if.false.8616
.if.true.8616:
%.tmp8617 = getelementptr i8*, i8** %err_buf.8250, i32 0
%.tmp8619 = getelementptr [22 x i8], [22 x i8]*@.str8618, i32 0, i32 0
%.tmp8620 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8621 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8620, i32 0, i32 8
%.tmp8622 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8621
%.tmp8623 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8622, i32 0, i32 1
%.tmp8624 = load i8*, i8** %.tmp8623
%.tmp8625 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8617, i8* %.tmp8619, i8* %.tmp8624)
%.tmp8626 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp8626
br label %.if.end.8616
.if.false.8616:
br label %.if.end.8616
.if.end.8616:
%.tmp8627 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8628 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8627, i32 0, i32 4
%.tmp8629 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp8629, %m2811$.Type.type** %.tmp8628
%.tmp8630 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8631 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8630, i32 0, i32 4
%.tmp8632 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8631
%.tmp8633 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8632, i32 0, i32 0
%.tmp8635 = getelementptr [4 x i8], [4 x i8]*@.str8634, i32 0, i32 0
store i8* %.tmp8635, i8** %.tmp8633
br label %.if.end.8590
.if.false.8590:
%.tmp8636 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8637 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8639 = getelementptr [40 x i8], [40 x i8]*@.str8638, i32 0, i32 0
%.tmp8640 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp8636, %m996$.Node.type* %.tmp8637, i8* %.tmp8639)
%.tmp8641 = load %m996$.Node.type*, %m996$.Node.type** %mono.8247
%.tmp8642 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8641, i32 0, i32 8
%.tmp8643 = load %m996$.Node.type*, %m996$.Node.type** %.tmp8642
%.tmp8644 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8643, i32 0, i32 0
%.tmp8645 = load i8*, i8** %.tmp8644
%.tmp8646 = call i32(i8*,...) @printf(i8* %.tmp8640, i8* %.tmp8645)
%.tmp8647 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp8647
br label %.if.end.8590
.if.end.8590:
br label %.if.end.8528
.if.end.8528:
br label %.if.end.8511
.if.end.8511:
br label %.if.end.8470
.if.end.8470:
br label %.if.end.8338
.if.end.8338:
br label %.if.end.8291
.if.end.8291:
br label %.if.end.8263
.if.end.8263:
%.tmp8648 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8649 = icmp eq %m2811$.AssignableInfo.type* %.tmp8648, null
br i1 %.tmp8649, label %.if.true.8650, label %.if.false.8650
.if.true.8650:
%.tmp8651 = bitcast ptr null to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp8651
br label %.if.end.8650
.if.false.8650:
br label %.if.end.8650
.if.end.8650:
%.tmp8652 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8653 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8652, i32 0, i32 5
%.tmp8654 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp8655 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8654, i32 0, i32 3
%.tmp8656 = load i32, i32* %.tmp8655
store i32 %.tmp8656, i32* %.tmp8653
%.tmp8657 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8658 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8657, i32 0, i32 6
%.tmp8659 = load %m996$.Node.type*, %m996$.Node.type** %curr_node
%.tmp8660 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp8659, i32 0, i32 4
%.tmp8661 = load i32, i32* %.tmp8660
store i32 %.tmp8661, i32* %.tmp8658
%.tmp8662 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %assignable_info.8245
%.tmp8663 = bitcast %m2811$.AssignableInfo.type* %.tmp8662 to %m2811$.AssignableInfo.type*
ret %m2811$.AssignableInfo.type* %.tmp8663
}
define i8* @m311$type_abbr.cp.m2811$.Type.typep(%m2811$.Type.type* %.type.arg) {
%type = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.type.arg, %m2811$.Type.type** %type
%.tmp8664 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp8665 = icmp ne %m2811$.Type.type* %.tmp8664, null
%.tmp8667 = getelementptr [22 x i8], [22 x i8]*@.str8666, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp8665, i8* %.tmp8667)
%.tmp8668 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp8669 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8668, i32 0, i32 0
%.tmp8670 = load i8*, i8** %.tmp8669
%.tmp8671 = icmp ne i8* %.tmp8670, null
%.tmp8673 = getelementptr [59 x i8], [59 x i8]*@.str8672, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp8671, i8* %.tmp8673)
%.tmp8674 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp8675 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8674, i32 0, i32 0
%.tmp8676 = load i8*, i8** %.tmp8675
%.tmp8678 = getelementptr [4 x i8], [4 x i8]*@.str8677, i32 0, i32 0
%.tmp8679 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8676, i8* %.tmp8678)
%.tmp8680 = icmp eq i32 %.tmp8679, 0
br i1 %.tmp8680, label %.if.true.8681, label %.if.false.8681
.if.true.8681:
%.tmp8683 = getelementptr [2 x i8], [2 x i8]*@.str8682, i32 0, i32 0
ret i8* %.tmp8683
br label %.if.end.8681
.if.false.8681:
%.tmp8684 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp8685 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8684, i32 0, i32 0
%.tmp8686 = load i8*, i8** %.tmp8685
%.tmp8688 = getelementptr [5 x i8], [5 x i8]*@.str8687, i32 0, i32 0
%.tmp8689 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8686, i8* %.tmp8688)
%.tmp8690 = icmp eq i32 %.tmp8689, 0
br i1 %.tmp8690, label %.if.true.8691, label %.if.false.8691
.if.true.8691:
%.tmp8693 = getelementptr [2 x i8], [2 x i8]*@.str8692, i32 0, i32 0
ret i8* %.tmp8693
br label %.if.end.8691
.if.false.8691:
%.tmp8694 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp8695 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8694, i32 0, i32 0
%.tmp8696 = load i8*, i8** %.tmp8695
%.tmp8698 = getelementptr [5 x i8], [5 x i8]*@.str8697, i32 0, i32 0
%.tmp8699 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8696, i8* %.tmp8698)
%.tmp8700 = icmp eq i32 %.tmp8699, 0
br i1 %.tmp8700, label %.if.true.8701, label %.if.false.8701
.if.true.8701:
%.tmp8703 = getelementptr [2 x i8], [2 x i8]*@.str8702, i32 0, i32 0
ret i8* %.tmp8703
br label %.if.end.8701
.if.false.8701:
%.tmp8704 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp8705 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8704, i32 0, i32 0
%.tmp8706 = load i8*, i8** %.tmp8705
%.tmp8708 = getelementptr [4 x i8], [4 x i8]*@.str8707, i32 0, i32 0
%.tmp8709 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8706, i8* %.tmp8708)
%.tmp8710 = icmp eq i32 %.tmp8709, 0
br i1 %.tmp8710, label %.if.true.8711, label %.if.false.8711
.if.true.8711:
%.tmp8713 = getelementptr [2 x i8], [2 x i8]*@.str8712, i32 0, i32 0
ret i8* %.tmp8713
br label %.if.end.8711
.if.false.8711:
%.tmp8714 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp8715 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8714, i32 0, i32 0
%.tmp8716 = load i8*, i8** %.tmp8715
%.tmp8718 = getelementptr [4 x i8], [4 x i8]*@.str8717, i32 0, i32 0
%.tmp8719 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8716, i8* %.tmp8718)
%.tmp8720 = icmp eq i32 %.tmp8719, 0
br i1 %.tmp8720, label %.if.true.8721, label %.if.false.8721
.if.true.8721:
%.tmp8723 = getelementptr [1 x i8], [1 x i8]*@.str8722, i32 0, i32 0
%buf.8724 = alloca i8*
store i8* %.tmp8723, i8** %buf.8724
%.tmp8725 = getelementptr i8*, i8** %buf.8724, i32 0
%.tmp8727 = getelementptr [4 x i8], [4 x i8]*@.str8726, i32 0, i32 0
%.tmp8728 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp8729 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8728, i32 0, i32 3
%.tmp8730 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8729
%.tmp8731 = call i8*(%m2811$.Type.type*) @m311$type_abbr.cp.m2811$.Type.typep(%m2811$.Type.type* %.tmp8730)
%.tmp8732 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8725, i8* %.tmp8727, i8* %.tmp8731)
%.tmp8733 = load i8*, i8** %buf.8724
ret i8* %.tmp8733
br label %.if.end.8721
.if.false.8721:
%.tmp8734 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp8735 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8734, i32 0, i32 0
%.tmp8736 = load i8*, i8** %.tmp8735
%.tmp8738 = getelementptr [10 x i8], [10 x i8]*@.str8737, i32 0, i32 0
%.tmp8739 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8736, i8* %.tmp8738)
%.tmp8740 = icmp eq i32 %.tmp8739, 0
br i1 %.tmp8740, label %.if.true.8741, label %.if.false.8741
.if.true.8741:
%.tmp8742 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp8743 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8742, i32 0, i32 2
%.tmp8744 = load i8*, i8** %.tmp8743
ret i8* %.tmp8744
br label %.if.end.8741
.if.false.8741:
%.tmp8745 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp8746 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8745, i32 0, i32 0
%.tmp8747 = load i8*, i8** %.tmp8746
%.tmp8749 = getelementptr [7 x i8], [7 x i8]*@.str8748, i32 0, i32 0
%.tmp8750 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8747, i8* %.tmp8749)
%.tmp8751 = icmp eq i32 %.tmp8750, 0
br i1 %.tmp8751, label %.if.true.8752, label %.if.false.8752
.if.true.8752:
%.tmp8754 = getelementptr [2 x i8], [2 x i8]*@.str8753, i32 0, i32 0
%buf.8755 = alloca i8*
store i8* %.tmp8754, i8** %buf.8755
%.tmp8757 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp8758 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8757, i32 0, i32 3
%.tmp8759 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8758
%t.8760 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp8759, %m2811$.Type.type** %t.8760
br label %.for.start.8756
.for.start.8756:
%.tmp8761 = load %m2811$.Type.type*, %m2811$.Type.type** %t.8760
%.tmp8762 = icmp ne %m2811$.Type.type* %.tmp8761, null
br i1 %.tmp8762, label %.for.continue.8756, label %.for.end.8756
.for.continue.8756:
%.tmp8763 = getelementptr i8*, i8** %buf.8755, i32 0
%.tmp8765 = getelementptr [5 x i8], [5 x i8]*@.str8764, i32 0, i32 0
%.tmp8766 = load i8*, i8** %buf.8755
%.tmp8767 = load %m2811$.Type.type*, %m2811$.Type.type** %t.8760
%.tmp8768 = call i8*(%m2811$.Type.type*) @m311$type_abbr.cp.m2811$.Type.typep(%m2811$.Type.type* %.tmp8767)
%.tmp8769 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8763, i8* %.tmp8765, i8* %.tmp8766, i8* %.tmp8768)
%.tmp8770 = load %m2811$.Type.type*, %m2811$.Type.type** %t.8760
%.tmp8771 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8770, i32 0, i32 4
%.tmp8772 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8771
store %m2811$.Type.type* %.tmp8772, %m2811$.Type.type** %t.8760
br label %.for.start.8756
.for.end.8756:
%.tmp8773 = load i8*, i8** %buf.8755
ret i8* %.tmp8773
br label %.if.end.8752
.if.false.8752:
%.tmp8774 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp8775 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8774, i32 0, i32 0
%.tmp8776 = load i8*, i8** %.tmp8775
%.tmp8778 = getelementptr [9 x i8], [9 x i8]*@.str8777, i32 0, i32 0
%.tmp8779 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8776, i8* %.tmp8778)
%.tmp8780 = icmp eq i32 %.tmp8779, 0
br i1 %.tmp8780, label %.if.true.8781, label %.if.false.8781
.if.true.8781:
%.tmp8783 = getelementptr [2 x i8], [2 x i8]*@.str8782, i32 0, i32 0
ret i8* %.tmp8783
br label %.if.end.8781
.if.false.8781:
%.tmp8784 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp8785 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8784, i32 0, i32 0
%.tmp8786 = load i8*, i8** %.tmp8785
%.tmp8788 = getelementptr [6 x i8], [6 x i8]*@.str8787, i32 0, i32 0
%.tmp8789 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8786, i8* %.tmp8788)
%.tmp8790 = icmp eq i32 %.tmp8789, 0
br i1 %.tmp8790, label %.if.true.8791, label %.if.false.8791
.if.true.8791:
%.tmp8793 = getelementptr [2 x i8], [2 x i8]*@.str8792, i32 0, i32 0
ret i8* %.tmp8793
br label %.if.end.8791
.if.false.8791:
%.tmp8795 = getelementptr [45 x i8], [45 x i8]*@.str8794, i32 0, i32 0
%.tmp8796 = load %m2811$.Type.type*, %m2811$.Type.type** %type
%.tmp8797 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8796, i32 0, i32 0
%.tmp8798 = load i8*, i8** %.tmp8797
%.tmp8799 = call i32(i8*,...) @printf(i8* %.tmp8795, i8* %.tmp8798)
br label %.if.end.8791
.if.end.8791:
br label %.if.end.8781
.if.end.8781:
br label %.if.end.8752
.if.end.8752:
br label %.if.end.8741
.if.end.8741:
br label %.if.end.8721
.if.end.8721:
br label %.if.end.8711
.if.end.8711:
br label %.if.end.8701
.if.end.8701:
br label %.if.end.8691
.if.end.8691:
br label %.if.end.8681
.if.end.8681:
%.tmp8800 = bitcast ptr null to i8*
ret i8* %.tmp8800
}
define %m2811$.AssignableInfo.type* @m311$define_string.m2811$.AssignableInfo.typep.m2811$.CompilerCtx.typep.cp(%m2811$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp8801 = bitcast ptr null to %m996$.Node.type*
%.tmp8802 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8801)
%info.8803 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp8802, %m2811$.AssignableInfo.type** %info.8803
%.tmp8805 = getelementptr [1 x i8], [1 x i8]*@.str8804, i32 0, i32 0
%tmp_buff.8806 = alloca i8*
store i8* %.tmp8805, i8** %tmp_buff.8806
%.tmp8807 = getelementptr i8*, i8** %tmp_buff.8806, i32 0
%.tmp8809 = getelementptr [7 x i8], [7 x i8]*@.str8808, i32 0, i32 0
%.tmp8810 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8811 = call i32(%m2811$.CompilerCtx.type*) @m311$new_uid.i.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.tmp8810)
%.tmp8812 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8807, i8* %.tmp8809, i32 %.tmp8811)
%.tmp8813 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.8803
%.tmp8814 = load i8, i8* @SCOPE_GLOBAL
%.tmp8815 = load i8*, i8** %tmp_buff.8806
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp8813, i8 %.tmp8814, i8* %.tmp8815)
%.tmp8816 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.8803
%.tmp8817 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8816, i32 0, i32 4
%.tmp8818 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp8818, %m2811$.Type.type** %.tmp8817
%.tmp8819 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.8803
%.tmp8820 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8819, i32 0, i32 4
%.tmp8821 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8820
%.tmp8822 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8821, i32 0, i32 0
%.tmp8824 = getelementptr [6 x i8], [6 x i8]*@.str8823, i32 0, i32 0
store i8* %.tmp8824, i8** %.tmp8822
%.tmp8825 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.8803
%.tmp8826 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8825, i32 0, i32 4
%.tmp8827 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8826
%.tmp8828 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8827, i32 0, i32 3
%.tmp8829 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp8829, %m2811$.Type.type** %.tmp8828
%.tmp8830 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.8803
%.tmp8831 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8830, i32 0, i32 4
%.tmp8832 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8831
%.tmp8833 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8832, i32 0, i32 3
%.tmp8834 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8833
%.tmp8835 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8834, i32 0, i32 0
%.tmp8837 = getelementptr [4 x i8], [4 x i8]*@.str8836, i32 0, i32 0
store i8* %.tmp8837, i8** %.tmp8835
%.tmp8838 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.8803
%.tmp8839 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8838, i32 0, i32 4
%.tmp8840 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8839
%.tmp8841 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8840, i32 0, i32 3
%.tmp8842 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8841
%.tmp8843 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8842, i32 0, i32 4
%.tmp8844 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp8844, %m2811$.Type.type** %.tmp8843
%.tmp8845 = load i8*, i8** %text
%.tmp8846 = call i8*(i8*) @m2365$string_to_llvm.cp.cp(i8* %.tmp8845)
%identifier.8847 = alloca i8*
store i8* %.tmp8846, i8** %identifier.8847
%.tmp8848 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.8803
%.tmp8849 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8848, i32 0, i32 4
%.tmp8850 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8849
%.tmp8851 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8850, i32 0, i32 3
%.tmp8852 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8851
%.tmp8853 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8852, i32 0, i32 4
%.tmp8854 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp8853
%.tmp8855 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp8854, i32 0, i32 0
%.tmp8856 = getelementptr i8*, i8** %.tmp8855, i32 0
%.tmp8858 = getelementptr [3 x i8], [3 x i8]*@.str8857, i32 0, i32 0
%.tmp8859 = load i8*, i8** %identifier.8847
%.tmp8860 = call i32(i8*) @m2365$llvm_str_len.i.cp(i8* %.tmp8859)
%.tmp8861 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp8856, i8* %.tmp8858, i32 %.tmp8860)
%.tmp8862 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8863 = load i8*, i8** %identifier.8847
%.tmp8865 = getelementptr [7 x i8], [7 x i8]*@.str8864, i32 0, i32 0
%.tmp8866 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.8803
call void(%m2811$.CompilerCtx.type*,i8*,i8*,%m2811$.AssignableInfo.type*,i1,i1) @m311$define_global.v.m2811$.CompilerCtx.typep.cp.cp.m2811$.AssignableInfo.typep.b.b(%m2811$.CompilerCtx.type* %.tmp8862, i8* %.tmp8863, i8* %.tmp8865, %m2811$.AssignableInfo.type* %.tmp8866, i1 0, i1 0)
%.tmp8867 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.8803
ret %m2811$.AssignableInfo.type* %.tmp8867
}
define void @m311$define_global.v.m2811$.CompilerCtx.typep.cp.cp.m2811$.AssignableInfo.typep.b.b(%m2811$.CompilerCtx.type* %.ctx.arg, i8* %.id.arg, i8* %.type.arg, %m2811$.AssignableInfo.type* %.info.arg, i1 %.weak.arg, i1 %.compiled.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%id = alloca i8*
store i8* %.id.arg, i8** %id
%type = alloca i8*
store i8* %.type.arg, i8** %type
%info = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.info.arg, %m2811$.AssignableInfo.type** %info
%weak = alloca i1
store i1 %.weak.arg, i1* %weak
%compiled = alloca i1
store i1 %.compiled.arg, i1* %compiled
%.tmp8868 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* null, i32 1
%.tmp8869 = ptrtoint %m2811$.GlobalName.type* %.tmp8868 to i32
%.tmp8870 = call i8*(i32) @malloc(i32 %.tmp8869)
%.tmp8871 = bitcast i8* %.tmp8870 to %m2811$.GlobalName.type*
%global.8872 = alloca %m2811$.GlobalName.type*
store %m2811$.GlobalName.type* %.tmp8871, %m2811$.GlobalName.type** %global.8872
%.tmp8873 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %global.8872
%.tmp8874 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp8873, i32 0, i32 0
%.tmp8875 = load i8*, i8** %id
store i8* %.tmp8875, i8** %.tmp8874
%.tmp8876 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %global.8872
%.tmp8877 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp8876, i32 0, i32 1
%.tmp8878 = load i8*, i8** %type
store i8* %.tmp8878, i8** %.tmp8877
%.tmp8879 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %global.8872
%.tmp8880 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp8879, i32 0, i32 4
%.tmp8881 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info
store %m2811$.AssignableInfo.type* %.tmp8881, %m2811$.AssignableInfo.type** %.tmp8880
%.tmp8882 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %global.8872
%.tmp8883 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp8882, i32 0, i32 2
%.tmp8884 = load i1, i1* %compiled
store i1 %.tmp8884, i1* %.tmp8883
%.tmp8885 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %global.8872
%.tmp8886 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp8885, i32 0, i32 5
store %m2811$.GlobalName.type* null, %m2811$.GlobalName.type** %.tmp8886
%.tmp8887 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %global.8872
%.tmp8888 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp8887, i32 0, i32 3
%.tmp8889 = load i1, i1* %weak
store i1 %.tmp8889, i1* %.tmp8888
%.tmp8890 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8891 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %global.8872
call void(%m2811$.CompilerCtx.type*,%m2811$.GlobalName.type*) @m311$append_global.v.m2811$.CompilerCtx.typep.m2811$.GlobalName.typep(%m2811$.CompilerCtx.type* %.tmp8890, %m2811$.GlobalName.type* %.tmp8891)
ret void
}
define void @m311$define_module.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp.cp(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.mod.arg, i8* %.as_name.arg, i8* %.abspath.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%mod = alloca %m996$.Node.type*
store %m996$.Node.type* %.mod.arg, %m996$.Node.type** %mod
%as_name = alloca i8*
store i8* %.as_name.arg, i8** %as_name
%abspath = alloca i8*
store i8* %.abspath.arg, i8** %abspath
%.tmp8892 = load %m996$.Node.type*, %m996$.Node.type** %mod
%.tmp8893 = call %m2811$.AssignableInfo.type*(%m996$.Node.type*) @m311$new_assignable_info.m2811$.AssignableInfo.typep.m996$.Node.typep(%m996$.Node.type* %.tmp8892)
%info.8894 = alloca %m2811$.AssignableInfo.type*
store %m2811$.AssignableInfo.type* %.tmp8893, %m2811$.AssignableInfo.type** %info.8894
%.tmp8895 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.8894
%.tmp8896 = load i8, i8* @SCOPE_CONST
%.tmp8897 = load i8*, i8** %abspath
call void(%m2811$.AssignableInfo.type*,i8,i8*) @m311$set_assignable_id.v.m2811$.AssignableInfo.typep.c.cp(%m2811$.AssignableInfo.type* %.tmp8895, i8 %.tmp8896, i8* %.tmp8897)
%.tmp8898 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.8894
%.tmp8899 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8898, i32 0, i32 3
%.tmp8901 = getelementptr [7 x i8], [7 x i8]*@.str8900, i32 0, i32 0
store i8* %.tmp8901, i8** %.tmp8899
%.tmp8902 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.8894
%.tmp8903 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8902, i32 0, i32 4
store %m2811$.Type.type* null, %m2811$.Type.type** %.tmp8903
%.tmp8904 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8905 = load %m996$.Node.type*, %m996$.Node.type** %mod
%.tmp8906 = load i8*, i8** %as_name
%.tmp8907 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %info.8894
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*,%m2811$.AssignableInfo.type*) @m311$define_assignable.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp.m2811$.AssignableInfo.typep(%m2811$.CompilerCtx.type* %.tmp8904, %m996$.Node.type* %.tmp8905, i8* %.tmp8906, %m2811$.AssignableInfo.type* %.tmp8907)
ret void
}
define void @m311$append_anon_fn.v.m2811$.CompilerCtx.typep.cp(%m2811$.CompilerCtx.type* %.ctx.arg, i8* %.code.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%code = alloca i8*
store i8* %.code.arg, i8** %code
%.tmp8908 = getelementptr %m2811$.AnonFn.type, %m2811$.AnonFn.type* null, i32 1
%.tmp8909 = ptrtoint %m2811$.AnonFn.type* %.tmp8908 to i32
%.tmp8910 = call i8*(i32) @malloc(i32 %.tmp8909)
%.tmp8911 = bitcast i8* %.tmp8910 to %m2811$.AnonFn.type*
%fn.8912 = alloca %m2811$.AnonFn.type*
store %m2811$.AnonFn.type* %.tmp8911, %m2811$.AnonFn.type** %fn.8912
%.tmp8913 = load %m2811$.AnonFn.type*, %m2811$.AnonFn.type** %fn.8912
%.tmp8914 = getelementptr %m2811$.AnonFn.type, %m2811$.AnonFn.type* %.tmp8913, i32 0, i32 0
%.tmp8915 = load i8*, i8** %code
store i8* %.tmp8915, i8** %.tmp8914
%.tmp8916 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8917 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp8916, i32 0, i32 8
%.tmp8918 = load %m2811$.AnonFn.type*, %m2811$.AnonFn.type** %.tmp8917
%.tmp8919 = icmp eq %m2811$.AnonFn.type* %.tmp8918, null
br i1 %.tmp8919, label %.if.true.8920, label %.if.false.8920
.if.true.8920:
%.tmp8921 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8922 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp8921, i32 0, i32 8
%.tmp8923 = load %m2811$.AnonFn.type*, %m2811$.AnonFn.type** %fn.8912
store %m2811$.AnonFn.type* %.tmp8923, %m2811$.AnonFn.type** %.tmp8922
%.tmp8924 = load %m2811$.AnonFn.type*, %m2811$.AnonFn.type** %fn.8912
%.tmp8925 = getelementptr %m2811$.AnonFn.type, %m2811$.AnonFn.type* %.tmp8924, i32 0, i32 1
store %m2811$.AnonFn.type* null, %m2811$.AnonFn.type** %.tmp8925
br label %.if.end.8920
.if.false.8920:
%.tmp8926 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8927 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp8926, i32 0, i32 8
%.tmp8928 = load %m2811$.AnonFn.type*, %m2811$.AnonFn.type** %.tmp8927
%last.8929 = alloca %m2811$.AnonFn.type*
store %m2811$.AnonFn.type* %.tmp8928, %m2811$.AnonFn.type** %last.8929
br label %.for.start.8930
.for.start.8930:
%.tmp8931 = load %m2811$.AnonFn.type*, %m2811$.AnonFn.type** %last.8929
%.tmp8932 = getelementptr %m2811$.AnonFn.type, %m2811$.AnonFn.type* %.tmp8931, i32 0, i32 1
%.tmp8933 = load %m2811$.AnonFn.type*, %m2811$.AnonFn.type** %.tmp8932
%.tmp8934 = icmp ne %m2811$.AnonFn.type* %.tmp8933, null
br i1 %.tmp8934, label %.for.continue.8930, label %.for.end.8930
.for.continue.8930:
%.tmp8935 = load %m2811$.AnonFn.type*, %m2811$.AnonFn.type** %last.8929
%.tmp8936 = getelementptr %m2811$.AnonFn.type, %m2811$.AnonFn.type* %.tmp8935, i32 0, i32 1
%.tmp8937 = load %m2811$.AnonFn.type*, %m2811$.AnonFn.type** %.tmp8936
store %m2811$.AnonFn.type* %.tmp8937, %m2811$.AnonFn.type** %last.8929
br label %.for.start.8930
.for.end.8930:
%.tmp8938 = load %m2811$.AnonFn.type*, %m2811$.AnonFn.type** %last.8929
%.tmp8939 = getelementptr %m2811$.AnonFn.type, %m2811$.AnonFn.type* %.tmp8938, i32 0, i32 1
%.tmp8940 = load %m2811$.AnonFn.type*, %m2811$.AnonFn.type** %fn.8912
store %m2811$.AnonFn.type* %.tmp8940, %m2811$.AnonFn.type** %.tmp8939
br label %.if.end.8920
.if.end.8920:
ret void
}
define void @m311$compile_anon_fn.v.m2811$.CompilerCtx.typep(%m2811$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%.tmp8942 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8943 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp8942, i32 0, i32 8
%.tmp8944 = load %m2811$.AnonFn.type*, %m2811$.AnonFn.type** %.tmp8943
%fn.8945 = alloca %m2811$.AnonFn.type*
store %m2811$.AnonFn.type* %.tmp8944, %m2811$.AnonFn.type** %fn.8945
br label %.for.start.8941
.for.start.8941:
%.tmp8946 = load %m2811$.AnonFn.type*, %m2811$.AnonFn.type** %fn.8945
%.tmp8947 = icmp ne %m2811$.AnonFn.type* %.tmp8946, null
br i1 %.tmp8947, label %.for.continue.8941, label %.for.end.8941
.for.continue.8941:
%.tmp8948 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8949 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp8948, i32 0, i32 1
%.tmp8950 = load %m0$.File.type*, %m0$.File.type** %.tmp8949
%.tmp8952 = getelementptr [4 x i8], [4 x i8]*@.str8951, i32 0, i32 0
%.tmp8953 = load %m2811$.AnonFn.type*, %m2811$.AnonFn.type** %fn.8945
%.tmp8954 = getelementptr %m2811$.AnonFn.type, %m2811$.AnonFn.type* %.tmp8953, i32 0, i32 0
%.tmp8955 = load i8*, i8** %.tmp8954
%.tmp8956 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp8950, i8* %.tmp8952, i8* %.tmp8955)
%.tmp8957 = load %m2811$.AnonFn.type*, %m2811$.AnonFn.type** %fn.8945
%.tmp8958 = getelementptr %m2811$.AnonFn.type, %m2811$.AnonFn.type* %.tmp8957, i32 0, i32 1
%.tmp8959 = load %m2811$.AnonFn.type*, %m2811$.AnonFn.type** %.tmp8958
store %m2811$.AnonFn.type* %.tmp8959, %m2811$.AnonFn.type** %fn.8945
br label %.for.start.8941
.for.end.8941:
%.tmp8960 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8961 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp8960, i32 0, i32 8
store %m2811$.AnonFn.type* null, %m2811$.AnonFn.type** %.tmp8961
ret void
}
define void @m311$append_global.v.m2811$.CompilerCtx.typep.m2811$.GlobalName.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.GlobalName.type* %.g.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%g = alloca %m2811$.GlobalName.type*
store %m2811$.GlobalName.type* %.g.arg, %m2811$.GlobalName.type** %g
%.tmp8962 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8963 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp8962, i32 0, i32 3
%.tmp8964 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %.tmp8963
%.tmp8965 = icmp eq %m2811$.GlobalName.type* %.tmp8964, null
br i1 %.tmp8965, label %.if.true.8966, label %.if.false.8966
.if.true.8966:
%.tmp8967 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8968 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp8967, i32 0, i32 3
%.tmp8969 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g
store %m2811$.GlobalName.type* %.tmp8969, %m2811$.GlobalName.type** %.tmp8968
ret void
br label %.if.end.8966
.if.false.8966:
br label %.if.end.8966
.if.end.8966:
%.tmp8970 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8971 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp8970, i32 0, i32 3
%.tmp8972 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %.tmp8971
%last_global.8973 = alloca %m2811$.GlobalName.type*
store %m2811$.GlobalName.type* %.tmp8972, %m2811$.GlobalName.type** %last_global.8973
%.tmp8975 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp8976 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp8975, i32 0, i32 3
%.tmp8977 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %.tmp8976
%curr_global.8978 = alloca %m2811$.GlobalName.type*
store %m2811$.GlobalName.type* %.tmp8977, %m2811$.GlobalName.type** %curr_global.8978
br label %.for.start.8974
.for.start.8974:
%.tmp8979 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %curr_global.8978
%.tmp8980 = icmp ne %m2811$.GlobalName.type* %.tmp8979, null
br i1 %.tmp8980, label %.for.continue.8974, label %.for.end.8974
.for.continue.8974:
%.tmp8981 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %curr_global.8978
%.tmp8982 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp8981, i32 0, i32 4
%.tmp8983 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %.tmp8982
%.tmp8984 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8983, i32 0, i32 0
%.tmp8985 = load i8*, i8** %.tmp8984
%.tmp8986 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g
%.tmp8987 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp8986, i32 0, i32 4
%.tmp8988 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %.tmp8987
%.tmp8989 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp8988, i32 0, i32 0
%.tmp8990 = load i8*, i8** %.tmp8989
%.tmp8991 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp8985, i8* %.tmp8990)
%.tmp8992 = icmp eq i32 %.tmp8991, 0
br i1 %.tmp8992, label %.if.true.8993, label %.if.false.8993
.if.true.8993:
ret void
br label %.if.end.8993
.if.false.8993:
br label %.if.end.8993
.if.end.8993:
%.tmp8994 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %curr_global.8978
store %m2811$.GlobalName.type* %.tmp8994, %m2811$.GlobalName.type** %last_global.8973
%.tmp8995 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %curr_global.8978
%.tmp8996 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp8995, i32 0, i32 5
%.tmp8997 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %.tmp8996
store %m2811$.GlobalName.type* %.tmp8997, %m2811$.GlobalName.type** %curr_global.8978
br label %.for.start.8974
.for.end.8974:
%.tmp8998 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %last_global.8973
%.tmp8999 = getelementptr %m2811$.GlobalName.type, %m2811$.GlobalName.type* %.tmp8998, i32 0, i32 5
%.tmp9000 = load %m2811$.GlobalName.type*, %m2811$.GlobalName.type** %g
store %m2811$.GlobalName.type* %.tmp9000, %m2811$.GlobalName.type** %.tmp8999
ret void
}
define void @m311$append_error.v.m2811$.CompilerCtx.typep.m312$.Error.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m312$.Error.type* %.e.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%e = alloca %m312$.Error.type*
store %m312$.Error.type* %.e.arg, %m312$.Error.type** %e
%.tmp9001 = getelementptr %m2811$.ErrorList.type, %m2811$.ErrorList.type* null, i32 1
%.tmp9002 = ptrtoint %m2811$.ErrorList.type* %.tmp9001 to i32
%.tmp9003 = call i8*(i32) @malloc(i32 %.tmp9002)
%.tmp9004 = bitcast i8* %.tmp9003 to %m2811$.ErrorList.type*
%new_err.9005 = alloca %m2811$.ErrorList.type*
store %m2811$.ErrorList.type* %.tmp9004, %m2811$.ErrorList.type** %new_err.9005
%.tmp9006 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %new_err.9005
%.tmp9007 = getelementptr %m2811$.ErrorList.type, %m2811$.ErrorList.type* %.tmp9006, i32 0, i32 2
store i1 0, i1* %.tmp9007
%.tmp9008 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %new_err.9005
%.tmp9009 = getelementptr %m2811$.ErrorList.type, %m2811$.ErrorList.type* %.tmp9008, i32 0, i32 0
%.tmp9010 = load %m312$.Error.type*, %m312$.Error.type** %e
store %m312$.Error.type* %.tmp9010, %m312$.Error.type** %.tmp9009
%.tmp9011 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %new_err.9005
%.tmp9012 = getelementptr %m2811$.ErrorList.type, %m2811$.ErrorList.type* %.tmp9011, i32 0, i32 1
store %m2811$.ErrorList.type* null, %m2811$.ErrorList.type** %.tmp9012
%.tmp9013 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp9014 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp9013, i32 0, i32 2
%.tmp9015 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %.tmp9014
%.tmp9016 = icmp eq %m2811$.ErrorList.type* %.tmp9015, null
br i1 %.tmp9016, label %.if.true.9017, label %.if.false.9017
.if.true.9017:
%.tmp9018 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp9019 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp9018, i32 0, i32 2
%.tmp9020 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %new_err.9005
store %m2811$.ErrorList.type* %.tmp9020, %m2811$.ErrorList.type** %.tmp9019
ret void
br label %.if.end.9017
.if.false.9017:
br label %.if.end.9017
.if.end.9017:
%last.9021 = alloca %m2811$.ErrorList.type*
store %m2811$.ErrorList.type* null, %m2811$.ErrorList.type** %last.9021
%.tmp9023 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp9024 = getelementptr %m2811$.CompilerCtx.type, %m2811$.CompilerCtx.type* %.tmp9023, i32 0, i32 2
%.tmp9025 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %.tmp9024
store %m2811$.ErrorList.type* %.tmp9025, %m2811$.ErrorList.type** %last.9021
br label %.for.start.9022
.for.start.9022:
%.tmp9026 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %last.9021
%.tmp9027 = getelementptr %m2811$.ErrorList.type, %m2811$.ErrorList.type* %.tmp9026, i32 0, i32 1
%.tmp9028 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %.tmp9027
%.tmp9029 = icmp ne %m2811$.ErrorList.type* %.tmp9028, null
br i1 %.tmp9029, label %.for.continue.9022, label %.for.end.9022
.for.continue.9022:
%.tmp9030 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %last.9021
%.tmp9031 = getelementptr %m2811$.ErrorList.type, %m2811$.ErrorList.type* %.tmp9030, i32 0, i32 1
%.tmp9032 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %.tmp9031
store %m2811$.ErrorList.type* %.tmp9032, %m2811$.ErrorList.type** %last.9021
br label %.for.start.9022
.for.end.9022:
%.tmp9033 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %last.9021
%.tmp9034 = getelementptr %m2811$.ErrorList.type, %m2811$.ErrorList.type* %.tmp9033, i32 0, i32 1
%.tmp9035 = load %m2811$.ErrorList.type*, %m2811$.ErrorList.type** %new_err.9005
store %m2811$.ErrorList.type* %.tmp9035, %m2811$.ErrorList.type** %.tmp9034
ret void
}
define i8* @m311$syn_function_name.cp.m996$.Node.typep(%m996$.Node.type* %.stmt.arg) {
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp9036 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9037 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9036, i32 0, i32 8
%.tmp9038 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9037
%.tmp9039 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9038, i32 0, i32 9
%.tmp9040 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9039
%.tmp9041 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9040, i32 0, i32 1
%.tmp9042 = load i8*, i8** %.tmp9041
ret i8* %.tmp9042
}
define %m996$.Node.type* @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m996$.Node.type*
store %m996$.Node.type* %.node.arg, %m996$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp9044 = load %m996$.Node.type*, %m996$.Node.type** %node
%n.9045 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9044, %m996$.Node.type** %n.9045
br label %.for.start.9043
.for.start.9043:
%.tmp9046 = load %m996$.Node.type*, %m996$.Node.type** %n.9045
%.tmp9047 = icmp ne %m996$.Node.type* %.tmp9046, null
br i1 %.tmp9047, label %.for.continue.9043, label %.for.end.9043
.for.continue.9043:
%.tmp9048 = load %m996$.Node.type*, %m996$.Node.type** %n.9045
%.tmp9049 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9048, i32 0, i32 0
%.tmp9050 = load i8*, i8** %.tmp9049
%.tmp9051 = load i8*, i8** %type
%.tmp9052 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9050, i8* %.tmp9051)
%.tmp9053 = icmp eq i32 %.tmp9052, 0
br i1 %.tmp9053, label %.if.true.9054, label %.if.false.9054
.if.true.9054:
%.tmp9055 = load %m996$.Node.type*, %m996$.Node.type** %n.9045
ret %m996$.Node.type* %.tmp9055
br label %.if.end.9054
.if.false.9054:
br label %.if.end.9054
.if.end.9054:
%.tmp9056 = load %m996$.Node.type*, %m996$.Node.type** %n.9045
%.tmp9057 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9056, i32 0, i32 9
%.tmp9058 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9057
store %m996$.Node.type* %.tmp9058, %m996$.Node.type** %n.9045
br label %.for.start.9043
.for.end.9043:
%.tmp9059 = bitcast ptr null to %m996$.Node.type*
ret %m996$.Node.type* %.tmp9059
}
define %m2811$.Type.type* @m311$syn_function_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp9060 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
%function_type.9061 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp9060, %m2811$.Type.type** %function_type.9061
%.tmp9062 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp9063 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9064 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9063, i32 0, i32 8
%.tmp9065 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9064
%.tmp9066 = call %m2811$.Type.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp9062, %m996$.Node.type* %.tmp9065)
%return_value_type.9067 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp9066, %m2811$.Type.type** %return_value_type.9067
%.tmp9068 = load %m2811$.Type.type*, %m2811$.Type.type** %function_type.9061
%.tmp9069 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9068, i32 0, i32 0
%.tmp9071 = getelementptr [9 x i8], [9 x i8]*@.str9070, i32 0, i32 0
store i8* %.tmp9071, i8** %.tmp9069
%.tmp9072 = load %m2811$.Type.type*, %m2811$.Type.type** %function_type.9061
%.tmp9073 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9072, i32 0, i32 3
%.tmp9074 = load %m2811$.Type.type*, %m2811$.Type.type** %return_value_type.9067
store %m2811$.Type.type* %.tmp9074, %m2811$.Type.type** %.tmp9073
%.tmp9075 = load %m2811$.Type.type*, %m2811$.Type.type** %return_value_type.9067
%last_type.9076 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp9075, %m2811$.Type.type** %last_type.9076
%.tmp9077 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9078 = call %m996$.Node.type*(%m996$.Node.type*) @m311$syn_function_params.m996$.Node.typep.m996$.Node.typep(%m996$.Node.type* %.tmp9077)
%params.9079 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9078, %m996$.Node.type** %params.9079
%.tmp9081 = load %m996$.Node.type*, %m996$.Node.type** %params.9079
%param_ptr.9082 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9081, %m996$.Node.type** %param_ptr.9082
br label %.for.start.9080
.for.start.9080:
%.tmp9083 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9082
%.tmp9084 = icmp ne %m996$.Node.type* %.tmp9083, null
br i1 %.tmp9084, label %.for.continue.9080, label %.for.end.9080
.for.continue.9080:
%.tmp9085 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9082
%.tmp9086 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9085, i32 0, i32 0
%.tmp9087 = load i8*, i8** %.tmp9086
%.tmp9089 = getelementptr [5 x i8], [5 x i8]*@.str9088, i32 0, i32 0
%.tmp9090 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9087, i8* %.tmp9089)
%.tmp9091 = icmp eq i32 %.tmp9090, 0
br i1 %.tmp9091, label %.if.true.9092, label %.if.false.9092
.if.true.9092:
%.tmp9093 = load %m2811$.Type.type*, %m2811$.Type.type** %last_type.9076
%.tmp9094 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9093, i32 0, i32 4
%.tmp9095 = load %m2811$.Type.type*, %m2811$.Type.type** %last_type.9076
%.tmp9096 = call %m2811$.Type.type*(%m2811$.Type.type*) @m311$type_clone.m2811$.Type.typep.m2811$.Type.typep(%m2811$.Type.type* %.tmp9095)
store %m2811$.Type.type* %.tmp9096, %m2811$.Type.type** %.tmp9094
%.tmp9097 = load %m2811$.Type.type*, %m2811$.Type.type** %last_type.9076
%.tmp9098 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9097, i32 0, i32 4
%.tmp9099 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp9098
%.tmp9100 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9099, i32 0, i32 4
store %m2811$.Type.type* null, %m2811$.Type.type** %.tmp9100
%.tmp9101 = load %m2811$.Type.type*, %m2811$.Type.type** %last_type.9076
%.tmp9102 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9101, i32 0, i32 4
%.tmp9103 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp9102
store %m2811$.Type.type* %.tmp9103, %m2811$.Type.type** %last_type.9076
%.tmp9104 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9082
%.tmp9105 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9104, i32 0, i32 9
%.tmp9106 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9105
%.tmp9107 = icmp ne %m996$.Node.type* %.tmp9106, null
br i1 %.tmp9107, label %.if.true.9108, label %.if.false.9108
.if.true.9108:
%.tmp9109 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9082
%.tmp9110 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9109, i32 0, i32 9
%.tmp9111 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9110
store %m996$.Node.type* %.tmp9111, %m996$.Node.type** %param_ptr.9082
br label %.if.end.9108
.if.false.9108:
br label %.if.end.9108
.if.end.9108:
%.tmp9112 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9082
%.tmp9113 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9112, i32 0, i32 9
%.tmp9114 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9113
%.tmp9115 = icmp ne %m996$.Node.type* %.tmp9114, null
br i1 %.tmp9115, label %.if.true.9116, label %.if.false.9116
.if.true.9116:
%.tmp9117 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9082
%.tmp9118 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9117, i32 0, i32 9
%.tmp9119 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9118
store %m996$.Node.type* %.tmp9119, %m996$.Node.type** %param_ptr.9082
br label %.if.end.9116
.if.false.9116:
store %m996$.Node.type* null, %m996$.Node.type** %param_ptr.9082
br label %.if.end.9116
.if.end.9116:
br label %.if.end.9092
.if.false.9092:
%.tmp9120 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp9121 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9082
%.tmp9122 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9121, i32 0, i32 8
%.tmp9123 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9122
%.tmp9124 = call %m2811$.Type.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp9120, %m996$.Node.type* %.tmp9123)
%param_type.9125 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp9124, %m2811$.Type.type** %param_type.9125
%.tmp9126 = load %m2811$.Type.type*, %m2811$.Type.type** %last_type.9076
%.tmp9127 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9126, i32 0, i32 4
%.tmp9128 = load %m2811$.Type.type*, %m2811$.Type.type** %param_type.9125
store %m2811$.Type.type* %.tmp9128, %m2811$.Type.type** %.tmp9127
%.tmp9129 = load %m2811$.Type.type*, %m2811$.Type.type** %param_type.9125
store %m2811$.Type.type* %.tmp9129, %m2811$.Type.type** %last_type.9076
%.tmp9130 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9082
%.tmp9131 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9130, i32 0, i32 9
%.tmp9132 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9131
store %m996$.Node.type* %.tmp9132, %m996$.Node.type** %param_ptr.9082
%.tmp9133 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9082
%.tmp9134 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9133, i32 0, i32 9
%.tmp9135 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9134
%.tmp9136 = icmp ne %m996$.Node.type* %.tmp9135, null
br i1 %.tmp9136, label %.if.true.9137, label %.if.false.9137
.if.true.9137:
%.tmp9138 = load %m996$.Node.type*, %m996$.Node.type** %param_ptr.9082
%.tmp9139 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9138, i32 0, i32 9
%.tmp9140 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9139
%.tmp9141 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9140, i32 0, i32 9
%.tmp9142 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9141
store %m996$.Node.type* %.tmp9142, %m996$.Node.type** %param_ptr.9082
br label %.if.end.9137
.if.false.9137:
store %m996$.Node.type* null, %m996$.Node.type** %param_ptr.9082
br label %.if.end.9137
.if.end.9137:
br label %.if.end.9092
.if.end.9092:
br label %.for.start.9080
.for.end.9080:
%.tmp9143 = load %m2811$.Type.type*, %m2811$.Type.type** %function_type.9061
ret %m2811$.Type.type* %.tmp9143
}
define %m996$.Node.type* @m311$syn_function_params.m996$.Node.typep.m996$.Node.typep(%m996$.Node.type* %.stmt.arg) {
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp9144 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9146 = getelementptr [10 x i8], [10 x i8]*@.str9145, i32 0, i32 0
%.tmp9147 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp9144, i8* %.tmp9146)
%params.9148 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9147, %m996$.Node.type** %params.9148
%.tmp9149 = load %m996$.Node.type*, %m996$.Node.type** %params.9148
%.tmp9150 = icmp eq %m996$.Node.type* %.tmp9149, null
br i1 %.tmp9150, label %.if.true.9151, label %.if.false.9151
.if.true.9151:
%.tmp9152 = bitcast ptr null to %m996$.Node.type*
ret %m996$.Node.type* %.tmp9152
br label %.if.end.9151
.if.false.9151:
br label %.if.end.9151
.if.end.9151:
%.tmp9153 = load %m996$.Node.type*, %m996$.Node.type** %params.9148
%.tmp9154 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9153, i32 0, i32 8
%.tmp9155 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9154
ret %m996$.Node.type* %.tmp9155
}
define %m2811$.Type.type* @m311$node_to_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.ctx.arg, %m996$.Node.type* %.stmt.arg) {
%ctx = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.ctx.arg, %m2811$.CompilerCtx.type** %ctx
%stmt = alloca %m996$.Node.type*
store %m996$.Node.type* %.stmt.arg, %m996$.Node.type** %stmt
%.tmp9156 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9157 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9156, i32 0, i32 0
%.tmp9158 = load i8*, i8** %.tmp9157
%.tmp9159 = icmp eq i8* %.tmp9158, null
br i1 %.tmp9159, label %.if.true.9160, label %.if.false.9160
.if.true.9160:
%.tmp9162 = getelementptr [15 x i8], [15 x i8]*@.str9161, i32 0, i32 0
%.tmp9163 = call i32(i8*,...) @printf(i8* %.tmp9162)
br label %.if.end.9160
.if.false.9160:
br label %.if.end.9160
.if.end.9160:
%.tmp9164 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9165 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9164, i32 0, i32 0
%.tmp9166 = load i8*, i8** %.tmp9165
%.tmp9168 = getelementptr [11 x i8], [11 x i8]*@.str9167, i32 0, i32 0
%.tmp9169 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9166, i8* %.tmp9168)
%.tmp9170 = icmp eq i32 %.tmp9169, 0
br i1 %.tmp9170, label %.if.true.9171, label %.if.false.9171
.if.true.9171:
%.tmp9172 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp9173 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9174 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9173, i32 0, i32 8
%.tmp9175 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9174
%.tmp9176 = call %m2811$.Type.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp9172, %m996$.Node.type* %.tmp9175)
%t.9177 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp9176, %m2811$.Type.type** %t.9177
%.tmp9178 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9177
%.tmp9179 = icmp ne %m2811$.Type.type* %.tmp9178, null
%.tmp9180 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9181 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9180, i32 0, i32 9
%.tmp9182 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9181
%.tmp9183 = icmp ne %m996$.Node.type* %.tmp9182, null
%.tmp9184 = and i1 %.tmp9179, %.tmp9183
br i1 %.tmp9184, label %.if.true.9185, label %.if.false.9185
.if.true.9185:
%.tmp9186 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9187 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9186, i32 0, i32 9
%.tmp9188 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9187
%.tmp9189 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9188, i32 0, i32 0
%.tmp9190 = load i8*, i8** %.tmp9189
%.tmp9192 = getelementptr [13 x i8], [13 x i8]*@.str9191, i32 0, i32 0
%.tmp9193 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9190, i8* %.tmp9192)
%.tmp9194 = icmp eq i32 %.tmp9193, 0
br i1 %.tmp9194, label %.if.true.9195, label %.if.false.9195
.if.true.9195:
%.tmp9196 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
%fn_type.9197 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp9196, %m2811$.Type.type** %fn_type.9197
%.tmp9198 = load %m2811$.Type.type*, %m2811$.Type.type** %fn_type.9197
%.tmp9199 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9198, i32 0, i32 0
%.tmp9201 = getelementptr [9 x i8], [9 x i8]*@.str9200, i32 0, i32 0
store i8* %.tmp9201, i8** %.tmp9199
%.tmp9202 = load %m2811$.Type.type*, %m2811$.Type.type** %fn_type.9197
%.tmp9203 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9202, i32 0, i32 3
%.tmp9204 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9177
store %m2811$.Type.type* %.tmp9204, %m2811$.Type.type** %.tmp9203
%.tmp9205 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9206 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9205, i32 0, i32 9
%.tmp9207 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9206
%.tmp9208 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9207, i32 0, i32 8
%.tmp9209 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9208
%.tmp9210 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9209, i32 0, i32 9
%.tmp9211 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9210
%fst_operator.9212 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9211, %m996$.Node.type** %fst_operator.9212
%.tmp9213 = load %m996$.Node.type*, %m996$.Node.type** %fst_operator.9212
%.tmp9214 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9213, i32 0, i32 0
%.tmp9215 = load i8*, i8** %.tmp9214
%.tmp9217 = getelementptr [15 x i8], [15 x i8]*@.str9216, i32 0, i32 0
%.tmp9218 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9215, i8* %.tmp9217)
%.tmp9219 = icmp eq i32 %.tmp9218, 0
br i1 %.tmp9219, label %.if.true.9220, label %.if.false.9220
.if.true.9220:
%.tmp9221 = load %m2811$.Type.type*, %m2811$.Type.type** %fn_type.9197
%.tmp9222 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9221, i32 0, i32 3
%.tmp9223 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp9222
%last_fn_value.9224 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp9223, %m2811$.Type.type** %last_fn_value.9224
%.tmp9226 = load %m996$.Node.type*, %m996$.Node.type** %fst_operator.9212
%.tmp9227 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9226, i32 0, i32 8
%.tmp9228 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9227
%t.9229 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9228, %m996$.Node.type** %t.9229
br label %.for.start.9225
.for.start.9225:
%.tmp9230 = load %m996$.Node.type*, %m996$.Node.type** %t.9229
%.tmp9231 = icmp ne %m996$.Node.type* %.tmp9230, null
br i1 %.tmp9231, label %.for.continue.9225, label %.for.end.9225
.for.continue.9225:
%.tmp9232 = load %m2811$.Type.type*, %m2811$.Type.type** %last_fn_value.9224
%.tmp9233 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9232, i32 0, i32 4
%.tmp9234 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp9235 = load %m996$.Node.type*, %m996$.Node.type** %t.9229
%.tmp9236 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9235, i32 0, i32 8
%.tmp9237 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9236
%.tmp9238 = call %m2811$.Type.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp9234, %m996$.Node.type* %.tmp9237)
store %m2811$.Type.type* %.tmp9238, %m2811$.Type.type** %.tmp9233
%.tmp9239 = load %m2811$.Type.type*, %m2811$.Type.type** %last_fn_value.9224
%.tmp9240 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9239, i32 0, i32 4
%.tmp9241 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp9240
store %m2811$.Type.type* %.tmp9241, %m2811$.Type.type** %last_fn_value.9224
%.tmp9242 = load %m996$.Node.type*, %m996$.Node.type** %t.9229
%.tmp9243 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9242, i32 0, i32 9
%.tmp9244 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9243
%.tmp9245 = icmp ne %m996$.Node.type* %.tmp9244, null
br i1 %.tmp9245, label %.if.true.9246, label %.if.false.9246
.if.true.9246:
%.tmp9247 = load %m996$.Node.type*, %m996$.Node.type** %t.9229
%.tmp9248 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9247, i32 0, i32 9
%.tmp9249 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9248
store %m996$.Node.type* %.tmp9249, %m996$.Node.type** %t.9229
br label %.if.end.9246
.if.false.9246:
br label %.if.end.9246
.if.end.9246:
%.tmp9250 = load %m996$.Node.type*, %m996$.Node.type** %t.9229
%.tmp9251 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9250, i32 0, i32 9
%.tmp9252 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9251
store %m996$.Node.type* %.tmp9252, %m996$.Node.type** %t.9229
br label %.for.start.9225
.for.end.9225:
br label %.if.end.9220
.if.false.9220:
br label %.if.end.9220
.if.end.9220:
%.tmp9253 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
%t_ptr.9254 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp9253, %m2811$.Type.type** %t_ptr.9254
%.tmp9255 = load %m2811$.Type.type*, %m2811$.Type.type** %t_ptr.9254
%.tmp9256 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9255, i32 0, i32 0
%.tmp9258 = getelementptr [4 x i8], [4 x i8]*@.str9257, i32 0, i32 0
store i8* %.tmp9258, i8** %.tmp9256
%.tmp9259 = load %m2811$.Type.type*, %m2811$.Type.type** %t_ptr.9254
%.tmp9260 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9259, i32 0, i32 3
%.tmp9261 = load %m2811$.Type.type*, %m2811$.Type.type** %fn_type.9197
store %m2811$.Type.type* %.tmp9261, %m2811$.Type.type** %.tmp9260
%.tmp9262 = load %m2811$.Type.type*, %m2811$.Type.type** %t_ptr.9254
store %m2811$.Type.type* %.tmp9262, %m2811$.Type.type** %t.9177
br label %.if.end.9195
.if.false.9195:
br label %.if.end.9195
.if.end.9195:
br label %.if.end.9185
.if.false.9185:
br label %.if.end.9185
.if.end.9185:
%.tmp9263 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9177
ret %m2811$.Type.type* %.tmp9263
br label %.if.end.9171
.if.false.9171:
br label %.if.end.9171
.if.end.9171:
%.tmp9264 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
%t.9265 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp9264, %m2811$.Type.type** %t.9265
%.tmp9266 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9267 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9266, i32 0, i32 0
%.tmp9268 = load i8*, i8** %.tmp9267
%.tmp9270 = getelementptr [10 x i8], [10 x i8]*@.str9269, i32 0, i32 0
%.tmp9271 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9268, i8* %.tmp9270)
%.tmp9272 = icmp eq i32 %.tmp9271, 0
br i1 %.tmp9272, label %.if.true.9273, label %.if.false.9273
.if.true.9273:
%.tmp9274 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
%.tmp9275 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9274, i32 0, i32 0
%.tmp9277 = getelementptr [7 x i8], [7 x i8]*@.str9276, i32 0, i32 0
store i8* %.tmp9277, i8** %.tmp9275
%.tmp9278 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
%.tmp9279 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9278, i32 0, i32 1
store i8* null, i8** %.tmp9279
%.tmp9280 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9281 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9280, i32 0, i32 8
%.tmp9282 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9281
%.tmp9284 = getelementptr [5 x i8], [5 x i8]*@.str9283, i32 0, i32 0
%.tmp9285 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp9282, i8* %.tmp9284)
%curr_type.9286 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9285, %m996$.Node.type** %curr_type.9286
%.tmp9287 = load %m996$.Node.type*, %m996$.Node.type** %curr_type.9286
%.tmp9288 = icmp ne %m996$.Node.type* %.tmp9287, null
br i1 %.tmp9288, label %.if.true.9289, label %.if.false.9289
.if.true.9289:
%.tmp9290 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
%.tmp9291 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9290, i32 0, i32 3
%.tmp9292 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp9293 = load %m996$.Node.type*, %m996$.Node.type** %curr_type.9286
%.tmp9294 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9293, i32 0, i32 8
%.tmp9295 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9294
%.tmp9296 = call %m2811$.Type.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp9292, %m996$.Node.type* %.tmp9295)
store %m2811$.Type.type* %.tmp9296, %m2811$.Type.type** %.tmp9291
%.tmp9297 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
%.tmp9298 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9297, i32 0, i32 3
%.tmp9299 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp9298
%.tmp9300 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9299, i32 0, i32 1
%.tmp9301 = load %m996$.Node.type*, %m996$.Node.type** %curr_type.9286
%.tmp9302 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9301, i32 0, i32 9
%.tmp9303 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9302
%.tmp9304 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9303, i32 0, i32 1
%.tmp9305 = load i8*, i8** %.tmp9304
store i8* %.tmp9305, i8** %.tmp9300
%.tmp9306 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
%.tmp9307 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9306, i32 0, i32 3
%.tmp9308 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp9307
%curr_t.9309 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp9308, %m2811$.Type.type** %curr_t.9309
%.tmp9311 = load %m996$.Node.type*, %m996$.Node.type** %curr_type.9286
%.tmp9312 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9311, i32 0, i32 9
%.tmp9313 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9312
%.tmp9315 = getelementptr [5 x i8], [5 x i8]*@.str9314, i32 0, i32 0
%.tmp9316 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp9313, i8* %.tmp9315)
store %m996$.Node.type* %.tmp9316, %m996$.Node.type** %curr_type.9286
br label %.for.start.9310
.for.start.9310:
%.tmp9317 = load %m996$.Node.type*, %m996$.Node.type** %curr_type.9286
%.tmp9318 = icmp ne %m996$.Node.type* %.tmp9317, null
br i1 %.tmp9318, label %.for.continue.9310, label %.for.end.9310
.for.continue.9310:
%.tmp9319 = load %m2811$.Type.type*, %m2811$.Type.type** %curr_t.9309
%.tmp9320 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9319, i32 0, i32 4
%.tmp9321 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp9322 = load %m996$.Node.type*, %m996$.Node.type** %curr_type.9286
%.tmp9323 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9322, i32 0, i32 8
%.tmp9324 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9323
%.tmp9325 = call %m2811$.Type.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$node_to_type.m2811$.Type.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp9321, %m996$.Node.type* %.tmp9324)
store %m2811$.Type.type* %.tmp9325, %m2811$.Type.type** %.tmp9320
%.tmp9326 = load %m2811$.Type.type*, %m2811$.Type.type** %curr_t.9309
%.tmp9327 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9326, i32 0, i32 4
%.tmp9328 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp9327
%.tmp9329 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9328, i32 0, i32 1
%.tmp9330 = load %m996$.Node.type*, %m996$.Node.type** %curr_type.9286
%.tmp9331 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9330, i32 0, i32 9
%.tmp9332 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9331
%.tmp9333 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9332, i32 0, i32 1
%.tmp9334 = load i8*, i8** %.tmp9333
store i8* %.tmp9334, i8** %.tmp9329
%.tmp9335 = load %m2811$.Type.type*, %m2811$.Type.type** %curr_t.9309
%.tmp9336 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9335, i32 0, i32 4
%.tmp9337 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp9336
store %m2811$.Type.type* %.tmp9337, %m2811$.Type.type** %curr_t.9309
%.tmp9338 = load %m996$.Node.type*, %m996$.Node.type** %curr_type.9286
%.tmp9339 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9338, i32 0, i32 9
%.tmp9340 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9339
%.tmp9342 = getelementptr [5 x i8], [5 x i8]*@.str9341, i32 0, i32 0
%.tmp9343 = call %m996$.Node.type*(%m996$.Node.type*,i8*) @m311$skip_to_type.m996$.Node.typep.m996$.Node.typep.cp(%m996$.Node.type* %.tmp9340, i8* %.tmp9342)
store %m996$.Node.type* %.tmp9343, %m996$.Node.type** %curr_type.9286
br label %.for.start.9310
.for.end.9310:
br label %.if.end.9289
.if.false.9289:
br label %.if.end.9289
.if.end.9289:
br label %.if.end.9273
.if.false.9273:
%.tmp9344 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9345 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9344, i32 0, i32 0
%.tmp9346 = load i8*, i8** %.tmp9345
%.tmp9348 = getelementptr [12 x i8], [12 x i8]*@.str9347, i32 0, i32 0
%.tmp9349 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9346, i8* %.tmp9348)
%.tmp9350 = icmp eq i32 %.tmp9349, 0
br i1 %.tmp9350, label %.if.true.9351, label %.if.false.9351
.if.true.9351:
%.tmp9353 = getelementptr [1 x i8], [1 x i8]*@.str9352, i32 0, i32 0
%err_msg.9354 = alloca i8*
store i8* %.tmp9353, i8** %err_msg.9354
%.tmp9355 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp9356 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9357 = call %m2811$.ScopeItem.type*(%m2811$.CompilerCtx.type*,%m996$.Node.type*) @m311$find_defined.m2811$.ScopeItem.typep.m2811$.CompilerCtx.typep.m996$.Node.typep(%m2811$.CompilerCtx.type* %.tmp9355, %m996$.Node.type* %.tmp9356)
%base.9358 = alloca %m2811$.ScopeItem.type*
store %m2811$.ScopeItem.type* %.tmp9357, %m2811$.ScopeItem.type** %base.9358
%.tmp9359 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %base.9358
%.tmp9360 = icmp eq %m2811$.ScopeItem.type* %.tmp9359, null
br i1 %.tmp9360, label %.if.true.9361, label %.if.false.9361
.if.true.9361:
%.tmp9362 = getelementptr i8*, i8** %err_msg.9354, i32 0
%.tmp9364 = getelementptr [37 x i8], [37 x i8]*@.str9363, i32 0, i32 0
%.tmp9365 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9366 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9365, i32 0, i32 8
%.tmp9367 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9366
%.tmp9368 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9367, i32 0, i32 1
%.tmp9369 = load i8*, i8** %.tmp9368
%.tmp9370 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9362, i8* %.tmp9364, i8* %.tmp9369)
%.tmp9371 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp9372 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9373 = load i8*, i8** %err_msg.9354
call void(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$new_error.v.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp9371, %m996$.Node.type* %.tmp9372, i8* %.tmp9373)
%.tmp9374 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
%.tmp9375 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9374, i32 0, i32 0
%.tmp9377 = getelementptr [6 x i8], [6 x i8]*@.str9376, i32 0, i32 0
store i8* %.tmp9377, i8** %.tmp9375
%.tmp9378 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
ret %m2811$.Type.type* %.tmp9378
br label %.if.end.9361
.if.false.9361:
br label %.if.end.9361
.if.end.9361:
%.tmp9379 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
%.tmp9380 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9379, i32 0, i32 0
%.tmp9382 = getelementptr [10 x i8], [10 x i8]*@.str9381, i32 0, i32 0
store i8* %.tmp9382, i8** %.tmp9380
%.tmp9383 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
%.tmp9384 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9383, i32 0, i32 1
%.tmp9385 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %base.9358
%.tmp9386 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp9385, i32 0, i32 0
%.tmp9387 = load i8*, i8** %.tmp9386
store i8* %.tmp9387, i8** %.tmp9384
%.tmp9388 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
%.tmp9389 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9388, i32 0, i32 2
%.tmp9390 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %base.9358
%.tmp9391 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp9390, i32 0, i32 1
%.tmp9392 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %.tmp9391
%.tmp9393 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp9392, i32 0, i32 0
%.tmp9394 = load i8*, i8** %.tmp9393
store i8* %.tmp9394, i8** %.tmp9389
%.tmp9395 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
%.tmp9396 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9395, i32 0, i32 3
%.tmp9397 = load %m2811$.ScopeItem.type*, %m2811$.ScopeItem.type** %base.9358
%.tmp9398 = getelementptr %m2811$.ScopeItem.type, %m2811$.ScopeItem.type* %.tmp9397, i32 0, i32 1
%.tmp9399 = load %m2811$.AssignableInfo.type*, %m2811$.AssignableInfo.type** %.tmp9398
%.tmp9400 = getelementptr %m2811$.AssignableInfo.type, %m2811$.AssignableInfo.type* %.tmp9399, i32 0, i32 4
%.tmp9401 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp9400
store %m2811$.Type.type* %.tmp9401, %m2811$.Type.type** %.tmp9396
br label %.if.end.9351
.if.false.9351:
%.tmp9402 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9403 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9402, i32 0, i32 1
%.tmp9404 = load i8*, i8** %.tmp9403
%.tmp9406 = getelementptr [4 x i8], [4 x i8]*@.str9405, i32 0, i32 0
%.tmp9407 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9404, i8* %.tmp9406)
%.tmp9408 = icmp eq i32 %.tmp9407, 0
br i1 %.tmp9408, label %.if.true.9409, label %.if.false.9409
.if.true.9409:
%.tmp9410 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
%.tmp9411 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9410, i32 0, i32 0
%.tmp9413 = getelementptr [4 x i8], [4 x i8]*@.str9412, i32 0, i32 0
store i8* %.tmp9413, i8** %.tmp9411
%.tmp9414 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
%.tmp9415 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9414, i32 0, i32 3
%.tmp9416 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
store %m2811$.Type.type* %.tmp9416, %m2811$.Type.type** %.tmp9415
%.tmp9417 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
%.tmp9418 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9417, i32 0, i32 3
%.tmp9419 = load %m2811$.Type.type*, %m2811$.Type.type** %.tmp9418
%.tmp9420 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9419, i32 0, i32 0
%.tmp9422 = getelementptr [4 x i8], [4 x i8]*@.str9421, i32 0, i32 0
store i8* %.tmp9422, i8** %.tmp9420
br label %.if.end.9409
.if.false.9409:
%.tmp9423 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9424 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9423, i32 0, i32 0
%.tmp9425 = load i8*, i8** %.tmp9424
%.tmp9427 = getelementptr [5 x i8], [5 x i8]*@.str9426, i32 0, i32 0
%.tmp9428 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9425, i8* %.tmp9427)
%.tmp9429 = icmp eq i32 %.tmp9428, 0
br i1 %.tmp9429, label %.if.true.9430, label %.if.false.9430
.if.true.9430:
%.tmp9431 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
%.tmp9432 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9431, i32 0, i32 0
%.tmp9433 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9434 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9433, i32 0, i32 1
%.tmp9435 = load i8*, i8** %.tmp9434
store i8* %.tmp9435, i8** %.tmp9432
br label %.if.end.9430
.if.false.9430:
%.tmp9436 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9437 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9436, i32 0, i32 1
%.tmp9438 = load i8*, i8** %.tmp9437
%.tmp9440 = getelementptr [4 x i8], [4 x i8]*@.str9439, i32 0, i32 0
%.tmp9441 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9438, i8* %.tmp9440)
%.tmp9442 = icmp eq i32 %.tmp9441, 0
br i1 %.tmp9442, label %.if.true.9443, label %.if.false.9443
.if.true.9443:
%.tmp9444 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
%.tmp9445 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9444, i32 0, i32 0
%.tmp9447 = getelementptr [7 x i8], [7 x i8]*@.str9446, i32 0, i32 0
store i8* %.tmp9447, i8** %.tmp9445
br label %.if.end.9443
.if.false.9443:
%.tmp9448 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp9449 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9451 = getelementptr [54 x i8], [54 x i8]*@.str9450, i32 0, i32 0
%.tmp9452 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp9448, %m996$.Node.type* %.tmp9449, i8* %.tmp9451)
%.tmp9453 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9454 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9453, i32 0, i32 0
%.tmp9455 = load i8*, i8** %.tmp9454
%.tmp9456 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9457 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9456, i32 0, i32 1
%.tmp9458 = load i8*, i8** %.tmp9457
%.tmp9459 = call i32(i8*,...) @printf(i8* %.tmp9452, i8* %.tmp9455, i8* %.tmp9458)
%.tmp9460 = bitcast ptr null to %m2811$.Type.type*
ret %m2811$.Type.type* %.tmp9460
br label %.if.end.9443
.if.end.9443:
br label %.if.end.9430
.if.end.9430:
br label %.if.end.9409
.if.end.9409:
br label %.if.end.9351
.if.end.9351:
br label %.if.end.9273
.if.end.9273:
%.tmp9462 = load %m996$.Node.type*, %m996$.Node.type** %stmt
%.tmp9463 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9462, i32 0, i32 9
%.tmp9464 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9463
%ptr.9465 = alloca %m996$.Node.type*
store %m996$.Node.type* %.tmp9464, %m996$.Node.type** %ptr.9465
br label %.for.start.9461
.for.start.9461:
%.tmp9466 = load %m996$.Node.type*, %m996$.Node.type** %ptr.9465
%.tmp9467 = icmp ne %m996$.Node.type* %.tmp9466, null
br i1 %.tmp9467, label %.for.continue.9461, label %.for.end.9461
.for.continue.9461:
%.tmp9468 = load %m996$.Node.type*, %m996$.Node.type** %ptr.9465
%.tmp9469 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9468, i32 0, i32 1
%.tmp9470 = load i8*, i8** %.tmp9469
%.tmp9472 = getelementptr [2 x i8], [2 x i8]*@.str9471, i32 0, i32 0
%.tmp9473 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9470, i8* %.tmp9472)
%.tmp9474 = icmp eq i32 %.tmp9473, 0
br i1 %.tmp9474, label %.if.true.9475, label %.if.false.9475
.if.true.9475:
%.tmp9476 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
%pt.9477 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp9476, %m2811$.Type.type** %pt.9477
%.tmp9478 = load %m2811$.Type.type*, %m2811$.Type.type** %pt.9477
%.tmp9479 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9478, i32 0, i32 0
%.tmp9481 = getelementptr [4 x i8], [4 x i8]*@.str9480, i32 0, i32 0
store i8* %.tmp9481, i8** %.tmp9479
%.tmp9482 = load %m2811$.Type.type*, %m2811$.Type.type** %pt.9477
%.tmp9483 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9482, i32 0, i32 3
%.tmp9484 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
store %m2811$.Type.type* %.tmp9484, %m2811$.Type.type** %.tmp9483
%.tmp9485 = load %m2811$.Type.type*, %m2811$.Type.type** %pt.9477
store %m2811$.Type.type* %.tmp9485, %m2811$.Type.type** %t.9265
br label %.if.end.9475
.if.false.9475:
%.tmp9486 = load %m996$.Node.type*, %m996$.Node.type** %ptr.9465
%.tmp9487 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9486, i32 0, i32 1
%.tmp9488 = load i8*, i8** %.tmp9487
%.tmp9490 = getelementptr [2 x i8], [2 x i8]*@.str9489, i32 0, i32 0
%.tmp9491 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9488, i8* %.tmp9490)
%.tmp9492 = icmp eq i32 %.tmp9491, 0
br i1 %.tmp9492, label %.if.true.9493, label %.if.false.9493
.if.true.9493:
%.tmp9494 = load %m996$.Node.type*, %m996$.Node.type** %ptr.9465
%.tmp9495 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9494, i32 0, i32 9
%.tmp9496 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9495
%.tmp9497 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9496, i32 0, i32 1
%.tmp9498 = load i8*, i8** %.tmp9497
%.tmp9500 = getelementptr [2 x i8], [2 x i8]*@.str9499, i32 0, i32 0
%.tmp9501 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9498, i8* %.tmp9500)
%.tmp9502 = icmp eq i32 %.tmp9501, 0
br i1 %.tmp9502, label %.if.true.9503, label %.if.false.9503
.if.true.9503:
%.tmp9504 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
%slice_type.9505 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp9504, %m2811$.Type.type** %slice_type.9505
%.tmp9506 = load %m2811$.Type.type*, %m2811$.Type.type** %slice_type.9505
%.tmp9507 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9506, i32 0, i32 0
%.tmp9509 = getelementptr [7 x i8], [7 x i8]*@.str9508, i32 0, i32 0
store i8* %.tmp9509, i8** %.tmp9507
%.tmp9510 = load %m2811$.Type.type*, %m2811$.Type.type** %slice_type.9505
%.tmp9511 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9510, i32 0, i32 1
%.tmp9513 = getelementptr [6 x i8], [6 x i8]*@.str9512, i32 0, i32 0
store i8* %.tmp9513, i8** %.tmp9511
%.tmp9514 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
%slice_c_array.9515 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp9514, %m2811$.Type.type** %slice_c_array.9515
%.tmp9516 = load %m2811$.Type.type*, %m2811$.Type.type** %slice_c_array.9515
%.tmp9517 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9516, i32 0, i32 0
%.tmp9519 = getelementptr [4 x i8], [4 x i8]*@.str9518, i32 0, i32 0
store i8* %.tmp9519, i8** %.tmp9517
%.tmp9520 = load %m2811$.Type.type*, %m2811$.Type.type** %slice_c_array.9515
%.tmp9521 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9520, i32 0, i32 1
%.tmp9523 = getelementptr [6 x i8], [6 x i8]*@.str9522, i32 0, i32 0
store i8* %.tmp9523, i8** %.tmp9521
%.tmp9524 = load %m2811$.Type.type*, %m2811$.Type.type** %slice_c_array.9515
%.tmp9525 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9524, i32 0, i32 3
%.tmp9526 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
store %m2811$.Type.type* %.tmp9526, %m2811$.Type.type** %.tmp9525
%.tmp9527 = load %m2811$.Type.type*, %m2811$.Type.type** %slice_type.9505
%.tmp9528 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9527, i32 0, i32 3
%.tmp9529 = load %m2811$.Type.type*, %m2811$.Type.type** %slice_c_array.9515
store %m2811$.Type.type* %.tmp9529, %m2811$.Type.type** %.tmp9528
%.tmp9530 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
%slice_len.9531 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp9530, %m2811$.Type.type** %slice_len.9531
%.tmp9532 = load %m2811$.Type.type*, %m2811$.Type.type** %slice_len.9531
%.tmp9533 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9532, i32 0, i32 0
%.tmp9535 = getelementptr [4 x i8], [4 x i8]*@.str9534, i32 0, i32 0
store i8* %.tmp9535, i8** %.tmp9533
%.tmp9536 = load %m2811$.Type.type*, %m2811$.Type.type** %slice_len.9531
%.tmp9537 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9536, i32 0, i32 1
%.tmp9539 = getelementptr [4 x i8], [4 x i8]*@.str9538, i32 0, i32 0
store i8* %.tmp9539, i8** %.tmp9537
%.tmp9540 = load %m2811$.Type.type*, %m2811$.Type.type** %slice_c_array.9515
%.tmp9541 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9540, i32 0, i32 4
%.tmp9542 = load %m2811$.Type.type*, %m2811$.Type.type** %slice_len.9531
store %m2811$.Type.type* %.tmp9542, %m2811$.Type.type** %.tmp9541
%.tmp9543 = call %m2811$.Type.type*() @m311$new_type.m2811$.Type.typep()
%slice_cap.9544 = alloca %m2811$.Type.type*
store %m2811$.Type.type* %.tmp9543, %m2811$.Type.type** %slice_cap.9544
%.tmp9545 = load %m2811$.Type.type*, %m2811$.Type.type** %slice_cap.9544
%.tmp9546 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9545, i32 0, i32 0
%.tmp9548 = getelementptr [4 x i8], [4 x i8]*@.str9547, i32 0, i32 0
store i8* %.tmp9548, i8** %.tmp9546
%.tmp9549 = load %m2811$.Type.type*, %m2811$.Type.type** %slice_cap.9544
%.tmp9550 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9549, i32 0, i32 1
%.tmp9552 = getelementptr [4 x i8], [4 x i8]*@.str9551, i32 0, i32 0
store i8* %.tmp9552, i8** %.tmp9550
%.tmp9553 = load %m2811$.Type.type*, %m2811$.Type.type** %slice_len.9531
%.tmp9554 = getelementptr %m2811$.Type.type, %m2811$.Type.type* %.tmp9553, i32 0, i32 4
%.tmp9555 = load %m2811$.Type.type*, %m2811$.Type.type** %slice_cap.9544
store %m2811$.Type.type* %.tmp9555, %m2811$.Type.type** %.tmp9554
%.tmp9556 = load %m2811$.Type.type*, %m2811$.Type.type** %slice_type.9505
store %m2811$.Type.type* %.tmp9556, %m2811$.Type.type** %t.9265
%.tmp9557 = load %m996$.Node.type*, %m996$.Node.type** %ptr.9465
%.tmp9558 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9557, i32 0, i32 9
%.tmp9559 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9558
store %m996$.Node.type* %.tmp9559, %m996$.Node.type** %ptr.9465
br label %.if.end.9503
.if.false.9503:
br label %.if.end.9503
.if.end.9503:
br label %.if.end.9493
.if.false.9493:
%.tmp9560 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %ctx
%.tmp9561 = load %m996$.Node.type*, %m996$.Node.type** %ptr.9465
%.tmp9563 = getelementptr [49 x i8], [49 x i8]*@.str9562, i32 0, i32 0
%.tmp9564 = call i8*(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$err_tmpl.cp.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp9560, %m996$.Node.type* %.tmp9561, i8* %.tmp9563)
%.tmp9565 = load %m996$.Node.type*, %m996$.Node.type** %ptr.9465
%.tmp9566 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9565, i32 0, i32 1
%.tmp9567 = load i8*, i8** %.tmp9566
%.tmp9568 = call i32(i8*,...) @printf(i8* %.tmp9564, i8* %.tmp9567)
%.tmp9569 = bitcast ptr null to %m2811$.Type.type*
ret %m2811$.Type.type* %.tmp9569
br label %.if.end.9493
.if.end.9493:
br label %.if.end.9475
.if.end.9475:
%.tmp9570 = load %m996$.Node.type*, %m996$.Node.type** %ptr.9465
%.tmp9571 = getelementptr %m996$.Node.type, %m996$.Node.type* %.tmp9570, i32 0, i32 9
%.tmp9572 = load %m996$.Node.type*, %m996$.Node.type** %.tmp9571
store %m996$.Node.type* %.tmp9572, %m996$.Node.type** %ptr.9465
br label %.for.start.9461
.for.end.9461:
%.tmp9573 = load %m2811$.Type.type*, %m2811$.Type.type** %t.9265
ret %m2811$.Type.type* %.tmp9573
}
define i1 @compile_file.b.cp.cp(i8* %.filename.arg, i8* %.outname.arg) {
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%outname = alloca i8*
store i8* %.outname.arg, i8** %outname
%.tmp9574 = load i32, i32* @STDERR
%.tmp9576 = getelementptr [2 x i8], [2 x i8]*@.str9575, i32 0, i32 0
%.tmp9577 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp9574, i8* %.tmp9576)
%stderr.9578 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9577, %m0$.File.type** %stderr.9578
%.tmp9579 = call %m0$.File.type*() @tmpfile()
%llvm_code.9580 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9579, %m0$.File.type** %llvm_code.9580
%.tmp9581 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9580
%.tmp9582 = load i8*, i8** %filename
%.tmp9583 = call %m2811$.CompilerCtx.type*(%m0$.File.type*,i8*) @m311$new_context.m2811$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp9581, i8* %.tmp9582)
%compiler_ctx.9584 = alloca %m2811$.CompilerCtx.type*
store %m2811$.CompilerCtx.type* %.tmp9583, %m2811$.CompilerCtx.type** %compiler_ctx.9584
%.tmp9585 = load %m2811$.CompilerCtx.type*, %m2811$.CompilerCtx.type** %compiler_ctx.9584
%.tmp9586 = bitcast ptr null to %m996$.Node.type*
%.tmp9587 = load i8*, i8** %filename
%.tmp9588 = call i1(%m2811$.CompilerCtx.type*,%m996$.Node.type*,i8*) @m311$compile_file.b.m2811$.CompilerCtx.typep.m996$.Node.typep.cp(%m2811$.CompilerCtx.type* %.tmp9585, %m996$.Node.type* %.tmp9586, i8* %.tmp9587)
br i1 %.tmp9588, label %.if.true.9589, label %.if.false.9589
.if.true.9589:
%.tmp9590 = load %m0$.File.type*, %m0$.File.type** %stderr.9578
%.tmp9592 = getelementptr [34 x i8], [34 x i8]*@.str9591, i32 0, i32 0
%.tmp9593 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9590, i8* %.tmp9592)
ret i1 0
br label %.if.end.9589
.if.false.9589:
br label %.if.end.9589
.if.end.9589:
%.tmp9594 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9580
%.tmp9595 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp9594)
%.tmp9596 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9580
%.tmp9597 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp9596)
%llvm_code_size.9598 = alloca i32
store i32 %.tmp9597, i32* %llvm_code_size.9598
%.tmp9599 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9580
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp9599)
%.tmp9601 = getelementptr [1 x i8], [1 x i8]*@.str9600, i32 0, i32 0
%cmd.9602 = alloca i8*
store i8* %.tmp9601, i8** %cmd.9602
%.tmp9603 = getelementptr i8*, i8** %cmd.9602, i32 0
%.tmp9605 = getelementptr [32 x i8], [32 x i8]*@.str9604, i32 0, i32 0
%.tmp9606 = load i8*, i8** %outname
%.tmp9607 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9603, i8* %.tmp9605, i8* %.tmp9606)
%.tmp9608 = load i8*, i8** %cmd.9602
%.tmp9610 = getelementptr [2 x i8], [2 x i8]*@.str9609, i32 0, i32 0
%.tmp9611 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp9608, i8* %.tmp9610)
%proc.9612 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9611, %m0$.File.type** %proc.9612
%.tmp9613 = load %m0$.File.type*, %m0$.File.type** %proc.9612
%.tmp9614 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp9613)
%.tmp9615 = load %m0$.File.type*, %m0$.File.type** %llvm_code.9580
%.tmp9616 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp9615)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp9614, i32 %.tmp9616)
%.tmp9617 = load %m0$.File.type*, %m0$.File.type** %proc.9612
%.tmp9618 = icmp eq %m0$.File.type* %.tmp9617, null
br i1 %.tmp9618, label %.if.true.9619, label %.if.false.9619
.if.true.9619:
%.tmp9620 = load %m0$.File.type*, %m0$.File.type** %stderr.9578
%.tmp9622 = getelementptr [28 x i8], [28 x i8]*@.str9621, i32 0, i32 0
%.tmp9623 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9620, i8* %.tmp9622)
ret i1 0
br label %.if.end.9619
.if.false.9619:
br label %.if.end.9619
.if.end.9619:
%.tmp9624 = load %m0$.File.type*, %m0$.File.type** %proc.9612
%.tmp9625 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp9624)
%.tmp9626 = icmp ne i32 %.tmp9625, 0
br i1 %.tmp9626, label %.if.true.9627, label %.if.false.9627
.if.true.9627:
%.tmp9628 = load %m0$.File.type*, %m0$.File.type** %stderr.9578
%.tmp9630 = getelementptr [24 x i8], [24 x i8]*@.str9629, i32 0, i32 0
%.tmp9631 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9628, i8* %.tmp9630)
ret i1 0
br label %.if.end.9627
.if.false.9627:
br label %.if.end.9627
.if.end.9627:
%.tmp9632 = getelementptr i8*, i8** %cmd.9602, i32 0
%.tmp9634 = getelementptr [17 x i8], [17 x i8]*@.str9633, i32 0, i32 0
%.tmp9635 = load i8*, i8** %outname
%.tmp9636 = load i8*, i8** %outname
%.tmp9637 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9632, i8* %.tmp9634, i8* %.tmp9635, i8* %.tmp9636)
%.tmp9638 = load i8*, i8** %cmd.9602
%.tmp9640 = getelementptr [2 x i8], [2 x i8]*@.str9639, i32 0, i32 0
%.tmp9641 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp9638, i8* %.tmp9640)
%cc_proc.9642 = alloca %m0$.File.type*
store %m0$.File.type* %.tmp9641, %m0$.File.type** %cc_proc.9642
%.tmp9643 = load %m0$.File.type*, %m0$.File.type** %cc_proc.9642
%.tmp9644 = icmp eq %m0$.File.type* %.tmp9643, null
br i1 %.tmp9644, label %.if.true.9645, label %.if.false.9645
.if.true.9645:
%.tmp9646 = load %m0$.File.type*, %m0$.File.type** %stderr.9578
%.tmp9648 = getelementptr [28 x i8], [28 x i8]*@.str9647, i32 0, i32 0
%.tmp9649 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9646, i8* %.tmp9648)
ret i1 0
br label %.if.end.9645
.if.false.9645:
br label %.if.end.9645
.if.end.9645:
%.tmp9650 = load %m0$.File.type*, %m0$.File.type** %proc.9612
%.tmp9651 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp9650)
%.tmp9652 = icmp ne i32 %.tmp9651, 0
br i1 %.tmp9652, label %.if.true.9653, label %.if.false.9653
.if.true.9653:
%.tmp9654 = load %m0$.File.type*, %m0$.File.type** %stderr.9578
%.tmp9656 = getelementptr [22 x i8], [22 x i8]*@.str9655, i32 0, i32 0
%.tmp9657 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp9654, i8* %.tmp9656)
br label %.if.end.9653
.if.false.9653:
%.tmp9659 = getelementptr [32 x i8], [32 x i8]*@.str9658, i32 0, i32 0
%.tmp9660 = load i8*, i8** %outname
%.tmp9661 = call i32(i8*,...) @printf(i8* %.tmp9659, i8* %.tmp9660)
br label %.if.end.9653
.if.end.9653:
ret i1 1
}
%.Args.type = type {i8*,i8*,i8*,i8**}
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp9662 = load i32, i32* %argc
%.tmp9663 = load i8**, i8*** %argv
%.tmp9664 = call %.Args.type(i32,i8**) @check_args..Args.type.i.cpp(i32 %.tmp9662, i8** %.tmp9663)
%args.9665 = alloca %.Args.type
store %.Args.type %.tmp9664, %.Args.type* %args.9665
%.tmp9666 = getelementptr %.Args.type, %.Args.type* %args.9665, i32 0, i32 1
%.tmp9667 = load i8*, i8** %.tmp9666
%.tmp9668 = getelementptr %.Args.type, %.Args.type* %args.9665, i32 0, i32 2
%.tmp9669 = load i8*, i8** %.tmp9668
%.tmp9670 = call i1(i8*,i8*) @compile_file.b.cp.cp(i8* %.tmp9667, i8* %.tmp9669)
%.tmp9671 = icmp eq i1 %.tmp9670, 0
br i1 %.tmp9671, label %.if.true.9672, label %.if.false.9672
.if.true.9672:
ret i32 0
br label %.if.end.9672
.if.false.9672:
br label %.if.end.9672
.if.end.9672:
%.tmp9673 = getelementptr %.Args.type, %.Args.type* %args.9665, i32 0, i32 0
%.tmp9674 = load i8*, i8** %.tmp9673
%.tmp9676 = getelementptr [4 x i8], [4 x i8]*@.str9675, i32 0, i32 0
%.tmp9677 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9674, i8* %.tmp9676)
%.tmp9678 = icmp eq i32 %.tmp9677, 0
br i1 %.tmp9678, label %.if.true.9679, label %.if.false.9679
.if.true.9679:
%.tmp9681 = getelementptr [1 x i8], [1 x i8]*@.str9680, i32 0, i32 0
%cmd.9682 = alloca i8*
store i8* %.tmp9681, i8** %cmd.9682
%.tmp9683 = getelementptr i8*, i8** %cmd.9682, i32 0
%.tmp9685 = getelementptr [5 x i8], [5 x i8]*@.str9684, i32 0, i32 0
%.tmp9686 = getelementptr %.Args.type, %.Args.type* %args.9665, i32 0, i32 2
%.tmp9687 = load i8*, i8** %.tmp9686
%.tmp9688 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp9683, i8* %.tmp9685, i8* %.tmp9687)
%.tmp9689 = load i8*, i8** %cmd.9682
%.tmp9690 = getelementptr %.Args.type, %.Args.type* %args.9665, i32 0, i32 3
%.tmp9691 = load i8**, i8*** %.tmp9690
%.tmp9692 = call i32(i8*,i8**) @execvp(i8* %.tmp9689, i8** %.tmp9691)
ret i32 %.tmp9692
br label %.if.end.9679
.if.false.9679:
br label %.if.end.9679
.if.end.9679:
ret i32 0
}
define %.Args.type @check_args..Args.type.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp9694 = getelementptr [22 x i8], [22 x i8]*@.str9693, i32 0, i32 0
%tmpl.9695 = alloca i8*
store i8* %.tmp9694, i8** %tmpl.9695
%args.9696 = alloca %.Args.type
%.tmp9697 = getelementptr %.Args.type, %.Args.type* %args.9696, i32 0, i32 0
store i8* null, i8** %.tmp9697
%.tmp9698 = getelementptr %.Args.type, %.Args.type* %args.9696, i32 0, i32 1
store i8* null, i8** %.tmp9698
%.tmp9699 = getelementptr %.Args.type, %.Args.type* %args.9696, i32 0, i32 2
store i8* null, i8** %.tmp9699
%.tmp9700 = getelementptr %.Args.type, %.Args.type* %args.9696, i32 0, i32 3
store i8** null, i8*** %.tmp9700
%.tmp9701 = load i32, i32* %argc
%.tmp9702 = icmp slt i32 %.tmp9701, 2
br i1 %.tmp9702, label %.if.true.9703, label %.if.false.9703
.if.true.9703:
%.tmp9704 = load i8*, i8** %tmpl.9695
%.tmp9705 = load i8**, i8*** %argv
%.tmp9706 = getelementptr i8*, i8** %.tmp9705, i32 0
%.tmp9707 = load i8*, i8** %.tmp9706
%.tmp9708 = call i32(i8*,...) @printf(i8* %.tmp9704, i8* %.tmp9707)
call void(i32) @exit(i32 1)
br label %.if.end.9703
.if.false.9703:
br label %.if.end.9703
.if.end.9703:
%fp.9709 = alloca i32
store i32 1, i32* %fp.9709
%.tmp9710 = getelementptr %.Args.type, %.Args.type* %args.9696, i32 0, i32 0
%.tmp9712 = getelementptr [8 x i8], [8 x i8]*@.str9711, i32 0, i32 0
store i8* %.tmp9712, i8** %.tmp9710
%.tmp9713 = load i8**, i8*** %argv
%.tmp9714 = getelementptr i8*, i8** %.tmp9713, i32 1
%.tmp9715 = load i8*, i8** %.tmp9714
%.tmp9717 = getelementptr [4 x i8], [4 x i8]*@.str9716, i32 0, i32 0
%.tmp9718 = call i32(i8*,i8*) @m3$strcmp.i.cp.cp(i8* %.tmp9715, i8* %.tmp9717)
%.tmp9719 = icmp eq i32 %.tmp9718, 0
br i1 %.tmp9719, label %.if.true.9720, label %.if.false.9720
.if.true.9720:
%.tmp9721 = getelementptr %.Args.type, %.Args.type* %args.9696, i32 0, i32 0
%.tmp9723 = getelementptr [4 x i8], [4 x i8]*@.str9722, i32 0, i32 0
store i8* %.tmp9723, i8** %.tmp9721
store i32 2, i32* %fp.9709
br label %.if.end.9720
.if.false.9720:
br label %.if.end.9720
.if.end.9720:
%.tmp9724 = load i32, i32* %argc
%.tmp9725 = load i32, i32* %fp.9709
%.tmp9726 = add i32 %.tmp9725, 1
%.tmp9727 = icmp slt i32 %.tmp9724, %.tmp9726
br i1 %.tmp9727, label %.if.true.9728, label %.if.false.9728
.if.true.9728:
%.tmp9729 = load i8*, i8** %tmpl.9695
%.tmp9730 = load i8**, i8*** %argv
%.tmp9731 = getelementptr i8*, i8** %.tmp9730, i32 0
%.tmp9732 = load i8*, i8** %.tmp9731
%.tmp9733 = call i32(i8*,...) @printf(i8* %.tmp9729, i8* %.tmp9732)
call void(i32) @exit(i32 1)
br label %.if.end.9728
.if.false.9728:
br label %.if.end.9728
.if.end.9728:
%.tmp9734 = getelementptr %.Args.type, %.Args.type* %args.9696, i32 0, i32 1
%.tmp9735 = load i32, i32* %fp.9709
%.tmp9736 = load i8**, i8*** %argv
%.tmp9737 = getelementptr i8*, i8** %.tmp9736, i32 %.tmp9735
%.tmp9738 = load i8*, i8** %.tmp9737
store i8* %.tmp9738, i8** %.tmp9734
%.tmp9739 = getelementptr %.Args.type, %.Args.type* %args.9696, i32 0, i32 1
%.tmp9740 = load i8*, i8** %.tmp9739
%.tmp9741 = call {i8*,i8*}(i8*) @m2$splitext.scpcp.cp(i8* %.tmp9740)
%ext.9742 = alloca {i8*,i8*}
store {i8*,i8*} %.tmp9741, {i8*,i8*}* %ext.9742
%.tmp9743 = getelementptr %.Args.type, %.Args.type* %args.9696, i32 0, i32 2
%.tmp9744 = getelementptr {i8*,i8*}, {i8*,i8*}* %ext.9742, i32 0, i32 0
%.tmp9745 = load i8*, i8** %.tmp9744
store i8* %.tmp9745, i8** %.tmp9743
%.tmp9746 = load i32, i32* %argc
%.tmp9747 = load i32, i32* %fp.9709
%.tmp9748 = sub i32 %.tmp9746, %.tmp9747
%.tmp9749 = add i32 %.tmp9748, 1
%ac.9750 = alloca i32
store i32 %.tmp9749, i32* %ac.9750
%.tmp9751 = getelementptr %.Args.type, %.Args.type* %args.9696, i32 0, i32 3
%.tmp9752 = load i32, i32* %ac.9750
%.tmp9753 = mul i32 8, %.tmp9752
%.tmp9754 = call i8*(i32) @malloc(i32 %.tmp9753)
%.tmp9755 = bitcast i8* %.tmp9754 to i8**
store i8** %.tmp9755, i8*** %.tmp9751
%.tmp9756 = getelementptr %.Args.type, %.Args.type* %args.9696, i32 0, i32 3
%.tmp9757 = load i8**, i8*** %.tmp9756
%.tmp9758 = getelementptr i8*, i8** %.tmp9757, i32 0
%.tmp9759 = getelementptr %.Args.type, %.Args.type* %args.9696, i32 0, i32 2
%.tmp9760 = load i8*, i8** %.tmp9759
store i8* %.tmp9760, i8** %.tmp9758
%i.9762 = alloca i32
store i32 0, i32* %i.9762
br label %.for.start.9761
.for.start.9761:
%.tmp9763 = load i32, i32* %i.9762
%.tmp9764 = load i32, i32* %argc
%.tmp9765 = load i32, i32* %fp.9709
%.tmp9766 = sub i32 %.tmp9764, %.tmp9765
%.tmp9767 = icmp slt i32 %.tmp9763, %.tmp9766
br i1 %.tmp9767, label %.for.continue.9761, label %.for.end.9761
.for.continue.9761:
%.tmp9768 = getelementptr %.Args.type, %.Args.type* %args.9696, i32 0, i32 3
%.tmp9769 = load i32, i32* %i.9762
%.tmp9770 = add i32 %.tmp9769, 1
%.tmp9771 = load i8**, i8*** %.tmp9768
%.tmp9772 = getelementptr i8*, i8** %.tmp9771, i32 %.tmp9770
%.tmp9773 = load i32, i32* %fp.9709
%.tmp9774 = load i32, i32* %i.9762
%.tmp9775 = add i32 %.tmp9773, %.tmp9774
%.tmp9776 = add i32 %.tmp9775, 1
%.tmp9777 = load i8**, i8*** %argv
%.tmp9778 = getelementptr i8*, i8** %.tmp9777, i32 %.tmp9776
%.tmp9779 = load i8*, i8** %.tmp9778
store i8* %.tmp9779, i8** %.tmp9772
%.tmp9780 = load i32, i32* %i.9762
%.tmp9781 = add i32 %.tmp9780, 1
store i32 %.tmp9781, i32* %i.9762
br label %.for.start.9761
.for.end.9761:
%.tmp9782 = load %.Args.type, %.Args.type* %args.9696
ret %.Args.type %.tmp9782
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
@.str1831 = constant [1 x i8] c"\00"
@.str1871 = constant [22 x i8] c"Matcher type is null\0A\00"
@.str1884 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str1898 = constant [43 x i8] c"Unable to match token by value: %s != \22%s\22\00"
@.str1942 = constant [22 x i8] c"Matcher type is null\0A\00"
@.str1957 = constant [54 x i8] c"Unable to match token by type, expecing \22%s\22 got \22%s\22\00"
@.str2012 = constant [26 x i8] c"Unable to find alias rule\00"
@.str2035 = constant [33 x i8] c"CRITICAL: Parser not implemented\00"
@.str2120 = constant [1 x i8] c"\00"
@.str2124 = constant [29 x i8] c"Grammar rule '%s' not found.\00"
@.str2130 = constant [10 x i8] c"syntax.bn\00"
@.str2137 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str2157 = constant [4 x i8] c"EOF\00"
@.str2171 = constant [32 x i8] c"SyntaxError: parsing ended here\00"
@.str2267 = constant [2 x i8] c"\0A\00"
@.str2276 = constant [3 x i8] c"  \00"
@.str2285 = constant [7 x i8] c"(null)\00"
@.str2289 = constant [2 x i8] c"{\00"
@.str2295 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str2304 = constant [12 x i8] c"\22value\22: %s\00"
@.str2313 = constant [11 x i8] c"\22line\22: %d\00"
@.str2322 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str2331 = constant [9 x i8] c"\22next\22: \00"
@.str2343 = constant [13 x i8] c"\22children\22: \00"
@.str2356 = constant [2 x i8] c"}\00"
@.str2360 = constant [1959 x i8] c"
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

enum: \22enum\22 \22{\22 NL ( WORD (\22(\22 type WORD \22)\22)? \22,\22 | NL )* \22}\22

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
@.str2363 = constant [1885 x i8] c"%%%1$s.tmp0 = getelementptr %2$s, %2$s* %3$s, i32 0, i32 1
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
@.str2369 = constant [1 x i8] c"\00"
@.str2385 = constant [6 x i8] c"%s\5C22\00"
@.str2410 = constant [6 x i8] c"%s\5C0A\00"
@.str2424 = constant [6 x i8] c"%s\5C5C\00"
@.str2440 = constant [8 x i8] c"%s\5C%c%c\00"
@.str2458 = constant [5 x i8] c"%s%c\00"
@.str2467 = constant [5 x i8] c"%s%c\00"
@.str2478 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2515 = constant [7 x i8] c"'\5Cx%x'\00"
@.str2520 = constant [3 x i8] c"%d\00"
@.str2528 = constant [6 x i8] c"'\5C%x'\00"
@.str2533 = constant [3 x i8] c"%d\00"
@.str2541 = constant [6 x i8] c"'\5C%c'\00"
@.str2548 = constant [3 x i8] c"10\00"
@.str2555 = constant [5 x i8] c"'%c'\00"
@.str2560 = constant [3 x i8] c"%d\00"
@.str2609 = constant [16 x i8] c"mono_assignable\00"
@.str2620 = constant [9 x i8] c"operator\00"
@.str2657 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2704 = constant [2 x i8] c"+\00"
@.str2711 = constant [2 x i8] c"-\00"
@.str2720 = constant [2 x i8] c"*\00"
@.str2727 = constant [2 x i8] c"/\00"
@.str2735 = constant [2 x i8] c"%\00"
@.str2744 = constant [3 x i8] c"==\00"
@.str2751 = constant [3 x i8] c"!=\00"
@.str2760 = constant [3 x i8] c">=\00"
@.str2767 = constant [3 x i8] c"<=\00"
@.str2776 = constant [2 x i8] c">\00"
@.str2783 = constant [2 x i8] c"<\00"
@.str2792 = constant [2 x i8] c"&\00"
@.str2800 = constant [2 x i8] c"|\00"
@.str2805 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
@.str2816 = constant [2 x i8] c"?\00"
@.str2822 = constant [54 x i8] c"called 'repr' with malformed type, container is null.\00"
@.str2828 = constant [4 x i8] c"int\00"
@.str2833 = constant [4 x i8] c"i32\00"
@.str2838 = constant [5 x i8] c"void\00"
@.str2843 = constant [5 x i8] c"void\00"
@.str2848 = constant [5 x i8] c"bool\00"
@.str2853 = constant [3 x i8] c"i1\00"
@.str2858 = constant [8 x i8] c"nullptr\00"
@.str2863 = constant [4 x i8] c"ptr\00"
@.str2868 = constant [4 x i8] c"chr\00"
@.str2873 = constant [3 x i8] c"i8\00"
@.str2878 = constant [9 x i8] c"function\00"
@.str2884 = constant [4 x i8] c"%s(\00"
@.str2910 = constant [4 x i8] c"%s,\00"
@.str2915 = constant [5 x i8] c"%s%s\00"
@.str2926 = constant [4 x i8] c"%s)\00"
@.str2934 = constant [4 x i8] c"ptr\00"
@.str2940 = constant [4 x i8] c"%s*\00"
@.str2952 = constant [7 x i8] c"struct\00"
@.str2958 = constant [2 x i8] c"{\00"
@.str2975 = constant [4 x i8] c"%s,\00"
@.str2980 = constant [5 x i8] c"%s%s\00"
@.str2991 = constant [4 x i8] c"%s}\00"
@.str2999 = constant [6 x i8] c"array\00"
@.str3005 = constant [10 x i8] c"[%s x %s]\00"
@.str3024 = constant [10 x i8] c"typealias\00"
@.str3030 = constant [5 x i8] c"%%%s\00"
@.str3040 = constant [7 x i8] c"vararg\00"
@.str3045 = constant [4 x i8] c"...\00"
@.str3050 = constant [6 x i8] c"error\00"
@.str3055 = constant [53 x i8] c":coffee-error: 'repr' not implemented for type '%s'\0A\00"
@.str3071 = constant [8 x i8] c"nullptr\00"
@.str3078 = constant [8 x i8] c"nullptr\00"
@.str3087 = constant [4 x i8] c"ptr\00"
@.str3094 = constant [4 x i8] c"ptr\00"
@.str3102 = constant [10 x i8] c"typealias\00"
@.str3116 = constant [10 x i8] c"typealias\00"
@.str3175 = constant [12 x i8] c"COFFEE_ROOT\00"
@.str3182 = constant [5 x i8] c"HOME\00"
@.str3187 = constant [11 x i8] c"%s/.coffee\00"
@.str3275 = constant [1 x i8] c"\00"
@.str3319 = constant [1 x i8] c"\00"
@.str3323 = constant [5 x i8] c"%c%s\00"
@.str3333 = constant [1 x i8] c"\00"
@.str3337 = constant [7 x i8] c".tmp%d\00"
@.str3423 = constant [39 x i8] c"Grammar error unable to create context\00"
@.str3445 = constant [1 x i8] c"\00"
@.str3490 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str3506 = constant [1 x i8] c"\00"
@.str3510 = constant [26 x i8] c"Unable to open file: '%s'\00"
@.str3529 = constant [6 x i8] c"start\00"
@.str3615 = constant [6 x i8] c"start\00"
@.str3622 = constant [29 x i8] c"Expecting 'start' expression\00"
@.str3625 = constant [7 x i8] c"global\00"
@.str3637 = constant [13 x i8] c"head_comment\00"
@.str3681 = constant [1 x i8] c"\00"
@.str3705 = constant [7 x i8] c"string\00"
@.str3713 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3733 = constant [7 x i8] c"extern\00"
@.str3747 = constant [15 x i8] c"declare %s %s(\00"
@.str3783 = constant [3 x i8] c", \00"
@.str3789 = constant [3 x i8] c"%s\00"
@.str3801 = constant [3 x i8] c")\0A\00"
@.str3810 = constant [1 x i8] c"\00"
@.str3820 = constant [5 x i8] c"%s%s\00"
@.str3828 = constant [9 x i8] c"function\00"
@.str3834 = constant [5 x i8] c"main\00"
@.str3839 = constant [1 x i8] c"\00"
@.str3842 = constant [1 x i8] c"\00"
@.str3853 = constant [6 x i8] c"%s.%s\00"
@.str3869 = constant [1 x i8] c"\00"
@.str3872 = constant [1 x i8] c"\00"
@.str3878 = constant [3 x i8] c"NL\00"
@.str3886 = constant [7 x i8] c"global\00"
@.str3894 = constant [11 x i8] c"assignable\00"
@.str3925 = constant [9 x i8] c"variable\00"
@.str3937 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str3952 = constant [10 x i8] c"typealias\00"
@.str3974 = constant [11 x i8] c"%s.%s.type\00"
@.str3986 = constant [10 x i8] c"typealias\00"
@.str4008 = constant [5 x i8] c"type\00"
@.str4038 = constant [14 x i8] c"%s = type %s\0A\00"
@.str4051 = constant [7 x i8] c"extern\00"
@.str4069 = constant [7 x i8] c"extern\00"
@.str4110 = constant [7 x i8] c"extern\00"
@.str4122 = constant [9 x i8] c"function\00"
@.str4131 = constant [9 x i8] c"function\00"
@.str4170 = constant [14 x i8] c"define %s %s(\00"
@.str4199 = constant [3 x i8] c", \00"
@.str4205 = constant [5 x i8] c"type\00"
@.str4221 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str4236 = constant [5 x i8] c") {\0A\00"
@.str4240 = constant [9 x i8] c"function\00"
@.str4250 = constant [6 x i8] c"block\00"
@.str4265 = constant [3 x i8] c"}\0A\00"
@.str4271 = constant [7 x i8] c"import\00"
@.str4327 = constant [54 x i8] c"Unable to import '%s' no such file or directory. (%s)\00"
@.str4388 = constant [5 x i8] c"m%d$\00"
@.str4439 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str4446 = constant [1 x i8] c"\00"
@.str4450 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str4482 = constant [9 x i8] c"variable\00"
@.str4487 = constant [5 x i8] c"type\00"
@.str4519 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str4532 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str4544 = constant [6 x i8] c"block\00"
@.str4552 = constant [12 x i8] c"expressions\00"
@.str4583 = constant [7 x i8] c"struct\00"
@.str4588 = constant [7 x i8] c"WhAT!\0A\00"
@.str4628 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4640 = constant [28 x i8] c"%s = load %s, %s* %%.tmp%d\0A\00"
@.str4666 = constant [7 x i8] c"struct\00"
@.str4671 = constant [7 x i8] c"WhAT!\0A\00"
@.str4702 = constant [52 x i8] c"%%.tmp%d = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4714 = constant [18 x i8] c"store %s, %s* %s\0A\00"
@.str4739 = constant [7 x i8] c"sizeof\00"
@.str4745 = constant [8 x i8] c"fn_args\00"
@.str4752 = constant [11 x i8] c"assignable\00"
@.str4780 = constant [4 x i8] c"int\00"
@.str4793 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str4802 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str4813 = constant [7 x i8] c"append\00"
@.str4819 = constant [8 x i8] c"fn_args\00"
@.str4826 = constant [11 x i8] c"assignable\00"
@.str4833 = constant [11 x i8] c"assignable\00"
@.str4855 = constant [1 x i8] c"\00"
@.str4859 = constant [5 x i8] c".b%d\00"
@.str4893 = constant [8 x i8] c"realloc\00"
@.str4902 = constant [9 x i8] c"function\00"
@.str4915 = constant [4 x i8] c"ptr\00"
@.str4932 = constant [4 x i8] c"chr\00"
@.str4949 = constant [4 x i8] c"ptr\00"
@.str4970 = constant [4 x i8] c"chr\00"
@.str4991 = constant [4 x i8] c"int\00"
@.str4994 = constant [8 x i8] c"realloc\00"
@.str4996 = constant [7 x i8] c"extern\00"
@.str5003 = constant [4 x i8] c"len\00"
@.str5009 = constant [8 x i8] c"fn_args\00"
@.str5016 = constant [11 x i8] c"assignable\00"
@.str5024 = constant [1 x i8] c"\00"
@.str5040 = constant [46 x i8] c"Imports %s must not start with '/' character.\00"
@.str5061 = constant [13 x i8] c"%s/lib/%s.bn\00"
@.str5067 = constant [1 x i8] c"\00"
@.str5073 = constant [6 x i8] c"%s.bn\00"
@.str5078 = constant [9 x i8] c"%s/%s.bn\00"
@.str5102 = constant [35 x i8] c"unable to compile function address\00"
@.str5108 = constant [8 x i8] c"fn_args\00"
@.str5112 = constant [1 x i8] c"\00"
@.str5115 = constant [1 x i8] c"\00"
@.str5123 = constant [4 x i8] c"ptr\00"
@.str5143 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str5167 = constant [11 x i8] c"assignable\00"
@.str5191 = constant [11 x i8] c"assignable\00"
@.str5203 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str5221 = constant [5 x i8] c"%s, \00"
@.str5246 = constant [7 x i8] c"vararg\00"
@.str5259 = constant [1 x i8] c"\00"
@.str5263 = constant [58 x i8] c"types.Type for argument %d does not match: '%s', got '%s'\00"
@.str5280 = constant [8 x i8] c"%s%s %s\00"
@.str5297 = constant [7 x i8] c"vararg\00"
@.str5308 = constant [11 x i8] c"assignable\00"
@.str5317 = constant [7 x i8] c"vararg\00"
@.str5323 = constant [43 x i8] c"Function '%s' takes %d arguments, %d given\00"
@.str5359 = constant [7 x i8] c"vararg\00"
@.str5370 = constant [42 x i8] c"Function '%s' takes %d arguments, 0 given\00"
@.str5388 = constant [5 x i8] c"void\00"
@.str5396 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str5428 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str5443 = constant [1 x i8] c"\00"
@.str5456 = constant [7 x i8] c"return\00"
@.str5462 = constant [9 x i8] c"function\00"
@.str5471 = constant [40 x i8] c"'return' used outside of function scope\00"
@.str5480 = constant [3 x i8] c"NL\00"
@.str5505 = constant [1 x i8] c"\00"
@.str5509 = constant [67 x i8] c"trying to return '%s' from function declared with return type '%s'\00"
@.str5528 = constant [11 x i8] c"ret %s %s\0A\00"
@.str5541 = constant [10 x i8] c"ret void\0A\00"
@.str5545 = constant [3 x i8] c"NL\00"
@.str5551 = constant [8 x i8] c"fn_call\00"
@.str5562 = constant [12 x i8] c"declaration\00"
@.str5571 = constant [11 x i8] c"assignment\00"
@.str5579 = constant [11 x i8] c"assignable\00"
@.str5607 = constant [1 x i8] c"\00"
@.str5611 = constant [37 x i8] c"cannot assign type '%s' to type '%s'\00"
@.str5640 = constant [4 x i8] c"ptr\00"
@.str5649 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str5659 = constant [9 x i8] c"if_block\00"
@.str5667 = constant [9 x i8] c"for_loop\00"
@.str5675 = constant [8 x i8] c"keyword\00"
@.str5681 = constant [4 x i8] c"for\00"
@.str5688 = constant [1 x i8] c"\00"
@.str5692 = constant [42 x i8] c"'%s' keyword used outside 'for' statement\00"
@.str5708 = constant [6 x i8] c"break\00"
@.str5716 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5727 = constant [9 x i8] c"continue\00"
@.str5735 = constant [15 x i8] c"br label %%%s\0A\00"
@.str5742 = constant [9 x i8] c"function\00"
@.str5751 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str5782 = constant [4 x i8] c"ptr\00"
@.str5791 = constant [4 x i8] c"chr\00"
@.str5802 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5811 = constant [9 x i8] c"function\00"
@.str5824 = constant [5 x i8] c"void\00"
@.str5854 = constant [21 x i8] c"llvm.init.trampoline\00"
@.str5856 = constant [7 x i8] c"extern\00"
@.str5864 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5873 = constant [9 x i8] c"function\00"
@.str5888 = constant [23 x i8] c"llvm.adjust.trampoline\00"
@.str5890 = constant [7 x i8] c"extern\00"
@.str5898 = constant [5 x i8] c"mmap\00"
@.str5907 = constant [9 x i8] c"function\00"
@.str5933 = constant [4 x i8] c"int\00"
@.str5945 = constant [4 x i8] c"int\00"
@.str5957 = constant [4 x i8] c"int\00"
@.str5969 = constant [4 x i8] c"int\00"
@.str5981 = constant [4 x i8] c"int\00"
@.str5987 = constant [5 x i8] c"mmap\00"
@.str5989 = constant [7 x i8] c"extern\00"
@.str5995 = constant [5 x i8] c"WORD\00"
@.str6018 = constant [9 x i8] c"function\00"
@.str6042 = constant [4 x i8] c"ptr\00"
@.str6051 = constant [7 x i8] c"struct\00"
@.str6065 = constant [1 x i8] c"\00"
@.str6069 = constant [5 x i8] c"@.%d\00"
@.str6083 = constant [101 x i8] c"%%.tmem%d = call i8*(i8*,i32,i32,i32,i32,i32) @mmap(i8* null, i32 72, i32 7, i32 34, i32 -1, i32 0)\0A\00"
@.str6090 = constant [100 x i8] c"call void(i8*,i8*,i8*) @llvm.init.trampoline(i8* %%.tmem%d, i8* bitcast (%s* %s to i8*), i8* null)\0A\00"
@.str6101 = constant [66 x i8] c"%%.trmp%d = call i8*(i8*) @llvm.adjust.trampoline(i8* %%.tmem%d)\0A\00"
@.str6109 = constant [35 x i8] c"%s = bitcast i8* %%.trmp%d to %s*\0A\00"
@.str6130 = constant [14 x i8] c"define %s %s(\00"
@.str6138 = constant [9 x i8] c"function\00"
@.str6146 = constant [13 x i8] c"%s nest %%.0\00"
@.str6173 = constant [3 x i8] c", \00"
@.str6179 = constant [5 x i8] c"type\00"
@.str6195 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str6210 = constant [5 x i8] c") {\0A\00"
@.str6218 = constant [6 x i8] c"block\00"
@.str6231 = constant [3 x i8] c"}\0A\00"
@.str6257 = constant [12 x i8] c"expressions\00"
@.str6273 = constant [3 x i8] c"NL\00"
@.str6290 = constant [7 x i8] c"return\00"
@.str6298 = constant [5 x i8] c"void\00"
@.str6309 = constant [21 x i8] c"Missing return value\00"
@.str6314 = constant [10 x i8] c"ret void\0A\00"
@.str6331 = constant [14 x i8] c".for.start.%d\00"
@.str6336 = constant [12 x i8] c".for.end.%d\00"
@.str6341 = constant [4 x i8] c"for\00"
@.str6349 = constant [12 x i8] c"declaration\00"
@.str6360 = constant [11 x i8] c"assignment\00"
@.str6370 = constant [9 x i8] c"OPERATOR\00"
@.str6377 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str6388 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str6395 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str6402 = constant [9 x i8] c"OPERATOR\00"
@.str6413 = constant [9 x i8] c"OPERATOR\00"
@.str6420 = constant [39 x i8] c"Expecting boolean condition, found ';'\00"
@.str6432 = constant [9 x i8] c"OPERATOR\00"
@.str6437 = constant [6 x i8] c"block\00"
@.str6442 = constant [11 x i8] c"else_block\00"
@.str6452 = constant [13 x i8] c".for.else.%d\00"
@.str6459 = constant [48 x i8] c"br %s %s, label %%.for.continue.%d, label %%%s\0A\00"
@.str6474 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str6493 = constant [15 x i8] c"br label %%%s\0A\00"
@.str6503 = constant [15 x i8] c".for.else.%d:\0A\00"
@.str6510 = constant [6 x i8] c"block\00"
@.str6519 = constant [15 x i8] c"br label %%%s\0A\00"
@.str6526 = constant [5 x i8] c"%s:\0A\00"
@.str6540 = constant [5 x i8] c"type\00"
@.str6555 = constant [11 x i8] c"assignable\00"
@.str6570 = constant [9 x i8] c"variable\00"
@.str6575 = constant [5 x i8] c"WORD\00"
@.str6584 = constant [31 x i8] c"unable to get declaration name\00"
@.str6602 = constant [1 x i8] c"\00"
@.str6606 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str6616 = constant [1 x i8] c"\00"
@.str6620 = constant [6 x i8] c"%s.%d\00"
@.str6670 = constant [1 x i8] c"\00"
@.str6674 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str6691 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str6703 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6744 = constant [4 x i8] c"int\00"
@.str6751 = constant [4 x i8] c"chr\00"
@.str6759 = constant [5 x i8] c"bool\00"
@.str6768 = constant [21 x i8] c"store %s %d, %s* %s\0A\00"
@.str6777 = constant [4 x i8] c"ptr\00"
@.str6785 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str6788 = constant [5 x i8] c"null\00"
@.str6796 = constant [7 x i8] c"struct\00"
@.str6817 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6837 = constant [10 x i8] c"typealias\00"
@.str6860 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str6880 = constant [6 x i8] c"error\00"
@.str6887 = constant [44 x i8] c"Default type not existent for type: %s (%s)\00"
@.str6904 = constant [11 x i8] c"assignable\00"
@.str6921 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str6936 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str6943 = constant [6 x i8] c"block\00"
@.str6952 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str6959 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str6966 = constant [11 x i8] c"elif_block\00"
@.str6978 = constant [11 x i8] c"else_block\00"
@.str6988 = constant [6 x i8] c"block\00"
@.str6998 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str7005 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str7026 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str7035 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str7069 = constant [1 x i8] c"\00"
@.str7080 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str7100 = constant [43 x i8] c"Name '%s' is already defined in this scope\00"
@.str7134 = constant [7 x i8] c"module\00"
@.str7187 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str7217 = constant [1 x i8] c"\00"
@.str7220 = constant [1 x i8] c"\00"
@.str7228 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str7236 = constant [9 x i8] c"function\00"
@.str7243 = constant [7 x i8] c"extern\00"
@.str7255 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str7276 = constant [9 x i8] c"variable\00"
@.str7298 = constant [4 x i8] c"ptr\00"
@.str7317 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str7341 = constant [10 x i8] c"typealias\00"
@.str7352 = constant [7 x i8] c"struct\00"
@.str7358 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str7410 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str7431 = constant [9 x i8] c"variable\00"
@.str7442 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str7463 = constant [9 x i8] c"variable\00"
@.str7471 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str7479 = constant [1 x i8] c"\00"
@.str7487 = constant [17 x i8] c"addr_destination\00"
@.str7494 = constant [16 x i8] c"mono_assignable\00"
@.str7502 = constant [11 x i8] c"assignable\00"
@.str7516 = constant [12 x i8] c"destination\00"
@.str7521 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str7549 = constant [41 x i8] c"name '%s' was not declared in this scope\00"
@.str7568 = constant [7 x i8] c"module\00"
@.str7590 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str7661 = constant [6 x i8] c"slice\00"
@.str7674 = constant [45 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 0\0A\00"
@.str7716 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str7737 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str7761 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str7784 = constant [16 x i8] c"mono_assignable\00"
@.str7810 = constant [5 x i8] c"cast\00"
@.str7820 = constant [5 x i8] c"type\00"
@.str7845 = constant [8 x i8] c"bitcast\00"
@.str7860 = constant [6 x i8] c"slice\00"
@.str7865 = constant [48 x i8] c"Casting array to slices is not implemented yet\0A\00"
@.str7873 = constant [4 x i8] c"ptr\00"
@.str7880 = constant [4 x i8] c"ptr\00"
@.str7899 = constant [4 x i8] c"i%d\00"
@.str7904 = constant [4 x i8] c"i%d\00"
@.str7912 = constant [5 x i8] c"sext\00"
@.str7914 = constant [6 x i8] c"trunc\00"
@.str7919 = constant [21 x i8] c"%s = %s %s %s to %s\0A\00"
@.str7939 = constant [16 x i8] c"mono_assignable\00"
@.str8001 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str8024 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str8031 = constant [2 x i8] c"+\00"
@.str8036 = constant [4 x i8] c"add\00"
@.str8041 = constant [2 x i8] c"-\00"
@.str8046 = constant [4 x i8] c"sub\00"
@.str8051 = constant [2 x i8] c"*\00"
@.str8056 = constant [4 x i8] c"mul\00"
@.str8061 = constant [2 x i8] c"/\00"
@.str8066 = constant [5 x i8] c"sdiv\00"
@.str8071 = constant [3 x i8] c"==\00"
@.str8076 = constant [8 x i8] c"icmp eq\00"
@.str8081 = constant [3 x i8] c"!=\00"
@.str8086 = constant [8 x i8] c"icmp ne\00"
@.str8091 = constant [2 x i8] c">\00"
@.str8096 = constant [9 x i8] c"icmp sgt\00"
@.str8101 = constant [2 x i8] c"<\00"
@.str8106 = constant [9 x i8] c"icmp slt\00"
@.str8111 = constant [2 x i8] c"&\00"
@.str8116 = constant [4 x i8] c"and\00"
@.str8121 = constant [2 x i8] c"|\00"
@.str8126 = constant [3 x i8] c"or\00"
@.str8131 = constant [3 x i8] c">=\00"
@.str8136 = constant [9 x i8] c"icmp sge\00"
@.str8141 = constant [3 x i8] c"<=\00"
@.str8146 = constant [9 x i8] c"icmp sle\00"
@.str8151 = constant [2 x i8] c"%\00"
@.str8156 = constant [5 x i8] c"srem\00"
@.str8160 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str8167 = constant [4 x i8] c"add\00"
@.str8174 = constant [3 x i8] c"==\00"
@.str8181 = constant [3 x i8] c"!=\00"
@.str8189 = constant [2 x i8] c"|\00"
@.str8197 = constant [2 x i8] c"&\00"
@.str8205 = constant [2 x i8] c">\00"
@.str8213 = constant [2 x i8] c"<\00"
@.str8221 = constant [3 x i8] c">=\00"
@.str8229 = constant [3 x i8] c"<=\00"
@.str8237 = constant [5 x i8] c"bool\00"
@.str8241 = constant [4 x i8] c"int\00"
@.str8248 = constant [1 x i8] c"\00"
@.str8251 = constant [1 x i8] c"\00"
@.str8259 = constant [7 x i8] c"NUMBER\00"
@.str8273 = constant [4 x i8] c"int\00"
@.str8287 = constant [5 x i8] c"WORD\00"
@.str8297 = constant [5 x i8] c"null\00"
@.str8304 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str8318 = constant [5 x i8] c"null\00"
@.str8327 = constant [8 x i8] c"nullptr\00"
@.str8334 = constant [17 x i8] c"addr_destination\00"
@.str8346 = constant [12 x i8] c"destination\00"
@.str8396 = constant [4 x i8] c"ptr\00"
@.str8415 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str8429 = constant [9 x i8] c"function\00"
@.str8444 = constant [4 x i8] c"ptr\00"
@.str8452 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str8466 = constant [8 x i8] c"boolean\00"
@.str8480 = constant [5 x i8] c"bool\00"
@.str8489 = constant [6 x i8] c"false\00"
@.str8496 = constant [2 x i8] c"0\00"
@.str8500 = constant [2 x i8] c"1\00"
@.str8507 = constant [8 x i8] c"fn_call\00"
@.str8524 = constant [7 x i8] c"STRING\00"
@.str8550 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str8566 = constant [4 x i8] c"ptr\00"
@.str8579 = constant [4 x i8] c"chr\00"
@.str8586 = constant [4 x i8] c"CHR\00"
@.str8602 = constant [2 x i8] c"0\00"
@.str8618 = constant [22 x i8] c"Invalid character: %s\00"
@.str8634 = constant [4 x i8] c"chr\00"
@.str8638 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str8666 = constant [22 x i8] c"called 'abbr' on null\00"
@.str8672 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str8677 = constant [4 x i8] c"int\00"
@.str8682 = constant [2 x i8] c"i\00"
@.str8687 = constant [5 x i8] c"bool\00"
@.str8692 = constant [2 x i8] c"b\00"
@.str8697 = constant [5 x i8] c"void\00"
@.str8702 = constant [2 x i8] c"v\00"
@.str8707 = constant [4 x i8] c"chr\00"
@.str8712 = constant [2 x i8] c"c\00"
@.str8717 = constant [4 x i8] c"ptr\00"
@.str8722 = constant [1 x i8] c"\00"
@.str8726 = constant [4 x i8] c"%sp\00"
@.str8737 = constant [10 x i8] c"typealias\00"
@.str8748 = constant [7 x i8] c"struct\00"
@.str8753 = constant [2 x i8] c"s\00"
@.str8764 = constant [5 x i8] c"%s%s\00"
@.str8777 = constant [9 x i8] c"function\00"
@.str8782 = constant [2 x i8] c"f\00"
@.str8787 = constant [6 x i8] c"error\00"
@.str8792 = constant [2 x i8] c"?\00"
@.str8794 = constant [45 x i8] c":coffee-error: unable to abbreviate type %s\0A\00"
@.str8804 = constant [1 x i8] c"\00"
@.str8808 = constant [7 x i8] c".str%d\00"
@.str8823 = constant [6 x i8] c"array\00"
@.str8836 = constant [4 x i8] c"chr\00"
@.str8857 = constant [3 x i8] c"%d\00"
@.str8864 = constant [7 x i8] c"string\00"
@.str8900 = constant [7 x i8] c"module\00"
@.str8951 = constant [4 x i8] c"%s\0A\00"
@.str9070 = constant [9 x i8] c"function\00"
@.str9088 = constant [5 x i8] c"WORD\00"
@.str9145 = constant [10 x i8] c"fn_params\00"
@.str9161 = constant [15 x i8] c"Stmt is null!\0A\00"
@.str9167 = constant [11 x i8] c"basic_type\00"
@.str9191 = constant [13 x i8] c"type_trailer\00"
@.str9200 = constant [9 x i8] c"function\00"
@.str9216 = constant [15 x i8] c"type_fn_params\00"
@.str9257 = constant [4 x i8] c"ptr\00"
@.str9269 = constant [10 x i8] c"structdef\00"
@.str9276 = constant [7 x i8] c"struct\00"
@.str9283 = constant [5 x i8] c"type\00"
@.str9314 = constant [5 x i8] c"type\00"
@.str9341 = constant [5 x i8] c"type\00"
@.str9347 = constant [12 x i8] c"dotted_name\00"
@.str9352 = constant [1 x i8] c"\00"
@.str9363 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str9376 = constant [6 x i8] c"error\00"
@.str9381 = constant [10 x i8] c"typealias\00"
@.str9405 = constant [4 x i8] c"str\00"
@.str9412 = constant [4 x i8] c"ptr\00"
@.str9421 = constant [4 x i8] c"chr\00"
@.str9426 = constant [5 x i8] c"WORD\00"
@.str9439 = constant [4 x i8] c"...\00"
@.str9446 = constant [7 x i8] c"vararg\00"
@.str9450 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str9471 = constant [2 x i8] c"*\00"
@.str9480 = constant [4 x i8] c"ptr\00"
@.str9489 = constant [2 x i8] c"[\00"
@.str9499 = constant [2 x i8] c"]\00"
@.str9508 = constant [7 x i8] c"struct\00"
@.str9512 = constant [6 x i8] c"slice\00"
@.str9518 = constant [4 x i8] c"ptr\00"
@.str9522 = constant [6 x i8] c"c_arr\00"
@.str9534 = constant [4 x i8] c"int\00"
@.str9538 = constant [4 x i8] c"len\00"
@.str9547 = constant [4 x i8] c"int\00"
@.str9551 = constant [4 x i8] c"cap\00"
@.str9562 = constant [49 x i8] c"Unable to parse token '%s' after type definition\00"
@.str9575 = constant [2 x i8] c"w\00"
@.str9591 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str9600 = constant [1 x i8] c"\00"
@.str9604 = constant [32 x i8] c"tee debug.ll | llc - -o debug.s\00"
@.str9609 = constant [2 x i8] c"w\00"
@.str9621 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str9629 = constant [24 x i8] c"error on llc execution\0A\00"
@.str9633 = constant [17 x i8] c"cc debug.s -o %s\00"
@.str9639 = constant [2 x i8] c"w\00"
@.str9647 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str9655 = constant [22 x i8] c"error on cc execution\00"
@.str9658 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str9675 = constant [4 x i8] c"run\00"
@.str9680 = constant [1 x i8] c"\00"
@.str9684 = constant [5 x i8] c"./%s\00"
@.str9693 = constant [22 x i8] c"Usage: %s <filename>\0A\00"
@.str9711 = constant [8 x i8] c"compile\00"
@.str9716 = constant [4 x i8] c"run\00"
@.str9722 = constant [4 x i8] c"run\00"
