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
%idx = alloca i32
store i32 0, i32* %idx
br label %.for.start.25
.for.start.25:
%.tmp26 = load i32, i32* %idx
%.tmp27 = load i8*, i8** %string
%.tmp28 = getelementptr i8, i8* %.tmp27, i32 %.tmp26
%.tmp29 = load i8, i8* %.tmp28
%.tmp30 = icmp ne i8 %.tmp29, 0
br i1 %.tmp30, label %.for.continue.25, label %.for.end.25
.for.continue.25:
%.tmp31 = load i32, i32* %idx
%.tmp32 = load i8*, i8** %string
%.tmp33 = getelementptr i8, i8* %.tmp32, i32 %.tmp31
%.tmp34 = load i8, i8* %.tmp33
%c = alloca i8
store i8 %.tmp34, i8* %c
%.tmp35 = load i8, i8* %c
%.tmp36 = icmp eq i8 %.tmp35, 95
br i1 %.tmp36, label %.if.true.37, label %.if.false.37
.if.true.37:
br label %.if.end.37
.if.false.37:
%.tmp38 = load i8, i8* %c
%.tmp39 = icmp slt i8 %.tmp38, 97
%.tmp40 = load i8, i8* %c
%.tmp41 = icmp sgt i8 %.tmp40, 122
%.tmp42 = or i1 %.tmp39, %.tmp41
br i1 %.tmp42, label %.if.true.43, label %.if.false.43
.if.true.43:
ret i1 0
br label %.if.end.43
.if.false.43:
br label %.if.end.43
.if.end.43:
br label %.if.end.37
.if.end.37:
%.tmp44 = load i32, i32* %idx
%.tmp45 = add i32 %.tmp44, 1
store i32 %.tmp45, i32* %idx
br label %.for.start.25
.for.end.25:
ret i1 1
}
define i1 @m3$is_upper.b.cp(i8* %.string.arg) {
%string = alloca i8*
store i8* %.string.arg, i8** %string
%idx = alloca i32
store i32 0, i32* %idx
br label %.for.start.46
.for.start.46:
%.tmp47 = load i32, i32* %idx
%.tmp48 = load i8*, i8** %string
%.tmp49 = getelementptr i8, i8* %.tmp48, i32 %.tmp47
%.tmp50 = load i8, i8* %.tmp49
%.tmp51 = icmp ne i8 %.tmp50, 0
br i1 %.tmp51, label %.for.continue.46, label %.for.end.46
.for.continue.46:
%.tmp52 = load i32, i32* %idx
%.tmp53 = load i8*, i8** %string
%.tmp54 = getelementptr i8, i8* %.tmp53, i32 %.tmp52
%.tmp55 = load i8, i8* %.tmp54
%c = alloca i8
store i8 %.tmp55, i8* %c
%.tmp56 = load i8, i8* %c
%.tmp57 = icmp eq i8 %.tmp56, 95
br i1 %.tmp57, label %.if.true.58, label %.if.false.58
.if.true.58:
br label %.if.end.58
.if.false.58:
%.tmp59 = load i8, i8* %c
%.tmp60 = icmp slt i8 %.tmp59, 65
%.tmp61 = load i8, i8* %c
%.tmp62 = icmp sgt i8 %.tmp61, 90
%.tmp63 = or i1 %.tmp60, %.tmp62
br i1 %.tmp63, label %.if.true.64, label %.if.false.64
.if.true.64:
ret i1 0
br label %.if.end.64
.if.false.64:
br label %.if.end.64
.if.end.64:
br label %.if.end.58
.if.end.58:
%.tmp65 = load i32, i32* %idx
%.tmp66 = add i32 %.tmp65, 1
store i32 %.tmp66, i32* %idx
br label %.for.start.46
.for.end.46:
ret i1 1
}
declare i8* @strcpy(i8*, i8*)
declare i8* @strncpy(i8*, i8*, i32)
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
%.tmp67 = load i1, i1* %condition
%.tmp68 = icmp ne i1 %.tmp67, 1
br i1 %.tmp68, label %.if.true.69, label %.if.false.69
.if.true.69:
%.tmp70 = load i8*, i8** %message
%.tmp71 = call i32(i8*) @strlen(i8* %.tmp70)
%size = alloca i32
store i32 %.tmp71, i32* %size
%.tmp72 = load i8*, i8** %message
%.tmp73 = load i32, i32* %size
%.tmp74 = call i32(i32,i8*,i32) @write(i32 1, i8* %.tmp72, i32 %.tmp73)
call void(i32) @exit(i32 1)
br label %.if.end.69
.if.false.69:
br label %.if.end.69
.if.end.69:
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
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.75
.for.start.75:
%.tmp76 = load i32, i32* %i
%.tmp77 = load i32, i32* %n
%.tmp78 = icmp slt i32 %.tmp76, %.tmp77
br i1 %.tmp78, label %.for.continue.75, label %.for.end.75
.for.continue.75:
%.tmp79 = load i32, i32* %i
%.tmp80 = load i8*, i8** %buf
%.tmp81 = getelementptr i8, i8* %.tmp80, i32 %.tmp79
%.tmp82 = load i8, i8* %val
store i8 %.tmp82, i8* %.tmp81
%.tmp83 = load i32, i32* %i
%.tmp84 = add i32 %.tmp83, 1
store i32 %.tmp84, i32* %i
br label %.for.start.75
.for.end.75:
%.tmp85 = load i8*, i8** %buf
ret i8* %.tmp85
}
declare i32 @pipe(i32*)
declare %m0$.File.type* @popen(i8*, i8*)
declare i32 @pclose(%m0$.File.type*)
define i8* @m2$dirname.cp.cp(i8* %.path.arg) {
%path = alloca i8*
store i8* %.path.arg, i8** %path
%.tmp86 = load i8*, i8** %path
%.tmp87 = icmp eq i8* %.tmp86, null
br i1 %.tmp87, label %.if.true.88, label %.if.false.88
.if.true.88:
%.tmp89 = bitcast ptr null to i8*
ret i8* %.tmp89
br label %.if.end.88
.if.false.88:
br label %.if.end.88
.if.end.88:
%end_idx = alloca i32
%stop = alloca i1
store i1 0, i1* %stop
%.tmp91 = load i8*, i8** %path
%.tmp92 = call i32(i8*) @strlen(i8* %.tmp91)
%.tmp93 = sub i32 %.tmp92, 1
store i32 %.tmp93, i32* %end_idx
br label %.for.start.90
.for.start.90:
%.tmp94 = load i32, i32* %end_idx
%.tmp95 = icmp sgt i32 %.tmp94, 0
%.tmp96 = load i1, i1* %stop
%.tmp97 = icmp eq i1 %.tmp96, 0
%.tmp98 = and i1 %.tmp95, %.tmp97
br i1 %.tmp98, label %.for.continue.90, label %.for.end.90
.for.continue.90:
%.tmp99 = load i32, i32* %end_idx
%.tmp100 = load i8*, i8** %path
%.tmp101 = getelementptr i8, i8* %.tmp100, i32 %.tmp99
%.tmp102 = load i8, i8* %.tmp101
%.tmp103 = icmp eq i8 %.tmp102, 47
br i1 %.tmp103, label %.if.true.104, label %.if.false.104
.if.true.104:
store i1 1, i1* %stop
br label %.if.end.104
.if.false.104:
%.tmp105 = load i32, i32* %end_idx
%.tmp106 = sub i32 %.tmp105, 1
store i32 %.tmp106, i32* %end_idx
br label %.if.end.104
.if.end.104:
br label %.for.start.90
.for.end.90:
%.tmp107 = load i32, i32* %end_idx
%.tmp108 = add i32 %.tmp107, 1
%.tmp109 = call i8*(i32) @malloc(i32 %.tmp108)
%.tmp110 = bitcast i8* %.tmp109 to i8*
%path_dirname = alloca i8*
store i8* %.tmp110, i8** %path_dirname
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.111
.for.start.111:
%.tmp112 = load i32, i32* %i
%.tmp113 = load i32, i32* %end_idx
%.tmp114 = icmp slt i32 %.tmp112, %.tmp113
br i1 %.tmp114, label %.for.continue.111, label %.for.end.111
.for.continue.111:
%.tmp115 = load i32, i32* %i
%.tmp116 = load i8*, i8** %path_dirname
%.tmp117 = getelementptr i8, i8* %.tmp116, i32 %.tmp115
%.tmp118 = load i32, i32* %i
%.tmp119 = load i8*, i8** %path
%.tmp120 = getelementptr i8, i8* %.tmp119, i32 %.tmp118
%.tmp121 = load i8, i8* %.tmp120
store i8 %.tmp121, i8* %.tmp117
%.tmp122 = load i32, i32* %i
%.tmp123 = add i32 %.tmp122, 1
store i32 %.tmp123, i32* %i
br label %.for.start.111
.for.end.111:
%.tmp124 = load i32, i32* %end_idx
%.tmp125 = load i8*, i8** %path_dirname
%.tmp126 = getelementptr i8, i8* %.tmp125, i32 %.tmp124
store i8 0, i8* %.tmp126
%.tmp127 = load i8*, i8** %path_dirname
ret i8* %.tmp127
}
declare i8* @basename(i8*)
declare i8* @getcwd(i8*, i32)
declare i8* @realpath(i8*, i8*)
define i8* @m1$readall.cp.i(i32 %.fd.arg) {
%fd = alloca i32
store i32 %.fd.arg, i32* %fd
%buf_len = alloca i32
store i32 1024, i32* %buf_len
%.tmp128 = load i32, i32* %buf_len
%.tmp129 = call i8*(i32) @malloc(i32 %.tmp128)
%buf = alloca i8*
store i8* %.tmp129, i8** %buf
%content_len = alloca i32
store i32 0, i32* %content_len
%.tmp130 = call i8*(i32) @malloc(i32 1)
%content = alloca i8*
store i8* %.tmp130, i8** %content
%.tmp131 = load i8*, i8** %content
%.tmp132 = getelementptr i8, i8* %.tmp131, i32 0
store i8 0, i8* %.tmp132
%.tmp133 = load i32, i32* %fd
%.tmp134 = load i8*, i8** %buf
%.tmp135 = load i32, i32* %buf_len
%.tmp136 = call i32(i32,i8*,i32) @read(i32 %.tmp133, i8* %.tmp134, i32 %.tmp135)
%read_bytes = alloca i32
store i32 %.tmp136, i32* %read_bytes
br label %.for.start.137
.for.start.137:
%.tmp138 = load i32, i32* %read_bytes
%.tmp139 = icmp sgt i32 %.tmp138, 0
br i1 %.tmp139, label %.for.continue.137, label %.for.end.137
.for.continue.137:
%.tmp140 = load i8*, i8** %content
%.tmp141 = load i32, i32* %content_len
%.tmp142 = load i32, i32* %read_bytes
%.tmp143 = add i32 %.tmp141, %.tmp142
%.tmp144 = call i8*(i8*,i32) @realloc(i8* %.tmp140, i32 %.tmp143)
store i8* %.tmp144, i8** %content
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.145
.for.start.145:
%.tmp146 = load i32, i32* %i
%.tmp147 = load i32, i32* %read_bytes
%.tmp148 = icmp slt i32 %.tmp146, %.tmp147
br i1 %.tmp148, label %.for.continue.145, label %.for.end.145
.for.continue.145:
%.tmp149 = load i32, i32* %i
%.tmp150 = load i32, i32* %content_len
%.tmp151 = add i32 %.tmp149, %.tmp150
%.tmp152 = load i8*, i8** %content
%.tmp153 = getelementptr i8, i8* %.tmp152, i32 %.tmp151
%.tmp154 = load i32, i32* %i
%.tmp155 = load i8*, i8** %buf
%.tmp156 = getelementptr i8, i8* %.tmp155, i32 %.tmp154
%.tmp157 = load i8, i8* %.tmp156
store i8 %.tmp157, i8* %.tmp153
%.tmp158 = load i32, i32* %i
%.tmp159 = add i32 %.tmp158, 1
store i32 %.tmp159, i32* %i
br label %.for.start.145
.for.end.145:
%.tmp160 = load i32, i32* %content_len
%.tmp161 = load i32, i32* %read_bytes
%.tmp162 = add i32 %.tmp160, %.tmp161
store i32 %.tmp162, i32* %content_len
%.tmp163 = load i32, i32* %fd
%.tmp164 = load i8*, i8** %buf
%.tmp165 = load i32, i32* %buf_len
%.tmp166 = call i32(i32,i8*,i32) @read(i32 %.tmp163, i8* %.tmp164, i32 %.tmp165)
store i32 %.tmp166, i32* %read_bytes
br label %.for.start.137
.for.end.137:
%.tmp167 = load i32, i32* %content_len
%.tmp168 = sub i32 %.tmp167, 1
%.tmp169 = load i8*, i8** %content
%.tmp170 = getelementptr i8, i8* %.tmp169, i32 %.tmp168
store i8 0, i8* %.tmp170
%.tmp171 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp171)
%.tmp172 = load i8*, i8** %content
ret i8* %.tmp172
}
define void @m1$copy.v.i.i(i32 %.dest.arg, i32 %.src.arg) {
%dest = alloca i32
store i32 %.dest.arg, i32* %dest
%src = alloca i32
store i32 %.src.arg, i32* %src
%buf_size = alloca i32
store i32 4096, i32* %buf_size
%.tmp173 = call i8*(i32) @malloc(i32 4096)
%buf = alloca i8*
store i8* %.tmp173, i8** %buf
%to_write = alloca i32
store i32 1, i32* %to_write
br label %.for.start.174
.for.start.174:
%.tmp175 = load i32, i32* %to_write
%.tmp176 = icmp sgt i32 %.tmp175, 0
br i1 %.tmp176, label %.for.continue.174, label %.for.end.174
.for.continue.174:
%.tmp177 = load i32, i32* %src
%.tmp178 = load i8*, i8** %buf
%.tmp179 = load i32, i32* %buf_size
%.tmp180 = call i32(i32,i8*,i32) @read(i32 %.tmp177, i8* %.tmp178, i32 %.tmp179)
store i32 %.tmp180, i32* %to_write
%.tmp181 = load i32, i32* %dest
%.tmp182 = load i8*, i8** %buf
%.tmp183 = load i32, i32* %to_write
%.tmp184 = call i32(i32,i8*,i32) @write(i32 %.tmp181, i8* %.tmp182, i32 %.tmp183)
br label %.for.start.174
.for.end.174:
ret void
}
%m185$.PeekerInfo.type = type {i32,i32,i32,i32,i8,i1,i8*}
@PeekerInfo_size = constant i32 32
@EOF = constant i32 0
define i8 @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.p.arg) {
%p = alloca %m185$.PeekerInfo.type*
store %m185$.PeekerInfo.type* %.p.arg, %m185$.PeekerInfo.type** %p
%.tmp186 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp187 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp186, i32 0, i32 5
%.tmp188 = load i1, i1* %.tmp187
br i1 %.tmp188, label %.if.true.189, label %.if.false.189
.if.true.189:
ret i8 0
br label %.if.end.189
.if.false.189:
br label %.if.end.189
.if.end.189:
%.tmp190 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp191 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp190, i32 0, i32 4
%.tmp192 = load i8, i8* %.tmp191
%.tmp193 = icmp eq i8 %.tmp192, 10
br i1 %.tmp193, label %.if.true.194, label %.if.false.194
.if.true.194:
%.tmp195 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp196 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp195, i32 0, i32 2
%.tmp197 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp198 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp197, i32 0, i32 2
%.tmp199 = load i32, i32* %.tmp198
%.tmp200 = add i32 %.tmp199, 1
store i32 %.tmp200, i32* %.tmp196
%.tmp201 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp202 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp201, i32 0, i32 3
store i32 0, i32* %.tmp202
br label %.if.end.194
.if.false.194:
br label %.if.end.194
.if.end.194:
%.tmp203 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp204 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp203, i32 0, i32 1
%.tmp205 = load i32, i32* %.tmp204
%.tmp206 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp207 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp206, i32 0, i32 4
%.tmp208 = getelementptr i8, i8* %.tmp207, i32 0
%.tmp209 = call i32(i32,i8*,i32) @read(i32 %.tmp205, i8* %.tmp208, i32 1)
%.tmp210 = icmp eq i32 %.tmp209, 0
br i1 %.tmp210, label %.if.true.211, label %.if.false.211
.if.true.211:
%.tmp212 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp213 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp212, i32 0, i32 4
store i8 0, i8* %.tmp213
%.tmp214 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp215 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp214, i32 0, i32 5
store i1 1, i1* %.tmp215
%.tmp216 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp217 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp216, i32 0, i32 4
%.tmp218 = load i8, i8* %.tmp217
ret i8 %.tmp218
br label %.if.end.211
.if.false.211:
br label %.if.end.211
.if.end.211:
%.tmp219 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp220 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp219, i32 0, i32 3
%.tmp221 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp222 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp221, i32 0, i32 3
%.tmp223 = load i32, i32* %.tmp222
%.tmp224 = add i32 %.tmp223, 1
store i32 %.tmp224, i32* %.tmp220
%.tmp225 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp226 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp225, i32 0, i32 0
%.tmp227 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp228 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp227, i32 0, i32 0
%.tmp229 = load i32, i32* %.tmp228
%.tmp230 = add i32 %.tmp229, 1
store i32 %.tmp230, i32* %.tmp226
%.tmp231 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp232 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp231, i32 0, i32 4
%.tmp233 = load i8, i8* %.tmp232
ret i8 %.tmp233
}
define void @m185$seek.v.m185$.PeekerInfo.typep.i(%m185$.PeekerInfo.type* %.p.arg, i32 %.pos.arg) {
%p = alloca %m185$.PeekerInfo.type*
store %m185$.PeekerInfo.type* %.p.arg, %m185$.PeekerInfo.type** %p
%pos = alloca i32
store i32 %.pos.arg, i32* %pos
%.tmp234 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp235 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp234, i32 0, i32 1
%.tmp236 = load i32, i32* %.tmp235
%.tmp237 = load i32, i32* %pos
%.tmp238 = load i32, i32* @SEEK_SET
%.tmp239 = call i32(i32,i32,i32) @lseek(i32 %.tmp236, i32 %.tmp237, i32 %.tmp238)
ret void
}
define %m185$.PeekerInfo.type* @m185$new.m185$.PeekerInfo.typep.i(i32 %.fd.arg) {
%fd = alloca i32
store i32 %.fd.arg, i32* %fd
%.tmp240 = load i32, i32* @PeekerInfo_size
%.tmp241 = call i8*(i32) @malloc(i32 %.tmp240)
%.tmp242 = bitcast i8* %.tmp241 to %m185$.PeekerInfo.type*
%p = alloca %m185$.PeekerInfo.type*
store %m185$.PeekerInfo.type* %.tmp242, %m185$.PeekerInfo.type** %p
%.tmp243 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp244 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp243, i32 0, i32 0
store i32 0, i32* %.tmp244
%.tmp245 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp246 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp245, i32 0, i32 2
store i32 1, i32* %.tmp246
%.tmp247 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp248 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp247, i32 0, i32 3
store i32 0, i32* %.tmp248
%.tmp249 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp250 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp249, i32 0, i32 1
%.tmp251 = load i32, i32* %fd
store i32 %.tmp251, i32* %.tmp250
%.tmp252 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp253 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp252, i32 0, i32 4
store i8 0, i8* %.tmp253
%.tmp254 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp255 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp254, i32 0, i32 5
store i1 0, i1* %.tmp255
%.tmp256 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp257 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp256, i32 0, i32 6
%.tmp259 = getelementptr [1 x i8], [1 x i8]*@.str258, i32 0, i32 0
store i8* %.tmp259, i8** %.tmp257
%.tmp260 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
ret %m185$.PeekerInfo.type* %.tmp260
}
@.str258 = constant [1 x i8] c"\00"
%m262$.Token.type = type {i8*,i8*,i32,i32,i8*,%m262$.Token.type*,%m262$.Token.type*}
@Token_size = constant i32 48
%m262$.ParseCtx.type = type {i8*,i32,i32,%m262$.Token.type*,%m262$.Token.type*}
@ParseCtx_size = constant i32 160
define %m262$.Token.type* @m262$push_token.m262$.Token.typep.m262$.ParseCtx.typep.cp.cp(%m262$.ParseCtx.type* %.c.arg, i8* %.type.arg, i8* %.value.arg) {
%c = alloca %m262$.ParseCtx.type*
store %m262$.ParseCtx.type* %.c.arg, %m262$.ParseCtx.type** %c
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp263 = load i32, i32* @Token_size
%.tmp264 = call i8*(i32) @malloc(i32 %.tmp263)
%.tmp265 = bitcast i8* %.tmp264 to %m262$.Token.type*
%root = alloca %m262$.Token.type*
store %m262$.Token.type* %.tmp265, %m262$.Token.type** %root
%.tmp266 = load %m262$.Token.type*, %m262$.Token.type** %root
%.tmp267 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp266, i32 0, i32 0
%.tmp268 = load i8*, i8** %type
store i8* %.tmp268, i8** %.tmp267
%.tmp269 = load %m262$.Token.type*, %m262$.Token.type** %root
%.tmp270 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp269, i32 0, i32 1
%.tmp271 = load i8*, i8** %value
store i8* %.tmp271, i8** %.tmp270
%.tmp272 = load %m262$.Token.type*, %m262$.Token.type** %root
%.tmp273 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp272, i32 0, i32 4
%.tmp274 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %c
%.tmp275 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp274, i32 0, i32 0
%.tmp276 = load i8*, i8** %.tmp275
store i8* %.tmp276, i8** %.tmp273
%.tmp277 = load %m262$.Token.type*, %m262$.Token.type** %root
%.tmp278 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp277, i32 0, i32 2
%.tmp279 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %c
%.tmp280 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp279, i32 0, i32 1
%.tmp281 = load i32, i32* %.tmp280
store i32 %.tmp281, i32* %.tmp278
%.tmp282 = load %m262$.Token.type*, %m262$.Token.type** %root
%.tmp283 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp282, i32 0, i32 3
%.tmp284 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %c
%.tmp285 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp284, i32 0, i32 2
%.tmp286 = load i32, i32* %.tmp285
store i32 %.tmp286, i32* %.tmp283
%.tmp287 = load %m262$.Token.type*, %m262$.Token.type** %root
%.tmp288 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp287, i32 0, i32 6
%.tmp289 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %c
%.tmp290 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp289, i32 0, i32 4
%.tmp291 = load %m262$.Token.type*, %m262$.Token.type** %.tmp290
store %m262$.Token.type* %.tmp291, %m262$.Token.type** %.tmp288
%.tmp292 = load %m262$.Token.type*, %m262$.Token.type** %root
%.tmp293 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp292, i32 0, i32 5
store %m262$.Token.type* null, %m262$.Token.type** %.tmp293
%.tmp294 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %c
%.tmp295 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp294, i32 0, i32 4
%.tmp296 = load %m262$.Token.type*, %m262$.Token.type** %.tmp295
%.tmp297 = icmp ne %m262$.Token.type* %.tmp296, null
br i1 %.tmp297, label %.if.true.298, label %.if.false.298
.if.true.298:
%.tmp299 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %c
%.tmp300 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp299, i32 0, i32 4
%.tmp301 = load %m262$.Token.type*, %m262$.Token.type** %.tmp300
%.tmp302 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp301, i32 0, i32 5
%.tmp303 = load %m262$.Token.type*, %m262$.Token.type** %root
store %m262$.Token.type* %.tmp303, %m262$.Token.type** %.tmp302
br label %.if.end.298
.if.false.298:
br label %.if.end.298
.if.end.298:
%.tmp304 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %c
%.tmp305 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp304, i32 0, i32 4
%.tmp306 = load %m262$.Token.type*, %m262$.Token.type** %root
store %m262$.Token.type* %.tmp306, %m262$.Token.type** %.tmp305
%.tmp307 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %c
%.tmp308 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp307, i32 0, i32 3
%.tmp309 = load %m262$.Token.type*, %m262$.Token.type** %.tmp308
%.tmp310 = icmp eq %m262$.Token.type* %.tmp309, null
br i1 %.tmp310, label %.if.true.311, label %.if.false.311
.if.true.311:
%.tmp312 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %c
%.tmp313 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp312, i32 0, i32 3
%.tmp314 = load %m262$.Token.type*, %m262$.Token.type** %root
store %m262$.Token.type* %.tmp314, %m262$.Token.type** %.tmp313
br label %.if.end.311
.if.false.311:
br label %.if.end.311
.if.end.311:
%.tmp315 = load %m262$.Token.type*, %m262$.Token.type** %root
ret %m262$.Token.type* %.tmp315
}
define %m262$.Token.type* @m262$tokenize.m262$.Token.typep.m185$.PeekerInfo.typep.b(%m185$.PeekerInfo.type* %.p.arg, i1 %.keep_comments.arg) {
%p = alloca %m185$.PeekerInfo.type*
store %m185$.PeekerInfo.type* %.p.arg, %m185$.PeekerInfo.type** %p
%keep_comments = alloca i1
store i1 %.keep_comments.arg, i1* %keep_comments
%.tmp316 = load i32, i32* @ParseCtx_size
%.tmp317 = call i8*(i32) @malloc(i32 %.tmp316)
%.tmp318 = bitcast i8* %.tmp317 to %m262$.ParseCtx.type*
%ctx = alloca %m262$.ParseCtx.type*
store %m262$.ParseCtx.type* %.tmp318, %m262$.ParseCtx.type** %ctx
%.tmp319 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp320 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp319, i32 0, i32 0
%.tmp321 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp322 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp321, i32 0, i32 6
%.tmp323 = load i8*, i8** %.tmp322
store i8* %.tmp323, i8** %.tmp320
%.tmp324 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp325 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp324, i32 0, i32 3
store %m262$.Token.type* null, %m262$.Token.type** %.tmp325
%.tmp326 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp327 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp326, i32 0, i32 4
store %m262$.Token.type* null, %m262$.Token.type** %.tmp327
%max_token_size = alloca i32
store i32 128, i32* %max_token_size
%.tmp328 = bitcast ptr null to i8*
%buf = alloca i8*
store i8* %.tmp328, i8** %buf
%idx = alloca i32
store i32 0, i32* %idx
%.tmp329 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp330 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp329)
%c = alloca i8
store i8 %.tmp330, i8* %c
br label %.for.start.331
.for.start.331:
%.tmp332 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp333 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp332, i32 0, i32 5
%.tmp334 = load i1, i1* %.tmp333
%.tmp335 = icmp eq i1 %.tmp334, 0
br i1 %.tmp335, label %.for.continue.331, label %.for.end.331
.for.continue.331:
%.tmp336 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp337 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp336, i32 0, i32 1
%.tmp338 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp339 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp338, i32 0, i32 2
%.tmp340 = load i32, i32* %.tmp339
store i32 %.tmp340, i32* %.tmp337
%.tmp341 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp342 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp341, i32 0, i32 2
%.tmp343 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp344 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp343, i32 0, i32 3
%.tmp345 = load i32, i32* %.tmp344
store i32 %.tmp345, i32* %.tmp342
%.tmp346 = load i8, i8* %c
%.tmp347 = icmp eq i8 %.tmp346, 0
br i1 %.tmp347, label %.if.true.348, label %.if.false.348
.if.true.348:
%.tmp349 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp350 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp349)
store i8 %.tmp350, i8* %c
br label %.if.end.348
.if.false.348:
%.tmp351 = load i8, i8* %c
%.tmp352 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp351)
br i1 %.tmp352, label %.if.true.353, label %.if.false.353
.if.true.353:
%.tmp354 = load i32, i32* %max_token_size
%.tmp355 = call i8*(i32) @malloc(i32 %.tmp354)
store i8* %.tmp355, i8** %buf
store i32 0, i32* %idx
br label %.for.start.356
.for.start.356:
%.tmp357 = load i8, i8* %c
%.tmp358 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp357)
br i1 %.tmp358, label %.for.continue.356, label %.for.end.356
.for.continue.356:
%.tmp359 = load i32, i32* %idx
%.tmp360 = load i8*, i8** %buf
%.tmp361 = getelementptr i8, i8* %.tmp360, i32 %.tmp359
%.tmp362 = load i8, i8* %c
store i8 %.tmp362, i8* %.tmp361
%.tmp363 = load i32, i32* %idx
%.tmp364 = add i32 %.tmp363, 1
store i32 %.tmp364, i32* %idx
%.tmp365 = load i32, i32* %idx
%.tmp366 = load i32, i32* %max_token_size
%.tmp367 = icmp slt i32 %.tmp365, %.tmp366
%.tmp369 = getelementptr [16 x i8], [16 x i8]*@.str368, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp367, i8* %.tmp369)
%.tmp370 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp371 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp370)
store i8 %.tmp371, i8* %c
br label %.for.start.356
.for.end.356:
%.tmp372 = load i32, i32* %idx
%.tmp373 = load i8*, i8** %buf
%.tmp374 = getelementptr i8, i8* %.tmp373, i32 %.tmp372
store i8 0, i8* %.tmp374
%.tmp375 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp377 = getelementptr [7 x i8], [7 x i8]*@.str376, i32 0, i32 0
%.tmp378 = load i8*, i8** %buf
%.tmp379 = call %m262$.Token.type*(%m262$.ParseCtx.type*,i8*,i8*) @m262$push_token.m262$.Token.typep.m262$.ParseCtx.typep.cp.cp(%m262$.ParseCtx.type* %.tmp375, i8* %.tmp377, i8* %.tmp378)
br label %.if.end.353
.if.false.353:
%.tmp380 = load i8, i8* %c
%.tmp381 = call i1(i8) @m3$is_letter.b.c(i8 %.tmp380)
%.tmp382 = load i8, i8* %c
%.tmp383 = icmp eq i8 %.tmp382, 95
%.tmp384 = or i1 %.tmp381, %.tmp383
br i1 %.tmp384, label %.if.true.385, label %.if.false.385
.if.true.385:
%.tmp386 = load i32, i32* %max_token_size
%.tmp387 = call i8*(i32) @malloc(i32 %.tmp386)
store i8* %.tmp387, i8** %buf
store i32 0, i32* %idx
br label %.for.start.388
.for.start.388:
%.tmp389 = load i8, i8* %c
%.tmp390 = call i1(i8) @m3$is_letter.b.c(i8 %.tmp389)
%.tmp391 = load i8, i8* %c
%.tmp392 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp391)
%.tmp393 = or i1 %.tmp390, %.tmp392
%.tmp394 = load i8, i8* %c
%.tmp395 = icmp eq i8 %.tmp394, 95
%.tmp396 = or i1 %.tmp393, %.tmp395
br i1 %.tmp396, label %.for.continue.388, label %.for.end.388
.for.continue.388:
%.tmp397 = load i32, i32* %idx
%.tmp398 = load i8*, i8** %buf
%.tmp399 = getelementptr i8, i8* %.tmp398, i32 %.tmp397
%.tmp400 = load i8, i8* %c
store i8 %.tmp400, i8* %.tmp399
%.tmp401 = load i32, i32* %idx
%.tmp402 = add i32 %.tmp401, 1
store i32 %.tmp402, i32* %idx
%.tmp403 = load i32, i32* %idx
%.tmp404 = load i32, i32* %max_token_size
%.tmp405 = icmp slt i32 %.tmp403, %.tmp404
%.tmp407 = getelementptr [16 x i8], [16 x i8]*@.str406, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp405, i8* %.tmp407)
%.tmp408 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp409 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp408)
store i8 %.tmp409, i8* %c
br label %.for.start.388
.for.end.388:
%.tmp410 = load i32, i32* %idx
%.tmp411 = load i8*, i8** %buf
%.tmp412 = getelementptr i8, i8* %.tmp411, i32 %.tmp410
store i8 0, i8* %.tmp412
%.tmp413 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp415 = getelementptr [5 x i8], [5 x i8]*@.str414, i32 0, i32 0
%.tmp416 = load i8*, i8** %buf
%.tmp417 = call %m262$.Token.type*(%m262$.ParseCtx.type*,i8*,i8*) @m262$push_token.m262$.Token.typep.m262$.ParseCtx.typep.cp.cp(%m262$.ParseCtx.type* %.tmp413, i8* %.tmp415, i8* %.tmp416)
br label %.if.end.385
.if.false.385:
%.tmp418 = load i8, i8* %c
%.tmp419 = call i1(i8) @m3$is_whitespace.b.c(i8 %.tmp418)
br i1 %.tmp419, label %.if.true.420, label %.if.false.420
.if.true.420:
%.tmp421 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp422 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp421)
store i8 %.tmp422, i8* %c
br label %.if.end.420
.if.false.420:
%.tmp423 = load i8, i8* %c
%.tmp424 = icmp eq i8 %.tmp423, 34
br i1 %.tmp424, label %.if.true.425, label %.if.false.425
.if.true.425:
%.tmp426 = load i32, i32* %max_token_size
%.tmp427 = call i8*(i32) @malloc(i32 %.tmp426)
store i8* %.tmp427, i8** %buf
%.tmp428 = load i8*, i8** %buf
%.tmp429 = getelementptr i8, i8* %.tmp428, i32 0
%.tmp430 = load i8, i8* %c
store i8 %.tmp430, i8* %.tmp429
%.tmp431 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp432 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp431)
store i8 %.tmp432, i8* %c
store i32 1, i32* %idx
br label %.for.start.433
.for.start.433:
%.tmp434 = load i8, i8* %c
%.tmp435 = icmp ne i8 %.tmp434, 34
br i1 %.tmp435, label %.for.continue.433, label %.for.end.433
.for.continue.433:
%.tmp436 = load i8, i8* %c
%.tmp437 = icmp ne i8 %.tmp436, 0
%.tmp439 = getelementptr [61 x i8], [61 x i8]*@.str438, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp437, i8* %.tmp439)
%.tmp440 = load i32, i32* %idx
%.tmp441 = load i32, i32* %max_token_size
%.tmp442 = sub i32 %.tmp441, 2
%.tmp443 = icmp slt i32 %.tmp440, %.tmp442
%.tmp445 = getelementptr [17 x i8], [17 x i8]*@.str444, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp443, i8* %.tmp445)
%.tmp446 = load i32, i32* %idx
%.tmp447 = load i8*, i8** %buf
%.tmp448 = getelementptr i8, i8* %.tmp447, i32 %.tmp446
%.tmp449 = load i8, i8* %c
store i8 %.tmp449, i8* %.tmp448
%.tmp450 = load i32, i32* %idx
%.tmp451 = add i32 %.tmp450, 1
store i32 %.tmp451, i32* %idx
%.tmp452 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp453 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp452)
store i8 %.tmp453, i8* %c
br label %.for.start.433
.for.end.433:
%.tmp454 = load i32, i32* %idx
%.tmp455 = load i8*, i8** %buf
%.tmp456 = getelementptr i8, i8* %.tmp455, i32 %.tmp454
%.tmp457 = load i8, i8* %c
store i8 %.tmp457, i8* %.tmp456
%.tmp458 = load i32, i32* %idx
%.tmp459 = add i32 %.tmp458, 1
%.tmp460 = load i8*, i8** %buf
%.tmp461 = getelementptr i8, i8* %.tmp460, i32 %.tmp459
store i8 0, i8* %.tmp461
%.tmp462 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp463 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp462)
store i8 %.tmp463, i8* %c
%.tmp464 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp466 = getelementptr [7 x i8], [7 x i8]*@.str465, i32 0, i32 0
%.tmp467 = load i8*, i8** %buf
%.tmp468 = call %m262$.Token.type*(%m262$.ParseCtx.type*,i8*,i8*) @m262$push_token.m262$.Token.typep.m262$.ParseCtx.typep.cp.cp(%m262$.ParseCtx.type* %.tmp464, i8* %.tmp466, i8* %.tmp467)
br label %.if.end.425
.if.false.425:
%.tmp469 = load i8, i8* %c
%.tmp470 = icmp eq i8 %.tmp469, 39
br i1 %.tmp470, label %.if.true.471, label %.if.false.471
.if.true.471:
%.tmp472 = load i32, i32* %max_token_size
%.tmp473 = call i8*(i32) @malloc(i32 %.tmp472)
store i8* %.tmp473, i8** %buf
%.tmp474 = load i8*, i8** %buf
%.tmp475 = getelementptr i8, i8* %.tmp474, i32 0
%.tmp476 = load i8, i8* %c
store i8 %.tmp476, i8* %.tmp475
%.tmp477 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp478 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp477)
store i8 %.tmp478, i8* %c
store i32 1, i32* %idx
br label %.for.start.479
.for.start.479:
%.tmp480 = load i8, i8* %c
%.tmp481 = icmp ne i8 %.tmp480, 39
br i1 %.tmp481, label %.for.continue.479, label %.for.end.479
.for.continue.479:
%.tmp482 = load i32, i32* %idx
%.tmp483 = load i32, i32* %max_token_size
%.tmp484 = sub i32 %.tmp483, 2
%.tmp485 = icmp slt i32 %.tmp482, %.tmp484
%.tmp487 = getelementptr [15 x i8], [15 x i8]*@.str486, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp485, i8* %.tmp487)
%.tmp488 = load i32, i32* %idx
%.tmp489 = load i8*, i8** %buf
%.tmp490 = getelementptr i8, i8* %.tmp489, i32 %.tmp488
%.tmp491 = load i8, i8* %c
store i8 %.tmp491, i8* %.tmp490
%.tmp492 = load i32, i32* %idx
%.tmp493 = add i32 %.tmp492, 1
store i32 %.tmp493, i32* %idx
%.tmp494 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp495 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp494)
store i8 %.tmp495, i8* %c
br label %.for.start.479
.for.end.479:
%.tmp496 = load i32, i32* %idx
%.tmp497 = load i8*, i8** %buf
%.tmp498 = getelementptr i8, i8* %.tmp497, i32 %.tmp496
%.tmp499 = load i8, i8* %c
store i8 %.tmp499, i8* %.tmp498
%.tmp500 = load i32, i32* %idx
%.tmp501 = add i32 %.tmp500, 1
%.tmp502 = load i8*, i8** %buf
%.tmp503 = getelementptr i8, i8* %.tmp502, i32 %.tmp501
store i8 0, i8* %.tmp503
%.tmp504 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp505 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp504)
store i8 %.tmp505, i8* %c
%.tmp506 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp508 = getelementptr [4 x i8], [4 x i8]*@.str507, i32 0, i32 0
%.tmp509 = load i8*, i8** %buf
%.tmp510 = call %m262$.Token.type*(%m262$.ParseCtx.type*,i8*,i8*) @m262$push_token.m262$.Token.typep.m262$.ParseCtx.typep.cp.cp(%m262$.ParseCtx.type* %.tmp506, i8* %.tmp508, i8* %.tmp509)
br label %.if.end.471
.if.false.471:
%.tmp511 = load i8, i8* %c
%.tmp512 = icmp eq i8 %.tmp511, 10
br i1 %.tmp512, label %.if.true.513, label %.if.false.513
.if.true.513:
%.tmp514 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp516 = getelementptr [3 x i8], [3 x i8]*@.str515, i32 0, i32 0
%.tmp518 = getelementptr [2 x i8], [2 x i8]*@.str517, i32 0, i32 0
%.tmp519 = call %m262$.Token.type*(%m262$.ParseCtx.type*,i8*,i8*) @m262$push_token.m262$.Token.typep.m262$.ParseCtx.typep.cp.cp(%m262$.ParseCtx.type* %.tmp514, i8* %.tmp516, i8* %.tmp518)
%.tmp520 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp521 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp520)
store i8 %.tmp521, i8* %c
br label %.if.end.513
.if.false.513:
%.tmp522 = load i8, i8* %c
%.tmp523 = icmp eq i8 %.tmp522, 45
br i1 %.tmp523, label %.if.true.524, label %.if.false.524
.if.true.524:
%.tmp525 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp526 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp525)
store i8 %.tmp526, i8* %c
%.tmp527 = load i8, i8* %c
%.tmp528 = icmp eq i8 %.tmp527, 45
br i1 %.tmp528, label %.if.true.529, label %.if.false.529
.if.true.529:
%.tmp530 = load i32, i32* %max_token_size
%.tmp531 = call i8*(i32) @malloc(i32 %.tmp530)
store i8* %.tmp531, i8** %buf
%.tmp532 = load i8*, i8** %buf
%.tmp533 = getelementptr i8, i8* %.tmp532, i32 0
store i8 45, i8* %.tmp533
store i32 1, i32* %idx
br label %.for.start.534
.for.start.534:
%.tmp535 = load i8, i8* %c
%.tmp536 = icmp ne i8 %.tmp535, 10
%.tmp537 = load i8, i8* %c
%.tmp538 = icmp ne i8 %.tmp537, 0
%.tmp539 = and i1 %.tmp536, %.tmp538
br i1 %.tmp539, label %.for.continue.534, label %.for.end.534
.for.continue.534:
%.tmp540 = load i32, i32* %idx
%.tmp541 = load i8*, i8** %buf
%.tmp542 = getelementptr i8, i8* %.tmp541, i32 %.tmp540
%.tmp543 = load i8, i8* %c
store i8 %.tmp543, i8* %.tmp542
%.tmp544 = load i32, i32* %idx
%.tmp545 = add i32 %.tmp544, 1
store i32 %.tmp545, i32* %idx
%.tmp546 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp547 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp546)
store i8 %.tmp547, i8* %c
br label %.for.start.534
.for.end.534:
%.tmp548 = load i32, i32* %idx
%.tmp549 = load i8*, i8** %buf
%.tmp550 = getelementptr i8, i8* %.tmp549, i32 %.tmp548
store i8 0, i8* %.tmp550
%.tmp551 = load i1, i1* %keep_comments
br i1 %.tmp551, label %.if.true.552, label %.if.false.552
.if.true.552:
%.tmp553 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp555 = getelementptr [8 x i8], [8 x i8]*@.str554, i32 0, i32 0
%.tmp556 = load i8*, i8** %buf
%.tmp557 = call %m262$.Token.type*(%m262$.ParseCtx.type*,i8*,i8*) @m262$push_token.m262$.Token.typep.m262$.ParseCtx.typep.cp.cp(%m262$.ParseCtx.type* %.tmp553, i8* %.tmp555, i8* %.tmp556)
br label %.if.end.552
.if.false.552:
%.tmp558 = load i8*, i8** %buf
%.tmp559 = bitcast i8* %.tmp558 to i8*
call void(i8*) @free(i8* %.tmp559)
br label %.if.end.552
.if.end.552:
br label %.if.end.529
.if.false.529:
%.tmp560 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp562 = getelementptr [9 x i8], [9 x i8]*@.str561, i32 0, i32 0
%.tmp564 = getelementptr [2 x i8], [2 x i8]*@.str563, i32 0, i32 0
%.tmp565 = call %m262$.Token.type*(%m262$.ParseCtx.type*,i8*,i8*) @m262$push_token.m262$.Token.typep.m262$.ParseCtx.typep.cp.cp(%m262$.ParseCtx.type* %.tmp560, i8* %.tmp562, i8* %.tmp564)
br label %.if.end.529
.if.end.529:
br label %.if.end.524
.if.false.524:
%.tmp566 = load i8, i8* %c
%.tmp567 = icmp sgt i8 %.tmp566, 126
br i1 %.tmp567, label %.if.true.568, label %.if.false.568
.if.true.568:
%.tmp570 = getelementptr [47 x i8], [47 x i8]*@.str569, i32 0, i32 0
%.tmp571 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp572 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp571, i32 0, i32 1
%.tmp573 = load i32, i32* %.tmp572
%.tmp574 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp575 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp574, i32 0, i32 2
%.tmp576 = load i32, i32* %.tmp575
%.tmp577 = load i8, i8* %c
%.tmp578 = load i8, i8* %c
%.tmp579 = call i32(i8*,...) @printf(i8* %.tmp570, i32 %.tmp573, i32 %.tmp576, i8 %.tmp577, i8 %.tmp578)
call void(i32) @exit(i32 1)
br label %.if.end.568
.if.false.568:
br label %.if.end.568
.if.end.568:
%.tmp580 = load i8, i8* %c
%prev_c = alloca i8
store i8 %.tmp580, i8* %prev_c
%.tmp581 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp582 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp581)
store i8 %.tmp582, i8* %c
%.tmp584 = getelementptr [9 x i8], [9 x i8]*@.str583, i32 0, i32 0
%type = alloca i8*
store i8* %.tmp584, i8** %type
%.tmp585 = load i8, i8* %prev_c
%.tmp586 = icmp eq i8 %.tmp585, 61
%.tmp587 = load i8, i8* %c
%.tmp588 = icmp eq i8 %.tmp587, 61
%.tmp589 = and i1 %.tmp586, %.tmp588
br i1 %.tmp589, label %.if.true.590, label %.if.false.590
.if.true.590:
%.tmp591 = getelementptr i8*, i8** %buf, i32 0
%.tmp593 = getelementptr [3 x i8], [3 x i8]*@.str592, i32 0, i32 0
%.tmp594 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp591, i8* %.tmp593)
%.tmp595 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp596 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp595)
store i8 %.tmp596, i8* %c
br label %.if.end.590
.if.false.590:
%.tmp597 = load i8, i8* %prev_c
%.tmp598 = icmp eq i8 %.tmp597, 33
%.tmp599 = load i8, i8* %c
%.tmp600 = icmp eq i8 %.tmp599, 61
%.tmp601 = and i1 %.tmp598, %.tmp600
br i1 %.tmp601, label %.if.true.602, label %.if.false.602
.if.true.602:
%.tmp603 = getelementptr i8*, i8** %buf, i32 0
%.tmp605 = getelementptr [3 x i8], [3 x i8]*@.str604, i32 0, i32 0
%.tmp606 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp603, i8* %.tmp605)
%.tmp607 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp608 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp607)
store i8 %.tmp608, i8* %c
br label %.if.end.602
.if.false.602:
%.tmp609 = load i8, i8* %prev_c
%.tmp610 = icmp eq i8 %.tmp609, 62
%.tmp611 = load i8, i8* %c
%.tmp612 = icmp eq i8 %.tmp611, 61
%.tmp613 = and i1 %.tmp610, %.tmp612
br i1 %.tmp613, label %.if.true.614, label %.if.false.614
.if.true.614:
%.tmp615 = getelementptr i8*, i8** %buf, i32 0
%.tmp617 = getelementptr [3 x i8], [3 x i8]*@.str616, i32 0, i32 0
%.tmp618 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp615, i8* %.tmp617)
%.tmp619 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp620 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp619)
store i8 %.tmp620, i8* %c
br label %.if.end.614
.if.false.614:
%.tmp621 = load i8, i8* %prev_c
%.tmp622 = icmp eq i8 %.tmp621, 60
%.tmp623 = load i8, i8* %c
%.tmp624 = icmp eq i8 %.tmp623, 61
%.tmp625 = and i1 %.tmp622, %.tmp624
br i1 %.tmp625, label %.if.true.626, label %.if.false.626
.if.true.626:
%.tmp627 = getelementptr i8*, i8** %buf, i32 0
%.tmp629 = getelementptr [3 x i8], [3 x i8]*@.str628, i32 0, i32 0
%.tmp630 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp627, i8* %.tmp629)
%.tmp631 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp632 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp631)
store i8 %.tmp632, i8* %c
br label %.if.end.626
.if.false.626:
%.tmp633 = load i8, i8* %prev_c
%.tmp634 = icmp eq i8 %.tmp633, 46
%.tmp635 = load i8, i8* %c
%.tmp636 = icmp eq i8 %.tmp635, 46
%.tmp637 = and i1 %.tmp634, %.tmp636
br i1 %.tmp637, label %.if.true.638, label %.if.false.638
.if.true.638:
%.tmp639 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp640 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp639)
store i8 %.tmp640, i8* %c
%.tmp641 = load i8, i8* %c
%.tmp642 = icmp ne i8 %.tmp641, 46
br i1 %.tmp642, label %.if.true.643, label %.if.false.643
.if.true.643:
%.tmp645 = getelementptr [13 x i8], [13 x i8]*@.str644, i32 0, i32 0
%.tmp646 = call i32(i8*,...) @printf(i8* %.tmp645)
call void(i32) @exit(i32 1)
br label %.if.end.643
.if.false.643:
%.tmp647 = getelementptr i8*, i8** %buf, i32 0
%.tmp649 = getelementptr [4 x i8], [4 x i8]*@.str648, i32 0, i32 0
%.tmp650 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp647, i8* %.tmp649)
%.tmp652 = getelementptr [8 x i8], [8 x i8]*@.str651, i32 0, i32 0
store i8* %.tmp652, i8** %type
br label %.if.end.643
.if.end.643:
%.tmp653 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp654 = call i8(%m185$.PeekerInfo.type*) @m185$read.c.m185$.PeekerInfo.typep(%m185$.PeekerInfo.type* %.tmp653)
store i8 %.tmp654, i8* %c
br label %.if.end.638
.if.false.638:
%.tmp655 = call i8*(i32) @malloc(i32 2)
store i8* %.tmp655, i8** %buf
%.tmp656 = load i8*, i8** %buf
%.tmp657 = getelementptr i8, i8* %.tmp656, i32 0
%.tmp658 = load i8, i8* %prev_c
store i8 %.tmp658, i8* %.tmp657
%.tmp659 = load i8*, i8** %buf
%.tmp660 = getelementptr i8, i8* %.tmp659, i32 1
store i8 0, i8* %.tmp660
br label %.if.end.638
.if.end.638:
br label %.if.end.626
.if.end.626:
br label %.if.end.614
.if.end.614:
br label %.if.end.602
.if.end.602:
br label %.if.end.590
.if.end.590:
%.tmp661 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp662 = load i8*, i8** %type
%.tmp663 = load i8*, i8** %buf
%.tmp664 = call %m262$.Token.type*(%m262$.ParseCtx.type*,i8*,i8*) @m262$push_token.m262$.Token.typep.m262$.ParseCtx.typep.cp.cp(%m262$.ParseCtx.type* %.tmp661, i8* %.tmp662, i8* %.tmp663)
br label %.if.end.524
.if.end.524:
br label %.if.end.513
.if.end.513:
br label %.if.end.471
.if.end.471:
br label %.if.end.425
.if.end.425:
br label %.if.end.420
.if.end.420:
br label %.if.end.385
.if.end.385:
br label %.if.end.353
.if.end.353:
br label %.if.end.348
.if.end.348:
br label %.for.start.331
.for.end.331:
%.tmp665 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp667 = getelementptr [4 x i8], [4 x i8]*@.str666, i32 0, i32 0
%.tmp669 = getelementptr [1 x i8], [1 x i8]*@.str668, i32 0, i32 0
%.tmp670 = call %m262$.Token.type*(%m262$.ParseCtx.type*,i8*,i8*) @m262$push_token.m262$.Token.typep.m262$.ParseCtx.typep.cp.cp(%m262$.ParseCtx.type* %.tmp665, i8* %.tmp667, i8* %.tmp669)
%.tmp671 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp672 = getelementptr %m262$.ParseCtx.type, %m262$.ParseCtx.type* %.tmp671, i32 0, i32 3
%.tmp673 = load %m262$.Token.type*, %m262$.Token.type** %.tmp672
%root = alloca %m262$.Token.type*
store %m262$.Token.type* %.tmp673, %m262$.Token.type** %root
%.tmp674 = load %m262$.ParseCtx.type*, %m262$.ParseCtx.type** %ctx
%.tmp675 = bitcast %m262$.ParseCtx.type* %.tmp674 to i8*
call void(i8*) @free(i8* %.tmp675)
%.tmp676 = load %m262$.Token.type*, %m262$.Token.type** %root
%.tmp677 = bitcast %m262$.Token.type* %.tmp676 to %m262$.Token.type*
ret %m262$.Token.type* %.tmp677
}
@.str368 = constant [16 x i8] c"digit too large\00"
@.str376 = constant [7 x i8] c"NUMBER\00"
@.str406 = constant [16 x i8] c"digit too large\00"
@.str414 = constant [5 x i8] c"WORD\00"
@.str438 = constant [61 x i8] c"lexer: reached end of file while scanning for 'STRING' token\00"
@.str444 = constant [17 x i8] c"string too large\00"
@.str465 = constant [7 x i8] c"STRING\00"
@.str486 = constant [15 x i8] c"char too large\00"
@.str507 = constant [4 x i8] c"CHR\00"
@.str515 = constant [3 x i8] c"NL\00"
@.str517 = constant [2 x i8] c"\0A\00"
@.str554 = constant [8 x i8] c"COMMENT\00"
@.str561 = constant [9 x i8] c"OPERATOR\00"
@.str563 = constant [2 x i8] c"-\00"
@.str569 = constant [47 x i8] c"%d:%d error: found non ascii token: '%c' (%d)\0A\00"
@.str583 = constant [9 x i8] c"OPERATOR\00"
@.str592 = constant [3 x i8] c"==\00"
@.str604 = constant [3 x i8] c"!=\00"
@.str616 = constant [3 x i8] c">=\00"
@.str628 = constant [3 x i8] c"<=\00"
@.str644 = constant [13 x i8] c"error on ..\0A\00"
@.str648 = constant [4 x i8] c"...\00"
@.str651 = constant [8 x i8] c"KEYWORD\00"
@.str666 = constant [4 x i8] c"EOF\00"
@.str668 = constant [1 x i8] c"\00"
%m678$.Error.type = type {i32,i32,i8*,i8*}
@Error_size = constant i32 24
define %m678$.Error.type* @m678$from.m678$.Error.typep.m262$.Token.typep.cp(%m262$.Token.type* %.t.arg, i8* %.message.arg) {
%t = alloca %m262$.Token.type*
store %m262$.Token.type* %.t.arg, %m262$.Token.type** %t
%message = alloca i8*
store i8* %.message.arg, i8** %message
%.tmp679 = bitcast ptr null to i8*
%.tmp680 = load %m262$.Token.type*, %m262$.Token.type** %t
%.tmp681 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp680, i32 0, i32 2
%.tmp682 = load i32, i32* %.tmp681
%.tmp683 = load %m262$.Token.type*, %m262$.Token.type** %t
%.tmp684 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp683, i32 0, i32 3
%.tmp685 = load i32, i32* %.tmp684
%.tmp686 = load i8*, i8** %message
%.tmp687 = call %m678$.Error.type*(i8*,i32,i32,i8*) @m678$new.m678$.Error.typep.cp.i.i.cp(i8* %.tmp679, i32 %.tmp682, i32 %.tmp685, i8* %.tmp686)
ret %m678$.Error.type* %.tmp687
}
define %m678$.Error.type* @m678$new.m678$.Error.typep.cp.i.i.cp(i8* %.filename.arg, i32 %.line.arg, i32 %.char_of_line.arg, i8* %.message.arg) {
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%line = alloca i32
store i32 %.line.arg, i32* %line
%char_of_line = alloca i32
store i32 %.char_of_line.arg, i32* %char_of_line
%message = alloca i8*
store i8* %.message.arg, i8** %message
%.tmp688 = load i32, i32* @Error_size
%.tmp689 = call i8*(i32) @malloc(i32 %.tmp688)
%.tmp690 = bitcast i8* %.tmp689 to %m678$.Error.type*
%e = alloca %m678$.Error.type*
store %m678$.Error.type* %.tmp690, %m678$.Error.type** %e
%.tmp691 = load %m678$.Error.type*, %m678$.Error.type** %e
%.tmp692 = getelementptr %m678$.Error.type, %m678$.Error.type* %.tmp691, i32 0, i32 0
%.tmp693 = load i32, i32* %line
store i32 %.tmp693, i32* %.tmp692
%.tmp694 = load %m678$.Error.type*, %m678$.Error.type** %e
%.tmp695 = getelementptr %m678$.Error.type, %m678$.Error.type* %.tmp694, i32 0, i32 1
%.tmp696 = load i32, i32* %char_of_line
store i32 %.tmp696, i32* %.tmp695
%.tmp697 = load %m678$.Error.type*, %m678$.Error.type** %e
%.tmp698 = getelementptr %m678$.Error.type, %m678$.Error.type* %.tmp697, i32 0, i32 3
%.tmp699 = load i8*, i8** %message
store i8* %.tmp699, i8** %.tmp698
%.tmp700 = load %m678$.Error.type*, %m678$.Error.type** %e
%.tmp701 = getelementptr %m678$.Error.type, %m678$.Error.type* %.tmp700, i32 0, i32 2
%.tmp702 = load i8*, i8** %filename
store i8* %.tmp702, i8** %.tmp701
%.tmp703 = load %m678$.Error.type*, %m678$.Error.type** %e
ret %m678$.Error.type* %.tmp703
}
define void @m678$report.v.m678$.Error.typep(%m678$.Error.type* %.e.arg) {
%e = alloca %m678$.Error.type*
store %m678$.Error.type* %.e.arg, %m678$.Error.type** %e
%.tmp705 = getelementptr [22 x i8], [22 x i8]*@.str704, i32 0, i32 0
%.tmp706 = load %m678$.Error.type*, %m678$.Error.type** %e
%.tmp707 = getelementptr %m678$.Error.type, %m678$.Error.type* %.tmp706, i32 0, i32 2
%.tmp708 = load i8*, i8** %.tmp707
%.tmp709 = load %m678$.Error.type*, %m678$.Error.type** %e
%.tmp710 = getelementptr %m678$.Error.type, %m678$.Error.type* %.tmp709, i32 0, i32 0
%.tmp711 = load i32, i32* %.tmp710
%.tmp712 = load %m678$.Error.type*, %m678$.Error.type** %e
%.tmp713 = getelementptr %m678$.Error.type, %m678$.Error.type* %.tmp712, i32 0, i32 1
%.tmp714 = load i32, i32* %.tmp713
%.tmp715 = load %m678$.Error.type*, %m678$.Error.type** %e
%.tmp716 = getelementptr %m678$.Error.type, %m678$.Error.type* %.tmp715, i32 0, i32 3
%.tmp717 = load i8*, i8** %.tmp716
%.tmp718 = call i32(i8*,...) @printf(i8* %.tmp705, i8* %.tmp708, i32 %.tmp711, i32 %.tmp714, i8* %.tmp717)
ret void
}
define void @m678$freport.v.m0$.File.typep.m678$.Error.typep(%m0$.File.type* %.fd.arg, %m678$.Error.type* %.e.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%e = alloca %m678$.Error.type*
store %m678$.Error.type* %.e.arg, %m678$.Error.type** %e
%.tmp719 = load %m0$.File.type*, %m0$.File.type** %fd
%.tmp721 = getelementptr [22 x i8], [22 x i8]*@.str720, i32 0, i32 0
%.tmp722 = load %m678$.Error.type*, %m678$.Error.type** %e
%.tmp723 = getelementptr %m678$.Error.type, %m678$.Error.type* %.tmp722, i32 0, i32 2
%.tmp724 = load i8*, i8** %.tmp723
%.tmp725 = load %m678$.Error.type*, %m678$.Error.type** %e
%.tmp726 = getelementptr %m678$.Error.type, %m678$.Error.type* %.tmp725, i32 0, i32 0
%.tmp727 = load i32, i32* %.tmp726
%.tmp728 = load %m678$.Error.type*, %m678$.Error.type** %e
%.tmp729 = getelementptr %m678$.Error.type, %m678$.Error.type* %.tmp728, i32 0, i32 1
%.tmp730 = load i32, i32* %.tmp729
%.tmp731 = load %m678$.Error.type*, %m678$.Error.type** %e
%.tmp732 = getelementptr %m678$.Error.type, %m678$.Error.type* %.tmp731, i32 0, i32 3
%.tmp733 = load i8*, i8** %.tmp732
%.tmp734 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp719, i8* %.tmp721, i8* %.tmp724, i32 %.tmp727, i32 %.tmp730, i8* %.tmp733)
ret void
}
@.str704 = constant [22 x i8] c"[%s %d:%d] error: %s\0A\00"
@.str720 = constant [22 x i8] c"[%s %d:%d] error: %s\0A\00"
%m261$.Query.type = type {i8,i8*,%m261$.Query.type*}
@Query_size = constant i32 24
%m261$.Matcher.type = type {%m261$.Query.type*,i8,%m261$.Matcher.type*,%m261$.Matcher.type*}
@Matcher_size = constant i32 32
define void @m261$debug_matcher.v.m261$.Matcher.typep(%m261$.Matcher.type* %.m.arg) {
%m = alloca %m261$.Matcher.type*
store %m261$.Matcher.type* %.m.arg, %m261$.Matcher.type** %m
%.tmp736 = getelementptr [14 x i8], [14 x i8]*@.str735, i32 0, i32 0
%.tmp737 = call i32(i8*,...) @printf(i8* %.tmp736)
%.tmp739 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp740 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp739, i32 0, i32 0
%.tmp741 = load %m261$.Query.type*, %m261$.Query.type** %.tmp740
%q = alloca %m261$.Query.type*
store %m261$.Query.type* %.tmp741, %m261$.Query.type** %q
br label %.for.start.738
.for.start.738:
%.tmp742 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp743 = icmp ne %m261$.Query.type* %.tmp742, null
br i1 %.tmp743, label %.for.continue.738, label %.for.end.738
.for.continue.738:
%.tmp744 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp745 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp744, i32 0, i32 0
%.tmp746 = load i8, i8* %.tmp745
%.tmp747 = icmp eq i8 %.tmp746, 118
br i1 %.tmp747, label %.if.true.748, label %.if.false.748
.if.true.748:
%.tmp750 = getelementptr [30 x i8], [30 x i8]*@.str749, i32 0, i32 0
%.tmp751 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp752 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp751, i32 0, i32 0
%.tmp753 = load i8, i8* %.tmp752
%.tmp754 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp755 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp754, i32 0, i32 1
%.tmp756 = load i8*, i8** %.tmp755
%.tmp757 = call i32(i8*,...) @printf(i8* %.tmp750, i8 %.tmp753, i8* %.tmp756)
br label %.if.end.748
.if.false.748:
%.tmp759 = getelementptr [32 x i8], [32 x i8]*@.str758, i32 0, i32 0
%.tmp760 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp761 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp760, i32 0, i32 0
%.tmp762 = load i8, i8* %.tmp761
%.tmp763 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp764 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp763, i32 0, i32 1
%.tmp765 = load i8*, i8** %.tmp764
%.tmp766 = call i32(i8*,...) @printf(i8* %.tmp759, i8 %.tmp762, i8* %.tmp765)
br label %.if.end.748
.if.end.748:
%.tmp767 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp768 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp767, i32 0, i32 2
%.tmp769 = load %m261$.Query.type*, %m261$.Query.type** %.tmp768
store %m261$.Query.type* %.tmp769, %m261$.Query.type** %q
br label %.for.start.738
.for.end.738:
%.tmp771 = getelementptr [14 x i8], [14 x i8]*@.str770, i32 0, i32 0
%.tmp772 = call i32(i8*,...) @printf(i8* %.tmp771)
%.tmp773 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp774 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp773, i32 0, i32 3
%.tmp775 = load %m261$.Matcher.type*, %m261$.Matcher.type** %.tmp774
%.tmp776 = icmp ne %m261$.Matcher.type* %.tmp775, null
br i1 %.tmp776, label %.if.true.777, label %.if.false.777
.if.true.777:
%.tmp778 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp779 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp778, i32 0, i32 3
%.tmp780 = load %m261$.Matcher.type*, %m261$.Matcher.type** %.tmp779
call void(%m261$.Matcher.type*) @m261$debug_matcher.v.m261$.Matcher.typep(%m261$.Matcher.type* %.tmp780)
br label %.if.end.777
.if.false.777:
br label %.if.end.777
.if.end.777:
%.tmp782 = getelementptr [13 x i8], [13 x i8]*@.str781, i32 0, i32 0
%.tmp783 = call i32(i8*,...) @printf(i8* %.tmp782)
%.tmp784 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp785 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp784, i32 0, i32 2
%.tmp786 = load %m261$.Matcher.type*, %m261$.Matcher.type** %.tmp785
%.tmp787 = icmp ne %m261$.Matcher.type* %.tmp786, null
br i1 %.tmp787, label %.if.true.788, label %.if.false.788
.if.true.788:
%.tmp789 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp790 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp789, i32 0, i32 2
%.tmp791 = load %m261$.Matcher.type*, %m261$.Matcher.type** %.tmp790
call void(%m261$.Matcher.type*) @m261$debug_matcher.v.m261$.Matcher.typep(%m261$.Matcher.type* %.tmp791)
br label %.if.end.788
.if.false.788:
br label %.if.end.788
.if.end.788:
%.tmp793 = getelementptr [5 x i8], [5 x i8]*@.str792, i32 0, i32 0
%.tmp794 = call i32(i8*,...) @printf(i8* %.tmp793)
ret void
}
%m261$.Rule.type = type {i8*,%m261$.Matcher.type*}
@Rule_size = constant i32 16
%m261$.ParsingContext.type = type {%m262$.Token.type*}
@ParsingContext_size = constant i32 8
define %m261$.ParsingContext.type* @m261$new_context.m261$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.f.arg) {
%f = alloca %m0$.File.type*
store %m0$.File.type* %.f.arg, %m0$.File.type** %f
%.tmp795 = load i32, i32* @ParsingContext_size
%.tmp796 = call i8*(i32) @malloc(i32 %.tmp795)
%.tmp797 = bitcast i8* %.tmp796 to %m261$.ParsingContext.type*
%ctx = alloca %m261$.ParsingContext.type*
store %m261$.ParsingContext.type* %.tmp797, %m261$.ParsingContext.type** %ctx
%.tmp798 = load %m0$.File.type*, %m0$.File.type** %f
%.tmp799 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp798)
%fd = alloca i32
store i32 %.tmp799, i32* %fd
%.tmp800 = load i32, i32* %fd
%.tmp801 = call %m185$.PeekerInfo.type*(i32) @m185$new.m185$.PeekerInfo.typep.i(i32 %.tmp800)
%p = alloca %m185$.PeekerInfo.type*
store %m185$.PeekerInfo.type* %.tmp801, %m185$.PeekerInfo.type** %p
%.tmp802 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp803 = call %m262$.Token.type*(%m185$.PeekerInfo.type*,i1) @m262$tokenize.m262$.Token.typep.m185$.PeekerInfo.typep.b(%m185$.PeekerInfo.type* %.tmp802, i1 0)
%token_list = alloca %m262$.Token.type*
store %m262$.Token.type* %.tmp803, %m262$.Token.type** %token_list
%.tmp804 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp805 = bitcast %m185$.PeekerInfo.type* %.tmp804 to i8*
call void(i8*) @free(i8* %.tmp805)
%.tmp806 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp807 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp806, i32 0, i32 0
%.tmp808 = load %m262$.Token.type*, %m262$.Token.type** %token_list
store %m262$.Token.type* %.tmp808, %m262$.Token.type** %.tmp807
%.tmp809 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
ret %m261$.ParsingContext.type* %.tmp809
}
define %m261$.Matcher.type* @m261$new_matcher.m261$.Matcher.typep() {
%.tmp810 = load i32, i32* @Matcher_size
%.tmp811 = call i8*(i32) @malloc(i32 %.tmp810)
%.tmp812 = bitcast i8* %.tmp811 to %m261$.Matcher.type*
%m = alloca %m261$.Matcher.type*
store %m261$.Matcher.type* %.tmp812, %m261$.Matcher.type** %m
%.tmp813 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp814 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp813, i32 0, i32 1
store i8 49, i8* %.tmp814
%.tmp815 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp816 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp815, i32 0, i32 2
store %m261$.Matcher.type* null, %m261$.Matcher.type** %.tmp816
%.tmp817 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp818 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp817, i32 0, i32 3
store %m261$.Matcher.type* null, %m261$.Matcher.type** %.tmp818
%.tmp819 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp820 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp819, i32 0, i32 0
store %m261$.Query.type* null, %m261$.Query.type** %.tmp820
%.tmp821 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
ret %m261$.Matcher.type* %.tmp821
}
define %m261$.Matcher.type* @m261$parse_matcher.m261$.Matcher.typep.m261$.ParsingContext.typep(%m261$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m261$.ParsingContext.type*
store %m261$.ParsingContext.type* %.ctx.arg, %m261$.ParsingContext.type** %ctx
%m = alloca %m261$.Matcher.type*
%.tmp822 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp823 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp822, i32 0, i32 0
%.tmp824 = load %m262$.Token.type*, %m262$.Token.type** %.tmp823
%.tmp825 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp824, i32 0, i32 1
%.tmp826 = load i8*, i8** %.tmp825
%.tmp828 = getelementptr [2 x i8], [2 x i8]*@.str827, i32 0, i32 0
%.tmp829 = call i32(i8*,i8*) @strcmp(i8* %.tmp826, i8* %.tmp828)
%.tmp830 = icmp eq i32 %.tmp829, 0
br i1 %.tmp830, label %.if.true.831, label %.if.false.831
.if.true.831:
%.tmp832 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp833 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp832, i32 0, i32 0
%.tmp834 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp835 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp834, i32 0, i32 0
%.tmp836 = load %m262$.Token.type*, %m262$.Token.type** %.tmp835
%.tmp837 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp836, i32 0, i32 5
%.tmp838 = load %m262$.Token.type*, %m262$.Token.type** %.tmp837
store %m262$.Token.type* %.tmp838, %m262$.Token.type** %.tmp833
%max_matchers = alloca i32
store i32 10, i32* %max_matchers
%.tmp839 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp840 = call %m261$.Matcher.type*(%m261$.ParsingContext.type*) @m261$parse_matcher.m261$.Matcher.typep.m261$.ParsingContext.typep(%m261$.ParsingContext.type* %.tmp839)
store %m261$.Matcher.type* %.tmp840, %m261$.Matcher.type** %m
%.tmp841 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp842 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp841, i32 0, i32 0
%.tmp843 = load %m262$.Token.type*, %m262$.Token.type** %.tmp842
%.tmp844 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp843, i32 0, i32 1
%.tmp845 = load i8*, i8** %.tmp844
%.tmp847 = getelementptr [2 x i8], [2 x i8]*@.str846, i32 0, i32 0
%.tmp848 = call i32(i8*,i8*) @strcmp(i8* %.tmp845, i8* %.tmp847)
%.tmp849 = icmp eq i32 %.tmp848, 0
br i1 %.tmp849, label %.if.true.850, label %.if.false.850
.if.true.850:
%.tmp851 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp852 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp851, i32 0, i32 0
%.tmp853 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp854 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp853, i32 0, i32 0
%.tmp855 = load %m262$.Token.type*, %m262$.Token.type** %.tmp854
%.tmp856 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp855, i32 0, i32 5
%.tmp857 = load %m262$.Token.type*, %m262$.Token.type** %.tmp856
store %m262$.Token.type* %.tmp857, %m262$.Token.type** %.tmp852
%.tmp858 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%last_matcher = alloca %m261$.Matcher.type*
store %m261$.Matcher.type* %.tmp858, %m261$.Matcher.type** %last_matcher
br label %.for.start.859
.for.start.859:
%.tmp860 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp861 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp860, i32 0, i32 0
%.tmp862 = load %m262$.Token.type*, %m262$.Token.type** %.tmp861
%.tmp863 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp862, i32 0, i32 1
%.tmp864 = load i8*, i8** %.tmp863
%.tmp866 = getelementptr [2 x i8], [2 x i8]*@.str865, i32 0, i32 0
%.tmp867 = call i32(i8*,i8*) @strcmp(i8* %.tmp864, i8* %.tmp866)
%.tmp868 = icmp ne i32 %.tmp867, 0
%.tmp869 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp870 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp869, i32 0, i32 0
%.tmp871 = load %m262$.Token.type*, %m262$.Token.type** %.tmp870
%.tmp872 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp871, i32 0, i32 0
%.tmp873 = load i8*, i8** %.tmp872
%.tmp875 = getelementptr [4 x i8], [4 x i8]*@.str874, i32 0, i32 0
%.tmp876 = call i32(i8*,i8*) @strcmp(i8* %.tmp873, i8* %.tmp875)
%.tmp877 = icmp ne i32 %.tmp876, 0
%.tmp878 = and i1 %.tmp868, %.tmp877
br i1 %.tmp878, label %.for.continue.859, label %.for.end.859
.for.continue.859:
%.tmp879 = load %m261$.Matcher.type*, %m261$.Matcher.type** %last_matcher
%.tmp880 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp879, i32 0, i32 2
%.tmp881 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp882 = call %m261$.Matcher.type*(%m261$.ParsingContext.type*) @m261$parse_matcher.m261$.Matcher.typep.m261$.ParsingContext.typep(%m261$.ParsingContext.type* %.tmp881)
store %m261$.Matcher.type* %.tmp882, %m261$.Matcher.type** %.tmp880
%.tmp883 = load %m261$.Matcher.type*, %m261$.Matcher.type** %last_matcher
%.tmp884 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp883, i32 0, i32 2
%.tmp885 = load %m261$.Matcher.type*, %m261$.Matcher.type** %.tmp884
store %m261$.Matcher.type* %.tmp885, %m261$.Matcher.type** %last_matcher
%.tmp886 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp887 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp886, i32 0, i32 0
%.tmp888 = load %m262$.Token.type*, %m262$.Token.type** %.tmp887
%.tmp889 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp888, i32 0, i32 1
%.tmp890 = load i8*, i8** %.tmp889
%.tmp892 = getelementptr [2 x i8], [2 x i8]*@.str891, i32 0, i32 0
%.tmp893 = call i32(i8*,i8*) @strcmp(i8* %.tmp890, i8* %.tmp892)
%.tmp894 = icmp ne i32 %.tmp893, 0
%.tmp895 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp896 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp895, i32 0, i32 0
%.tmp897 = load %m262$.Token.type*, %m262$.Token.type** %.tmp896
%.tmp898 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp897, i32 0, i32 1
%.tmp899 = load i8*, i8** %.tmp898
%.tmp901 = getelementptr [2 x i8], [2 x i8]*@.str900, i32 0, i32 0
%.tmp902 = call i32(i8*,i8*) @strcmp(i8* %.tmp899, i8* %.tmp901)
%.tmp903 = icmp ne i32 %.tmp902, 0
%.tmp904 = and i1 %.tmp894, %.tmp903
br i1 %.tmp904, label %.if.true.905, label %.if.false.905
.if.true.905:
%.tmp907 = getelementptr [48 x i8], [48 x i8]*@.str906, i32 0, i32 0
%.tmp908 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp909 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp908, i32 0, i32 0
%.tmp910 = load %m262$.Token.type*, %m262$.Token.type** %.tmp909
%.tmp911 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp910, i32 0, i32 2
%.tmp912 = load i32, i32* %.tmp911
%.tmp913 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp914 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp913, i32 0, i32 0
%.tmp915 = load %m262$.Token.type*, %m262$.Token.type** %.tmp914
%.tmp916 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp915, i32 0, i32 3
%.tmp917 = load i32, i32* %.tmp916
%.tmp918 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp919 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp918, i32 0, i32 0
%.tmp920 = load %m262$.Token.type*, %m262$.Token.type** %.tmp919
%.tmp921 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp920, i32 0, i32 1
%.tmp922 = load i8*, i8** %.tmp921
%.tmp923 = call i32(i8*,...) @printf(i8* %.tmp907, i32 %.tmp912, i32 %.tmp917, i8* %.tmp922)
call void(i32) @exit(i32 1)
br label %.if.end.905
.if.false.905:
br label %.if.end.905
.if.end.905:
%.tmp924 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp925 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp924, i32 0, i32 0
%.tmp926 = load %m262$.Token.type*, %m262$.Token.type** %.tmp925
%.tmp927 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp926, i32 0, i32 1
%.tmp928 = load i8*, i8** %.tmp927
%.tmp930 = getelementptr [2 x i8], [2 x i8]*@.str929, i32 0, i32 0
%.tmp931 = call i32(i8*,i8*) @strcmp(i8* %.tmp928, i8* %.tmp930)
%.tmp932 = icmp eq i32 %.tmp931, 0
br i1 %.tmp932, label %.if.true.933, label %.if.false.933
.if.true.933:
%.tmp934 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp935 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp934, i32 0, i32 0
%.tmp936 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp937 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp936, i32 0, i32 0
%.tmp938 = load %m262$.Token.type*, %m262$.Token.type** %.tmp937
%.tmp939 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp938, i32 0, i32 5
%.tmp940 = load %m262$.Token.type*, %m262$.Token.type** %.tmp939
store %m262$.Token.type* %.tmp940, %m262$.Token.type** %.tmp935
br label %.if.end.933
.if.false.933:
br label %.if.end.933
.if.end.933:
br label %.for.start.859
.for.end.859:
br label %.if.end.850
.if.false.850:
br label %.if.end.850
.if.end.850:
%.tmp941 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp942 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp941, i32 0, i32 0
%.tmp943 = load %m262$.Token.type*, %m262$.Token.type** %.tmp942
%.tmp944 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp943, i32 0, i32 1
%.tmp945 = load i8*, i8** %.tmp944
%.tmp947 = getelementptr [2 x i8], [2 x i8]*@.str946, i32 0, i32 0
%.tmp948 = call i32(i8*,i8*) @strcmp(i8* %.tmp945, i8* %.tmp947)
%.tmp949 = icmp ne i32 %.tmp948, 0
br i1 %.tmp949, label %.if.true.950, label %.if.false.950
.if.true.950:
%.tmp951 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp953 = getelementptr [22 x i8], [22 x i8]*@.str952, i32 0, i32 0
call void(%m261$.ParsingContext.type*,i8*) @m261$parser_error.v.m261$.ParsingContext.typep.cp(%m261$.ParsingContext.type* %.tmp951, i8* %.tmp953)
br label %.if.end.950
.if.false.950:
br label %.if.end.950
.if.end.950:
%.tmp954 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp955 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp954, i32 0, i32 0
%.tmp956 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp957 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp956, i32 0, i32 0
%.tmp958 = load %m262$.Token.type*, %m262$.Token.type** %.tmp957
%.tmp959 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp958, i32 0, i32 5
%.tmp960 = load %m262$.Token.type*, %m262$.Token.type** %.tmp959
store %m262$.Token.type* %.tmp960, %m262$.Token.type** %.tmp955
%.tmp961 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp962 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp961, i32 0, i32 0
%.tmp963 = load %m262$.Token.type*, %m262$.Token.type** %.tmp962
%.tmp964 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp963, i32 0, i32 1
%.tmp965 = load i8*, i8** %.tmp964
%.tmp967 = getelementptr [2 x i8], [2 x i8]*@.str966, i32 0, i32 0
%.tmp968 = call i32(i8*,i8*) @strcmp(i8* %.tmp965, i8* %.tmp967)
%.tmp969 = icmp eq i32 %.tmp968, 0
br i1 %.tmp969, label %.if.true.970, label %.if.false.970
.if.true.970:
%.tmp971 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp972 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp971, i32 0, i32 0
%.tmp973 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp974 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp973, i32 0, i32 0
%.tmp975 = load %m262$.Token.type*, %m262$.Token.type** %.tmp974
%.tmp976 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp975, i32 0, i32 5
%.tmp977 = load %m262$.Token.type*, %m262$.Token.type** %.tmp976
store %m262$.Token.type* %.tmp977, %m262$.Token.type** %.tmp972
%.tmp978 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp979 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp978, i32 0, i32 1
store i8 43, i8* %.tmp979
br label %.if.end.970
.if.false.970:
%.tmp980 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp981 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp980, i32 0, i32 0
%.tmp982 = load %m262$.Token.type*, %m262$.Token.type** %.tmp981
%.tmp983 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp982, i32 0, i32 1
%.tmp984 = load i8*, i8** %.tmp983
%.tmp986 = getelementptr [2 x i8], [2 x i8]*@.str985, i32 0, i32 0
%.tmp987 = call i32(i8*,i8*) @strcmp(i8* %.tmp984, i8* %.tmp986)
%.tmp988 = icmp eq i32 %.tmp987, 0
br i1 %.tmp988, label %.if.true.989, label %.if.false.989
.if.true.989:
%.tmp990 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp991 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp990, i32 0, i32 0
%.tmp992 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp993 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp992, i32 0, i32 0
%.tmp994 = load %m262$.Token.type*, %m262$.Token.type** %.tmp993
%.tmp995 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp994, i32 0, i32 5
%.tmp996 = load %m262$.Token.type*, %m262$.Token.type** %.tmp995
store %m262$.Token.type* %.tmp996, %m262$.Token.type** %.tmp991
%.tmp997 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp998 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp997, i32 0, i32 1
store i8 42, i8* %.tmp998
br label %.if.end.989
.if.false.989:
%.tmp999 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1000 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp999, i32 0, i32 0
%.tmp1001 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1000
%.tmp1002 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1001, i32 0, i32 1
%.tmp1003 = load i8*, i8** %.tmp1002
%.tmp1005 = getelementptr [2 x i8], [2 x i8]*@.str1004, i32 0, i32 0
%.tmp1006 = call i32(i8*,i8*) @strcmp(i8* %.tmp1003, i8* %.tmp1005)
%.tmp1007 = icmp eq i32 %.tmp1006, 0
br i1 %.tmp1007, label %.if.true.1008, label %.if.false.1008
.if.true.1008:
%.tmp1009 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1010 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1009, i32 0, i32 0
%.tmp1011 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1012 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1011, i32 0, i32 0
%.tmp1013 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1012
%.tmp1014 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1013, i32 0, i32 5
%.tmp1015 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1014
store %m262$.Token.type* %.tmp1015, %m262$.Token.type** %.tmp1010
%.tmp1016 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp1017 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp1016, i32 0, i32 1
store i8 63, i8* %.tmp1017
br label %.if.end.1008
.if.false.1008:
br label %.if.end.1008
.if.end.1008:
br label %.if.end.989
.if.end.989:
br label %.if.end.970
.if.end.970:
br label %.if.end.831
.if.false.831:
%.tmp1018 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1019 = call %m261$.Matcher.type*(%m261$.ParsingContext.type*) @m261$parse_simple_matcher.m261$.Matcher.typep.m261$.ParsingContext.typep(%m261$.ParsingContext.type* %.tmp1018)
store %m261$.Matcher.type* %.tmp1019, %m261$.Matcher.type** %m
br label %.if.end.831
.if.end.831:
%.tmp1020 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1021 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1020, i32 0, i32 0
%.tmp1022 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1021
%.tmp1023 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1022, i32 0, i32 1
%.tmp1024 = load i8*, i8** %.tmp1023
%.tmp1026 = getelementptr [2 x i8], [2 x i8]*@.str1025, i32 0, i32 0
%.tmp1027 = call i32(i8*,i8*) @strcmp(i8* %.tmp1024, i8* %.tmp1026)
%.tmp1028 = icmp eq i32 %.tmp1027, 0
%.tmp1029 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1030 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1029, i32 0, i32 0
%.tmp1031 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1030
%.tmp1032 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1031, i32 0, i32 0
%.tmp1033 = load i8*, i8** %.tmp1032
%.tmp1035 = getelementptr [5 x i8], [5 x i8]*@.str1034, i32 0, i32 0
%.tmp1036 = call i32(i8*,i8*) @strcmp(i8* %.tmp1033, i8* %.tmp1035)
%.tmp1037 = icmp eq i32 %.tmp1036, 0
%.tmp1038 = or i1 %.tmp1028, %.tmp1037
br i1 %.tmp1038, label %.if.true.1039, label %.if.false.1039
.if.true.1039:
%.tmp1040 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp1041 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp1040, i32 0, i32 3
%.tmp1042 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1043 = call %m261$.Matcher.type*(%m261$.ParsingContext.type*) @m261$parse_matcher.m261$.Matcher.typep.m261$.ParsingContext.typep(%m261$.ParsingContext.type* %.tmp1042)
store %m261$.Matcher.type* %.tmp1043, %m261$.Matcher.type** %.tmp1041
br label %.if.end.1039
.if.false.1039:
br label %.if.end.1039
.if.end.1039:
%.tmp1044 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
ret %m261$.Matcher.type* %.tmp1044
}
define %m261$.Matcher.type* @m261$parse_simple_matcher.m261$.Matcher.typep.m261$.ParsingContext.typep(%m261$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m261$.ParsingContext.type*
store %m261$.ParsingContext.type* %.ctx.arg, %m261$.ParsingContext.type** %ctx
%.tmp1045 = call %m261$.Matcher.type*() @m261$new_matcher.m261$.Matcher.typep()
%m = alloca %m261$.Matcher.type*
store %m261$.Matcher.type* %.tmp1045, %m261$.Matcher.type** %m
%count = alloca i32
%.tmp1046 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1047 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1046, i32 0, i32 0
%.tmp1048 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1047
%ptr = alloca %m262$.Token.type*
store %m262$.Token.type* %.tmp1048, %m262$.Token.type** %ptr
store i32 0, i32* %count
br label %.for.start.1049
.for.start.1049:
%.tmp1050 = load %m262$.Token.type*, %m262$.Token.type** %ptr
%.tmp1051 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1050, i32 0, i32 0
%.tmp1052 = load i8*, i8** %.tmp1051
%.tmp1054 = getelementptr [5 x i8], [5 x i8]*@.str1053, i32 0, i32 0
%.tmp1055 = call i32(i8*,i8*) @strcmp(i8* %.tmp1052, i8* %.tmp1054)
%.tmp1056 = icmp eq i32 %.tmp1055, 0
%.tmp1057 = load %m262$.Token.type*, %m262$.Token.type** %ptr
%.tmp1058 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1057, i32 0, i32 0
%.tmp1059 = load i8*, i8** %.tmp1058
%.tmp1061 = getelementptr [7 x i8], [7 x i8]*@.str1060, i32 0, i32 0
%.tmp1062 = call i32(i8*,i8*) @strcmp(i8* %.tmp1059, i8* %.tmp1061)
%.tmp1063 = icmp eq i32 %.tmp1062, 0
%.tmp1064 = or i1 %.tmp1056, %.tmp1063
br i1 %.tmp1064, label %.for.continue.1049, label %.for.end.1049
.for.continue.1049:
%.tmp1065 = load i32, i32* %count
%.tmp1066 = add i32 %.tmp1065, 1
store i32 %.tmp1066, i32* %count
%.tmp1067 = load %m262$.Token.type*, %m262$.Token.type** %ptr
%.tmp1068 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1067, i32 0, i32 5
%.tmp1069 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1068
store %m262$.Token.type* %.tmp1069, %m262$.Token.type** %ptr
br label %.for.start.1049
.for.end.1049:
%.tmp1070 = load i32, i32* @Query_size
%.tmp1071 = icmp sgt i32 %.tmp1070, 0
br i1 %.tmp1071, label %.if.true.1072, label %.if.false.1072
.if.true.1072:
%.tmp1073 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp1074 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp1073, i32 0, i32 0
%.tmp1075 = load i32, i32* @Query_size
%.tmp1076 = call i8*(i32) @malloc(i32 %.tmp1075)
%.tmp1077 = bitcast i8* %.tmp1076 to %m261$.Query.type*
store %m261$.Query.type* %.tmp1077, %m261$.Query.type** %.tmp1074
br label %.if.end.1072
.if.false.1072:
%.tmp1078 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp1079 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp1078, i32 0, i32 0
store %m261$.Query.type* null, %m261$.Query.type** %.tmp1079
br label %.if.end.1072
.if.end.1072:
%.tmp1080 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp1081 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp1080, i32 0, i32 0
%.tmp1082 = load %m261$.Query.type*, %m261$.Query.type** %.tmp1081
%q = alloca %m261$.Query.type*
store %m261$.Query.type* %.tmp1082, %m261$.Query.type** %q
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1083
.for.start.1083:
%.tmp1084 = load i32, i32* %i
%.tmp1085 = load i32, i32* %count
%.tmp1086 = icmp slt i32 %.tmp1084, %.tmp1085
br i1 %.tmp1086, label %.for.continue.1083, label %.for.end.1083
.for.continue.1083:
%.tmp1087 = load i32, i32* %i
%.tmp1088 = icmp sgt i32 %.tmp1087, 0
br i1 %.tmp1088, label %.if.true.1089, label %.if.false.1089
.if.true.1089:
%.tmp1090 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1091 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1090, i32 0, i32 2
%.tmp1092 = load i32, i32* @Query_size
%.tmp1093 = call i8*(i32) @malloc(i32 %.tmp1092)
%.tmp1094 = bitcast i8* %.tmp1093 to %m261$.Query.type*
store %m261$.Query.type* %.tmp1094, %m261$.Query.type** %.tmp1091
%.tmp1095 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1096 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1095, i32 0, i32 2
%.tmp1097 = load %m261$.Query.type*, %m261$.Query.type** %.tmp1096
store %m261$.Query.type* %.tmp1097, %m261$.Query.type** %q
br label %.if.end.1089
.if.false.1089:
br label %.if.end.1089
.if.end.1089:
%.tmp1098 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1099 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1098, i32 0, i32 0
%.tmp1100 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1099
%.tmp1101 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1100, i32 0, i32 0
%.tmp1102 = load i8*, i8** %.tmp1101
%.tmp1104 = getelementptr [7 x i8], [7 x i8]*@.str1103, i32 0, i32 0
%.tmp1105 = call i32(i8*,i8*) @strcmp(i8* %.tmp1102, i8* %.tmp1104)
%.tmp1106 = icmp eq i32 %.tmp1105, 0
br i1 %.tmp1106, label %.if.true.1107, label %.if.false.1107
.if.true.1107:
%.tmp1108 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1109 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1108, i32 0, i32 0
store i8 118, i8* %.tmp1109
br label %.if.end.1107
.if.false.1107:
%.tmp1110 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1111 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1110, i32 0, i32 0
%.tmp1112 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1111
%.tmp1113 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1112, i32 0, i32 1
%.tmp1114 = load i8*, i8** %.tmp1113
%.tmp1115 = call i1(i8*) @m3$is_lower.b.cp(i8* %.tmp1114)
br i1 %.tmp1115, label %.if.true.1116, label %.if.false.1116
.if.true.1116:
%.tmp1117 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1118 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1117, i32 0, i32 0
store i8 97, i8* %.tmp1118
br label %.if.end.1116
.if.false.1116:
%.tmp1119 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1120 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1119, i32 0, i32 0
%.tmp1121 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1120
%.tmp1122 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1121, i32 0, i32 1
%.tmp1123 = load i8*, i8** %.tmp1122
%.tmp1124 = call i1(i8*) @m3$is_upper.b.cp(i8* %.tmp1123)
br i1 %.tmp1124, label %.if.true.1125, label %.if.false.1125
.if.true.1125:
%.tmp1126 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1127 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1126, i32 0, i32 0
store i8 116, i8* %.tmp1127
br label %.if.end.1125
.if.false.1125:
%.tmp1129 = getelementptr [17 x i8], [17 x i8]*@.str1128, i32 0, i32 0
%.tmp1130 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1131 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1130, i32 0, i32 0
%.tmp1132 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1131
%.tmp1133 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1132, i32 0, i32 1
%.tmp1134 = load i8*, i8** %.tmp1133
%.tmp1135 = call i32(i8*,...) @printf(i8* %.tmp1129, i8* %.tmp1134)
%.tmp1136 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1138 = getelementptr [50 x i8], [50 x i8]*@.str1137, i32 0, i32 0
call void(%m261$.ParsingContext.type*,i8*) @m261$parser_error.v.m261$.ParsingContext.typep.cp(%m261$.ParsingContext.type* %.tmp1136, i8* %.tmp1138)
br label %.if.end.1125
.if.end.1125:
br label %.if.end.1116
.if.end.1116:
br label %.if.end.1107
.if.end.1107:
%.tmp1139 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1140 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1139, i32 0, i32 1
%.tmp1141 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1142 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1141, i32 0, i32 0
%.tmp1143 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1142
%.tmp1144 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1143, i32 0, i32 1
%.tmp1145 = load i8*, i8** %.tmp1144
store i8* %.tmp1145, i8** %.tmp1140
%.tmp1146 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1147 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1146, i32 0, i32 2
store %m261$.Query.type* null, %m261$.Query.type** %.tmp1147
%.tmp1148 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1149 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1148, i32 0, i32 0
%.tmp1150 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1151 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1150, i32 0, i32 0
%.tmp1152 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1151
%.tmp1153 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1152, i32 0, i32 5
%.tmp1154 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1153
store %m262$.Token.type* %.tmp1154, %m262$.Token.type** %.tmp1149
%.tmp1155 = load i32, i32* %i
%.tmp1156 = add i32 %.tmp1155, 1
store i32 %.tmp1156, i32* %i
br label %.for.start.1083
.for.end.1083:
%.tmp1157 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
ret %m261$.Matcher.type* %.tmp1157
}
define %m261$.Rule.type* @m261$parse_rule.m261$.Rule.typep.m261$.ParsingContext.typep(%m261$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m261$.ParsingContext.type*
store %m261$.ParsingContext.type* %.ctx.arg, %m261$.ParsingContext.type** %ctx
%.tmp1158 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1159 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1158, i32 0, i32 0
%.tmp1160 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1159
%.tmp1161 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1160, i32 0, i32 1
%.tmp1162 = load i8*, i8** %.tmp1161
%rule_name = alloca i8*
store i8* %.tmp1162, i8** %rule_name
%.tmp1163 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1164 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1163, i32 0, i32 0
%.tmp1165 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1164
%.tmp1166 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1165, i32 0, i32 0
%.tmp1167 = load i8*, i8** %.tmp1166
%.tmp1169 = getelementptr [5 x i8], [5 x i8]*@.str1168, i32 0, i32 0
%.tmp1170 = call i32(i8*,i8*) @strcmp(i8* %.tmp1167, i8* %.tmp1169)
%.tmp1171 = icmp ne i32 %.tmp1170, 0
br i1 %.tmp1171, label %.if.true.1172, label %.if.false.1172
.if.true.1172:
%.tmp1174 = getelementptr [37 x i8], [37 x i8]*@.str1173, i32 0, i32 0
%.tmp1175 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1176 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1175, i32 0, i32 0
%.tmp1177 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1176
%.tmp1178 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1177, i32 0, i32 0
%.tmp1179 = load i8*, i8** %.tmp1178
%.tmp1180 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1181 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1180, i32 0, i32 0
%.tmp1182 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1181
%.tmp1183 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1182, i32 0, i32 1
%.tmp1184 = load i8*, i8** %.tmp1183
%.tmp1185 = call i32(i8*,...) @printf(i8* %.tmp1174, i8* %.tmp1179, i8* %.tmp1184)
%.tmp1186 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1188 = getelementptr [31 x i8], [31 x i8]*@.str1187, i32 0, i32 0
call void(%m261$.ParsingContext.type*,i8*) @m261$parser_error.v.m261$.ParsingContext.typep.cp(%m261$.ParsingContext.type* %.tmp1186, i8* %.tmp1188)
br label %.if.end.1172
.if.false.1172:
br label %.if.end.1172
.if.end.1172:
%.tmp1189 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1190 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1189, i32 0, i32 0
%.tmp1191 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1192 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1191, i32 0, i32 0
%.tmp1193 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1192
%.tmp1194 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1193, i32 0, i32 5
%.tmp1195 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1194
store %m262$.Token.type* %.tmp1195, %m262$.Token.type** %.tmp1190
%.tmp1196 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1197 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1196, i32 0, i32 0
%.tmp1198 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1197
%.tmp1199 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1198, i32 0, i32 1
%.tmp1200 = load i8*, i8** %.tmp1199
%.tmp1202 = getelementptr [2 x i8], [2 x i8]*@.str1201, i32 0, i32 0
%.tmp1203 = call i32(i8*,i8*) @strcmp(i8* %.tmp1200, i8* %.tmp1202)
%.tmp1204 = icmp ne i32 %.tmp1203, 0
br i1 %.tmp1204, label %.if.true.1205, label %.if.false.1205
.if.true.1205:
%.tmp1206 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1207 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1206, i32 0, i32 0
%.tmp1208 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1207
%.tmp1209 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1208, i32 0, i32 1
%.tmp1210 = load i8*, i8** %.tmp1209
%.tmp1211 = call i32(i8*,...) @printf(i8* %.tmp1210)
%.tmp1212 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1214 = getelementptr [27 x i8], [27 x i8]*@.str1213, i32 0, i32 0
call void(%m261$.ParsingContext.type*,i8*) @m261$parser_error.v.m261$.ParsingContext.typep.cp(%m261$.ParsingContext.type* %.tmp1212, i8* %.tmp1214)
br label %.if.end.1205
.if.false.1205:
br label %.if.end.1205
.if.end.1205:
%.tmp1215 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1216 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1215, i32 0, i32 0
%.tmp1217 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1218 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1217, i32 0, i32 0
%.tmp1219 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1218
%.tmp1220 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1219, i32 0, i32 5
%.tmp1221 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1220
store %m262$.Token.type* %.tmp1221, %m262$.Token.type** %.tmp1216
%.tmp1222 = load i32, i32* @Rule_size
%.tmp1223 = call i8*(i32) @malloc(i32 %.tmp1222)
%.tmp1224 = bitcast i8* %.tmp1223 to %m261$.Rule.type*
%rule = alloca %m261$.Rule.type*
store %m261$.Rule.type* %.tmp1224, %m261$.Rule.type** %rule
%.tmp1225 = load %m261$.Rule.type*, %m261$.Rule.type** %rule
%.tmp1226 = getelementptr %m261$.Rule.type, %m261$.Rule.type* %.tmp1225, i32 0, i32 0
%.tmp1227 = load i8*, i8** %rule_name
store i8* %.tmp1227, i8** %.tmp1226
%.tmp1228 = load %m261$.Rule.type*, %m261$.Rule.type** %rule
%.tmp1229 = getelementptr %m261$.Rule.type, %m261$.Rule.type* %.tmp1228, i32 0, i32 1
%.tmp1230 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1231 = call %m261$.Matcher.type*(%m261$.ParsingContext.type*) @m261$parse_matcher.m261$.Matcher.typep.m261$.ParsingContext.typep(%m261$.ParsingContext.type* %.tmp1230)
store %m261$.Matcher.type* %.tmp1231, %m261$.Matcher.type** %.tmp1229
%.tmp1232 = load %m261$.Rule.type*, %m261$.Rule.type** %rule
ret %m261$.Rule.type* %.tmp1232
}
define void @m261$parser_error.v.m261$.ParsingContext.typep.cp(%m261$.ParsingContext.type* %.ctx.arg, i8* %.error.arg) {
%ctx = alloca %m261$.ParsingContext.type*
store %m261$.ParsingContext.type* %.ctx.arg, %m261$.ParsingContext.type** %ctx
%error = alloca i8*
store i8* %.error.arg, i8** %error
%.tmp1233 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1234 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1233, i32 0, i32 0
%.tmp1235 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1234
%.tmp1236 = load i8*, i8** %error
%.tmp1237 = call %m678$.Error.type*(%m262$.Token.type*,i8*) @m678$from.m678$.Error.typep.m262$.Token.typep.cp(%m262$.Token.type* %.tmp1235, i8* %.tmp1236)
%e = alloca %m678$.Error.type*
store %m678$.Error.type* %.tmp1237, %m678$.Error.type** %e
%.tmp1238 = load %m678$.Error.type*, %m678$.Error.type** %e
call void(%m678$.Error.type*) @m678$report.v.m678$.Error.typep(%m678$.Error.type* %.tmp1238)
call void(i32) @exit(i32 1)
ret void
}
define %m261$.Rule.type** @m261$parse_grammar.m261$.Rule.typepp.m261$.ParsingContext.typep(%m261$.ParsingContext.type* %.ctx.arg) {
%ctx = alloca %m261$.ParsingContext.type*
store %m261$.ParsingContext.type* %.ctx.arg, %m261$.ParsingContext.type** %ctx
%max_rules = alloca i32
store i32 40, i32* %max_rules
%.tmp1239 = load i32, i32* @ptr_size
%.tmp1240 = load i32, i32* %max_rules
%.tmp1241 = mul i32 %.tmp1239, %.tmp1240
%.tmp1242 = call i8*(i32) @malloc(i32 %.tmp1241)
%.tmp1243 = bitcast i8* %.tmp1242 to %m261$.Rule.type**
%grammar = alloca %m261$.Rule.type**
store %m261$.Rule.type** %.tmp1243, %m261$.Rule.type*** %grammar
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1244
.for.start.1244:
%.tmp1245 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1246 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1245, i32 0, i32 0
%.tmp1247 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1246
%.tmp1248 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1247, i32 0, i32 0
%.tmp1249 = load i8*, i8** %.tmp1248
%.tmp1251 = getelementptr [4 x i8], [4 x i8]*@.str1250, i32 0, i32 0
%.tmp1252 = call i32(i8*,i8*) @strcmp(i8* %.tmp1249, i8* %.tmp1251)
%.tmp1253 = icmp ne i32 %.tmp1252, 0
br i1 %.tmp1253, label %.for.continue.1244, label %.for.end.1244
.for.continue.1244:
%.tmp1254 = load i32, i32* %i
%.tmp1255 = load %m261$.Rule.type**, %m261$.Rule.type*** %grammar
%.tmp1256 = getelementptr %m261$.Rule.type*, %m261$.Rule.type** %.tmp1255, i32 %.tmp1254
%.tmp1257 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1258 = call %m261$.Rule.type*(%m261$.ParsingContext.type*) @m261$parse_rule.m261$.Rule.typep.m261$.ParsingContext.typep(%m261$.ParsingContext.type* %.tmp1257)
store %m261$.Rule.type* %.tmp1258, %m261$.Rule.type** %.tmp1256
br label %.for.start.1259
.for.start.1259:
%.tmp1260 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1261 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1260, i32 0, i32 0
%.tmp1262 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1261
%.tmp1263 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1262, i32 0, i32 1
%.tmp1264 = load i8*, i8** %.tmp1263
%.tmp1266 = getelementptr [2 x i8], [2 x i8]*@.str1265, i32 0, i32 0
%.tmp1267 = call i32(i8*,i8*) @strcmp(i8* %.tmp1264, i8* %.tmp1266)
%.tmp1268 = icmp eq i32 %.tmp1267, 0
br i1 %.tmp1268, label %.for.continue.1259, label %.for.end.1259
.for.continue.1259:
%.tmp1269 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1270 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1269, i32 0, i32 0
%.tmp1271 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp1272 = getelementptr %m261$.ParsingContext.type, %m261$.ParsingContext.type* %.tmp1271, i32 0, i32 0
%.tmp1273 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1272
%.tmp1274 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1273, i32 0, i32 5
%.tmp1275 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1274
store %m262$.Token.type* %.tmp1275, %m262$.Token.type** %.tmp1270
br label %.for.start.1259
.for.end.1259:
%.tmp1276 = load i32, i32* %i
%.tmp1277 = add i32 %.tmp1276, 1
store i32 %.tmp1277, i32* %i
br label %.for.start.1244
.for.end.1244:
%.tmp1278 = load %m261$.Rule.type**, %m261$.Rule.type*** %grammar
%.tmp1279 = bitcast %m261$.Rule.type** %.tmp1278 to %m261$.Rule.type**
ret %m261$.Rule.type** %.tmp1279
}
%m261$.Node.type = type {i8*,i8*,i8*,i32,i32,%m261$.Node.type*,%m261$.Node.type*,%m261$.Node.type*}
@Node_size = constant i32 56
define %m261$.Node.type* @m261$new_node.m261$.Node.typep.m262$.Token.typep.cp.cp(%m262$.Token.type* %.t.arg, i8* %.type.arg, i8* %.value.arg) {
%t = alloca %m262$.Token.type*
store %m262$.Token.type* %.t.arg, %m262$.Token.type** %t
%type = alloca i8*
store i8* %.type.arg, i8** %type
%value = alloca i8*
store i8* %.value.arg, i8** %value
%.tmp1280 = load i32, i32* @Node_size
%.tmp1281 = call i8*(i32) @malloc(i32 %.tmp1280)
%.tmp1282 = bitcast i8* %.tmp1281 to %m261$.Node.type*
%node = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp1282, %m261$.Node.type** %node
%.tmp1283 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp1284 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1283, i32 0, i32 0
%.tmp1285 = load i8*, i8** %type
store i8* %.tmp1285, i8** %.tmp1284
%.tmp1286 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp1287 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1286, i32 0, i32 1
%.tmp1288 = load i8*, i8** %value
store i8* %.tmp1288, i8** %.tmp1287
%.tmp1289 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp1290 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1289, i32 0, i32 3
%.tmp1291 = load %m262$.Token.type*, %m262$.Token.type** %t
%.tmp1292 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1291, i32 0, i32 2
%.tmp1293 = load i32, i32* %.tmp1292
store i32 %.tmp1293, i32* %.tmp1290
%.tmp1294 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp1295 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1294, i32 0, i32 2
%.tmp1296 = load %m262$.Token.type*, %m262$.Token.type** %t
%.tmp1297 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1296, i32 0, i32 4
%.tmp1298 = load i8*, i8** %.tmp1297
store i8* %.tmp1298, i8** %.tmp1295
%.tmp1299 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp1300 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1299, i32 0, i32 4
%.tmp1301 = load %m262$.Token.type*, %m262$.Token.type** %t
%.tmp1302 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1301, i32 0, i32 3
%.tmp1303 = load i32, i32* %.tmp1302
store i32 %.tmp1303, i32* %.tmp1300
%.tmp1304 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp1305 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1304, i32 0, i32 5
store %m261$.Node.type* null, %m261$.Node.type** %.tmp1305
%.tmp1306 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp1307 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1306, i32 0, i32 7
store %m261$.Node.type* null, %m261$.Node.type** %.tmp1307
%.tmp1308 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp1309 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1308, i32 0, i32 6
store %m261$.Node.type* null, %m261$.Node.type** %.tmp1309
%.tmp1310 = load %m261$.Node.type*, %m261$.Node.type** %node
ret %m261$.Node.type* %.tmp1310
}
define void @m261$child_append.v.m261$.Node.typep.m261$.Node.typep(%m261$.Node.type* %.parent.arg, %m261$.Node.type* %.child.arg) {
%parent = alloca %m261$.Node.type*
store %m261$.Node.type* %.parent.arg, %m261$.Node.type** %parent
%child = alloca %m261$.Node.type*
store %m261$.Node.type* %.child.arg, %m261$.Node.type** %child
%.tmp1311 = load %m261$.Node.type*, %m261$.Node.type** %parent
%.tmp1312 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1311, i32 0, i32 6
%.tmp1313 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1312
%.tmp1314 = icmp eq %m261$.Node.type* %.tmp1313, null
br i1 %.tmp1314, label %.if.true.1315, label %.if.false.1315
.if.true.1315:
%.tmp1316 = load %m261$.Node.type*, %m261$.Node.type** %parent
%.tmp1317 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1316, i32 0, i32 6
%.tmp1318 = load %m261$.Node.type*, %m261$.Node.type** %child
store %m261$.Node.type* %.tmp1318, %m261$.Node.type** %.tmp1317
br label %.if.end.1315
.if.false.1315:
%.tmp1319 = load %m261$.Node.type*, %m261$.Node.type** %parent
%.tmp1320 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1319, i32 0, i32 6
%.tmp1321 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1320
%c = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp1321, %m261$.Node.type** %c
br label %.for.start.1322
.for.start.1322:
%.tmp1323 = load %m261$.Node.type*, %m261$.Node.type** %c
%.tmp1324 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1323, i32 0, i32 7
%.tmp1325 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1324
%.tmp1326 = icmp ne %m261$.Node.type* %.tmp1325, null
br i1 %.tmp1326, label %.for.continue.1322, label %.for.end.1322
.for.continue.1322:
%.tmp1327 = load %m261$.Node.type*, %m261$.Node.type** %c
%.tmp1328 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1327, i32 0, i32 7
%.tmp1329 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1328
store %m261$.Node.type* %.tmp1329, %m261$.Node.type** %c
br label %.for.start.1322
.for.end.1322:
%.tmp1330 = load %m261$.Node.type*, %m261$.Node.type** %c
%.tmp1331 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1330, i32 0, i32 7
%.tmp1332 = load %m261$.Node.type*, %m261$.Node.type** %child
store %m261$.Node.type* %.tmp1332, %m261$.Node.type** %.tmp1331
br label %.if.end.1315
.if.end.1315:
%.tmp1333 = load %m261$.Node.type*, %m261$.Node.type** %child
%.tmp1334 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1333, i32 0, i32 7
store %m261$.Node.type* null, %m261$.Node.type** %.tmp1334
ret void
}
define void @m261$child_pop.v.m261$.Node.typep(%m261$.Node.type* %.parent.arg) {
%parent = alloca %m261$.Node.type*
store %m261$.Node.type* %.parent.arg, %m261$.Node.type** %parent
%.tmp1335 = load %m261$.Node.type*, %m261$.Node.type** %parent
%.tmp1336 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1335, i32 0, i32 6
%.tmp1337 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1336
%.tmp1338 = icmp eq %m261$.Node.type* %.tmp1337, null
br i1 %.tmp1338, label %.if.true.1339, label %.if.false.1339
.if.true.1339:
ret void
br label %.if.end.1339
.if.false.1339:
br label %.if.end.1339
.if.end.1339:
%.tmp1340 = load %m261$.Node.type*, %m261$.Node.type** %parent
%.tmp1341 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1340, i32 0, i32 6
%.tmp1342 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1341
%c = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp1342, %m261$.Node.type** %c
%.tmp1343 = load %m261$.Node.type*, %m261$.Node.type** %c
%.tmp1344 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1343, i32 0, i32 7
%.tmp1345 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1344
%.tmp1346 = icmp eq %m261$.Node.type* %.tmp1345, null
br i1 %.tmp1346, label %.if.true.1347, label %.if.false.1347
.if.true.1347:
%.tmp1348 = load %m261$.Node.type*, %m261$.Node.type** %c
%.tmp1349 = bitcast %m261$.Node.type* %.tmp1348 to i8*
call void(i8*) @free(i8* %.tmp1349)
%.tmp1350 = load %m261$.Node.type*, %m261$.Node.type** %parent
%.tmp1351 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1350, i32 0, i32 6
store %m261$.Node.type* null, %m261$.Node.type** %.tmp1351
ret void
br label %.if.end.1347
.if.false.1347:
br label %.if.end.1347
.if.end.1347:
br label %.for.start.1352
.for.start.1352:
%.tmp1353 = load %m261$.Node.type*, %m261$.Node.type** %c
%.tmp1354 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1353, i32 0, i32 7
%.tmp1355 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1354
%.tmp1356 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1355, i32 0, i32 7
%.tmp1357 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1356
%.tmp1358 = icmp ne %m261$.Node.type* %.tmp1357, null
br i1 %.tmp1358, label %.for.continue.1352, label %.for.end.1352
.for.continue.1352:
%.tmp1359 = load %m261$.Node.type*, %m261$.Node.type** %c
%.tmp1360 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1359, i32 0, i32 7
%.tmp1361 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1360
store %m261$.Node.type* %.tmp1361, %m261$.Node.type** %c
br label %.for.start.1352
.for.end.1352:
%.tmp1362 = load %m261$.Node.type*, %m261$.Node.type** %c
%.tmp1363 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1362, i32 0, i32 7
%.tmp1364 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1363
%.tmp1365 = bitcast %m261$.Node.type* %.tmp1364 to i8*
call void(i8*) @free(i8* %.tmp1365)
%.tmp1366 = load %m261$.Node.type*, %m261$.Node.type** %c
%.tmp1367 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1366, i32 0, i32 7
store %m261$.Node.type* null, %m261$.Node.type** %.tmp1367
ret void
}
%m261$.AstContext.type = type {%m262$.Token.type*,%m261$.Rule.type**}
define %m261$.Rule.type* @m261$_find_rule.m261$.Rule.typep.m261$.Rule.typepp.cp(%m261$.Rule.type** %.grammar.arg, i8* %.rule_name.arg) {
%grammar = alloca %m261$.Rule.type**
store %m261$.Rule.type** %.grammar.arg, %m261$.Rule.type*** %grammar
%rule_name = alloca i8*
store i8* %.rule_name.arg, i8** %rule_name
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1368
.for.start.1368:
br i1 1, label %.for.continue.1368, label %.for.end.1368
.for.continue.1368:
%.tmp1369 = load i32, i32* %i
%.tmp1370 = load %m261$.Rule.type**, %m261$.Rule.type*** %grammar
%.tmp1371 = getelementptr %m261$.Rule.type*, %m261$.Rule.type** %.tmp1370, i32 %.tmp1369
%.tmp1372 = load %m261$.Rule.type*, %m261$.Rule.type** %.tmp1371
%rule = alloca %m261$.Rule.type*
store %m261$.Rule.type* %.tmp1372, %m261$.Rule.type** %rule
%.tmp1373 = load %m261$.Rule.type*, %m261$.Rule.type** %rule
%.tmp1374 = getelementptr %m261$.Rule.type, %m261$.Rule.type* %.tmp1373, i32 0, i32 0
%.tmp1375 = load i8*, i8** %.tmp1374
%.tmp1376 = load i8*, i8** %rule_name
%.tmp1377 = call i32(i8*,i8*) @strcmp(i8* %.tmp1375, i8* %.tmp1376)
%.tmp1378 = icmp eq i32 %.tmp1377, 0
br i1 %.tmp1378, label %.if.true.1379, label %.if.false.1379
.if.true.1379:
%.tmp1380 = load %m261$.Rule.type*, %m261$.Rule.type** %rule
ret %m261$.Rule.type* %.tmp1380
br label %.if.end.1379
.if.false.1379:
br label %.if.end.1379
.if.end.1379:
%.tmp1381 = load i32, i32* %i
%.tmp1382 = add i32 %.tmp1381, 1
store i32 %.tmp1382, i32* %i
br label %.for.start.1368
.for.end.1368:
%.tmp1383 = bitcast ptr null to %m261$.Rule.type*
ret %m261$.Rule.type* %.tmp1383
}
%m261$.ParseResult.type = type {%m678$.Error.type*,%m261$.Node.type*}
@ParseResult_size = constant i32 16
define %m678$.Error.type* @m261$parse_query.m678$.Error.typep.m261$.AstContext.typep.m261$.Matcher.typep.m261$.Node.typep(%m261$.AstContext.type* %.c.arg, %m261$.Matcher.type* %.m.arg, %m261$.Node.type* %.base.arg) {
%c = alloca %m261$.AstContext.type*
store %m261$.AstContext.type* %.c.arg, %m261$.AstContext.type** %c
%m = alloca %m261$.Matcher.type*
store %m261$.Matcher.type* %.m.arg, %m261$.Matcher.type** %m
%base = alloca %m261$.Node.type*
store %m261$.Node.type* %.base.arg, %m261$.Node.type** %base
%child = alloca %m261$.Node.type*
%.tmp1384 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1385 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1384, i32 0, i32 0
%.tmp1386 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1385
%start_token = alloca %m262$.Token.type*
store %m262$.Token.type* %.tmp1386, %m262$.Token.type** %start_token
%new_children = alloca i32
store i32 0, i32* %new_children
%.tmp1387 = bitcast ptr null to %m678$.Error.type*
%err = alloca %m678$.Error.type*
store %m678$.Error.type* %.tmp1387, %m678$.Error.type** %err
%.tmp1389 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp1390 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp1389, i32 0, i32 0
%.tmp1391 = load %m261$.Query.type*, %m261$.Query.type** %.tmp1390
%q = alloca %m261$.Query.type*
store %m261$.Query.type* %.tmp1391, %m261$.Query.type** %q
br label %.for.start.1388
.for.start.1388:
%.tmp1392 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1393 = icmp ne %m261$.Query.type* %.tmp1392, null
%.tmp1394 = load %m678$.Error.type*, %m678$.Error.type** %err
%.tmp1395 = icmp eq %m678$.Error.type* %.tmp1394, null
%.tmp1396 = and i1 %.tmp1393, %.tmp1395
br i1 %.tmp1396, label %.for.continue.1388, label %.for.end.1388
.for.continue.1388:
%.tmp1397 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1398 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1397, i32 0, i32 0
%.tmp1399 = load i8, i8* %.tmp1398
%.tmp1400 = icmp eq i8 %.tmp1399, 118
br i1 %.tmp1400, label %.if.true.1401, label %.if.false.1401
.if.true.1401:
%.tmp1402 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1403 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1402, i32 0, i32 1
%.tmp1404 = load i8*, i8** %.tmp1403
%.tmp1405 = call i32(i8*) @strlen(i8* %.tmp1404)
%.tmp1406 = sub i32 %.tmp1405, 2
%qv_len = alloca i32
store i32 %.tmp1406, i32* %qv_len
%.tmp1407 = load i32, i32* %qv_len
%.tmp1408 = add i32 %.tmp1407, 1
%.tmp1409 = call i8*(i32) @malloc(i32 %.tmp1408)
%tmp_buff = alloca i8*
store i8* %.tmp1409, i8** %tmp_buff
%.tmp1410 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1411 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1410, i32 0, i32 1
%.tmp1412 = load i8*, i8** %.tmp1411
%.tmp1414 = getelementptr [8 x i8], [8 x i8]*@.str1413, i32 0, i32 0
%.tmp1415 = load i8*, i8** %tmp_buff
%.tmp1416 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp1412, i8* %.tmp1414, i8* %.tmp1415)
%.tmp1417 = load i8*, i8** %tmp_buff
%.tmp1418 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1419 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1418, i32 0, i32 0
%.tmp1420 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1419
%.tmp1421 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1420, i32 0, i32 1
%.tmp1422 = load i8*, i8** %.tmp1421
%.tmp1423 = load i32, i32* %qv_len
%.tmp1424 = call i32(i8*,i8*,i32) @strncmp(i8* %.tmp1417, i8* %.tmp1422, i32 %.tmp1423)
%.tmp1425 = icmp eq i32 %.tmp1424, 0
%.tmp1426 = load i32, i32* %qv_len
%.tmp1427 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1428 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1427, i32 0, i32 0
%.tmp1429 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1428
%.tmp1430 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1429, i32 0, i32 1
%.tmp1431 = load i8*, i8** %.tmp1430
%.tmp1432 = call i32(i8*) @strlen(i8* %.tmp1431)
%.tmp1433 = icmp eq i32 %.tmp1426, %.tmp1432
%.tmp1434 = and i1 %.tmp1425, %.tmp1433
br i1 %.tmp1434, label %.if.true.1435, label %.if.false.1435
.if.true.1435:
%.tmp1436 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1437 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1436, i32 0, i32 0
%.tmp1438 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1437
%.tmp1439 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1440 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1439, i32 0, i32 0
%.tmp1441 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1440
%.tmp1442 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1441, i32 0, i32 0
%.tmp1443 = load i8*, i8** %.tmp1442
%.tmp1444 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1445 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1444, i32 0, i32 0
%.tmp1446 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1445
%.tmp1447 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1446, i32 0, i32 1
%.tmp1448 = load i8*, i8** %.tmp1447
%.tmp1449 = call %m261$.Node.type*(%m262$.Token.type*,i8*,i8*) @m261$new_node.m261$.Node.typep.m262$.Token.typep.cp.cp(%m262$.Token.type* %.tmp1438, i8* %.tmp1443, i8* %.tmp1448)
store %m261$.Node.type* %.tmp1449, %m261$.Node.type** %child
%.tmp1450 = load %m261$.Node.type*, %m261$.Node.type** %base
%.tmp1451 = load %m261$.Node.type*, %m261$.Node.type** %child
call void(%m261$.Node.type*,%m261$.Node.type*) @m261$child_append.v.m261$.Node.typep.m261$.Node.typep(%m261$.Node.type* %.tmp1450, %m261$.Node.type* %.tmp1451)
%.tmp1452 = load i32, i32* %new_children
%.tmp1453 = add i32 %.tmp1452, 1
store i32 %.tmp1453, i32* %new_children
%.tmp1454 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1455 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1454, i32 0, i32 0
%.tmp1456 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1457 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1456, i32 0, i32 0
%.tmp1458 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1457
%.tmp1459 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1458, i32 0, i32 5
%.tmp1460 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1459
store %m262$.Token.type* %.tmp1460, %m262$.Token.type** %.tmp1455
br label %.if.end.1435
.if.false.1435:
%.tmp1461 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1462 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1461, i32 0, i32 0
%.tmp1463 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1462
%.tmp1464 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1463, i32 0, i32 1
%.tmp1465 = load i8*, i8** %.tmp1464
%token_value = alloca i8*
store i8* %.tmp1465, i8** %token_value
%.tmp1466 = load i8*, i8** %token_value
%.tmp1467 = icmp eq i8* %.tmp1466, null
br i1 %.tmp1467, label %.if.true.1468, label %.if.false.1468
.if.true.1468:
%.tmp1470 = getelementptr [7 x i8], [7 x i8]*@.str1469, i32 0, i32 0
store i8* %.tmp1470, i8** %token_value
br label %.if.end.1468
.if.false.1468:
br label %.if.end.1468
.if.end.1468:
%.tmp1472 = getelementptr [15 x i8], [15 x i8]*@.str1471, i32 0, i32 0
%err_fmt = alloca i8*
store i8* %.tmp1472, i8** %err_fmt
%.tmp1474 = getelementptr [31 x i8], [31 x i8]*@.str1473, i32 0, i32 0
%err_msg = alloca i8*
store i8* %.tmp1474, i8** %err_msg
%.tmp1475 = load i8*, i8** %err_msg
%.tmp1476 = call i32(i8*) @strlen(i8* %.tmp1475)
%.tmp1477 = load i8*, i8** %tmp_buff
%.tmp1478 = call i32(i8*) @strlen(i8* %.tmp1477)
%.tmp1479 = add i32 %.tmp1476, %.tmp1478
%.tmp1480 = load i8*, i8** %token_value
%.tmp1481 = call i32(i8*) @strlen(i8* %.tmp1480)
%.tmp1482 = add i32 %.tmp1479, %.tmp1481
%.tmp1483 = load i8*, i8** %err_fmt
%.tmp1484 = call i32(i8*) @strlen(i8* %.tmp1483)
%.tmp1485 = add i32 %.tmp1482, %.tmp1484
%.tmp1486 = mul i32 3, 2
%.tmp1487 = sub i32 %.tmp1485, %.tmp1486
%.tmp1488 = add i32 %.tmp1487, 1
%err_len = alloca i32
store i32 %.tmp1488, i32* %err_len
%.tmp1489 = load i32, i32* %err_len
%.tmp1490 = call i8*(i32) @malloc(i32 %.tmp1489)
%err_buf = alloca i8*
store i8* %.tmp1490, i8** %err_buf
%.tmp1491 = load i8*, i8** %err_buf
%.tmp1492 = load i32, i32* %err_len
%.tmp1493 = load i8*, i8** %err_fmt
%.tmp1494 = load i8*, i8** %err_msg
%.tmp1495 = load i8*, i8** %tmp_buff
%.tmp1496 = load i8*, i8** %token_value
%.tmp1497 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1491, i32 %.tmp1492, i8* %.tmp1493, i8* %.tmp1494, i8* %.tmp1495, i8* %.tmp1496)
%.tmp1498 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1499 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1498, i32 0, i32 0
%.tmp1500 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1499
%.tmp1501 = load i8*, i8** %err_buf
%.tmp1502 = call %m678$.Error.type*(%m262$.Token.type*,i8*) @m678$from.m678$.Error.typep.m262$.Token.typep.cp(%m262$.Token.type* %.tmp1500, i8* %.tmp1501)
store %m678$.Error.type* %.tmp1502, %m678$.Error.type** %err
br label %.if.end.1435
.if.end.1435:
%.tmp1503 = load i8*, i8** %tmp_buff
call void(i8*) @free(i8* %.tmp1503)
br label %.if.end.1401
.if.false.1401:
%.tmp1504 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1505 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1504, i32 0, i32 0
%.tmp1506 = load i8, i8* %.tmp1505
%.tmp1507 = icmp eq i8 %.tmp1506, 116
br i1 %.tmp1507, label %.if.true.1508, label %.if.false.1508
.if.true.1508:
%.tmp1509 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1510 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1509, i32 0, i32 1
%.tmp1511 = load i8*, i8** %.tmp1510
%.tmp1512 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1513 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1512, i32 0, i32 0
%.tmp1514 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1513
%.tmp1515 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1514, i32 0, i32 0
%.tmp1516 = load i8*, i8** %.tmp1515
%.tmp1517 = call i32(i8*,i8*) @strcmp(i8* %.tmp1511, i8* %.tmp1516)
%.tmp1518 = icmp eq i32 %.tmp1517, 0
br i1 %.tmp1518, label %.if.true.1519, label %.if.false.1519
.if.true.1519:
%.tmp1520 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1521 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1520, i32 0, i32 0
%.tmp1522 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1521
%.tmp1523 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1524 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1523, i32 0, i32 0
%.tmp1525 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1524
%.tmp1526 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1525, i32 0, i32 0
%.tmp1527 = load i8*, i8** %.tmp1526
%.tmp1528 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1529 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1528, i32 0, i32 0
%.tmp1530 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1529
%.tmp1531 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1530, i32 0, i32 1
%.tmp1532 = load i8*, i8** %.tmp1531
%.tmp1533 = call %m261$.Node.type*(%m262$.Token.type*,i8*,i8*) @m261$new_node.m261$.Node.typep.m262$.Token.typep.cp.cp(%m262$.Token.type* %.tmp1522, i8* %.tmp1527, i8* %.tmp1532)
store %m261$.Node.type* %.tmp1533, %m261$.Node.type** %child
%.tmp1534 = load %m261$.Node.type*, %m261$.Node.type** %base
%.tmp1535 = load %m261$.Node.type*, %m261$.Node.type** %child
call void(%m261$.Node.type*,%m261$.Node.type*) @m261$child_append.v.m261$.Node.typep.m261$.Node.typep(%m261$.Node.type* %.tmp1534, %m261$.Node.type* %.tmp1535)
%.tmp1536 = load i32, i32* %new_children
%.tmp1537 = add i32 %.tmp1536, 1
store i32 %.tmp1537, i32* %new_children
%.tmp1538 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1539 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1538, i32 0, i32 0
%.tmp1540 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1541 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1540, i32 0, i32 0
%.tmp1542 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1541
%.tmp1543 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1542, i32 0, i32 5
%.tmp1544 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1543
store %m262$.Token.type* %.tmp1544, %m262$.Token.type** %.tmp1539
br label %.if.end.1519
.if.false.1519:
%.tmp1546 = getelementptr [13 x i8], [13 x i8]*@.str1545, i32 0, i32 0
%err_fmt_t = alloca i8*
store i8* %.tmp1546, i8** %err_fmt_t
%.tmp1548 = getelementptr [30 x i8], [30 x i8]*@.str1547, i32 0, i32 0
%err_msg_t = alloca i8*
store i8* %.tmp1548, i8** %err_msg_t
%.tmp1549 = load i8*, i8** %err_fmt_t
%.tmp1550 = call i32(i8*) @strlen(i8* %.tmp1549)
%.tmp1551 = load i8*, i8** %err_msg_t
%.tmp1552 = call i32(i8*) @strlen(i8* %.tmp1551)
%.tmp1553 = add i32 %.tmp1550, %.tmp1552
%.tmp1554 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1555 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1554, i32 0, i32 1
%.tmp1556 = load i8*, i8** %.tmp1555
%.tmp1557 = call i32(i8*) @strlen(i8* %.tmp1556)
%.tmp1558 = add i32 %.tmp1553, %.tmp1557
%.tmp1559 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1560 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1559, i32 0, i32 0
%.tmp1561 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1560
%.tmp1562 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1561, i32 0, i32 0
%.tmp1563 = load i8*, i8** %.tmp1562
%.tmp1564 = call i32(i8*) @strlen(i8* %.tmp1563)
%.tmp1565 = add i32 %.tmp1558, %.tmp1564
%err_len_t = alloca i32
store i32 %.tmp1565, i32* %err_len_t
%.tmp1566 = load i32, i32* %err_len_t
%.tmp1567 = call i8*(i32) @malloc(i32 %.tmp1566)
%err_buf_t = alloca i8*
store i8* %.tmp1567, i8** %err_buf_t
%.tmp1568 = load i8*, i8** %err_buf_t
%.tmp1569 = load i32, i32* %err_len_t
%.tmp1570 = load i8*, i8** %err_fmt_t
%.tmp1571 = load i8*, i8** %err_msg_t
%.tmp1572 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1573 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1572, i32 0, i32 1
%.tmp1574 = load i8*, i8** %.tmp1573
%.tmp1575 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1576 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1575, i32 0, i32 0
%.tmp1577 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1576
%.tmp1578 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1577, i32 0, i32 0
%.tmp1579 = load i8*, i8** %.tmp1578
%.tmp1580 = call i32(i8*,i32,i8*,...) @snprintf(i8* %.tmp1568, i32 %.tmp1569, i8* %.tmp1570, i8* %.tmp1571, i8* %.tmp1574, i8* %.tmp1579)
%.tmp1581 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1582 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1581, i32 0, i32 0
%.tmp1583 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1582
%.tmp1584 = load i8*, i8** %err_buf_t
%.tmp1585 = call %m678$.Error.type*(%m262$.Token.type*,i8*) @m678$from.m678$.Error.typep.m262$.Token.typep.cp(%m262$.Token.type* %.tmp1583, i8* %.tmp1584)
store %m678$.Error.type* %.tmp1585, %m678$.Error.type** %err
br label %.if.end.1519
.if.end.1519:
br label %.if.end.1508
.if.false.1508:
%.tmp1586 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1587 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1586, i32 0, i32 0
%.tmp1588 = load i8, i8* %.tmp1587
%.tmp1589 = icmp eq i8 %.tmp1588, 97
br i1 %.tmp1589, label %.if.true.1590, label %.if.false.1590
.if.true.1590:
%.tmp1591 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1592 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1591, i32 0, i32 1
%.tmp1593 = load %m261$.Rule.type**, %m261$.Rule.type*** %.tmp1592
%.tmp1594 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1595 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1594, i32 0, i32 1
%.tmp1596 = load i8*, i8** %.tmp1595
%.tmp1597 = call %m261$.Rule.type*(%m261$.Rule.type**,i8*) @m261$_find_rule.m261$.Rule.typep.m261$.Rule.typepp.cp(%m261$.Rule.type** %.tmp1593, i8* %.tmp1596)
%alias_rule = alloca %m261$.Rule.type*
store %m261$.Rule.type* %.tmp1597, %m261$.Rule.type** %alias_rule
%.tmp1598 = load %m261$.Rule.type*, %m261$.Rule.type** %alias_rule
%.tmp1599 = icmp eq %m261$.Rule.type* %.tmp1598, null
br i1 %.tmp1599, label %.if.true.1600, label %.if.false.1600
.if.true.1600:
%.tmp1601 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1602 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1601, i32 0, i32 0
%.tmp1603 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1602
%.tmp1605 = getelementptr [30 x i8], [30 x i8]*@.str1604, i32 0, i32 0
%.tmp1606 = call %m678$.Error.type*(%m262$.Token.type*,i8*) @m678$from.m678$.Error.typep.m262$.Token.typep.cp(%m262$.Token.type* %.tmp1603, i8* %.tmp1605)
store %m678$.Error.type* %.tmp1606, %m678$.Error.type** %err
br label %.if.end.1600
.if.false.1600:
%.tmp1607 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1608 = load %m261$.Rule.type*, %m261$.Rule.type** %alias_rule
%.tmp1609 = call %m261$.ParseResult.type*(%m261$.AstContext.type*,%m261$.Rule.type*) @m261$parse_to_ast.m261$.ParseResult.typep.m261$.AstContext.typep.m261$.Rule.typep(%m261$.AstContext.type* %.tmp1607, %m261$.Rule.type* %.tmp1608)
%parse_result = alloca %m261$.ParseResult.type*
store %m261$.ParseResult.type* %.tmp1609, %m261$.ParseResult.type** %parse_result
%.tmp1610 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %parse_result
%.tmp1611 = getelementptr %m261$.ParseResult.type, %m261$.ParseResult.type* %.tmp1610, i32 0, i32 0
%.tmp1612 = load %m678$.Error.type*, %m678$.Error.type** %.tmp1611
%.tmp1613 = icmp ne %m678$.Error.type* %.tmp1612, null
br i1 %.tmp1613, label %.if.true.1614, label %.if.false.1614
.if.true.1614:
%.tmp1615 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %parse_result
%.tmp1616 = getelementptr %m261$.ParseResult.type, %m261$.ParseResult.type* %.tmp1615, i32 0, i32 0
%.tmp1617 = load %m678$.Error.type*, %m678$.Error.type** %.tmp1616
store %m678$.Error.type* %.tmp1617, %m678$.Error.type** %err
br label %.if.end.1614
.if.false.1614:
%.tmp1618 = load %m261$.Node.type*, %m261$.Node.type** %base
%.tmp1619 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %parse_result
%.tmp1620 = getelementptr %m261$.ParseResult.type, %m261$.ParseResult.type* %.tmp1619, i32 0, i32 1
%.tmp1621 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1620
call void(%m261$.Node.type*,%m261$.Node.type*) @m261$child_append.v.m261$.Node.typep.m261$.Node.typep(%m261$.Node.type* %.tmp1618, %m261$.Node.type* %.tmp1621)
%.tmp1622 = load i32, i32* %new_children
%.tmp1623 = add i32 %.tmp1622, 1
store i32 %.tmp1623, i32* %new_children
br label %.if.end.1614
.if.end.1614:
%.tmp1624 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %parse_result
%.tmp1625 = bitcast %m261$.ParseResult.type* %.tmp1624 to i8*
call void(i8*) @free(i8* %.tmp1625)
br label %.if.end.1600
.if.end.1600:
br label %.if.end.1590
.if.false.1590:
%.tmp1627 = getelementptr [41 x i8], [41 x i8]*@.str1626, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp1627)
br label %.if.end.1590
.if.end.1590:
br label %.if.end.1508
.if.end.1508:
br label %.if.end.1401
.if.end.1401:
%.tmp1628 = load %m261$.Query.type*, %m261$.Query.type** %q
%.tmp1629 = getelementptr %m261$.Query.type, %m261$.Query.type* %.tmp1628, i32 0, i32 2
%.tmp1630 = load %m261$.Query.type*, %m261$.Query.type** %.tmp1629
store %m261$.Query.type* %.tmp1630, %m261$.Query.type** %q
br label %.for.start.1388
.for.end.1388:
%.tmp1631 = load %m678$.Error.type*, %m678$.Error.type** %err
%.tmp1632 = icmp ne %m678$.Error.type* %.tmp1631, null
br i1 %.tmp1632, label %.if.true.1633, label %.if.false.1633
.if.true.1633:
%.tmp1634 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1635 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1634, i32 0, i32 0
%.tmp1636 = load %m262$.Token.type*, %m262$.Token.type** %start_token
store %m262$.Token.type* %.tmp1636, %m262$.Token.type** %.tmp1635
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1637
.for.start.1637:
%.tmp1638 = load i32, i32* %i
%.tmp1639 = load i32, i32* %new_children
%.tmp1640 = icmp slt i32 %.tmp1638, %.tmp1639
br i1 %.tmp1640, label %.for.continue.1637, label %.for.end.1637
.for.continue.1637:
%.tmp1641 = load %m261$.Node.type*, %m261$.Node.type** %base
call void(%m261$.Node.type*) @m261$child_pop.v.m261$.Node.typep(%m261$.Node.type* %.tmp1641)
%.tmp1642 = load i32, i32* %i
%.tmp1643 = add i32 %.tmp1642, 1
store i32 %.tmp1643, i32* %i
br label %.for.start.1637
.for.end.1637:
br label %.if.end.1633
.if.false.1633:
br label %.if.end.1633
.if.end.1633:
%.tmp1644 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp1645 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp1644, i32 0, i32 2
%.tmp1646 = load %m261$.Matcher.type*, %m261$.Matcher.type** %.tmp1645
%.tmp1647 = icmp ne %m261$.Matcher.type* %.tmp1646, null
%.tmp1648 = load %m678$.Error.type*, %m678$.Error.type** %err
%.tmp1649 = icmp ne %m678$.Error.type* %.tmp1648, null
%.tmp1650 = and i1 %.tmp1647, %.tmp1649
br i1 %.tmp1650, label %.if.true.1651, label %.if.false.1651
.if.true.1651:
%.tmp1652 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1653 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp1654 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp1653, i32 0, i32 2
%.tmp1655 = load %m261$.Matcher.type*, %m261$.Matcher.type** %.tmp1654
%.tmp1656 = load %m261$.Node.type*, %m261$.Node.type** %base
%.tmp1657 = call %m678$.Error.type*(%m261$.AstContext.type*,%m261$.Matcher.type*,%m261$.Node.type*) @m261$parse_query.m678$.Error.typep.m261$.AstContext.typep.m261$.Matcher.typep.m261$.Node.typep(%m261$.AstContext.type* %.tmp1652, %m261$.Matcher.type* %.tmp1655, %m261$.Node.type* %.tmp1656)
%new_err = alloca %m678$.Error.type*
store %m678$.Error.type* %.tmp1657, %m678$.Error.type** %new_err
%.tmp1658 = load %m678$.Error.type*, %m678$.Error.type** %new_err
%.tmp1659 = icmp eq %m678$.Error.type* %.tmp1658, null
br i1 %.tmp1659, label %.if.true.1660, label %.if.false.1660
.if.true.1660:
store %m678$.Error.type* null, %m678$.Error.type** %err
br label %.if.end.1660
.if.false.1660:
%.tmp1661 = load %m678$.Error.type*, %m678$.Error.type** %new_err
%.tmp1662 = bitcast %m678$.Error.type* %.tmp1661 to i8*
call void(i8*) @free(i8* %.tmp1662)
br label %.if.end.1660
.if.end.1660:
br label %.if.end.1651
.if.false.1651:
br label %.if.end.1651
.if.end.1651:
%.tmp1663 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp1664 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp1663, i32 0, i32 1
%.tmp1665 = load i8, i8* %.tmp1664
%.tmp1666 = icmp eq i8 %.tmp1665, 49
br i1 %.tmp1666, label %.if.true.1667, label %.if.false.1667
.if.true.1667:
br label %.if.end.1667
.if.false.1667:
%.tmp1668 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp1669 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp1668, i32 0, i32 1
%.tmp1670 = load i8, i8* %.tmp1669
%.tmp1671 = icmp eq i8 %.tmp1670, 43
%.tmp1672 = load %m678$.Error.type*, %m678$.Error.type** %err
%.tmp1673 = icmp eq %m678$.Error.type* %.tmp1672, null
%.tmp1674 = and i1 %.tmp1671, %.tmp1673
br i1 %.tmp1674, label %.if.true.1675, label %.if.false.1675
.if.true.1675:
%.tmp1676 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1677 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp1678 = load %m261$.Node.type*, %m261$.Node.type** %base
%.tmp1679 = call %m678$.Error.type*(%m261$.AstContext.type*,%m261$.Matcher.type*,%m261$.Node.type*) @m261$parse_query.m678$.Error.typep.m261$.AstContext.typep.m261$.Matcher.typep.m261$.Node.typep(%m261$.AstContext.type* %.tmp1676, %m261$.Matcher.type* %.tmp1677, %m261$.Node.type* %.tmp1678)
store %m678$.Error.type* %.tmp1679, %m678$.Error.type** %err
%.tmp1680 = load %m678$.Error.type*, %m678$.Error.type** %err
%.tmp1681 = icmp ne %m678$.Error.type* %.tmp1680, null
br i1 %.tmp1681, label %.if.true.1682, label %.if.false.1682
.if.true.1682:
%.tmp1683 = load %m678$.Error.type*, %m678$.Error.type** %err
%.tmp1684 = bitcast %m678$.Error.type* %.tmp1683 to i8*
call void(i8*) @free(i8* %.tmp1684)
store %m678$.Error.type* null, %m678$.Error.type** %err
br label %.if.end.1682
.if.false.1682:
%.tmp1685 = bitcast ptr null to %m678$.Error.type*
ret %m678$.Error.type* %.tmp1685
br label %.if.end.1682
.if.end.1682:
br label %.if.end.1675
.if.false.1675:
%.tmp1686 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp1687 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp1686, i32 0, i32 1
%.tmp1688 = load i8, i8* %.tmp1687
%.tmp1689 = icmp eq i8 %.tmp1688, 63
%.tmp1690 = load %m678$.Error.type*, %m678$.Error.type** %err
%.tmp1691 = icmp ne %m678$.Error.type* %.tmp1690, null
%.tmp1692 = and i1 %.tmp1689, %.tmp1691
br i1 %.tmp1692, label %.if.true.1693, label %.if.false.1693
.if.true.1693:
%.tmp1694 = load %m678$.Error.type*, %m678$.Error.type** %err
%.tmp1695 = bitcast %m678$.Error.type* %.tmp1694 to i8*
call void(i8*) @free(i8* %.tmp1695)
store %m678$.Error.type* null, %m678$.Error.type** %err
br label %.if.end.1693
.if.false.1693:
%.tmp1696 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp1697 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp1696, i32 0, i32 1
%.tmp1698 = load i8, i8* %.tmp1697
%.tmp1699 = icmp eq i8 %.tmp1698, 42
br i1 %.tmp1699, label %.if.true.1700, label %.if.false.1700
.if.true.1700:
%.tmp1701 = load %m678$.Error.type*, %m678$.Error.type** %err
%.tmp1702 = icmp ne %m678$.Error.type* %.tmp1701, null
br i1 %.tmp1702, label %.if.true.1703, label %.if.false.1703
.if.true.1703:
%.tmp1704 = load %m678$.Error.type*, %m678$.Error.type** %err
%.tmp1705 = bitcast %m678$.Error.type* %.tmp1704 to i8*
call void(i8*) @free(i8* %.tmp1705)
store %m678$.Error.type* null, %m678$.Error.type** %err
br label %.if.end.1703
.if.false.1703:
%.tmp1706 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1707 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp1708 = load %m261$.Node.type*, %m261$.Node.type** %base
%.tmp1709 = call %m678$.Error.type*(%m261$.AstContext.type*,%m261$.Matcher.type*,%m261$.Node.type*) @m261$parse_query.m678$.Error.typep.m261$.AstContext.typep.m261$.Matcher.typep.m261$.Node.typep(%m261$.AstContext.type* %.tmp1706, %m261$.Matcher.type* %.tmp1707, %m261$.Node.type* %.tmp1708)
ret %m678$.Error.type* %.tmp1709
br label %.if.end.1703
.if.end.1703:
br label %.if.end.1700
.if.false.1700:
br label %.if.end.1700
.if.end.1700:
br label %.if.end.1693
.if.end.1693:
br label %.if.end.1675
.if.end.1675:
br label %.if.end.1667
.if.end.1667:
%.tmp1710 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp1711 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp1710, i32 0, i32 3
%.tmp1712 = load %m261$.Matcher.type*, %m261$.Matcher.type** %.tmp1711
%.tmp1713 = icmp ne %m261$.Matcher.type* %.tmp1712, null
%.tmp1714 = load %m678$.Error.type*, %m678$.Error.type** %err
%.tmp1715 = icmp eq %m678$.Error.type* %.tmp1714, null
%.tmp1716 = and i1 %.tmp1713, %.tmp1715
br i1 %.tmp1716, label %.if.true.1717, label %.if.false.1717
.if.true.1717:
%.tmp1718 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1719 = load %m261$.Matcher.type*, %m261$.Matcher.type** %m
%.tmp1720 = getelementptr %m261$.Matcher.type, %m261$.Matcher.type* %.tmp1719, i32 0, i32 3
%.tmp1721 = load %m261$.Matcher.type*, %m261$.Matcher.type** %.tmp1720
%.tmp1722 = load %m261$.Node.type*, %m261$.Node.type** %base
%.tmp1723 = call %m678$.Error.type*(%m261$.AstContext.type*,%m261$.Matcher.type*,%m261$.Node.type*) @m261$parse_query.m678$.Error.typep.m261$.AstContext.typep.m261$.Matcher.typep.m261$.Node.typep(%m261$.AstContext.type* %.tmp1718, %m261$.Matcher.type* %.tmp1721, %m261$.Node.type* %.tmp1722)
store %m678$.Error.type* %.tmp1723, %m678$.Error.type** %err
br label %.if.end.1717
.if.false.1717:
br label %.if.end.1717
.if.end.1717:
%.tmp1724 = load %m678$.Error.type*, %m678$.Error.type** %err
%.tmp1725 = bitcast %m678$.Error.type* %.tmp1724 to %m678$.Error.type*
ret %m678$.Error.type* %.tmp1725
}
define %m261$.ParseResult.type* @m261$parse_to_ast.m261$.ParseResult.typep.m261$.AstContext.typep.m261$.Rule.typep(%m261$.AstContext.type* %.c.arg, %m261$.Rule.type* %.rule.arg) {
%c = alloca %m261$.AstContext.type*
store %m261$.AstContext.type* %.c.arg, %m261$.AstContext.type** %c
%rule = alloca %m261$.Rule.type*
store %m261$.Rule.type* %.rule.arg, %m261$.Rule.type** %rule
%.tmp1726 = load i32, i32* @ParseResult_size
%.tmp1727 = call i8*(i32) @malloc(i32 %.tmp1726)
%.tmp1728 = bitcast i8* %.tmp1727 to %m261$.ParseResult.type*
%res = alloca %m261$.ParseResult.type*
store %m261$.ParseResult.type* %.tmp1728, %m261$.ParseResult.type** %res
%.tmp1729 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %res
%.tmp1730 = getelementptr %m261$.ParseResult.type, %m261$.ParseResult.type* %.tmp1729, i32 0, i32 0
store %m678$.Error.type* null, %m678$.Error.type** %.tmp1730
%.tmp1731 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %res
%.tmp1732 = getelementptr %m261$.ParseResult.type, %m261$.ParseResult.type* %.tmp1731, i32 0, i32 1
%.tmp1733 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1734 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1733, i32 0, i32 0
%.tmp1735 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1734
%.tmp1736 = load %m261$.Rule.type*, %m261$.Rule.type** %rule
%.tmp1737 = getelementptr %m261$.Rule.type, %m261$.Rule.type* %.tmp1736, i32 0, i32 0
%.tmp1738 = load i8*, i8** %.tmp1737
%.tmp1739 = bitcast ptr null to i8*
%.tmp1740 = call %m261$.Node.type*(%m262$.Token.type*,i8*,i8*) @m261$new_node.m261$.Node.typep.m262$.Token.typep.cp.cp(%m262$.Token.type* %.tmp1735, i8* %.tmp1738, i8* %.tmp1739)
store %m261$.Node.type* %.tmp1740, %m261$.Node.type** %.tmp1732
%.tmp1741 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1742 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %.tmp1741, i32 0, i32 0
%.tmp1743 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1742
%start_match = alloca %m262$.Token.type*
store %m262$.Token.type* %.tmp1743, %m262$.Token.type** %start_match
%.tmp1744 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %res
%.tmp1745 = getelementptr %m261$.ParseResult.type, %m261$.ParseResult.type* %.tmp1744, i32 0, i32 0
%.tmp1746 = load %m261$.AstContext.type*, %m261$.AstContext.type** %c
%.tmp1747 = load %m261$.Rule.type*, %m261$.Rule.type** %rule
%.tmp1748 = getelementptr %m261$.Rule.type, %m261$.Rule.type* %.tmp1747, i32 0, i32 1
%.tmp1749 = load %m261$.Matcher.type*, %m261$.Matcher.type** %.tmp1748
%.tmp1750 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %res
%.tmp1751 = getelementptr %m261$.ParseResult.type, %m261$.ParseResult.type* %.tmp1750, i32 0, i32 1
%.tmp1752 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1751
%.tmp1753 = call %m678$.Error.type*(%m261$.AstContext.type*,%m261$.Matcher.type*,%m261$.Node.type*) @m261$parse_query.m678$.Error.typep.m261$.AstContext.typep.m261$.Matcher.typep.m261$.Node.typep(%m261$.AstContext.type* %.tmp1746, %m261$.Matcher.type* %.tmp1749, %m261$.Node.type* %.tmp1752)
store %m678$.Error.type* %.tmp1753, %m678$.Error.type** %.tmp1745
%.tmp1754 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %res
ret %m261$.ParseResult.type* %.tmp1754
}
define %m261$.ParseResult.type* @m261$ast.m261$.ParseResult.typep.m261$.Rule.typepp.cp.m262$.Token.typep(%m261$.Rule.type** %.grammar.arg, i8* %.start.arg, %m262$.Token.type* %.tokens.arg) {
%grammar = alloca %m261$.Rule.type**
store %m261$.Rule.type** %.grammar.arg, %m261$.Rule.type*** %grammar
%start = alloca i8*
store i8* %.start.arg, i8** %start
%tokens = alloca %m262$.Token.type*
store %m262$.Token.type* %.tokens.arg, %m262$.Token.type** %tokens
%.tmp1755 = load %m261$.Rule.type**, %m261$.Rule.type*** %grammar
%.tmp1756 = load i8*, i8** %start
%.tmp1757 = call %m261$.Rule.type*(%m261$.Rule.type**,i8*) @m261$_find_rule.m261$.Rule.typep.m261$.Rule.typepp.cp(%m261$.Rule.type** %.tmp1755, i8* %.tmp1756)
%start_matcher = alloca %m261$.Rule.type*
store %m261$.Rule.type* %.tmp1757, %m261$.Rule.type** %start_matcher
%.tmp1758 = load %m261$.Rule.type*, %m261$.Rule.type** %start_matcher
%.tmp1759 = icmp ne %m261$.Rule.type* %.tmp1758, null
%.tmp1761 = getelementptr [44 x i8], [44 x i8]*@.str1760, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp1759, i8* %.tmp1761)
%c = alloca %m261$.AstContext.type
%.tmp1762 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %c, i32 0, i32 0
%.tmp1763 = load %m262$.Token.type*, %m262$.Token.type** %tokens
store %m262$.Token.type* %.tmp1763, %m262$.Token.type** %.tmp1762
%.tmp1764 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %c, i32 0, i32 1
%.tmp1765 = load %m261$.Rule.type**, %m261$.Rule.type*** %grammar
store %m261$.Rule.type** %.tmp1765, %m261$.Rule.type*** %.tmp1764
%.tmp1766 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %c, i32 0
%.tmp1767 = load %m261$.Rule.type*, %m261$.Rule.type** %start_matcher
%.tmp1768 = call %m261$.ParseResult.type*(%m261$.AstContext.type*,%m261$.Rule.type*) @m261$parse_to_ast.m261$.ParseResult.typep.m261$.AstContext.typep.m261$.Rule.typep(%m261$.AstContext.type* %.tmp1766, %m261$.Rule.type* %.tmp1767)
%res = alloca %m261$.ParseResult.type*
store %m261$.ParseResult.type* %.tmp1768, %m261$.ParseResult.type** %res
%.tmp1769 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %c, i32 0, i32 0
%.tmp1770 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1769
%.tmp1771 = getelementptr %m262$.Token.type, %m262$.Token.type* %.tmp1770, i32 0, i32 0
%.tmp1772 = load i8*, i8** %.tmp1771
%.tmp1774 = getelementptr [4 x i8], [4 x i8]*@.str1773, i32 0, i32 0
%.tmp1775 = call i32(i8*,i8*) @strcmp(i8* %.tmp1772, i8* %.tmp1774)
%.tmp1776 = icmp ne i32 %.tmp1775, 0
%.tmp1777 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %res
%.tmp1778 = getelementptr %m261$.ParseResult.type, %m261$.ParseResult.type* %.tmp1777, i32 0, i32 0
%.tmp1779 = load %m678$.Error.type*, %m678$.Error.type** %.tmp1778
%.tmp1780 = icmp eq %m678$.Error.type* %.tmp1779, null
%.tmp1781 = and i1 %.tmp1776, %.tmp1780
br i1 %.tmp1781, label %.if.true.1782, label %.if.false.1782
.if.true.1782:
%.tmp1783 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %res
%.tmp1784 = getelementptr %m261$.ParseResult.type, %m261$.ParseResult.type* %.tmp1783, i32 0, i32 0
%.tmp1785 = getelementptr %m261$.AstContext.type, %m261$.AstContext.type* %c, i32 0, i32 0
%.tmp1786 = load %m262$.Token.type*, %m262$.Token.type** %.tmp1785
%.tmp1788 = getelementptr [26 x i8], [26 x i8]*@.str1787, i32 0, i32 0
%.tmp1789 = call %m678$.Error.type*(%m262$.Token.type*,i8*) @m678$from.m678$.Error.typep.m262$.Token.typep.cp(%m262$.Token.type* %.tmp1786, i8* %.tmp1788)
store %m678$.Error.type* %.tmp1789, %m678$.Error.type** %.tmp1784
br label %.if.end.1782
.if.false.1782:
br label %.if.end.1782
.if.end.1782:
%.tmp1790 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %res
ret %m261$.ParseResult.type* %.tmp1790
}
@.str735 = constant [14 x i8] c"{\0A\22querys\22: [\00"
@.str749 = constant [30 x i8] c"\0A{\22type\22: \22%c\22, \22value\22: %s},\00"
@.str758 = constant [32 x i8] c"\0A{\22type\22: \22%c\22, \22value\22: \22%s\22},\00"
@.str770 = constant [14 x i8] c"],\0A\22next\22: [\0A\00"
@.str781 = constant [13 x i8] c"],\0A\22alt\22: [\0A\00"
@.str792 = constant [5 x i8] c"]\0A}\0A\00"
@.str827 = constant [2 x i8] c"(\00"
@.str846 = constant [2 x i8] c"|\00"
@.str865 = constant [2 x i8] c")\00"
@.str874 = constant [4 x i8] c"EOF\00"
@.str891 = constant [2 x i8] c"|\00"
@.str900 = constant [2 x i8] c")\00"
@.str906 = constant [48 x i8] c"[%d:%d] malformed grammar, expected | got '%s'\0A\00"
@.str929 = constant [2 x i8] c"|\00"
@.str946 = constant [2 x i8] c")\00"
@.str952 = constant [22 x i8] c"open brace not closed\00"
@.str966 = constant [2 x i8] c"+\00"
@.str985 = constant [2 x i8] c"*\00"
@.str1004 = constant [2 x i8] c"?\00"
@.str1025 = constant [2 x i8] c"(\00"
@.str1034 = constant [5 x i8] c"WORD\00"
@.str1053 = constant [5 x i8] c"WORD\00"
@.str1060 = constant [7 x i8] c"STRING\00"
@.str1103 = constant [7 x i8] c"STRING\00"
@.str1128 = constant [17 x i8] c"rule name: '%s'\0A\00"
@.str1137 = constant [50 x i8] c"Some characters are not allowed in this rule name\00"
@.str1168 = constant [5 x i8] c"WORD\00"
@.str1173 = constant [37 x i8] c"Identifier: {type: %s, value: '%s'}\0A\00"
@.str1187 = constant [31 x i8] c"rule identifier must be a WORD\00"
@.str1201 = constant [2 x i8] c":\00"
@.str1213 = constant [27 x i8] c"expected : after rule name\00"
@.str1250 = constant [4 x i8] c"EOF\00"
@.str1265 = constant [2 x i8] c"\0A\00"
@.str1413 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str1469 = constant [7 x i8] c"(null)\00"
@.str1471 = constant [15 x i8] c"%s: %s != \22%s\22\00"
@.str1473 = constant [31 x i8] c"unable to match token by value\00"
@.str1545 = constant [13 x i8] c"%s: %s != %s\00"
@.str1547 = constant [30 x i8] c"unable to match token by type\00"
@.str1604 = constant [30 x i8] c"unable to retrieve alias rule\00"
@.str1626 = constant [41 x i8] c"parser.bn: query matcher not implemented\00"
@.str1760 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str1773 = constant [4 x i8] c"EOF\00"
@.str1787 = constant [26 x i8] c"syntax parsing ended here\00"
define i8* @m1792$node_to_string.cp.m261$.Node.typep(%m261$.Node.type* %.n.arg) {
%n = alloca %m261$.Node.type*
store %m261$.Node.type* %.n.arg, %m261$.Node.type** %n
%.tmp1793 = call %m0$.File.type*() @tmpfile()
%tmp = alloca %m0$.File.type*
store %m0$.File.type* %.tmp1793, %m0$.File.type** %tmp
%.tmp1794 = load %m261$.Node.type*, %m261$.Node.type** %n
%.tmp1795 = load %m0$.File.type*, %m0$.File.type** %tmp
call void(%m261$.Node.type*,%m0$.File.type*,i32) @m1792$_node_to_string.v.m261$.Node.typep.m0$.File.typep.i(%m261$.Node.type* %.tmp1794, %m0$.File.type* %.tmp1795, i32 1)
%.tmp1796 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1797 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp1796)
%.tmp1798 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1799 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp1798)
%str_len = alloca i32
store i32 %.tmp1799, i32* %str_len
%.tmp1800 = load %m0$.File.type*, %m0$.File.type** %tmp
%.tmp1801 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp1800)
%tmp_fd = alloca i32
store i32 %.tmp1801, i32* %tmp_fd
%.tmp1802 = load i32, i32* %tmp_fd
%.tmp1803 = load i32, i32* @SEEK_SET
%.tmp1804 = call i32(i32,i32,i32) @lseek(i32 %.tmp1802, i32 0, i32 %.tmp1803)
%.tmp1805 = load i32, i32* %str_len
%.tmp1806 = call i8*(i32) @malloc(i32 %.tmp1805)
%buf = alloca i8*
store i8* %.tmp1806, i8** %buf
%.tmp1807 = load i32, i32* %tmp_fd
%.tmp1808 = load i8*, i8** %buf
%.tmp1809 = load i32, i32* %str_len
%.tmp1810 = call i32(i32,i8*,i32) @read(i32 %.tmp1807, i8* %.tmp1808, i32 %.tmp1809)
%read = alloca i32
store i32 %.tmp1810, i32* %read
%.tmp1811 = load i32, i32* %read
%.tmp1812 = load i32, i32* %str_len
%.tmp1813 = icmp ne i32 %.tmp1811, %.tmp1812
br i1 %.tmp1813, label %.if.true.1814, label %.if.false.1814
.if.true.1814:
%.tmp1815 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp1815)
store i8* null, i8** %buf
br label %.if.end.1814
.if.false.1814:
br label %.if.end.1814
.if.end.1814:
%.tmp1816 = load i8*, i8** %buf
ret i8* %.tmp1816
}
define void @m1792$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1817 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1819 = getelementptr [2 x i8], [2 x i8]*@.str1818, i32 0, i32 0
%.tmp1820 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1817, i8* %.tmp1819)
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1821
.for.start.1821:
%.tmp1822 = load i32, i32* %i
%.tmp1823 = load i32, i32* %indent
%.tmp1824 = icmp slt i32 %.tmp1822, %.tmp1823
br i1 %.tmp1824, label %.for.continue.1821, label %.for.end.1821
.for.continue.1821:
%.tmp1825 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1827 = getelementptr [3 x i8], [3 x i8]*@.str1826, i32 0, i32 0
%.tmp1828 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1825, i8* %.tmp1827)
%.tmp1829 = load i32, i32* %i
%.tmp1830 = add i32 %.tmp1829, 1
store i32 %.tmp1830, i32* %i
br label %.for.start.1821
.for.end.1821:
ret void
}
define void @m1792$_node_to_string.v.m261$.Node.typep.m0$.File.typep.i(%m261$.Node.type* %.node.arg, %m0$.File.type* %.stdout.arg, i32 %.indent.arg) {
%node = alloca %m261$.Node.type*
store %m261$.Node.type* %.node.arg, %m261$.Node.type** %node
%stdout = alloca %m0$.File.type*
store %m0$.File.type* %.stdout.arg, %m0$.File.type** %stdout
%indent = alloca i32
store i32 %.indent.arg, i32* %indent
%.tmp1831 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp1832 = icmp eq %m261$.Node.type* %.tmp1831, null
br i1 %.tmp1832, label %.if.true.1833, label %.if.false.1833
.if.true.1833:
%.tmp1834 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1836 = getelementptr [7 x i8], [7 x i8]*@.str1835, i32 0, i32 0
%.tmp1837 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1834, i8* %.tmp1836)
ret void
br label %.if.end.1833
.if.false.1833:
br label %.if.end.1833
.if.end.1833:
%.tmp1838 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1840 = getelementptr [2 x i8], [2 x i8]*@.str1839, i32 0, i32 0
%.tmp1841 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1838, i8* %.tmp1840)
%.tmp1842 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1843 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1792$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1842, i32 %.tmp1843)
%.tmp1844 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1846 = getelementptr [13 x i8], [13 x i8]*@.str1845, i32 0, i32 0
%.tmp1847 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp1848 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1847, i32 0, i32 0
%.tmp1849 = load i8*, i8** %.tmp1848
%.tmp1850 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1844, i8* %.tmp1846, i8* %.tmp1849)
%.tmp1851 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1852 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1792$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1851, i32 %.tmp1852)
%.tmp1853 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1855 = getelementptr [12 x i8], [12 x i8]*@.str1854, i32 0, i32 0
%.tmp1856 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp1857 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1856, i32 0, i32 1
%.tmp1858 = load i8*, i8** %.tmp1857
%.tmp1859 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1853, i8* %.tmp1855, i8* %.tmp1858)
%.tmp1860 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1861 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1792$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1860, i32 %.tmp1861)
%.tmp1862 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1864 = getelementptr [11 x i8], [11 x i8]*@.str1863, i32 0, i32 0
%.tmp1865 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp1866 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1865, i32 0, i32 3
%.tmp1867 = load i32, i32* %.tmp1866
%.tmp1868 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1862, i8* %.tmp1864, i32 %.tmp1867)
%.tmp1869 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1870 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1792$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1869, i32 %.tmp1870)
%.tmp1871 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1873 = getelementptr [19 x i8], [19 x i8]*@.str1872, i32 0, i32 0
%.tmp1874 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp1875 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1874, i32 0, i32 4
%.tmp1876 = load i32, i32* %.tmp1875
%.tmp1877 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1871, i8* %.tmp1873, i32 %.tmp1876)
%.tmp1878 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1879 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1792$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1878, i32 %.tmp1879)
%.tmp1880 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1882 = getelementptr [9 x i8], [9 x i8]*@.str1881, i32 0, i32 0
%.tmp1883 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1880, i8* %.tmp1882)
%.tmp1884 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp1885 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1884, i32 0, i32 7
%.tmp1886 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1885
%.tmp1887 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1888 = load i32, i32* %indent
%.tmp1889 = add i32 %.tmp1888, 1
call void(%m261$.Node.type*,%m0$.File.type*,i32) @m1792$_node_to_string.v.m261$.Node.typep.m0$.File.typep.i(%m261$.Node.type* %.tmp1886, %m0$.File.type* %.tmp1887, i32 %.tmp1889)
%.tmp1890 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1891 = load i32, i32* %indent
call void(%m0$.File.type*,i32) @m1792$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1890, i32 %.tmp1891)
%.tmp1892 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1894 = getelementptr [13 x i8], [13 x i8]*@.str1893, i32 0, i32 0
%.tmp1895 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1892, i8* %.tmp1894)
%.tmp1896 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp1897 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1896, i32 0, i32 6
%.tmp1898 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1897
%.tmp1899 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1900 = load i32, i32* %indent
%.tmp1901 = add i32 %.tmp1900, 1
call void(%m261$.Node.type*,%m0$.File.type*,i32) @m1792$_node_to_string.v.m261$.Node.typep.m0$.File.typep.i(%m261$.Node.type* %.tmp1898, %m0$.File.type* %.tmp1899, i32 %.tmp1901)
%.tmp1902 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1903 = load i32, i32* %indent
%.tmp1904 = sub i32 %.tmp1903, 1
call void(%m0$.File.type*,i32) @m1792$_print_indent.v.m0$.File.typep.i(%m0$.File.type* %.tmp1902, i32 %.tmp1904)
%.tmp1905 = load %m0$.File.type*, %m0$.File.type** %stdout
%.tmp1907 = getelementptr [2 x i8], [2 x i8]*@.str1906, i32 0, i32 0
%.tmp1908 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp1905, i8* %.tmp1907)
ret void
}
@.str1818 = constant [2 x i8] c"\0A\00"
@.str1826 = constant [3 x i8] c"  \00"
@.str1835 = constant [7 x i8] c"(null)\00"
@.str1839 = constant [2 x i8] c"{\00"
@.str1845 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str1854 = constant [12 x i8] c"\22value\22: %s\00"
@.str1863 = constant [11 x i8] c"\22line\22: %d\00"
@.str1872 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str1881 = constant [9 x i8] c"\22next\22: \00"
@.str1893 = constant [13 x i8] c"\22children\22: \00"
@.str1906 = constant [2 x i8] c"}\00"
%m1909$.SYStack.type = type {%m261$.Node.type*,%m1909$.SYStack.type*}
@SYStack_size = constant i32 16
define %m1909$.SYStack.type* @m1909$stack_new.m1909$.SYStack.typep() {
%.tmp1910 = load i32, i32* @SYStack_size
%.tmp1911 = call i8*(i32) @malloc(i32 %.tmp1910)
%.tmp1912 = bitcast i8* %.tmp1911 to %m1909$.SYStack.type*
%s = alloca %m1909$.SYStack.type*
store %m1909$.SYStack.type* %.tmp1912, %m1909$.SYStack.type** %s
%.tmp1913 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %s
%.tmp1914 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp1913, i32 0, i32 0
store %m261$.Node.type* null, %m261$.Node.type** %.tmp1914
%.tmp1915 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %s
%.tmp1916 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp1915, i32 0, i32 1
store %m1909$.SYStack.type* null, %m1909$.SYStack.type** %.tmp1916
%.tmp1917 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %s
ret %m1909$.SYStack.type* %.tmp1917
}
define %m1909$.SYStack.type* @m1909$sy_algorithm.m1909$.SYStack.typep.m261$.Node.typep(%m261$.Node.type* %.assignable.arg) {
%assignable = alloca %m261$.Node.type*
store %m261$.Node.type* %.assignable.arg, %m261$.Node.type** %assignable
%.tmp1918 = call %m1909$.SYStack.type*() @m1909$stack_new.m1909$.SYStack.typep()
%out_stack = alloca %m1909$.SYStack.type*
store %m1909$.SYStack.type* %.tmp1918, %m1909$.SYStack.type** %out_stack
%.tmp1919 = call %m1909$.SYStack.type*() @m1909$stack_new.m1909$.SYStack.typep()
%op_stack = alloca %m1909$.SYStack.type*
store %m1909$.SYStack.type* %.tmp1919, %m1909$.SYStack.type** %op_stack
%.tmp1920 = call %m1909$.SYStack.type*() @m1909$stack_new.m1909$.SYStack.typep()
%token_stack = alloca %m1909$.SYStack.type*
store %m1909$.SYStack.type* %.tmp1920, %m1909$.SYStack.type** %token_stack
%ptr = alloca %m261$.Node.type*
%.tmp1922 = load %m261$.Node.type*, %m261$.Node.type** %assignable
store %m261$.Node.type* %.tmp1922, %m261$.Node.type** %ptr
br label %.for.start.1921
.for.start.1921:
%.tmp1923 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp1924 = icmp ne %m261$.Node.type* %.tmp1923, null
br i1 %.tmp1924, label %.for.continue.1921, label %.for.end.1921
.for.continue.1921:
%.tmp1925 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %token_stack
%.tmp1926 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp1927 = call %m1909$.SYStack.type*(%m1909$.SYStack.type*,%m261$.Node.type*) @m1909$stack_push.m1909$.SYStack.typep.m1909$.SYStack.typep.m261$.Node.typep(%m1909$.SYStack.type* %.tmp1925, %m261$.Node.type* %.tmp1926)
store %m1909$.SYStack.type* %.tmp1927, %m1909$.SYStack.type** %token_stack
%.tmp1928 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp1929 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1928, i32 0, i32 7
%.tmp1930 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1929
store %m261$.Node.type* %.tmp1930, %m261$.Node.type** %ptr
br label %.for.start.1921
.for.end.1921:
%.tmp1932 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %token_stack
%.tmp1933 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp1932, i32 0, i32 0
%.tmp1934 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1933
store %m261$.Node.type* %.tmp1934, %m261$.Node.type** %ptr
br label %.for.start.1931
.for.start.1931:
%.tmp1935 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp1936 = icmp ne %m261$.Node.type* %.tmp1935, null
br i1 %.tmp1936, label %.for.continue.1931, label %.for.end.1931
.for.continue.1931:
%.tmp1937 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %token_stack
%cs = alloca %m1909$.SYStack.type*
store %m1909$.SYStack.type* %.tmp1937, %m1909$.SYStack.type** %cs
%.tmp1938 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %token_stack
%.tmp1939 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp1938, i32 0, i32 1
%.tmp1940 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp1939
store %m1909$.SYStack.type* %.tmp1940, %m1909$.SYStack.type** %token_stack
%.tmp1941 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %cs
%.tmp1942 = bitcast %m1909$.SYStack.type* %.tmp1941 to i8*
call void(i8*) @free(i8* %.tmp1942)
%.tmp1943 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp1944 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1943, i32 0, i32 0
%.tmp1945 = load i8*, i8** %.tmp1944
%.tmp1947 = getelementptr [16 x i8], [16 x i8]*@.str1946, i32 0, i32 0
%.tmp1948 = call i32(i8*,i8*) @strcmp(i8* %.tmp1945, i8* %.tmp1947)
%.tmp1949 = icmp eq i32 %.tmp1948, 0
br i1 %.tmp1949, label %.if.true.1950, label %.if.false.1950
.if.true.1950:
%.tmp1951 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %out_stack
%.tmp1952 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp1953 = call %m1909$.SYStack.type*(%m1909$.SYStack.type*,%m261$.Node.type*) @m1909$stack_push.m1909$.SYStack.typep.m1909$.SYStack.typep.m261$.Node.typep(%m1909$.SYStack.type* %.tmp1951, %m261$.Node.type* %.tmp1952)
store %m1909$.SYStack.type* %.tmp1953, %m1909$.SYStack.type** %out_stack
br label %.if.end.1950
.if.false.1950:
%.tmp1954 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp1955 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1954, i32 0, i32 0
%.tmp1956 = load i8*, i8** %.tmp1955
%.tmp1958 = getelementptr [9 x i8], [9 x i8]*@.str1957, i32 0, i32 0
%.tmp1959 = call i32(i8*,i8*) @strcmp(i8* %.tmp1956, i8* %.tmp1958)
%.tmp1960 = icmp eq i32 %.tmp1959, 0
br i1 %.tmp1960, label %.if.true.1961, label %.if.false.1961
.if.true.1961:
%quit = alloca i1
store i1 0, i1* %quit
br label %.for.start.1962
.for.start.1962:
%.tmp1963 = load i1, i1* %quit
%.tmp1964 = icmp eq i1 %.tmp1963, 0
br i1 %.tmp1964, label %.for.continue.1962, label %.for.end.1962
.for.continue.1962:
%.tmp1965 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %op_stack
%.tmp1966 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp1965, i32 0, i32 0
%.tmp1967 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1966
%.tmp1968 = icmp eq %m261$.Node.type* %.tmp1967, null
br i1 %.tmp1968, label %.if.true.1969, label %.if.false.1969
.if.true.1969:
store i1 1, i1* %quit
br label %.if.end.1969
.if.false.1969:
%.tmp1970 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %op_stack
%.tmp1971 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp1970, i32 0, i32 0
%.tmp1972 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1971
%.tmp1973 = call i32(%m261$.Node.type*) @m1909$op_precedence.i.m261$.Node.typep(%m261$.Node.type* %.tmp1972)
%.tmp1974 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp1975 = call i32(%m261$.Node.type*) @m1909$op_precedence.i.m261$.Node.typep(%m261$.Node.type* %.tmp1974)
%.tmp1976 = icmp slt i32 %.tmp1973, %.tmp1975
br i1 %.tmp1976, label %.if.true.1977, label %.if.false.1977
.if.true.1977:
%.tmp1978 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %op_stack
%top = alloca %m1909$.SYStack.type*
store %m1909$.SYStack.type* %.tmp1978, %m1909$.SYStack.type** %top
%.tmp1979 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %op_stack
%.tmp1980 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp1979, i32 0, i32 1
%.tmp1981 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp1980
store %m1909$.SYStack.type* %.tmp1981, %m1909$.SYStack.type** %op_stack
%.tmp1982 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %out_stack
%.tmp1983 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %top
%.tmp1984 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp1983, i32 0, i32 0
%.tmp1985 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1984
%.tmp1986 = call %m1909$.SYStack.type*(%m1909$.SYStack.type*,%m261$.Node.type*) @m1909$stack_push.m1909$.SYStack.typep.m1909$.SYStack.typep.m261$.Node.typep(%m1909$.SYStack.type* %.tmp1982, %m261$.Node.type* %.tmp1985)
store %m1909$.SYStack.type* %.tmp1986, %m1909$.SYStack.type** %out_stack
%.tmp1987 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %top
%.tmp1988 = bitcast %m1909$.SYStack.type* %.tmp1987 to i8*
call void(i8*) @free(i8* %.tmp1988)
br label %.if.end.1977
.if.false.1977:
store i1 1, i1* %quit
br label %.if.end.1977
.if.end.1977:
br label %.if.end.1969
.if.end.1969:
br label %.for.start.1962
.for.end.1962:
%.tmp1989 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %op_stack
%.tmp1990 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp1991 = call %m1909$.SYStack.type*(%m1909$.SYStack.type*,%m261$.Node.type*) @m1909$stack_push.m1909$.SYStack.typep.m1909$.SYStack.typep.m261$.Node.typep(%m1909$.SYStack.type* %.tmp1989, %m261$.Node.type* %.tmp1990)
store %m1909$.SYStack.type* %.tmp1991, %m1909$.SYStack.type** %op_stack
br label %.if.end.1961
.if.false.1961:
%.tmp1993 = getelementptr [68 x i8], [68 x i8]*@.str1992, i32 0, i32 0
%.tmp1994 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp1995 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp1994, i32 0, i32 0
%.tmp1996 = load i8*, i8** %.tmp1995
%.tmp1997 = call i32(i8*,...) @printf(i8* %.tmp1993, i8* %.tmp1996)
br label %.if.end.1961
.if.end.1961:
br label %.if.end.1950
.if.end.1950:
%.tmp1998 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %token_stack
%.tmp1999 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp1998, i32 0, i32 0
%.tmp2000 = load %m261$.Node.type*, %m261$.Node.type** %.tmp1999
store %m261$.Node.type* %.tmp2000, %m261$.Node.type** %ptr
br label %.for.start.1931
.for.end.1931:
br label %.for.start.2001
.for.start.2001:
%.tmp2002 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %op_stack
%.tmp2003 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp2002, i32 0, i32 0
%.tmp2004 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2003
%.tmp2005 = icmp ne %m261$.Node.type* %.tmp2004, null
br i1 %.tmp2005, label %.for.continue.2001, label %.for.end.2001
.for.continue.2001:
%.tmp2006 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %op_stack
%.tmp2007 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp2006, i32 0, i32 0
%.tmp2008 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2007
%node = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp2008, %m261$.Node.type** %node
%.tmp2009 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %op_stack
%s = alloca %m1909$.SYStack.type*
store %m1909$.SYStack.type* %.tmp2009, %m1909$.SYStack.type** %s
%.tmp2010 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %op_stack
%.tmp2011 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp2010, i32 0, i32 1
%.tmp2012 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp2011
store %m1909$.SYStack.type* %.tmp2012, %m1909$.SYStack.type** %op_stack
%.tmp2013 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %s
%.tmp2014 = bitcast %m1909$.SYStack.type* %.tmp2013 to i8*
call void(i8*) @free(i8* %.tmp2014)
%.tmp2015 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %out_stack
%.tmp2016 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp2017 = call %m1909$.SYStack.type*(%m1909$.SYStack.type*,%m261$.Node.type*) @m1909$stack_push.m1909$.SYStack.typep.m1909$.SYStack.typep.m261$.Node.typep(%m1909$.SYStack.type* %.tmp2015, %m261$.Node.type* %.tmp2016)
store %m1909$.SYStack.type* %.tmp2017, %m1909$.SYStack.type** %out_stack
br label %.for.start.2001
.for.end.2001:
%.tmp2018 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %out_stack
ret %m1909$.SYStack.type* %.tmp2018
}
define %m1909$.SYStack.type* @m1909$stack_push.m1909$.SYStack.typep.m1909$.SYStack.typep.m261$.Node.typep(%m1909$.SYStack.type* %.curr_stack.arg, %m261$.Node.type* %.node.arg) {
%curr_stack = alloca %m1909$.SYStack.type*
store %m1909$.SYStack.type* %.curr_stack.arg, %m1909$.SYStack.type** %curr_stack
%node = alloca %m261$.Node.type*
store %m261$.Node.type* %.node.arg, %m261$.Node.type** %node
%.tmp2019 = load i32, i32* @SYStack_size
%.tmp2020 = call i8*(i32) @malloc(i32 %.tmp2019)
%.tmp2021 = bitcast i8* %.tmp2020 to %m1909$.SYStack.type*
%s = alloca %m1909$.SYStack.type*
store %m1909$.SYStack.type* %.tmp2021, %m1909$.SYStack.type** %s
%.tmp2022 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %s
%.tmp2023 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp2022, i32 0, i32 0
%.tmp2024 = load %m261$.Node.type*, %m261$.Node.type** %node
store %m261$.Node.type* %.tmp2024, %m261$.Node.type** %.tmp2023
%.tmp2025 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %s
%.tmp2026 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp2025, i32 0, i32 1
%.tmp2027 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %curr_stack
store %m1909$.SYStack.type* %.tmp2027, %m1909$.SYStack.type** %.tmp2026
%.tmp2028 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %s
ret %m1909$.SYStack.type* %.tmp2028
}
define i32 @m1909$op_precedence.i.m261$.Node.typep(%m261$.Node.type* %.n.arg) {
%n = alloca %m261$.Node.type*
store %m261$.Node.type* %.n.arg, %m261$.Node.type** %n
%.tmp2029 = load %m261$.Node.type*, %m261$.Node.type** %n
%.tmp2030 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2029, i32 0, i32 6
%.tmp2031 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2030
%op = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp2031, %m261$.Node.type** %op
%.tmp2032 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp2033 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2032, i32 0, i32 1
%.tmp2034 = load i8*, i8** %.tmp2033
%.tmp2036 = getelementptr [2 x i8], [2 x i8]*@.str2035, i32 0, i32 0
%.tmp2037 = call i32(i8*,i8*) @strcmp(i8* %.tmp2034, i8* %.tmp2036)
%.tmp2038 = icmp eq i32 %.tmp2037, 0
%.tmp2039 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp2040 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2039, i32 0, i32 1
%.tmp2041 = load i8*, i8** %.tmp2040
%.tmp2043 = getelementptr [2 x i8], [2 x i8]*@.str2042, i32 0, i32 0
%.tmp2044 = call i32(i8*,i8*) @strcmp(i8* %.tmp2041, i8* %.tmp2043)
%.tmp2045 = icmp eq i32 %.tmp2044, 0
%.tmp2046 = or i1 %.tmp2038, %.tmp2045
br i1 %.tmp2046, label %.if.true.2047, label %.if.false.2047
.if.true.2047:
ret i32 4
br label %.if.end.2047
.if.false.2047:
%.tmp2048 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp2049 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2048, i32 0, i32 1
%.tmp2050 = load i8*, i8** %.tmp2049
%.tmp2052 = getelementptr [2 x i8], [2 x i8]*@.str2051, i32 0, i32 0
%.tmp2053 = call i32(i8*,i8*) @strcmp(i8* %.tmp2050, i8* %.tmp2052)
%.tmp2054 = icmp eq i32 %.tmp2053, 0
%.tmp2055 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp2056 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2055, i32 0, i32 1
%.tmp2057 = load i8*, i8** %.tmp2056
%.tmp2059 = getelementptr [2 x i8], [2 x i8]*@.str2058, i32 0, i32 0
%.tmp2060 = call i32(i8*,i8*) @strcmp(i8* %.tmp2057, i8* %.tmp2059)
%.tmp2061 = icmp eq i32 %.tmp2060, 0
%.tmp2062 = or i1 %.tmp2054, %.tmp2061
br i1 %.tmp2062, label %.if.true.2063, label %.if.false.2063
.if.true.2063:
ret i32 3
br label %.if.end.2063
.if.false.2063:
%.tmp2064 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp2065 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2064, i32 0, i32 1
%.tmp2066 = load i8*, i8** %.tmp2065
%.tmp2068 = getelementptr [3 x i8], [3 x i8]*@.str2067, i32 0, i32 0
%.tmp2069 = call i32(i8*,i8*) @strcmp(i8* %.tmp2066, i8* %.tmp2068)
%.tmp2070 = icmp eq i32 %.tmp2069, 0
%.tmp2071 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp2072 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2071, i32 0, i32 1
%.tmp2073 = load i8*, i8** %.tmp2072
%.tmp2075 = getelementptr [3 x i8], [3 x i8]*@.str2074, i32 0, i32 0
%.tmp2076 = call i32(i8*,i8*) @strcmp(i8* %.tmp2073, i8* %.tmp2075)
%.tmp2077 = icmp eq i32 %.tmp2076, 0
%.tmp2078 = or i1 %.tmp2070, %.tmp2077
br i1 %.tmp2078, label %.if.true.2079, label %.if.false.2079
.if.true.2079:
ret i32 7
br label %.if.end.2079
.if.false.2079:
%.tmp2080 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp2081 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2080, i32 0, i32 1
%.tmp2082 = load i8*, i8** %.tmp2081
%.tmp2084 = getelementptr [3 x i8], [3 x i8]*@.str2083, i32 0, i32 0
%.tmp2085 = call i32(i8*,i8*) @strcmp(i8* %.tmp2082, i8* %.tmp2084)
%.tmp2086 = icmp eq i32 %.tmp2085, 0
%.tmp2087 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp2088 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2087, i32 0, i32 1
%.tmp2089 = load i8*, i8** %.tmp2088
%.tmp2091 = getelementptr [3 x i8], [3 x i8]*@.str2090, i32 0, i32 0
%.tmp2092 = call i32(i8*,i8*) @strcmp(i8* %.tmp2089, i8* %.tmp2091)
%.tmp2093 = icmp eq i32 %.tmp2092, 0
%.tmp2094 = or i1 %.tmp2086, %.tmp2093
br i1 %.tmp2094, label %.if.true.2095, label %.if.false.2095
.if.true.2095:
ret i32 6
br label %.if.end.2095
.if.false.2095:
%.tmp2096 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp2097 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2096, i32 0, i32 1
%.tmp2098 = load i8*, i8** %.tmp2097
%.tmp2100 = getelementptr [2 x i8], [2 x i8]*@.str2099, i32 0, i32 0
%.tmp2101 = call i32(i8*,i8*) @strcmp(i8* %.tmp2098, i8* %.tmp2100)
%.tmp2102 = icmp eq i32 %.tmp2101, 0
%.tmp2103 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp2104 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2103, i32 0, i32 1
%.tmp2105 = load i8*, i8** %.tmp2104
%.tmp2107 = getelementptr [2 x i8], [2 x i8]*@.str2106, i32 0, i32 0
%.tmp2108 = call i32(i8*,i8*) @strcmp(i8* %.tmp2105, i8* %.tmp2107)
%.tmp2109 = icmp eq i32 %.tmp2108, 0
%.tmp2110 = or i1 %.tmp2102, %.tmp2109
br i1 %.tmp2110, label %.if.true.2111, label %.if.false.2111
.if.true.2111:
ret i32 6
br label %.if.end.2111
.if.false.2111:
%.tmp2112 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp2113 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2112, i32 0, i32 1
%.tmp2114 = load i8*, i8** %.tmp2113
%.tmp2116 = getelementptr [2 x i8], [2 x i8]*@.str2115, i32 0, i32 0
%.tmp2117 = call i32(i8*,i8*) @strcmp(i8* %.tmp2114, i8* %.tmp2116)
%.tmp2118 = icmp eq i32 %.tmp2117, 0
br i1 %.tmp2118, label %.if.true.2119, label %.if.false.2119
.if.true.2119:
ret i32 11
br label %.if.end.2119
.if.false.2119:
%.tmp2120 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp2121 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2120, i32 0, i32 1
%.tmp2122 = load i8*, i8** %.tmp2121
%.tmp2124 = getelementptr [2 x i8], [2 x i8]*@.str2123, i32 0, i32 0
%.tmp2125 = call i32(i8*,i8*) @strcmp(i8* %.tmp2122, i8* %.tmp2124)
%.tmp2126 = icmp eq i32 %.tmp2125, 0
br i1 %.tmp2126, label %.if.true.2127, label %.if.false.2127
.if.true.2127:
ret i32 12
br label %.if.end.2127
.if.false.2127:
br label %.if.end.2127
.if.end.2127:
br label %.if.end.2119
.if.end.2119:
br label %.if.end.2111
.if.end.2111:
br label %.if.end.2095
.if.end.2095:
br label %.if.end.2079
.if.end.2079:
br label %.if.end.2063
.if.end.2063:
br label %.if.end.2047
.if.end.2047:
%.tmp2129 = getelementptr [65 x i8], [65 x i8]*@.str2128, i32 0, i32 0
%.tmp2130 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp2131 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2130, i32 0, i32 1
%.tmp2132 = load i8*, i8** %.tmp2131
%.tmp2133 = call i32(i8*,...) @printf(i8* %.tmp2129, i8* %.tmp2132)
ret i32 4
}
@.str1946 = constant [16 x i8] c"mono_assignable\00"
@.str1957 = constant [9 x i8] c"operator\00"
@.str1992 = constant [68 x i8] c":coffee-error: node of type %s could not be parsed in sy_algorithm\0A\00"
@.str2035 = constant [2 x i8] c"+\00"
@.str2042 = constant [2 x i8] c"-\00"
@.str2051 = constant [2 x i8] c"*\00"
@.str2058 = constant [2 x i8] c"/\00"
@.str2067 = constant [3 x i8] c"==\00"
@.str2074 = constant [3 x i8] c"!=\00"
@.str2083 = constant [3 x i8] c">=\00"
@.str2090 = constant [3 x i8] c"<=\00"
@.str2099 = constant [2 x i8] c">\00"
@.str2106 = constant [2 x i8] c"<\00"
@.str2115 = constant [2 x i8] c"&\00"
@.str2123 = constant [2 x i8] c"|\00"
@.str2128 = constant [65 x i8] c":coffee-error: priority not defined for operator with value: %s\0A\00"
%m1791$.ErrorList.type = type {%m678$.Error.type*,%m1791$.ErrorList.type*}
@ErrorList_size = constant i32 16
%m1791$.Type.type = type {i8*,i8*,i8*,%m1791$.Type.type*,%m1791$.Type.type*}
@Type_size = constant i32 40
define %m1791$.Type.type* @m1791$type_clone.m1791$.Type.typep.m1791$.Type.typep(%m1791$.Type.type* %.t.arg) {
%t = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.t.arg, %m1791$.Type.type** %t
%.tmp2134 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp2135 = icmp eq %m1791$.Type.type* %.tmp2134, null
br i1 %.tmp2135, label %.if.true.2136, label %.if.false.2136
.if.true.2136:
%.tmp2137 = bitcast ptr null to %m1791$.Type.type*
ret %m1791$.Type.type* %.tmp2137
br label %.if.end.2136
.if.false.2136:
br label %.if.end.2136
.if.end.2136:
%.tmp2138 = load i32, i32* @Type_size
%.tmp2139 = call i8*(i32) @malloc(i32 %.tmp2138)
%.tmp2140 = bitcast i8* %.tmp2139 to %m1791$.Type.type*
%clone = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp2140, %m1791$.Type.type** %clone
%.tmp2141 = load %m1791$.Type.type*, %m1791$.Type.type** %clone
%.tmp2142 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2141, i32 0, i32 3
%.tmp2143 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp2144 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2143, i32 0, i32 3
%.tmp2145 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2144
store %m1791$.Type.type* %.tmp2145, %m1791$.Type.type** %.tmp2142
%.tmp2146 = load %m1791$.Type.type*, %m1791$.Type.type** %clone
%.tmp2147 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2146, i32 0, i32 4
%.tmp2148 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp2149 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2148, i32 0, i32 4
%.tmp2150 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2149
%.tmp2151 = call %m1791$.Type.type*(%m1791$.Type.type*) @m1791$type_clone.m1791$.Type.typep.m1791$.Type.typep(%m1791$.Type.type* %.tmp2150)
store %m1791$.Type.type* %.tmp2151, %m1791$.Type.type** %.tmp2147
%.tmp2152 = load %m1791$.Type.type*, %m1791$.Type.type** %clone
%.tmp2153 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2152, i32 0, i32 2
%.tmp2154 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp2155 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2154, i32 0, i32 2
%.tmp2156 = load i8*, i8** %.tmp2155
store i8* %.tmp2156, i8** %.tmp2153
%.tmp2157 = load %m1791$.Type.type*, %m1791$.Type.type** %clone
%.tmp2158 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2157, i32 0, i32 0
%.tmp2159 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp2160 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2159, i32 0, i32 0
%.tmp2161 = load i8*, i8** %.tmp2160
store i8* %.tmp2161, i8** %.tmp2158
%.tmp2162 = load %m1791$.Type.type*, %m1791$.Type.type** %clone
%.tmp2163 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2162, i32 0, i32 1
%.tmp2164 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp2165 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2164, i32 0, i32 1
%.tmp2166 = load i8*, i8** %.tmp2165
store i8* %.tmp2166, i8** %.tmp2163
%.tmp2167 = load %m1791$.Type.type*, %m1791$.Type.type** %clone
ret %m1791$.Type.type* %.tmp2167
}
define %m1791$.Type.type* @m1791$new_type.m1791$.Type.typep() {
%.tmp2168 = load i32, i32* @Type_size
%.tmp2169 = call i8*(i32) @malloc(i32 %.tmp2168)
%.tmp2170 = bitcast i8* %.tmp2169 to %m1791$.Type.type*
%type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp2170, %m1791$.Type.type** %type
%.tmp2171 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp2172 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2171, i32 0, i32 1
store i8* null, i8** %.tmp2172
%.tmp2173 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp2174 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2173, i32 0, i32 2
store i8* null, i8** %.tmp2174
%.tmp2175 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp2176 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2175, i32 0, i32 0
store i8* null, i8** %.tmp2176
%.tmp2177 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp2178 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2177, i32 0, i32 3
store %m1791$.Type.type* null, %m1791$.Type.type** %.tmp2178
%.tmp2179 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp2180 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2179, i32 0, i32 4
store %m1791$.Type.type* null, %m1791$.Type.type** %.tmp2180
%.tmp2181 = load %m1791$.Type.type*, %m1791$.Type.type** %type
ret %m1791$.Type.type* %.tmp2181
}
define void @m1791$copy_type.v.m1791$.Type.typep.m1791$.Type.typep(%m1791$.Type.type* %.dest.arg, %m1791$.Type.type* %.src.arg) {
%dest = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.dest.arg, %m1791$.Type.type** %dest
%src = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.src.arg, %m1791$.Type.type** %src
%.tmp2182 = load %m1791$.Type.type*, %m1791$.Type.type** %dest
%.tmp2183 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2182, i32 0, i32 0
%.tmp2184 = load %m1791$.Type.type*, %m1791$.Type.type** %src
%.tmp2185 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2184, i32 0, i32 0
%.tmp2186 = load i8*, i8** %.tmp2185
store i8* %.tmp2186, i8** %.tmp2183
%.tmp2187 = load %m1791$.Type.type*, %m1791$.Type.type** %dest
%.tmp2188 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2187, i32 0, i32 1
%.tmp2189 = load %m1791$.Type.type*, %m1791$.Type.type** %src
%.tmp2190 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2189, i32 0, i32 1
%.tmp2191 = load i8*, i8** %.tmp2190
store i8* %.tmp2191, i8** %.tmp2188
%.tmp2192 = load %m1791$.Type.type*, %m1791$.Type.type** %dest
%.tmp2193 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2192, i32 0, i32 2
%.tmp2194 = load %m1791$.Type.type*, %m1791$.Type.type** %src
%.tmp2195 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2194, i32 0, i32 2
%.tmp2196 = load i8*, i8** %.tmp2195
store i8* %.tmp2196, i8** %.tmp2193
%.tmp2197 = load %m1791$.Type.type*, %m1791$.Type.type** %dest
%.tmp2198 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2197, i32 0, i32 3
%.tmp2199 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2198
%.tmp2200 = load %m1791$.Type.type*, %m1791$.Type.type** %src
%.tmp2201 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2200, i32 0, i32 3
%.tmp2202 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2201
%.tmp2203 = icmp ne %m1791$.Type.type* %.tmp2199, %.tmp2202
br i1 %.tmp2203, label %.if.true.2204, label %.if.false.2204
.if.true.2204:
%.tmp2205 = load %m1791$.Type.type*, %m1791$.Type.type** %dest
%.tmp2206 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2205, i32 0, i32 3
%.tmp2207 = load %m1791$.Type.type*, %m1791$.Type.type** %src
%.tmp2208 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2207, i32 0, i32 3
%.tmp2209 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2208
store %m1791$.Type.type* %.tmp2209, %m1791$.Type.type** %.tmp2206
%.tmp2210 = load %m1791$.Type.type*, %m1791$.Type.type** %dest
%.tmp2211 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2210, i32 0, i32 3
%.tmp2212 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2211
%.tmp2213 = load %m1791$.Type.type*, %m1791$.Type.type** %src
%.tmp2214 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2213, i32 0, i32 3
%.tmp2215 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2214
call void(%m1791$.Type.type*,%m1791$.Type.type*) @m1791$copy_type.v.m1791$.Type.typep.m1791$.Type.typep(%m1791$.Type.type* %.tmp2212, %m1791$.Type.type* %.tmp2215)
br label %.if.end.2204
.if.false.2204:
br label %.if.end.2204
.if.end.2204:
%.tmp2216 = load %m1791$.Type.type*, %m1791$.Type.type** %dest
%.tmp2217 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2216, i32 0, i32 4
%.tmp2218 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2217
%.tmp2219 = load %m1791$.Type.type*, %m1791$.Type.type** %src
%.tmp2220 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2219, i32 0, i32 4
%.tmp2221 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2220
%.tmp2222 = icmp ne %m1791$.Type.type* %.tmp2218, %.tmp2221
br i1 %.tmp2222, label %.if.true.2223, label %.if.false.2223
.if.true.2223:
%.tmp2224 = load %m1791$.Type.type*, %m1791$.Type.type** %dest
%.tmp2225 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2224, i32 0, i32 4
%.tmp2226 = load %m1791$.Type.type*, %m1791$.Type.type** %src
%.tmp2227 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2226, i32 0, i32 4
%.tmp2228 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2227
store %m1791$.Type.type* %.tmp2228, %m1791$.Type.type** %.tmp2225
%.tmp2229 = load %m1791$.Type.type*, %m1791$.Type.type** %dest
%.tmp2230 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2229, i32 0, i32 4
%.tmp2231 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2230
%.tmp2232 = load %m1791$.Type.type*, %m1791$.Type.type** %src
%.tmp2233 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2232, i32 0, i32 4
%.tmp2234 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2233
call void(%m1791$.Type.type*,%m1791$.Type.type*) @m1791$copy_type.v.m1791$.Type.typep.m1791$.Type.typep(%m1791$.Type.type* %.tmp2231, %m1791$.Type.type* %.tmp2234)
br label %.if.end.2223
.if.false.2223:
br label %.if.end.2223
.if.end.2223:
ret void
}
define void @m1791$debug_type.v.m1791$.Type.typep.i(%m1791$.Type.type* %.t.arg, i32 %.level.arg) {
%t = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.t.arg, %m1791$.Type.type** %t
%level = alloca i32
store i32 %.level.arg, i32* %level
%.tmp2235 = load i32, i32* %level
%.tmp2236 = add i32 %.tmp2235, 1
%.tmp2237 = call i8*(i32) @malloc(i32 %.tmp2236)
%.tmp2238 = bitcast i8* %.tmp2237 to i8*
%indent = alloca i8*
store i8* %.tmp2238, i8** %indent
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.2239
.for.start.2239:
%.tmp2240 = load i32, i32* %i
%.tmp2241 = load i32, i32* %level
%.tmp2242 = icmp slt i32 %.tmp2240, %.tmp2241
br i1 %.tmp2242, label %.for.continue.2239, label %.for.end.2239
.for.continue.2239:
%.tmp2243 = load i32, i32* %i
%.tmp2244 = load i8*, i8** %indent
%.tmp2245 = getelementptr i8, i8* %.tmp2244, i32 %.tmp2243
store i8 32, i8* %.tmp2245
%.tmp2246 = load i32, i32* %i
%.tmp2247 = add i32 %.tmp2246, 1
store i32 %.tmp2247, i32* %i
br label %.for.start.2239
.for.end.2239:
%.tmp2248 = load i32, i32* %level
%.tmp2249 = load i8*, i8** %indent
%.tmp2250 = getelementptr i8, i8* %.tmp2249, i32 %.tmp2248
store i8 0, i8* %.tmp2250
%.tmp2252 = getelementptr [5 x i8], [5 x i8]*@.str2251, i32 0, i32 0
%.tmp2253 = load i8*, i8** %indent
%.tmp2254 = call i32(i8*,...) @printf(i8* %.tmp2252, i8* %.tmp2253)
%.tmp2256 = getelementptr [21 x i8], [21 x i8]*@.str2255, i32 0, i32 0
%.tmp2257 = load i8*, i8** %indent
%.tmp2258 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp2259 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2258, i32 0, i32 0
%.tmp2260 = load i8*, i8** %.tmp2259
%.tmp2261 = call i32(i8*,...) @printf(i8* %.tmp2256, i8* %.tmp2257, i8* %.tmp2260)
%.tmp2263 = getelementptr [16 x i8], [16 x i8]*@.str2262, i32 0, i32 0
%.tmp2264 = load i8*, i8** %indent
%.tmp2265 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp2266 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2265, i32 0, i32 1
%.tmp2267 = load i8*, i8** %.tmp2266
%.tmp2268 = call i32(i8*,...) @printf(i8* %.tmp2263, i8* %.tmp2264, i8* %.tmp2267)
%.tmp2270 = getelementptr [16 x i8], [16 x i8]*@.str2269, i32 0, i32 0
%.tmp2271 = load i8*, i8** %indent
%.tmp2272 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp2273 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2272, i32 0, i32 2
%.tmp2274 = load i8*, i8** %.tmp2273
%.tmp2275 = call i32(i8*,...) @printf(i8* %.tmp2270, i8* %.tmp2271, i8* %.tmp2274)
%.tmp2276 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp2277 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2276, i32 0, i32 3
%.tmp2278 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2277
%.tmp2279 = icmp eq %m1791$.Type.type* %.tmp2278, null
br i1 %.tmp2279, label %.if.true.2280, label %.if.false.2280
.if.true.2280:
%.tmp2282 = getelementptr [16 x i8], [16 x i8]*@.str2281, i32 0, i32 0
%.tmp2283 = load i8*, i8** %indent
%.tmp2284 = call i32(i8*,...) @printf(i8* %.tmp2282, i8* %.tmp2283)
br label %.if.end.2280
.if.false.2280:
%.tmp2286 = getelementptr [10 x i8], [10 x i8]*@.str2285, i32 0, i32 0
%.tmp2287 = load i8*, i8** %indent
%.tmp2288 = call i32(i8*,...) @printf(i8* %.tmp2286, i8* %.tmp2287)
%.tmp2289 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp2290 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2289, i32 0, i32 3
%.tmp2291 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2290
%.tmp2292 = load i32, i32* %level
%.tmp2293 = add i32 %.tmp2292, 1
call void(%m1791$.Type.type*,i32) @m1791$debug_type.v.m1791$.Type.typep.i(%m1791$.Type.type* %.tmp2291, i32 %.tmp2293)
br label %.if.end.2280
.if.end.2280:
%.tmp2294 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp2295 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2294, i32 0, i32 4
%.tmp2296 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2295
%.tmp2297 = icmp eq %m1791$.Type.type* %.tmp2296, null
br i1 %.tmp2297, label %.if.true.2298, label %.if.false.2298
.if.true.2298:
%.tmp2300 = getelementptr [18 x i8], [18 x i8]*@.str2299, i32 0, i32 0
%.tmp2301 = load i8*, i8** %indent
%.tmp2302 = call i32(i8*,...) @printf(i8* %.tmp2300, i8* %.tmp2301)
br label %.if.end.2298
.if.false.2298:
%.tmp2304 = getelementptr [12 x i8], [12 x i8]*@.str2303, i32 0, i32 0
%.tmp2305 = load i8*, i8** %indent
%.tmp2306 = call i32(i8*,...) @printf(i8* %.tmp2304, i8* %.tmp2305)
%.tmp2307 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp2308 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2307, i32 0, i32 4
%.tmp2309 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2308
%.tmp2310 = load i32, i32* %level
%.tmp2311 = add i32 %.tmp2310, 1
call void(%m1791$.Type.type*,i32) @m1791$debug_type.v.m1791$.Type.typep.i(%m1791$.Type.type* %.tmp2309, i32 %.tmp2311)
br label %.if.end.2298
.if.end.2298:
%.tmp2313 = getelementptr [5 x i8], [5 x i8]*@.str2312, i32 0, i32 0
%.tmp2314 = load i8*, i8** %indent
%.tmp2315 = call i32(i8*,...) @printf(i8* %.tmp2313, i8* %.tmp2314)
ret void
}
%m1791$.AssignableInfo.type = type {i8*,i8,i8*,%m1791$.Type.type*,i32,i32,i8*}
@AssignableInfo_size = constant i32 48
@SCOPE_GLOBAL = constant i8 64
@SCOPE_LOCAL = constant i8 37
@SCOPE_CONST = constant i8 32
define %m1791$.AssignableInfo.type* @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.node.arg) {
%node = alloca %m261$.Node.type*
store %m261$.Node.type* %.node.arg, %m261$.Node.type** %node
%.tmp2316 = load i32, i32* @AssignableInfo_size
%.tmp2317 = call i8*(i32) @malloc(i32 %.tmp2316)
%.tmp2318 = bitcast i8* %.tmp2317 to %m1791$.AssignableInfo.type*
%ptr = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp2318, %m1791$.AssignableInfo.type** %ptr
%.tmp2319 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %ptr
%.tmp2320 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2319, i32 0, i32 1
%.tmp2321 = load i8, i8* @SCOPE_CONST
store i8 %.tmp2321, i8* %.tmp2320
%.tmp2322 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %ptr
%.tmp2323 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2322, i32 0, i32 0
store i8* null, i8** %.tmp2323
%.tmp2324 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %ptr
%.tmp2325 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2324, i32 0, i32 2
store i8* null, i8** %.tmp2325
%.tmp2326 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %ptr
%.tmp2327 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2326, i32 0, i32 3
store %m1791$.Type.type* null, %m1791$.Type.type** %.tmp2327
%.tmp2328 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp2329 = icmp ne %m261$.Node.type* %.tmp2328, null
br i1 %.tmp2329, label %.if.true.2330, label %.if.false.2330
.if.true.2330:
%.tmp2331 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %ptr
%.tmp2332 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2331, i32 0, i32 4
%.tmp2333 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp2334 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2333, i32 0, i32 3
%.tmp2335 = load i32, i32* %.tmp2334
store i32 %.tmp2335, i32* %.tmp2332
%.tmp2336 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %ptr
%.tmp2337 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2336, i32 0, i32 5
%.tmp2338 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp2339 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2338, i32 0, i32 4
%.tmp2340 = load i32, i32* %.tmp2339
store i32 %.tmp2340, i32* %.tmp2337
%.tmp2341 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %ptr
%.tmp2342 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2341, i32 0, i32 6
%.tmp2343 = load %m261$.Node.type*, %m261$.Node.type** %node
%.tmp2344 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2343, i32 0, i32 2
%.tmp2345 = load i8*, i8** %.tmp2344
store i8* %.tmp2345, i8** %.tmp2342
br label %.if.end.2330
.if.false.2330:
%.tmp2346 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %ptr
%.tmp2347 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2346, i32 0, i32 4
store i32 0, i32* %.tmp2347
%.tmp2348 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %ptr
%.tmp2349 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2348, i32 0, i32 5
store i32 0, i32* %.tmp2349
%.tmp2350 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %ptr
%.tmp2351 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2350, i32 0, i32 6
store i8* null, i8** %.tmp2351
br label %.if.end.2330
.if.end.2330:
%.tmp2352 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %ptr
ret %m1791$.AssignableInfo.type* %.tmp2352
}
define void @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.info.arg, i8 %.scope.arg, i8* %.id.arg) {
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.info.arg, %m1791$.AssignableInfo.type** %info
%scope = alloca i8
store i8 %.scope.arg, i8* %scope
%id = alloca i8*
store i8* %.id.arg, i8** %id
%.tmp2353 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2354 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2353, i32 0, i32 0
%.tmp2355 = load i8*, i8** %id
store i8* %.tmp2355, i8** %.tmp2354
%.tmp2356 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2357 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2356, i32 0, i32 1
%.tmp2358 = load i8, i8* %scope
store i8 %.tmp2358, i8* %.tmp2357
ret void
}
define i8* @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.info.arg) {
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.info.arg, %m1791$.AssignableInfo.type** %info
%.tmp2359 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2360 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2359, i32 0, i32 1
%.tmp2361 = load i8, i8* %.tmp2360
%.tmp2362 = load i8, i8* @SCOPE_CONST
%.tmp2363 = icmp eq i8 %.tmp2361, %.tmp2362
br i1 %.tmp2363, label %.if.true.2364, label %.if.false.2364
.if.true.2364:
%.tmp2365 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2366 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2365, i32 0, i32 0
%.tmp2367 = load i8*, i8** %.tmp2366
ret i8* %.tmp2367
br label %.if.end.2364
.if.false.2364:
br label %.if.end.2364
.if.end.2364:
%buf = alloca i8*
%.tmp2368 = getelementptr i8*, i8** %buf, i32 0
%.tmp2370 = getelementptr [5 x i8], [5 x i8]*@.str2369, i32 0, i32 0
%.tmp2371 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2372 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2371, i32 0, i32 1
%.tmp2373 = load i8, i8* %.tmp2372
%.tmp2374 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2375 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2374, i32 0, i32 0
%.tmp2376 = load i8*, i8** %.tmp2375
%.tmp2377 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2368, i8* %.tmp2370, i8 %.tmp2373, i8* %.tmp2376)
%.tmp2378 = load i8*, i8** %buf
ret i8* %.tmp2378
}
%m1791$.ScopeItem.type = type {i8*,%m1791$.AssignableInfo.type*,%m1791$.ScopeItem.type*}
@ScopeItem_size = constant i32 24
%m1791$.GlobalName.type = type {i8*,i8*,i1,%m1791$.AssignableInfo.type*,%m1791$.GlobalName.type*}
@GlobalName_size = constant i32 40
%m1791$.ScopeType.type = type {i8*,%m1791$.AssignableInfo.type*,%m1791$.ScopeType.type*}
@ScopeType_size = constant i32 24
%m1791$.Scope.type = type {i8*,%m1791$.ScopeItem.type*,%m1791$.ScopeType.type*,%m1791$.Scope.type*}
@Scope_size = constant i32 32
%m1791$.ModuleLookup.type = type {i8*,i8*,%m1791$.ModuleLookup.type*,%m1791$.Scope.type*}
@ModuleLookup_size = constant i32 32
%m1791$.CompilerCtx.type = type {%m261$.Node.type*,%m0$.File.type*,%m1791$.ErrorList.type*,%m1791$.GlobalName.type*,i32,%m1791$.ModuleLookup.type*,i8*}
@CompilerCtx_size = constant i32 60
define void @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.info.arg, %m1791$.AssignableInfo.type** %info
%tmp_buff = alloca i8*
%.tmp2379 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2381 = getelementptr [7 x i8], [7 x i8]*@.str2380, i32 0, i32 0
%.tmp2382 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2383 = call i32(%m1791$.CompilerCtx.type*) @m1791$new_uid.i.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp2382)
%.tmp2384 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2379, i8* %.tmp2381, i32 %.tmp2383)
%.tmp2385 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2386 = load i8, i8* @SCOPE_LOCAL
%.tmp2387 = load i8*, i8** %tmp_buff
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp2385, i8 %.tmp2386, i8* %.tmp2387)
ret void
}
define %m1791$.ModuleLookup.type* @m1791$get_module.m1791$.ModuleLookup.typep.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.ctx.arg, i8* %.filename.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2389 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2390 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2389, i32 0, i32 5
%.tmp2391 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %.tmp2390
%m = alloca %m1791$.ModuleLookup.type*
store %m1791$.ModuleLookup.type* %.tmp2391, %m1791$.ModuleLookup.type** %m
br label %.for.start.2388
.for.start.2388:
%.tmp2392 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp2393 = icmp ne %m1791$.ModuleLookup.type* %.tmp2392, null
br i1 %.tmp2393, label %.for.continue.2388, label %.for.end.2388
.for.continue.2388:
%.tmp2394 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp2395 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp2394, i32 0, i32 0
%.tmp2396 = load i8*, i8** %.tmp2395
%.tmp2397 = load i8*, i8** %filename
%.tmp2398 = call i32(i8*,i8*) @strcmp(i8* %.tmp2396, i8* %.tmp2397)
%.tmp2399 = icmp eq i32 %.tmp2398, 0
br i1 %.tmp2399, label %.if.true.2400, label %.if.false.2400
.if.true.2400:
%.tmp2401 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
ret %m1791$.ModuleLookup.type* %.tmp2401
br label %.if.end.2400
.if.false.2400:
br label %.if.end.2400
.if.end.2400:
%.tmp2402 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp2403 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp2402, i32 0, i32 2
%.tmp2404 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %.tmp2403
store %m1791$.ModuleLookup.type* %.tmp2404, %m1791$.ModuleLookup.type** %m
br label %.for.start.2388
.for.end.2388:
%.tmp2405 = bitcast ptr null to %m1791$.ModuleLookup.type*
ret %m1791$.ModuleLookup.type* %.tmp2405
}
define %m1791$.ModuleLookup.type* @m1791$get_current_module.m1791$.ModuleLookup.typep.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%.tmp2406 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2407 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2408 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2407, i32 0, i32 6
%.tmp2409 = load i8*, i8** %.tmp2408
%.tmp2410 = call %m1791$.ModuleLookup.type*(%m1791$.CompilerCtx.type*,i8*) @m1791$get_module.m1791$.ModuleLookup.typep.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.tmp2406, i8* %.tmp2409)
ret %m1791$.ModuleLookup.type* %.tmp2410
}
define i32 @m1791$new_uid.i.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%.tmp2411 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2412 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2411, i32 0, i32 4
%.tmp2413 = load i32, i32* %.tmp2412
%uid = alloca i32
store i32 %.tmp2413, i32* %uid
%.tmp2414 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2415 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2414, i32 0, i32 4
%.tmp2416 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2417 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2416, i32 0, i32 4
%.tmp2418 = load i32, i32* %.tmp2417
%.tmp2419 = add i32 %.tmp2418, 1
store i32 %.tmp2419, i32* %.tmp2415
%.tmp2420 = load i32, i32* %uid
ret i32 %.tmp2420
}
define %m1791$.CompilerCtx.type* @m1791$new_context.m1791$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.fd.arg, i8* %.filename.arg) {
%fd = alloca %m0$.File.type*
store %m0$.File.type* %.fd.arg, %m0$.File.type** %fd
%filename = alloca i8*
store i8* %.filename.arg, i8** %filename
%.tmp2421 = load i32, i32* @CompilerCtx_size
%.tmp2422 = call i8*(i32) @malloc(i32 %.tmp2421)
%.tmp2423 = bitcast i8* %.tmp2422 to %m1791$.CompilerCtx.type*
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.tmp2423, %m1791$.CompilerCtx.type** %ctx
%.tmp2424 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2425 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2424, i32 0, i32 1
%.tmp2426 = load %m0$.File.type*, %m0$.File.type** %fd
store %m0$.File.type* %.tmp2426, %m0$.File.type** %.tmp2425
%.tmp2427 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2428 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2427, i32 0, i32 0
%.tmp2429 = bitcast ptr null to %m261$.Node.type*
store %m261$.Node.type* %.tmp2429, %m261$.Node.type** %.tmp2428
%.tmp2430 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2431 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2430, i32 0, i32 2
store %m1791$.ErrorList.type* null, %m1791$.ErrorList.type** %.tmp2431
%.tmp2432 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2433 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2432, i32 0, i32 4
store i32 0, i32* %.tmp2433
%.tmp2434 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2435 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2434, i32 0, i32 3
store %m1791$.GlobalName.type* null, %m1791$.GlobalName.type** %.tmp2435
%.tmp2436 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2437 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2436, i32 0, i32 6
%.tmp2438 = load i8*, i8** %filename
store i8* %.tmp2438, i8** %.tmp2437
%.tmp2439 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2440 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2439, i32 0, i32 5
%.tmp2441 = load i32, i32* @ModuleLookup_size
%.tmp2442 = call i8*(i32) @malloc(i32 %.tmp2441)
%.tmp2443 = bitcast i8* %.tmp2442 to %m1791$.ModuleLookup.type*
store %m1791$.ModuleLookup.type* %.tmp2443, %m1791$.ModuleLookup.type** %.tmp2440
%.tmp2444 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2445 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2444, i32 0, i32 5
%.tmp2446 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %.tmp2445
%.tmp2447 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp2446, i32 0, i32 0
%.tmp2448 = load i8*, i8** %filename
store i8* %.tmp2448, i8** %.tmp2447
%.tmp2449 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2450 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2449, i32 0, i32 5
%.tmp2451 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %.tmp2450
%.tmp2452 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp2451, i32 0, i32 3
store %m1791$.Scope.type* null, %m1791$.Scope.type** %.tmp2452
%.tmp2453 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2454 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2453, i32 0, i32 5
%.tmp2455 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %.tmp2454
%.tmp2456 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp2455, i32 0, i32 1
%.tmp2458 = getelementptr [1 x i8], [1 x i8]*@.str2457, i32 0, i32 0
store i8* %.tmp2458, i8** %.tmp2456
%.tmp2459 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2460 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2459, i32 0, i32 5
%.tmp2461 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %.tmp2460
%.tmp2462 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp2461, i32 0, i32 2
store %m1791$.ModuleLookup.type* null, %m1791$.ModuleLookup.type** %.tmp2462
%.tmp2463 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2464 = bitcast %m1791$.CompilerCtx.type* %.tmp2463 to %m1791$.CompilerCtx.type*
ret %m1791$.CompilerCtx.type* %.tmp2464
}
define void @m1791$push_scope.v.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%.tmp2465 = load i32, i32* @Scope_size
%.tmp2466 = call i8*(i32) @malloc(i32 %.tmp2465)
%.tmp2467 = bitcast i8* %.tmp2466 to %m1791$.Scope.type*
%s = alloca %m1791$.Scope.type*
store %m1791$.Scope.type* %.tmp2467, %m1791$.Scope.type** %s
%.tmp2468 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2469 = call %m1791$.ModuleLookup.type*(%m1791$.CompilerCtx.type*) @m1791$get_current_module.m1791$.ModuleLookup.typep.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp2468)
%m = alloca %m1791$.ModuleLookup.type*
store %m1791$.ModuleLookup.type* %.tmp2469, %m1791$.ModuleLookup.type** %m
%.tmp2470 = load %m1791$.Scope.type*, %m1791$.Scope.type** %s
%.tmp2471 = getelementptr %m1791$.Scope.type, %m1791$.Scope.type* %.tmp2470, i32 0, i32 3
%.tmp2472 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp2473 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp2472, i32 0, i32 3
%.tmp2474 = load %m1791$.Scope.type*, %m1791$.Scope.type** %.tmp2473
store %m1791$.Scope.type* %.tmp2474, %m1791$.Scope.type** %.tmp2471
%.tmp2475 = load %m1791$.Scope.type*, %m1791$.Scope.type** %s
%.tmp2476 = getelementptr %m1791$.Scope.type, %m1791$.Scope.type* %.tmp2475, i32 0, i32 1
store %m1791$.ScopeItem.type* null, %m1791$.ScopeItem.type** %.tmp2476
%.tmp2477 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp2478 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp2477, i32 0, i32 3
%.tmp2479 = load %m1791$.Scope.type*, %m1791$.Scope.type** %s
store %m1791$.Scope.type* %.tmp2479, %m1791$.Scope.type** %.tmp2478
ret void
}
define void @m1791$pop_scope.v.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%.tmp2480 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2481 = call %m1791$.ModuleLookup.type*(%m1791$.CompilerCtx.type*) @m1791$get_current_module.m1791$.ModuleLookup.typep.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp2480)
%m = alloca %m1791$.ModuleLookup.type*
store %m1791$.ModuleLookup.type* %.tmp2481, %m1791$.ModuleLookup.type** %m
%.tmp2482 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp2483 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp2482, i32 0, i32 3
%.tmp2484 = load %m1791$.Scope.type*, %m1791$.Scope.type** %.tmp2483
%.tmp2485 = icmp ne %m1791$.Scope.type* %.tmp2484, null
%.tmp2487 = getelementptr [61 x i8], [61 x i8]*@.str2486, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp2485, i8* %.tmp2487)
%.tmp2488 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp2489 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp2488, i32 0, i32 3
%.tmp2490 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp2491 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp2490, i32 0, i32 3
%.tmp2492 = load %m1791$.Scope.type*, %m1791$.Scope.type** %.tmp2491
%.tmp2493 = getelementptr %m1791$.Scope.type, %m1791$.Scope.type* %.tmp2492, i32 0, i32 3
%.tmp2494 = load %m1791$.Scope.type*, %m1791$.Scope.type** %.tmp2493
store %m1791$.Scope.type* %.tmp2494, %m1791$.Scope.type** %.tmp2489
ret void
}
define i1 @m1791$compile_file.b.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.ctx.arg, i8* %.filepath.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2496 = getelementptr [13 x i8], [13 x i8]*@.str2495, i32 0, i32 0
%.tmp2498 = getelementptr [2 x i8], [2 x i8]*@.str2497, i32 0, i32 0
%.tmp2499 = call %m0$.File.type*(i8*,i8*) @fopen(i8* %.tmp2496, i8* %.tmp2498)
%grammar_file = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2499, %m0$.File.type** %grammar_file
%.tmp2500 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2501 = call %m261$.ParsingContext.type*(%m0$.File.type*) @m261$new_context.m261$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2500)
%grammar_ctx = alloca %m261$.ParsingContext.type*
store %m261$.ParsingContext.type* %.tmp2501, %m261$.ParsingContext.type** %grammar_ctx
%.tmp2502 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %grammar_ctx
%.tmp2503 = call %m261$.Rule.type**(%m261$.ParsingContext.type*) @m261$parse_grammar.m261$.Rule.typepp.m261$.ParsingContext.typep(%m261$.ParsingContext.type* %.tmp2502)
%grammar = alloca %m261$.Rule.type**
store %m261$.Rule.type** %.tmp2503, %m261$.Rule.type*** %grammar
%.tmp2504 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %grammar_ctx
%.tmp2505 = bitcast %m261$.ParsingContext.type* %.tmp2504 to i8*
call void(i8*) @free(i8* %.tmp2505)
%.tmp2506 = load i8*, i8** %filepath
%.tmp2507 = load i32, i32* @O_RDONLY
%.tmp2508 = call i32(i8*,i32) @open(i8* %.tmp2506, i32 %.tmp2507)
%input_fd = alloca i32
store i32 %.tmp2508, i32* %input_fd
%.tmp2509 = load i32, i32* %input_fd
%.tmp2510 = call %m185$.PeekerInfo.type*(i32) @m185$new.m185$.PeekerInfo.typep.i(i32 %.tmp2509)
%p = alloca %m185$.PeekerInfo.type*
store %m185$.PeekerInfo.type* %.tmp2510, %m185$.PeekerInfo.type** %p
%.tmp2511 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp2512 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp2511, i32 0, i32 6
%.tmp2513 = load i8*, i8** %filepath
store i8* %.tmp2513, i8** %.tmp2512
%.tmp2514 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp2515 = call %m262$.Token.type*(%m185$.PeekerInfo.type*,i1) @m262$tokenize.m262$.Token.typep.m185$.PeekerInfo.typep.b(%m185$.PeekerInfo.type* %.tmp2514, i1 0)
%tokens = alloca %m262$.Token.type*
store %m262$.Token.type* %.tmp2515, %m262$.Token.type** %tokens
%.tmp2516 = load %m261$.Rule.type**, %m261$.Rule.type*** %grammar
%.tmp2518 = getelementptr [6 x i8], [6 x i8]*@.str2517, i32 0, i32 0
%.tmp2519 = load %m262$.Token.type*, %m262$.Token.type** %tokens
%.tmp2520 = call %m261$.ParseResult.type*(%m261$.Rule.type**,i8*,%m262$.Token.type*) @m261$ast.m261$.ParseResult.typep.m261$.Rule.typepp.cp.m262$.Token.typep(%m261$.Rule.type** %.tmp2516, i8* %.tmp2518, %m262$.Token.type* %.tmp2519)
%ast = alloca %m261$.ParseResult.type*
store %m261$.ParseResult.type* %.tmp2520, %m261$.ParseResult.type** %ast
%.tmp2521 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2522 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %ast
%.tmp2523 = getelementptr %m261$.ParseResult.type, %m261$.ParseResult.type* %.tmp2522, i32 0, i32 1
%.tmp2524 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2523
%.tmp2525 = call i1(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile.b.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp2521, %m261$.Node.type* %.tmp2524)
ret i1 %.tmp2525
}
define i1 @m1791$compile.b.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.ast.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%ast = alloca %m261$.Node.type*
store %m261$.Node.type* %.ast.arg, %m261$.Node.type** %ast
%.tmp2526 = load %m261$.Node.type*, %m261$.Node.type** %ast
%.tmp2527 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2526, i32 0, i32 0
%.tmp2528 = load i8*, i8** %.tmp2527
%.tmp2530 = getelementptr [6 x i8], [6 x i8]*@.str2529, i32 0, i32 0
%.tmp2531 = call i32(i8*,i8*) @strcmp(i8* %.tmp2528, i8* %.tmp2530)
%.tmp2532 = icmp ne i32 %.tmp2531, 0
br i1 %.tmp2532, label %.if.true.2533, label %.if.false.2533
.if.true.2533:
ret i1 0
br label %.if.end.2533
.if.false.2533:
br label %.if.end.2533
.if.end.2533:
%.tmp2534 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
call void(%m1791$.CompilerCtx.type*) @m1791$push_scope.v.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp2534)
%.tmp2535 = load %m261$.Node.type*, %m261$.Node.type** %ast
%.tmp2536 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2535, i32 0, i32 6
%.tmp2537 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2536
%start = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp2537, %m261$.Node.type** %start
%.tmp2538 = load %m261$.Node.type*, %m261$.Node.type** %start
%.tmp2539 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2538, i32 0, i32 0
%.tmp2540 = load i8*, i8** %.tmp2539
%.tmp2542 = getelementptr [13 x i8], [13 x i8]*@.str2541, i32 0, i32 0
%.tmp2543 = call i32(i8*,i8*) @strcmp(i8* %.tmp2540, i8* %.tmp2542)
%.tmp2544 = icmp eq i32 %.tmp2543, 0
br i1 %.tmp2544, label %.if.true.2545, label %.if.false.2545
.if.true.2545:
%.tmp2546 = load %m261$.Node.type*, %m261$.Node.type** %start
%.tmp2547 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2546, i32 0, i32 7
%.tmp2548 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2547
store %m261$.Node.type* %.tmp2548, %m261$.Node.type** %start
br label %.if.end.2545
.if.false.2545:
br label %.if.end.2545
.if.end.2545:
%.tmp2550 = load %m261$.Node.type*, %m261$.Node.type** %start
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp2550, %m261$.Node.type** %stmt
br label %.for.start.2549
.for.start.2549:
%.tmp2551 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2552 = icmp ne %m261$.Node.type* %.tmp2551, null
br i1 %.tmp2552, label %.for.continue.2549, label %.for.end.2549
.for.continue.2549:
%.tmp2553 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2554 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2555 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2554, i32 0, i32 6
%.tmp2556 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2555
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i1) @m1791$compile_statement.v.m1791$.CompilerCtx.typep.m261$.Node.typep.b(%m1791$.CompilerCtx.type* %.tmp2553, %m261$.Node.type* %.tmp2556, i1 1)
%.tmp2557 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2558 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2557, i32 0, i32 7
%.tmp2559 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2558
store %m261$.Node.type* %.tmp2559, %m261$.Node.type** %stmt
br label %.for.start.2549
.for.end.2549:
%.tmp2561 = load %m261$.Node.type*, %m261$.Node.type** %start
%s = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp2561, %m261$.Node.type** %s
br label %.for.start.2560
.for.start.2560:
%.tmp2562 = load %m261$.Node.type*, %m261$.Node.type** %s
%.tmp2563 = icmp ne %m261$.Node.type* %.tmp2562, null
br i1 %.tmp2563, label %.for.continue.2560, label %.for.end.2560
.for.continue.2560:
%.tmp2564 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2565 = load %m261$.Node.type*, %m261$.Node.type** %s
%.tmp2566 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2565, i32 0, i32 6
%.tmp2567 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2566
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i1) @m1791$compile_statement.v.m1791$.CompilerCtx.typep.m261$.Node.typep.b(%m1791$.CompilerCtx.type* %.tmp2564, %m261$.Node.type* %.tmp2567, i1 0)
%.tmp2568 = load %m261$.Node.type*, %m261$.Node.type** %s
%.tmp2569 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2568, i32 0, i32 7
%.tmp2570 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2569
store %m261$.Node.type* %.tmp2570, %m261$.Node.type** %s
br label %.for.start.2560
.for.end.2560:
%.tmp2571 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2572 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2571, i32 0, i32 2
%.tmp2573 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %.tmp2572
%.tmp2574 = icmp ne %m1791$.ErrorList.type* %.tmp2573, null
%has_errors = alloca i1
store i1 %.tmp2574, i1* %has_errors
%.tmp2576 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2577 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2576, i32 0, i32 2
%.tmp2578 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %.tmp2577
%err = alloca %m1791$.ErrorList.type*
store %m1791$.ErrorList.type* %.tmp2578, %m1791$.ErrorList.type** %err
br label %.for.start.2575
.for.start.2575:
%.tmp2579 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %err
%.tmp2580 = icmp ne %m1791$.ErrorList.type* %.tmp2579, null
br i1 %.tmp2580, label %.for.continue.2575, label %.for.end.2575
.for.continue.2575:
%.tmp2581 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %err
%.tmp2582 = getelementptr %m1791$.ErrorList.type, %m1791$.ErrorList.type* %.tmp2581, i32 0, i32 0
%.tmp2583 = load %m678$.Error.type*, %m678$.Error.type** %.tmp2582
call void(%m678$.Error.type*) @m678$report.v.m678$.Error.typep(%m678$.Error.type* %.tmp2583)
%.tmp2584 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %err
%.tmp2585 = getelementptr %m1791$.ErrorList.type, %m1791$.ErrorList.type* %.tmp2584, i32 0, i32 1
%.tmp2586 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %.tmp2585
store %m1791$.ErrorList.type* %.tmp2586, %m1791$.ErrorList.type** %err
br label %.for.start.2575
.for.end.2575:
%.tmp2588 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2589 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2588, i32 0, i32 3
%.tmp2590 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %.tmp2589
%g = alloca %m1791$.GlobalName.type*
store %m1791$.GlobalName.type* %.tmp2590, %m1791$.GlobalName.type** %g
br label %.for.start.2587
.for.start.2587:
%.tmp2591 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
%.tmp2592 = icmp ne %m1791$.GlobalName.type* %.tmp2591, null
br i1 %.tmp2592, label %.for.continue.2587, label %.for.end.2587
.for.continue.2587:
%.tmp2593 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2594 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
call void(%m1791$.CompilerCtx.type*,%m1791$.GlobalName.type*) @m1791$compile_global.v.m1791$.CompilerCtx.typep.m1791$.GlobalName.typep(%m1791$.CompilerCtx.type* %.tmp2593, %m1791$.GlobalName.type* %.tmp2594)
%.tmp2595 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
%.tmp2596 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp2595, i32 0, i32 4
%.tmp2597 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %.tmp2596
store %m1791$.GlobalName.type* %.tmp2597, %m1791$.GlobalName.type** %g
br label %.for.start.2587
.for.end.2587:
%.tmp2598 = load i1, i1* %has_errors
ret i1 %.tmp2598
}
define i8* @m1791$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%buf = alloca i8*
%.tmp2599 = load i8*, i8** %text
%.tmp2600 = call i32(i8*) @strlen(i8* %.tmp2599)
%str_len = alloca i32
store i32 %.tmp2600, i32* %str_len
%.tmp2601 = load i32, i32* %str_len
%.tmp2602 = call i8*(i32) @malloc(i32 %.tmp2601)
%substr = alloca i8*
store i8* %.tmp2602, i8** %substr
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.2603
.for.start.2603:
%.tmp2604 = load i32, i32* %i
%.tmp2605 = load i32, i32* %str_len
%.tmp2606 = sub i32 %.tmp2605, 2
%.tmp2607 = icmp slt i32 %.tmp2604, %.tmp2606
br i1 %.tmp2607, label %.for.continue.2603, label %.for.end.2603
.for.continue.2603:
%.tmp2608 = load i32, i32* %i
%.tmp2609 = load i8*, i8** %substr
%.tmp2610 = getelementptr i8, i8* %.tmp2609, i32 %.tmp2608
%.tmp2611 = load i32, i32* %i
%.tmp2612 = add i32 %.tmp2611, 1
%.tmp2613 = load i8*, i8** %text
%.tmp2614 = getelementptr i8, i8* %.tmp2613, i32 %.tmp2612
%.tmp2615 = load i8, i8* %.tmp2614
store i8 %.tmp2615, i8* %.tmp2610
%.tmp2616 = load i32, i32* %i
%.tmp2617 = add i32 %.tmp2616, 1
store i32 %.tmp2617, i32* %i
br label %.for.start.2603
.for.end.2603:
%.tmp2618 = load i32, i32* %str_len
%.tmp2619 = sub i32 %.tmp2618, 2
%.tmp2620 = load i8*, i8** %substr
%.tmp2621 = getelementptr i8, i8* %.tmp2620, i32 %.tmp2619
store i8 0, i8* %.tmp2621
%.tmp2622 = getelementptr i8*, i8** %buf, i32 0
%.tmp2624 = getelementptr [9 x i8], [9 x i8]*@.str2623, i32 0, i32 0
%.tmp2625 = load i8*, i8** %substr
%.tmp2626 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2622, i8* %.tmp2624, i8* %.tmp2625)
%.tmp2627 = load i8*, i8** %substr
call void(i8*) @free(i8* %.tmp2627)
%.tmp2628 = load i8*, i8** %buf
ret i8* %.tmp2628
}
define void @m1791$compile_global.v.m1791$.CompilerCtx.typep.m1791$.GlobalName.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%g = alloca %m1791$.GlobalName.type*
store %m1791$.GlobalName.type* %.g.arg, %m1791$.GlobalName.type** %g
%.tmp2629 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
%.tmp2630 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp2629, i32 0, i32 2
%.tmp2631 = load i1, i1* %.tmp2630
%.tmp2632 = icmp eq i1 %.tmp2631, 0
%.tmp2633 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
%.tmp2634 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp2633, i32 0, i32 1
%.tmp2635 = load i8*, i8** %.tmp2634
%.tmp2637 = getelementptr [7 x i8], [7 x i8]*@.str2636, i32 0, i32 0
%.tmp2638 = call i32(i8*,i8*) @strcmp(i8* %.tmp2635, i8* %.tmp2637)
%.tmp2639 = icmp eq i32 %.tmp2638, 0
%.tmp2640 = and i1 %.tmp2632, %.tmp2639
br i1 %.tmp2640, label %.if.true.2641, label %.if.false.2641
.if.true.2641:
%.tmp2642 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
%.tmp2643 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp2642, i32 0, i32 0
%.tmp2644 = load i8*, i8** %.tmp2643
%.tmp2645 = call i8*(i8*) @m1791$string_to_llvm.cp.cp(i8* %.tmp2644)
%repr = alloca i8*
store i8* %.tmp2645, i8** %repr
%.tmp2646 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2647 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2646, i32 0, i32 1
%.tmp2648 = load %m0$.File.type*, %m0$.File.type** %.tmp2647
%.tmp2650 = getelementptr [21 x i8], [21 x i8]*@.str2649, i32 0, i32 0
%.tmp2651 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
%.tmp2652 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp2651, i32 0, i32 3
%.tmp2653 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp2652
%.tmp2654 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp2653)
%.tmp2655 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2656 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
%.tmp2657 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp2656, i32 0, i32 3
%.tmp2658 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp2657
%.tmp2659 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2658, i32 0, i32 3
%.tmp2660 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2659
%.tmp2661 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp2655, %m1791$.Type.type* %.tmp2660)
%.tmp2662 = load i8*, i8** %repr
%.tmp2663 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2648, i8* %.tmp2650, i8* %.tmp2654, i8* %.tmp2661, i8* %.tmp2662)
%.tmp2664 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
%.tmp2665 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp2664, i32 0, i32 2
store i1 1, i1* %.tmp2665
br label %.if.end.2641
.if.false.2641:
br label %.if.end.2641
.if.end.2641:
ret void
}
define i8* @m1791$get_mod_prefix.cp.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp2666 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2667 = call %m1791$.ModuleLookup.type*(%m1791$.CompilerCtx.type*) @m1791$get_current_module.m1791$.ModuleLookup.typep.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp2666)
%m = alloca %m1791$.ModuleLookup.type*
store %m1791$.ModuleLookup.type* %.tmp2667, %m1791$.ModuleLookup.type** %m
%.tmp2668 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp2669 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp2668, i32 0, i32 1
%.tmp2670 = load i8*, i8** %.tmp2669
ret i8* %.tmp2670
}
define i8* @m1791$name_mangle.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.fn.arg, i8* %.original_name.arg, %m1791$.Type.type* %.type.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%fn = alloca %m261$.Node.type*
store %m261$.Node.type* %.fn.arg, %m261$.Node.type** %fn
%original_name = alloca i8*
store i8* %.original_name.arg, i8** %original_name
%type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.type.arg, %m1791$.Type.type** %type
%mangled_name = alloca i8*
%.tmp2671 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2672 = load %m261$.Node.type*, %m261$.Node.type** %fn
%.tmp2673 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2672, i32 0, i32 2
%.tmp2674 = load i8*, i8** %.tmp2673
%.tmp2675 = call i8*(%m1791$.CompilerCtx.type*,i8*) @m1791$get_mod_prefix.cp.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.tmp2671, i8* %.tmp2674)
%prefix = alloca i8*
store i8* %.tmp2675, i8** %prefix
%.tmp2676 = getelementptr i8*, i8** %mangled_name, i32 0
%.tmp2678 = getelementptr [5 x i8], [5 x i8]*@.str2677, i32 0, i32 0
%.tmp2679 = load i8*, i8** %prefix
%.tmp2680 = load i8*, i8** %original_name
%.tmp2681 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2676, i8* %.tmp2678, i8* %.tmp2679, i8* %.tmp2680)
%.tmp2682 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp2683 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2682, i32 0, i32 0
%.tmp2684 = load i8*, i8** %.tmp2683
%.tmp2686 = getelementptr [9 x i8], [9 x i8]*@.str2685, i32 0, i32 0
%.tmp2687 = call i32(i8*,i8*) @strcmp(i8* %.tmp2684, i8* %.tmp2686)
%.tmp2688 = icmp eq i32 %.tmp2687, 0
br i1 %.tmp2688, label %.if.true.2689, label %.if.false.2689
.if.true.2689:
%.tmp2690 = load i8*, i8** %mangled_name
%.tmp2692 = getelementptr [5 x i8], [5 x i8]*@.str2691, i32 0, i32 0
%.tmp2693 = call i32(i8*,i8*) @strcmp(i8* %.tmp2690, i8* %.tmp2692)
%.tmp2694 = icmp ne i32 %.tmp2693, 0
br i1 %.tmp2694, label %.if.true.2695, label %.if.false.2695
.if.true.2695:
%tmp_buff = alloca i8*
%swap_var = alloca i8*
%.tmp2697 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp2698 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2697, i32 0, i32 3
%.tmp2699 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2698
%tp = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp2699, %m1791$.Type.type** %tp
br label %.for.start.2696
.for.start.2696:
%.tmp2700 = load %m1791$.Type.type*, %m1791$.Type.type** %tp
%.tmp2701 = icmp ne %m1791$.Type.type* %.tmp2700, null
br i1 %.tmp2701, label %.for.continue.2696, label %.for.end.2696
.for.continue.2696:
%.tmp2702 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2704 = getelementptr [6 x i8], [6 x i8]*@.str2703, i32 0, i32 0
%.tmp2705 = load i8*, i8** %mangled_name
%.tmp2706 = load %m1791$.Type.type*, %m1791$.Type.type** %tp
%.tmp2707 = call i8*(%m1791$.Type.type*) @m1791$type_abbr.cp.m1791$.Type.typep(%m1791$.Type.type* %.tmp2706)
%.tmp2708 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2702, i8* %.tmp2704, i8* %.tmp2705, i8* %.tmp2707)
%.tmp2709 = load i8*, i8** %tmp_buff
store i8* %.tmp2709, i8** %swap_var
%.tmp2710 = load i8*, i8** %mangled_name
store i8* %.tmp2710, i8** %tmp_buff
%.tmp2711 = load i8*, i8** %swap_var
store i8* %.tmp2711, i8** %mangled_name
%.tmp2712 = load i8*, i8** %tmp_buff
call void(i8*) @free(i8* %.tmp2712)
%.tmp2713 = load %m1791$.Type.type*, %m1791$.Type.type** %tp
%.tmp2714 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2713, i32 0, i32 4
%.tmp2715 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2714
store %m1791$.Type.type* %.tmp2715, %m1791$.Type.type** %tp
br label %.for.start.2696
.for.end.2696:
br label %.if.end.2695
.if.false.2695:
br label %.if.end.2695
.if.end.2695:
br label %.if.end.2689
.if.false.2689:
br label %.if.end.2689
.if.end.2689:
%.tmp2716 = load i8*, i8** %mangled_name
ret i8* %.tmp2716
}
define void @m1791$compile_statement.v.m1791$.CompilerCtx.typep.m261$.Node.typep.b(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg, i1 %.shallow.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%shallow = alloca i1
store i1 %.shallow.arg, i1* %shallow
%info = alloca %m1791$.AssignableInfo.type*
%return_type = alloca %m1791$.Type.type*
%err_buf = alloca i8*
%tmp_buff = alloca i8*
%.tmp2717 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2718 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2717, i32 0, i32 0
%.tmp2719 = load i8*, i8** %.tmp2718
%.tmp2721 = getelementptr [3 x i8], [3 x i8]*@.str2720, i32 0, i32 0
%.tmp2722 = call i32(i8*,i8*) @strcmp(i8* %.tmp2719, i8* %.tmp2721)
%.tmp2723 = icmp eq i32 %.tmp2722, 0
br i1 %.tmp2723, label %.if.true.2724, label %.if.false.2724
.if.true.2724:
ret void
br label %.if.end.2724
.if.false.2724:
%.tmp2725 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2726 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2725, i32 0, i32 0
%.tmp2727 = load i8*, i8** %.tmp2726
%.tmp2729 = getelementptr [7 x i8], [7 x i8]*@.str2728, i32 0, i32 0
%.tmp2730 = call i32(i8*,i8*) @strcmp(i8* %.tmp2727, i8* %.tmp2729)
%.tmp2731 = icmp eq i32 %.tmp2730, 0
br i1 %.tmp2731, label %.if.true.2732, label %.if.false.2732
.if.true.2732:
%.tmp2733 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2734 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2733, i32 0, i32 6
%.tmp2735 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2734
%.tmp2737 = getelementptr [11 x i8], [11 x i8]*@.str2736, i32 0, i32 0
%.tmp2738 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp2735, i8* %.tmp2737)
%assignable = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp2738, %m261$.Node.type** %assignable
%.tmp2739 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2740 = load %m261$.Node.type*, %m261$.Node.type** %assignable
%.tmp2741 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp2739, %m261$.Node.type* %.tmp2740)
%a_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp2741, %m1791$.AssignableInfo.type** %a_info
%.tmp2742 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp2743 = icmp eq %m1791$.AssignableInfo.type* %.tmp2742, null
br i1 %.tmp2743, label %.if.true.2744, label %.if.false.2744
.if.true.2744:
ret void
br label %.if.end.2744
.if.false.2744:
br label %.if.end.2744
.if.end.2744:
%.tmp2745 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2746 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp2745)
store %m1791$.AssignableInfo.type* %.tmp2746, %m1791$.AssignableInfo.type** %info
%.tmp2747 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2748 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2747, i32 0, i32 6
%.tmp2749 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2748
%.tmp2750 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2749, i32 0, i32 7
%.tmp2751 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2750
%.tmp2752 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2751, i32 0, i32 1
%.tmp2753 = load i8*, i8** %.tmp2752
%global_name = alloca i8*
store i8* %.tmp2753, i8** %global_name
%.tmp2754 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2755 = load i8, i8* @SCOPE_GLOBAL
%.tmp2756 = load i8*, i8** %global_name
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp2754, i8 %.tmp2755, i8* %.tmp2756)
%.tmp2757 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2758 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2757, i32 0, i32 3
%.tmp2759 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp2760 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2759, i32 0, i32 3
%.tmp2761 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2760
store %m1791$.Type.type* %.tmp2761, %m1791$.Type.type** %.tmp2758
%.tmp2762 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2763 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2762, i32 0, i32 2
%.tmp2765 = getelementptr [9 x i8], [9 x i8]*@.str2764, i32 0, i32 0
store i8* %.tmp2765, i8** %.tmp2763
%.tmp2766 = load i1, i1* %shallow
%.tmp2767 = icmp eq i1 %.tmp2766, 1
br i1 %.tmp2767, label %.if.true.2768, label %.if.false.2768
.if.true.2768:
%.tmp2769 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2770 = load i8*, i8** %global_name
%.tmp2771 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
call void(%m1791$.CompilerCtx.type*,i8*,%m1791$.AssignableInfo.type*) @m1791$define_assignable.v.m1791$.CompilerCtx.typep.cp.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp2769, i8* %.tmp2770, %m1791$.AssignableInfo.type* %.tmp2771)
br label %.if.end.2768
.if.false.2768:
%.tmp2772 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2773 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2772, i32 0, i32 1
%.tmp2774 = load %m0$.File.type*, %m0$.File.type** %.tmp2773
%.tmp2776 = getelementptr [21 x i8], [21 x i8]*@.str2775, i32 0, i32 0
%.tmp2777 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2778 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp2777)
%.tmp2779 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2780 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2781 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2780, i32 0, i32 3
%.tmp2782 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2781
%.tmp2783 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp2779, %m1791$.Type.type* %.tmp2782)
%.tmp2784 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp2785 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp2784)
%.tmp2786 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2774, i8* %.tmp2776, i8* %.tmp2778, i8* %.tmp2783, i8* %.tmp2785)
br label %.if.end.2768
.if.end.2768:
br label %.if.end.2732
.if.false.2732:
%.tmp2787 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2788 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2787, i32 0, i32 0
%.tmp2789 = load i8*, i8** %.tmp2788
%.tmp2791 = getelementptr [10 x i8], [10 x i8]*@.str2790, i32 0, i32 0
%.tmp2792 = call i32(i8*,i8*) @strcmp(i8* %.tmp2789, i8* %.tmp2791)
%.tmp2793 = icmp eq i32 %.tmp2792, 0
br i1 %.tmp2793, label %.if.true.2794, label %.if.false.2794
.if.true.2794:
%.tmp2795 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2796 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2795, i32 0, i32 6
%.tmp2797 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2796
%.tmp2798 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2797, i32 0, i32 7
%.tmp2799 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2798
%.tmp2800 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2799, i32 0, i32 1
%.tmp2801 = load i8*, i8** %.tmp2800
%type_name = alloca i8*
store i8* %.tmp2801, i8** %type_name
%.tmp2802 = load i1, i1* %shallow
%.tmp2803 = icmp eq i1 %.tmp2802, 1
br i1 %.tmp2803, label %.if.true.2804, label %.if.false.2804
.if.true.2804:
%.tmp2805 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2806 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp2805)
store %m1791$.AssignableInfo.type* %.tmp2806, %m1791$.AssignableInfo.type** %info
%.tmp2807 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2808 = call %m1791$.ModuleLookup.type*(%m1791$.CompilerCtx.type*) @m1791$get_current_module.m1791$.ModuleLookup.typep.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp2807)
%mod_from = alloca %m1791$.ModuleLookup.type*
store %m1791$.ModuleLookup.type* %.tmp2808, %m1791$.ModuleLookup.type** %mod_from
%.tmp2809 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2811 = getelementptr [11 x i8], [11 x i8]*@.str2810, i32 0, i32 0
%.tmp2812 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod_from
%.tmp2813 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp2812, i32 0, i32 1
%.tmp2814 = load i8*, i8** %.tmp2813
%.tmp2815 = load i8*, i8** %type_name
%.tmp2816 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2809, i8* %.tmp2811, i8* %.tmp2814, i8* %.tmp2815)
%.tmp2817 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2818 = load i8, i8* @SCOPE_LOCAL
%.tmp2819 = load i8*, i8** %tmp_buff
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp2817, i8 %.tmp2818, i8* %.tmp2819)
%.tmp2820 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2821 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2820, i32 0, i32 2
%.tmp2823 = getelementptr [10 x i8], [10 x i8]*@.str2822, i32 0, i32 0
store i8* %.tmp2823, i8** %.tmp2821
%.tmp2824 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2825 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2824, i32 0, i32 4
%.tmp2826 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2827 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2826, i32 0, i32 3
%.tmp2828 = load i32, i32* %.tmp2827
store i32 %.tmp2828, i32* %.tmp2825
%.tmp2829 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2830 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2829, i32 0, i32 5
%.tmp2831 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2832 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2831, i32 0, i32 4
%.tmp2833 = load i32, i32* %.tmp2832
store i32 %.tmp2833, i32* %.tmp2830
%.tmp2834 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2835 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2834, i32 0, i32 3
%.tmp2836 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp2836, %m1791$.Type.type** %.tmp2835
%.tmp2837 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2838 = load i8*, i8** %type_name
%.tmp2839 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
call void(%m1791$.CompilerCtx.type*,i8*,%m1791$.AssignableInfo.type*) @m1791$define_assignable.v.m1791$.CompilerCtx.typep.cp.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp2837, i8* %.tmp2838, %m1791$.AssignableInfo.type* %.tmp2839)
%.tmp2840 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2841 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2840, i32 0, i32 6
%.tmp2842 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2841
%.tmp2844 = getelementptr [5 x i8], [5 x i8]*@.str2843, i32 0, i32 0
%.tmp2845 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp2842, i8* %.tmp2844)
%type_decl = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp2845, %m261$.Node.type** %type_decl
%.tmp2846 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2847 = load %m261$.Node.type*, %m261$.Node.type** %type_decl
%.tmp2848 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2847, i32 0, i32 6
%.tmp2849 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2848
%.tmp2850 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp2846, %m261$.Node.type* %.tmp2849)
%type_struct = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp2850, %m1791$.Type.type** %type_struct
%.tmp2851 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2852 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2851, i32 0, i32 3
%.tmp2853 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2852
%.tmp2854 = load %m1791$.Type.type*, %m1791$.Type.type** %type_struct
call void(%m1791$.Type.type*,%m1791$.Type.type*) @m1791$copy_type.v.m1791$.Type.typep.m1791$.Type.typep(%m1791$.Type.type* %.tmp2853, %m1791$.Type.type* %.tmp2854)
%.tmp2855 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2856 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2855, i32 0, i32 3
%.tmp2857 = load %m1791$.Type.type*, %m1791$.Type.type** %type_struct
store %m1791$.Type.type* %.tmp2857, %m1791$.Type.type** %.tmp2856
br label %.if.end.2804
.if.false.2804:
%.tmp2858 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2859 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2860 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2859, i32 0, i32 6
%.tmp2861 = load i8*, i8** %.tmp2860
%.tmp2862 = load i8*, i8** %type_name
%.tmp2863 = call %m1791$.ScopeItem.type*(%m1791$.CompilerCtx.type*,i8*,i8*) @m1791$find_defined_str.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.cp.cp(%m1791$.CompilerCtx.type* %.tmp2858, i8* %.tmp2861, i8* %.tmp2862)
%scope = alloca %m1791$.ScopeItem.type*
store %m1791$.ScopeItem.type* %.tmp2863, %m1791$.ScopeItem.type** %scope
%.tmp2864 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %scope
%.tmp2865 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp2864, i32 0, i32 1
%.tmp2866 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp2865
store %m1791$.AssignableInfo.type* %.tmp2866, %m1791$.AssignableInfo.type** %info
%.tmp2867 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2868 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2867, i32 0, i32 1
%.tmp2869 = load %m0$.File.type*, %m0$.File.type** %.tmp2868
%.tmp2871 = getelementptr [14 x i8], [14 x i8]*@.str2870, i32 0, i32 0
%.tmp2872 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2873 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp2872)
%.tmp2874 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2875 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2876 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2875, i32 0, i32 3
%.tmp2877 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2876
%.tmp2878 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp2874, %m1791$.Type.type* %.tmp2877)
%.tmp2879 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2869, i8* %.tmp2871, i8* %.tmp2873, i8* %.tmp2878)
br label %.if.end.2804
.if.end.2804:
br label %.if.end.2794
.if.false.2794:
%.tmp2880 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2881 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2880, i32 0, i32 0
%.tmp2882 = load i8*, i8** %.tmp2881
%.tmp2884 = getelementptr [7 x i8], [7 x i8]*@.str2883, i32 0, i32 0
%.tmp2885 = call i32(i8*,i8*) @strcmp(i8* %.tmp2882, i8* %.tmp2884)
%.tmp2886 = icmp eq i32 %.tmp2885, 0
br i1 %.tmp2886, label %.if.true.2887, label %.if.false.2887
.if.true.2887:
%.tmp2888 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2889 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp2888)
store %m1791$.AssignableInfo.type* %.tmp2889, %m1791$.AssignableInfo.type** %info
%.tmp2890 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2891 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2890, i32 0, i32 3
%.tmp2892 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2893 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2894 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2893, i32 0, i32 6
%.tmp2895 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2894
%.tmp2896 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2895, i32 0, i32 7
%.tmp2897 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2896
%.tmp2898 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$syn_function_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp2892, %m261$.Node.type* %.tmp2897)
store %m1791$.Type.type* %.tmp2898, %m1791$.Type.type** %.tmp2891
%.tmp2899 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2900 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2899, i32 0, i32 2
%.tmp2902 = getelementptr [7 x i8], [7 x i8]*@.str2901, i32 0, i32 0
store i8* %.tmp2902, i8** %.tmp2900
%.tmp2903 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2904 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2903, i32 0, i32 6
%.tmp2905 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2904
%.tmp2906 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2905, i32 0, i32 7
%.tmp2907 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2906
%.tmp2908 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2907, i32 0, i32 7
%.tmp2909 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2908
%.tmp2910 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2909, i32 0, i32 1
%.tmp2911 = load i8*, i8** %.tmp2910
%fn_name = alloca i8*
store i8* %.tmp2911, i8** %fn_name
%.tmp2912 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2913 = load i8, i8* @SCOPE_GLOBAL
%.tmp2914 = load i8*, i8** %fn_name
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp2912, i8 %.tmp2913, i8* %.tmp2914)
%.tmp2915 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2916 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2915, i32 0, i32 4
%.tmp2917 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2918 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2917, i32 0, i32 3
%.tmp2919 = load i32, i32* %.tmp2918
store i32 %.tmp2919, i32* %.tmp2916
%.tmp2920 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2921 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2920, i32 0, i32 5
%.tmp2922 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2923 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2922, i32 0, i32 4
%.tmp2924 = load i32, i32* %.tmp2923
store i32 %.tmp2924, i32* %.tmp2921
%.tmp2925 = load i32, i32* @Type_size
%.tmp2926 = call i8*(i32) @malloc(i32 %.tmp2925)
%.tmp2927 = bitcast i8* %.tmp2926 to %m1791$.Type.type*
store %m1791$.Type.type* %.tmp2927, %m1791$.Type.type** %return_type
%.tmp2928 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp2929 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2928, i32 0, i32 4
store %m1791$.Type.type* null, %m1791$.Type.type** %.tmp2929
%.tmp2930 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp2931 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2930, i32 0, i32 1
store i8* null, i8** %.tmp2931
%.tmp2932 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp2933 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2932, i32 0, i32 0
%.tmp2934 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2935 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2934, i32 0, i32 3
%.tmp2936 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2935
%.tmp2937 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2936, i32 0, i32 3
%.tmp2938 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2937
%.tmp2939 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2938, i32 0, i32 0
%.tmp2940 = load i8*, i8** %.tmp2939
store i8* %.tmp2940, i8** %.tmp2933
%.tmp2941 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp2942 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2941, i32 0, i32 3
%.tmp2943 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2944 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2943, i32 0, i32 3
%.tmp2945 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2944
%.tmp2946 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2945, i32 0, i32 3
%.tmp2947 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2946
%.tmp2948 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2947, i32 0, i32 3
%.tmp2949 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2948
store %m1791$.Type.type* %.tmp2949, %m1791$.Type.type** %.tmp2942
%.tmp2950 = load i1, i1* %shallow
%.tmp2951 = icmp eq i1 %.tmp2950, 0
br i1 %.tmp2951, label %.if.true.2952, label %.if.false.2952
.if.true.2952:
%.tmp2953 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2954 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2953, i32 0, i32 1
%.tmp2955 = load %m0$.File.type*, %m0$.File.type** %.tmp2954
%.tmp2957 = getelementptr [15 x i8], [15 x i8]*@.str2956, i32 0, i32 0
%.tmp2958 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2959 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp2960 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp2958, %m1791$.Type.type* %.tmp2959)
%.tmp2961 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2962 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp2961)
%.tmp2963 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2955, i8* %.tmp2957, i8* %.tmp2960, i8* %.tmp2962)
%.tmp2965 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2966 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2965, i32 0, i32 3
%.tmp2967 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2966
%.tmp2968 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2967, i32 0, i32 3
%.tmp2969 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2968
%.tmp2970 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2969, i32 0, i32 4
%.tmp2971 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2970
%pt = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp2971, %m1791$.Type.type** %pt
br label %.for.start.2964
.for.start.2964:
%.tmp2972 = load %m1791$.Type.type*, %m1791$.Type.type** %pt
%.tmp2973 = icmp ne %m1791$.Type.type* %.tmp2972, null
br i1 %.tmp2973, label %.for.continue.2964, label %.for.end.2964
.for.continue.2964:
%.tmp2974 = load %m1791$.Type.type*, %m1791$.Type.type** %pt
%.tmp2975 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2976 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2975, i32 0, i32 3
%.tmp2977 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2976
%.tmp2978 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2977, i32 0, i32 3
%.tmp2979 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2978
%.tmp2980 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2979, i32 0, i32 4
%.tmp2981 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2980
%.tmp2982 = icmp ne %m1791$.Type.type* %.tmp2974, %.tmp2981
br i1 %.tmp2982, label %.if.true.2983, label %.if.false.2983
.if.true.2983:
%.tmp2984 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2985 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2984, i32 0, i32 1
%.tmp2986 = load %m0$.File.type*, %m0$.File.type** %.tmp2985
%.tmp2988 = getelementptr [3 x i8], [3 x i8]*@.str2987, i32 0, i32 0
%.tmp2989 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2986, i8* %.tmp2988)
br label %.if.end.2983
.if.false.2983:
br label %.if.end.2983
.if.end.2983:
%.tmp2990 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2991 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2990, i32 0, i32 1
%.tmp2992 = load %m0$.File.type*, %m0$.File.type** %.tmp2991
%.tmp2994 = getelementptr [3 x i8], [3 x i8]*@.str2993, i32 0, i32 0
%.tmp2995 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2996 = load %m1791$.Type.type*, %m1791$.Type.type** %pt
%.tmp2997 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp2995, %m1791$.Type.type* %.tmp2996)
%.tmp2998 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2992, i8* %.tmp2994, i8* %.tmp2997)
%.tmp2999 = load %m1791$.Type.type*, %m1791$.Type.type** %pt
%.tmp3000 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2999, i32 0, i32 4
%.tmp3001 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3000
store %m1791$.Type.type* %.tmp3001, %m1791$.Type.type** %pt
br label %.for.start.2964
.for.end.2964:
%.tmp3002 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3003 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3002, i32 0, i32 1
%.tmp3004 = load %m0$.File.type*, %m0$.File.type** %.tmp3003
%.tmp3006 = getelementptr [3 x i8], [3 x i8]*@.str3005, i32 0, i32 0
%.tmp3007 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3004, i8* %.tmp3006)
%.tmp3008 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp3009 = bitcast %m1791$.Type.type* %.tmp3008 to i8*
call void(i8*) @free(i8* %.tmp3009)
br label %.if.end.2952
.if.false.2952:
%.tmp3010 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3011 = load i8*, i8** %fn_name
%.tmp3012 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
call void(%m1791$.CompilerCtx.type*,i8*,%m1791$.AssignableInfo.type*) @m1791$define_assignable.v.m1791$.CompilerCtx.typep.cp.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp3010, i8* %.tmp3011, %m1791$.AssignableInfo.type* %.tmp3012)
br label %.if.end.2952
.if.end.2952:
br label %.if.end.2887
.if.false.2887:
%.tmp3013 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3014 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3013, i32 0, i32 0
%.tmp3015 = load i8*, i8** %.tmp3014
%.tmp3017 = getelementptr [9 x i8], [9 x i8]*@.str3016, i32 0, i32 0
%.tmp3018 = call i32(i8*,i8*) @strcmp(i8* %.tmp3015, i8* %.tmp3017)
%.tmp3019 = icmp eq i32 %.tmp3018, 0
br i1 %.tmp3019, label %.if.true.3020, label %.if.false.3020
.if.true.3020:
%.tmp3021 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3022 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp3021)
store %m1791$.AssignableInfo.type* %.tmp3022, %m1791$.AssignableInfo.type** %info
%.tmp3023 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3024 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3023, i32 0, i32 2
%.tmp3026 = getelementptr [9 x i8], [9 x i8]*@.str3025, i32 0, i32 0
store i8* %.tmp3026, i8** %.tmp3024
%.tmp3027 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3028 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3027, i32 0, i32 3
%.tmp3029 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3030 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3031 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3030, i32 0, i32 6
%.tmp3032 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3031
%.tmp3033 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$syn_function_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3029, %m261$.Node.type* %.tmp3032)
store %m1791$.Type.type* %.tmp3033, %m1791$.Type.type** %.tmp3028
%.tmp3034 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3035 = call i8*(%m261$.Node.type*) @m1791$syn_function_name.cp.m261$.Node.typep(%m261$.Node.type* %.tmp3034)
%name = alloca i8*
store i8* %.tmp3035, i8** %name
%.tmp3036 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3037 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3038 = load i8*, i8** %name
%.tmp3039 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3040 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3039, i32 0, i32 3
%.tmp3041 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3040
%.tmp3042 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*,%m1791$.Type.type*) @m1791$name_mangle.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3036, %m261$.Node.type* %.tmp3037, i8* %.tmp3038, %m1791$.Type.type* %.tmp3041)
store i8* %.tmp3042, i8** %tmp_buff
%.tmp3043 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3044 = load i8, i8* @SCOPE_GLOBAL
%.tmp3045 = load i8*, i8** %tmp_buff
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp3043, i8 %.tmp3044, i8* %.tmp3045)
%.tmp3046 = load i1, i1* %shallow
%.tmp3047 = icmp eq i1 %.tmp3046, 1
br i1 %.tmp3047, label %.if.true.3048, label %.if.false.3048
.if.true.3048:
%.tmp3049 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3050 = load i8*, i8** %name
%.tmp3051 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
call void(%m1791$.CompilerCtx.type*,i8*,%m1791$.AssignableInfo.type*) @m1791$define_assignable.v.m1791$.CompilerCtx.typep.cp.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp3049, i8* %.tmp3050, %m1791$.AssignableInfo.type* %.tmp3051)
br label %.if.end.3048
.if.false.3048:
%.tmp3052 = load i32, i32* @Type_size
%.tmp3053 = call i8*(i32) @malloc(i32 %.tmp3052)
%.tmp3054 = bitcast i8* %.tmp3053 to %m1791$.Type.type*
store %m1791$.Type.type* %.tmp3054, %m1791$.Type.type** %return_type
%.tmp3055 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp3056 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3055, i32 0, i32 1
store i8* null, i8** %.tmp3056
%.tmp3057 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp3058 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3057, i32 0, i32 4
store %m1791$.Type.type* null, %m1791$.Type.type** %.tmp3058
%.tmp3059 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp3060 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3059, i32 0, i32 0
%.tmp3061 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3062 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3061, i32 0, i32 3
%.tmp3063 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3062
%.tmp3064 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3063, i32 0, i32 3
%.tmp3065 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3064
%.tmp3066 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3065, i32 0, i32 0
%.tmp3067 = load i8*, i8** %.tmp3066
store i8* %.tmp3067, i8** %.tmp3060
%.tmp3068 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp3069 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3068, i32 0, i32 3
%.tmp3070 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3071 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3070, i32 0, i32 3
%.tmp3072 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3071
%.tmp3073 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3072, i32 0, i32 3
%.tmp3074 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3073
%.tmp3075 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3074, i32 0, i32 3
%.tmp3076 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3075
store %m1791$.Type.type* %.tmp3076, %m1791$.Type.type** %.tmp3069
%.tmp3077 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3078 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3077, i32 0, i32 1
%.tmp3079 = load %m0$.File.type*, %m0$.File.type** %.tmp3078
%.tmp3081 = getelementptr [14 x i8], [14 x i8]*@.str3080, i32 0, i32 0
%.tmp3082 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3083 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp3084 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3082, %m1791$.Type.type* %.tmp3083)
%.tmp3085 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3086 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3085)
%.tmp3087 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3079, i8* %.tmp3081, i8* %.tmp3084, i8* %.tmp3086)
%.tmp3088 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3089 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3088, i32 0, i32 6
%.tmp3090 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3089
%.tmp3091 = call %m261$.Node.type*(%m261$.Node.type*) @m1791$syn_function_params.m261$.Node.typep.m261$.Node.typep(%m261$.Node.type* %.tmp3090)
%params = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3091, %m261$.Node.type** %params
%param_type = alloca %m1791$.Type.type*
%.tmp3093 = load %m261$.Node.type*, %m261$.Node.type** %params
%param_ptr = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3093, %m261$.Node.type** %param_ptr
br label %.for.start.3092
.for.start.3092:
%.tmp3094 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3095 = icmp ne %m261$.Node.type* %.tmp3094, null
br i1 %.tmp3095, label %.for.continue.3092, label %.for.end.3092
.for.continue.3092:
%.tmp3096 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3097 = load %m261$.Node.type*, %m261$.Node.type** %params
%.tmp3098 = icmp ne %m261$.Node.type* %.tmp3096, %.tmp3097
br i1 %.tmp3098, label %.if.true.3099, label %.if.false.3099
.if.true.3099:
%.tmp3100 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3101 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3100, i32 0, i32 7
%.tmp3102 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3101
store %m261$.Node.type* %.tmp3102, %m261$.Node.type** %param_ptr
%.tmp3103 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3104 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3103, i32 0, i32 1
%.tmp3105 = load %m0$.File.type*, %m0$.File.type** %.tmp3104
%.tmp3107 = getelementptr [3 x i8], [3 x i8]*@.str3106, i32 0, i32 0
%.tmp3108 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3105, i8* %.tmp3107)
br label %.if.end.3099
.if.false.3099:
br label %.if.end.3099
.if.end.3099:
%.tmp3109 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3110 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3109, i32 0, i32 0
%.tmp3111 = load i8*, i8** %.tmp3110
%.tmp3113 = getelementptr [5 x i8], [5 x i8]*@.str3112, i32 0, i32 0
%.tmp3114 = call i32(i8*,i8*) @strcmp(i8* %.tmp3111, i8* %.tmp3113)
%.tmp3115 = icmp eq i32 %.tmp3114, 0
br i1 %.tmp3115, label %.if.true.3116, label %.if.false.3116
.if.true.3116:
%.tmp3117 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3118 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3119 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3118, i32 0, i32 6
%.tmp3120 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3119
%.tmp3121 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3117, %m261$.Node.type* %.tmp3120)
store %m1791$.Type.type* %.tmp3121, %m1791$.Type.type** %param_type
%.tmp3122 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3123 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3122, i32 0, i32 7
%.tmp3124 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3123
store %m261$.Node.type* %.tmp3124, %m261$.Node.type** %param_ptr
br label %.if.end.3116
.if.false.3116:
br label %.if.end.3116
.if.end.3116:
%.tmp3125 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3126 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3125, i32 0, i32 1
%.tmp3127 = load %m0$.File.type*, %m0$.File.type** %.tmp3126
%.tmp3129 = getelementptr [13 x i8], [13 x i8]*@.str3128, i32 0, i32 0
%.tmp3130 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3131 = load %m1791$.Type.type*, %m1791$.Type.type** %param_type
%.tmp3132 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3130, %m1791$.Type.type* %.tmp3131)
%.tmp3133 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3134 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3133, i32 0, i32 1
%.tmp3135 = load i8*, i8** %.tmp3134
%.tmp3136 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3127, i8* %.tmp3129, i8* %.tmp3132, i8* %.tmp3135)
%.tmp3137 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3138 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3137, i32 0, i32 7
%.tmp3139 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3138
store %m261$.Node.type* %.tmp3139, %m261$.Node.type** %param_ptr
br label %.for.start.3092
.for.end.3092:
%.tmp3140 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3141 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3140, i32 0, i32 1
%.tmp3142 = load %m0$.File.type*, %m0$.File.type** %.tmp3141
%.tmp3144 = getelementptr [5 x i8], [5 x i8]*@.str3143, i32 0, i32 0
%.tmp3145 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3142, i8* %.tmp3144)
%.tmp3146 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
call void(%m1791$.CompilerCtx.type*) @m1791$push_scope.v.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp3146)
%.tmp3147 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3148 = load %m261$.Node.type*, %m261$.Node.type** %params
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_fn_params.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3147, %m261$.Node.type* %.tmp3148)
%.tmp3149 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3150 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3149, i32 0, i32 6
%.tmp3151 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3150
%.tmp3153 = getelementptr [6 x i8], [6 x i8]*@.str3152, i32 0, i32 0
%.tmp3154 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3151, i8* %.tmp3153)
%fn_block = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3154, %m261$.Node.type** %fn_block
%.tmp3155 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3156 = load %m261$.Node.type*, %m261$.Node.type** %fn_block
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_block.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3155, %m261$.Node.type* %.tmp3156)
%.tmp3157 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
call void(%m1791$.CompilerCtx.type*) @m1791$pop_scope.v.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp3157)
%.tmp3158 = bitcast ptr null to %m261$.Node.type*
%last_valid_instruction = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3158, %m261$.Node.type** %last_valid_instruction
%.tmp3160 = load %m261$.Node.type*, %m261$.Node.type** %fn_block
%.tmp3161 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3160, i32 0, i32 6
%.tmp3162 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3161
%ci = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3162, %m261$.Node.type** %ci
br label %.for.start.3159
.for.start.3159:
%.tmp3163 = load %m261$.Node.type*, %m261$.Node.type** %ci
%.tmp3164 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3163, i32 0, i32 7
%.tmp3165 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3164
%.tmp3166 = icmp ne %m261$.Node.type* %.tmp3165, null
br i1 %.tmp3166, label %.for.continue.3159, label %.for.end.3159
.for.continue.3159:
%.tmp3167 = load %m261$.Node.type*, %m261$.Node.type** %ci
%.tmp3168 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3167, i32 0, i32 0
%.tmp3169 = load i8*, i8** %.tmp3168
%.tmp3171 = getelementptr [3 x i8], [3 x i8]*@.str3170, i32 0, i32 0
%.tmp3172 = call i32(i8*,i8*) @strcmp(i8* %.tmp3169, i8* %.tmp3171)
%.tmp3173 = icmp ne i32 %.tmp3172, 0
%.tmp3174 = load %m261$.Node.type*, %m261$.Node.type** %ci
%.tmp3175 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3174, i32 0, i32 0
%.tmp3176 = load i8*, i8** %.tmp3175
%.tmp3178 = getelementptr [9 x i8], [9 x i8]*@.str3177, i32 0, i32 0
%.tmp3179 = call i32(i8*,i8*) @strcmp(i8* %.tmp3176, i8* %.tmp3178)
%.tmp3180 = icmp ne i32 %.tmp3179, 0
%.tmp3181 = and i1 %.tmp3173, %.tmp3180
br i1 %.tmp3181, label %.if.true.3182, label %.if.false.3182
.if.true.3182:
%.tmp3183 = load %m261$.Node.type*, %m261$.Node.type** %ci
store %m261$.Node.type* %.tmp3183, %m261$.Node.type** %last_valid_instruction
br label %.if.end.3182
.if.false.3182:
br label %.if.end.3182
.if.end.3182:
%.tmp3184 = load %m261$.Node.type*, %m261$.Node.type** %ci
%.tmp3185 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3184, i32 0, i32 7
%.tmp3186 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3185
store %m261$.Node.type* %.tmp3186, %m261$.Node.type** %ci
br label %.for.start.3159
.for.end.3159:
%add_implicit_return = alloca i1
store i1 0, i1* %add_implicit_return
%.tmp3187 = load %m261$.Node.type*, %m261$.Node.type** %last_valid_instruction
%.tmp3188 = icmp eq %m261$.Node.type* %.tmp3187, null
br i1 %.tmp3188, label %.if.true.3189, label %.if.false.3189
.if.true.3189:
store i1 1, i1* %add_implicit_return
br label %.if.end.3189
.if.false.3189:
%.tmp3190 = load %m261$.Node.type*, %m261$.Node.type** %last_valid_instruction
%.tmp3191 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3190, i32 0, i32 6
%.tmp3192 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3191
%.tmp3193 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3192, i32 0, i32 0
%.tmp3194 = load i8*, i8** %.tmp3193
%.tmp3196 = getelementptr [7 x i8], [7 x i8]*@.str3195, i32 0, i32 0
%.tmp3197 = call i32(i8*,i8*) @strcmp(i8* %.tmp3194, i8* %.tmp3196)
%.tmp3198 = icmp ne i32 %.tmp3197, 0
br i1 %.tmp3198, label %.if.true.3199, label %.if.false.3199
.if.true.3199:
store i1 1, i1* %add_implicit_return
br label %.if.end.3199
.if.false.3199:
br label %.if.end.3199
.if.end.3199:
br label %.if.end.3189
.if.end.3189:
%.tmp3200 = load i1, i1* %add_implicit_return
br i1 %.tmp3200, label %.if.true.3201, label %.if.false.3201
.if.true.3201:
%.tmp3202 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3203 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp3204 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3202, %m1791$.Type.type* %.tmp3203)
%.tmp3206 = getelementptr [5 x i8], [5 x i8]*@.str3205, i32 0, i32 0
%.tmp3207 = call i32(i8*,i8*) @strcmp(i8* %.tmp3204, i8* %.tmp3206)
%.tmp3208 = icmp ne i32 %.tmp3207, 0
br i1 %.tmp3208, label %.if.true.3209, label %.if.false.3209
.if.true.3209:
%.tmp3210 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3211 = load %m261$.Node.type*, %m261$.Node.type** %fn_block
%.tmp3213 = getelementptr [21 x i8], [21 x i8]*@.str3212, i32 0, i32 0
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp3210, %m261$.Node.type* %.tmp3211, i8* %.tmp3213)
br label %.if.end.3209
.if.false.3209:
%.tmp3214 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3215 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3214, i32 0, i32 1
%.tmp3216 = load %m0$.File.type*, %m0$.File.type** %.tmp3215
%.tmp3218 = getelementptr [10 x i8], [10 x i8]*@.str3217, i32 0, i32 0
%.tmp3219 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3216, i8* %.tmp3218)
br label %.if.end.3209
.if.end.3209:
br label %.if.end.3201
.if.false.3201:
br label %.if.end.3201
.if.end.3201:
%.tmp3220 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3221 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3220, i32 0, i32 1
%.tmp3222 = load %m0$.File.type*, %m0$.File.type** %.tmp3221
%.tmp3224 = getelementptr [3 x i8], [3 x i8]*@.str3223, i32 0, i32 0
%.tmp3225 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3222, i8* %.tmp3224)
br label %.if.end.3048
.if.end.3048:
br label %.if.end.3020
.if.false.3020:
%.tmp3226 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3227 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3226, i32 0, i32 0
%.tmp3228 = load i8*, i8** %.tmp3227
%.tmp3230 = getelementptr [7 x i8], [7 x i8]*@.str3229, i32 0, i32 0
%.tmp3231 = call i32(i8*,i8*) @strcmp(i8* %.tmp3228, i8* %.tmp3230)
%.tmp3232 = icmp eq i32 %.tmp3231, 0
br i1 %.tmp3232, label %.if.true.3233, label %.if.false.3233
.if.true.3233:
%.tmp3234 = load i1, i1* %shallow
%.tmp3235 = icmp eq i1 %.tmp3234, 1
br i1 %.tmp3235, label %.if.true.3236, label %.if.false.3236
.if.true.3236:
%.tmp3237 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3238 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3237, i32 0, i32 6
%.tmp3239 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3238
%.tmp3240 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3239, i32 0, i32 7
%.tmp3241 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3240
%.tmp3242 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3241, i32 0, i32 1
%.tmp3243 = load i8*, i8** %.tmp3242
%mod_name = alloca i8*
store i8* %.tmp3243, i8** %mod_name
%.tmp3244 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3245 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3244, i32 0, i32 6
%.tmp3246 = load i8*, i8** %.tmp3245
%mod_abspath = alloca i8*
store i8* %.tmp3246, i8** %mod_abspath
%.tmp3247 = load i8*, i8** %mod_abspath
%.tmp3248 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp3247)
%dirname = alloca i8*
store i8* %.tmp3248, i8** %dirname
%.tmp3249 = load i8*, i8** %mod_name
%.tmp3250 = call i32(i8*) @strlen(i8* %.tmp3249)
%mod_name_len = alloca i32
store i32 %.tmp3250, i32* %mod_name_len
%.tmp3251 = load i32, i32* %mod_name_len
%.tmp3252 = sub i32 %.tmp3251, 1
%.tmp3253 = call i8*(i32) @malloc(i32 %.tmp3252)
%trimmed_name = alloca i8*
store i8* %.tmp3253, i8** %trimmed_name
%i = alloca i32
store i32 1, i32* %i
br label %.for.start.3254
.for.start.3254:
%.tmp3255 = load i32, i32* %i
%.tmp3256 = load i32, i32* %mod_name_len
%.tmp3257 = sub i32 %.tmp3256, 1
%.tmp3258 = icmp slt i32 %.tmp3255, %.tmp3257
br i1 %.tmp3258, label %.for.continue.3254, label %.for.end.3254
.for.continue.3254:
%.tmp3259 = load i32, i32* %i
%.tmp3260 = sub i32 %.tmp3259, 1
%.tmp3261 = load i8*, i8** %trimmed_name
%.tmp3262 = getelementptr i8, i8* %.tmp3261, i32 %.tmp3260
%.tmp3263 = load i32, i32* %i
%.tmp3264 = load i8*, i8** %mod_name
%.tmp3265 = getelementptr i8, i8* %.tmp3264, i32 %.tmp3263
%.tmp3266 = load i8, i8* %.tmp3265
store i8 %.tmp3266, i8* %.tmp3262
%.tmp3267 = load i32, i32* %i
%.tmp3268 = add i32 %.tmp3267, 1
store i32 %.tmp3268, i32* %i
br label %.for.start.3254
.for.end.3254:
%.tmp3269 = load i32, i32* %mod_name_len
%.tmp3270 = sub i32 %.tmp3269, 2
%.tmp3271 = load i8*, i8** %trimmed_name
%.tmp3272 = getelementptr i8, i8* %.tmp3271, i32 %.tmp3270
store i8 0, i8* %.tmp3272
%.tmp3273 = load i8*, i8** %dirname
%.tmp3275 = getelementptr [1 x i8], [1 x i8]*@.str3274, i32 0, i32 0
%.tmp3276 = call i32(i8*,i8*) @strcmp(i8* %.tmp3273, i8* %.tmp3275)
%.tmp3277 = icmp eq i32 %.tmp3276, 0
br i1 %.tmp3277, label %.if.true.3278, label %.if.false.3278
.if.true.3278:
%.tmp3279 = getelementptr i8*, i8** %mod_abspath, i32 0
%.tmp3281 = getelementptr [6 x i8], [6 x i8]*@.str3280, i32 0, i32 0
%.tmp3282 = load i8*, i8** %trimmed_name
%.tmp3283 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3279, i8* %.tmp3281, i8* %.tmp3282)
br label %.if.end.3278
.if.false.3278:
%.tmp3284 = getelementptr i8*, i8** %mod_abspath, i32 0
%.tmp3286 = getelementptr [9 x i8], [9 x i8]*@.str3285, i32 0, i32 0
%.tmp3287 = load i8*, i8** %dirname
%.tmp3288 = load i8*, i8** %trimmed_name
%.tmp3289 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3284, i8* %.tmp3286, i8* %.tmp3287, i8* %.tmp3288)
br label %.if.end.3278
.if.end.3278:
%.tmp3290 = load i8*, i8** %mod_abspath
%.tmp3291 = call i8*(i32) @malloc(i32 4096)
%.tmp3292 = call i8*(i8*,i8*) @realpath(i8* %.tmp3290, i8* %.tmp3291)
store i8* %.tmp3292, i8** %mod_abspath
%.tmp3293 = load i8*, i8** %mod_abspath
%.tmp3294 = icmp eq i8* %.tmp3293, null
br i1 %.tmp3294, label %.if.true.3295, label %.if.false.3295
.if.true.3295:
%.tmp3296 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp3298 = getelementptr [60 x i8], [60 x i8]*@.str3297, i32 0, i32 0
%.tmp3299 = load i8*, i8** %mod_name
%.tmp3300 = load i8*, i8** %dirname
%.tmp3301 = load i8*, i8** %trimmed_name
%.tmp3302 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3296, i8* %.tmp3298, i8* %.tmp3299, i8* %.tmp3300, i8* %.tmp3301)
%.tmp3303 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3304 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3305 = load i8*, i8** %err_buf
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp3303, %m261$.Node.type* %.tmp3304, i8* %.tmp3305)
ret void
br label %.if.end.3295
.if.false.3295:
br label %.if.end.3295
.if.end.3295:
%already_imported = alloca i1
store i1 0, i1* %already_imported
%m = alloca %m1791$.ModuleLookup.type*
%.tmp3306 = bitcast ptr null to %m1791$.ModuleLookup.type*
%mod = alloca %m1791$.ModuleLookup.type*
store %m1791$.ModuleLookup.type* %.tmp3306, %m1791$.ModuleLookup.type** %mod
%.tmp3308 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3309 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3308, i32 0, i32 5
%.tmp3310 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %.tmp3309
store %m1791$.ModuleLookup.type* %.tmp3310, %m1791$.ModuleLookup.type** %m
br label %.for.start.3307
.for.start.3307:
%.tmp3311 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp3312 = icmp ne %m1791$.ModuleLookup.type* %.tmp3311, null
%.tmp3313 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3314 = icmp eq %m1791$.ModuleLookup.type* %.tmp3313, null
%.tmp3315 = and i1 %.tmp3312, %.tmp3314
br i1 %.tmp3315, label %.for.continue.3307, label %.for.end.3307
.for.continue.3307:
%.tmp3316 = load i8*, i8** %mod_abspath
%.tmp3317 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp3318 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3317, i32 0, i32 0
%.tmp3319 = load i8*, i8** %.tmp3318
%.tmp3320 = call i32(i8*,i8*) @strcmp(i8* %.tmp3316, i8* %.tmp3319)
%.tmp3321 = icmp eq i32 %.tmp3320, 0
br i1 %.tmp3321, label %.if.true.3322, label %.if.false.3322
.if.true.3322:
%.tmp3323 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
store %m1791$.ModuleLookup.type* %.tmp3323, %m1791$.ModuleLookup.type** %mod
br label %.if.end.3322
.if.false.3322:
br label %.if.end.3322
.if.end.3322:
%.tmp3324 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp3325 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3324, i32 0, i32 2
%.tmp3326 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %.tmp3325
store %m1791$.ModuleLookup.type* %.tmp3326, %m1791$.ModuleLookup.type** %m
br label %.for.start.3307
.for.end.3307:
%.tmp3327 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3328 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3327, i32 0, i32 6
%.tmp3329 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3328
%.tmp3330 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3329, i32 0, i32 7
%.tmp3331 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3330
%.tmp3332 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3331, i32 0, i32 7
%.tmp3333 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3332
%.tmp3334 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3333, i32 0, i32 7
%.tmp3335 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3334
%.tmp3336 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3335, i32 0, i32 1
%.tmp3337 = load i8*, i8** %.tmp3336
%asname = alloca i8*
store i8* %.tmp3337, i8** %asname
%.tmp3338 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3339 = icmp eq %m1791$.ModuleLookup.type* %.tmp3338, null
br i1 %.tmp3339, label %.if.true.3340, label %.if.false.3340
.if.true.3340:
%.tmp3341 = load i32, i32* @ModuleLookup_size
%.tmp3342 = call i8*(i32) @malloc(i32 %.tmp3341)
%.tmp3343 = bitcast i8* %.tmp3342 to %m1791$.ModuleLookup.type*
store %m1791$.ModuleLookup.type* %.tmp3343, %m1791$.ModuleLookup.type** %mod
%.tmp3344 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3345 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3344, i32 0, i32 0
%.tmp3346 = load i8*, i8** %mod_abspath
store i8* %.tmp3346, i8** %.tmp3345
%.tmp3347 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3348 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3347, i32 0, i32 2
store %m1791$.ModuleLookup.type* null, %m1791$.ModuleLookup.type** %.tmp3348
%.tmp3349 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3350 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3349, i32 0, i32 3
store %m1791$.Scope.type* null, %m1791$.Scope.type** %.tmp3350
%.tmp3351 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3352 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3351, i32 0, i32 1
%.tmp3353 = getelementptr i8*, i8** %.tmp3352, i32 0
%.tmp3355 = getelementptr [5 x i8], [5 x i8]*@.str3354, i32 0, i32 0
%.tmp3356 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3357 = call i32(%m1791$.CompilerCtx.type*) @m1791$new_uid.i.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp3356)
%.tmp3358 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3353, i8* %.tmp3355, i32 %.tmp3357)
%.tmp3360 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3361 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3360, i32 0, i32 5
%.tmp3362 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %.tmp3361
store %m1791$.ModuleLookup.type* %.tmp3362, %m1791$.ModuleLookup.type** %m
br label %.for.start.3359
.for.start.3359:
%.tmp3363 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp3364 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3363, i32 0, i32 2
%.tmp3365 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %.tmp3364
%.tmp3366 = icmp ne %m1791$.ModuleLookup.type* %.tmp3365, null
br i1 %.tmp3366, label %.for.continue.3359, label %.for.end.3359
.for.continue.3359:
%.tmp3367 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp3368 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3367, i32 0, i32 2
%.tmp3369 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %.tmp3368
store %m1791$.ModuleLookup.type* %.tmp3369, %m1791$.ModuleLookup.type** %m
br label %.for.start.3359
.for.end.3359:
%.tmp3370 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp3371 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3370, i32 0, i32 2
%.tmp3372 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
store %m1791$.ModuleLookup.type* %.tmp3372, %m1791$.ModuleLookup.type** %.tmp3371
%.tmp3373 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3374 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3375 = load i8*, i8** %asname
%.tmp3376 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3377 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3376, i32 0, i32 0
%.tmp3378 = load i8*, i8** %.tmp3377
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*,i8*) @m1791$define_module.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp.cp(%m1791$.CompilerCtx.type* %.tmp3373, %m261$.Node.type* %.tmp3374, i8* %.tmp3375, i8* %.tmp3378)
%.tmp3379 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3380 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3379, i32 0, i32 6
%.tmp3381 = load i8*, i8** %.tmp3380
%curr_mod = alloca i8*
store i8* %.tmp3381, i8** %curr_mod
%.tmp3382 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3383 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3382, i32 0, i32 6
%.tmp3384 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3385 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3384, i32 0, i32 0
%.tmp3386 = load i8*, i8** %.tmp3385
store i8* %.tmp3386, i8** %.tmp3383
%.tmp3387 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3388 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3389 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3388, i32 0, i32 0
%.tmp3390 = load i8*, i8** %.tmp3389
%.tmp3391 = call i1(%m1791$.CompilerCtx.type*,i8*) @m1791$compile_file.b.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.tmp3387, i8* %.tmp3390)
%.tmp3392 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3393 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3392, i32 0, i32 6
%.tmp3394 = load i8*, i8** %curr_mod
store i8* %.tmp3394, i8** %.tmp3393
br label %.if.end.3340
.if.false.3340:
%.tmp3395 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3396 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3397 = load i8*, i8** %asname
%.tmp3398 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3399 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3398, i32 0, i32 0
%.tmp3400 = load i8*, i8** %.tmp3399
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*,i8*) @m1791$define_module.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp.cp(%m1791$.CompilerCtx.type* %.tmp3395, %m261$.Node.type* %.tmp3396, i8* %.tmp3397, i8* %.tmp3400)
br label %.if.end.3340
.if.end.3340:
br label %.if.end.3236
.if.false.3236:
br label %.if.end.3236
.if.end.3236:
br label %.if.end.3233
.if.false.3233:
%.tmp3401 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3402 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3404 = getelementptr [40 x i8], [40 x i8]*@.str3403, i32 0, i32 0
%.tmp3405 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp3401, %m261$.Node.type* %.tmp3402, i8* %.tmp3404)
%.tmp3406 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3407 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3406, i32 0, i32 0
%.tmp3408 = load i8*, i8** %.tmp3407
%.tmp3409 = call i32(i8*,...) @printf(i8* %.tmp3405, i8* %.tmp3408)
br label %.if.end.3233
.if.end.3233:
br label %.if.end.3020
.if.end.3020:
br label %.if.end.2887
.if.end.2887:
br label %.if.end.2794
.if.end.2794:
br label %.if.end.2732
.if.end.2732:
br label %.if.end.2724
.if.end.2724:
ret void
}
define i8* @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg, i8* %.msg.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%buf = alloca i8*
%.tmp3410 = getelementptr i8*, i8** %buf, i32 0
%.tmp3412 = getelementptr [31 x i8], [31 x i8]*@.str3411, i32 0, i32 0
%.tmp3413 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3414 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3413, i32 0, i32 6
%.tmp3415 = load i8*, i8** %.tmp3414
%.tmp3416 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3417 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3416, i32 0, i32 3
%.tmp3418 = load i32, i32* %.tmp3417
%.tmp3419 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3420 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3419, i32 0, i32 4
%.tmp3421 = load i32, i32* %.tmp3420
%.tmp3422 = load i8*, i8** %msg
%.tmp3423 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3410, i8* %.tmp3412, i8* %.tmp3415, i32 %.tmp3418, i32 %.tmp3421, i8* %.tmp3422)
%.tmp3424 = load i8*, i8** %buf
ret i8* %.tmp3424
}
define void @m1791$compile_fn_params.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.fn_params.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%fn_params = alloca %m261$.Node.type*
store %m261$.Node.type* %.fn_params.arg, %m261$.Node.type** %fn_params
%param_type = alloca %m1791$.Type.type*
%.tmp3426 = load %m261$.Node.type*, %m261$.Node.type** %fn_params
%param_ptr = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3426, %m261$.Node.type** %param_ptr
br label %.for.start.3425
.for.start.3425:
%.tmp3427 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3428 = icmp ne %m261$.Node.type* %.tmp3427, null
br i1 %.tmp3428, label %.for.continue.3425, label %.for.end.3425
.for.continue.3425:
%.tmp3429 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3430 = load %m261$.Node.type*, %m261$.Node.type** %fn_params
%.tmp3431 = icmp ne %m261$.Node.type* %.tmp3429, %.tmp3430
br i1 %.tmp3431, label %.if.true.3432, label %.if.false.3432
.if.true.3432:
%.tmp3433 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3434 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3433, i32 0, i32 7
%.tmp3435 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3434
store %m261$.Node.type* %.tmp3435, %m261$.Node.type** %param_ptr
br label %.if.end.3432
.if.false.3432:
br label %.if.end.3432
.if.end.3432:
%.tmp3436 = load %m261$.Node.type*, %m261$.Node.type** %fn_params
%.tmp3437 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp3436)
%param_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3437, %m1791$.AssignableInfo.type** %param_info
%.tmp3438 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %param_info
%.tmp3439 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3438, i32 0, i32 2
%.tmp3441 = getelementptr [9 x i8], [9 x i8]*@.str3440, i32 0, i32 0
store i8* %.tmp3441, i8** %.tmp3439
%.tmp3442 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3443 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3442, i32 0, i32 0
%.tmp3444 = load i8*, i8** %.tmp3443
%.tmp3446 = getelementptr [5 x i8], [5 x i8]*@.str3445, i32 0, i32 0
%.tmp3447 = call i32(i8*,i8*) @strcmp(i8* %.tmp3444, i8* %.tmp3446)
%.tmp3448 = icmp eq i32 %.tmp3447, 0
br i1 %.tmp3448, label %.if.true.3449, label %.if.false.3449
.if.true.3449:
%.tmp3450 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3451 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3452 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3451, i32 0, i32 6
%.tmp3453 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3452
%.tmp3454 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3450, %m261$.Node.type* %.tmp3453)
store %m1791$.Type.type* %.tmp3454, %m1791$.Type.type** %param_type
%.tmp3455 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3456 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3455, i32 0, i32 7
%.tmp3457 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3456
store %m261$.Node.type* %.tmp3457, %m261$.Node.type** %param_ptr
br label %.if.end.3449
.if.false.3449:
br label %.if.end.3449
.if.end.3449:
%.tmp3458 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %param_info
%.tmp3459 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3458, i32 0, i32 3
%.tmp3460 = load %m1791$.Type.type*, %m1791$.Type.type** %param_type
store %m1791$.Type.type* %.tmp3460, %m1791$.Type.type** %.tmp3459
%.tmp3461 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3462 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3461, i32 0, i32 1
%.tmp3463 = load i8*, i8** %.tmp3462
%var_name = alloca i8*
store i8* %.tmp3463, i8** %var_name
%.tmp3464 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %param_info
%.tmp3465 = load i8, i8* @SCOPE_LOCAL
%.tmp3466 = load i8*, i8** %var_name
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp3464, i8 %.tmp3465, i8* %.tmp3466)
%.tmp3467 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3468 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %param_info
%.tmp3469 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3468, i32 0, i32 3
%.tmp3470 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3469
%.tmp3471 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3467, %m1791$.Type.type* %.tmp3470)
%param_info_tr = alloca i8*
store i8* %.tmp3471, i8** %param_info_tr
%.tmp3472 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3473 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3472, i32 0, i32 1
%.tmp3474 = load %m0$.File.type*, %m0$.File.type** %.tmp3473
%.tmp3476 = getelementptr [16 x i8], [16 x i8]*@.str3475, i32 0, i32 0
%.tmp3477 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %param_info
%.tmp3478 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3477)
%.tmp3479 = load i8*, i8** %param_info_tr
%.tmp3480 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3474, i8* %.tmp3476, i8* %.tmp3478, i8* %.tmp3479)
%.tmp3481 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3482 = load i8*, i8** %var_name
%.tmp3483 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %param_info
call void(%m1791$.CompilerCtx.type*,i8*,%m1791$.AssignableInfo.type*) @m1791$define_assignable.v.m1791$.CompilerCtx.typep.cp.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp3481, i8* %.tmp3482, %m1791$.AssignableInfo.type* %.tmp3483)
%.tmp3484 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3485 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3484, i32 0, i32 1
%.tmp3486 = load %m0$.File.type*, %m0$.File.type** %.tmp3485
%.tmp3488 = getelementptr [28 x i8], [28 x i8]*@.str3487, i32 0, i32 0
%.tmp3489 = load i8*, i8** %param_info_tr
%.tmp3490 = load i8*, i8** %var_name
%.tmp3491 = load i8*, i8** %param_info_tr
%.tmp3492 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %param_info
%.tmp3493 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3492)
%.tmp3494 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3486, i8* %.tmp3488, i8* %.tmp3489, i8* %.tmp3490, i8* %.tmp3491, i8* %.tmp3493)
%.tmp3495 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3496 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3495, i32 0, i32 7
%.tmp3497 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3496
store %m261$.Node.type* %.tmp3497, %m261$.Node.type** %param_ptr
br label %.for.start.3425
.for.end.3425:
ret void
}
define void @m1791$compile_block.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp3498 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
call void(%m1791$.CompilerCtx.type*) @m1791$push_scope.v.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp3498)
%.tmp3500 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3501 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3500, i32 0, i32 6
%.tmp3502 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3501
%b = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3502, %m261$.Node.type** %b
br label %.for.start.3499
.for.start.3499:
%.tmp3503 = load %m261$.Node.type*, %m261$.Node.type** %b
%.tmp3504 = icmp ne %m261$.Node.type* %.tmp3503, null
br i1 %.tmp3504, label %.for.continue.3499, label %.for.end.3499
.for.continue.3499:
%.tmp3505 = load %m261$.Node.type*, %m261$.Node.type** %b
%.tmp3506 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3505, i32 0, i32 0
%.tmp3507 = load i8*, i8** %.tmp3506
%.tmp3509 = getelementptr [11 x i8], [11 x i8]*@.str3508, i32 0, i32 0
%.tmp3510 = call i32(i8*,i8*) @strcmp(i8* %.tmp3507, i8* %.tmp3509)
%.tmp3511 = icmp eq i32 %.tmp3510, 0
br i1 %.tmp3511, label %.if.true.3512, label %.if.false.3512
.if.true.3512:
%.tmp3513 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3514 = load %m261$.Node.type*, %m261$.Node.type** %b
%.tmp3515 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3514, i32 0, i32 6
%.tmp3516 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3515
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_expression.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3513, %m261$.Node.type* %.tmp3516)
br label %.if.end.3512
.if.false.3512:
br label %.if.end.3512
.if.end.3512:
%.tmp3517 = load %m261$.Node.type*, %m261$.Node.type** %b
%.tmp3518 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3517, i32 0, i32 7
%.tmp3519 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3518
store %m261$.Node.type* %.tmp3519, %m261$.Node.type** %b
br label %.for.start.3499
.for.end.3499:
%.tmp3520 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
call void(%m1791$.CompilerCtx.type*) @m1791$pop_scope.v.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp3520)
ret void
}
define %m1791$.AssignableInfo.type* @m1791$compile_fn_call.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp3521 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3522 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3523 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_addr.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3521, %m261$.Node.type* %.tmp3522)
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3523, %m1791$.AssignableInfo.type** %info
%.tmp3524 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3525 = icmp eq %m1791$.AssignableInfo.type* %.tmp3524, null
br i1 %.tmp3525, label %.if.true.3526, label %.if.false.3526
.if.true.3526:
%.tmp3527 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3528 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3530 = getelementptr [35 x i8], [35 x i8]*@.str3529, i32 0, i32 0
%.tmp3531 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp3527, %m261$.Node.type* %.tmp3528, i8* %.tmp3530)
%.tmp3532 = call i32(i8*,...) @printf(i8* %.tmp3531)
%.tmp3533 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp3533
br label %.if.end.3526
.if.false.3526:
br label %.if.end.3526
.if.end.3526:
%.tmp3534 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3536 = getelementptr [8 x i8], [8 x i8]*@.str3535, i32 0, i32 0
%.tmp3537 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3534, i8* %.tmp3536)
%args = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3537, %m261$.Node.type** %args
%.tmp3539 = getelementptr [1 x i8], [1 x i8]*@.str3538, i32 0, i32 0
%params_buff = alloca i8*
store i8* %.tmp3539, i8** %params_buff
%tmp = alloca i8*
%.tmp3540 = load %m261$.Node.type*, %m261$.Node.type** %args
%.tmp3541 = icmp ne %m261$.Node.type* %.tmp3540, null
br i1 %.tmp3541, label %.if.true.3542, label %.if.false.3542
.if.true.3542:
%.tmp3543 = load %m261$.Node.type*, %m261$.Node.type** %args
%.tmp3544 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3543, i32 0, i32 6
%.tmp3545 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3544
%.tmp3547 = getelementptr [11 x i8], [11 x i8]*@.str3546, i32 0, i32 0
%.tmp3548 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3545, i8* %.tmp3547)
%start = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3548, %m261$.Node.type** %start
%.tmp3550 = load %m261$.Node.type*, %m261$.Node.type** %start
%pp = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3550, %m261$.Node.type** %pp
br label %.for.start.3549
.for.start.3549:
%.tmp3551 = load %m261$.Node.type*, %m261$.Node.type** %pp
%.tmp3552 = icmp ne %m261$.Node.type* %.tmp3551, null
br i1 %.tmp3552, label %.for.continue.3549, label %.for.end.3549
.for.continue.3549:
%.tmp3553 = load %m261$.Node.type*, %m261$.Node.type** %pp
%.tmp3554 = load %m261$.Node.type*, %m261$.Node.type** %start
%.tmp3555 = icmp ne %m261$.Node.type* %.tmp3553, %.tmp3554
br i1 %.tmp3555, label %.if.true.3556, label %.if.false.3556
.if.true.3556:
%.tmp3557 = getelementptr i8*, i8** %tmp, i32 0
%.tmp3559 = getelementptr [5 x i8], [5 x i8]*@.str3558, i32 0, i32 0
%.tmp3560 = load i8*, i8** %params_buff
%.tmp3561 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3557, i8* %.tmp3559, i8* %.tmp3560)
%.tmp3562 = load i8*, i8** %params_buff
%tmp_buff = alloca i8*
store i8* %.tmp3562, i8** %tmp_buff
%.tmp3563 = load i8*, i8** %tmp
store i8* %.tmp3563, i8** %params_buff
%.tmp3564 = load i8*, i8** %tmp_buff
store i8* %.tmp3564, i8** %tmp
%.tmp3565 = load i8*, i8** %tmp
call void(i8*) @free(i8* %.tmp3565)
br label %.if.end.3556
.if.false.3556:
br label %.if.end.3556
.if.end.3556:
%.tmp3566 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3567 = load %m261$.Node.type*, %m261$.Node.type** %pp
%.tmp3568 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3566, %m261$.Node.type* %.tmp3567)
%a_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3568, %m1791$.AssignableInfo.type** %a_info
%.tmp3569 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp3570 = icmp eq %m1791$.AssignableInfo.type* %.tmp3569, null
br i1 %.tmp3570, label %.if.true.3571, label %.if.false.3571
.if.true.3571:
%.tmp3572 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp3572
br label %.if.end.3571
.if.false.3571:
br label %.if.end.3571
.if.end.3571:
%.tmp3573 = getelementptr i8*, i8** %params_buff, i32 0
%.tmp3575 = getelementptr [8 x i8], [8 x i8]*@.str3574, i32 0, i32 0
%.tmp3576 = load i8*, i8** %params_buff
%.tmp3577 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3578 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp3579 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3578, i32 0, i32 3
%.tmp3580 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3579
%.tmp3581 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3577, %m1791$.Type.type* %.tmp3580)
%.tmp3582 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp3583 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3582)
%.tmp3584 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3573, i8* %.tmp3575, i8* %.tmp3576, i8* %.tmp3581, i8* %.tmp3583)
%.tmp3585 = load %m261$.Node.type*, %m261$.Node.type** %pp
%.tmp3586 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3585, i32 0, i32 7
%.tmp3587 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3586
store %m261$.Node.type* %.tmp3587, %m261$.Node.type** %pp
%.tmp3588 = load %m261$.Node.type*, %m261$.Node.type** %pp
%.tmp3590 = getelementptr [11 x i8], [11 x i8]*@.str3589, i32 0, i32 0
%.tmp3591 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3588, i8* %.tmp3590)
store %m261$.Node.type* %.tmp3591, %m261$.Node.type** %pp
br label %.for.start.3549
.for.end.3549:
br label %.if.end.3542
.if.false.3542:
br label %.if.end.3542
.if.end.3542:
%.tmp3592 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3593 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3594 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3593, i32 0, i32 3
%.tmp3595 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3594
%.tmp3596 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3595, i32 0, i32 3
%.tmp3597 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3596
%.tmp3598 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3592, %m1791$.Type.type* %.tmp3597)
%.tmp3600 = getelementptr [5 x i8], [5 x i8]*@.str3599, i32 0, i32 0
%.tmp3601 = call i32(i8*,i8*) @strcmp(i8* %.tmp3598, i8* %.tmp3600)
%.tmp3602 = icmp eq i32 %.tmp3601, 0
br i1 %.tmp3602, label %.if.true.3603, label %.if.false.3603
.if.true.3603:
%.tmp3604 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3605 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3604, i32 0, i32 1
%.tmp3606 = load %m0$.File.type*, %m0$.File.type** %.tmp3605
%.tmp3608 = getelementptr [16 x i8], [16 x i8]*@.str3607, i32 0, i32 0
%.tmp3609 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3610 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3611 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3610, i32 0, i32 3
%.tmp3612 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3611
%.tmp3613 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3609, %m1791$.Type.type* %.tmp3612)
%.tmp3614 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3615 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3614)
%.tmp3616 = load i8*, i8** %params_buff
%.tmp3617 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3606, i8* %.tmp3608, i8* %.tmp3613, i8* %.tmp3615, i8* %.tmp3616)
%.tmp3618 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp3618
br label %.if.end.3603
.if.false.3603:
br label %.if.end.3603
.if.end.3603:
%.tmp3619 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3620 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp3619)
%call_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3620, %m1791$.AssignableInfo.type** %call_info
%.tmp3621 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3622 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %call_info
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp3621, %m1791$.AssignableInfo.type* %.tmp3622)
%.tmp3623 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %call_info
%.tmp3624 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3623, i32 0, i32 3
%.tmp3625 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3626 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3625, i32 0, i32 3
%.tmp3627 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3626
%.tmp3628 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3627, i32 0, i32 3
%.tmp3629 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3628
%.tmp3630 = call %m1791$.Type.type*(%m1791$.Type.type*) @m1791$type_clone.m1791$.Type.typep.m1791$.Type.typep(%m1791$.Type.type* %.tmp3629)
store %m1791$.Type.type* %.tmp3630, %m1791$.Type.type** %.tmp3624
%.tmp3631 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %call_info
%.tmp3632 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3631, i32 0, i32 3
%.tmp3633 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3632
%.tmp3634 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3633, i32 0, i32 4
store %m1791$.Type.type* null, %m1791$.Type.type** %.tmp3634
%.tmp3635 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3636 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3635, i32 0, i32 1
%.tmp3637 = load %m0$.File.type*, %m0$.File.type** %.tmp3636
%.tmp3639 = getelementptr [21 x i8], [21 x i8]*@.str3638, i32 0, i32 0
%.tmp3640 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %call_info
%.tmp3641 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3640)
%.tmp3642 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3643 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3644 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3643, i32 0, i32 3
%.tmp3645 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3644
%.tmp3646 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3642, %m1791$.Type.type* %.tmp3645)
%.tmp3647 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3648 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3647)
%.tmp3649 = load i8*, i8** %params_buff
%.tmp3650 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3637, i8* %.tmp3639, i8* %.tmp3641, i8* %.tmp3646, i8* %.tmp3648, i8* %.tmp3649)
%.tmp3651 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %call_info
%.tmp3652 = bitcast %m1791$.AssignableInfo.type* %.tmp3651 to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp3652
}
define void @m1791$compile_expression.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%err_msg = alloca i8*
%.tmp3653 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3654 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3653, i32 0, i32 0
%.tmp3655 = load i8*, i8** %.tmp3654
%expr_type = alloca i8*
store i8* %.tmp3655, i8** %expr_type
%.tmp3656 = bitcast ptr null to %m1791$.AssignableInfo.type*
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3656, %m1791$.AssignableInfo.type** %info
%assignable = alloca %m261$.Node.type*
%.tmp3657 = bitcast ptr null to %m1791$.AssignableInfo.type*
%a_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3657, %m1791$.AssignableInfo.type** %a_info
%.tmp3658 = load i8*, i8** %expr_type
%.tmp3660 = getelementptr [7 x i8], [7 x i8]*@.str3659, i32 0, i32 0
%.tmp3661 = call i32(i8*,i8*) @strcmp(i8* %.tmp3658, i8* %.tmp3660)
%.tmp3662 = icmp eq i32 %.tmp3661, 0
br i1 %.tmp3662, label %.if.true.3663, label %.if.false.3663
.if.true.3663:
%.tmp3664 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3665 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3664, i32 0, i32 6
%.tmp3666 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3665
%.tmp3667 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3666, i32 0, i32 7
%.tmp3668 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3667
%.tmp3669 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3668, i32 0, i32 0
%.tmp3670 = load i8*, i8** %.tmp3669
%.tmp3672 = getelementptr [3 x i8], [3 x i8]*@.str3671, i32 0, i32 0
%.tmp3673 = call i32(i8*,i8*) @strcmp(i8* %.tmp3670, i8* %.tmp3672)
%.tmp3674 = icmp ne i32 %.tmp3673, 0
br i1 %.tmp3674, label %.if.true.3675, label %.if.false.3675
.if.true.3675:
%.tmp3676 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3677 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3678 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3677, i32 0, i32 6
%.tmp3679 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3678
%.tmp3680 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3679, i32 0, i32 7
%.tmp3681 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3680
%.tmp3682 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3676, %m261$.Node.type* %.tmp3681)
store %m1791$.AssignableInfo.type* %.tmp3682, %m1791$.AssignableInfo.type** %info
%.tmp3683 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3684 = icmp eq %m1791$.AssignableInfo.type* %.tmp3683, null
br i1 %.tmp3684, label %.if.true.3685, label %.if.false.3685
.if.true.3685:
ret void
br label %.if.end.3685
.if.false.3685:
br label %.if.end.3685
.if.end.3685:
%.tmp3686 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3687 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3686, i32 0, i32 1
%.tmp3688 = load %m0$.File.type*, %m0$.File.type** %.tmp3687
%.tmp3690 = getelementptr [11 x i8], [11 x i8]*@.str3689, i32 0, i32 0
%.tmp3691 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3692 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3693 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3692, i32 0, i32 3
%.tmp3694 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3693
%.tmp3695 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3691, %m1791$.Type.type* %.tmp3694)
%.tmp3696 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3697 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3696)
%.tmp3698 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3688, i8* %.tmp3690, i8* %.tmp3695, i8* %.tmp3697)
br label %.if.end.3675
.if.false.3675:
%.tmp3699 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3700 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3699, i32 0, i32 1
%.tmp3701 = load %m0$.File.type*, %m0$.File.type** %.tmp3700
%.tmp3703 = getelementptr [10 x i8], [10 x i8]*@.str3702, i32 0, i32 0
%.tmp3704 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3701, i8* %.tmp3703)
br label %.if.end.3675
.if.end.3675:
br label %.if.end.3663
.if.false.3663:
%.tmp3705 = load i8*, i8** %expr_type
%.tmp3707 = getelementptr [3 x i8], [3 x i8]*@.str3706, i32 0, i32 0
%.tmp3708 = call i32(i8*,i8*) @strcmp(i8* %.tmp3705, i8* %.tmp3707)
%.tmp3709 = icmp eq i32 %.tmp3708, 0
br i1 %.tmp3709, label %.if.true.3710, label %.if.false.3710
.if.true.3710:
br label %.if.end.3710
.if.false.3710:
%.tmp3711 = load i8*, i8** %expr_type
%.tmp3713 = getelementptr [8 x i8], [8 x i8]*@.str3712, i32 0, i32 0
%.tmp3714 = call i32(i8*,i8*) @strcmp(i8* %.tmp3711, i8* %.tmp3713)
%.tmp3715 = icmp eq i32 %.tmp3714, 0
br i1 %.tmp3715, label %.if.true.3716, label %.if.false.3716
.if.true.3716:
%.tmp3717 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3718 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3719 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3718, i32 0, i32 6
%.tmp3720 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3719
%.tmp3721 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_fn_call.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3717, %m261$.Node.type* %.tmp3720)
br label %.if.end.3716
.if.false.3716:
%.tmp3722 = load i8*, i8** %expr_type
%.tmp3724 = getelementptr [12 x i8], [12 x i8]*@.str3723, i32 0, i32 0
%.tmp3725 = call i32(i8*,i8*) @strcmp(i8* %.tmp3722, i8* %.tmp3724)
%.tmp3726 = icmp eq i32 %.tmp3725, 0
br i1 %.tmp3726, label %.if.true.3727, label %.if.false.3727
.if.true.3727:
%.tmp3728 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3729 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3730 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_declaration.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3728, %m261$.Node.type* %.tmp3729)
br label %.if.end.3727
.if.false.3727:
%.tmp3731 = load i8*, i8** %expr_type
%.tmp3733 = getelementptr [11 x i8], [11 x i8]*@.str3732, i32 0, i32 0
%.tmp3734 = call i32(i8*,i8*) @strcmp(i8* %.tmp3731, i8* %.tmp3733)
%.tmp3735 = icmp eq i32 %.tmp3734, 0
br i1 %.tmp3735, label %.if.true.3736, label %.if.false.3736
.if.true.3736:
%.tmp3737 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3738 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3737, i32 0, i32 6
%.tmp3739 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3738
%.tmp3741 = getelementptr [11 x i8], [11 x i8]*@.str3740, i32 0, i32 0
%.tmp3742 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3739, i8* %.tmp3741)
store %m261$.Node.type* %.tmp3742, %m261$.Node.type** %assignable
%.tmp3743 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3744 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3745 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3744, i32 0, i32 6
%.tmp3746 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3745
%.tmp3747 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_addr.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3743, %m261$.Node.type* %.tmp3746)
%dest = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3747, %m1791$.AssignableInfo.type** %dest
%.tmp3748 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %dest
%.tmp3749 = icmp eq %m1791$.AssignableInfo.type* %.tmp3748, null
br i1 %.tmp3749, label %.if.true.3750, label %.if.false.3750
.if.true.3750:
%.tmp3751 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp3753 = getelementptr [34 x i8], [34 x i8]*@.str3752, i32 0, i32 0
%.tmp3754 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3755 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3754, i32 0, i32 6
%.tmp3756 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3755
%.tmp3757 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3756, i32 0, i32 6
%.tmp3758 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3757
%.tmp3759 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3758, i32 0, i32 6
%.tmp3760 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3759
%.tmp3761 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3760, i32 0, i32 1
%.tmp3762 = load i8*, i8** %.tmp3761
%.tmp3763 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3751, i8* %.tmp3753, i8* %.tmp3762)
%.tmp3764 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3765 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3766 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp3764, %m261$.Node.type* %.tmp3765, i8* %.tmp3766)
ret void
br label %.if.end.3750
.if.false.3750:
br label %.if.end.3750
.if.end.3750:
%.tmp3767 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3768 = load %m261$.Node.type*, %m261$.Node.type** %assignable
%.tmp3769 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3767, %m261$.Node.type* %.tmp3768)
store %m1791$.AssignableInfo.type* %.tmp3769, %m1791$.AssignableInfo.type** %a_info
%.tmp3770 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp3771 = icmp eq %m1791$.AssignableInfo.type* %.tmp3770, null
br i1 %.tmp3771, label %.if.true.3772, label %.if.false.3772
.if.true.3772:
ret void
br label %.if.end.3772
.if.false.3772:
br label %.if.end.3772
.if.end.3772:
%.tmp3773 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3774 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %dest
%.tmp3775 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3774, i32 0, i32 3
%.tmp3776 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3775
%.tmp3777 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3773, %m1791$.Type.type* %.tmp3776)
%dest_tr = alloca i8*
store i8* %.tmp3777, i8** %dest_tr
%.tmp3778 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3779 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp3780 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3779, i32 0, i32 3
%.tmp3781 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3780
%.tmp3782 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3778, %m1791$.Type.type* %.tmp3781)
%src_tr = alloca i8*
store i8* %.tmp3782, i8** %src_tr
%.tmp3783 = load i8*, i8** %src_tr
%.tmp3785 = getelementptr [4 x i8], [4 x i8]*@.str3784, i32 0, i32 0
%.tmp3786 = call i32(i8*,i8*) @strcmp(i8* %.tmp3783, i8* %.tmp3785)
%.tmp3787 = icmp eq i32 %.tmp3786, 0
br i1 %.tmp3787, label %.if.true.3788, label %.if.false.3788
.if.true.3788:
%.tmp3789 = load i8*, i8** %dest_tr
store i8* %.tmp3789, i8** %src_tr
br label %.if.end.3788
.if.false.3788:
br label %.if.end.3788
.if.end.3788:
%.tmp3790 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3791 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3790, i32 0, i32 1
%.tmp3792 = load %m0$.File.type*, %m0$.File.type** %.tmp3791
%.tmp3794 = getelementptr [21 x i8], [21 x i8]*@.str3793, i32 0, i32 0
%.tmp3795 = load i8*, i8** %src_tr
%.tmp3796 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp3797 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3796)
%.tmp3798 = load i8*, i8** %dest_tr
%.tmp3799 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %dest
%.tmp3800 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3799)
%.tmp3801 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3792, i8* %.tmp3794, i8* %.tmp3795, i8* %.tmp3797, i8* %.tmp3798, i8* %.tmp3800)
br label %.if.end.3736
.if.false.3736:
%.tmp3802 = load i8*, i8** %expr_type
%.tmp3804 = getelementptr [9 x i8], [9 x i8]*@.str3803, i32 0, i32 0
%.tmp3805 = call i32(i8*,i8*) @strcmp(i8* %.tmp3802, i8* %.tmp3804)
%.tmp3806 = icmp eq i32 %.tmp3805, 0
br i1 %.tmp3806, label %.if.true.3807, label %.if.false.3807
.if.true.3807:
%.tmp3808 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3809 = load %m261$.Node.type*, %m261$.Node.type** %stmt
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_if_block.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3808, %m261$.Node.type* %.tmp3809)
br label %.if.end.3807
.if.false.3807:
%.tmp3810 = load i8*, i8** %expr_type
%.tmp3812 = getelementptr [9 x i8], [9 x i8]*@.str3811, i32 0, i32 0
%.tmp3813 = call i32(i8*,i8*) @strcmp(i8* %.tmp3810, i8* %.tmp3812)
%.tmp3814 = icmp eq i32 %.tmp3813, 0
br i1 %.tmp3814, label %.if.true.3815, label %.if.false.3815
.if.true.3815:
%.tmp3816 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3817 = load %m261$.Node.type*, %m261$.Node.type** %stmt
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_for_loop.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3816, %m261$.Node.type* %.tmp3817)
br label %.if.end.3815
.if.false.3815:
%.tmp3818 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3819 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3821 = getelementptr [34 x i8], [34 x i8]*@.str3820, i32 0, i32 0
%.tmp3822 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp3818, %m261$.Node.type* %.tmp3819, i8* %.tmp3821)
%.tmp3823 = load i8*, i8** %expr_type
%.tmp3824 = call i32(i8*,...) @printf(i8* %.tmp3822, i8* %.tmp3823)
br label %.if.end.3815
.if.end.3815:
br label %.if.end.3807
.if.end.3807:
br label %.if.end.3736
.if.end.3736:
br label %.if.end.3727
.if.end.3727:
br label %.if.end.3716
.if.end.3716:
br label %.if.end.3710
.if.end.3710:
br label %.if.end.3663
.if.end.3663:
ret void
}
define void @m1791$compile_for_loop.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp3825 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3826 = call i32(%m1791$.CompilerCtx.type*) @m1791$new_uid.i.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp3825)
%for_id = alloca i32
store i32 %.tmp3826, i32* %for_id
%.tmp3827 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3828 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3827, i32 0, i32 6
%.tmp3829 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3828
%.tmp3830 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3829, i32 0, i32 7
%.tmp3831 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3830
%init_stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3831, %m261$.Node.type** %init_stmt
%.tmp3832 = load %m261$.Node.type*, %m261$.Node.type** %init_stmt
%.tmp3833 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3832, i32 0, i32 0
%.tmp3834 = load i8*, i8** %.tmp3833
%.tmp3836 = getelementptr [12 x i8], [12 x i8]*@.str3835, i32 0, i32 0
%.tmp3837 = call i32(i8*,i8*) @strcmp(i8* %.tmp3834, i8* %.tmp3836)
%.tmp3838 = icmp eq i32 %.tmp3837, 0
br i1 %.tmp3838, label %.if.true.3839, label %.if.false.3839
.if.true.3839:
%.tmp3840 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3841 = load %m261$.Node.type*, %m261$.Node.type** %init_stmt
%.tmp3842 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_declaration.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3840, %m261$.Node.type* %.tmp3841)
br label %.if.end.3839
.if.false.3839:
%.tmp3843 = load %m261$.Node.type*, %m261$.Node.type** %init_stmt
%.tmp3844 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3843, i32 0, i32 0
%.tmp3845 = load i8*, i8** %.tmp3844
%.tmp3847 = getelementptr [11 x i8], [11 x i8]*@.str3846, i32 0, i32 0
%.tmp3848 = call i32(i8*,i8*) @strcmp(i8* %.tmp3845, i8* %.tmp3847)
%.tmp3849 = icmp eq i32 %.tmp3848, 0
br i1 %.tmp3849, label %.if.true.3850, label %.if.false.3850
.if.true.3850:
%.tmp3851 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3852 = load %m261$.Node.type*, %m261$.Node.type** %init_stmt
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_expression.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3851, %m261$.Node.type* %.tmp3852)
br label %.if.end.3850
.if.false.3850:
%.tmp3853 = load %m261$.Node.type*, %m261$.Node.type** %init_stmt
%.tmp3854 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3853, i32 0, i32 0
%.tmp3855 = load i8*, i8** %.tmp3854
%.tmp3857 = getelementptr [9 x i8], [9 x i8]*@.str3856, i32 0, i32 0
%.tmp3858 = call i32(i8*,i8*) @strcmp(i8* %.tmp3855, i8* %.tmp3857)
%.tmp3859 = icmp eq i32 %.tmp3858, 0
br i1 %.tmp3859, label %.if.true.3860, label %.if.false.3860
.if.true.3860:
br label %.if.end.3860
.if.false.3860:
%.tmp3861 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3862 = load %m261$.Node.type*, %m261$.Node.type** %init_stmt
%.tmp3864 = getelementptr [66 x i8], [66 x i8]*@.str3863, i32 0, i32 0
%.tmp3865 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp3861, %m261$.Node.type* %.tmp3862, i8* %.tmp3864)
%.tmp3866 = load %m261$.Node.type*, %m261$.Node.type** %init_stmt
%.tmp3867 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3866, i32 0, i32 0
%.tmp3868 = load i8*, i8** %.tmp3867
%.tmp3869 = call i32(i8*,...) @printf(i8* %.tmp3865, i8* %.tmp3868)
ret void
br label %.if.end.3860
.if.end.3860:
br label %.if.end.3850
.if.end.3850:
br label %.if.end.3839
.if.end.3839:
%.tmp3870 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3871 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3870, i32 0, i32 1
%.tmp3872 = load %m0$.File.type*, %m0$.File.type** %.tmp3871
%.tmp3874 = getelementptr [26 x i8], [26 x i8]*@.str3873, i32 0, i32 0
%.tmp3875 = load i32, i32* %for_id
%.tmp3876 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3872, i8* %.tmp3874, i32 %.tmp3875)
%.tmp3877 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3878 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3877, i32 0, i32 1
%.tmp3879 = load %m0$.File.type*, %m0$.File.type** %.tmp3878
%.tmp3881 = getelementptr [16 x i8], [16 x i8]*@.str3880, i32 0, i32 0
%.tmp3882 = load i32, i32* %for_id
%.tmp3883 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3879, i8* %.tmp3881, i32 %.tmp3882)
%.tmp3884 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3885 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3884, i32 0, i32 6
%.tmp3886 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3885
%.tmp3888 = getelementptr [9 x i8], [9 x i8]*@.str3887, i32 0, i32 0
%.tmp3889 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3886, i8* %.tmp3888)
%fst_colon = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3889, %m261$.Node.type** %fst_colon
%.tmp3890 = load %m261$.Node.type*, %m261$.Node.type** %fst_colon
%.tmp3891 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3890, i32 0, i32 7
%.tmp3892 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3891
%condition = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3892, %m261$.Node.type** %condition
%.tmp3893 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3894 = load %m261$.Node.type*, %m261$.Node.type** %condition
%.tmp3895 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3893, %m261$.Node.type* %.tmp3894)
%condition_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3895, %m1791$.AssignableInfo.type** %condition_info
%.tmp3896 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3897 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3896, i32 0, i32 1
%.tmp3898 = load %m0$.File.type*, %m0$.File.type** %.tmp3897
%.tmp3900 = getelementptr [57 x i8], [57 x i8]*@.str3899, i32 0, i32 0
%.tmp3901 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3902 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %condition_info
%.tmp3903 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3902, i32 0, i32 3
%.tmp3904 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3903
%.tmp3905 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3901, %m1791$.Type.type* %.tmp3904)
%.tmp3906 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %condition_info
%.tmp3907 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3906)
%.tmp3908 = load i32, i32* %for_id
%.tmp3909 = load i32, i32* %for_id
%.tmp3910 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3898, i8* %.tmp3900, i8* %.tmp3905, i8* %.tmp3907, i32 %.tmp3908, i32 %.tmp3909)
%.tmp3911 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3912 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3911, i32 0, i32 1
%.tmp3913 = load %m0$.File.type*, %m0$.File.type** %.tmp3912
%.tmp3915 = getelementptr [19 x i8], [19 x i8]*@.str3914, i32 0, i32 0
%.tmp3916 = load i32, i32* %for_id
%.tmp3917 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3913, i8* %.tmp3915, i32 %.tmp3916)
%.tmp3918 = load %m261$.Node.type*, %m261$.Node.type** %fst_colon
%.tmp3919 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3918, i32 0, i32 7
%.tmp3920 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3919
%.tmp3922 = getelementptr [9 x i8], [9 x i8]*@.str3921, i32 0, i32 0
%.tmp3923 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3920, i8* %.tmp3922)
%snd_colon = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3923, %m261$.Node.type** %snd_colon
%.tmp3924 = load %m261$.Node.type*, %m261$.Node.type** %snd_colon
%.tmp3925 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3924, i32 0, i32 7
%.tmp3926 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3925
%increment = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3926, %m261$.Node.type** %increment
%.tmp3927 = load %m261$.Node.type*, %m261$.Node.type** %snd_colon
%.tmp3929 = getelementptr [6 x i8], [6 x i8]*@.str3928, i32 0, i32 0
%.tmp3930 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3927, i8* %.tmp3929)
%for_body = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3930, %m261$.Node.type** %for_body
%.tmp3931 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3932 = load %m261$.Node.type*, %m261$.Node.type** %for_body
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_block.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3931, %m261$.Node.type* %.tmp3932)
%.tmp3933 = load %m261$.Node.type*, %m261$.Node.type** %increment
%.tmp3934 = load %m261$.Node.type*, %m261$.Node.type** %for_body
%.tmp3935 = icmp ne %m261$.Node.type* %.tmp3933, %.tmp3934
br i1 %.tmp3935, label %.if.true.3936, label %.if.false.3936
.if.true.3936:
%.tmp3937 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3938 = load %m261$.Node.type*, %m261$.Node.type** %increment
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_expression.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3937, %m261$.Node.type* %.tmp3938)
br label %.if.end.3936
.if.false.3936:
br label %.if.end.3936
.if.end.3936:
%.tmp3939 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3940 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3939, i32 0, i32 1
%.tmp3941 = load %m0$.File.type*, %m0$.File.type** %.tmp3940
%.tmp3943 = getelementptr [26 x i8], [26 x i8]*@.str3942, i32 0, i32 0
%.tmp3944 = load i32, i32* %for_id
%.tmp3945 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3941, i8* %.tmp3943, i32 %.tmp3944)
%.tmp3946 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3947 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3946, i32 0, i32 1
%.tmp3948 = load %m0$.File.type*, %m0$.File.type** %.tmp3947
%.tmp3950 = getelementptr [14 x i8], [14 x i8]*@.str3949, i32 0, i32 0
%.tmp3951 = load i32, i32* %for_id
%.tmp3952 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3948, i8* %.tmp3950, i32 %.tmp3951)
ret void
}
define %m1791$.AssignableInfo.type* @m1791$compile_declaration.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp3953 = bitcast ptr null to %m1791$.Type.type*
%decl_type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp3953, %m1791$.Type.type** %decl_type
%.tmp3954 = bitcast ptr null to %m1791$.AssignableInfo.type*
%a_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3954, %m1791$.AssignableInfo.type** %a_info
%.tmp3955 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3956 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3955, i32 0, i32 6
%.tmp3957 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3956
%.tmp3958 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3957, i32 0, i32 0
%.tmp3959 = load i8*, i8** %.tmp3958
%.tmp3961 = getelementptr [5 x i8], [5 x i8]*@.str3960, i32 0, i32 0
%.tmp3962 = call i32(i8*,i8*) @strcmp(i8* %.tmp3959, i8* %.tmp3961)
%.tmp3963 = icmp eq i32 %.tmp3962, 0
br i1 %.tmp3963, label %.if.true.3964, label %.if.false.3964
.if.true.3964:
%.tmp3965 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3966 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3967 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3966, i32 0, i32 6
%.tmp3968 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3967
%.tmp3969 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3968, i32 0, i32 6
%.tmp3970 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3969
%.tmp3971 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3965, %m261$.Node.type* %.tmp3970)
store %m1791$.Type.type* %.tmp3971, %m1791$.Type.type** %decl_type
br label %.if.end.3964
.if.false.3964:
br label %.if.end.3964
.if.end.3964:
%.tmp3972 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3973 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3972, i32 0, i32 6
%.tmp3974 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3973
%.tmp3976 = getelementptr [11 x i8], [11 x i8]*@.str3975, i32 0, i32 0
%.tmp3977 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3974, i8* %.tmp3976)
%assignable = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3977, %m261$.Node.type** %assignable
%.tmp3978 = load %m261$.Node.type*, %m261$.Node.type** %assignable
%.tmp3979 = icmp ne %m261$.Node.type* %.tmp3978, null
br i1 %.tmp3979, label %.if.true.3980, label %.if.false.3980
.if.true.3980:
%.tmp3981 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3982 = load %m261$.Node.type*, %m261$.Node.type** %assignable
%.tmp3983 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3981, %m261$.Node.type* %.tmp3982)
store %m1791$.AssignableInfo.type* %.tmp3983, %m1791$.AssignableInfo.type** %a_info
br label %.if.end.3980
.if.false.3980:
br label %.if.end.3980
.if.end.3980:
%.tmp3984 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3985 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp3984)
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3985, %m1791$.AssignableInfo.type** %info
%.tmp3986 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3987 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3986, i32 0, i32 2
%.tmp3989 = getelementptr [9 x i8], [9 x i8]*@.str3988, i32 0, i32 0
store i8* %.tmp3989, i8** %.tmp3987
%.tmp3990 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3991 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3990, i32 0, i32 6
%.tmp3992 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3991
%.tmp3994 = getelementptr [5 x i8], [5 x i8]*@.str3993, i32 0, i32 0
%.tmp3995 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3992, i8* %.tmp3994)
%var_name = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3995, %m261$.Node.type** %var_name
%.tmp3996 = load %m261$.Node.type*, %m261$.Node.type** %var_name
%.tmp3997 = icmp eq %m261$.Node.type* %.tmp3996, null
br i1 %.tmp3997, label %.if.true.3998, label %.if.false.3998
.if.true.3998:
%.tmp3999 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4000 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4002 = getelementptr [31 x i8], [31 x i8]*@.str4001, i32 0, i32 0
%.tmp4003 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp3999, %m261$.Node.type* %.tmp4000, i8* %.tmp4002)
%.tmp4004 = call i32(i8*,...) @printf(i8* %.tmp4003)
%.tmp4005 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp4005
br label %.if.end.3998
.if.false.3998:
br label %.if.end.3998
.if.end.3998:
%.tmp4006 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4007 = load i8, i8* @SCOPE_LOCAL
%.tmp4008 = load %m261$.Node.type*, %m261$.Node.type** %var_name
%.tmp4009 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4008, i32 0, i32 1
%.tmp4010 = load i8*, i8** %.tmp4009
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp4006, i8 %.tmp4007, i8* %.tmp4010)
%.tmp4011 = load %m1791$.Type.type*, %m1791$.Type.type** %decl_type
%.tmp4012 = icmp ne %m1791$.Type.type* %.tmp4011, null
br i1 %.tmp4012, label %.if.true.4013, label %.if.false.4013
.if.true.4013:
%.tmp4014 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4015 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4014, i32 0, i32 3
%.tmp4016 = load %m1791$.Type.type*, %m1791$.Type.type** %decl_type
store %m1791$.Type.type* %.tmp4016, %m1791$.Type.type** %.tmp4015
br label %.if.end.4013
.if.false.4013:
%.tmp4017 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4018 = icmp ne %m1791$.AssignableInfo.type* %.tmp4017, null
br i1 %.tmp4018, label %.if.true.4019, label %.if.false.4019
.if.true.4019:
%.tmp4020 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4021 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4020, i32 0, i32 3
%.tmp4022 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4023 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4022, i32 0, i32 3
%.tmp4024 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4023
store %m1791$.Type.type* %.tmp4024, %m1791$.Type.type** %.tmp4021
br label %.if.end.4019
.if.false.4019:
br label %.if.end.4019
.if.end.4019:
br label %.if.end.4013
.if.end.4013:
%.tmp4025 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4026 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4027 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4026, i32 0, i32 3
%.tmp4028 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4027
%.tmp4029 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4025, %m1791$.Type.type* %.tmp4028)
%var_type_repr = alloca i8*
store i8* %.tmp4029, i8** %var_type_repr
%.tmp4030 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4031 = icmp ne %m1791$.AssignableInfo.type* %.tmp4030, null
br i1 %.tmp4031, label %.if.true.4032, label %.if.false.4032
.if.true.4032:
%.tmp4033 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4034 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4035 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4034, i32 0, i32 3
%.tmp4036 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4035
%.tmp4037 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4033, %m1791$.Type.type* %.tmp4036)
%a_type_repr = alloca i8*
store i8* %.tmp4037, i8** %a_type_repr
%type_error = alloca i1
store i1 0, i1* %type_error
%.tmp4038 = load i8*, i8** %a_type_repr
%.tmp4039 = call i32(i8*) @strlen(i8* %.tmp4038)
%.tmp4040 = load i8*, i8** %var_type_repr
%.tmp4041 = call i32(i8*) @strlen(i8* %.tmp4040)
%.tmp4042 = icmp ne i32 %.tmp4039, %.tmp4041
br i1 %.tmp4042, label %.if.true.4043, label %.if.false.4043
.if.true.4043:
store i1 1, i1* %type_error
br label %.if.end.4043
.if.false.4043:
%.tmp4044 = load i8*, i8** %a_type_repr
%.tmp4045 = load i8*, i8** %var_type_repr
%.tmp4046 = call i32(i8*,i8*) @strcmp(i8* %.tmp4044, i8* %.tmp4045)
%.tmp4047 = icmp ne i32 %.tmp4046, 0
br i1 %.tmp4047, label %.if.true.4048, label %.if.false.4048
.if.true.4048:
store i1 1, i1* %type_error
br label %.if.end.4048
.if.false.4048:
br label %.if.end.4048
.if.end.4048:
br label %.if.end.4043
.if.end.4043:
%.tmp4049 = load i1, i1* %type_error
br i1 %.tmp4049, label %.if.true.4050, label %.if.false.4050
.if.true.4050:
%.tmp4051 = bitcast ptr null to i8*
%err_msg = alloca i8*
store i8* %.tmp4051, i8** %err_msg
%.tmp4052 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4054 = getelementptr [49 x i8], [49 x i8]*@.str4053, i32 0, i32 0
%.tmp4055 = load i8*, i8** %a_type_repr
%.tmp4056 = load i8*, i8** %var_type_repr
%.tmp4057 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4052, i8* %.tmp4054, i8* %.tmp4055, i8* %.tmp4056)
%.tmp4058 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4059 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4060 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4058, %m261$.Node.type* %.tmp4059, i8* %.tmp4060)
br label %.if.end.4050
.if.false.4050:
br label %.if.end.4050
.if.end.4050:
br label %.if.end.4032
.if.false.4032:
br label %.if.end.4032
.if.end.4032:
%.tmp4061 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4062 = load %m261$.Node.type*, %m261$.Node.type** %var_name
%.tmp4063 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4062, i32 0, i32 1
%.tmp4064 = load i8*, i8** %.tmp4063
%.tmp4065 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
call void(%m1791$.CompilerCtx.type*,i8*,%m1791$.AssignableInfo.type*) @m1791$define_assignable.v.m1791$.CompilerCtx.typep.cp.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp4061, i8* %.tmp4064, %m1791$.AssignableInfo.type* %.tmp4065)
%.tmp4066 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4067 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4066, i32 0, i32 1
%.tmp4068 = load %m0$.File.type*, %m0$.File.type** %.tmp4067
%.tmp4070 = getelementptr [16 x i8], [16 x i8]*@.str4069, i32 0, i32 0
%.tmp4071 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4072 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4071)
%.tmp4073 = load i8*, i8** %var_type_repr
%.tmp4074 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4068, i8* %.tmp4070, i8* %.tmp4072, i8* %.tmp4073)
%.tmp4075 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4076 = icmp ne %m1791$.AssignableInfo.type* %.tmp4075, null
br i1 %.tmp4076, label %.if.true.4077, label %.if.false.4077
.if.true.4077:
%.tmp4078 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4079 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4078, i32 0, i32 1
%.tmp4080 = load %m0$.File.type*, %m0$.File.type** %.tmp4079
%.tmp4082 = getelementptr [21 x i8], [21 x i8]*@.str4081, i32 0, i32 0
%.tmp4083 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4084 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4085 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4084, i32 0, i32 3
%.tmp4086 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4085
%.tmp4087 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4083, %m1791$.Type.type* %.tmp4086)
%.tmp4088 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4089 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4088)
%.tmp4090 = load i8*, i8** %var_type_repr
%.tmp4091 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4092 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4091)
%.tmp4093 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4080, i8* %.tmp4082, i8* %.tmp4087, i8* %.tmp4089, i8* %.tmp4090, i8* %.tmp4092)
br label %.if.end.4077
.if.false.4077:
br label %.if.end.4077
.if.end.4077:
%.tmp4094 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
ret %m1791$.AssignableInfo.type* %.tmp4094
}
define void @m1791$compile_if_block.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp4095 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4096 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4095, i32 0, i32 6
%.tmp4097 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4096
%.tmp4099 = getelementptr [11 x i8], [11 x i8]*@.str4098, i32 0, i32 0
%.tmp4100 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4097, i8* %.tmp4099)
%assignable = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4100, %m261$.Node.type** %assignable
%.tmp4101 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4102 = load %m261$.Node.type*, %m261$.Node.type** %assignable
%.tmp4103 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4101, %m261$.Node.type* %.tmp4102)
%a_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4103, %m1791$.AssignableInfo.type** %a_info
%.tmp4104 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4105 = icmp eq %m1791$.AssignableInfo.type* %.tmp4104, null
br i1 %.tmp4105, label %.if.true.4106, label %.if.false.4106
.if.true.4106:
ret void
br label %.if.end.4106
.if.false.4106:
br label %.if.end.4106
.if.end.4106:
%.tmp4107 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4108 = call i32(%m1791$.CompilerCtx.type*) @m1791$new_uid.i.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp4107)
%if_id = alloca i32
store i32 %.tmp4108, i32* %if_id
%.tmp4109 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4110 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4109, i32 0, i32 1
%.tmp4111 = load %m0$.File.type*, %m0$.File.type** %.tmp4110
%.tmp4113 = getelementptr [53 x i8], [53 x i8]*@.str4112, i32 0, i32 0
%.tmp4114 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4115 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4116 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4115, i32 0, i32 3
%.tmp4117 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4116
%.tmp4118 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4114, %m1791$.Type.type* %.tmp4117)
%.tmp4119 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4120 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4119)
%.tmp4121 = load i32, i32* %if_id
%.tmp4122 = load i32, i32* %if_id
%.tmp4123 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4111, i8* %.tmp4113, i8* %.tmp4118, i8* %.tmp4120, i32 %.tmp4121, i32 %.tmp4122)
%.tmp4124 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4125 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4124, i32 0, i32 1
%.tmp4126 = load %m0$.File.type*, %m0$.File.type** %.tmp4125
%.tmp4128 = getelementptr [14 x i8], [14 x i8]*@.str4127, i32 0, i32 0
%.tmp4129 = load i32, i32* %if_id
%.tmp4130 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4126, i8* %.tmp4128, i32 %.tmp4129)
%.tmp4131 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4132 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4131, i32 0, i32 6
%.tmp4133 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4132
%.tmp4135 = getelementptr [6 x i8], [6 x i8]*@.str4134, i32 0, i32 0
%.tmp4136 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4133, i8* %.tmp4135)
%block = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4136, %m261$.Node.type** %block
%.tmp4137 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4138 = load %m261$.Node.type*, %m261$.Node.type** %block
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_block.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4137, %m261$.Node.type* %.tmp4138)
%.tmp4139 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4140 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4139, i32 0, i32 1
%.tmp4141 = load %m0$.File.type*, %m0$.File.type** %.tmp4140
%.tmp4143 = getelementptr [23 x i8], [23 x i8]*@.str4142, i32 0, i32 0
%.tmp4144 = load i32, i32* %if_id
%.tmp4145 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4141, i8* %.tmp4143, i32 %.tmp4144)
%.tmp4146 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4147 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4146, i32 0, i32 1
%.tmp4148 = load %m0$.File.type*, %m0$.File.type** %.tmp4147
%.tmp4150 = getelementptr [15 x i8], [15 x i8]*@.str4149, i32 0, i32 0
%.tmp4151 = load i32, i32* %if_id
%.tmp4152 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4148, i8* %.tmp4150, i32 %.tmp4151)
%.tmp4153 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4154 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4153, i32 0, i32 6
%.tmp4155 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4154
%.tmp4157 = getelementptr [11 x i8], [11 x i8]*@.str4156, i32 0, i32 0
%.tmp4158 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4155, i8* %.tmp4157)
%else_block = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4158, %m261$.Node.type** %else_block
%.tmp4159 = load %m261$.Node.type*, %m261$.Node.type** %else_block
%.tmp4160 = icmp ne %m261$.Node.type* %.tmp4159, null
br i1 %.tmp4160, label %.if.true.4161, label %.if.false.4161
.if.true.4161:
%.tmp4162 = load %m261$.Node.type*, %m261$.Node.type** %else_block
%.tmp4163 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4162, i32 0, i32 6
%.tmp4164 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4163
%.tmp4165 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4164, i32 0, i32 0
%.tmp4166 = load i8*, i8** %.tmp4165
%.tmp4168 = getelementptr [11 x i8], [11 x i8]*@.str4167, i32 0, i32 0
%.tmp4169 = call i32(i8*,i8*) @strcmp(i8* %.tmp4166, i8* %.tmp4168)
%.tmp4170 = icmp eq i32 %.tmp4169, 0
br i1 %.tmp4170, label %.if.true.4171, label %.if.false.4171
.if.true.4171:
%.tmp4172 = load %m261$.Node.type*, %m261$.Node.type** %else_block
%.tmp4173 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4172, i32 0, i32 6
%.tmp4174 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4173
%.tmp4175 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4174, i32 0, i32 6
%.tmp4176 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4175
%.tmp4178 = getelementptr [6 x i8], [6 x i8]*@.str4177, i32 0, i32 0
%.tmp4179 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4176, i8* %.tmp4178)
store %m261$.Node.type* %.tmp4179, %m261$.Node.type** %block
%.tmp4180 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4181 = load %m261$.Node.type*, %m261$.Node.type** %block
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_block.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4180, %m261$.Node.type* %.tmp4181)
br label %.if.end.4171
.if.false.4171:
%.tmp4182 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4183 = load %m261$.Node.type*, %m261$.Node.type** %else_block
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_if_block.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4182, %m261$.Node.type* %.tmp4183)
br label %.if.end.4171
.if.end.4171:
br label %.if.end.4161
.if.false.4161:
br label %.if.end.4161
.if.end.4161:
%.tmp4184 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4185 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4184, i32 0, i32 1
%.tmp4186 = load %m0$.File.type*, %m0$.File.type** %.tmp4185
%.tmp4188 = getelementptr [23 x i8], [23 x i8]*@.str4187, i32 0, i32 0
%.tmp4189 = load i32, i32* %if_id
%.tmp4190 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4186, i8* %.tmp4188, i32 %.tmp4189)
%.tmp4191 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4192 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4191, i32 0, i32 1
%.tmp4193 = load %m0$.File.type*, %m0$.File.type** %.tmp4192
%.tmp4195 = getelementptr [13 x i8], [13 x i8]*@.str4194, i32 0, i32 0
%.tmp4196 = load i32, i32* %if_id
%.tmp4197 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4193, i8* %.tmp4195, i32 %.tmp4196)
ret void
}
define void @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%curr_node = alloca %m261$.Node.type*
store %m261$.Node.type* %.curr_node.arg, %m261$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp4198 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4199 = icmp ne %m261$.Node.type* %.tmp4198, null
br i1 %.tmp4199, label %.if.true.4200, label %.if.false.4200
.if.true.4200:
%.tmp4201 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4202 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4201, i32 0, i32 6
%.tmp4203 = load i8*, i8** %.tmp4202
%.tmp4204 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4205 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4204, i32 0, i32 3
%.tmp4206 = load i32, i32* %.tmp4205
%.tmp4207 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4208 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4207, i32 0, i32 4
%.tmp4209 = load i32, i32* %.tmp4208
%.tmp4210 = load i8*, i8** %msg
%.tmp4211 = call %m678$.Error.type*(i8*,i32,i32,i8*) @m678$new.m678$.Error.typep.cp.i.i.cp(i8* %.tmp4203, i32 %.tmp4206, i32 %.tmp4209, i8* %.tmp4210)
%err = alloca %m678$.Error.type*
store %m678$.Error.type* %.tmp4211, %m678$.Error.type** %err
%.tmp4212 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4213 = load %m678$.Error.type*, %m678$.Error.type** %err
call void(%m1791$.CompilerCtx.type*,%m678$.Error.type*) @m1791$append_error.v.m1791$.CompilerCtx.typep.m678$.Error.typep(%m1791$.CompilerCtx.type* %.tmp4212, %m678$.Error.type* %.tmp4213)
br label %.if.end.4200
.if.false.4200:
%.tmp4215 = getelementptr [61 x i8], [61 x i8]*@.str4214, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp4215)
br label %.if.end.4200
.if.end.4200:
ret void
}
define void @m1791$define_assignable.v.m1791$.CompilerCtx.typep.cp.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.ctx.arg, i8* %.name.arg, %m1791$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.info.arg, %m1791$.AssignableInfo.type** %info
%.tmp4216 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4217 = call %m1791$.ModuleLookup.type*(%m1791$.CompilerCtx.type*) @m1791$get_current_module.m1791$.ModuleLookup.typep.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp4216)
%mod = alloca %m1791$.ModuleLookup.type*
store %m1791$.ModuleLookup.type* %.tmp4217, %m1791$.ModuleLookup.type** %mod
%.tmp4218 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp4219 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp4218, i32 0, i32 3
%.tmp4220 = load %m1791$.Scope.type*, %m1791$.Scope.type** %.tmp4219
%.tmp4221 = icmp ne %m1791$.Scope.type* %.tmp4220, null
%.tmp4223 = getelementptr [82 x i8], [82 x i8]*@.str4222, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4221, i8* %.tmp4223)
%.tmp4224 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp4225 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp4224, i32 0, i32 3
%.tmp4226 = load %m1791$.Scope.type*, %m1791$.Scope.type** %.tmp4225
%current_scope = alloca %m1791$.Scope.type*
store %m1791$.Scope.type* %.tmp4226, %m1791$.Scope.type** %current_scope
%.tmp4227 = load i32, i32* @ScopeItem_size
%.tmp4228 = call i8*(i32) @malloc(i32 %.tmp4227)
%.tmp4229 = bitcast i8* %.tmp4228 to %m1791$.ScopeItem.type*
%newitem = alloca %m1791$.ScopeItem.type*
store %m1791$.ScopeItem.type* %.tmp4229, %m1791$.ScopeItem.type** %newitem
%.tmp4230 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %newitem
%.tmp4231 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4230, i32 0, i32 0
%.tmp4232 = load i8*, i8** %name
store i8* %.tmp4232, i8** %.tmp4231
%.tmp4233 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %newitem
%.tmp4234 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4233, i32 0, i32 1
%.tmp4235 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
store %m1791$.AssignableInfo.type* %.tmp4235, %m1791$.AssignableInfo.type** %.tmp4234
%.tmp4236 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %newitem
%.tmp4237 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4236, i32 0, i32 2
store %m1791$.ScopeItem.type* null, %m1791$.ScopeItem.type** %.tmp4237
%.tmp4238 = load %m1791$.Scope.type*, %m1791$.Scope.type** %current_scope
%.tmp4239 = getelementptr %m1791$.Scope.type, %m1791$.Scope.type* %.tmp4238, i32 0, i32 1
%.tmp4240 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %.tmp4239
%.tmp4241 = icmp eq %m1791$.ScopeItem.type* %.tmp4240, null
br i1 %.tmp4241, label %.if.true.4242, label %.if.false.4242
.if.true.4242:
%.tmp4243 = load %m1791$.Scope.type*, %m1791$.Scope.type** %current_scope
%.tmp4244 = getelementptr %m1791$.Scope.type, %m1791$.Scope.type* %.tmp4243, i32 0, i32 1
%.tmp4245 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %newitem
store %m1791$.ScopeItem.type* %.tmp4245, %m1791$.ScopeItem.type** %.tmp4244
ret void
br label %.if.end.4242
.if.false.4242:
br label %.if.end.4242
.if.end.4242:
%.tmp4246 = load %m1791$.Scope.type*, %m1791$.Scope.type** %current_scope
%.tmp4247 = getelementptr %m1791$.Scope.type, %m1791$.Scope.type* %.tmp4246, i32 0, i32 1
%.tmp4248 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %.tmp4247
%last_item = alloca %m1791$.ScopeItem.type*
store %m1791$.ScopeItem.type* %.tmp4248, %m1791$.ScopeItem.type** %last_item
br label %.for.start.4249
.for.start.4249:
%.tmp4250 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %last_item
%.tmp4251 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4250, i32 0, i32 2
%.tmp4252 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %.tmp4251
%.tmp4253 = icmp ne %m1791$.ScopeItem.type* %.tmp4252, null
br i1 %.tmp4253, label %.for.continue.4249, label %.for.end.4249
.for.continue.4249:
%.tmp4254 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %last_item
%.tmp4255 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4254, i32 0, i32 2
%.tmp4256 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %.tmp4255
store %m1791$.ScopeItem.type* %.tmp4256, %m1791$.ScopeItem.type** %last_item
br label %.for.start.4249
.for.end.4249:
%.tmp4257 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %last_item
%.tmp4258 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4257, i32 0, i32 2
%.tmp4259 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %newitem
store %m1791$.ScopeItem.type* %.tmp4259, %m1791$.ScopeItem.type** %.tmp4258
ret void
}
define %m1791$.ScopeItem.type* @m1791$find_defined_in.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.cp.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, %m261$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%dotted_name = alloca %m261$.Node.type*
store %m261$.Node.type* %.dotted_name.arg, %m261$.Node.type** %dotted_name
%err_buf = alloca i8*
%.tmp4260 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4261 = load i8*, i8** %module
%.tmp4262 = load %m261$.Node.type*, %m261$.Node.type** %dotted_name
%.tmp4263 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4262, i32 0, i32 1
%.tmp4264 = load i8*, i8** %.tmp4263
%.tmp4265 = call %m1791$.ScopeItem.type*(%m1791$.CompilerCtx.type*,i8*,i8*) @m1791$find_defined_str.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.cp.cp(%m1791$.CompilerCtx.type* %.tmp4260, i8* %.tmp4261, i8* %.tmp4264)
%found = alloca %m1791$.ScopeItem.type*
store %m1791$.ScopeItem.type* %.tmp4265, %m1791$.ScopeItem.type** %found
%.tmp4266 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %found
%.tmp4267 = icmp eq %m1791$.ScopeItem.type* %.tmp4266, null
br i1 %.tmp4267, label %.if.true.4268, label %.if.false.4268
.if.true.4268:
%.tmp4269 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp4271 = getelementptr [31 x i8], [31 x i8]*@.str4270, i32 0, i32 0
%.tmp4272 = load %m261$.Node.type*, %m261$.Node.type** %dotted_name
%.tmp4273 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4272, i32 0, i32 1
%.tmp4274 = load i8*, i8** %.tmp4273
%.tmp4275 = load i8*, i8** %module
%.tmp4276 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4269, i8* %.tmp4271, i8* %.tmp4274, i8* %.tmp4275)
%.tmp4277 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4278 = load %m261$.Node.type*, %m261$.Node.type** %dotted_name
%.tmp4279 = load i8*, i8** %err_buf
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4277, %m261$.Node.type* %.tmp4278, i8* %.tmp4279)
%.tmp4280 = bitcast ptr null to %m1791$.ScopeItem.type*
ret %m1791$.ScopeItem.type* %.tmp4280
br label %.if.end.4268
.if.false.4268:
br label %.if.end.4268
.if.end.4268:
br label %.for.start.4281
.for.start.4281:
%.tmp4282 = load %m261$.Node.type*, %m261$.Node.type** %dotted_name
%.tmp4283 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4282, i32 0, i32 7
%.tmp4284 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4283
%.tmp4285 = icmp ne %m261$.Node.type* %.tmp4284, null
%.tmp4286 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %found
%.tmp4287 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4286, i32 0, i32 1
%.tmp4288 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp4287
%.tmp4289 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4288, i32 0, i32 2
%.tmp4290 = load i8*, i8** %.tmp4289
%.tmp4292 = getelementptr [7 x i8], [7 x i8]*@.str4291, i32 0, i32 0
%.tmp4293 = call i32(i8*,i8*) @strcmp(i8* %.tmp4290, i8* %.tmp4292)
%.tmp4294 = icmp eq i32 %.tmp4293, 0
%.tmp4295 = and i1 %.tmp4285, %.tmp4294
br i1 %.tmp4295, label %.for.continue.4281, label %.for.end.4281
.for.continue.4281:
%.tmp4296 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4297 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %found
%.tmp4298 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4297, i32 0, i32 1
%.tmp4299 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp4298
%.tmp4300 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4299, i32 0, i32 0
%.tmp4301 = load i8*, i8** %.tmp4300
%.tmp4302 = load %m261$.Node.type*, %m261$.Node.type** %dotted_name
%.tmp4303 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4302, i32 0, i32 7
%.tmp4304 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4303
%.tmp4305 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4304, i32 0, i32 7
%.tmp4306 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4305
%.tmp4307 = call %m1791$.ScopeItem.type*(%m1791$.CompilerCtx.type*,i8*,%m261$.Node.type*) @m1791$find_defined_in.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.cp.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4296, i8* %.tmp4301, %m261$.Node.type* %.tmp4306)
store %m1791$.ScopeItem.type* %.tmp4307, %m1791$.ScopeItem.type** %found
%.tmp4308 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %found
%.tmp4309 = icmp eq %m1791$.ScopeItem.type* %.tmp4308, null
br i1 %.tmp4309, label %.if.true.4310, label %.if.false.4310
.if.true.4310:
%.tmp4311 = bitcast ptr null to %m1791$.ScopeItem.type*
ret %m1791$.ScopeItem.type* %.tmp4311
br label %.if.end.4310
.if.false.4310:
br label %.if.end.4310
.if.end.4310:
br label %.for.start.4281
.for.end.4281:
%.tmp4312 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %found
ret %m1791$.ScopeItem.type* %.tmp4312
}
define %m1791$.ScopeItem.type* @m1791$find_defined_str.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.cp.cp(%m1791$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp4313 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4314 = load i8*, i8** %module
%.tmp4315 = call %m1791$.ModuleLookup.type*(%m1791$.CompilerCtx.type*,i8*) @m1791$get_module.m1791$.ModuleLookup.typep.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.tmp4313, i8* %.tmp4314)
%mod = alloca %m1791$.ModuleLookup.type*
store %m1791$.ModuleLookup.type* %.tmp4315, %m1791$.ModuleLookup.type** %mod
%.tmp4316 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp4317 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp4316, i32 0, i32 3
%.tmp4318 = load %m1791$.Scope.type*, %m1791$.Scope.type** %.tmp4317
%.tmp4319 = icmp ne %m1791$.Scope.type* %.tmp4318, null
%.tmp4321 = getelementptr [77 x i8], [77 x i8]*@.str4320, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4319, i8* %.tmp4321)
%.tmp4323 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp4324 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp4323, i32 0, i32 3
%.tmp4325 = load %m1791$.Scope.type*, %m1791$.Scope.type** %.tmp4324
%s = alloca %m1791$.Scope.type*
store %m1791$.Scope.type* %.tmp4325, %m1791$.Scope.type** %s
br label %.for.start.4322
.for.start.4322:
%.tmp4326 = load %m1791$.Scope.type*, %m1791$.Scope.type** %s
%.tmp4327 = icmp ne %m1791$.Scope.type* %.tmp4326, null
br i1 %.tmp4327, label %.for.continue.4322, label %.for.end.4322
.for.continue.4322:
%.tmp4329 = load %m1791$.Scope.type*, %m1791$.Scope.type** %s
%.tmp4330 = getelementptr %m1791$.Scope.type, %m1791$.Scope.type* %.tmp4329, i32 0, i32 1
%.tmp4331 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %.tmp4330
%item = alloca %m1791$.ScopeItem.type*
store %m1791$.ScopeItem.type* %.tmp4331, %m1791$.ScopeItem.type** %item
br label %.for.start.4328
.for.start.4328:
%.tmp4332 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %item
%.tmp4333 = icmp ne %m1791$.ScopeItem.type* %.tmp4332, null
br i1 %.tmp4333, label %.for.continue.4328, label %.for.end.4328
.for.continue.4328:
%.tmp4334 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %item
%.tmp4335 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4334, i32 0, i32 0
%.tmp4336 = load i8*, i8** %.tmp4335
%.tmp4337 = load i8*, i8** %assignable_name
%.tmp4338 = call i32(i8*,i8*) @strcmp(i8* %.tmp4336, i8* %.tmp4337)
%.tmp4339 = icmp eq i32 %.tmp4338, 0
br i1 %.tmp4339, label %.if.true.4340, label %.if.false.4340
.if.true.4340:
%.tmp4341 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %item
ret %m1791$.ScopeItem.type* %.tmp4341
br label %.if.end.4340
.if.false.4340:
br label %.if.end.4340
.if.end.4340:
%.tmp4342 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %item
%.tmp4343 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4342, i32 0, i32 2
%.tmp4344 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %.tmp4343
store %m1791$.ScopeItem.type* %.tmp4344, %m1791$.ScopeItem.type** %item
br label %.for.start.4328
.for.end.4328:
%.tmp4345 = load %m1791$.Scope.type*, %m1791$.Scope.type** %s
%.tmp4346 = getelementptr %m1791$.Scope.type, %m1791$.Scope.type* %.tmp4345, i32 0, i32 3
%.tmp4347 = load %m1791$.Scope.type*, %m1791$.Scope.type** %.tmp4346
store %m1791$.Scope.type* %.tmp4347, %m1791$.Scope.type** %s
br label %.for.start.4322
.for.end.4322:
%.tmp4348 = bitcast ptr null to %m1791$.ScopeItem.type*
ret %m1791$.ScopeItem.type* %.tmp4348
}
define %m1791$.ScopeItem.type* @m1791$find_defined.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%dotted_name = alloca %m261$.Node.type*
store %m261$.Node.type* %.dotted_name.arg, %m261$.Node.type** %dotted_name
%.tmp4349 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4350 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4351 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4350, i32 0, i32 6
%.tmp4352 = load i8*, i8** %.tmp4351
%.tmp4353 = load %m261$.Node.type*, %m261$.Node.type** %dotted_name
%.tmp4354 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4353, i32 0, i32 6
%.tmp4355 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4354
%.tmp4356 = call %m1791$.ScopeItem.type*(%m1791$.CompilerCtx.type*,i8*,%m261$.Node.type*) @m1791$find_defined_in.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.cp.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4349, i8* %.tmp4352, %m261$.Node.type* %.tmp4355)
ret %m1791$.ScopeItem.type* %.tmp4356
}
define %m1791$.AssignableInfo.type* @m1791$get_dotted_name.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.dot_name_ptr.arg, %m1791$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%dot_name_ptr = alloca %m261$.Node.type*
store %m261$.Node.type* %.dot_name_ptr.arg, %m261$.Node.type** %dot_name_ptr
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.info.arg, %m1791$.AssignableInfo.type** %info
%err_msg = alloca i8*
%buf = alloca i8*
%.tmp4357 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4358 = icmp eq %m1791$.AssignableInfo.type* %.tmp4357, null
br i1 %.tmp4358, label %.if.true.4359, label %.if.false.4359
.if.true.4359:
%.tmp4360 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4361 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4363 = getelementptr [54 x i8], [54 x i8]*@.str4362, i32 0, i32 0
%.tmp4364 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4360, %m261$.Node.type* %.tmp4361, i8* %.tmp4363)
%.tmp4365 = call i32(i8*,...) @printf(i8* %.tmp4364)
%.tmp4366 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp4366
br label %.if.end.4359
.if.false.4359:
br label %.if.end.4359
.if.end.4359:
%.tmp4367 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4368 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4367, i32 0, i32 2
%.tmp4369 = load i8*, i8** %.tmp4368
%.tmp4371 = getelementptr [9 x i8], [9 x i8]*@.str4370, i32 0, i32 0
%.tmp4372 = call i32(i8*,i8*) @strcmp(i8* %.tmp4369, i8* %.tmp4371)
%.tmp4373 = icmp eq i32 %.tmp4372, 0
%.tmp4374 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4375 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4374, i32 0, i32 2
%.tmp4376 = load i8*, i8** %.tmp4375
%.tmp4378 = getelementptr [7 x i8], [7 x i8]*@.str4377, i32 0, i32 0
%.tmp4379 = call i32(i8*,i8*) @strcmp(i8* %.tmp4376, i8* %.tmp4378)
%.tmp4380 = icmp eq i32 %.tmp4379, 0
%.tmp4381 = or i1 %.tmp4373, %.tmp4380
br i1 %.tmp4381, label %.if.true.4382, label %.if.false.4382
.if.true.4382:
%.tmp4383 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4384 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4383, i32 0, i32 7
%.tmp4385 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4384
%.tmp4386 = icmp ne %m261$.Node.type* %.tmp4385, null
br i1 %.tmp4386, label %.if.true.4387, label %.if.false.4387
.if.true.4387:
%.tmp4388 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4390 = getelementptr [46 x i8], [46 x i8]*@.str4389, i32 0, i32 0
%.tmp4391 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4392 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4391, i32 0, i32 7
%.tmp4393 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4392
%.tmp4394 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4393, i32 0, i32 7
%.tmp4395 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4394
%.tmp4396 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4395, i32 0, i32 1
%.tmp4397 = load i8*, i8** %.tmp4396
%.tmp4398 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4399 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4398, i32 0, i32 1
%.tmp4400 = load i8*, i8** %.tmp4399
%.tmp4401 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4388, i8* %.tmp4390, i8* %.tmp4397, i8* %.tmp4400)
%.tmp4402 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4403 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4404 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4402, %m261$.Node.type* %.tmp4403, i8* %.tmp4404)
%.tmp4405 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp4405
br label %.if.end.4387
.if.false.4387:
br label %.if.end.4387
.if.end.4387:
%.tmp4406 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
ret %m1791$.AssignableInfo.type* %.tmp4406
br label %.if.end.4382
.if.false.4382:
%.tmp4407 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4408 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4407, i32 0, i32 2
%.tmp4409 = load i8*, i8** %.tmp4408
%.tmp4411 = getelementptr [9 x i8], [9 x i8]*@.str4410, i32 0, i32 0
%.tmp4412 = call i32(i8*,i8*) @strcmp(i8* %.tmp4409, i8* %.tmp4411)
%.tmp4413 = icmp eq i32 %.tmp4412, 0
%.tmp4414 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4415 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4414, i32 0, i32 7
%.tmp4416 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4415
%.tmp4417 = icmp ne %m261$.Node.type* %.tmp4416, null
%.tmp4418 = and i1 %.tmp4413, %.tmp4417
br i1 %.tmp4418, label %.if.true.4419, label %.if.false.4419
.if.true.4419:
%.tmp4420 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%base_var = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4420, %m1791$.AssignableInfo.type** %base_var
%.tmp4421 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base_var
%.tmp4422 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4421, i32 0, i32 3
%.tmp4423 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4422
%struct_info = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp4423, %m1791$.Type.type** %struct_info
br label %.for.start.4424
.for.start.4424:
%.tmp4425 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base_var
%.tmp4426 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4425, i32 0, i32 3
%.tmp4427 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4426
%.tmp4428 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4427, i32 0, i32 0
%.tmp4429 = load i8*, i8** %.tmp4428
%.tmp4431 = getelementptr [4 x i8], [4 x i8]*@.str4430, i32 0, i32 0
%.tmp4432 = call i32(i8*,i8*) @strcmp(i8* %.tmp4429, i8* %.tmp4431)
%.tmp4433 = icmp eq i32 %.tmp4432, 0
br i1 %.tmp4433, label %.for.continue.4424, label %.for.end.4424
.for.continue.4424:
%.tmp4434 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4435 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp4434)
%new_base = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4435, %m1791$.AssignableInfo.type** %new_base
%.tmp4436 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4437 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp4436, %m1791$.AssignableInfo.type* %.tmp4437)
%.tmp4438 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
%.tmp4439 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4438, i32 0, i32 3
%.tmp4440 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base_var
%.tmp4441 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4440, i32 0, i32 3
%.tmp4442 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4441
%.tmp4443 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4442, i32 0, i32 3
%.tmp4444 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4443
store %m1791$.Type.type* %.tmp4444, %m1791$.Type.type** %.tmp4439
%.tmp4445 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4446 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4445, i32 0, i32 1
%.tmp4447 = load %m0$.File.type*, %m0$.File.type** %.tmp4446
%.tmp4449 = getelementptr [23 x i8], [23 x i8]*@.str4448, i32 0, i32 0
%.tmp4450 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
%.tmp4451 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4450)
%.tmp4452 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4453 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
%.tmp4454 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4453, i32 0, i32 3
%.tmp4455 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4454
%.tmp4456 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4452, %m1791$.Type.type* %.tmp4455)
%.tmp4457 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4458 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base_var
%.tmp4459 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4458, i32 0, i32 3
%.tmp4460 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4459
%.tmp4461 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4457, %m1791$.Type.type* %.tmp4460)
%.tmp4462 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base_var
%.tmp4463 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4462)
%.tmp4464 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4447, i8* %.tmp4449, i8* %.tmp4451, i8* %.tmp4456, i8* %.tmp4461, i8* %.tmp4463)
%.tmp4465 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
store %m1791$.AssignableInfo.type* %.tmp4465, %m1791$.AssignableInfo.type** %base_var
%.tmp4466 = load %m1791$.Type.type*, %m1791$.Type.type** %struct_info
%.tmp4467 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4466, i32 0, i32 3
%.tmp4468 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4467
store %m1791$.Type.type* %.tmp4468, %m1791$.Type.type** %struct_info
br label %.for.start.4424
.for.end.4424:
%.tmp4469 = load %m1791$.Type.type*, %m1791$.Type.type** %struct_info
%.tmp4470 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4469, i32 0, i32 0
%.tmp4471 = load i8*, i8** %.tmp4470
%.tmp4473 = getelementptr [10 x i8], [10 x i8]*@.str4472, i32 0, i32 0
%.tmp4474 = call i32(i8*,i8*) @strcmp(i8* %.tmp4471, i8* %.tmp4473)
%.tmp4475 = icmp eq i32 %.tmp4474, 0
br i1 %.tmp4475, label %.if.true.4476, label %.if.false.4476
.if.true.4476:
%.tmp4477 = load %m1791$.Type.type*, %m1791$.Type.type** %struct_info
%.tmp4478 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4477, i32 0, i32 3
%.tmp4479 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4478
store %m1791$.Type.type* %.tmp4479, %m1791$.Type.type** %struct_info
br label %.if.end.4476
.if.false.4476:
br label %.if.end.4476
.if.end.4476:
%.tmp4480 = load %m1791$.Type.type*, %m1791$.Type.type** %struct_info
%.tmp4481 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4480, i32 0, i32 0
%.tmp4482 = load i8*, i8** %.tmp4481
%.tmp4484 = getelementptr [7 x i8], [7 x i8]*@.str4483, i32 0, i32 0
%.tmp4485 = call i32(i8*,i8*) @strcmp(i8* %.tmp4482, i8* %.tmp4484)
%.tmp4486 = icmp ne i32 %.tmp4485, 0
br i1 %.tmp4486, label %.if.true.4487, label %.if.false.4487
.if.true.4487:
%.tmp4488 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4490 = getelementptr [48 x i8], [48 x i8]*@.str4489, i32 0, i32 0
%.tmp4491 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4492 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4491, i32 0, i32 7
%.tmp4493 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4492
%.tmp4494 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4493, i32 0, i32 7
%.tmp4495 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4494
%.tmp4496 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4495, i32 0, i32 1
%.tmp4497 = load i8*, i8** %.tmp4496
%.tmp4498 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4499 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4498, i32 0, i32 1
%.tmp4500 = load i8*, i8** %.tmp4499
%.tmp4501 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4488, i8* %.tmp4490, i8* %.tmp4497, i8* %.tmp4500)
%.tmp4502 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4503 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4504 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4502, %m261$.Node.type* %.tmp4503, i8* %.tmp4504)
%.tmp4505 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp4505
br label %.if.end.4487
.if.false.4487:
br label %.if.end.4487
.if.end.4487:
%.tmp4506 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4507 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4506, i32 0, i32 7
%.tmp4508 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4507
%.tmp4509 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4508, i32 0, i32 7
%.tmp4510 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4509
%.tmp4511 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4510, i32 0, i32 1
%.tmp4512 = load i8*, i8** %.tmp4511
%field_name = alloca i8*
store i8* %.tmp4512, i8** %field_name
%quit = alloca i1
store i1 0, i1* %quit
%field_id = alloca i32
store i32 0, i32* %field_id
%.tmp4513 = bitcast ptr null to %m1791$.Type.type*
%found_field = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp4513, %m1791$.Type.type** %found_field
%.tmp4515 = load %m1791$.Type.type*, %m1791$.Type.type** %struct_info
%.tmp4516 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4515, i32 0, i32 3
%.tmp4517 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4516
%field = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp4517, %m1791$.Type.type** %field
br label %.for.start.4514
.for.start.4514:
%.tmp4518 = load i1, i1* %quit
%.tmp4519 = icmp eq i1 %.tmp4518, 0
br i1 %.tmp4519, label %.for.continue.4514, label %.for.end.4514
.for.continue.4514:
%.tmp4520 = load %m1791$.Type.type*, %m1791$.Type.type** %field
%.tmp4521 = icmp eq %m1791$.Type.type* %.tmp4520, null
br i1 %.tmp4521, label %.if.true.4522, label %.if.false.4522
.if.true.4522:
store i1 1, i1* %quit
br label %.if.end.4522
.if.false.4522:
%.tmp4523 = load %m1791$.Type.type*, %m1791$.Type.type** %field
%.tmp4524 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4523, i32 0, i32 1
%.tmp4525 = load i8*, i8** %.tmp4524
%.tmp4526 = load i8*, i8** %field_name
%.tmp4527 = call i32(i8*,i8*) @strcmp(i8* %.tmp4525, i8* %.tmp4526)
%.tmp4528 = icmp eq i32 %.tmp4527, 0
br i1 %.tmp4528, label %.if.true.4529, label %.if.false.4529
.if.true.4529:
store i1 1, i1* %quit
%.tmp4530 = load %m1791$.Type.type*, %m1791$.Type.type** %field
store %m1791$.Type.type* %.tmp4530, %m1791$.Type.type** %found_field
br label %.if.end.4529
.if.false.4529:
%.tmp4531 = load i32, i32* %field_id
%.tmp4532 = add i32 %.tmp4531, 1
store i32 %.tmp4532, i32* %field_id
br label %.if.end.4529
.if.end.4529:
br label %.if.end.4522
.if.end.4522:
%.tmp4533 = load %m1791$.Type.type*, %m1791$.Type.type** %field
%.tmp4534 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4533, i32 0, i32 4
%.tmp4535 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4534
store %m1791$.Type.type* %.tmp4535, %m1791$.Type.type** %field
br label %.for.start.4514
.for.end.4514:
%.tmp4536 = load %m1791$.Type.type*, %m1791$.Type.type** %found_field
%.tmp4537 = icmp eq %m1791$.Type.type* %.tmp4536, null
br i1 %.tmp4537, label %.if.true.4538, label %.if.false.4538
.if.true.4538:
%.tmp4539 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4541 = getelementptr [34 x i8], [34 x i8]*@.str4540, i32 0, i32 0
%.tmp4542 = load i8*, i8** %field_name
%.tmp4543 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4544 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4543, i32 0, i32 1
%.tmp4545 = load i8*, i8** %.tmp4544
%.tmp4546 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4539, i8* %.tmp4541, i8* %.tmp4542, i8* %.tmp4545)
%.tmp4547 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4548 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4549 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4547, %m261$.Node.type* %.tmp4548, i8* %.tmp4549)
%.tmp4550 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp4550
br label %.if.end.4538
.if.false.4538:
br label %.if.end.4538
.if.end.4538:
%.tmp4551 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4552 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp4551)
%new_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4552, %m1791$.AssignableInfo.type** %new_info
%.tmp4553 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_info
%.tmp4554 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4553, i32 0, i32 3
%.tmp4555 = load %m1791$.Type.type*, %m1791$.Type.type** %found_field
store %m1791$.Type.type* %.tmp4555, %m1791$.Type.type** %.tmp4554
%.tmp4556 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4557 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_info
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp4556, %m1791$.AssignableInfo.type* %.tmp4557)
%.tmp4558 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_info
%.tmp4559 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4558, i32 0, i32 2
%.tmp4561 = getelementptr [9 x i8], [9 x i8]*@.str4560, i32 0, i32 0
store i8* %.tmp4561, i8** %.tmp4559
%.tmp4562 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4563 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base_var
%.tmp4564 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4563, i32 0, i32 3
%.tmp4565 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4564
%.tmp4566 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4562, %m1791$.Type.type* %.tmp4565)
%info_tr = alloca i8*
store i8* %.tmp4566, i8** %info_tr
%.tmp4567 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4568 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4567, i32 0, i32 1
%.tmp4569 = load %m0$.File.type*, %m0$.File.type** %.tmp4568
%.tmp4571 = getelementptr [46 x i8], [46 x i8]*@.str4570, i32 0, i32 0
%.tmp4572 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_info
%.tmp4573 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4572)
%.tmp4574 = load i8*, i8** %info_tr
%.tmp4575 = load i8*, i8** %info_tr
%.tmp4576 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base_var
%.tmp4577 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4576)
%.tmp4578 = load i32, i32* %field_id
%.tmp4579 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4569, i8* %.tmp4571, i8* %.tmp4573, i8* %.tmp4574, i8* %.tmp4575, i8* %.tmp4577, i32 %.tmp4578)
%.tmp4580 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4581 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4582 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4581, i32 0, i32 7
%.tmp4583 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4582
%.tmp4584 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4583, i32 0, i32 7
%.tmp4585 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4584
%.tmp4586 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_info
%.tmp4587 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,%m1791$.AssignableInfo.type*) @m1791$get_dotted_name.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp4580, %m261$.Node.type* %.tmp4585, %m1791$.AssignableInfo.type* %.tmp4586)
ret %m1791$.AssignableInfo.type* %.tmp4587
br label %.if.end.4419
.if.false.4419:
%.tmp4588 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4589 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4588, i32 0, i32 2
%.tmp4590 = load i8*, i8** %.tmp4589
%.tmp4592 = getelementptr [9 x i8], [9 x i8]*@.str4591, i32 0, i32 0
%.tmp4593 = call i32(i8*,i8*) @strcmp(i8* %.tmp4590, i8* %.tmp4592)
%.tmp4594 = icmp eq i32 %.tmp4593, 0
br i1 %.tmp4594, label %.if.true.4595, label %.if.false.4595
.if.true.4595:
%.tmp4596 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
ret %m1791$.AssignableInfo.type* %.tmp4596
br label %.if.end.4595
.if.false.4595:
br label %.if.end.4595
.if.end.4595:
br label %.if.end.4419
.if.end.4419:
br label %.if.end.4382
.if.end.4382:
%.tmp4597 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4598 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4600 = getelementptr [43 x i8], [43 x i8]*@.str4599, i32 0, i32 0
%.tmp4601 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4597, %m261$.Node.type* %.tmp4598, i8* %.tmp4600)
%.tmp4602 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4603 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4602, i32 0, i32 2
%.tmp4604 = load i8*, i8** %.tmp4603
%.tmp4605 = call i32(i8*,...) @printf(i8* %.tmp4601, i8* %.tmp4604)
%.tmp4606 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp4606
}
define %m1791$.AssignableInfo.type* @m1791$compile_addr.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%err_msg = alloca i8*
%.tmp4607 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%curr_node = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4607, %m261$.Node.type** %curr_node
%.tmp4608 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4609 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4608, i32 0, i32 0
%.tmp4610 = load i8*, i8** %.tmp4609
%.tmp4612 = getelementptr [12 x i8], [12 x i8]*@.str4611, i32 0, i32 0
%.tmp4613 = call i32(i8*,i8*) @strcmp(i8* %.tmp4610, i8* %.tmp4612)
%.tmp4614 = icmp ne i32 %.tmp4613, 0
br i1 %.tmp4614, label %.if.true.4615, label %.if.false.4615
.if.true.4615:
%.tmp4617 = getelementptr [92 x i8], [92 x i8]*@.str4616, i32 0, i32 0
%.tmp4618 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4619 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4618, i32 0, i32 0
%.tmp4620 = load i8*, i8** %.tmp4619
%.tmp4621 = call i32(i8*,...) @printf(i8* %.tmp4617, i8* %.tmp4620)
%.tmp4622 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4623 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4622, i32 0, i32 6
%.tmp4624 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4623
store %m261$.Node.type* %.tmp4624, %m261$.Node.type** %curr_node
br label %.if.end.4615
.if.false.4615:
br label %.if.end.4615
.if.end.4615:
%.tmp4625 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4626 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4625, i32 0, i32 6
%.tmp4627 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4626
%assignable_name = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4627, %m261$.Node.type** %assignable_name
%.tmp4628 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4629 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4630 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4629, i32 0, i32 6
%.tmp4631 = load i8*, i8** %.tmp4630
%.tmp4632 = load %m261$.Node.type*, %m261$.Node.type** %assignable_name
%.tmp4633 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4632, i32 0, i32 6
%.tmp4634 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4633
%.tmp4635 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4634, i32 0, i32 1
%.tmp4636 = load i8*, i8** %.tmp4635
%.tmp4637 = call %m1791$.ScopeItem.type*(%m1791$.CompilerCtx.type*,i8*,i8*) @m1791$find_defined_str.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.cp.cp(%m1791$.CompilerCtx.type* %.tmp4628, i8* %.tmp4631, i8* %.tmp4636)
%scope_info = alloca %m1791$.ScopeItem.type*
store %m1791$.ScopeItem.type* %.tmp4637, %m1791$.ScopeItem.type** %scope_info
%.tmp4638 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %scope_info
%.tmp4639 = icmp eq %m1791$.ScopeItem.type* %.tmp4638, null
br i1 %.tmp4639, label %.if.true.4640, label %.if.false.4640
.if.true.4640:
%.tmp4641 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4643 = getelementptr [25 x i8], [25 x i8]*@.str4642, i32 0, i32 0
%.tmp4644 = load %m261$.Node.type*, %m261$.Node.type** %assignable_name
%.tmp4645 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4644, i32 0, i32 6
%.tmp4646 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4645
%.tmp4647 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4646, i32 0, i32 1
%.tmp4648 = load i8*, i8** %.tmp4647
%.tmp4649 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4641, i8* %.tmp4643, i8* %.tmp4648)
%.tmp4650 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4651 = load %m261$.Node.type*, %m261$.Node.type** %assignable_name
%.tmp4652 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4650, %m261$.Node.type* %.tmp4651, i8* %.tmp4652)
%.tmp4653 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp4653
br label %.if.end.4640
.if.false.4640:
br label %.if.end.4640
.if.end.4640:
%.tmp4654 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %scope_info
%.tmp4655 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4654, i32 0, i32 1
%.tmp4656 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp4655
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4656, %m1791$.AssignableInfo.type** %info
%.tmp4657 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4658 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4657, i32 0, i32 2
%.tmp4659 = load i8*, i8** %.tmp4658
%.tmp4661 = getelementptr [7 x i8], [7 x i8]*@.str4660, i32 0, i32 0
%.tmp4662 = call i32(i8*,i8*) @strcmp(i8* %.tmp4659, i8* %.tmp4661)
%.tmp4663 = icmp eq i32 %.tmp4662, 0
br i1 %.tmp4663, label %.if.true.4664, label %.if.false.4664
.if.true.4664:
%.tmp4665 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4666 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4667 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4666)
%.tmp4668 = load %m261$.Node.type*, %m261$.Node.type** %assignable_name
%.tmp4669 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4668, i32 0, i32 6
%.tmp4670 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4669
%.tmp4671 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4670, i32 0, i32 7
%.tmp4672 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4671
%.tmp4673 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4672, i32 0, i32 7
%.tmp4674 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4673
%.tmp4675 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4674, i32 0, i32 1
%.tmp4676 = load i8*, i8** %.tmp4675
%.tmp4677 = call %m1791$.ScopeItem.type*(%m1791$.CompilerCtx.type*,i8*,i8*) @m1791$find_defined_str.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.cp.cp(%m1791$.CompilerCtx.type* %.tmp4665, i8* %.tmp4667, i8* %.tmp4676)
store %m1791$.ScopeItem.type* %.tmp4677, %m1791$.ScopeItem.type** %scope_info
%.tmp4678 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %scope_info
%.tmp4679 = icmp eq %m1791$.ScopeItem.type* %.tmp4678, null
br i1 %.tmp4679, label %.if.true.4680, label %.if.false.4680
.if.true.4680:
%.tmp4681 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4683 = getelementptr [31 x i8], [31 x i8]*@.str4682, i32 0, i32 0
%.tmp4684 = load %m261$.Node.type*, %m261$.Node.type** %assignable_name
%.tmp4685 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4684, i32 0, i32 6
%.tmp4686 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4685
%.tmp4687 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4686, i32 0, i32 7
%.tmp4688 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4687
%.tmp4689 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4688, i32 0, i32 7
%.tmp4690 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4689
%.tmp4691 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4690, i32 0, i32 1
%.tmp4692 = load i8*, i8** %.tmp4691
%.tmp4693 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4694 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4693)
%.tmp4695 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4681, i8* %.tmp4683, i8* %.tmp4692, i8* %.tmp4694)
%.tmp4696 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4697 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4698 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4696, %m261$.Node.type* %.tmp4697, i8* %.tmp4698)
%.tmp4699 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp4699
br label %.if.end.4680
.if.false.4680:
br label %.if.end.4680
.if.end.4680:
%.tmp4700 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %scope_info
%.tmp4701 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4700, i32 0, i32 1
%.tmp4702 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp4701
store %m1791$.AssignableInfo.type* %.tmp4702, %m1791$.AssignableInfo.type** %info
%.tmp4703 = load %m261$.Node.type*, %m261$.Node.type** %assignable_name
%.tmp4704 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4703, i32 0, i32 6
%.tmp4705 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4704
%.tmp4706 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4705, i32 0, i32 7
%.tmp4707 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4706
%.tmp4708 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4707, i32 0, i32 7
%.tmp4709 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4708
store %m261$.Node.type* %.tmp4709, %m261$.Node.type** %assignable_name
br label %.if.end.4664
.if.false.4664:
%.tmp4710 = load %m261$.Node.type*, %m261$.Node.type** %assignable_name
%.tmp4711 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4710, i32 0, i32 6
%.tmp4712 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4711
store %m261$.Node.type* %.tmp4712, %m261$.Node.type** %assignable_name
br label %.if.end.4664
.if.end.4664:
%.tmp4713 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4714 = load %m261$.Node.type*, %m261$.Node.type** %assignable_name
%.tmp4715 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4716 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,%m1791$.AssignableInfo.type*) @m1791$get_dotted_name.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp4713, %m261$.Node.type* %.tmp4714, %m1791$.AssignableInfo.type* %.tmp4715)
%base = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4716, %m1791$.AssignableInfo.type** %base
%.tmp4718 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4719 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4718, i32 0, i32 6
%.tmp4720 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4719
%.tmp4721 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4720, i32 0, i32 7
%.tmp4722 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4721
%addr = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4722, %m261$.Node.type** %addr
br label %.for.start.4717
.for.start.4717:
%.tmp4723 = load %m261$.Node.type*, %m261$.Node.type** %addr
%.tmp4724 = icmp ne %m261$.Node.type* %.tmp4723, null
br i1 %.tmp4724, label %.for.continue.4717, label %.for.end.4717
.for.continue.4717:
%.tmp4725 = load %m261$.Node.type*, %m261$.Node.type** %addr
%.tmp4726 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4725, i32 0, i32 7
%.tmp4727 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4726
%index = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4727, %m261$.Node.type** %index
%.tmp4728 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4729 = load %m261$.Node.type*, %m261$.Node.type** %index
%.tmp4730 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4728, %m261$.Node.type* %.tmp4729)
%index_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4730, %m1791$.AssignableInfo.type** %index_info
%.tmp4731 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4732 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base
%.tmp4733 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4732, i32 0, i32 3
%.tmp4734 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4733
%.tmp4735 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4731, %m1791$.Type.type* %.tmp4734)
%base_type = alloca i8*
store i8* %.tmp4735, i8** %base_type
%.tmp4736 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4737 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %index_info
%.tmp4738 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4737, i32 0, i32 3
%.tmp4739 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4738
%.tmp4740 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4736, %m1791$.Type.type* %.tmp4739)
%index_type = alloca i8*
store i8* %.tmp4740, i8** %index_type
%.tmp4741 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4742 = call i32(%m1791$.CompilerCtx.type*) @m1791$new_uid.i.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp4741)
%tmp_id = alloca i32
store i32 %.tmp4742, i32* %tmp_id
%.tmp4743 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4744 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4743, i32 0, i32 1
%.tmp4745 = load %m0$.File.type*, %m0$.File.type** %.tmp4744
%.tmp4747 = getelementptr [28 x i8], [28 x i8]*@.str4746, i32 0, i32 0
%.tmp4748 = load i32, i32* %tmp_id
%.tmp4749 = load i8*, i8** %base_type
%.tmp4750 = load i8*, i8** %base_type
%.tmp4751 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base
%.tmp4752 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4751)
%.tmp4753 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4745, i8* %.tmp4747, i32 %.tmp4748, i8* %.tmp4749, i8* %.tmp4750, i8* %.tmp4752)
%.tmp4754 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4755 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp4754)
%new_base = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4755, %m1791$.AssignableInfo.type** %new_base
%.tmp4756 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4757 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp4756, %m1791$.AssignableInfo.type* %.tmp4757)
%.tmp4758 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base
%.tmp4759 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4758, i32 0, i32 3
%.tmp4760 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4759
%.tmp4761 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4760, i32 0, i32 3
%.tmp4762 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4761
%.tmp4763 = icmp eq %m1791$.Type.type* %.tmp4762, null
br i1 %.tmp4763, label %.if.true.4764, label %.if.false.4764
.if.true.4764:
%.tmp4765 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4767 = getelementptr [35 x i8], [35 x i8]*@.str4766, i32 0, i32 0
%.tmp4768 = load i8*, i8** %base_type
%.tmp4769 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4765, i8* %.tmp4767, i8* %.tmp4768)
%.tmp4770 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4771 = load %m261$.Node.type*, %m261$.Node.type** %addr
%.tmp4772 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4770, %m261$.Node.type* %.tmp4771, i8* %.tmp4772)
%.tmp4773 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base
ret %m1791$.AssignableInfo.type* %.tmp4773
br label %.if.end.4764
.if.false.4764:
br label %.if.end.4764
.if.end.4764:
%.tmp4774 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
%.tmp4775 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4774, i32 0, i32 3
%.tmp4776 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base
%.tmp4777 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4776, i32 0, i32 3
%.tmp4778 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4777
%.tmp4779 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4778, i32 0, i32 3
%.tmp4780 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4779
store %m1791$.Type.type* %.tmp4780, %m1791$.Type.type** %.tmp4775
%.tmp4781 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4782 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
%.tmp4783 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4782, i32 0, i32 3
%.tmp4784 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4783
%.tmp4785 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4781, %m1791$.Type.type* %.tmp4784)
%base_type_2 = alloca i8*
store i8* %.tmp4785, i8** %base_type_2
%.tmp4786 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4787 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4786, i32 0, i32 1
%.tmp4788 = load %m0$.File.type*, %m0$.File.type** %.tmp4787
%.tmp4790 = getelementptr [44 x i8], [44 x i8]*@.str4789, i32 0, i32 0
%.tmp4791 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
%.tmp4792 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4791)
%.tmp4793 = load i8*, i8** %base_type_2
%.tmp4794 = load i8*, i8** %base_type_2
%.tmp4795 = load i32, i32* %tmp_id
%.tmp4796 = load i8*, i8** %index_type
%.tmp4797 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %index_info
%.tmp4798 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4797)
%.tmp4799 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4788, i8* %.tmp4790, i8* %.tmp4792, i8* %.tmp4793, i8* %.tmp4794, i32 %.tmp4795, i8* %.tmp4796, i8* %.tmp4798)
%.tmp4800 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
store %m1791$.AssignableInfo.type* %.tmp4800, %m1791$.AssignableInfo.type** %base
%.tmp4801 = load %m261$.Node.type*, %m261$.Node.type** %addr
%.tmp4802 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4801, i32 0, i32 7
%.tmp4803 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4802
%.tmp4804 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4803, i32 0, i32 7
%.tmp4805 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4804
%.tmp4806 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4805, i32 0, i32 7
%.tmp4807 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4806
store %m261$.Node.type* %.tmp4807, %m261$.Node.type** %addr
br label %.for.start.4717
.for.end.4717:
%.tmp4808 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base
ret %m1791$.AssignableInfo.type* %.tmp4808
}
%m1791$.StackHead.type = type {%m1909$.SYStack.type*}
@StackHead_size = constant i32 8
define %m1791$.AssignableInfo.type* @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%curr_node = alloca %m261$.Node.type*
store %m261$.Node.type* %.curr_node.arg, %m261$.Node.type** %curr_node
%.tmp4809 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4810 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4809, i32 0, i32 6
%.tmp4811 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4810
%.tmp4813 = getelementptr [16 x i8], [16 x i8]*@.str4812, i32 0, i32 0
%.tmp4814 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4811, i8* %.tmp4813)
%assignable_start = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4814, %m261$.Node.type** %assignable_start
%.tmp4815 = load %m261$.Node.type*, %m261$.Node.type** %assignable_start
%.tmp4816 = call %m1909$.SYStack.type*(%m261$.Node.type*) @m1909$sy_algorithm.m1909$.SYStack.typep.m261$.Node.typep(%m261$.Node.type* %.tmp4815)
%operator_stack = alloca %m1909$.SYStack.type*
store %m1909$.SYStack.type* %.tmp4816, %m1909$.SYStack.type** %operator_stack
%.tmp4817 = load i32, i32* @StackHead_size
%.tmp4818 = call i8*(i32) @malloc(i32 %.tmp4817)
%.tmp4819 = bitcast i8* %.tmp4818 to %m1791$.StackHead.type*
%stack = alloca %m1791$.StackHead.type*
store %m1791$.StackHead.type* %.tmp4819, %m1791$.StackHead.type** %stack
%.tmp4820 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp4821 = getelementptr %m1791$.StackHead.type, %m1791$.StackHead.type* %.tmp4820, i32 0, i32 0
%.tmp4822 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %operator_stack
store %m1909$.SYStack.type* %.tmp4822, %m1909$.SYStack.type** %.tmp4821
%.tmp4823 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4824 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp4825 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m1791$.StackHead.type*) @m1791$compile_assignable_stack.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m1791$.StackHead.typep(%m1791$.CompilerCtx.type* %.tmp4823, %m1791$.StackHead.type* %.tmp4824)
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4825, %m1791$.AssignableInfo.type** %info
%.tmp4826 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4827 = icmp eq %m1791$.AssignableInfo.type* %.tmp4826, null
br i1 %.tmp4827, label %.if.true.4828, label %.if.false.4828
.if.true.4828:
%.tmp4829 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
ret %m1791$.AssignableInfo.type* %.tmp4829
br label %.if.end.4828
.if.false.4828:
br label %.if.end.4828
.if.end.4828:
%.tmp4830 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4831 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4830, i32 0, i32 6
%.tmp4832 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4831
%.tmp4834 = getelementptr [5 x i8], [5 x i8]*@.str4833, i32 0, i32 0
%.tmp4835 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4832, i8* %.tmp4834)
%cast = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4835, %m261$.Node.type** %cast
%.tmp4836 = load %m261$.Node.type*, %m261$.Node.type** %cast
%.tmp4837 = icmp ne %m261$.Node.type* %.tmp4836, null
br i1 %.tmp4837, label %.if.true.4838, label %.if.false.4838
.if.true.4838:
%.tmp4839 = load %m261$.Node.type*, %m261$.Node.type** %cast
%.tmp4840 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4839, i32 0, i32 6
%.tmp4841 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4840
%.tmp4843 = getelementptr [5 x i8], [5 x i8]*@.str4842, i32 0, i32 0
%.tmp4844 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4841, i8* %.tmp4843)
%cast_type = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4844, %m261$.Node.type** %cast_type
%.tmp4845 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4846 = load %m261$.Node.type*, %m261$.Node.type** %cast_type
%.tmp4847 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4846, i32 0, i32 6
%.tmp4848 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4847
%.tmp4849 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4845, %m261$.Node.type* %.tmp4848)
%type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp4849, %m1791$.Type.type** %type
%.tmp4850 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4851 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4850)
%prev_id = alloca i8*
store i8* %.tmp4851, i8** %prev_id
%.tmp4852 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4853 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp4852, %m1791$.AssignableInfo.type* %.tmp4853)
%.tmp4854 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4855 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4854, i32 0, i32 1
%.tmp4856 = load %m0$.File.type*, %m0$.File.type** %.tmp4855
%.tmp4858 = getelementptr [26 x i8], [26 x i8]*@.str4857, i32 0, i32 0
%.tmp4859 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4860 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4859)
%.tmp4861 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4862 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4863 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4862, i32 0, i32 3
%.tmp4864 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4863
%.tmp4865 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4861, %m1791$.Type.type* %.tmp4864)
%.tmp4866 = load i8*, i8** %prev_id
%.tmp4867 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4868 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp4869 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4867, %m1791$.Type.type* %.tmp4868)
%.tmp4870 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4856, i8* %.tmp4858, i8* %.tmp4860, i8* %.tmp4865, i8* %.tmp4866, i8* %.tmp4869)
%.tmp4871 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4872 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4871, i32 0, i32 3
%.tmp4873 = load %m1791$.Type.type*, %m1791$.Type.type** %type
store %m1791$.Type.type* %.tmp4873, %m1791$.Type.type** %.tmp4872
br label %.if.end.4838
.if.false.4838:
br label %.if.end.4838
.if.end.4838:
%.tmp4874 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
ret %m1791$.AssignableInfo.type* %.tmp4874
}
define %m1791$.AssignableInfo.type* @m1791$compile_assignable_stack.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m1791$.StackHead.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stack = alloca %m1791$.StackHead.type*
store %m1791$.StackHead.type* %.stack.arg, %m1791$.StackHead.type** %stack
%.tmp4875 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp4876 = getelementptr %m1791$.StackHead.type, %m1791$.StackHead.type* %.tmp4875, i32 0, i32 0
%.tmp4877 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp4876
%.tmp4878 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp4877, i32 0, i32 0
%.tmp4879 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4878
%.tmp4880 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4879, i32 0, i32 0
%.tmp4881 = load i8*, i8** %.tmp4880
%.tmp4883 = getelementptr [16 x i8], [16 x i8]*@.str4882, i32 0, i32 0
%.tmp4884 = call i32(i8*,i8*) @strcmp(i8* %.tmp4881, i8* %.tmp4883)
%.tmp4885 = icmp eq i32 %.tmp4884, 0
br i1 %.tmp4885, label %.if.true.4886, label %.if.false.4886
.if.true.4886:
%.tmp4887 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4888 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp4889 = getelementptr %m1791$.StackHead.type, %m1791$.StackHead.type* %.tmp4888, i32 0, i32 0
%.tmp4890 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp4889
%.tmp4891 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp4890, i32 0, i32 0
%.tmp4892 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4891
%.tmp4893 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_mono_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4887, %m261$.Node.type* %.tmp4892)
ret %m1791$.AssignableInfo.type* %.tmp4893
br label %.if.end.4886
.if.false.4886:
br label %.if.end.4886
.if.end.4886:
%.tmp4894 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp4895 = getelementptr %m1791$.StackHead.type, %m1791$.StackHead.type* %.tmp4894, i32 0, i32 0
%.tmp4896 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp4895
%.tmp4897 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp4896, i32 0, i32 0
%.tmp4898 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4897
%.tmp4899 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4898, i32 0, i32 6
%.tmp4900 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4899
%operator = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4900, %m261$.Node.type** %operator
%.tmp4901 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp4902 = getelementptr %m1791$.StackHead.type, %m1791$.StackHead.type* %.tmp4901, i32 0, i32 0
%.tmp4903 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp4904 = getelementptr %m1791$.StackHead.type, %m1791$.StackHead.type* %.tmp4903, i32 0, i32 0
%.tmp4905 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp4904
%.tmp4906 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp4905, i32 0, i32 1
%.tmp4907 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp4906
store %m1909$.SYStack.type* %.tmp4907, %m1909$.SYStack.type** %.tmp4902
%.tmp4908 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4909 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp4910 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m1791$.StackHead.type*) @m1791$compile_assignable_stack.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m1791$.StackHead.typep(%m1791$.CompilerCtx.type* %.tmp4908, %m1791$.StackHead.type* %.tmp4909)
%A = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4910, %m1791$.AssignableInfo.type** %A
%.tmp4911 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %A
%.tmp4912 = icmp eq %m1791$.AssignableInfo.type* %.tmp4911, null
br i1 %.tmp4912, label %.if.true.4913, label %.if.false.4913
.if.true.4913:
%.tmp4914 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %A
ret %m1791$.AssignableInfo.type* %.tmp4914
br label %.if.end.4913
.if.false.4913:
br label %.if.end.4913
.if.end.4913:
%.tmp4915 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp4916 = getelementptr %m1791$.StackHead.type, %m1791$.StackHead.type* %.tmp4915, i32 0, i32 0
%.tmp4917 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp4918 = getelementptr %m1791$.StackHead.type, %m1791$.StackHead.type* %.tmp4917, i32 0, i32 0
%.tmp4919 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp4918
%.tmp4920 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp4919, i32 0, i32 1
%.tmp4921 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp4920
store %m1909$.SYStack.type* %.tmp4921, %m1909$.SYStack.type** %.tmp4916
%.tmp4922 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4923 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp4924 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m1791$.StackHead.type*) @m1791$compile_assignable_stack.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m1791$.StackHead.typep(%m1791$.CompilerCtx.type* %.tmp4922, %m1791$.StackHead.type* %.tmp4923)
%B = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4924, %m1791$.AssignableInfo.type** %B
%.tmp4925 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %B
%.tmp4926 = icmp eq %m1791$.AssignableInfo.type* %.tmp4925, null
br i1 %.tmp4926, label %.if.true.4927, label %.if.false.4927
.if.true.4927:
%.tmp4928 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %B
ret %m1791$.AssignableInfo.type* %.tmp4928
br label %.if.end.4927
.if.false.4927:
br label %.if.end.4927
.if.end.4927:
%.tmp4929 = bitcast ptr null to %m261$.Node.type*
%.tmp4930 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp4929)
%op_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4930, %m1791$.AssignableInfo.type** %op_info
%.tmp4931 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %op_info
%.tmp4932 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4931, i32 0, i32 3
%.tmp4933 = load %m261$.Node.type*, %m261$.Node.type** %operator
%.tmp4934 = call %m1791$.Type.type*(%m261$.Node.type*) @m1791$operator_type.m1791$.Type.typep.m261$.Node.typep(%m261$.Node.type* %.tmp4933)
store %m1791$.Type.type* %.tmp4934, %m1791$.Type.type** %.tmp4932
%.tmp4935 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4936 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %op_info
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp4935, %m1791$.AssignableInfo.type* %.tmp4936)
%.tmp4937 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4938 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4937, i32 0, i32 1
%.tmp4939 = load %m0$.File.type*, %m0$.File.type** %.tmp4938
%.tmp4941 = getelementptr [19 x i8], [19 x i8]*@.str4940, i32 0, i32 0
%.tmp4942 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %op_info
%.tmp4943 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4942)
%.tmp4944 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4945 = load %m261$.Node.type*, %m261$.Node.type** %operator
%.tmp4946 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$operator_op.cp.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4944, %m261$.Node.type* %.tmp4945)
%.tmp4947 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4948 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %A
%.tmp4949 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4948, i32 0, i32 3
%.tmp4950 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4949
%.tmp4951 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4947, %m1791$.Type.type* %.tmp4950)
%.tmp4952 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %A
%.tmp4953 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4952)
%.tmp4954 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %B
%.tmp4955 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4954)
%.tmp4956 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4939, i8* %.tmp4941, i8* %.tmp4943, i8* %.tmp4946, i8* %.tmp4951, i8* %.tmp4953, i8* %.tmp4955)
%.tmp4957 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %op_info
ret %m1791$.AssignableInfo.type* %.tmp4957
}
define i8* @m1791$operator_op.cp.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.op.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%op = alloca %m261$.Node.type*
store %m261$.Node.type* %.op.arg, %m261$.Node.type** %op
%.tmp4958 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp4959 = icmp eq %m261$.Node.type* %.tmp4958, null
br i1 %.tmp4959, label %.if.true.4960, label %.if.false.4960
.if.true.4960:
%.tmp4961 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4962 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp4964 = getelementptr [31 x i8], [31 x i8]*@.str4963, i32 0, i32 0
%.tmp4965 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4961, %m261$.Node.type* %.tmp4962, i8* %.tmp4964)
%.tmp4966 = call i32(i8*,...) @printf(i8* %.tmp4965)
br label %.if.end.4960
.if.false.4960:
br label %.if.end.4960
.if.end.4960:
%.tmp4967 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp4968 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4967, i32 0, i32 1
%.tmp4969 = load i8*, i8** %.tmp4968
%.tmp4971 = getelementptr [2 x i8], [2 x i8]*@.str4970, i32 0, i32 0
%.tmp4972 = call i32(i8*,i8*) @strcmp(i8* %.tmp4969, i8* %.tmp4971)
%.tmp4973 = icmp eq i32 %.tmp4972, 0
br i1 %.tmp4973, label %.if.true.4974, label %.if.false.4974
.if.true.4974:
%.tmp4976 = getelementptr [4 x i8], [4 x i8]*@.str4975, i32 0, i32 0
ret i8* %.tmp4976
br label %.if.end.4974
.if.false.4974:
%.tmp4977 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp4978 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4977, i32 0, i32 1
%.tmp4979 = load i8*, i8** %.tmp4978
%.tmp4981 = getelementptr [2 x i8], [2 x i8]*@.str4980, i32 0, i32 0
%.tmp4982 = call i32(i8*,i8*) @strcmp(i8* %.tmp4979, i8* %.tmp4981)
%.tmp4983 = icmp eq i32 %.tmp4982, 0
br i1 %.tmp4983, label %.if.true.4984, label %.if.false.4984
.if.true.4984:
%.tmp4986 = getelementptr [4 x i8], [4 x i8]*@.str4985, i32 0, i32 0
ret i8* %.tmp4986
br label %.if.end.4984
.if.false.4984:
%.tmp4987 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp4988 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4987, i32 0, i32 1
%.tmp4989 = load i8*, i8** %.tmp4988
%.tmp4991 = getelementptr [2 x i8], [2 x i8]*@.str4990, i32 0, i32 0
%.tmp4992 = call i32(i8*,i8*) @strcmp(i8* %.tmp4989, i8* %.tmp4991)
%.tmp4993 = icmp eq i32 %.tmp4992, 0
br i1 %.tmp4993, label %.if.true.4994, label %.if.false.4994
.if.true.4994:
%.tmp4996 = getelementptr [4 x i8], [4 x i8]*@.str4995, i32 0, i32 0
ret i8* %.tmp4996
br label %.if.end.4994
.if.false.4994:
%.tmp4997 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp4998 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4997, i32 0, i32 1
%.tmp4999 = load i8*, i8** %.tmp4998
%.tmp5001 = getelementptr [2 x i8], [2 x i8]*@.str5000, i32 0, i32 0
%.tmp5002 = call i32(i8*,i8*) @strcmp(i8* %.tmp4999, i8* %.tmp5001)
%.tmp5003 = icmp eq i32 %.tmp5002, 0
br i1 %.tmp5003, label %.if.true.5004, label %.if.false.5004
.if.true.5004:
%.tmp5006 = getelementptr [5 x i8], [5 x i8]*@.str5005, i32 0, i32 0
ret i8* %.tmp5006
br label %.if.end.5004
.if.false.5004:
%.tmp5007 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5008 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5007, i32 0, i32 1
%.tmp5009 = load i8*, i8** %.tmp5008
%.tmp5011 = getelementptr [3 x i8], [3 x i8]*@.str5010, i32 0, i32 0
%.tmp5012 = call i32(i8*,i8*) @strcmp(i8* %.tmp5009, i8* %.tmp5011)
%.tmp5013 = icmp eq i32 %.tmp5012, 0
br i1 %.tmp5013, label %.if.true.5014, label %.if.false.5014
.if.true.5014:
%.tmp5016 = getelementptr [8 x i8], [8 x i8]*@.str5015, i32 0, i32 0
ret i8* %.tmp5016
br label %.if.end.5014
.if.false.5014:
%.tmp5017 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5018 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5017, i32 0, i32 1
%.tmp5019 = load i8*, i8** %.tmp5018
%.tmp5021 = getelementptr [3 x i8], [3 x i8]*@.str5020, i32 0, i32 0
%.tmp5022 = call i32(i8*,i8*) @strcmp(i8* %.tmp5019, i8* %.tmp5021)
%.tmp5023 = icmp eq i32 %.tmp5022, 0
br i1 %.tmp5023, label %.if.true.5024, label %.if.false.5024
.if.true.5024:
%.tmp5026 = getelementptr [8 x i8], [8 x i8]*@.str5025, i32 0, i32 0
ret i8* %.tmp5026
br label %.if.end.5024
.if.false.5024:
%.tmp5027 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5028 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5027, i32 0, i32 1
%.tmp5029 = load i8*, i8** %.tmp5028
%.tmp5031 = getelementptr [2 x i8], [2 x i8]*@.str5030, i32 0, i32 0
%.tmp5032 = call i32(i8*,i8*) @strcmp(i8* %.tmp5029, i8* %.tmp5031)
%.tmp5033 = icmp eq i32 %.tmp5032, 0
br i1 %.tmp5033, label %.if.true.5034, label %.if.false.5034
.if.true.5034:
%.tmp5036 = getelementptr [9 x i8], [9 x i8]*@.str5035, i32 0, i32 0
ret i8* %.tmp5036
br label %.if.end.5034
.if.false.5034:
%.tmp5037 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5038 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5037, i32 0, i32 1
%.tmp5039 = load i8*, i8** %.tmp5038
%.tmp5041 = getelementptr [2 x i8], [2 x i8]*@.str5040, i32 0, i32 0
%.tmp5042 = call i32(i8*,i8*) @strcmp(i8* %.tmp5039, i8* %.tmp5041)
%.tmp5043 = icmp eq i32 %.tmp5042, 0
br i1 %.tmp5043, label %.if.true.5044, label %.if.false.5044
.if.true.5044:
%.tmp5046 = getelementptr [9 x i8], [9 x i8]*@.str5045, i32 0, i32 0
ret i8* %.tmp5046
br label %.if.end.5044
.if.false.5044:
%.tmp5047 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5048 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5047, i32 0, i32 1
%.tmp5049 = load i8*, i8** %.tmp5048
%.tmp5051 = getelementptr [2 x i8], [2 x i8]*@.str5050, i32 0, i32 0
%.tmp5052 = call i32(i8*,i8*) @strcmp(i8* %.tmp5049, i8* %.tmp5051)
%.tmp5053 = icmp eq i32 %.tmp5052, 0
br i1 %.tmp5053, label %.if.true.5054, label %.if.false.5054
.if.true.5054:
%.tmp5056 = getelementptr [4 x i8], [4 x i8]*@.str5055, i32 0, i32 0
ret i8* %.tmp5056
br label %.if.end.5054
.if.false.5054:
%.tmp5057 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5058 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5057, i32 0, i32 1
%.tmp5059 = load i8*, i8** %.tmp5058
%.tmp5061 = getelementptr [2 x i8], [2 x i8]*@.str5060, i32 0, i32 0
%.tmp5062 = call i32(i8*,i8*) @strcmp(i8* %.tmp5059, i8* %.tmp5061)
%.tmp5063 = icmp eq i32 %.tmp5062, 0
br i1 %.tmp5063, label %.if.true.5064, label %.if.false.5064
.if.true.5064:
%.tmp5066 = getelementptr [3 x i8], [3 x i8]*@.str5065, i32 0, i32 0
ret i8* %.tmp5066
br label %.if.end.5064
.if.false.5064:
%.tmp5067 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5068 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5067, i32 0, i32 1
%.tmp5069 = load i8*, i8** %.tmp5068
%.tmp5071 = getelementptr [3 x i8], [3 x i8]*@.str5070, i32 0, i32 0
%.tmp5072 = call i32(i8*,i8*) @strcmp(i8* %.tmp5069, i8* %.tmp5071)
%.tmp5073 = icmp eq i32 %.tmp5072, 0
br i1 %.tmp5073, label %.if.true.5074, label %.if.false.5074
.if.true.5074:
%.tmp5076 = getelementptr [9 x i8], [9 x i8]*@.str5075, i32 0, i32 0
ret i8* %.tmp5076
br label %.if.end.5074
.if.false.5074:
%.tmp5077 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5078 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5077, i32 0, i32 1
%.tmp5079 = load i8*, i8** %.tmp5078
%.tmp5081 = getelementptr [3 x i8], [3 x i8]*@.str5080, i32 0, i32 0
%.tmp5082 = call i32(i8*,i8*) @strcmp(i8* %.tmp5079, i8* %.tmp5081)
%.tmp5083 = icmp eq i32 %.tmp5082, 0
br i1 %.tmp5083, label %.if.true.5084, label %.if.false.5084
.if.true.5084:
%.tmp5086 = getelementptr [9 x i8], [9 x i8]*@.str5085, i32 0, i32 0
ret i8* %.tmp5086
br label %.if.end.5084
.if.false.5084:
%.tmp5087 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5088 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5090 = getelementptr [30 x i8], [30 x i8]*@.str5089, i32 0, i32 0
%.tmp5091 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp5087, %m261$.Node.type* %.tmp5088, i8* %.tmp5090)
%.tmp5092 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5093 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5092, i32 0, i32 1
%.tmp5094 = load i8*, i8** %.tmp5093
%.tmp5095 = call i32(i8*,...) @printf(i8* %.tmp5091, i8* %.tmp5094)
br label %.if.end.5084
.if.end.5084:
br label %.if.end.5074
.if.end.5074:
br label %.if.end.5064
.if.end.5064:
br label %.if.end.5054
.if.end.5054:
br label %.if.end.5044
.if.end.5044:
br label %.if.end.5034
.if.end.5034:
br label %.if.end.5024
.if.end.5024:
br label %.if.end.5014
.if.end.5014:
br label %.if.end.5004
.if.end.5004:
br label %.if.end.4994
.if.end.4994:
br label %.if.end.4984
.if.end.4984:
br label %.if.end.4974
.if.end.4974:
%.tmp5097 = getelementptr [4 x i8], [4 x i8]*@.str5096, i32 0, i32 0
ret i8* %.tmp5097
}
define %m1791$.Type.type* @m1791$operator_type.m1791$.Type.typep.m261$.Node.typep(%m261$.Node.type* %.op.arg) {
%op = alloca %m261$.Node.type*
store %m261$.Node.type* %.op.arg, %m261$.Node.type** %op
%.tmp5098 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
%type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp5098, %m1791$.Type.type** %type
%.tmp5099 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5100 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5099, i32 0, i32 1
%.tmp5101 = load i8*, i8** %.tmp5100
%.tmp5103 = getelementptr [3 x i8], [3 x i8]*@.str5102, i32 0, i32 0
%.tmp5104 = call i32(i8*,i8*) @strcmp(i8* %.tmp5101, i8* %.tmp5103)
%.tmp5105 = icmp eq i32 %.tmp5104, 0
%.tmp5106 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5107 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5106, i32 0, i32 1
%.tmp5108 = load i8*, i8** %.tmp5107
%.tmp5110 = getelementptr [3 x i8], [3 x i8]*@.str5109, i32 0, i32 0
%.tmp5111 = call i32(i8*,i8*) @strcmp(i8* %.tmp5108, i8* %.tmp5110)
%.tmp5112 = icmp eq i32 %.tmp5111, 0
%.tmp5113 = or i1 %.tmp5105, %.tmp5112
%.tmp5114 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5115 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5114, i32 0, i32 1
%.tmp5116 = load i8*, i8** %.tmp5115
%.tmp5118 = getelementptr [2 x i8], [2 x i8]*@.str5117, i32 0, i32 0
%.tmp5119 = call i32(i8*,i8*) @strcmp(i8* %.tmp5116, i8* %.tmp5118)
%.tmp5120 = icmp eq i32 %.tmp5119, 0
%.tmp5121 = or i1 %.tmp5113, %.tmp5120
%.tmp5122 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5123 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5122, i32 0, i32 1
%.tmp5124 = load i8*, i8** %.tmp5123
%.tmp5126 = getelementptr [2 x i8], [2 x i8]*@.str5125, i32 0, i32 0
%.tmp5127 = call i32(i8*,i8*) @strcmp(i8* %.tmp5124, i8* %.tmp5126)
%.tmp5128 = icmp eq i32 %.tmp5127, 0
%.tmp5129 = or i1 %.tmp5121, %.tmp5128
%.tmp5130 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5131 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5130, i32 0, i32 1
%.tmp5132 = load i8*, i8** %.tmp5131
%.tmp5134 = getelementptr [2 x i8], [2 x i8]*@.str5133, i32 0, i32 0
%.tmp5135 = call i32(i8*,i8*) @strcmp(i8* %.tmp5132, i8* %.tmp5134)
%.tmp5136 = icmp eq i32 %.tmp5135, 0
%.tmp5137 = or i1 %.tmp5129, %.tmp5136
%.tmp5138 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5139 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5138, i32 0, i32 1
%.tmp5140 = load i8*, i8** %.tmp5139
%.tmp5142 = getelementptr [2 x i8], [2 x i8]*@.str5141, i32 0, i32 0
%.tmp5143 = call i32(i8*,i8*) @strcmp(i8* %.tmp5140, i8* %.tmp5142)
%.tmp5144 = icmp eq i32 %.tmp5143, 0
%.tmp5145 = or i1 %.tmp5137, %.tmp5144
%.tmp5146 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5147 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5146, i32 0, i32 1
%.tmp5148 = load i8*, i8** %.tmp5147
%.tmp5150 = getelementptr [3 x i8], [3 x i8]*@.str5149, i32 0, i32 0
%.tmp5151 = call i32(i8*,i8*) @strcmp(i8* %.tmp5148, i8* %.tmp5150)
%.tmp5152 = icmp eq i32 %.tmp5151, 0
%.tmp5153 = or i1 %.tmp5145, %.tmp5152
%.tmp5154 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5155 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5154, i32 0, i32 1
%.tmp5156 = load i8*, i8** %.tmp5155
%.tmp5158 = getelementptr [3 x i8], [3 x i8]*@.str5157, i32 0, i32 0
%.tmp5159 = call i32(i8*,i8*) @strcmp(i8* %.tmp5156, i8* %.tmp5158)
%.tmp5160 = icmp eq i32 %.tmp5159, 0
%.tmp5161 = or i1 %.tmp5153, %.tmp5160
br i1 %.tmp5161, label %.if.true.5162, label %.if.false.5162
.if.true.5162:
%.tmp5163 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5164 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5163, i32 0, i32 0
%.tmp5166 = getelementptr [5 x i8], [5 x i8]*@.str5165, i32 0, i32 0
store i8* %.tmp5166, i8** %.tmp5164
br label %.if.end.5162
.if.false.5162:
%.tmp5167 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5168 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5167, i32 0, i32 0
%.tmp5170 = getelementptr [4 x i8], [4 x i8]*@.str5169, i32 0, i32 0
store i8* %.tmp5170, i8** %.tmp5168
br label %.if.end.5162
.if.end.5162:
%.tmp5171 = load %m1791$.Type.type*, %m1791$.Type.type** %type
ret %m1791$.Type.type* %.tmp5171
}
define %m1791$.AssignableInfo.type* @m1791$compile_mono_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%curr_node = alloca %m261$.Node.type*
store %m261$.Node.type* %.curr_node.arg, %m261$.Node.type** %curr_node
%.tmp5172 = bitcast ptr null to %m1791$.AssignableInfo.type*
%assignable_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp5172, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5173 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%mono = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp5173, %m261$.Node.type** %mono
%err_buf = alloca i8*
%buf = alloca i8*
%.tmp5174 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5175 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5174, i32 0, i32 6
%.tmp5176 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5175
%.tmp5177 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5176, i32 0, i32 0
%.tmp5178 = load i8*, i8** %.tmp5177
%.tmp5180 = getelementptr [7 x i8], [7 x i8]*@.str5179, i32 0, i32 0
%.tmp5181 = call i32(i8*,i8*) @strcmp(i8* %.tmp5178, i8* %.tmp5180)
%.tmp5182 = icmp eq i32 %.tmp5181, 0
br i1 %.tmp5182, label %.if.true.5183, label %.if.false.5183
.if.true.5183:
%.tmp5184 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5185 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5184)
store %m1791$.AssignableInfo.type* %.tmp5185, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5186 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5187 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5186, i32 0, i32 3
%.tmp5188 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5188, %m1791$.Type.type** %.tmp5187
%.tmp5189 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5190 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5189, i32 0, i32 3
%.tmp5191 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5190
%.tmp5192 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5191, i32 0, i32 0
%.tmp5194 = getelementptr [4 x i8], [4 x i8]*@.str5193, i32 0, i32 0
store i8* %.tmp5194, i8** %.tmp5192
%.tmp5195 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5196 = load i8, i8* @SCOPE_CONST
%.tmp5197 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5198 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5197, i32 0, i32 6
%.tmp5199 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5198
%.tmp5200 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5199, i32 0, i32 1
%.tmp5201 = load i8*, i8** %.tmp5200
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp5195, i8 %.tmp5196, i8* %.tmp5201)
br label %.if.end.5183
.if.false.5183:
%.tmp5202 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5203 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5202, i32 0, i32 6
%.tmp5204 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5203
%.tmp5205 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5204, i32 0, i32 0
%.tmp5206 = load i8*, i8** %.tmp5205
%.tmp5208 = getelementptr [5 x i8], [5 x i8]*@.str5207, i32 0, i32 0
%.tmp5209 = call i32(i8*,i8*) @strcmp(i8* %.tmp5206, i8* %.tmp5208)
%.tmp5210 = icmp eq i32 %.tmp5209, 0
br i1 %.tmp5210, label %.if.true.5211, label %.if.false.5211
.if.true.5211:
%.tmp5212 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5213 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5212, i32 0, i32 6
%.tmp5214 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5213
%.tmp5215 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5214, i32 0, i32 1
%.tmp5216 = load i8*, i8** %.tmp5215
%.tmp5218 = getelementptr [5 x i8], [5 x i8]*@.str5217, i32 0, i32 0
%.tmp5219 = call i32(i8*,i8*) @strcmp(i8* %.tmp5216, i8* %.tmp5218)
%.tmp5220 = icmp ne i32 %.tmp5219, 0
br i1 %.tmp5220, label %.if.true.5221, label %.if.false.5221
.if.true.5221:
%.tmp5222 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5223 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5225 = getelementptr [42 x i8], [42 x i8]*@.str5224, i32 0, i32 0
%.tmp5226 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp5222, %m261$.Node.type* %.tmp5223, i8* %.tmp5225)
%.tmp5227 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5228 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5227, i32 0, i32 6
%.tmp5229 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5228
%.tmp5230 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5229, i32 0, i32 1
%.tmp5231 = load i8*, i8** %.tmp5230
%.tmp5232 = call i32(i8*,...) @printf(i8* %.tmp5226, i8* %.tmp5231)
%.tmp5233 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp5233
br label %.if.end.5221
.if.false.5221:
br label %.if.end.5221
.if.end.5221:
%.tmp5234 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5235 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5234)
store %m1791$.AssignableInfo.type* %.tmp5235, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5236 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5237 = load i8, i8* @SCOPE_CONST
%.tmp5239 = getelementptr [5 x i8], [5 x i8]*@.str5238, i32 0, i32 0
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp5236, i8 %.tmp5237, i8* %.tmp5239)
%.tmp5240 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5241 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5240, i32 0, i32 3
%.tmp5242 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5242, %m1791$.Type.type** %.tmp5241
%.tmp5243 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5244 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5243, i32 0, i32 3
%.tmp5245 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5244
%.tmp5246 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5245, i32 0, i32 0
%.tmp5248 = getelementptr [8 x i8], [8 x i8]*@.str5247, i32 0, i32 0
store i8* %.tmp5248, i8** %.tmp5246
br label %.if.end.5211
.if.false.5211:
%.tmp5249 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5250 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5249, i32 0, i32 6
%.tmp5251 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5250
%.tmp5252 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5251, i32 0, i32 0
%.tmp5253 = load i8*, i8** %.tmp5252
%.tmp5255 = getelementptr [17 x i8], [17 x i8]*@.str5254, i32 0, i32 0
%.tmp5256 = call i32(i8*,i8*) @strcmp(i8* %.tmp5253, i8* %.tmp5255)
%.tmp5257 = icmp eq i32 %.tmp5256, 0
br i1 %.tmp5257, label %.if.true.5258, label %.if.false.5258
.if.true.5258:
%.tmp5259 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5260 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5259)
store %m1791$.AssignableInfo.type* %.tmp5260, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5261 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5262 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5261, i32 0, i32 6
%.tmp5263 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5262
%.tmp5264 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5263, i32 0, i32 6
%.tmp5265 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5264
%.tmp5267 = getelementptr [12 x i8], [12 x i8]*@.str5266, i32 0, i32 0
%.tmp5268 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp5265, i8* %.tmp5267)
%dest = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp5268, %m261$.Node.type** %dest
%.tmp5269 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5270 = load %m261$.Node.type*, %m261$.Node.type** %dest
%.tmp5271 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_addr.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp5269, %m261$.Node.type* %.tmp5270)
%var_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp5271, %m1791$.AssignableInfo.type** %var_info
%.tmp5272 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %var_info
%.tmp5273 = icmp eq %m1791$.AssignableInfo.type* %.tmp5272, null
br i1 %.tmp5273, label %.if.true.5274, label %.if.false.5274
.if.true.5274:
%.tmp5275 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
ret %m1791$.AssignableInfo.type* %.tmp5275
br label %.if.end.5274
.if.false.5274:
br label %.if.end.5274
.if.end.5274:
%.tmp5276 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5277 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %var_info
%.tmp5278 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5277, i32 0, i32 3
%.tmp5279 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5278
%.tmp5280 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp5276, %m1791$.Type.type* %.tmp5279)
%var_type_repr = alloca i8*
store i8* %.tmp5280, i8** %var_type_repr
%.tmp5281 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5282 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp5281, %m1791$.AssignableInfo.type* %.tmp5282)
%.tmp5283 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5284 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5283, i32 0, i32 3
%.tmp5285 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %var_info
%.tmp5286 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5285, i32 0, i32 3
%.tmp5287 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5286
store %m1791$.Type.type* %.tmp5287, %m1791$.Type.type** %.tmp5284
%.tmp5289 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5290 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5289, i32 0, i32 6
%.tmp5291 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5290
%.tmp5292 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5291, i32 0, i32 6
%.tmp5293 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5292
%ptr = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp5293, %m261$.Node.type** %ptr
br label %.for.start.5288
.for.start.5288:
%.tmp5294 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp5295 = load %m261$.Node.type*, %m261$.Node.type** %dest
%.tmp5296 = icmp ne %m261$.Node.type* %.tmp5294, %.tmp5295
br i1 %.tmp5296, label %.for.continue.5288, label %.for.end.5288
.for.continue.5288:
%.tmp5297 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
%type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp5297, %m1791$.Type.type** %type
%.tmp5298 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5299 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5298, i32 0, i32 3
%.tmp5300 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5301 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5300, i32 0, i32 3
%.tmp5302 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5301
store %m1791$.Type.type* %.tmp5302, %m1791$.Type.type** %.tmp5299
%.tmp5303 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5304 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5303, i32 0, i32 0
%.tmp5306 = getelementptr [4 x i8], [4 x i8]*@.str5305, i32 0, i32 0
store i8* %.tmp5306, i8** %.tmp5304
%.tmp5307 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5308 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5307, i32 0, i32 3
%.tmp5309 = load %m1791$.Type.type*, %m1791$.Type.type** %type
store %m1791$.Type.type* %.tmp5309, %m1791$.Type.type** %.tmp5308
%.tmp5310 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp5311 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5310, i32 0, i32 7
%.tmp5312 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5311
store %m261$.Node.type* %.tmp5312, %m261$.Node.type** %ptr
br label %.for.start.5288
.for.end.5288:
%.tmp5313 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5314 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5313, i32 0, i32 6
%.tmp5315 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5314
%.tmp5316 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5315, i32 0, i32 6
%.tmp5317 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5316
%.tmp5318 = load %m261$.Node.type*, %m261$.Node.type** %dest
%.tmp5319 = icmp ne %m261$.Node.type* %.tmp5317, %.tmp5318
br i1 %.tmp5319, label %.if.true.5320, label %.if.false.5320
.if.true.5320:
%.tmp5321 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5322 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp5321, i32 0, i32 1
%.tmp5323 = load %m0$.File.type*, %m0$.File.type** %.tmp5322
%.tmp5325 = getelementptr [38 x i8], [38 x i8]*@.str5324, i32 0, i32 0
%.tmp5326 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5327 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp5326)
%.tmp5328 = load i8*, i8** %var_type_repr
%.tmp5329 = load i8*, i8** %var_type_repr
%.tmp5330 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %var_info
%.tmp5331 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp5330)
%.tmp5332 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5323, i8* %.tmp5325, i8* %.tmp5327, i8* %.tmp5328, i8* %.tmp5329, i8* %.tmp5331)
br label %.if.end.5320
.if.false.5320:
%.tmp5333 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5334 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp5333, i32 0, i32 1
%.tmp5335 = load %m0$.File.type*, %m0$.File.type** %.tmp5334
%.tmp5337 = getelementptr [22 x i8], [22 x i8]*@.str5336, i32 0, i32 0
%.tmp5338 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5339 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp5338)
%.tmp5340 = load i8*, i8** %var_type_repr
%.tmp5341 = load i8*, i8** %var_type_repr
%.tmp5342 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %var_info
%.tmp5343 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp5342)
%.tmp5344 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5335, i8* %.tmp5337, i8* %.tmp5339, i8* %.tmp5340, i8* %.tmp5341, i8* %.tmp5343)
br label %.if.end.5320
.if.end.5320:
br label %.if.end.5258
.if.false.5258:
%.tmp5345 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5346 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5345, i32 0, i32 6
%.tmp5347 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5346
%.tmp5348 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5347, i32 0, i32 0
%.tmp5349 = load i8*, i8** %.tmp5348
%.tmp5351 = getelementptr [8 x i8], [8 x i8]*@.str5350, i32 0, i32 0
%.tmp5352 = call i32(i8*,i8*) @strcmp(i8* %.tmp5349, i8* %.tmp5351)
%.tmp5353 = icmp eq i32 %.tmp5352, 0
br i1 %.tmp5353, label %.if.true.5354, label %.if.false.5354
.if.true.5354:
%.tmp5355 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5356 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5355)
store %m1791$.AssignableInfo.type* %.tmp5356, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5357 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5358 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5357, i32 0, i32 3
%.tmp5359 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5359, %m1791$.Type.type** %.tmp5358
%.tmp5360 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5361 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5360, i32 0, i32 3
%.tmp5362 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5361
%.tmp5363 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5362, i32 0, i32 0
%.tmp5365 = getelementptr [5 x i8], [5 x i8]*@.str5364, i32 0, i32 0
store i8* %.tmp5365, i8** %.tmp5363
%.tmp5366 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5367 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5366, i32 0, i32 6
%.tmp5368 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5367
%.tmp5369 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5368, i32 0, i32 6
%.tmp5370 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5369
%.tmp5371 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5370, i32 0, i32 1
%.tmp5372 = load i8*, i8** %.tmp5371
%.tmp5374 = getelementptr [6 x i8], [6 x i8]*@.str5373, i32 0, i32 0
%.tmp5375 = call i32(i8*,i8*) @strcmp(i8* %.tmp5372, i8* %.tmp5374)
%.tmp5376 = icmp eq i32 %.tmp5375, 0
br i1 %.tmp5376, label %.if.true.5377, label %.if.false.5377
.if.true.5377:
%.tmp5378 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5379 = load i8, i8* @SCOPE_CONST
%.tmp5381 = getelementptr [2 x i8], [2 x i8]*@.str5380, i32 0, i32 0
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp5378, i8 %.tmp5379, i8* %.tmp5381)
br label %.if.end.5377
.if.false.5377:
%.tmp5382 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5383 = load i8, i8* @SCOPE_CONST
%.tmp5385 = getelementptr [2 x i8], [2 x i8]*@.str5384, i32 0, i32 0
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp5382, i8 %.tmp5383, i8* %.tmp5385)
br label %.if.end.5377
.if.end.5377:
br label %.if.end.5354
.if.false.5354:
%.tmp5386 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5387 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5386, i32 0, i32 6
%.tmp5388 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5387
%.tmp5389 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5388, i32 0, i32 0
%.tmp5390 = load i8*, i8** %.tmp5389
%.tmp5392 = getelementptr [8 x i8], [8 x i8]*@.str5391, i32 0, i32 0
%.tmp5393 = call i32(i8*,i8*) @strcmp(i8* %.tmp5390, i8* %.tmp5392)
%.tmp5394 = icmp eq i32 %.tmp5393, 0
br i1 %.tmp5394, label %.if.true.5395, label %.if.false.5395
.if.true.5395:
%.tmp5396 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5397 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5398 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5397, i32 0, i32 6
%.tmp5399 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5398
%.tmp5400 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5399, i32 0, i32 6
%.tmp5401 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5400
%.tmp5402 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_fn_call.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp5396, %m261$.Node.type* %.tmp5401)
store %m1791$.AssignableInfo.type* %.tmp5402, %m1791$.AssignableInfo.type** %assignable_info
br label %.if.end.5395
.if.false.5395:
%.tmp5403 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5404 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5403, i32 0, i32 6
%.tmp5405 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5404
%.tmp5406 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5405, i32 0, i32 0
%.tmp5407 = load i8*, i8** %.tmp5406
%.tmp5409 = getelementptr [7 x i8], [7 x i8]*@.str5408, i32 0, i32 0
%.tmp5410 = call i32(i8*,i8*) @strcmp(i8* %.tmp5407, i8* %.tmp5409)
%.tmp5411 = icmp eq i32 %.tmp5410, 0
br i1 %.tmp5411, label %.if.true.5412, label %.if.false.5412
.if.true.5412:
%.tmp5413 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5414 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5415 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5414, i32 0, i32 6
%.tmp5416 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5415
%.tmp5417 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5416, i32 0, i32 1
%.tmp5418 = load i8*, i8** %.tmp5417
%.tmp5419 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,i8*) @m1791$define_string.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.tmp5413, i8* %.tmp5418)
%string_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp5419, %m1791$.AssignableInfo.type** %string_info
%.tmp5420 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5421 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5420)
store %m1791$.AssignableInfo.type* %.tmp5421, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5422 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5423 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp5422, %m1791$.AssignableInfo.type* %.tmp5423)
%.tmp5424 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5425 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %string_info
%.tmp5426 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5425, i32 0, i32 3
%.tmp5427 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5426
%.tmp5428 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp5424, %m1791$.Type.type* %.tmp5427)
%str_tr = alloca i8*
store i8* %.tmp5428, i8** %str_tr
%.tmp5429 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5430 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp5429, i32 0, i32 1
%.tmp5431 = load %m0$.File.type*, %m0$.File.type** %.tmp5430
%.tmp5433 = getelementptr [44 x i8], [44 x i8]*@.str5432, i32 0, i32 0
%.tmp5434 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5435 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp5434)
%.tmp5436 = load i8*, i8** %str_tr
%.tmp5437 = load i8*, i8** %str_tr
%.tmp5438 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %string_info
%.tmp5439 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp5438)
%.tmp5440 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5431, i8* %.tmp5433, i8* %.tmp5435, i8* %.tmp5436, i8* %.tmp5437, i8* %.tmp5439)
%.tmp5441 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5442 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5441, i32 0, i32 3
%.tmp5443 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5443, %m1791$.Type.type** %.tmp5442
%.tmp5444 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5445 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5444, i32 0, i32 3
%.tmp5446 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5445
%.tmp5447 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5446, i32 0, i32 0
%.tmp5449 = getelementptr [4 x i8], [4 x i8]*@.str5448, i32 0, i32 0
store i8* %.tmp5449, i8** %.tmp5447
%.tmp5450 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5451 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5450, i32 0, i32 3
%.tmp5452 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5451
%.tmp5453 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5452, i32 0, i32 3
%.tmp5454 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5454, %m1791$.Type.type** %.tmp5453
%.tmp5455 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5456 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5455, i32 0, i32 3
%.tmp5457 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5456
%.tmp5458 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5457, i32 0, i32 3
%.tmp5459 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5458
%.tmp5460 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5459, i32 0, i32 0
%.tmp5462 = getelementptr [4 x i8], [4 x i8]*@.str5461, i32 0, i32 0
store i8* %.tmp5462, i8** %.tmp5460
br label %.if.end.5412
.if.false.5412:
%.tmp5463 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5464 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5463, i32 0, i32 6
%.tmp5465 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5464
%.tmp5466 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5465, i32 0, i32 0
%.tmp5467 = load i8*, i8** %.tmp5466
%.tmp5469 = getelementptr [4 x i8], [4 x i8]*@.str5468, i32 0, i32 0
%.tmp5470 = call i32(i8*,i8*) @strcmp(i8* %.tmp5467, i8* %.tmp5469)
%.tmp5471 = icmp eq i32 %.tmp5470, 0
br i1 %.tmp5471, label %.if.true.5472, label %.if.false.5472
.if.true.5472:
%.tmp5473 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5474 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5473)
store %m1791$.AssignableInfo.type* %.tmp5474, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5475 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5476 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5475, i32 0, i32 6
%.tmp5477 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5476
%.tmp5478 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5477, i32 0, i32 1
%.tmp5479 = load i8*, i8** %.tmp5478
%.tmp5480 = call i32(i8*) @strlen(i8* %.tmp5479)
%chr_len = alloca i32
store i32 %.tmp5480, i32* %chr_len
%.tmp5481 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5482 = load i8, i8* @SCOPE_CONST
%.tmp5484 = getelementptr [2 x i8], [2 x i8]*@.str5483, i32 0, i32 0
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp5481, i8 %.tmp5482, i8* %.tmp5484)
%intval = alloca i32
store i32 0, i32* %intval
%.tmp5485 = load i32, i32* %chr_len
%.tmp5486 = icmp eq i32 %.tmp5485, 5
br i1 %.tmp5486, label %.if.true.5487, label %.if.false.5487
.if.true.5487:
%.tmp5488 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5489 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5488, i32 0, i32 6
%.tmp5490 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5489
%.tmp5491 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5490, i32 0, i32 1
%.tmp5492 = load i8*, i8** %.tmp5491
%.tmp5494 = getelementptr [6 x i8], [6 x i8]*@.str5493, i32 0, i32 0
%.tmp5495 = getelementptr i32, i32* %intval, i32 0
%.tmp5496 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5492, i8* %.tmp5494, i32* %.tmp5495)
%.tmp5497 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5498 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5497, i32 0, i32 0
%.tmp5499 = getelementptr i8*, i8** %.tmp5498, i32 0
%.tmp5501 = getelementptr [3 x i8], [3 x i8]*@.str5500, i32 0, i32 0
%.tmp5502 = load i32, i32* %intval
%.tmp5503 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5499, i8* %.tmp5501, i32 %.tmp5502)
br label %.if.end.5487
.if.false.5487:
%.tmp5504 = load i32, i32* %chr_len
%.tmp5505 = icmp eq i32 %.tmp5504, 3
br i1 %.tmp5505, label %.if.true.5506, label %.if.false.5506
.if.true.5506:
%.tmp5507 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5508 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5507, i32 0, i32 6
%.tmp5509 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5508
%.tmp5510 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5509, i32 0, i32 1
%.tmp5511 = load i8*, i8** %.tmp5510
%.tmp5513 = getelementptr [5 x i8], [5 x i8]*@.str5512, i32 0, i32 0
%.tmp5514 = getelementptr i32, i32* %intval, i32 0
%.tmp5515 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5511, i8* %.tmp5513, i32* %.tmp5514)
%.tmp5516 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5517 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5516, i32 0, i32 0
%.tmp5518 = getelementptr i8*, i8** %.tmp5517, i32 0
%.tmp5520 = getelementptr [3 x i8], [3 x i8]*@.str5519, i32 0, i32 0
%.tmp5521 = load i32, i32* %intval
%.tmp5522 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5518, i8* %.tmp5520, i32 %.tmp5521)
br label %.if.end.5506
.if.false.5506:
%.tmp5523 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp5525 = getelementptr [18 x i8], [18 x i8]*@.str5524, i32 0, i32 0
%.tmp5526 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5523, i8* %.tmp5525)
%.tmp5527 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5528 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5529 = load i8*, i8** %err_buf
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp5527, %m261$.Node.type* %.tmp5528, i8* %.tmp5529)
br label %.if.end.5506
.if.end.5506:
br label %.if.end.5487
.if.end.5487:
%.tmp5530 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5531 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5530, i32 0, i32 3
%.tmp5532 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5532, %m1791$.Type.type** %.tmp5531
%.tmp5533 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5534 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5533, i32 0, i32 3
%.tmp5535 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5534
%.tmp5536 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5535, i32 0, i32 0
%.tmp5538 = getelementptr [4 x i8], [4 x i8]*@.str5537, i32 0, i32 0
store i8* %.tmp5538, i8** %.tmp5536
br label %.if.end.5472
.if.false.5472:
%.tmp5539 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5540 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5542 = getelementptr [40 x i8], [40 x i8]*@.str5541, i32 0, i32 0
%.tmp5543 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp5539, %m261$.Node.type* %.tmp5540, i8* %.tmp5542)
%.tmp5544 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5545 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5544, i32 0, i32 6
%.tmp5546 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5545
%.tmp5547 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5546, i32 0, i32 0
%.tmp5548 = load i8*, i8** %.tmp5547
%.tmp5549 = call i32(i8*,...) @printf(i8* %.tmp5543, i8* %.tmp5548)
%.tmp5550 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp5550
br label %.if.end.5472
.if.end.5472:
br label %.if.end.5412
.if.end.5412:
br label %.if.end.5395
.if.end.5395:
br label %.if.end.5354
.if.end.5354:
br label %.if.end.5258
.if.end.5258:
br label %.if.end.5211
.if.end.5211:
br label %.if.end.5183
.if.end.5183:
%.tmp5551 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5552 = icmp eq %m1791$.AssignableInfo.type* %.tmp5551, null
br i1 %.tmp5552, label %.if.true.5553, label %.if.false.5553
.if.true.5553:
%.tmp5554 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp5554
br label %.if.end.5553
.if.false.5553:
br label %.if.end.5553
.if.end.5553:
%.tmp5555 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5556 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5555, i32 0, i32 4
%.tmp5557 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5558 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5557, i32 0, i32 3
%.tmp5559 = load i32, i32* %.tmp5558
store i32 %.tmp5559, i32* %.tmp5556
%.tmp5560 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5561 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5560, i32 0, i32 5
%.tmp5562 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5563 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5562, i32 0, i32 4
%.tmp5564 = load i32, i32* %.tmp5563
store i32 %.tmp5564, i32* %.tmp5561
%.tmp5565 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5566 = bitcast %m1791$.AssignableInfo.type* %.tmp5565 to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp5566
}
define i8* @m1791$type_abbr.cp.m1791$.Type.typep(%m1791$.Type.type* %.type.arg) {
%type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.type.arg, %m1791$.Type.type** %type
%.tmp5567 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5568 = icmp ne %m1791$.Type.type* %.tmp5567, null
%.tmp5570 = getelementptr [22 x i8], [22 x i8]*@.str5569, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5568, i8* %.tmp5570)
%.tmp5571 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5572 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5571, i32 0, i32 0
%.tmp5573 = load i8*, i8** %.tmp5572
%.tmp5574 = icmp ne i8* %.tmp5573, null
%.tmp5576 = getelementptr [59 x i8], [59 x i8]*@.str5575, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5574, i8* %.tmp5576)
%.tmp5577 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5578 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5577, i32 0, i32 0
%.tmp5579 = load i8*, i8** %.tmp5578
%.tmp5581 = getelementptr [4 x i8], [4 x i8]*@.str5580, i32 0, i32 0
%.tmp5582 = call i32(i8*,i8*) @strcmp(i8* %.tmp5579, i8* %.tmp5581)
%.tmp5583 = icmp eq i32 %.tmp5582, 0
br i1 %.tmp5583, label %.if.true.5584, label %.if.false.5584
.if.true.5584:
%.tmp5586 = getelementptr [2 x i8], [2 x i8]*@.str5585, i32 0, i32 0
ret i8* %.tmp5586
br label %.if.end.5584
.if.false.5584:
%.tmp5587 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5588 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5587, i32 0, i32 0
%.tmp5589 = load i8*, i8** %.tmp5588
%.tmp5591 = getelementptr [5 x i8], [5 x i8]*@.str5590, i32 0, i32 0
%.tmp5592 = call i32(i8*,i8*) @strcmp(i8* %.tmp5589, i8* %.tmp5591)
%.tmp5593 = icmp eq i32 %.tmp5592, 0
br i1 %.tmp5593, label %.if.true.5594, label %.if.false.5594
.if.true.5594:
%.tmp5596 = getelementptr [2 x i8], [2 x i8]*@.str5595, i32 0, i32 0
ret i8* %.tmp5596
br label %.if.end.5594
.if.false.5594:
%.tmp5597 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5598 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5597, i32 0, i32 0
%.tmp5599 = load i8*, i8** %.tmp5598
%.tmp5601 = getelementptr [5 x i8], [5 x i8]*@.str5600, i32 0, i32 0
%.tmp5602 = call i32(i8*,i8*) @strcmp(i8* %.tmp5599, i8* %.tmp5601)
%.tmp5603 = icmp eq i32 %.tmp5602, 0
br i1 %.tmp5603, label %.if.true.5604, label %.if.false.5604
.if.true.5604:
%.tmp5606 = getelementptr [2 x i8], [2 x i8]*@.str5605, i32 0, i32 0
ret i8* %.tmp5606
br label %.if.end.5604
.if.false.5604:
%.tmp5607 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5608 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5607, i32 0, i32 0
%.tmp5609 = load i8*, i8** %.tmp5608
%.tmp5611 = getelementptr [4 x i8], [4 x i8]*@.str5610, i32 0, i32 0
%.tmp5612 = call i32(i8*,i8*) @strcmp(i8* %.tmp5609, i8* %.tmp5611)
%.tmp5613 = icmp eq i32 %.tmp5612, 0
br i1 %.tmp5613, label %.if.true.5614, label %.if.false.5614
.if.true.5614:
%.tmp5616 = getelementptr [2 x i8], [2 x i8]*@.str5615, i32 0, i32 0
ret i8* %.tmp5616
br label %.if.end.5614
.if.false.5614:
%.tmp5617 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5618 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5617, i32 0, i32 0
%.tmp5619 = load i8*, i8** %.tmp5618
%.tmp5621 = getelementptr [4 x i8], [4 x i8]*@.str5620, i32 0, i32 0
%.tmp5622 = call i32(i8*,i8*) @strcmp(i8* %.tmp5619, i8* %.tmp5621)
%.tmp5623 = icmp eq i32 %.tmp5622, 0
br i1 %.tmp5623, label %.if.true.5624, label %.if.false.5624
.if.true.5624:
%.tmp5626 = getelementptr [3 x i8], [3 x i8]*@.str5625, i32 0, i32 0
ret i8* %.tmp5626
br label %.if.end.5624
.if.false.5624:
%.tmp5627 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5628 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5627, i32 0, i32 0
%.tmp5629 = load i8*, i8** %.tmp5628
%.tmp5631 = getelementptr [4 x i8], [4 x i8]*@.str5630, i32 0, i32 0
%.tmp5632 = call i32(i8*,i8*) @strcmp(i8* %.tmp5629, i8* %.tmp5631)
%.tmp5633 = icmp eq i32 %.tmp5632, 0
br i1 %.tmp5633, label %.if.true.5634, label %.if.false.5634
.if.true.5634:
%buf = alloca i8*
%.tmp5635 = getelementptr i8*, i8** %buf, i32 0
%.tmp5637 = getelementptr [4 x i8], [4 x i8]*@.str5636, i32 0, i32 0
%.tmp5638 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5639 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5638, i32 0, i32 3
%.tmp5640 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5639
%.tmp5641 = call i8*(%m1791$.Type.type*) @m1791$type_abbr.cp.m1791$.Type.typep(%m1791$.Type.type* %.tmp5640)
%.tmp5642 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5635, i8* %.tmp5637, i8* %.tmp5641)
%.tmp5643 = load i8*, i8** %buf
ret i8* %.tmp5643
br label %.if.end.5634
.if.false.5634:
%.tmp5644 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5645 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5644, i32 0, i32 0
%.tmp5646 = load i8*, i8** %.tmp5645
%.tmp5648 = getelementptr [10 x i8], [10 x i8]*@.str5647, i32 0, i32 0
%.tmp5649 = call i32(i8*,i8*) @strcmp(i8* %.tmp5646, i8* %.tmp5648)
%.tmp5650 = icmp eq i32 %.tmp5649, 0
br i1 %.tmp5650, label %.if.true.5651, label %.if.false.5651
.if.true.5651:
%.tmp5652 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5653 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5652, i32 0, i32 2
%.tmp5654 = load i8*, i8** %.tmp5653
ret i8* %.tmp5654
br label %.if.end.5651
.if.false.5651:
%.tmp5655 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5656 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5655, i32 0, i32 0
%.tmp5657 = load i8*, i8** %.tmp5656
%.tmp5659 = getelementptr [6 x i8], [6 x i8]*@.str5658, i32 0, i32 0
%.tmp5660 = call i32(i8*,i8*) @strcmp(i8* %.tmp5657, i8* %.tmp5659)
%.tmp5661 = icmp eq i32 %.tmp5660, 0
br i1 %.tmp5661, label %.if.true.5662, label %.if.false.5662
.if.true.5662:
%.tmp5664 = getelementptr [2 x i8], [2 x i8]*@.str5663, i32 0, i32 0
ret i8* %.tmp5664
br label %.if.end.5662
.if.false.5662:
%.tmp5666 = getelementptr [44 x i8], [44 x i8]*@.str5665, i32 0, i32 0
%.tmp5667 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5668 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5667, i32 0, i32 0
%.tmp5669 = load i8*, i8** %.tmp5668
%.tmp5670 = call i32(i8*,...) @printf(i8* %.tmp5666, i8* %.tmp5669)
br label %.if.end.5662
.if.end.5662:
br label %.if.end.5651
.if.end.5651:
br label %.if.end.5634
.if.end.5634:
br label %.if.end.5624
.if.end.5624:
br label %.if.end.5614
.if.end.5614:
br label %.if.end.5604
.if.end.5604:
br label %.if.end.5594
.if.end.5594:
br label %.if.end.5584
.if.end.5584:
%.tmp5671 = bitcast ptr null to i8*
ret i8* %.tmp5671
}
define i32 @m1791$calc_llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len = alloca i32
store i32 0, i32* %len
%i = alloca i32
store i32 1, i32* %i
br label %.for.start.5672
.for.start.5672:
%.tmp5673 = load i32, i32* %i
%.tmp5674 = load i8*, i8** %text
%.tmp5675 = getelementptr i8, i8* %.tmp5674, i32 %.tmp5673
%.tmp5676 = load i8, i8* %.tmp5675
%.tmp5677 = icmp ne i8 %.tmp5676, 0
br i1 %.tmp5677, label %.for.continue.5672, label %.for.end.5672
.for.continue.5672:
%.tmp5678 = load i32, i32* %i
%.tmp5679 = load i8*, i8** %text
%.tmp5680 = getelementptr i8, i8* %.tmp5679, i32 %.tmp5678
%.tmp5681 = load i8, i8* %.tmp5680
%.tmp5682 = icmp eq i8 %.tmp5681, 92
%.tmp5683 = load i32, i32* %i
%.tmp5684 = add i32 %.tmp5683, 1
%.tmp5685 = load i8*, i8** %text
%.tmp5686 = getelementptr i8, i8* %.tmp5685, i32 %.tmp5684
%.tmp5687 = load i8, i8* %.tmp5686
%.tmp5688 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp5687)
%.tmp5689 = and i1 %.tmp5682, %.tmp5688
br i1 %.tmp5689, label %.if.true.5690, label %.if.false.5690
.if.true.5690:
%.tmp5691 = load i32, i32* %i
%.tmp5692 = add i32 %.tmp5691, 1
store i32 %.tmp5692, i32* %i
br label %.if.end.5690
.if.false.5690:
%.tmp5693 = load i32, i32* %len
%.tmp5694 = add i32 %.tmp5693, 1
store i32 %.tmp5694, i32* %len
br label %.if.end.5690
.if.end.5690:
%.tmp5695 = load i32, i32* %i
%.tmp5696 = add i32 %.tmp5695, 1
store i32 %.tmp5696, i32* %i
br label %.for.start.5672
.for.end.5672:
%.tmp5697 = load i32, i32* %len
ret i32 %.tmp5697
}
define %m1791$.AssignableInfo.type* @m1791$define_string.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp5698 = bitcast ptr null to %m261$.Node.type*
%.tmp5699 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5698)
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp5699, %m1791$.AssignableInfo.type** %info
%tmp_buff = alloca i8*
%.tmp5700 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp5702 = getelementptr [7 x i8], [7 x i8]*@.str5701, i32 0, i32 0
%.tmp5703 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5704 = call i32(%m1791$.CompilerCtx.type*) @m1791$new_uid.i.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp5703)
%.tmp5705 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5700, i8* %.tmp5702, i32 %.tmp5704)
%.tmp5706 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5707 = load i8, i8* @SCOPE_GLOBAL
%.tmp5708 = load i8*, i8** %tmp_buff
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp5706, i8 %.tmp5707, i8* %.tmp5708)
%.tmp5709 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5710 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5709, i32 0, i32 3
%.tmp5711 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5711, %m1791$.Type.type** %.tmp5710
%.tmp5712 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5713 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5712, i32 0, i32 3
%.tmp5714 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5713
%.tmp5715 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5714, i32 0, i32 0
%.tmp5717 = getelementptr [6 x i8], [6 x i8]*@.str5716, i32 0, i32 0
store i8* %.tmp5717, i8** %.tmp5715
%.tmp5718 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5719 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5718, i32 0, i32 3
%.tmp5720 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5719
%.tmp5721 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5720, i32 0, i32 3
%.tmp5722 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5722, %m1791$.Type.type** %.tmp5721
%.tmp5723 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5724 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5723, i32 0, i32 3
%.tmp5725 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5724
%.tmp5726 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5725, i32 0, i32 3
%.tmp5727 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5726
%.tmp5728 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5727, i32 0, i32 0
%.tmp5730 = getelementptr [4 x i8], [4 x i8]*@.str5729, i32 0, i32 0
store i8* %.tmp5730, i8** %.tmp5728
%.tmp5731 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5732 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5731, i32 0, i32 3
%.tmp5733 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5732
%.tmp5734 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5733, i32 0, i32 3
%.tmp5735 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5734
%.tmp5736 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5735, i32 0, i32 4
%.tmp5737 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5737, %m1791$.Type.type** %.tmp5736
%.tmp5738 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5739 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5738, i32 0, i32 3
%.tmp5740 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5739
%.tmp5741 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5740, i32 0, i32 3
%.tmp5742 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5741
%.tmp5743 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5742, i32 0, i32 4
%.tmp5744 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5743
%.tmp5745 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5744, i32 0, i32 0
%.tmp5746 = getelementptr i8*, i8** %.tmp5745, i32 0
%.tmp5748 = getelementptr [3 x i8], [3 x i8]*@.str5747, i32 0, i32 0
%.tmp5749 = load i8*, i8** %text
%.tmp5750 = call i32(i8*) @m1791$calc_llvm_str_len.i.cp(i8* %.tmp5749)
%.tmp5751 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5746, i8* %.tmp5748, i32 %.tmp5750)
%.tmp5752 = load i32, i32* @GlobalName_size
%.tmp5753 = call i8*(i32) @malloc(i32 %.tmp5752)
%.tmp5754 = bitcast i8* %.tmp5753 to %m1791$.GlobalName.type*
%global = alloca %m1791$.GlobalName.type*
store %m1791$.GlobalName.type* %.tmp5754, %m1791$.GlobalName.type** %global
%.tmp5755 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %global
%.tmp5756 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp5755, i32 0, i32 0
%.tmp5757 = load i8*, i8** %text
store i8* %.tmp5757, i8** %.tmp5756
%.tmp5758 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %global
%.tmp5759 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp5758, i32 0, i32 1
%.tmp5761 = getelementptr [7 x i8], [7 x i8]*@.str5760, i32 0, i32 0
store i8* %.tmp5761, i8** %.tmp5759
%.tmp5762 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %global
%.tmp5763 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp5762, i32 0, i32 4
store %m1791$.GlobalName.type* null, %m1791$.GlobalName.type** %.tmp5763
%.tmp5764 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %global
%.tmp5765 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp5764, i32 0, i32 3
%.tmp5766 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
store %m1791$.AssignableInfo.type* %.tmp5766, %m1791$.AssignableInfo.type** %.tmp5765
%.tmp5767 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %global
%.tmp5768 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp5767, i32 0, i32 2
store i1 0, i1* %.tmp5768
%.tmp5769 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5770 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %global
call void(%m1791$.CompilerCtx.type*,%m1791$.GlobalName.type*) @m1791$append_global.v.m1791$.CompilerCtx.typep.m1791$.GlobalName.typep(%m1791$.CompilerCtx.type* %.tmp5769, %m1791$.GlobalName.type* %.tmp5770)
%.tmp5771 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
ret %m1791$.AssignableInfo.type* %.tmp5771
}
define void @m1791$define_module.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp.cp(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.mod.arg, i8* %.as_name.arg, i8* %.abspath.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%mod = alloca %m261$.Node.type*
store %m261$.Node.type* %.mod.arg, %m261$.Node.type** %mod
%as_name = alloca i8*
store i8* %.as_name.arg, i8** %as_name
%abspath = alloca i8*
store i8* %.abspath.arg, i8** %abspath
%.tmp5772 = load %m261$.Node.type*, %m261$.Node.type** %mod
%.tmp5773 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5772)
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp5773, %m1791$.AssignableInfo.type** %info
%.tmp5774 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5775 = load i8, i8* @SCOPE_CONST
%.tmp5776 = load i8*, i8** %abspath
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp5774, i8 %.tmp5775, i8* %.tmp5776)
%.tmp5777 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5778 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5777, i32 0, i32 2
%.tmp5780 = getelementptr [7 x i8], [7 x i8]*@.str5779, i32 0, i32 0
store i8* %.tmp5780, i8** %.tmp5778
%.tmp5781 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5782 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5781, i32 0, i32 3
store %m1791$.Type.type* null, %m1791$.Type.type** %.tmp5782
%.tmp5783 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5784 = load i8*, i8** %as_name
%.tmp5785 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
call void(%m1791$.CompilerCtx.type*,i8*,%m1791$.AssignableInfo.type*) @m1791$define_assignable.v.m1791$.CompilerCtx.typep.cp.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp5783, i8* %.tmp5784, %m1791$.AssignableInfo.type* %.tmp5785)
ret void
}
define void @m1791$append_global.v.m1791$.CompilerCtx.typep.m1791$.GlobalName.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%g = alloca %m1791$.GlobalName.type*
store %m1791$.GlobalName.type* %.g.arg, %m1791$.GlobalName.type** %g
%.tmp5786 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5787 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp5786, i32 0, i32 3
%.tmp5788 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %.tmp5787
%.tmp5789 = icmp eq %m1791$.GlobalName.type* %.tmp5788, null
br i1 %.tmp5789, label %.if.true.5790, label %.if.false.5790
.if.true.5790:
%.tmp5791 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5792 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp5791, i32 0, i32 3
%.tmp5793 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
store %m1791$.GlobalName.type* %.tmp5793, %m1791$.GlobalName.type** %.tmp5792
br label %.if.end.5790
.if.false.5790:
%last_global = alloca %m1791$.GlobalName.type*
%.tmp5795 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5796 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp5795, i32 0, i32 3
%.tmp5797 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %.tmp5796
store %m1791$.GlobalName.type* %.tmp5797, %m1791$.GlobalName.type** %last_global
br label %.for.start.5794
.for.start.5794:
%.tmp5798 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %last_global
%.tmp5799 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp5798, i32 0, i32 4
%.tmp5800 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %.tmp5799
%.tmp5801 = icmp ne %m1791$.GlobalName.type* %.tmp5800, null
br i1 %.tmp5801, label %.for.continue.5794, label %.for.end.5794
.for.continue.5794:
%.tmp5802 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %last_global
%.tmp5803 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp5802, i32 0, i32 4
%.tmp5804 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %.tmp5803
store %m1791$.GlobalName.type* %.tmp5804, %m1791$.GlobalName.type** %last_global
br label %.for.start.5794
.for.end.5794:
%.tmp5805 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %last_global
%.tmp5806 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp5805, i32 0, i32 4
%.tmp5807 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
store %m1791$.GlobalName.type* %.tmp5807, %m1791$.GlobalName.type** %.tmp5806
br label %.if.end.5790
.if.end.5790:
ret void
}
define i8* @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.Type.type* %.type.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.type.arg, %m1791$.Type.type** %type
%.tmp5808 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5809 = icmp eq %m1791$.Type.type* %.tmp5808, null
br i1 %.tmp5809, label %.if.true.5810, label %.if.false.5810
.if.true.5810:
%.tmp5812 = getelementptr [44 x i8], [44 x i8]*@.str5811, i32 0, i32 0
%.tmp5813 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5814 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp5813, i32 0, i32 6
%.tmp5815 = load i8*, i8** %.tmp5814
%.tmp5816 = call i32(i8*,...) @printf(i8* %.tmp5812, i8* %.tmp5815)
%.tmp5818 = getelementptr [2 x i8], [2 x i8]*@.str5817, i32 0, i32 0
ret i8* %.tmp5818
br label %.if.end.5810
.if.false.5810:
br label %.if.end.5810
.if.end.5810:
%.tmp5819 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5820 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5819, i32 0, i32 0
%.tmp5821 = load i8*, i8** %.tmp5820
%.tmp5822 = icmp ne i8* %.tmp5821, null
%.tmp5824 = getelementptr [59 x i8], [59 x i8]*@.str5823, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5822, i8* %.tmp5824)
%buf = alloca i8*
%.tmp5825 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5826 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5825, i32 0, i32 0
%.tmp5827 = load i8*, i8** %.tmp5826
%.tmp5829 = getelementptr [4 x i8], [4 x i8]*@.str5828, i32 0, i32 0
%.tmp5830 = call i32(i8*,i8*) @strcmp(i8* %.tmp5827, i8* %.tmp5829)
%.tmp5831 = icmp eq i32 %.tmp5830, 0
br i1 %.tmp5831, label %.if.true.5832, label %.if.false.5832
.if.true.5832:
%.tmp5834 = getelementptr [4 x i8], [4 x i8]*@.str5833, i32 0, i32 0
ret i8* %.tmp5834
br label %.if.end.5832
.if.false.5832:
%.tmp5835 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5836 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5835, i32 0, i32 0
%.tmp5837 = load i8*, i8** %.tmp5836
%.tmp5839 = getelementptr [5 x i8], [5 x i8]*@.str5838, i32 0, i32 0
%.tmp5840 = call i32(i8*,i8*) @strcmp(i8* %.tmp5837, i8* %.tmp5839)
%.tmp5841 = icmp eq i32 %.tmp5840, 0
br i1 %.tmp5841, label %.if.true.5842, label %.if.false.5842
.if.true.5842:
%.tmp5844 = getelementptr [5 x i8], [5 x i8]*@.str5843, i32 0, i32 0
ret i8* %.tmp5844
br label %.if.end.5842
.if.false.5842:
%.tmp5845 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5846 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5845, i32 0, i32 0
%.tmp5847 = load i8*, i8** %.tmp5846
%.tmp5849 = getelementptr [5 x i8], [5 x i8]*@.str5848, i32 0, i32 0
%.tmp5850 = call i32(i8*,i8*) @strcmp(i8* %.tmp5847, i8* %.tmp5849)
%.tmp5851 = icmp eq i32 %.tmp5850, 0
br i1 %.tmp5851, label %.if.true.5852, label %.if.false.5852
.if.true.5852:
%.tmp5854 = getelementptr [3 x i8], [3 x i8]*@.str5853, i32 0, i32 0
ret i8* %.tmp5854
br label %.if.end.5852
.if.false.5852:
%.tmp5855 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5856 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5855, i32 0, i32 0
%.tmp5857 = load i8*, i8** %.tmp5856
%.tmp5859 = getelementptr [8 x i8], [8 x i8]*@.str5858, i32 0, i32 0
%.tmp5860 = call i32(i8*,i8*) @strcmp(i8* %.tmp5857, i8* %.tmp5859)
%.tmp5861 = icmp eq i32 %.tmp5860, 0
br i1 %.tmp5861, label %.if.true.5862, label %.if.false.5862
.if.true.5862:
%.tmp5864 = getelementptr [4 x i8], [4 x i8]*@.str5863, i32 0, i32 0
ret i8* %.tmp5864
br label %.if.end.5862
.if.false.5862:
%.tmp5865 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5866 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5865, i32 0, i32 0
%.tmp5867 = load i8*, i8** %.tmp5866
%.tmp5869 = getelementptr [4 x i8], [4 x i8]*@.str5868, i32 0, i32 0
%.tmp5870 = call i32(i8*,i8*) @strcmp(i8* %.tmp5867, i8* %.tmp5869)
%.tmp5871 = icmp eq i32 %.tmp5870, 0
br i1 %.tmp5871, label %.if.true.5872, label %.if.false.5872
.if.true.5872:
%.tmp5874 = getelementptr [3 x i8], [3 x i8]*@.str5873, i32 0, i32 0
ret i8* %.tmp5874
br label %.if.end.5872
.if.false.5872:
%.tmp5875 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5876 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5875, i32 0, i32 0
%.tmp5877 = load i8*, i8** %.tmp5876
%.tmp5879 = getelementptr [9 x i8], [9 x i8]*@.str5878, i32 0, i32 0
%.tmp5880 = call i32(i8*,i8*) @strcmp(i8* %.tmp5877, i8* %.tmp5879)
%.tmp5881 = icmp eq i32 %.tmp5880, 0
br i1 %.tmp5881, label %.if.true.5882, label %.if.false.5882
.if.true.5882:
%.tmp5883 = getelementptr i8*, i8** %buf, i32 0
%.tmp5885 = getelementptr [4 x i8], [4 x i8]*@.str5884, i32 0, i32 0
%.tmp5886 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5887 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5888 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5887, i32 0, i32 3
%.tmp5889 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5888
%.tmp5890 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp5886, %m1791$.Type.type* %.tmp5889)
%.tmp5891 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5883, i8* %.tmp5885, i8* %.tmp5890)
%.tmp5893 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5894 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5893, i32 0, i32 3
%.tmp5895 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5894
%.tmp5896 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5895, i32 0, i32 4
%.tmp5897 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5896
%p = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp5897, %m1791$.Type.type** %p
br label %.for.start.5892
.for.start.5892:
%.tmp5898 = load %m1791$.Type.type*, %m1791$.Type.type** %p
%.tmp5899 = icmp ne %m1791$.Type.type* %.tmp5898, null
br i1 %.tmp5899, label %.for.continue.5892, label %.for.end.5892
.for.continue.5892:
%.tmp5900 = load %m1791$.Type.type*, %m1791$.Type.type** %p
%.tmp5901 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5902 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5901, i32 0, i32 3
%.tmp5903 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5902
%.tmp5904 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5903, i32 0, i32 4
%.tmp5905 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5904
%.tmp5906 = icmp ne %m1791$.Type.type* %.tmp5900, %.tmp5905
br i1 %.tmp5906, label %.if.true.5907, label %.if.false.5907
.if.true.5907:
%.tmp5908 = getelementptr i8*, i8** %buf, i32 0
%.tmp5910 = getelementptr [4 x i8], [4 x i8]*@.str5909, i32 0, i32 0
%.tmp5911 = load i8*, i8** %buf
%.tmp5912 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5908, i8* %.tmp5910, i8* %.tmp5911)
br label %.if.end.5907
.if.false.5907:
br label %.if.end.5907
.if.end.5907:
%.tmp5913 = getelementptr i8*, i8** %buf, i32 0
%.tmp5915 = getelementptr [5 x i8], [5 x i8]*@.str5914, i32 0, i32 0
%.tmp5916 = load i8*, i8** %buf
%.tmp5917 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5918 = load %m1791$.Type.type*, %m1791$.Type.type** %p
%.tmp5919 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp5917, %m1791$.Type.type* %.tmp5918)
%.tmp5920 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5913, i8* %.tmp5915, i8* %.tmp5916, i8* %.tmp5919)
%.tmp5921 = load %m1791$.Type.type*, %m1791$.Type.type** %p
%.tmp5922 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5921, i32 0, i32 4
%.tmp5923 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5922
store %m1791$.Type.type* %.tmp5923, %m1791$.Type.type** %p
br label %.for.start.5892
.for.end.5892:
%.tmp5924 = getelementptr i8*, i8** %buf, i32 0
%.tmp5926 = getelementptr [4 x i8], [4 x i8]*@.str5925, i32 0, i32 0
%.tmp5927 = load i8*, i8** %buf
%.tmp5928 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5924, i8* %.tmp5926, i8* %.tmp5927)
%.tmp5929 = load i8*, i8** %buf
ret i8* %.tmp5929
br label %.if.end.5882
.if.false.5882:
%.tmp5930 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5931 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5930, i32 0, i32 0
%.tmp5932 = load i8*, i8** %.tmp5931
%.tmp5934 = getelementptr [4 x i8], [4 x i8]*@.str5933, i32 0, i32 0
%.tmp5935 = call i32(i8*,i8*) @strcmp(i8* %.tmp5932, i8* %.tmp5934)
%.tmp5936 = icmp eq i32 %.tmp5935, 0
br i1 %.tmp5936, label %.if.true.5937, label %.if.false.5937
.if.true.5937:
%.tmp5938 = getelementptr i8*, i8** %buf, i32 0
%.tmp5940 = getelementptr [4 x i8], [4 x i8]*@.str5939, i32 0, i32 0
%.tmp5941 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5942 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5943 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5942, i32 0, i32 3
%.tmp5944 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5943
%.tmp5945 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp5941, %m1791$.Type.type* %.tmp5944)
%.tmp5946 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5938, i8* %.tmp5940, i8* %.tmp5945)
%.tmp5947 = load i8*, i8** %buf
ret i8* %.tmp5947
br label %.if.end.5937
.if.false.5937:
%.tmp5948 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5949 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5948, i32 0, i32 0
%.tmp5950 = load i8*, i8** %.tmp5949
%.tmp5952 = getelementptr [7 x i8], [7 x i8]*@.str5951, i32 0, i32 0
%.tmp5953 = call i32(i8*,i8*) @strcmp(i8* %.tmp5950, i8* %.tmp5952)
%.tmp5954 = icmp eq i32 %.tmp5953, 0
br i1 %.tmp5954, label %.if.true.5955, label %.if.false.5955
.if.true.5955:
%.tmp5956 = getelementptr i8*, i8** %buf, i32 0
%.tmp5958 = getelementptr [2 x i8], [2 x i8]*@.str5957, i32 0, i32 0
%.tmp5959 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5956, i8* %.tmp5958)
%.tmp5961 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5962 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5961, i32 0, i32 3
%.tmp5963 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5962
%t = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp5963, %m1791$.Type.type** %t
br label %.for.start.5960
.for.start.5960:
%.tmp5964 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp5965 = icmp ne %m1791$.Type.type* %.tmp5964, null
br i1 %.tmp5965, label %.for.continue.5960, label %.for.end.5960
.for.continue.5960:
%.tmp5966 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp5967 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5968 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5967, i32 0, i32 3
%.tmp5969 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5968
%.tmp5970 = icmp ne %m1791$.Type.type* %.tmp5966, %.tmp5969
br i1 %.tmp5970, label %.if.true.5971, label %.if.false.5971
.if.true.5971:
%.tmp5972 = getelementptr i8*, i8** %buf, i32 0
%.tmp5974 = getelementptr [4 x i8], [4 x i8]*@.str5973, i32 0, i32 0
%.tmp5975 = load i8*, i8** %buf
%.tmp5976 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5972, i8* %.tmp5974, i8* %.tmp5975)
br label %.if.end.5971
.if.false.5971:
br label %.if.end.5971
.if.end.5971:
%.tmp5977 = getelementptr i8*, i8** %buf, i32 0
%.tmp5979 = getelementptr [5 x i8], [5 x i8]*@.str5978, i32 0, i32 0
%.tmp5980 = load i8*, i8** %buf
%.tmp5981 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5982 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp5983 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp5981, %m1791$.Type.type* %.tmp5982)
%.tmp5984 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5977, i8* %.tmp5979, i8* %.tmp5980, i8* %.tmp5983)
%.tmp5985 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp5986 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5985, i32 0, i32 4
%.tmp5987 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5986
store %m1791$.Type.type* %.tmp5987, %m1791$.Type.type** %t
br label %.for.start.5960
.for.end.5960:
%.tmp5988 = getelementptr i8*, i8** %buf, i32 0
%.tmp5990 = getelementptr [4 x i8], [4 x i8]*@.str5989, i32 0, i32 0
%.tmp5991 = load i8*, i8** %buf
%.tmp5992 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5988, i8* %.tmp5990, i8* %.tmp5991)
%.tmp5993 = load i8*, i8** %buf
ret i8* %.tmp5993
br label %.if.end.5955
.if.false.5955:
%.tmp5994 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5995 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5994, i32 0, i32 0
%.tmp5996 = load i8*, i8** %.tmp5995
%.tmp5998 = getelementptr [6 x i8], [6 x i8]*@.str5997, i32 0, i32 0
%.tmp5999 = call i32(i8*,i8*) @strcmp(i8* %.tmp5996, i8* %.tmp5998)
%.tmp6000 = icmp eq i32 %.tmp5999, 0
br i1 %.tmp6000, label %.if.true.6001, label %.if.false.6001
.if.true.6001:
%.tmp6002 = getelementptr i8*, i8** %buf, i32 0
%.tmp6004 = getelementptr [10 x i8], [10 x i8]*@.str6003, i32 0, i32 0
%.tmp6005 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6006 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6005, i32 0, i32 3
%.tmp6007 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6006
%.tmp6008 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6007, i32 0, i32 4
%.tmp6009 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6008
%.tmp6010 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6009, i32 0, i32 0
%.tmp6011 = load i8*, i8** %.tmp6010
%.tmp6012 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6013 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6014 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6013, i32 0, i32 3
%.tmp6015 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6014
%.tmp6016 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp6012, %m1791$.Type.type* %.tmp6015)
%.tmp6017 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6002, i8* %.tmp6004, i8* %.tmp6011, i8* %.tmp6016)
%.tmp6018 = load i8*, i8** %buf
ret i8* %.tmp6018
br label %.if.end.6001
.if.false.6001:
%.tmp6019 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6020 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6019, i32 0, i32 0
%.tmp6021 = load i8*, i8** %.tmp6020
%.tmp6023 = getelementptr [10 x i8], [10 x i8]*@.str6022, i32 0, i32 0
%.tmp6024 = call i32(i8*,i8*) @strcmp(i8* %.tmp6021, i8* %.tmp6023)
%.tmp6025 = icmp eq i32 %.tmp6024, 0
br i1 %.tmp6025, label %.if.true.6026, label %.if.false.6026
.if.true.6026:
%.tmp6027 = getelementptr i8*, i8** %buf, i32 0
%.tmp6029 = getelementptr [5 x i8], [5 x i8]*@.str6028, i32 0, i32 0
%.tmp6030 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6031 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6030, i32 0, i32 2
%.tmp6032 = load i8*, i8** %.tmp6031
%.tmp6033 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6027, i8* %.tmp6029, i8* %.tmp6032)
%.tmp6034 = load i8*, i8** %buf
ret i8* %.tmp6034
br label %.if.end.6026
.if.false.6026:
%.tmp6035 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6036 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6035, i32 0, i32 0
%.tmp6037 = load i8*, i8** %.tmp6036
%.tmp6039 = getelementptr [4 x i8], [4 x i8]*@.str6038, i32 0, i32 0
%.tmp6040 = call i32(i8*,i8*) @strcmp(i8* %.tmp6037, i8* %.tmp6039)
%.tmp6041 = icmp eq i32 %.tmp6040, 0
br i1 %.tmp6041, label %.if.true.6042, label %.if.false.6042
.if.true.6042:
%.tmp6044 = getelementptr [4 x i8], [4 x i8]*@.str6043, i32 0, i32 0
ret i8* %.tmp6044
br label %.if.end.6042
.if.false.6042:
%.tmp6045 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6046 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6045, i32 0, i32 0
%.tmp6047 = load i8*, i8** %.tmp6046
%.tmp6049 = getelementptr [7 x i8], [7 x i8]*@.str6048, i32 0, i32 0
%.tmp6050 = call i32(i8*,i8*) @strcmp(i8* %.tmp6047, i8* %.tmp6049)
%.tmp6051 = icmp eq i32 %.tmp6050, 0
br i1 %.tmp6051, label %.if.true.6052, label %.if.false.6052
.if.true.6052:
%.tmp6054 = getelementptr [4 x i8], [4 x i8]*@.str6053, i32 0, i32 0
ret i8* %.tmp6054
br label %.if.end.6052
.if.false.6052:
%.tmp6055 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6056 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6055, i32 0, i32 0
%.tmp6057 = load i8*, i8** %.tmp6056
%.tmp6059 = getelementptr [6 x i8], [6 x i8]*@.str6058, i32 0, i32 0
%.tmp6060 = call i32(i8*,i8*) @strcmp(i8* %.tmp6057, i8* %.tmp6059)
%.tmp6061 = icmp eq i32 %.tmp6060, 0
br i1 %.tmp6061, label %.if.true.6062, label %.if.false.6062
.if.true.6062:
br label %.if.end.6062
.if.false.6062:
%.tmp6064 = getelementptr [58 x i8], [58 x i8]*@.str6063, i32 0, i32 0
%.tmp6065 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6066 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6065, i32 0, i32 0
%.tmp6067 = load i8*, i8** %.tmp6066
%.tmp6068 = call i32(i8*,...) @printf(i8* %.tmp6064, i8* %.tmp6067)
br label %.if.end.6062
.if.end.6062:
br label %.if.end.6052
.if.end.6052:
br label %.if.end.6042
.if.end.6042:
br label %.if.end.6026
.if.end.6026:
br label %.if.end.6001
.if.end.6001:
br label %.if.end.5955
.if.end.5955:
br label %.if.end.5937
.if.end.5937:
br label %.if.end.5882
.if.end.5882:
br label %.if.end.5872
.if.end.5872:
br label %.if.end.5862
.if.end.5862:
br label %.if.end.5852
.if.end.5852:
br label %.if.end.5842
.if.end.5842:
br label %.if.end.5832
.if.end.5832:
%.tmp6069 = bitcast ptr null to i8*
ret i8* %.tmp6069
}
define void @m1791$append_error.v.m1791$.CompilerCtx.typep.m678$.Error.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m678$.Error.type* %.e.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%e = alloca %m678$.Error.type*
store %m678$.Error.type* %.e.arg, %m678$.Error.type** %e
%.tmp6070 = load i32, i32* @ErrorList_size
%.tmp6071 = call i8*(i32) @malloc(i32 %.tmp6070)
%.tmp6072 = bitcast i8* %.tmp6071 to %m1791$.ErrorList.type*
%new_err = alloca %m1791$.ErrorList.type*
store %m1791$.ErrorList.type* %.tmp6072, %m1791$.ErrorList.type** %new_err
%.tmp6073 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %new_err
%.tmp6074 = getelementptr %m1791$.ErrorList.type, %m1791$.ErrorList.type* %.tmp6073, i32 0, i32 0
%.tmp6075 = load %m678$.Error.type*, %m678$.Error.type** %e
store %m678$.Error.type* %.tmp6075, %m678$.Error.type** %.tmp6074
%.tmp6076 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %new_err
%.tmp6077 = getelementptr %m1791$.ErrorList.type, %m1791$.ErrorList.type* %.tmp6076, i32 0, i32 1
store %m1791$.ErrorList.type* null, %m1791$.ErrorList.type** %.tmp6077
%.tmp6078 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6079 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp6078, i32 0, i32 2
%.tmp6080 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %.tmp6079
%.tmp6081 = icmp eq %m1791$.ErrorList.type* %.tmp6080, null
br i1 %.tmp6081, label %.if.true.6082, label %.if.false.6082
.if.true.6082:
%.tmp6083 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6084 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp6083, i32 0, i32 2
%.tmp6085 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %new_err
store %m1791$.ErrorList.type* %.tmp6085, %m1791$.ErrorList.type** %.tmp6084
ret void
br label %.if.end.6082
.if.false.6082:
br label %.if.end.6082
.if.end.6082:
%.tmp6087 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6088 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp6087, i32 0, i32 2
%.tmp6089 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %.tmp6088
%last = alloca %m1791$.ErrorList.type*
store %m1791$.ErrorList.type* %.tmp6089, %m1791$.ErrorList.type** %last
br label %.for.start.6086
.for.start.6086:
%.tmp6090 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %last
%.tmp6091 = getelementptr %m1791$.ErrorList.type, %m1791$.ErrorList.type* %.tmp6090, i32 0, i32 1
%.tmp6092 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %.tmp6091
%.tmp6093 = icmp ne %m1791$.ErrorList.type* %.tmp6092, null
br i1 %.tmp6093, label %.for.continue.6086, label %.for.end.6086
.for.continue.6086:
%.tmp6094 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %last
%.tmp6095 = getelementptr %m1791$.ErrorList.type, %m1791$.ErrorList.type* %.tmp6094, i32 0, i32 1
%.tmp6096 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %.tmp6095
store %m1791$.ErrorList.type* %.tmp6096, %m1791$.ErrorList.type** %last
br label %.for.start.6086
.for.end.6086:
%.tmp6097 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %last
%.tmp6098 = getelementptr %m1791$.ErrorList.type, %m1791$.ErrorList.type* %.tmp6097, i32 0, i32 1
%.tmp6099 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %new_err
store %m1791$.ErrorList.type* %.tmp6099, %m1791$.ErrorList.type** %.tmp6098
ret void
}
define i8* @m1791$syn_function_name.cp.m261$.Node.typep(%m261$.Node.type* %.stmt.arg) {
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp6100 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6101 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6100, i32 0, i32 6
%.tmp6102 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6101
%.tmp6103 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6102, i32 0, i32 7
%.tmp6104 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6103
%.tmp6105 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6104, i32 0, i32 1
%.tmp6106 = load i8*, i8** %.tmp6105
ret i8* %.tmp6106
}
define %m261$.Node.type* @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m261$.Node.type*
store %m261$.Node.type* %.node.arg, %m261$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp6108 = load %m261$.Node.type*, %m261$.Node.type** %node
%n = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp6108, %m261$.Node.type** %n
br label %.for.start.6107
.for.start.6107:
%.tmp6109 = load %m261$.Node.type*, %m261$.Node.type** %n
%.tmp6110 = icmp ne %m261$.Node.type* %.tmp6109, null
br i1 %.tmp6110, label %.for.continue.6107, label %.for.end.6107
.for.continue.6107:
%.tmp6111 = load %m261$.Node.type*, %m261$.Node.type** %n
%.tmp6112 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6111, i32 0, i32 0
%.tmp6113 = load i8*, i8** %.tmp6112
%.tmp6114 = load i8*, i8** %type
%.tmp6115 = call i32(i8*,i8*) @strcmp(i8* %.tmp6113, i8* %.tmp6114)
%.tmp6116 = icmp eq i32 %.tmp6115, 0
br i1 %.tmp6116, label %.if.true.6117, label %.if.false.6117
.if.true.6117:
%.tmp6118 = load %m261$.Node.type*, %m261$.Node.type** %n
ret %m261$.Node.type* %.tmp6118
br label %.if.end.6117
.if.false.6117:
br label %.if.end.6117
.if.end.6117:
%.tmp6119 = load %m261$.Node.type*, %m261$.Node.type** %n
%.tmp6120 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6119, i32 0, i32 7
%.tmp6121 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6120
store %m261$.Node.type* %.tmp6121, %m261$.Node.type** %n
br label %.for.start.6107
.for.end.6107:
%.tmp6122 = bitcast ptr null to %m261$.Node.type*
ret %m261$.Node.type* %.tmp6122
}
define %m1791$.Type.type* @m1791$syn_function_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp6123 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
%function_type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp6123, %m1791$.Type.type** %function_type
%.tmp6124 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6125 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6126 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6125, i32 0, i32 6
%.tmp6127 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6126
%.tmp6128 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp6124, %m261$.Node.type* %.tmp6127)
%return_value_type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp6128, %m1791$.Type.type** %return_value_type
%.tmp6129 = load %m1791$.Type.type*, %m1791$.Type.type** %function_type
%.tmp6130 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6129, i32 0, i32 0
%.tmp6132 = getelementptr [9 x i8], [9 x i8]*@.str6131, i32 0, i32 0
store i8* %.tmp6132, i8** %.tmp6130
%.tmp6133 = load %m1791$.Type.type*, %m1791$.Type.type** %function_type
%.tmp6134 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6133, i32 0, i32 3
%.tmp6135 = load %m1791$.Type.type*, %m1791$.Type.type** %return_value_type
store %m1791$.Type.type* %.tmp6135, %m1791$.Type.type** %.tmp6134
%.tmp6136 = load %m1791$.Type.type*, %m1791$.Type.type** %return_value_type
%last_type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp6136, %m1791$.Type.type** %last_type
%.tmp6137 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6138 = call %m261$.Node.type*(%m261$.Node.type*) @m1791$syn_function_params.m261$.Node.typep.m261$.Node.typep(%m261$.Node.type* %.tmp6137)
%params = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp6138, %m261$.Node.type** %params
%.tmp6140 = load %m261$.Node.type*, %m261$.Node.type** %params
%param_ptr = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp6140, %m261$.Node.type** %param_ptr
br label %.for.start.6139
.for.start.6139:
%.tmp6141 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6142 = icmp ne %m261$.Node.type* %.tmp6141, null
br i1 %.tmp6142, label %.for.continue.6139, label %.for.end.6139
.for.continue.6139:
%.tmp6143 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6144 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6143, i32 0, i32 0
%.tmp6145 = load i8*, i8** %.tmp6144
%.tmp6147 = getelementptr [5 x i8], [5 x i8]*@.str6146, i32 0, i32 0
%.tmp6148 = call i32(i8*,i8*) @strcmp(i8* %.tmp6145, i8* %.tmp6147)
%.tmp6149 = icmp eq i32 %.tmp6148, 0
br i1 %.tmp6149, label %.if.true.6150, label %.if.false.6150
.if.true.6150:
%.tmp6151 = load %m1791$.Type.type*, %m1791$.Type.type** %last_type
%.tmp6152 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6151, i32 0, i32 4
%.tmp6153 = load %m1791$.Type.type*, %m1791$.Type.type** %last_type
%.tmp6154 = call %m1791$.Type.type*(%m1791$.Type.type*) @m1791$type_clone.m1791$.Type.typep.m1791$.Type.typep(%m1791$.Type.type* %.tmp6153)
store %m1791$.Type.type* %.tmp6154, %m1791$.Type.type** %.tmp6152
%.tmp6155 = load %m1791$.Type.type*, %m1791$.Type.type** %last_type
%.tmp6156 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6155, i32 0, i32 4
%.tmp6157 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6156
%.tmp6158 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6157, i32 0, i32 4
store %m1791$.Type.type* null, %m1791$.Type.type** %.tmp6158
%.tmp6159 = load %m1791$.Type.type*, %m1791$.Type.type** %last_type
%.tmp6160 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6159, i32 0, i32 4
%.tmp6161 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6160
store %m1791$.Type.type* %.tmp6161, %m1791$.Type.type** %last_type
%.tmp6162 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6163 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6162, i32 0, i32 7
%.tmp6164 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6163
%.tmp6165 = icmp ne %m261$.Node.type* %.tmp6164, null
br i1 %.tmp6165, label %.if.true.6166, label %.if.false.6166
.if.true.6166:
%.tmp6167 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6168 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6167, i32 0, i32 7
%.tmp6169 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6168
store %m261$.Node.type* %.tmp6169, %m261$.Node.type** %param_ptr
br label %.if.end.6166
.if.false.6166:
br label %.if.end.6166
.if.end.6166:
%.tmp6170 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6171 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6170, i32 0, i32 7
%.tmp6172 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6171
%.tmp6173 = icmp ne %m261$.Node.type* %.tmp6172, null
br i1 %.tmp6173, label %.if.true.6174, label %.if.false.6174
.if.true.6174:
%.tmp6175 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6176 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6175, i32 0, i32 7
%.tmp6177 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6176
store %m261$.Node.type* %.tmp6177, %m261$.Node.type** %param_ptr
br label %.if.end.6174
.if.false.6174:
store %m261$.Node.type* null, %m261$.Node.type** %param_ptr
br label %.if.end.6174
.if.end.6174:
br label %.if.end.6150
.if.false.6150:
%.tmp6178 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6179 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6180 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6179, i32 0, i32 6
%.tmp6181 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6180
%.tmp6182 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp6178, %m261$.Node.type* %.tmp6181)
%param_type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp6182, %m1791$.Type.type** %param_type
%.tmp6183 = load %m1791$.Type.type*, %m1791$.Type.type** %last_type
%.tmp6184 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6183, i32 0, i32 4
%.tmp6185 = load %m1791$.Type.type*, %m1791$.Type.type** %param_type
store %m1791$.Type.type* %.tmp6185, %m1791$.Type.type** %.tmp6184
%.tmp6186 = load %m1791$.Type.type*, %m1791$.Type.type** %param_type
store %m1791$.Type.type* %.tmp6186, %m1791$.Type.type** %last_type
%.tmp6187 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6188 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6187, i32 0, i32 7
%.tmp6189 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6188
store %m261$.Node.type* %.tmp6189, %m261$.Node.type** %param_ptr
%.tmp6190 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6191 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6190, i32 0, i32 7
%.tmp6192 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6191
%.tmp6193 = icmp ne %m261$.Node.type* %.tmp6192, null
br i1 %.tmp6193, label %.if.true.6194, label %.if.false.6194
.if.true.6194:
%.tmp6195 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6196 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6195, i32 0, i32 7
%.tmp6197 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6196
%.tmp6198 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6197, i32 0, i32 7
%.tmp6199 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6198
store %m261$.Node.type* %.tmp6199, %m261$.Node.type** %param_ptr
br label %.if.end.6194
.if.false.6194:
store %m261$.Node.type* null, %m261$.Node.type** %param_ptr
br label %.if.end.6194
.if.end.6194:
br label %.if.end.6150
.if.end.6150:
br label %.for.start.6139
.for.end.6139:
%.tmp6200 = load %m1791$.Type.type*, %m1791$.Type.type** %function_type
ret %m1791$.Type.type* %.tmp6200
}
define %m261$.Node.type* @m1791$syn_function_params.m261$.Node.typep.m261$.Node.typep(%m261$.Node.type* %.stmt.arg) {
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp6201 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6203 = getelementptr [10 x i8], [10 x i8]*@.str6202, i32 0, i32 0
%.tmp6204 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp6201, i8* %.tmp6203)
%params = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp6204, %m261$.Node.type** %params
%.tmp6205 = load %m261$.Node.type*, %m261$.Node.type** %params
%.tmp6206 = icmp eq %m261$.Node.type* %.tmp6205, null
br i1 %.tmp6206, label %.if.true.6207, label %.if.false.6207
.if.true.6207:
%.tmp6208 = bitcast ptr null to %m261$.Node.type*
ret %m261$.Node.type* %.tmp6208
br label %.if.end.6207
.if.false.6207:
br label %.if.end.6207
.if.end.6207:
%.tmp6209 = load %m261$.Node.type*, %m261$.Node.type** %params
%.tmp6210 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6209, i32 0, i32 6
%.tmp6211 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6210
ret %m261$.Node.type* %.tmp6211
}
define %m1791$.Type.type* @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp6212 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
%t = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp6212, %m1791$.Type.type** %t
%.tmp6213 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6214 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6213, i32 0, i32 0
%.tmp6215 = load i8*, i8** %.tmp6214
%.tmp6217 = getelementptr [10 x i8], [10 x i8]*@.str6216, i32 0, i32 0
%.tmp6218 = call i32(i8*,i8*) @strcmp(i8* %.tmp6215, i8* %.tmp6217)
%.tmp6219 = icmp eq i32 %.tmp6218, 0
br i1 %.tmp6219, label %.if.true.6220, label %.if.false.6220
.if.true.6220:
%.tmp6221 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6222 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6221, i32 0, i32 0
%.tmp6224 = getelementptr [7 x i8], [7 x i8]*@.str6223, i32 0, i32 0
store i8* %.tmp6224, i8** %.tmp6222
%.tmp6225 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6226 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6225, i32 0, i32 1
store i8* null, i8** %.tmp6226
%.tmp6227 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6228 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6227, i32 0, i32 6
%.tmp6229 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6228
%.tmp6231 = getelementptr [5 x i8], [5 x i8]*@.str6230, i32 0, i32 0
%.tmp6232 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp6229, i8* %.tmp6231)
%curr_type = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp6232, %m261$.Node.type** %curr_type
%.tmp6233 = load %m261$.Node.type*, %m261$.Node.type** %curr_type
%.tmp6234 = icmp ne %m261$.Node.type* %.tmp6233, null
br i1 %.tmp6234, label %.if.true.6235, label %.if.false.6235
.if.true.6235:
%.tmp6236 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6237 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6236, i32 0, i32 3
%.tmp6238 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6239 = load %m261$.Node.type*, %m261$.Node.type** %curr_type
%.tmp6240 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6239, i32 0, i32 6
%.tmp6241 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6240
%.tmp6242 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp6238, %m261$.Node.type* %.tmp6241)
store %m1791$.Type.type* %.tmp6242, %m1791$.Type.type** %.tmp6237
%.tmp6243 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6244 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6243, i32 0, i32 3
%.tmp6245 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6244
%.tmp6246 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6245, i32 0, i32 1
%.tmp6247 = load %m261$.Node.type*, %m261$.Node.type** %curr_type
%.tmp6248 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6247, i32 0, i32 7
%.tmp6249 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6248
%.tmp6250 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6249, i32 0, i32 1
%.tmp6251 = load i8*, i8** %.tmp6250
store i8* %.tmp6251, i8** %.tmp6246
%.tmp6252 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6253 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6252, i32 0, i32 3
%.tmp6254 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6253
%curr_t = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp6254, %m1791$.Type.type** %curr_t
%.tmp6256 = load %m261$.Node.type*, %m261$.Node.type** %curr_type
%.tmp6257 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6256, i32 0, i32 7
%.tmp6258 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6257
%.tmp6260 = getelementptr [5 x i8], [5 x i8]*@.str6259, i32 0, i32 0
%.tmp6261 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp6258, i8* %.tmp6260)
store %m261$.Node.type* %.tmp6261, %m261$.Node.type** %curr_type
br label %.for.start.6255
.for.start.6255:
%.tmp6262 = load %m261$.Node.type*, %m261$.Node.type** %curr_type
%.tmp6263 = icmp ne %m261$.Node.type* %.tmp6262, null
br i1 %.tmp6263, label %.for.continue.6255, label %.for.end.6255
.for.continue.6255:
%.tmp6264 = load %m1791$.Type.type*, %m1791$.Type.type** %curr_t
%.tmp6265 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6264, i32 0, i32 4
%.tmp6266 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6267 = load %m261$.Node.type*, %m261$.Node.type** %curr_type
%.tmp6268 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6267, i32 0, i32 6
%.tmp6269 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6268
%.tmp6270 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp6266, %m261$.Node.type* %.tmp6269)
store %m1791$.Type.type* %.tmp6270, %m1791$.Type.type** %.tmp6265
%.tmp6271 = load %m1791$.Type.type*, %m1791$.Type.type** %curr_t
%.tmp6272 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6271, i32 0, i32 4
%.tmp6273 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6272
%.tmp6274 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6273, i32 0, i32 1
%.tmp6275 = load %m261$.Node.type*, %m261$.Node.type** %curr_type
%.tmp6276 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6275, i32 0, i32 7
%.tmp6277 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6276
%.tmp6278 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6277, i32 0, i32 1
%.tmp6279 = load i8*, i8** %.tmp6278
store i8* %.tmp6279, i8** %.tmp6274
%.tmp6280 = load %m1791$.Type.type*, %m1791$.Type.type** %curr_t
%.tmp6281 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6280, i32 0, i32 4
%.tmp6282 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6281
store %m1791$.Type.type* %.tmp6282, %m1791$.Type.type** %curr_t
%.tmp6283 = load %m261$.Node.type*, %m261$.Node.type** %curr_type
%.tmp6284 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6283, i32 0, i32 7
%.tmp6285 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6284
%.tmp6287 = getelementptr [5 x i8], [5 x i8]*@.str6286, i32 0, i32 0
%.tmp6288 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp6285, i8* %.tmp6287)
store %m261$.Node.type* %.tmp6288, %m261$.Node.type** %curr_type
br label %.for.start.6255
.for.end.6255:
br label %.if.end.6235
.if.false.6235:
br label %.if.end.6235
.if.end.6235:
br label %.if.end.6220
.if.false.6220:
%.tmp6289 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6290 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6289, i32 0, i32 0
%.tmp6291 = load i8*, i8** %.tmp6290
%.tmp6293 = getelementptr [5 x i8], [5 x i8]*@.str6292, i32 0, i32 0
%.tmp6294 = call i32(i8*,i8*) @strcmp(i8* %.tmp6291, i8* %.tmp6293)
%.tmp6295 = icmp eq i32 %.tmp6294, 0
br i1 %.tmp6295, label %.if.true.6296, label %.if.false.6296
.if.true.6296:
%.tmp6297 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6298 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6297, i32 0, i32 0
%.tmp6299 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6300 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6299, i32 0, i32 1
%.tmp6301 = load i8*, i8** %.tmp6300
store i8* %.tmp6301, i8** %.tmp6298
br label %.if.end.6296
.if.false.6296:
%.tmp6302 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6303 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6302, i32 0, i32 0
%.tmp6304 = load i8*, i8** %.tmp6303
%.tmp6306 = getelementptr [12 x i8], [12 x i8]*@.str6305, i32 0, i32 0
%.tmp6307 = call i32(i8*,i8*) @strcmp(i8* %.tmp6304, i8* %.tmp6306)
%.tmp6308 = icmp eq i32 %.tmp6307, 0
br i1 %.tmp6308, label %.if.true.6309, label %.if.false.6309
.if.true.6309:
%err_msg = alloca i8*
%.tmp6310 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6311 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6312 = call %m1791$.ScopeItem.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$find_defined.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp6310, %m261$.Node.type* %.tmp6311)
%base = alloca %m1791$.ScopeItem.type*
store %m1791$.ScopeItem.type* %.tmp6312, %m1791$.ScopeItem.type** %base
%.tmp6313 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %base
%.tmp6314 = icmp eq %m1791$.ScopeItem.type* %.tmp6313, null
br i1 %.tmp6314, label %.if.true.6315, label %.if.false.6315
.if.true.6315:
%.tmp6316 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp6318 = getelementptr [37 x i8], [37 x i8]*@.str6317, i32 0, i32 0
%.tmp6319 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6320 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6319, i32 0, i32 6
%.tmp6321 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6320
%.tmp6322 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6321, i32 0, i32 1
%.tmp6323 = load i8*, i8** %.tmp6322
%.tmp6324 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6316, i8* %.tmp6318, i8* %.tmp6323)
%.tmp6325 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6326 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6327 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp6325, %m261$.Node.type* %.tmp6326, i8* %.tmp6327)
%.tmp6328 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6329 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6328, i32 0, i32 0
%.tmp6331 = getelementptr [6 x i8], [6 x i8]*@.str6330, i32 0, i32 0
store i8* %.tmp6331, i8** %.tmp6329
%.tmp6332 = load %m1791$.Type.type*, %m1791$.Type.type** %t
ret %m1791$.Type.type* %.tmp6332
br label %.if.end.6315
.if.false.6315:
br label %.if.end.6315
.if.end.6315:
%.tmp6333 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6334 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6333, i32 0, i32 0
%.tmp6336 = getelementptr [10 x i8], [10 x i8]*@.str6335, i32 0, i32 0
store i8* %.tmp6336, i8** %.tmp6334
%.tmp6337 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6338 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6337, i32 0, i32 1
%.tmp6339 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %base
%.tmp6340 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp6339, i32 0, i32 0
%.tmp6341 = load i8*, i8** %.tmp6340
store i8* %.tmp6341, i8** %.tmp6338
%.tmp6342 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6343 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6342, i32 0, i32 2
%.tmp6344 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %base
%.tmp6345 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp6344, i32 0, i32 1
%.tmp6346 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp6345
%.tmp6347 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp6346, i32 0, i32 0
%.tmp6348 = load i8*, i8** %.tmp6347
store i8* %.tmp6348, i8** %.tmp6343
%.tmp6349 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6350 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6349, i32 0, i32 3
%.tmp6351 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %base
%.tmp6352 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp6351, i32 0, i32 1
%.tmp6353 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp6352
%.tmp6354 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp6353, i32 0, i32 3
%.tmp6355 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6354
store %m1791$.Type.type* %.tmp6355, %m1791$.Type.type** %.tmp6350
br label %.if.end.6309
.if.false.6309:
%.tmp6356 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6357 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6356, i32 0, i32 1
%.tmp6358 = load i8*, i8** %.tmp6357
%.tmp6360 = getelementptr [4 x i8], [4 x i8]*@.str6359, i32 0, i32 0
%.tmp6361 = call i32(i8*,i8*) @strcmp(i8* %.tmp6358, i8* %.tmp6360)
%.tmp6362 = icmp eq i32 %.tmp6361, 0
br i1 %.tmp6362, label %.if.true.6363, label %.if.false.6363
.if.true.6363:
%.tmp6364 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6365 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6364, i32 0, i32 0
%.tmp6367 = getelementptr [7 x i8], [7 x i8]*@.str6366, i32 0, i32 0
store i8* %.tmp6367, i8** %.tmp6365
br label %.if.end.6363
.if.false.6363:
%.tmp6368 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6369 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6371 = getelementptr [54 x i8], [54 x i8]*@.str6370, i32 0, i32 0
%.tmp6372 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp6368, %m261$.Node.type* %.tmp6369, i8* %.tmp6371)
%.tmp6373 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6374 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6373, i32 0, i32 0
%.tmp6375 = load i8*, i8** %.tmp6374
%.tmp6376 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6377 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6376, i32 0, i32 1
%.tmp6378 = load i8*, i8** %.tmp6377
%.tmp6379 = call i32(i8*,...) @printf(i8* %.tmp6372, i8* %.tmp6375, i8* %.tmp6378)
br label %.if.end.6363
.if.end.6363:
br label %.if.end.6309
.if.end.6309:
br label %.if.end.6296
.if.end.6296:
br label %.if.end.6220
.if.end.6220:
%.tmp6381 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6382 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6381, i32 0, i32 7
%.tmp6383 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6382
%ptr = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp6383, %m261$.Node.type** %ptr
br label %.for.start.6380
.for.start.6380:
%.tmp6384 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp6385 = icmp ne %m261$.Node.type* %.tmp6384, null
br i1 %.tmp6385, label %.for.continue.6380, label %.for.end.6380
.for.continue.6380:
%.tmp6386 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
%pt = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp6386, %m1791$.Type.type** %pt
%.tmp6387 = load %m1791$.Type.type*, %m1791$.Type.type** %pt
%.tmp6388 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6387, i32 0, i32 0
%.tmp6390 = getelementptr [4 x i8], [4 x i8]*@.str6389, i32 0, i32 0
store i8* %.tmp6390, i8** %.tmp6388
%.tmp6391 = load %m1791$.Type.type*, %m1791$.Type.type** %pt
%.tmp6392 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6391, i32 0, i32 3
%.tmp6393 = load %m1791$.Type.type*, %m1791$.Type.type** %t
store %m1791$.Type.type* %.tmp6393, %m1791$.Type.type** %.tmp6392
%.tmp6394 = load %m1791$.Type.type*, %m1791$.Type.type** %pt
store %m1791$.Type.type* %.tmp6394, %m1791$.Type.type** %t
%.tmp6395 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp6396 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6395, i32 0, i32 7
%.tmp6397 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6396
store %m261$.Node.type* %.tmp6397, %m261$.Node.type** %ptr
br label %.for.start.6380
.for.end.6380:
%.tmp6398 = load %m1791$.Type.type*, %m1791$.Type.type** %t
ret %m1791$.Type.type* %.tmp6398
}
@.str2251 = constant [5 x i8] c"%s{\0A\00"
@.str2255 = constant [21 x i8] c"%s  container: \22%s\22\0A\00"
@.str2262 = constant [16 x i8] c"%s  info: \22%s\22\0A\00"
@.str2269 = constant [16 x i8] c"%s  repr: \22%s\22\0A\00"
@.str2281 = constant [16 x i8] c"%s  of: (null)\0A\00"
@.str2285 = constant [10 x i8] c"%s  of: \0A\00"
@.str2299 = constant [18 x i8] c"%s  next: (null)\0A\00"
@.str2303 = constant [12 x i8] c"%s  next: \0A\00"
@.str2312 = constant [5 x i8] c"%s}\0A\00"
@.str2369 = constant [5 x i8] c"%c%s\00"
@.str2380 = constant [7 x i8] c".tmp%d\00"
@.str2457 = constant [1 x i8] c"\00"
@.str2486 = constant [61 x i8] c":coffee-error: 'pop_scope' called when module.scopes is null\00"
@.str2495 = constant [13 x i8] c"./syntax.txt\00"
@.str2497 = constant [2 x i8] c"r\00"
@.str2517 = constant [6 x i8] c"start\00"
@.str2529 = constant [6 x i8] c"start\00"
@.str2541 = constant [13 x i8] c"head_comment\00"
@.str2623 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2636 = constant [7 x i8] c"string\00"
@.str2649 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str2677 = constant [5 x i8] c"%s%s\00"
@.str2685 = constant [9 x i8] c"function\00"
@.str2691 = constant [5 x i8] c"main\00"
@.str2703 = constant [6 x i8] c"%s.%s\00"
@.str2720 = constant [3 x i8] c"NL\00"
@.str2728 = constant [7 x i8] c"global\00"
@.str2736 = constant [11 x i8] c"assignable\00"
@.str2764 = constant [9 x i8] c"variable\00"
@.str2775 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str2790 = constant [10 x i8] c"typealias\00"
@.str2810 = constant [11 x i8] c"%s.%s.type\00"
@.str2822 = constant [10 x i8] c"typealias\00"
@.str2843 = constant [5 x i8] c"type\00"
@.str2870 = constant [14 x i8] c"%s = type %s\0A\00"
@.str2883 = constant [7 x i8] c"extern\00"
@.str2901 = constant [7 x i8] c"extern\00"
@.str2956 = constant [15 x i8] c"declare %s %s(\00"
@.str2987 = constant [3 x i8] c", \00"
@.str2993 = constant [3 x i8] c"%s\00"
@.str3005 = constant [3 x i8] c")\0A\00"
@.str3016 = constant [9 x i8] c"function\00"
@.str3025 = constant [9 x i8] c"function\00"
@.str3080 = constant [14 x i8] c"define %s %s(\00"
@.str3106 = constant [3 x i8] c", \00"
@.str3112 = constant [5 x i8] c"type\00"
@.str3128 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3143 = constant [5 x i8] c") {\0A\00"
@.str3152 = constant [6 x i8] c"block\00"
@.str3170 = constant [3 x i8] c"NL\00"
@.str3177 = constant [9 x i8] c"OPERATOR\00"
@.str3195 = constant [7 x i8] c"return\00"
@.str3205 = constant [5 x i8] c"void\00"
@.str3212 = constant [21 x i8] c"missing return value\00"
@.str3217 = constant [10 x i8] c"ret void\0A\00"
@.str3223 = constant [3 x i8] c"}\0A\00"
@.str3229 = constant [7 x i8] c"import\00"
@.str3274 = constant [1 x i8] c"\00"
@.str3280 = constant [6 x i8] c"%s.bn\00"
@.str3285 = constant [9 x i8] c"%s/%s.bn\00"
@.str3297 = constant [60 x i8] c"Unable to import '%s' no such file or directory. (%s/%s.bn)\00"
@.str3354 = constant [5 x i8] c"m%d$\00"
@.str3403 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3411 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3440 = constant [9 x i8] c"variable\00"
@.str3445 = constant [5 x i8] c"type\00"
@.str3475 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3487 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3508 = constant [11 x i8] c"expression\00"
@.str3529 = constant [35 x i8] c"unable to compile function address\00"
@.str3535 = constant [8 x i8] c"fn_args\00"
@.str3538 = constant [1 x i8] c"\00"
@.str3546 = constant [11 x i8] c"assignable\00"
@.str3558 = constant [5 x i8] c"%s, \00"
@.str3574 = constant [8 x i8] c"%s%s %s\00"
@.str3589 = constant [11 x i8] c"assignable\00"
@.str3599 = constant [5 x i8] c"void\00"
@.str3607 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str3638 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str3659 = constant [7 x i8] c"return\00"
@.str3671 = constant [3 x i8] c"NL\00"
@.str3689 = constant [11 x i8] c"ret %s %s\0A\00"
@.str3702 = constant [10 x i8] c"ret void\0A\00"
@.str3706 = constant [3 x i8] c"NL\00"
@.str3712 = constant [8 x i8] c"fn_call\00"
@.str3723 = constant [12 x i8] c"declaration\00"
@.str3732 = constant [11 x i8] c"assignment\00"
@.str3740 = constant [11 x i8] c"assignable\00"
@.str3752 = constant [34 x i8] c"%s was not declared in this scope\00"
@.str3784 = constant [4 x i8] c"ptr\00"
@.str3793 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str3803 = constant [9 x i8] c"if_block\00"
@.str3811 = constant [9 x i8] c"for_loop\00"
@.str3820 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str3835 = constant [12 x i8] c"declaration\00"
@.str3846 = constant [11 x i8] c"assignment\00"
@.str3856 = constant [9 x i8] c"OPERATOR\00"
@.str3863 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str3873 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str3880 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str3887 = constant [9 x i8] c"OPERATOR\00"
@.str3899 = constant [57 x i8] c"br %s %s, label %%.for.continue.%d, label %%.for.end.%d\0A\00"
@.str3914 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str3921 = constant [9 x i8] c"OPERATOR\00"
@.str3928 = constant [6 x i8] c"block\00"
@.str3942 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str3949 = constant [14 x i8] c".for.end.%d:\0A\00"
@.str3960 = constant [5 x i8] c"type\00"
@.str3975 = constant [11 x i8] c"assignable\00"
@.str3988 = constant [9 x i8] c"variable\00"
@.str3993 = constant [5 x i8] c"WORD\00"
@.str4001 = constant [31 x i8] c"unable to get declaration name\00"
@.str4053 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str4069 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str4081 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4098 = constant [11 x i8] c"assignable\00"
@.str4112 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str4127 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str4134 = constant [6 x i8] c"block\00"
@.str4142 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4149 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str4156 = constant [11 x i8] c"elif_block\00"
@.str4167 = constant [11 x i8] c"else_block\00"
@.str4177 = constant [6 x i8] c"block\00"
@.str4187 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4194 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str4214 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str4222 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str4270 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str4291 = constant [7 x i8] c"module\00"
@.str4320 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str4362 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str4370 = constant [9 x i8] c"function\00"
@.str4377 = constant [7 x i8] c"extern\00"
@.str4389 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str4410 = constant [9 x i8] c"variable\00"
@.str4430 = constant [4 x i8] c"ptr\00"
@.str4448 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str4472 = constant [10 x i8] c"typealias\00"
@.str4483 = constant [7 x i8] c"struct\00"
@.str4489 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str4540 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str4560 = constant [9 x i8] c"variable\00"
@.str4570 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4591 = constant [9 x i8] c"variable\00"
@.str4599 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str4611 = constant [12 x i8] c"destination\00"
@.str4616 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str4642 = constant [25 x i8] c"name '%s' is not defined\00"
@.str4660 = constant [7 x i8] c"module\00"
@.str4682 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str4746 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str4766 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str4789 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str4812 = constant [16 x i8] c"mono_assignable\00"
@.str4833 = constant [5 x i8] c"cast\00"
@.str4842 = constant [5 x i8] c"type\00"
@.str4857 = constant [26 x i8] c"%s = bitcast %s %s to %s\0A\00"
@.str4882 = constant [16 x i8] c"mono_assignable\00"
@.str4940 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str4963 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str4970 = constant [2 x i8] c"+\00"
@.str4975 = constant [4 x i8] c"add\00"
@.str4980 = constant [2 x i8] c"-\00"
@.str4985 = constant [4 x i8] c"sub\00"
@.str4990 = constant [2 x i8] c"*\00"
@.str4995 = constant [4 x i8] c"mul\00"
@.str5000 = constant [2 x i8] c"/\00"
@.str5005 = constant [5 x i8] c"sdiv\00"
@.str5010 = constant [3 x i8] c"==\00"
@.str5015 = constant [8 x i8] c"icmp eq\00"
@.str5020 = constant [3 x i8] c"!=\00"
@.str5025 = constant [8 x i8] c"icmp ne\00"
@.str5030 = constant [2 x i8] c">\00"
@.str5035 = constant [9 x i8] c"icmp sgt\00"
@.str5040 = constant [2 x i8] c"<\00"
@.str5045 = constant [9 x i8] c"icmp slt\00"
@.str5050 = constant [2 x i8] c"&\00"
@.str5055 = constant [4 x i8] c"and\00"
@.str5060 = constant [2 x i8] c"|\00"
@.str5065 = constant [3 x i8] c"or\00"
@.str5070 = constant [3 x i8] c">=\00"
@.str5075 = constant [9 x i8] c"icmp sge\00"
@.str5080 = constant [3 x i8] c"<=\00"
@.str5085 = constant [9 x i8] c"icmp sle\00"
@.str5089 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str5096 = constant [4 x i8] c"add\00"
@.str5102 = constant [3 x i8] c"==\00"
@.str5109 = constant [3 x i8] c"!=\00"
@.str5117 = constant [2 x i8] c"|\00"
@.str5125 = constant [2 x i8] c"&\00"
@.str5133 = constant [2 x i8] c">\00"
@.str5141 = constant [2 x i8] c"<\00"
@.str5149 = constant [3 x i8] c">=\00"
@.str5157 = constant [3 x i8] c"<=\00"
@.str5165 = constant [5 x i8] c"bool\00"
@.str5169 = constant [4 x i8] c"int\00"
@.str5179 = constant [7 x i8] c"NUMBER\00"
@.str5193 = constant [4 x i8] c"int\00"
@.str5207 = constant [5 x i8] c"WORD\00"
@.str5217 = constant [5 x i8] c"null\00"
@.str5224 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str5238 = constant [5 x i8] c"null\00"
@.str5247 = constant [8 x i8] c"nullptr\00"
@.str5254 = constant [17 x i8] c"addr_destination\00"
@.str5266 = constant [12 x i8] c"destination\00"
@.str5305 = constant [4 x i8] c"ptr\00"
@.str5324 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str5336 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str5350 = constant [8 x i8] c"boolean\00"
@.str5364 = constant [5 x i8] c"bool\00"
@.str5373 = constant [6 x i8] c"false\00"
@.str5380 = constant [2 x i8] c"0\00"
@.str5384 = constant [2 x i8] c"1\00"
@.str5391 = constant [8 x i8] c"fn_call\00"
@.str5408 = constant [7 x i8] c"STRING\00"
@.str5432 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str5448 = constant [4 x i8] c"ptr\00"
@.str5461 = constant [4 x i8] c"chr\00"
@.str5468 = constant [4 x i8] c"CHR\00"
@.str5483 = constant [2 x i8] c"0\00"
@.str5493 = constant [6 x i8] c"'\5C%x'\00"
@.str5500 = constant [3 x i8] c"%d\00"
@.str5512 = constant [5 x i8] c"'%c'\00"
@.str5519 = constant [3 x i8] c"%d\00"
@.str5524 = constant [18 x i8] c"Invalid character\00"
@.str5537 = constant [4 x i8] c"chr\00"
@.str5541 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str5569 = constant [22 x i8] c"called 'abbr' on null\00"
@.str5575 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str5580 = constant [4 x i8] c"int\00"
@.str5585 = constant [2 x i8] c"i\00"
@.str5590 = constant [5 x i8] c"bool\00"
@.str5595 = constant [2 x i8] c"b\00"
@.str5600 = constant [5 x i8] c"void\00"
@.str5605 = constant [2 x i8] c"v\00"
@.str5610 = constant [4 x i8] c"chr\00"
@.str5615 = constant [2 x i8] c"c\00"
@.str5620 = constant [4 x i8] c"str\00"
@.str5625 = constant [3 x i8] c"cp\00"
@.str5630 = constant [4 x i8] c"ptr\00"
@.str5636 = constant [4 x i8] c"%sp\00"
@.str5647 = constant [10 x i8] c"typealias\00"
@.str5658 = constant [6 x i8] c"error\00"
@.str5663 = constant [2 x i8] c"?\00"
@.str5665 = constant [44 x i8] c":coffee-error: unable to abbreviate type %s\00"
@.str5701 = constant [7 x i8] c".str%d\00"
@.str5716 = constant [6 x i8] c"array\00"
@.str5729 = constant [4 x i8] c"chr\00"
@.str5747 = constant [3 x i8] c"%d\00"
@.str5760 = constant [7 x i8] c"string\00"
@.str5779 = constant [7 x i8] c"module\00"
@.str5811 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str5817 = constant [2 x i8] c"?\00"
@.str5823 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str5828 = constant [4 x i8] c"int\00"
@.str5833 = constant [4 x i8] c"i32\00"
@.str5838 = constant [5 x i8] c"void\00"
@.str5843 = constant [5 x i8] c"void\00"
@.str5848 = constant [5 x i8] c"bool\00"
@.str5853 = constant [3 x i8] c"i1\00"
@.str5858 = constant [8 x i8] c"nullptr\00"
@.str5863 = constant [4 x i8] c"ptr\00"
@.str5868 = constant [4 x i8] c"chr\00"
@.str5873 = constant [3 x i8] c"i8\00"
@.str5878 = constant [9 x i8] c"function\00"
@.str5884 = constant [4 x i8] c"%s(\00"
@.str5909 = constant [4 x i8] c"%s,\00"
@.str5914 = constant [5 x i8] c"%s%s\00"
@.str5925 = constant [4 x i8] c"%s)\00"
@.str5933 = constant [4 x i8] c"ptr\00"
@.str5939 = constant [4 x i8] c"%s*\00"
@.str5951 = constant [7 x i8] c"struct\00"
@.str5957 = constant [2 x i8] c"{\00"
@.str5973 = constant [4 x i8] c"%s,\00"
@.str5978 = constant [5 x i8] c"%s%s\00"
@.str5989 = constant [4 x i8] c"%s}\00"
@.str5997 = constant [6 x i8] c"array\00"
@.str6003 = constant [10 x i8] c"[%s x %s]\00"
@.str6022 = constant [10 x i8] c"typealias\00"
@.str6028 = constant [5 x i8] c"%%%s\00"
@.str6038 = constant [4 x i8] c"str\00"
@.str6043 = constant [4 x i8] c"i8*\00"
@.str6048 = constant [7 x i8] c"vararg\00"
@.str6053 = constant [4 x i8] c"...\00"
@.str6058 = constant [6 x i8] c"error\00"
@.str6063 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str6131 = constant [9 x i8] c"function\00"
@.str6146 = constant [5 x i8] c"WORD\00"
@.str6202 = constant [10 x i8] c"fn_params\00"
@.str6216 = constant [10 x i8] c"structdef\00"
@.str6223 = constant [7 x i8] c"struct\00"
@.str6230 = constant [5 x i8] c"type\00"
@.str6259 = constant [5 x i8] c"type\00"
@.str6286 = constant [5 x i8] c"type\00"
@.str6292 = constant [5 x i8] c"WORD\00"
@.str6305 = constant [12 x i8] c"dotted_name\00"
@.str6317 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str6330 = constant [6 x i8] c"error\00"
@.str6335 = constant [10 x i8] c"typealias\00"
@.str6359 = constant [4 x i8] c"...\00"
@.str6366 = constant [7 x i8] c"vararg\00"
@.str6370 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str6389 = constant [4 x i8] c"ptr\00"
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp6399 = load i32, i32* %argc
%.tmp6400 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp6399, i8** %.tmp6400)
%.tmp6402 = getelementptr [13 x i8], [13 x i8]*@.str6401, i32 0, i32 0
%.tmp6404 = getelementptr [2 x i8], [2 x i8]*@.str6403, i32 0, i32 0
%.tmp6405 = call %m0$.File.type*(i8*,i8*) @fopen(i8* %.tmp6402, i8* %.tmp6404)
%grammar_file = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6405, %m0$.File.type** %grammar_file
%.tmp6406 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp6407 = icmp eq %m0$.File.type* %.tmp6406, null
br i1 %.tmp6407, label %.if.true.6408, label %.if.false.6408
.if.true.6408:
%.tmp6410 = getelementptr [34 x i8], [34 x i8]*@.str6409, i32 0, i32 0
%.tmp6411 = call i32(i8*,...) @printf(i8* %.tmp6410)
ret i32 1
br label %.if.end.6408
.if.false.6408:
br label %.if.end.6408
.if.end.6408:
%.tmp6412 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp6413 = call %m261$.ParsingContext.type*(%m0$.File.type*) @m261$new_context.m261$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp6412)
%ctx = alloca %m261$.ParsingContext.type*
store %m261$.ParsingContext.type* %.tmp6413, %m261$.ParsingContext.type** %ctx
%.tmp6414 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp6415 = call %m261$.Rule.type**(%m261$.ParsingContext.type*) @m261$parse_grammar.m261$.Rule.typepp.m261$.ParsingContext.typep(%m261$.ParsingContext.type* %.tmp6414)
%grammar = alloca %m261$.Rule.type**
store %m261$.Rule.type** %.tmp6415, %m261$.Rule.type*** %grammar
%.tmp6416 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %ctx
%.tmp6417 = bitcast %m261$.ParsingContext.type* %.tmp6416 to i8*
call void(i8*) @free(i8* %.tmp6417)
%.tmp6418 = load i8**, i8*** %argv
%.tmp6419 = getelementptr i8*, i8** %.tmp6418, i32 1
%.tmp6420 = load i8*, i8** %.tmp6419
%.tmp6421 = load i32, i32* @O_RDONLY
%.tmp6422 = call i32(i8*,i32) @open(i8* %.tmp6420, i32 %.tmp6421)
%fd = alloca i32
store i32 %.tmp6422, i32* %fd
%.tmp6423 = load i32, i32* %fd
%.tmp6424 = icmp sgt i32 %.tmp6423, 0
%.tmp6426 = getelementptr [27 x i8], [27 x i8]*@.str6425, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp6424, i8* %.tmp6426)
%.tmp6427 = load i32, i32* %fd
%.tmp6428 = call %m185$.PeekerInfo.type*(i32) @m185$new.m185$.PeekerInfo.typep.i(i32 %.tmp6427)
%p = alloca %m185$.PeekerInfo.type*
store %m185$.PeekerInfo.type* %.tmp6428, %m185$.PeekerInfo.type** %p
%.tmp6429 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp6430 = call %m262$.Token.type*(%m185$.PeekerInfo.type*,i1) @m262$tokenize.m262$.Token.typep.m185$.PeekerInfo.typep.b(%m185$.PeekerInfo.type* %.tmp6429, i1 0)
%tokens = alloca %m262$.Token.type*
store %m262$.Token.type* %.tmp6430, %m262$.Token.type** %tokens
%.tmp6431 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp6432 = bitcast %m185$.PeekerInfo.type* %.tmp6431 to i8*
call void(i8*) @free(i8* %.tmp6432)
%.tmp6433 = load %m261$.Rule.type**, %m261$.Rule.type*** %grammar
%.tmp6435 = getelementptr [6 x i8], [6 x i8]*@.str6434, i32 0, i32 0
%.tmp6436 = load %m262$.Token.type*, %m262$.Token.type** %tokens
%.tmp6437 = call %m261$.ParseResult.type*(%m261$.Rule.type**,i8*,%m262$.Token.type*) @m261$ast.m261$.ParseResult.typep.m261$.Rule.typepp.cp.m262$.Token.typep(%m261$.Rule.type** %.tmp6433, i8* %.tmp6435, %m262$.Token.type* %.tmp6436)
%res = alloca %m261$.ParseResult.type*
store %m261$.ParseResult.type* %.tmp6437, %m261$.ParseResult.type** %res
%.tmp6438 = load %m262$.Token.type*, %m262$.Token.type** %tokens
%.tmp6439 = bitcast %m262$.Token.type* %.tmp6438 to i8*
call void(i8*) @free(i8* %.tmp6439)
%.tmp6440 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %res
%.tmp6441 = getelementptr %m261$.ParseResult.type, %m261$.ParseResult.type* %.tmp6440, i32 0, i32 0
%.tmp6442 = load %m678$.Error.type*, %m678$.Error.type** %.tmp6441
%.tmp6443 = icmp ne %m678$.Error.type* %.tmp6442, null
br i1 %.tmp6443, label %.if.true.6444, label %.if.false.6444
.if.true.6444:
%.tmp6445 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %res
%.tmp6446 = getelementptr %m261$.ParseResult.type, %m261$.ParseResult.type* %.tmp6445, i32 0, i32 0
%.tmp6447 = load %m678$.Error.type*, %m678$.Error.type** %.tmp6446
call void(%m678$.Error.type*) @m678$report.v.m678$.Error.typep(%m678$.Error.type* %.tmp6447)
%.tmp6448 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %res
%.tmp6449 = getelementptr %m261$.ParseResult.type, %m261$.ParseResult.type* %.tmp6448, i32 0, i32 0
%.tmp6450 = load %m678$.Error.type*, %m678$.Error.type** %.tmp6449
%.tmp6451 = bitcast %m678$.Error.type* %.tmp6450 to i8*
call void(i8*) @free(i8* %.tmp6451)
%.tmp6452 = load i32, i32* %fd
%.tmp6453 = call i32(i32) @close(i32 %.tmp6452)
ret i32 0
br label %.if.end.6444
.if.false.6444:
br label %.if.end.6444
.if.end.6444:
%.tmp6454 = load i32, i32* @STDERR
%.tmp6456 = getelementptr [2 x i8], [2 x i8]*@.str6455, i32 0, i32 0
%.tmp6457 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp6454, i8* %.tmp6456)
%stderr = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6457, %m0$.File.type** %stderr
%.tmp6458 = call %m0$.File.type*() @tmpfile()
%llvm_code = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6458, %m0$.File.type** %llvm_code
%.tmp6459 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6460 = load i8**, i8*** %argv
%.tmp6461 = getelementptr i8*, i8** %.tmp6460, i32 1
%.tmp6462 = load i8*, i8** %.tmp6461
%.tmp6463 = call %m1791$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1791$new_context.m1791$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp6459, i8* %.tmp6462)
%compiler_ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.tmp6463, %m1791$.CompilerCtx.type** %compiler_ctx
%.tmp6464 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %compiler_ctx
%.tmp6465 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %res
%.tmp6466 = getelementptr %m261$.ParseResult.type, %m261$.ParseResult.type* %.tmp6465, i32 0, i32 1
%.tmp6467 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6466
%.tmp6468 = call i1(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile.b.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp6464, %m261$.Node.type* %.tmp6467)
br i1 %.tmp6468, label %.if.true.6469, label %.if.false.6469
.if.true.6469:
%.tmp6470 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6472 = getelementptr [34 x i8], [34 x i8]*@.str6471, i32 0, i32 0
%.tmp6473 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6470, i8* %.tmp6472)
ret i32 1
br label %.if.end.6469
.if.false.6469:
br label %.if.end.6469
.if.end.6469:
%.tmp6474 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6475 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp6474)
%.tmp6476 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6477 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp6476)
%llvm_code_size = alloca i32
store i32 %.tmp6477, i32* %llvm_code_size
%.tmp6478 = load %m0$.File.type*, %m0$.File.type** %llvm_code
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp6478)
%.tmp6480 = getelementptr [29 x i8], [29 x i8]*@.str6479, i32 0, i32 0
%.tmp6482 = getelementptr [2 x i8], [2 x i8]*@.str6481, i32 0, i32 0
%.tmp6483 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp6480, i8* %.tmp6482)
%proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6483, %m0$.File.type** %proc
%.tmp6484 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6485 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6484)
%.tmp6486 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6487 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6486)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp6485, i32 %.tmp6487)
%.tmp6488 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6489 = icmp eq %m0$.File.type* %.tmp6488, null
br i1 %.tmp6489, label %.if.true.6490, label %.if.false.6490
.if.true.6490:
%.tmp6491 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6493 = getelementptr [28 x i8], [28 x i8]*@.str6492, i32 0, i32 0
%.tmp6494 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6491, i8* %.tmp6493)
ret i32 0
br label %.if.end.6490
.if.false.6490:
br label %.if.end.6490
.if.end.6490:
%.tmp6495 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6496 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp6495)
%.tmp6497 = icmp ne i32 %.tmp6496, 0
br i1 %.tmp6497, label %.if.true.6498, label %.if.false.6498
.if.true.6498:
%.tmp6499 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6501 = getelementptr [24 x i8], [24 x i8]*@.str6500, i32 0, i32 0
%.tmp6502 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6499, i8* %.tmp6501)
ret i32 0
br label %.if.end.6498
.if.false.6498:
br label %.if.end.6498
.if.end.6498:
%.tmp6504 = getelementptr [17 x i8], [17 x i8]*@.str6503, i32 0, i32 0
%.tmp6506 = getelementptr [2 x i8], [2 x i8]*@.str6505, i32 0, i32 0
%.tmp6507 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp6504, i8* %.tmp6506)
%gcc_proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6507, %m0$.File.type** %gcc_proc
%.tmp6508 = load %m0$.File.type*, %m0$.File.type** %gcc_proc
%.tmp6509 = icmp eq %m0$.File.type* %.tmp6508, null
br i1 %.tmp6509, label %.if.true.6510, label %.if.false.6510
.if.true.6510:
%.tmp6511 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6513 = getelementptr [28 x i8], [28 x i8]*@.str6512, i32 0, i32 0
%.tmp6514 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6511, i8* %.tmp6513)
ret i32 0
br label %.if.end.6510
.if.false.6510:
br label %.if.end.6510
.if.end.6510:
%.tmp6515 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6516 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp6515)
%.tmp6517 = icmp ne i32 %.tmp6516, 0
br i1 %.tmp6517, label %.if.true.6518, label %.if.false.6518
.if.true.6518:
%.tmp6519 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6521 = getelementptr [23 x i8], [23 x i8]*@.str6520, i32 0, i32 0
%.tmp6522 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6519, i8* %.tmp6521)
br label %.if.end.6518
.if.false.6518:
%.tmp6524 = getelementptr [32 x i8], [32 x i8]*@.str6523, i32 0, i32 0
%.tmp6525 = load i8**, i8*** %argv
%.tmp6526 = getelementptr i8*, i8** %.tmp6525, i32 1
%.tmp6527 = load i8*, i8** %.tmp6526
%.tmp6528 = call i32(i8*,...) @printf(i8* %.tmp6524, i8* %.tmp6527)
br label %.if.end.6518
.if.end.6518:
%.tmp6529 = load i32, i32* %fd
%.tmp6530 = call i32(i32) @close(i32 %.tmp6529)
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp6531 = load i32, i32* %argc
%.tmp6532 = icmp eq i32 %.tmp6531, 2
br i1 %.tmp6532, label %.if.true.6533, label %.if.false.6533
.if.true.6533:
ret void
br label %.if.end.6533
.if.false.6533:
br label %.if.end.6533
.if.end.6533:
%.tmp6535 = getelementptr [21 x i8], [21 x i8]*@.str6534, i32 0, i32 0
%tmpl = alloca i8*
store i8* %.tmp6535, i8** %tmpl
%.tmp6536 = load i8**, i8*** %argv
%.tmp6537 = getelementptr i8*, i8** %.tmp6536, i32 0
%.tmp6538 = load i8*, i8** %.tmp6537
%.tmp6539 = call i32(i8*) @strlen(i8* %.tmp6538)
%.tmp6540 = load i8*, i8** %tmpl
%.tmp6541 = call i32(i8*) @strlen(i8* %.tmp6540)
%.tmp6542 = add i32 %.tmp6539, %.tmp6541
%len_filename = alloca i32
store i32 %.tmp6542, i32* %len_filename
%.tmp6543 = load i32, i32* %len_filename
%.tmp6544 = call i8*(i32) @malloc(i32 %.tmp6543)
%buf = alloca i8*
store i8* %.tmp6544, i8** %buf
%.tmp6545 = load i8*, i8** %buf
%.tmp6546 = load i8*, i8** %tmpl
%.tmp6547 = load i8**, i8*** %argv
%.tmp6548 = getelementptr i8*, i8** %.tmp6547, i32 0
%.tmp6549 = load i8*, i8** %.tmp6548
%.tmp6550 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp6545, i8* %.tmp6546, i8* %.tmp6549)
%.tmp6551 = load i8*, i8** %buf
%.tmp6552 = call i32(i8*) @puts(i8* %.tmp6551)
%.tmp6553 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp6553)
call void(i32) @exit(i32 1)
ret void
}
@.str6401 = constant [13 x i8] c"./syntax.txt\00"
@.str6403 = constant [2 x i8] c"r\00"
@.str6409 = constant [34 x i8] c"Unable to find ./syntax.txt file\0A\00"
@.str6425 = constant [27 x i8] c"Unable to open input file\0A\00"
@.str6434 = constant [6 x i8] c"start\00"
@.str6455 = constant [2 x i8] c"w\00"
@.str6471 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str6479 = constant [29 x i8] c"tee debug.ll | llc - > out.s\00"
@.str6481 = constant [2 x i8] c"w\00"
@.str6492 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str6500 = constant [24 x i8] c"error on llc execution\0A\00"
@.str6503 = constant [17 x i8] c"gcc out.s -o out\00"
@.str6505 = constant [2 x i8] c"w\00"
@.str6512 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str6520 = constant [23 x i8] c"error on gcc execution\00"
@.str6523 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str6534 = constant [21 x i8] c"Usage: %s <filename>\00"
