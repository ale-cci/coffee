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
declare i8* @getenv(i8*)
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
@DEBUG_INTERNALS = constant i1 0
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
define %m0$.File.type* @m1791$get_grammar_file.m0$.File.typep.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.ctx.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%.tmp2496 = getelementptr [12 x i8], [12 x i8]*@.str2495, i32 0, i32 0
%.tmp2497 = call i8*(i8*) @getenv(i8* %.tmp2496)
%coffee_root = alloca i8*
store i8* %.tmp2497, i8** %coffee_root
%.tmp2498 = load i8*, i8** %coffee_root
%.tmp2499 = icmp eq i8* %.tmp2498, null
br i1 %.tmp2499, label %.if.true.2500, label %.if.false.2500
.if.true.2500:
%.tmp2501 = getelementptr i8*, i8** %coffee_root, i32 0
%.tmp2503 = getelementptr [11 x i8], [11 x i8]*@.str2502, i32 0, i32 0
%.tmp2505 = getelementptr [5 x i8], [5 x i8]*@.str2504, i32 0, i32 0
%.tmp2506 = call i8*(i8*) @getenv(i8* %.tmp2505)
%.tmp2507 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2501, i8* %.tmp2503, i8* %.tmp2506)
br label %.if.end.2500
.if.false.2500:
br label %.if.end.2500
.if.end.2500:
%syntax_file_path = alloca i8*
%.tmp2508 = getelementptr i8*, i8** %syntax_file_path, i32 0
%.tmp2510 = getelementptr [18 x i8], [18 x i8]*@.str2509, i32 0, i32 0
%.tmp2511 = load i8*, i8** %coffee_root
%.tmp2512 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2508, i8* %.tmp2510, i8* %.tmp2511)
%.tmp2513 = load i8*, i8** %syntax_file_path
%.tmp2515 = getelementptr [2 x i8], [2 x i8]*@.str2514, i32 0, i32 0
%.tmp2516 = call %m0$.File.type*(i8*,i8*) @fopen(i8* %.tmp2513, i8* %.tmp2515)
%grammar_file = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2516, %m0$.File.type** %grammar_file
%.tmp2517 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2518 = icmp eq %m0$.File.type* %.tmp2517, null
br i1 %.tmp2518, label %.if.true.2519, label %.if.false.2519
.if.true.2519:
%.tmp2521 = getelementptr [42 x i8], [42 x i8]*@.str2520, i32 0, i32 0
%.tmp2522 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2523 = call i32(i8*,...) @printf(i8* %.tmp2521, %m0$.File.type* %.tmp2522)
%.tmp2524 = bitcast ptr null to %m0$.File.type*
ret %m0$.File.type* %.tmp2524
br label %.if.end.2519
.if.false.2519:
br label %.if.end.2519
.if.end.2519:
%.tmp2525 = load %m0$.File.type*, %m0$.File.type** %grammar_file
ret %m0$.File.type* %.tmp2525
}
define i1 @m1791$compile_file.b.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.ctx.arg, i8* %.filepath.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%filepath = alloca i8*
store i8* %.filepath.arg, i8** %filepath
%.tmp2526 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2527 = call %m0$.File.type*(%m1791$.CompilerCtx.type*) @m1791$get_grammar_file.m0$.File.typep.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp2526)
%grammar_file = alloca %m0$.File.type*
store %m0$.File.type* %.tmp2527, %m0$.File.type** %grammar_file
%.tmp2528 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2529 = icmp eq %m0$.File.type* %.tmp2528, null
br i1 %.tmp2529, label %.if.true.2530, label %.if.false.2530
.if.true.2530:
ret i1 0
br label %.if.end.2530
.if.false.2530:
br label %.if.end.2530
.if.end.2530:
%.tmp2531 = load %m0$.File.type*, %m0$.File.type** %grammar_file
%.tmp2532 = call %m261$.ParsingContext.type*(%m0$.File.type*) @m261$new_context.m261$.ParsingContext.typep.m0$.File.typep(%m0$.File.type* %.tmp2531)
%grammar_ctx = alloca %m261$.ParsingContext.type*
store %m261$.ParsingContext.type* %.tmp2532, %m261$.ParsingContext.type** %grammar_ctx
%.tmp2533 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %grammar_ctx
%.tmp2534 = call %m261$.Rule.type**(%m261$.ParsingContext.type*) @m261$parse_grammar.m261$.Rule.typepp.m261$.ParsingContext.typep(%m261$.ParsingContext.type* %.tmp2533)
%grammar = alloca %m261$.Rule.type**
store %m261$.Rule.type** %.tmp2534, %m261$.Rule.type*** %grammar
%.tmp2535 = load %m261$.ParsingContext.type*, %m261$.ParsingContext.type** %grammar_ctx
%.tmp2536 = bitcast %m261$.ParsingContext.type* %.tmp2535 to i8*
call void(i8*) @free(i8* %.tmp2536)
%.tmp2537 = load i8*, i8** %filepath
%.tmp2538 = load i32, i32* @O_RDONLY
%.tmp2539 = call i32(i8*,i32) @open(i8* %.tmp2537, i32 %.tmp2538)
%input_fd = alloca i32
store i32 %.tmp2539, i32* %input_fd
%.tmp2540 = load i32, i32* %input_fd
%.tmp2541 = call %m185$.PeekerInfo.type*(i32) @m185$new.m185$.PeekerInfo.typep.i(i32 %.tmp2540)
%p = alloca %m185$.PeekerInfo.type*
store %m185$.PeekerInfo.type* %.tmp2541, %m185$.PeekerInfo.type** %p
%.tmp2542 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp2543 = getelementptr %m185$.PeekerInfo.type, %m185$.PeekerInfo.type* %.tmp2542, i32 0, i32 6
%.tmp2544 = load i8*, i8** %filepath
store i8* %.tmp2544, i8** %.tmp2543
%.tmp2545 = load %m185$.PeekerInfo.type*, %m185$.PeekerInfo.type** %p
%.tmp2546 = call %m262$.Token.type*(%m185$.PeekerInfo.type*,i1) @m262$tokenize.m262$.Token.typep.m185$.PeekerInfo.typep.b(%m185$.PeekerInfo.type* %.tmp2545, i1 0)
%tokens = alloca %m262$.Token.type*
store %m262$.Token.type* %.tmp2546, %m262$.Token.type** %tokens
%.tmp2547 = load %m261$.Rule.type**, %m261$.Rule.type*** %grammar
%.tmp2549 = getelementptr [6 x i8], [6 x i8]*@.str2548, i32 0, i32 0
%.tmp2550 = load %m262$.Token.type*, %m262$.Token.type** %tokens
%.tmp2551 = call %m261$.ParseResult.type*(%m261$.Rule.type**,i8*,%m262$.Token.type*) @m261$ast.m261$.ParseResult.typep.m261$.Rule.typepp.cp.m262$.Token.typep(%m261$.Rule.type** %.tmp2547, i8* %.tmp2549, %m262$.Token.type* %.tmp2550)
%ast = alloca %m261$.ParseResult.type*
store %m261$.ParseResult.type* %.tmp2551, %m261$.ParseResult.type** %ast
%.tmp2552 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2553 = load %m261$.ParseResult.type*, %m261$.ParseResult.type** %ast
%.tmp2554 = getelementptr %m261$.ParseResult.type, %m261$.ParseResult.type* %.tmp2553, i32 0, i32 1
%.tmp2555 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2554
%.tmp2556 = call i1(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile.b.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp2552, %m261$.Node.type* %.tmp2555)
ret i1 %.tmp2556
}
define i1 @m1791$compile.b.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.ast.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%ast = alloca %m261$.Node.type*
store %m261$.Node.type* %.ast.arg, %m261$.Node.type** %ast
%.tmp2557 = load %m261$.Node.type*, %m261$.Node.type** %ast
%.tmp2558 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2557, i32 0, i32 0
%.tmp2559 = load i8*, i8** %.tmp2558
%.tmp2561 = getelementptr [6 x i8], [6 x i8]*@.str2560, i32 0, i32 0
%.tmp2562 = call i32(i8*,i8*) @strcmp(i8* %.tmp2559, i8* %.tmp2561)
%.tmp2563 = icmp ne i32 %.tmp2562, 0
br i1 %.tmp2563, label %.if.true.2564, label %.if.false.2564
.if.true.2564:
ret i1 0
br label %.if.end.2564
.if.false.2564:
br label %.if.end.2564
.if.end.2564:
%.tmp2565 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
call void(%m1791$.CompilerCtx.type*) @m1791$push_scope.v.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp2565)
%.tmp2566 = load %m261$.Node.type*, %m261$.Node.type** %ast
%.tmp2567 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2566, i32 0, i32 6
%.tmp2568 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2567
%start = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp2568, %m261$.Node.type** %start
%.tmp2569 = load %m261$.Node.type*, %m261$.Node.type** %start
%.tmp2570 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2569, i32 0, i32 0
%.tmp2571 = load i8*, i8** %.tmp2570
%.tmp2573 = getelementptr [13 x i8], [13 x i8]*@.str2572, i32 0, i32 0
%.tmp2574 = call i32(i8*,i8*) @strcmp(i8* %.tmp2571, i8* %.tmp2573)
%.tmp2575 = icmp eq i32 %.tmp2574, 0
br i1 %.tmp2575, label %.if.true.2576, label %.if.false.2576
.if.true.2576:
%.tmp2577 = load %m261$.Node.type*, %m261$.Node.type** %start
%.tmp2578 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2577, i32 0, i32 7
%.tmp2579 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2578
store %m261$.Node.type* %.tmp2579, %m261$.Node.type** %start
br label %.if.end.2576
.if.false.2576:
br label %.if.end.2576
.if.end.2576:
%.tmp2581 = load %m261$.Node.type*, %m261$.Node.type** %start
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp2581, %m261$.Node.type** %stmt
br label %.for.start.2580
.for.start.2580:
%.tmp2582 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2583 = icmp ne %m261$.Node.type* %.tmp2582, null
br i1 %.tmp2583, label %.for.continue.2580, label %.for.end.2580
.for.continue.2580:
%.tmp2584 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2585 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2586 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2585, i32 0, i32 6
%.tmp2587 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2586
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i1) @m1791$compile_statement.v.m1791$.CompilerCtx.typep.m261$.Node.typep.b(%m1791$.CompilerCtx.type* %.tmp2584, %m261$.Node.type* %.tmp2587, i1 1)
%.tmp2588 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2589 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2588, i32 0, i32 7
%.tmp2590 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2589
store %m261$.Node.type* %.tmp2590, %m261$.Node.type** %stmt
br label %.for.start.2580
.for.end.2580:
%.tmp2592 = load %m261$.Node.type*, %m261$.Node.type** %start
%s = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp2592, %m261$.Node.type** %s
br label %.for.start.2591
.for.start.2591:
%.tmp2593 = load %m261$.Node.type*, %m261$.Node.type** %s
%.tmp2594 = icmp ne %m261$.Node.type* %.tmp2593, null
br i1 %.tmp2594, label %.for.continue.2591, label %.for.end.2591
.for.continue.2591:
%.tmp2595 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2596 = load %m261$.Node.type*, %m261$.Node.type** %s
%.tmp2597 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2596, i32 0, i32 6
%.tmp2598 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2597
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i1) @m1791$compile_statement.v.m1791$.CompilerCtx.typep.m261$.Node.typep.b(%m1791$.CompilerCtx.type* %.tmp2595, %m261$.Node.type* %.tmp2598, i1 0)
%.tmp2599 = load %m261$.Node.type*, %m261$.Node.type** %s
%.tmp2600 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2599, i32 0, i32 7
%.tmp2601 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2600
store %m261$.Node.type* %.tmp2601, %m261$.Node.type** %s
br label %.for.start.2591
.for.end.2591:
%.tmp2602 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2603 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2602, i32 0, i32 2
%.tmp2604 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %.tmp2603
%.tmp2605 = icmp ne %m1791$.ErrorList.type* %.tmp2604, null
%has_errors = alloca i1
store i1 %.tmp2605, i1* %has_errors
%.tmp2607 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2608 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2607, i32 0, i32 2
%.tmp2609 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %.tmp2608
%err = alloca %m1791$.ErrorList.type*
store %m1791$.ErrorList.type* %.tmp2609, %m1791$.ErrorList.type** %err
br label %.for.start.2606
.for.start.2606:
%.tmp2610 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %err
%.tmp2611 = icmp ne %m1791$.ErrorList.type* %.tmp2610, null
br i1 %.tmp2611, label %.for.continue.2606, label %.for.end.2606
.for.continue.2606:
%.tmp2612 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %err
%.tmp2613 = getelementptr %m1791$.ErrorList.type, %m1791$.ErrorList.type* %.tmp2612, i32 0, i32 0
%.tmp2614 = load %m678$.Error.type*, %m678$.Error.type** %.tmp2613
call void(%m678$.Error.type*) @m678$report.v.m678$.Error.typep(%m678$.Error.type* %.tmp2614)
%.tmp2615 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %err
%.tmp2616 = getelementptr %m1791$.ErrorList.type, %m1791$.ErrorList.type* %.tmp2615, i32 0, i32 1
%.tmp2617 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %.tmp2616
store %m1791$.ErrorList.type* %.tmp2617, %m1791$.ErrorList.type** %err
br label %.for.start.2606
.for.end.2606:
%.tmp2619 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2620 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2619, i32 0, i32 3
%.tmp2621 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %.tmp2620
%g = alloca %m1791$.GlobalName.type*
store %m1791$.GlobalName.type* %.tmp2621, %m1791$.GlobalName.type** %g
br label %.for.start.2618
.for.start.2618:
%.tmp2622 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
%.tmp2623 = icmp ne %m1791$.GlobalName.type* %.tmp2622, null
br i1 %.tmp2623, label %.for.continue.2618, label %.for.end.2618
.for.continue.2618:
%.tmp2624 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2625 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
call void(%m1791$.CompilerCtx.type*,%m1791$.GlobalName.type*) @m1791$compile_global.v.m1791$.CompilerCtx.typep.m1791$.GlobalName.typep(%m1791$.CompilerCtx.type* %.tmp2624, %m1791$.GlobalName.type* %.tmp2625)
%.tmp2626 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
%.tmp2627 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp2626, i32 0, i32 4
%.tmp2628 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %.tmp2627
store %m1791$.GlobalName.type* %.tmp2628, %m1791$.GlobalName.type** %g
br label %.for.start.2618
.for.end.2618:
%.tmp2629 = load i1, i1* %has_errors
ret i1 %.tmp2629
}
define i8* @m1791$string_to_llvm.cp.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%buf = alloca i8*
%.tmp2630 = load i8*, i8** %text
%.tmp2631 = call i32(i8*) @strlen(i8* %.tmp2630)
%str_len = alloca i32
store i32 %.tmp2631, i32* %str_len
%.tmp2632 = load i32, i32* %str_len
%.tmp2633 = call i8*(i32) @malloc(i32 %.tmp2632)
%substr = alloca i8*
store i8* %.tmp2633, i8** %substr
%i = alloca i32
store i32 0, i32* %i
br label %.for.start.2634
.for.start.2634:
%.tmp2635 = load i32, i32* %i
%.tmp2636 = load i32, i32* %str_len
%.tmp2637 = sub i32 %.tmp2636, 2
%.tmp2638 = icmp slt i32 %.tmp2635, %.tmp2637
br i1 %.tmp2638, label %.for.continue.2634, label %.for.end.2634
.for.continue.2634:
%.tmp2639 = load i32, i32* %i
%.tmp2640 = load i8*, i8** %substr
%.tmp2641 = getelementptr i8, i8* %.tmp2640, i32 %.tmp2639
%.tmp2642 = load i32, i32* %i
%.tmp2643 = add i32 %.tmp2642, 1
%.tmp2644 = load i8*, i8** %text
%.tmp2645 = getelementptr i8, i8* %.tmp2644, i32 %.tmp2643
%.tmp2646 = load i8, i8* %.tmp2645
store i8 %.tmp2646, i8* %.tmp2641
%.tmp2647 = load i32, i32* %i
%.tmp2648 = add i32 %.tmp2647, 1
store i32 %.tmp2648, i32* %i
br label %.for.start.2634
.for.end.2634:
%.tmp2649 = load i32, i32* %str_len
%.tmp2650 = sub i32 %.tmp2649, 2
%.tmp2651 = load i8*, i8** %substr
%.tmp2652 = getelementptr i8, i8* %.tmp2651, i32 %.tmp2650
store i8 0, i8* %.tmp2652
%.tmp2653 = getelementptr i8*, i8** %buf, i32 0
%.tmp2655 = getelementptr [9 x i8], [9 x i8]*@.str2654, i32 0, i32 0
%.tmp2656 = load i8*, i8** %substr
%.tmp2657 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2653, i8* %.tmp2655, i8* %.tmp2656)
%.tmp2658 = load i8*, i8** %substr
call void(i8*) @free(i8* %.tmp2658)
%.tmp2659 = load i8*, i8** %buf
ret i8* %.tmp2659
}
define void @m1791$compile_global.v.m1791$.CompilerCtx.typep.m1791$.GlobalName.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%g = alloca %m1791$.GlobalName.type*
store %m1791$.GlobalName.type* %.g.arg, %m1791$.GlobalName.type** %g
%.tmp2660 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
%.tmp2661 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp2660, i32 0, i32 2
%.tmp2662 = load i1, i1* %.tmp2661
%.tmp2663 = icmp eq i1 %.tmp2662, 0
%.tmp2664 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
%.tmp2665 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp2664, i32 0, i32 1
%.tmp2666 = load i8*, i8** %.tmp2665
%.tmp2668 = getelementptr [7 x i8], [7 x i8]*@.str2667, i32 0, i32 0
%.tmp2669 = call i32(i8*,i8*) @strcmp(i8* %.tmp2666, i8* %.tmp2668)
%.tmp2670 = icmp eq i32 %.tmp2669, 0
%.tmp2671 = and i1 %.tmp2663, %.tmp2670
br i1 %.tmp2671, label %.if.true.2672, label %.if.false.2672
.if.true.2672:
%.tmp2673 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
%.tmp2674 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp2673, i32 0, i32 0
%.tmp2675 = load i8*, i8** %.tmp2674
%.tmp2676 = call i8*(i8*) @m1791$string_to_llvm.cp.cp(i8* %.tmp2675)
%repr = alloca i8*
store i8* %.tmp2676, i8** %repr
%.tmp2677 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2678 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2677, i32 0, i32 1
%.tmp2679 = load %m0$.File.type*, %m0$.File.type** %.tmp2678
%.tmp2681 = getelementptr [21 x i8], [21 x i8]*@.str2680, i32 0, i32 0
%.tmp2682 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
%.tmp2683 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp2682, i32 0, i32 3
%.tmp2684 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp2683
%.tmp2685 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp2684)
%.tmp2686 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2687 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
%.tmp2688 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp2687, i32 0, i32 3
%.tmp2689 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp2688
%.tmp2690 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2689, i32 0, i32 3
%.tmp2691 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2690
%.tmp2692 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp2686, %m1791$.Type.type* %.tmp2691)
%.tmp2693 = load i8*, i8** %repr
%.tmp2694 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2679, i8* %.tmp2681, i8* %.tmp2685, i8* %.tmp2692, i8* %.tmp2693)
%.tmp2695 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
%.tmp2696 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp2695, i32 0, i32 2
store i1 1, i1* %.tmp2696
br label %.if.end.2672
.if.false.2672:
br label %.if.end.2672
.if.end.2672:
ret void
}
define i8* @m1791$get_mod_prefix.cp.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.ctx.arg, i8* %.module_abspath.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%module_abspath = alloca i8*
store i8* %.module_abspath.arg, i8** %module_abspath
%.tmp2697 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2698 = call %m1791$.ModuleLookup.type*(%m1791$.CompilerCtx.type*) @m1791$get_current_module.m1791$.ModuleLookup.typep.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp2697)
%m = alloca %m1791$.ModuleLookup.type*
store %m1791$.ModuleLookup.type* %.tmp2698, %m1791$.ModuleLookup.type** %m
%.tmp2699 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp2700 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp2699, i32 0, i32 1
%.tmp2701 = load i8*, i8** %.tmp2700
ret i8* %.tmp2701
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
%.tmp2702 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2703 = load %m261$.Node.type*, %m261$.Node.type** %fn
%.tmp2704 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2703, i32 0, i32 2
%.tmp2705 = load i8*, i8** %.tmp2704
%.tmp2706 = call i8*(%m1791$.CompilerCtx.type*,i8*) @m1791$get_mod_prefix.cp.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.tmp2702, i8* %.tmp2705)
%prefix = alloca i8*
store i8* %.tmp2706, i8** %prefix
%.tmp2707 = getelementptr i8*, i8** %mangled_name, i32 0
%.tmp2709 = getelementptr [5 x i8], [5 x i8]*@.str2708, i32 0, i32 0
%.tmp2710 = load i8*, i8** %prefix
%.tmp2711 = load i8*, i8** %original_name
%.tmp2712 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2707, i8* %.tmp2709, i8* %.tmp2710, i8* %.tmp2711)
%.tmp2713 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp2714 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2713, i32 0, i32 0
%.tmp2715 = load i8*, i8** %.tmp2714
%.tmp2717 = getelementptr [9 x i8], [9 x i8]*@.str2716, i32 0, i32 0
%.tmp2718 = call i32(i8*,i8*) @strcmp(i8* %.tmp2715, i8* %.tmp2717)
%.tmp2719 = icmp eq i32 %.tmp2718, 0
br i1 %.tmp2719, label %.if.true.2720, label %.if.false.2720
.if.true.2720:
%.tmp2721 = load i8*, i8** %mangled_name
%.tmp2723 = getelementptr [5 x i8], [5 x i8]*@.str2722, i32 0, i32 0
%.tmp2724 = call i32(i8*,i8*) @strcmp(i8* %.tmp2721, i8* %.tmp2723)
%.tmp2725 = icmp ne i32 %.tmp2724, 0
br i1 %.tmp2725, label %.if.true.2726, label %.if.false.2726
.if.true.2726:
%tmp_buff = alloca i8*
%swap_var = alloca i8*
%.tmp2728 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp2729 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2728, i32 0, i32 3
%.tmp2730 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2729
%tp = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp2730, %m1791$.Type.type** %tp
br label %.for.start.2727
.for.start.2727:
%.tmp2731 = load %m1791$.Type.type*, %m1791$.Type.type** %tp
%.tmp2732 = icmp ne %m1791$.Type.type* %.tmp2731, null
br i1 %.tmp2732, label %.for.continue.2727, label %.for.end.2727
.for.continue.2727:
%.tmp2733 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2735 = getelementptr [6 x i8], [6 x i8]*@.str2734, i32 0, i32 0
%.tmp2736 = load i8*, i8** %mangled_name
%.tmp2737 = load %m1791$.Type.type*, %m1791$.Type.type** %tp
%.tmp2738 = call i8*(%m1791$.Type.type*) @m1791$type_abbr.cp.m1791$.Type.typep(%m1791$.Type.type* %.tmp2737)
%.tmp2739 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2733, i8* %.tmp2735, i8* %.tmp2736, i8* %.tmp2738)
%.tmp2740 = load i8*, i8** %tmp_buff
store i8* %.tmp2740, i8** %swap_var
%.tmp2741 = load i8*, i8** %mangled_name
store i8* %.tmp2741, i8** %tmp_buff
%.tmp2742 = load i8*, i8** %swap_var
store i8* %.tmp2742, i8** %mangled_name
%.tmp2743 = load i8*, i8** %tmp_buff
call void(i8*) @free(i8* %.tmp2743)
%.tmp2744 = load %m1791$.Type.type*, %m1791$.Type.type** %tp
%.tmp2745 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2744, i32 0, i32 4
%.tmp2746 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2745
store %m1791$.Type.type* %.tmp2746, %m1791$.Type.type** %tp
br label %.for.start.2727
.for.end.2727:
br label %.if.end.2726
.if.false.2726:
br label %.if.end.2726
.if.end.2726:
br label %.if.end.2720
.if.false.2720:
br label %.if.end.2720
.if.end.2720:
%.tmp2747 = load i8*, i8** %mangled_name
ret i8* %.tmp2747
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
%.tmp2748 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2749 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2748, i32 0, i32 0
%.tmp2750 = load i8*, i8** %.tmp2749
%.tmp2752 = getelementptr [3 x i8], [3 x i8]*@.str2751, i32 0, i32 0
%.tmp2753 = call i32(i8*,i8*) @strcmp(i8* %.tmp2750, i8* %.tmp2752)
%.tmp2754 = icmp eq i32 %.tmp2753, 0
br i1 %.tmp2754, label %.if.true.2755, label %.if.false.2755
.if.true.2755:
ret void
br label %.if.end.2755
.if.false.2755:
%.tmp2756 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2757 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2756, i32 0, i32 0
%.tmp2758 = load i8*, i8** %.tmp2757
%.tmp2760 = getelementptr [7 x i8], [7 x i8]*@.str2759, i32 0, i32 0
%.tmp2761 = call i32(i8*,i8*) @strcmp(i8* %.tmp2758, i8* %.tmp2760)
%.tmp2762 = icmp eq i32 %.tmp2761, 0
br i1 %.tmp2762, label %.if.true.2763, label %.if.false.2763
.if.true.2763:
%.tmp2764 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2765 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2764, i32 0, i32 6
%.tmp2766 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2765
%.tmp2768 = getelementptr [11 x i8], [11 x i8]*@.str2767, i32 0, i32 0
%.tmp2769 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp2766, i8* %.tmp2768)
%assignable = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp2769, %m261$.Node.type** %assignable
%.tmp2770 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2771 = load %m261$.Node.type*, %m261$.Node.type** %assignable
%.tmp2772 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp2770, %m261$.Node.type* %.tmp2771)
%a_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp2772, %m1791$.AssignableInfo.type** %a_info
%.tmp2773 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp2774 = icmp eq %m1791$.AssignableInfo.type* %.tmp2773, null
br i1 %.tmp2774, label %.if.true.2775, label %.if.false.2775
.if.true.2775:
ret void
br label %.if.end.2775
.if.false.2775:
br label %.if.end.2775
.if.end.2775:
%.tmp2776 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2777 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp2776)
store %m1791$.AssignableInfo.type* %.tmp2777, %m1791$.AssignableInfo.type** %info
%.tmp2778 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2779 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2778, i32 0, i32 6
%.tmp2780 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2779
%.tmp2781 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2780, i32 0, i32 7
%.tmp2782 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2781
%.tmp2783 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2782, i32 0, i32 1
%.tmp2784 = load i8*, i8** %.tmp2783
%global_name = alloca i8*
store i8* %.tmp2784, i8** %global_name
%.tmp2785 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2786 = load i8, i8* @SCOPE_GLOBAL
%.tmp2787 = load i8*, i8** %global_name
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp2785, i8 %.tmp2786, i8* %.tmp2787)
%.tmp2788 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2789 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2788, i32 0, i32 3
%.tmp2790 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp2791 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2790, i32 0, i32 3
%.tmp2792 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2791
store %m1791$.Type.type* %.tmp2792, %m1791$.Type.type** %.tmp2789
%.tmp2793 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2794 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2793, i32 0, i32 2
%.tmp2796 = getelementptr [9 x i8], [9 x i8]*@.str2795, i32 0, i32 0
store i8* %.tmp2796, i8** %.tmp2794
%.tmp2797 = load i1, i1* %shallow
%.tmp2798 = icmp eq i1 %.tmp2797, 1
br i1 %.tmp2798, label %.if.true.2799, label %.if.false.2799
.if.true.2799:
%.tmp2800 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2801 = load i8*, i8** %global_name
%.tmp2802 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
call void(%m1791$.CompilerCtx.type*,i8*,%m1791$.AssignableInfo.type*) @m1791$define_assignable.v.m1791$.CompilerCtx.typep.cp.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp2800, i8* %.tmp2801, %m1791$.AssignableInfo.type* %.tmp2802)
br label %.if.end.2799
.if.false.2799:
%.tmp2803 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2804 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2803, i32 0, i32 1
%.tmp2805 = load %m0$.File.type*, %m0$.File.type** %.tmp2804
%.tmp2807 = getelementptr [21 x i8], [21 x i8]*@.str2806, i32 0, i32 0
%.tmp2808 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2809 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp2808)
%.tmp2810 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2811 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2812 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2811, i32 0, i32 3
%.tmp2813 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2812
%.tmp2814 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp2810, %m1791$.Type.type* %.tmp2813)
%.tmp2815 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp2816 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp2815)
%.tmp2817 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2805, i8* %.tmp2807, i8* %.tmp2809, i8* %.tmp2814, i8* %.tmp2816)
br label %.if.end.2799
.if.end.2799:
br label %.if.end.2763
.if.false.2763:
%.tmp2818 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2819 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2818, i32 0, i32 0
%.tmp2820 = load i8*, i8** %.tmp2819
%.tmp2822 = getelementptr [10 x i8], [10 x i8]*@.str2821, i32 0, i32 0
%.tmp2823 = call i32(i8*,i8*) @strcmp(i8* %.tmp2820, i8* %.tmp2822)
%.tmp2824 = icmp eq i32 %.tmp2823, 0
br i1 %.tmp2824, label %.if.true.2825, label %.if.false.2825
.if.true.2825:
%.tmp2826 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2827 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2826, i32 0, i32 6
%.tmp2828 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2827
%.tmp2829 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2828, i32 0, i32 7
%.tmp2830 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2829
%.tmp2831 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2830, i32 0, i32 1
%.tmp2832 = load i8*, i8** %.tmp2831
%type_name = alloca i8*
store i8* %.tmp2832, i8** %type_name
%.tmp2833 = load i1, i1* %shallow
%.tmp2834 = icmp eq i1 %.tmp2833, 1
br i1 %.tmp2834, label %.if.true.2835, label %.if.false.2835
.if.true.2835:
%.tmp2836 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2837 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp2836)
store %m1791$.AssignableInfo.type* %.tmp2837, %m1791$.AssignableInfo.type** %info
%.tmp2838 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2839 = call %m1791$.ModuleLookup.type*(%m1791$.CompilerCtx.type*) @m1791$get_current_module.m1791$.ModuleLookup.typep.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp2838)
%mod_from = alloca %m1791$.ModuleLookup.type*
store %m1791$.ModuleLookup.type* %.tmp2839, %m1791$.ModuleLookup.type** %mod_from
%.tmp2840 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp2842 = getelementptr [11 x i8], [11 x i8]*@.str2841, i32 0, i32 0
%.tmp2843 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod_from
%.tmp2844 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp2843, i32 0, i32 1
%.tmp2845 = load i8*, i8** %.tmp2844
%.tmp2846 = load i8*, i8** %type_name
%.tmp2847 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp2840, i8* %.tmp2842, i8* %.tmp2845, i8* %.tmp2846)
%.tmp2848 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2849 = load i8, i8* @SCOPE_LOCAL
%.tmp2850 = load i8*, i8** %tmp_buff
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp2848, i8 %.tmp2849, i8* %.tmp2850)
%.tmp2851 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2852 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2851, i32 0, i32 2
%.tmp2854 = getelementptr [10 x i8], [10 x i8]*@.str2853, i32 0, i32 0
store i8* %.tmp2854, i8** %.tmp2852
%.tmp2855 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2856 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2855, i32 0, i32 4
%.tmp2857 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2858 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2857, i32 0, i32 3
%.tmp2859 = load i32, i32* %.tmp2858
store i32 %.tmp2859, i32* %.tmp2856
%.tmp2860 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2861 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2860, i32 0, i32 5
%.tmp2862 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2863 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2862, i32 0, i32 4
%.tmp2864 = load i32, i32* %.tmp2863
store i32 %.tmp2864, i32* %.tmp2861
%.tmp2865 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2866 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2865, i32 0, i32 3
%.tmp2867 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp2867, %m1791$.Type.type** %.tmp2866
%.tmp2868 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2869 = load i8*, i8** %type_name
%.tmp2870 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
call void(%m1791$.CompilerCtx.type*,i8*,%m1791$.AssignableInfo.type*) @m1791$define_assignable.v.m1791$.CompilerCtx.typep.cp.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp2868, i8* %.tmp2869, %m1791$.AssignableInfo.type* %.tmp2870)
%.tmp2871 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2872 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2871, i32 0, i32 6
%.tmp2873 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2872
%.tmp2875 = getelementptr [5 x i8], [5 x i8]*@.str2874, i32 0, i32 0
%.tmp2876 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp2873, i8* %.tmp2875)
%type_decl = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp2876, %m261$.Node.type** %type_decl
%.tmp2877 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2878 = load %m261$.Node.type*, %m261$.Node.type** %type_decl
%.tmp2879 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2878, i32 0, i32 6
%.tmp2880 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2879
%.tmp2881 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp2877, %m261$.Node.type* %.tmp2880)
%type_struct = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp2881, %m1791$.Type.type** %type_struct
%.tmp2882 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2883 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2882, i32 0, i32 3
%.tmp2884 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2883
%.tmp2885 = load %m1791$.Type.type*, %m1791$.Type.type** %type_struct
call void(%m1791$.Type.type*,%m1791$.Type.type*) @m1791$copy_type.v.m1791$.Type.typep.m1791$.Type.typep(%m1791$.Type.type* %.tmp2884, %m1791$.Type.type* %.tmp2885)
%.tmp2886 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2887 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2886, i32 0, i32 3
%.tmp2888 = load %m1791$.Type.type*, %m1791$.Type.type** %type_struct
store %m1791$.Type.type* %.tmp2888, %m1791$.Type.type** %.tmp2887
br label %.if.end.2835
.if.false.2835:
%.tmp2889 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2890 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2891 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2890, i32 0, i32 6
%.tmp2892 = load i8*, i8** %.tmp2891
%.tmp2893 = load i8*, i8** %type_name
%.tmp2894 = call %m1791$.ScopeItem.type*(%m1791$.CompilerCtx.type*,i8*,i8*) @m1791$find_defined_str.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.cp.cp(%m1791$.CompilerCtx.type* %.tmp2889, i8* %.tmp2892, i8* %.tmp2893)
%scope = alloca %m1791$.ScopeItem.type*
store %m1791$.ScopeItem.type* %.tmp2894, %m1791$.ScopeItem.type** %scope
%.tmp2895 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %scope
%.tmp2896 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp2895, i32 0, i32 1
%.tmp2897 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp2896
store %m1791$.AssignableInfo.type* %.tmp2897, %m1791$.AssignableInfo.type** %info
%.tmp2898 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2899 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2898, i32 0, i32 1
%.tmp2900 = load %m0$.File.type*, %m0$.File.type** %.tmp2899
%.tmp2902 = getelementptr [14 x i8], [14 x i8]*@.str2901, i32 0, i32 0
%.tmp2903 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2904 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp2903)
%.tmp2905 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2906 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2907 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2906, i32 0, i32 3
%.tmp2908 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2907
%.tmp2909 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp2905, %m1791$.Type.type* %.tmp2908)
%.tmp2910 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2900, i8* %.tmp2902, i8* %.tmp2904, i8* %.tmp2909)
br label %.if.end.2835
.if.end.2835:
br label %.if.end.2825
.if.false.2825:
%.tmp2911 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2912 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2911, i32 0, i32 0
%.tmp2913 = load i8*, i8** %.tmp2912
%.tmp2915 = getelementptr [7 x i8], [7 x i8]*@.str2914, i32 0, i32 0
%.tmp2916 = call i32(i8*,i8*) @strcmp(i8* %.tmp2913, i8* %.tmp2915)
%.tmp2917 = icmp eq i32 %.tmp2916, 0
br i1 %.tmp2917, label %.if.true.2918, label %.if.false.2918
.if.true.2918:
%.tmp2919 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2920 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp2919)
store %m1791$.AssignableInfo.type* %.tmp2920, %m1791$.AssignableInfo.type** %info
%.tmp2921 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2922 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2921, i32 0, i32 3
%.tmp2923 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2924 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2925 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2924, i32 0, i32 6
%.tmp2926 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2925
%.tmp2927 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2926, i32 0, i32 7
%.tmp2928 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2927
%.tmp2929 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$syn_function_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp2923, %m261$.Node.type* %.tmp2928)
store %m1791$.Type.type* %.tmp2929, %m1791$.Type.type** %.tmp2922
%.tmp2930 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2931 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2930, i32 0, i32 2
%.tmp2933 = getelementptr [7 x i8], [7 x i8]*@.str2932, i32 0, i32 0
store i8* %.tmp2933, i8** %.tmp2931
%.tmp2934 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2935 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2934, i32 0, i32 6
%.tmp2936 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2935
%.tmp2937 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2936, i32 0, i32 7
%.tmp2938 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2937
%.tmp2939 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2938, i32 0, i32 7
%.tmp2940 = load %m261$.Node.type*, %m261$.Node.type** %.tmp2939
%.tmp2941 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2940, i32 0, i32 1
%.tmp2942 = load i8*, i8** %.tmp2941
%fn_name = alloca i8*
store i8* %.tmp2942, i8** %fn_name
%.tmp2943 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2944 = load i8, i8* @SCOPE_GLOBAL
%.tmp2945 = load i8*, i8** %fn_name
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp2943, i8 %.tmp2944, i8* %.tmp2945)
%.tmp2946 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2947 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2946, i32 0, i32 4
%.tmp2948 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2949 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2948, i32 0, i32 3
%.tmp2950 = load i32, i32* %.tmp2949
store i32 %.tmp2950, i32* %.tmp2947
%.tmp2951 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2952 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2951, i32 0, i32 5
%.tmp2953 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp2954 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp2953, i32 0, i32 4
%.tmp2955 = load i32, i32* %.tmp2954
store i32 %.tmp2955, i32* %.tmp2952
%.tmp2956 = load i32, i32* @Type_size
%.tmp2957 = call i8*(i32) @malloc(i32 %.tmp2956)
%.tmp2958 = bitcast i8* %.tmp2957 to %m1791$.Type.type*
store %m1791$.Type.type* %.tmp2958, %m1791$.Type.type** %return_type
%.tmp2959 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp2960 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2959, i32 0, i32 4
store %m1791$.Type.type* null, %m1791$.Type.type** %.tmp2960
%.tmp2961 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp2962 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2961, i32 0, i32 1
store i8* null, i8** %.tmp2962
%.tmp2963 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp2964 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2963, i32 0, i32 0
%.tmp2965 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2966 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2965, i32 0, i32 3
%.tmp2967 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2966
%.tmp2968 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2967, i32 0, i32 3
%.tmp2969 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2968
%.tmp2970 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2969, i32 0, i32 0
%.tmp2971 = load i8*, i8** %.tmp2970
store i8* %.tmp2971, i8** %.tmp2964
%.tmp2972 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp2973 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2972, i32 0, i32 3
%.tmp2974 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2975 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2974, i32 0, i32 3
%.tmp2976 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2975
%.tmp2977 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2976, i32 0, i32 3
%.tmp2978 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2977
%.tmp2979 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2978, i32 0, i32 3
%.tmp2980 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2979
store %m1791$.Type.type* %.tmp2980, %m1791$.Type.type** %.tmp2973
%.tmp2981 = load i1, i1* %shallow
%.tmp2982 = icmp eq i1 %.tmp2981, 0
br i1 %.tmp2982, label %.if.true.2983, label %.if.false.2983
.if.true.2983:
%.tmp2984 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2985 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp2984, i32 0, i32 1
%.tmp2986 = load %m0$.File.type*, %m0$.File.type** %.tmp2985
%.tmp2988 = getelementptr [15 x i8], [15 x i8]*@.str2987, i32 0, i32 0
%.tmp2989 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp2990 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp2991 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp2989, %m1791$.Type.type* %.tmp2990)
%.tmp2992 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2993 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp2992)
%.tmp2994 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp2986, i8* %.tmp2988, i8* %.tmp2991, i8* %.tmp2993)
%.tmp2996 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp2997 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp2996, i32 0, i32 3
%.tmp2998 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2997
%.tmp2999 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp2998, i32 0, i32 3
%.tmp3000 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp2999
%.tmp3001 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3000, i32 0, i32 4
%.tmp3002 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3001
%pt = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp3002, %m1791$.Type.type** %pt
br label %.for.start.2995
.for.start.2995:
%.tmp3003 = load %m1791$.Type.type*, %m1791$.Type.type** %pt
%.tmp3004 = icmp ne %m1791$.Type.type* %.tmp3003, null
br i1 %.tmp3004, label %.for.continue.2995, label %.for.end.2995
.for.continue.2995:
%.tmp3005 = load %m1791$.Type.type*, %m1791$.Type.type** %pt
%.tmp3006 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3007 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3006, i32 0, i32 3
%.tmp3008 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3007
%.tmp3009 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3008, i32 0, i32 3
%.tmp3010 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3009
%.tmp3011 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3010, i32 0, i32 4
%.tmp3012 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3011
%.tmp3013 = icmp ne %m1791$.Type.type* %.tmp3005, %.tmp3012
br i1 %.tmp3013, label %.if.true.3014, label %.if.false.3014
.if.true.3014:
%.tmp3015 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3016 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3015, i32 0, i32 1
%.tmp3017 = load %m0$.File.type*, %m0$.File.type** %.tmp3016
%.tmp3019 = getelementptr [3 x i8], [3 x i8]*@.str3018, i32 0, i32 0
%.tmp3020 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3017, i8* %.tmp3019)
br label %.if.end.3014
.if.false.3014:
br label %.if.end.3014
.if.end.3014:
%.tmp3021 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3022 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3021, i32 0, i32 1
%.tmp3023 = load %m0$.File.type*, %m0$.File.type** %.tmp3022
%.tmp3025 = getelementptr [3 x i8], [3 x i8]*@.str3024, i32 0, i32 0
%.tmp3026 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3027 = load %m1791$.Type.type*, %m1791$.Type.type** %pt
%.tmp3028 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3026, %m1791$.Type.type* %.tmp3027)
%.tmp3029 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3023, i8* %.tmp3025, i8* %.tmp3028)
%.tmp3030 = load %m1791$.Type.type*, %m1791$.Type.type** %pt
%.tmp3031 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3030, i32 0, i32 4
%.tmp3032 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3031
store %m1791$.Type.type* %.tmp3032, %m1791$.Type.type** %pt
br label %.for.start.2995
.for.end.2995:
%.tmp3033 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3034 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3033, i32 0, i32 1
%.tmp3035 = load %m0$.File.type*, %m0$.File.type** %.tmp3034
%.tmp3037 = getelementptr [3 x i8], [3 x i8]*@.str3036, i32 0, i32 0
%.tmp3038 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3035, i8* %.tmp3037)
%.tmp3039 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp3040 = bitcast %m1791$.Type.type* %.tmp3039 to i8*
call void(i8*) @free(i8* %.tmp3040)
br label %.if.end.2983
.if.false.2983:
%.tmp3041 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3042 = load i8*, i8** %fn_name
%.tmp3043 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
call void(%m1791$.CompilerCtx.type*,i8*,%m1791$.AssignableInfo.type*) @m1791$define_assignable.v.m1791$.CompilerCtx.typep.cp.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp3041, i8* %.tmp3042, %m1791$.AssignableInfo.type* %.tmp3043)
br label %.if.end.2983
.if.end.2983:
br label %.if.end.2918
.if.false.2918:
%.tmp3044 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3045 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3044, i32 0, i32 0
%.tmp3046 = load i8*, i8** %.tmp3045
%.tmp3048 = getelementptr [9 x i8], [9 x i8]*@.str3047, i32 0, i32 0
%.tmp3049 = call i32(i8*,i8*) @strcmp(i8* %.tmp3046, i8* %.tmp3048)
%.tmp3050 = icmp eq i32 %.tmp3049, 0
br i1 %.tmp3050, label %.if.true.3051, label %.if.false.3051
.if.true.3051:
%.tmp3052 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3053 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp3052)
store %m1791$.AssignableInfo.type* %.tmp3053, %m1791$.AssignableInfo.type** %info
%.tmp3054 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3055 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3054, i32 0, i32 2
%.tmp3057 = getelementptr [9 x i8], [9 x i8]*@.str3056, i32 0, i32 0
store i8* %.tmp3057, i8** %.tmp3055
%.tmp3058 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3059 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3058, i32 0, i32 3
%.tmp3060 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3061 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3062 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3061, i32 0, i32 6
%.tmp3063 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3062
%.tmp3064 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$syn_function_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3060, %m261$.Node.type* %.tmp3063)
store %m1791$.Type.type* %.tmp3064, %m1791$.Type.type** %.tmp3059
%.tmp3065 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3066 = call i8*(%m261$.Node.type*) @m1791$syn_function_name.cp.m261$.Node.typep(%m261$.Node.type* %.tmp3065)
%name = alloca i8*
store i8* %.tmp3066, i8** %name
%.tmp3067 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3068 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3069 = load i8*, i8** %name
%.tmp3070 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3071 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3070, i32 0, i32 3
%.tmp3072 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3071
%.tmp3073 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*,%m1791$.Type.type*) @m1791$name_mangle.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3067, %m261$.Node.type* %.tmp3068, i8* %.tmp3069, %m1791$.Type.type* %.tmp3072)
store i8* %.tmp3073, i8** %tmp_buff
%.tmp3074 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3075 = load i8, i8* @SCOPE_GLOBAL
%.tmp3076 = load i8*, i8** %tmp_buff
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp3074, i8 %.tmp3075, i8* %.tmp3076)
%.tmp3077 = load i1, i1* %shallow
%.tmp3078 = icmp eq i1 %.tmp3077, 1
br i1 %.tmp3078, label %.if.true.3079, label %.if.false.3079
.if.true.3079:
%.tmp3080 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3081 = load i8*, i8** %name
%.tmp3082 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
call void(%m1791$.CompilerCtx.type*,i8*,%m1791$.AssignableInfo.type*) @m1791$define_assignable.v.m1791$.CompilerCtx.typep.cp.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp3080, i8* %.tmp3081, %m1791$.AssignableInfo.type* %.tmp3082)
br label %.if.end.3079
.if.false.3079:
%.tmp3083 = load i32, i32* @Type_size
%.tmp3084 = call i8*(i32) @malloc(i32 %.tmp3083)
%.tmp3085 = bitcast i8* %.tmp3084 to %m1791$.Type.type*
store %m1791$.Type.type* %.tmp3085, %m1791$.Type.type** %return_type
%.tmp3086 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp3087 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3086, i32 0, i32 1
store i8* null, i8** %.tmp3087
%.tmp3088 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp3089 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3088, i32 0, i32 4
store %m1791$.Type.type* null, %m1791$.Type.type** %.tmp3089
%.tmp3090 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp3091 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3090, i32 0, i32 0
%.tmp3092 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3093 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3092, i32 0, i32 3
%.tmp3094 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3093
%.tmp3095 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3094, i32 0, i32 3
%.tmp3096 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3095
%.tmp3097 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3096, i32 0, i32 0
%.tmp3098 = load i8*, i8** %.tmp3097
store i8* %.tmp3098, i8** %.tmp3091
%.tmp3099 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp3100 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3099, i32 0, i32 3
%.tmp3101 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3102 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3101, i32 0, i32 3
%.tmp3103 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3102
%.tmp3104 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3103, i32 0, i32 3
%.tmp3105 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3104
%.tmp3106 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3105, i32 0, i32 3
%.tmp3107 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3106
store %m1791$.Type.type* %.tmp3107, %m1791$.Type.type** %.tmp3100
%.tmp3108 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3109 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3108, i32 0, i32 1
%.tmp3110 = load %m0$.File.type*, %m0$.File.type** %.tmp3109
%.tmp3112 = getelementptr [14 x i8], [14 x i8]*@.str3111, i32 0, i32 0
%.tmp3113 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3114 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp3115 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3113, %m1791$.Type.type* %.tmp3114)
%.tmp3116 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3117 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3116)
%.tmp3118 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3110, i8* %.tmp3112, i8* %.tmp3115, i8* %.tmp3117)
%.tmp3119 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3120 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3119, i32 0, i32 6
%.tmp3121 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3120
%.tmp3122 = call %m261$.Node.type*(%m261$.Node.type*) @m1791$syn_function_params.m261$.Node.typep.m261$.Node.typep(%m261$.Node.type* %.tmp3121)
%params = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3122, %m261$.Node.type** %params
%param_type = alloca %m1791$.Type.type*
%.tmp3124 = load %m261$.Node.type*, %m261$.Node.type** %params
%param_ptr = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3124, %m261$.Node.type** %param_ptr
br label %.for.start.3123
.for.start.3123:
%.tmp3125 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3126 = icmp ne %m261$.Node.type* %.tmp3125, null
br i1 %.tmp3126, label %.for.continue.3123, label %.for.end.3123
.for.continue.3123:
%.tmp3127 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3128 = load %m261$.Node.type*, %m261$.Node.type** %params
%.tmp3129 = icmp ne %m261$.Node.type* %.tmp3127, %.tmp3128
br i1 %.tmp3129, label %.if.true.3130, label %.if.false.3130
.if.true.3130:
%.tmp3131 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3132 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3131, i32 0, i32 7
%.tmp3133 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3132
store %m261$.Node.type* %.tmp3133, %m261$.Node.type** %param_ptr
%.tmp3134 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3135 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3134, i32 0, i32 1
%.tmp3136 = load %m0$.File.type*, %m0$.File.type** %.tmp3135
%.tmp3138 = getelementptr [3 x i8], [3 x i8]*@.str3137, i32 0, i32 0
%.tmp3139 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3136, i8* %.tmp3138)
br label %.if.end.3130
.if.false.3130:
br label %.if.end.3130
.if.end.3130:
%.tmp3140 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3141 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3140, i32 0, i32 0
%.tmp3142 = load i8*, i8** %.tmp3141
%.tmp3144 = getelementptr [5 x i8], [5 x i8]*@.str3143, i32 0, i32 0
%.tmp3145 = call i32(i8*,i8*) @strcmp(i8* %.tmp3142, i8* %.tmp3144)
%.tmp3146 = icmp eq i32 %.tmp3145, 0
br i1 %.tmp3146, label %.if.true.3147, label %.if.false.3147
.if.true.3147:
%.tmp3148 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3149 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3150 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3149, i32 0, i32 6
%.tmp3151 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3150
%.tmp3152 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3148, %m261$.Node.type* %.tmp3151)
store %m1791$.Type.type* %.tmp3152, %m1791$.Type.type** %param_type
%.tmp3153 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3154 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3153, i32 0, i32 7
%.tmp3155 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3154
store %m261$.Node.type* %.tmp3155, %m261$.Node.type** %param_ptr
br label %.if.end.3147
.if.false.3147:
br label %.if.end.3147
.if.end.3147:
%.tmp3156 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3157 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3156, i32 0, i32 1
%.tmp3158 = load %m0$.File.type*, %m0$.File.type** %.tmp3157
%.tmp3160 = getelementptr [13 x i8], [13 x i8]*@.str3159, i32 0, i32 0
%.tmp3161 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3162 = load %m1791$.Type.type*, %m1791$.Type.type** %param_type
%.tmp3163 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3161, %m1791$.Type.type* %.tmp3162)
%.tmp3164 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3165 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3164, i32 0, i32 1
%.tmp3166 = load i8*, i8** %.tmp3165
%.tmp3167 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3158, i8* %.tmp3160, i8* %.tmp3163, i8* %.tmp3166)
%.tmp3168 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3169 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3168, i32 0, i32 7
%.tmp3170 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3169
store %m261$.Node.type* %.tmp3170, %m261$.Node.type** %param_ptr
br label %.for.start.3123
.for.end.3123:
%.tmp3171 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3172 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3171, i32 0, i32 1
%.tmp3173 = load %m0$.File.type*, %m0$.File.type** %.tmp3172
%.tmp3175 = getelementptr [5 x i8], [5 x i8]*@.str3174, i32 0, i32 0
%.tmp3176 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3173, i8* %.tmp3175)
%.tmp3177 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
call void(%m1791$.CompilerCtx.type*) @m1791$push_scope.v.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp3177)
%.tmp3178 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3179 = load %m261$.Node.type*, %m261$.Node.type** %params
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_fn_params.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3178, %m261$.Node.type* %.tmp3179)
%.tmp3180 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3181 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3180, i32 0, i32 6
%.tmp3182 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3181
%.tmp3184 = getelementptr [6 x i8], [6 x i8]*@.str3183, i32 0, i32 0
%.tmp3185 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3182, i8* %.tmp3184)
%fn_block = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3185, %m261$.Node.type** %fn_block
%.tmp3186 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3187 = load %m261$.Node.type*, %m261$.Node.type** %fn_block
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_block.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3186, %m261$.Node.type* %.tmp3187)
%.tmp3188 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
call void(%m1791$.CompilerCtx.type*) @m1791$pop_scope.v.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp3188)
%.tmp3189 = bitcast ptr null to %m261$.Node.type*
%last_valid_instruction = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3189, %m261$.Node.type** %last_valid_instruction
%.tmp3191 = load %m261$.Node.type*, %m261$.Node.type** %fn_block
%.tmp3192 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3191, i32 0, i32 6
%.tmp3193 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3192
%ci = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3193, %m261$.Node.type** %ci
br label %.for.start.3190
.for.start.3190:
%.tmp3194 = load %m261$.Node.type*, %m261$.Node.type** %ci
%.tmp3195 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3194, i32 0, i32 7
%.tmp3196 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3195
%.tmp3197 = icmp ne %m261$.Node.type* %.tmp3196, null
br i1 %.tmp3197, label %.for.continue.3190, label %.for.end.3190
.for.continue.3190:
%.tmp3198 = load %m261$.Node.type*, %m261$.Node.type** %ci
%.tmp3199 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3198, i32 0, i32 0
%.tmp3200 = load i8*, i8** %.tmp3199
%.tmp3202 = getelementptr [3 x i8], [3 x i8]*@.str3201, i32 0, i32 0
%.tmp3203 = call i32(i8*,i8*) @strcmp(i8* %.tmp3200, i8* %.tmp3202)
%.tmp3204 = icmp ne i32 %.tmp3203, 0
%.tmp3205 = load %m261$.Node.type*, %m261$.Node.type** %ci
%.tmp3206 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3205, i32 0, i32 0
%.tmp3207 = load i8*, i8** %.tmp3206
%.tmp3209 = getelementptr [9 x i8], [9 x i8]*@.str3208, i32 0, i32 0
%.tmp3210 = call i32(i8*,i8*) @strcmp(i8* %.tmp3207, i8* %.tmp3209)
%.tmp3211 = icmp ne i32 %.tmp3210, 0
%.tmp3212 = and i1 %.tmp3204, %.tmp3211
br i1 %.tmp3212, label %.if.true.3213, label %.if.false.3213
.if.true.3213:
%.tmp3214 = load %m261$.Node.type*, %m261$.Node.type** %ci
store %m261$.Node.type* %.tmp3214, %m261$.Node.type** %last_valid_instruction
br label %.if.end.3213
.if.false.3213:
br label %.if.end.3213
.if.end.3213:
%.tmp3215 = load %m261$.Node.type*, %m261$.Node.type** %ci
%.tmp3216 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3215, i32 0, i32 7
%.tmp3217 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3216
store %m261$.Node.type* %.tmp3217, %m261$.Node.type** %ci
br label %.for.start.3190
.for.end.3190:
%add_implicit_return = alloca i1
store i1 0, i1* %add_implicit_return
%.tmp3218 = load %m261$.Node.type*, %m261$.Node.type** %last_valid_instruction
%.tmp3219 = icmp eq %m261$.Node.type* %.tmp3218, null
br i1 %.tmp3219, label %.if.true.3220, label %.if.false.3220
.if.true.3220:
store i1 1, i1* %add_implicit_return
br label %.if.end.3220
.if.false.3220:
%.tmp3221 = load %m261$.Node.type*, %m261$.Node.type** %last_valid_instruction
%.tmp3222 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3221, i32 0, i32 6
%.tmp3223 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3222
%.tmp3224 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3223, i32 0, i32 0
%.tmp3225 = load i8*, i8** %.tmp3224
%.tmp3227 = getelementptr [7 x i8], [7 x i8]*@.str3226, i32 0, i32 0
%.tmp3228 = call i32(i8*,i8*) @strcmp(i8* %.tmp3225, i8* %.tmp3227)
%.tmp3229 = icmp ne i32 %.tmp3228, 0
br i1 %.tmp3229, label %.if.true.3230, label %.if.false.3230
.if.true.3230:
store i1 1, i1* %add_implicit_return
br label %.if.end.3230
.if.false.3230:
br label %.if.end.3230
.if.end.3230:
br label %.if.end.3220
.if.end.3220:
%.tmp3231 = load i1, i1* %add_implicit_return
br i1 %.tmp3231, label %.if.true.3232, label %.if.false.3232
.if.true.3232:
%.tmp3233 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3234 = load %m1791$.Type.type*, %m1791$.Type.type** %return_type
%.tmp3235 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3233, %m1791$.Type.type* %.tmp3234)
%.tmp3237 = getelementptr [5 x i8], [5 x i8]*@.str3236, i32 0, i32 0
%.tmp3238 = call i32(i8*,i8*) @strcmp(i8* %.tmp3235, i8* %.tmp3237)
%.tmp3239 = icmp ne i32 %.tmp3238, 0
br i1 %.tmp3239, label %.if.true.3240, label %.if.false.3240
.if.true.3240:
%.tmp3241 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3242 = load %m261$.Node.type*, %m261$.Node.type** %fn_block
%.tmp3244 = getelementptr [21 x i8], [21 x i8]*@.str3243, i32 0, i32 0
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp3241, %m261$.Node.type* %.tmp3242, i8* %.tmp3244)
br label %.if.end.3240
.if.false.3240:
%.tmp3245 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3246 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3245, i32 0, i32 1
%.tmp3247 = load %m0$.File.type*, %m0$.File.type** %.tmp3246
%.tmp3249 = getelementptr [10 x i8], [10 x i8]*@.str3248, i32 0, i32 0
%.tmp3250 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3247, i8* %.tmp3249)
br label %.if.end.3240
.if.end.3240:
br label %.if.end.3232
.if.false.3232:
br label %.if.end.3232
.if.end.3232:
%.tmp3251 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3252 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3251, i32 0, i32 1
%.tmp3253 = load %m0$.File.type*, %m0$.File.type** %.tmp3252
%.tmp3255 = getelementptr [3 x i8], [3 x i8]*@.str3254, i32 0, i32 0
%.tmp3256 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3253, i8* %.tmp3255)
br label %.if.end.3079
.if.end.3079:
br label %.if.end.3051
.if.false.3051:
%.tmp3257 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3258 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3257, i32 0, i32 0
%.tmp3259 = load i8*, i8** %.tmp3258
%.tmp3261 = getelementptr [7 x i8], [7 x i8]*@.str3260, i32 0, i32 0
%.tmp3262 = call i32(i8*,i8*) @strcmp(i8* %.tmp3259, i8* %.tmp3261)
%.tmp3263 = icmp eq i32 %.tmp3262, 0
br i1 %.tmp3263, label %.if.true.3264, label %.if.false.3264
.if.true.3264:
%.tmp3265 = load i1, i1* %shallow
%.tmp3266 = icmp eq i1 %.tmp3265, 1
br i1 %.tmp3266, label %.if.true.3267, label %.if.false.3267
.if.true.3267:
%.tmp3268 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3269 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3268, i32 0, i32 6
%.tmp3270 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3269
%.tmp3271 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3270, i32 0, i32 7
%.tmp3272 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3271
%.tmp3273 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3272, i32 0, i32 1
%.tmp3274 = load i8*, i8** %.tmp3273
%mod_name = alloca i8*
store i8* %.tmp3274, i8** %mod_name
%.tmp3275 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3276 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3275, i32 0, i32 6
%.tmp3277 = load i8*, i8** %.tmp3276
%mod_abspath = alloca i8*
store i8* %.tmp3277, i8** %mod_abspath
%.tmp3278 = load i8*, i8** %mod_abspath
%.tmp3279 = call i8*(i8*) @m2$dirname.cp.cp(i8* %.tmp3278)
%dirname = alloca i8*
store i8* %.tmp3279, i8** %dirname
%.tmp3280 = load i8*, i8** %mod_name
%.tmp3281 = call i32(i8*) @strlen(i8* %.tmp3280)
%mod_name_len = alloca i32
store i32 %.tmp3281, i32* %mod_name_len
%.tmp3282 = load i32, i32* %mod_name_len
%.tmp3283 = sub i32 %.tmp3282, 1
%.tmp3284 = call i8*(i32) @malloc(i32 %.tmp3283)
%trimmed_name = alloca i8*
store i8* %.tmp3284, i8** %trimmed_name
%i = alloca i32
store i32 1, i32* %i
br label %.for.start.3285
.for.start.3285:
%.tmp3286 = load i32, i32* %i
%.tmp3287 = load i32, i32* %mod_name_len
%.tmp3288 = sub i32 %.tmp3287, 1
%.tmp3289 = icmp slt i32 %.tmp3286, %.tmp3288
br i1 %.tmp3289, label %.for.continue.3285, label %.for.end.3285
.for.continue.3285:
%.tmp3290 = load i32, i32* %i
%.tmp3291 = sub i32 %.tmp3290, 1
%.tmp3292 = load i8*, i8** %trimmed_name
%.tmp3293 = getelementptr i8, i8* %.tmp3292, i32 %.tmp3291
%.tmp3294 = load i32, i32* %i
%.tmp3295 = load i8*, i8** %mod_name
%.tmp3296 = getelementptr i8, i8* %.tmp3295, i32 %.tmp3294
%.tmp3297 = load i8, i8* %.tmp3296
store i8 %.tmp3297, i8* %.tmp3293
%.tmp3298 = load i32, i32* %i
%.tmp3299 = add i32 %.tmp3298, 1
store i32 %.tmp3299, i32* %i
br label %.for.start.3285
.for.end.3285:
%.tmp3300 = load i32, i32* %mod_name_len
%.tmp3301 = sub i32 %.tmp3300, 2
%.tmp3302 = load i8*, i8** %trimmed_name
%.tmp3303 = getelementptr i8, i8* %.tmp3302, i32 %.tmp3301
store i8 0, i8* %.tmp3303
%.tmp3304 = load i8*, i8** %dirname
%.tmp3306 = getelementptr [1 x i8], [1 x i8]*@.str3305, i32 0, i32 0
%.tmp3307 = call i32(i8*,i8*) @strcmp(i8* %.tmp3304, i8* %.tmp3306)
%.tmp3308 = icmp eq i32 %.tmp3307, 0
br i1 %.tmp3308, label %.if.true.3309, label %.if.false.3309
.if.true.3309:
%.tmp3310 = getelementptr i8*, i8** %mod_abspath, i32 0
%.tmp3312 = getelementptr [6 x i8], [6 x i8]*@.str3311, i32 0, i32 0
%.tmp3313 = load i8*, i8** %trimmed_name
%.tmp3314 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3310, i8* %.tmp3312, i8* %.tmp3313)
br label %.if.end.3309
.if.false.3309:
%.tmp3315 = getelementptr i8*, i8** %mod_abspath, i32 0
%.tmp3317 = getelementptr [9 x i8], [9 x i8]*@.str3316, i32 0, i32 0
%.tmp3318 = load i8*, i8** %dirname
%.tmp3319 = load i8*, i8** %trimmed_name
%.tmp3320 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3315, i8* %.tmp3317, i8* %.tmp3318, i8* %.tmp3319)
br label %.if.end.3309
.if.end.3309:
%.tmp3321 = load i8*, i8** %mod_abspath
%.tmp3322 = call i8*(i32) @malloc(i32 4096)
%.tmp3323 = call i8*(i8*,i8*) @realpath(i8* %.tmp3321, i8* %.tmp3322)
store i8* %.tmp3323, i8** %mod_abspath
%.tmp3324 = load i8*, i8** %mod_abspath
%.tmp3325 = icmp eq i8* %.tmp3324, null
br i1 %.tmp3325, label %.if.true.3326, label %.if.false.3326
.if.true.3326:
%.tmp3327 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp3329 = getelementptr [60 x i8], [60 x i8]*@.str3328, i32 0, i32 0
%.tmp3330 = load i8*, i8** %mod_name
%.tmp3331 = load i8*, i8** %dirname
%.tmp3332 = load i8*, i8** %trimmed_name
%.tmp3333 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3327, i8* %.tmp3329, i8* %.tmp3330, i8* %.tmp3331, i8* %.tmp3332)
%.tmp3334 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3335 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3336 = load i8*, i8** %err_buf
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp3334, %m261$.Node.type* %.tmp3335, i8* %.tmp3336)
ret void
br label %.if.end.3326
.if.false.3326:
br label %.if.end.3326
.if.end.3326:
%already_imported = alloca i1
store i1 0, i1* %already_imported
%m = alloca %m1791$.ModuleLookup.type*
%.tmp3337 = bitcast ptr null to %m1791$.ModuleLookup.type*
%mod = alloca %m1791$.ModuleLookup.type*
store %m1791$.ModuleLookup.type* %.tmp3337, %m1791$.ModuleLookup.type** %mod
%.tmp3339 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3340 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3339, i32 0, i32 5
%.tmp3341 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %.tmp3340
store %m1791$.ModuleLookup.type* %.tmp3341, %m1791$.ModuleLookup.type** %m
br label %.for.start.3338
.for.start.3338:
%.tmp3342 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp3343 = icmp ne %m1791$.ModuleLookup.type* %.tmp3342, null
%.tmp3344 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3345 = icmp eq %m1791$.ModuleLookup.type* %.tmp3344, null
%.tmp3346 = and i1 %.tmp3343, %.tmp3345
br i1 %.tmp3346, label %.for.continue.3338, label %.for.end.3338
.for.continue.3338:
%.tmp3347 = load i8*, i8** %mod_abspath
%.tmp3348 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp3349 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3348, i32 0, i32 0
%.tmp3350 = load i8*, i8** %.tmp3349
%.tmp3351 = call i32(i8*,i8*) @strcmp(i8* %.tmp3347, i8* %.tmp3350)
%.tmp3352 = icmp eq i32 %.tmp3351, 0
br i1 %.tmp3352, label %.if.true.3353, label %.if.false.3353
.if.true.3353:
%.tmp3354 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
store %m1791$.ModuleLookup.type* %.tmp3354, %m1791$.ModuleLookup.type** %mod
br label %.if.end.3353
.if.false.3353:
br label %.if.end.3353
.if.end.3353:
%.tmp3355 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp3356 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3355, i32 0, i32 2
%.tmp3357 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %.tmp3356
store %m1791$.ModuleLookup.type* %.tmp3357, %m1791$.ModuleLookup.type** %m
br label %.for.start.3338
.for.end.3338:
%.tmp3358 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3359 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3358, i32 0, i32 6
%.tmp3360 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3359
%.tmp3361 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3360, i32 0, i32 7
%.tmp3362 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3361
%.tmp3363 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3362, i32 0, i32 7
%.tmp3364 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3363
%.tmp3365 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3364, i32 0, i32 7
%.tmp3366 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3365
%.tmp3367 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3366, i32 0, i32 1
%.tmp3368 = load i8*, i8** %.tmp3367
%asname = alloca i8*
store i8* %.tmp3368, i8** %asname
%.tmp3369 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3370 = icmp eq %m1791$.ModuleLookup.type* %.tmp3369, null
br i1 %.tmp3370, label %.if.true.3371, label %.if.false.3371
.if.true.3371:
%.tmp3372 = load i32, i32* @ModuleLookup_size
%.tmp3373 = call i8*(i32) @malloc(i32 %.tmp3372)
%.tmp3374 = bitcast i8* %.tmp3373 to %m1791$.ModuleLookup.type*
store %m1791$.ModuleLookup.type* %.tmp3374, %m1791$.ModuleLookup.type** %mod
%.tmp3375 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3376 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3375, i32 0, i32 0
%.tmp3377 = load i8*, i8** %mod_abspath
store i8* %.tmp3377, i8** %.tmp3376
%.tmp3378 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3379 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3378, i32 0, i32 2
store %m1791$.ModuleLookup.type* null, %m1791$.ModuleLookup.type** %.tmp3379
%.tmp3380 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3381 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3380, i32 0, i32 3
store %m1791$.Scope.type* null, %m1791$.Scope.type** %.tmp3381
%.tmp3382 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3383 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3382, i32 0, i32 1
%.tmp3384 = getelementptr i8*, i8** %.tmp3383, i32 0
%.tmp3386 = getelementptr [5 x i8], [5 x i8]*@.str3385, i32 0, i32 0
%.tmp3387 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3388 = call i32(%m1791$.CompilerCtx.type*) @m1791$new_uid.i.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp3387)
%.tmp3389 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3384, i8* %.tmp3386, i32 %.tmp3388)
%.tmp3391 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3392 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3391, i32 0, i32 5
%.tmp3393 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %.tmp3392
store %m1791$.ModuleLookup.type* %.tmp3393, %m1791$.ModuleLookup.type** %m
br label %.for.start.3390
.for.start.3390:
%.tmp3394 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp3395 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3394, i32 0, i32 2
%.tmp3396 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %.tmp3395
%.tmp3397 = icmp ne %m1791$.ModuleLookup.type* %.tmp3396, null
br i1 %.tmp3397, label %.for.continue.3390, label %.for.end.3390
.for.continue.3390:
%.tmp3398 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp3399 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3398, i32 0, i32 2
%.tmp3400 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %.tmp3399
store %m1791$.ModuleLookup.type* %.tmp3400, %m1791$.ModuleLookup.type** %m
br label %.for.start.3390
.for.end.3390:
%.tmp3401 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %m
%.tmp3402 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3401, i32 0, i32 2
%.tmp3403 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
store %m1791$.ModuleLookup.type* %.tmp3403, %m1791$.ModuleLookup.type** %.tmp3402
%.tmp3404 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3405 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3406 = load i8*, i8** %asname
%.tmp3407 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3408 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3407, i32 0, i32 0
%.tmp3409 = load i8*, i8** %.tmp3408
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*,i8*) @m1791$define_module.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp.cp(%m1791$.CompilerCtx.type* %.tmp3404, %m261$.Node.type* %.tmp3405, i8* %.tmp3406, i8* %.tmp3409)
%.tmp3410 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3411 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3410, i32 0, i32 6
%.tmp3412 = load i8*, i8** %.tmp3411
%curr_mod = alloca i8*
store i8* %.tmp3412, i8** %curr_mod
%.tmp3413 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3414 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3413, i32 0, i32 6
%.tmp3415 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3416 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3415, i32 0, i32 0
%.tmp3417 = load i8*, i8** %.tmp3416
store i8* %.tmp3417, i8** %.tmp3414
%.tmp3418 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3419 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3420 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3419, i32 0, i32 0
%.tmp3421 = load i8*, i8** %.tmp3420
%.tmp3422 = call i1(%m1791$.CompilerCtx.type*,i8*) @m1791$compile_file.b.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.tmp3418, i8* %.tmp3421)
%.tmp3423 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3424 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3423, i32 0, i32 6
%.tmp3425 = load i8*, i8** %curr_mod
store i8* %.tmp3425, i8** %.tmp3424
br label %.if.end.3371
.if.false.3371:
%.tmp3426 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3427 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3428 = load i8*, i8** %asname
%.tmp3429 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp3430 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp3429, i32 0, i32 0
%.tmp3431 = load i8*, i8** %.tmp3430
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*,i8*) @m1791$define_module.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp.cp(%m1791$.CompilerCtx.type* %.tmp3426, %m261$.Node.type* %.tmp3427, i8* %.tmp3428, i8* %.tmp3431)
br label %.if.end.3371
.if.end.3371:
br label %.if.end.3267
.if.false.3267:
br label %.if.end.3267
.if.end.3267:
br label %.if.end.3264
.if.false.3264:
%.tmp3432 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3433 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3435 = getelementptr [40 x i8], [40 x i8]*@.str3434, i32 0, i32 0
%.tmp3436 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp3432, %m261$.Node.type* %.tmp3433, i8* %.tmp3435)
%.tmp3437 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3438 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3437, i32 0, i32 0
%.tmp3439 = load i8*, i8** %.tmp3438
%.tmp3440 = call i32(i8*,...) @printf(i8* %.tmp3436, i8* %.tmp3439)
br label %.if.end.3264
.if.end.3264:
br label %.if.end.3051
.if.end.3051:
br label %.if.end.2918
.if.end.2918:
br label %.if.end.2825
.if.end.2825:
br label %.if.end.2763
.if.end.2763:
br label %.if.end.2755
.if.end.2755:
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
%.tmp3441 = getelementptr i8*, i8** %buf, i32 0
%.tmp3443 = getelementptr [31 x i8], [31 x i8]*@.str3442, i32 0, i32 0
%.tmp3444 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3445 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3444, i32 0, i32 6
%.tmp3446 = load i8*, i8** %.tmp3445
%.tmp3447 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3448 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3447, i32 0, i32 3
%.tmp3449 = load i32, i32* %.tmp3448
%.tmp3450 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3451 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3450, i32 0, i32 4
%.tmp3452 = load i32, i32* %.tmp3451
%.tmp3453 = load i8*, i8** %msg
%.tmp3454 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3441, i8* %.tmp3443, i8* %.tmp3446, i32 %.tmp3449, i32 %.tmp3452, i8* %.tmp3453)
%.tmp3455 = load i8*, i8** %buf
ret i8* %.tmp3455
}
define void @m1791$compile_fn_params.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.fn_params.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%fn_params = alloca %m261$.Node.type*
store %m261$.Node.type* %.fn_params.arg, %m261$.Node.type** %fn_params
%param_type = alloca %m1791$.Type.type*
%.tmp3457 = load %m261$.Node.type*, %m261$.Node.type** %fn_params
%param_ptr = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3457, %m261$.Node.type** %param_ptr
br label %.for.start.3456
.for.start.3456:
%.tmp3458 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3459 = icmp ne %m261$.Node.type* %.tmp3458, null
br i1 %.tmp3459, label %.for.continue.3456, label %.for.end.3456
.for.continue.3456:
%.tmp3460 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3461 = load %m261$.Node.type*, %m261$.Node.type** %fn_params
%.tmp3462 = icmp ne %m261$.Node.type* %.tmp3460, %.tmp3461
br i1 %.tmp3462, label %.if.true.3463, label %.if.false.3463
.if.true.3463:
%.tmp3464 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3465 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3464, i32 0, i32 7
%.tmp3466 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3465
store %m261$.Node.type* %.tmp3466, %m261$.Node.type** %param_ptr
br label %.if.end.3463
.if.false.3463:
br label %.if.end.3463
.if.end.3463:
%.tmp3467 = load %m261$.Node.type*, %m261$.Node.type** %fn_params
%.tmp3468 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp3467)
%param_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3468, %m1791$.AssignableInfo.type** %param_info
%.tmp3469 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %param_info
%.tmp3470 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3469, i32 0, i32 2
%.tmp3472 = getelementptr [9 x i8], [9 x i8]*@.str3471, i32 0, i32 0
store i8* %.tmp3472, i8** %.tmp3470
%.tmp3473 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3474 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3473, i32 0, i32 0
%.tmp3475 = load i8*, i8** %.tmp3474
%.tmp3477 = getelementptr [5 x i8], [5 x i8]*@.str3476, i32 0, i32 0
%.tmp3478 = call i32(i8*,i8*) @strcmp(i8* %.tmp3475, i8* %.tmp3477)
%.tmp3479 = icmp eq i32 %.tmp3478, 0
br i1 %.tmp3479, label %.if.true.3480, label %.if.false.3480
.if.true.3480:
%.tmp3481 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3482 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3483 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3482, i32 0, i32 6
%.tmp3484 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3483
%.tmp3485 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3481, %m261$.Node.type* %.tmp3484)
store %m1791$.Type.type* %.tmp3485, %m1791$.Type.type** %param_type
%.tmp3486 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3487 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3486, i32 0, i32 7
%.tmp3488 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3487
store %m261$.Node.type* %.tmp3488, %m261$.Node.type** %param_ptr
br label %.if.end.3480
.if.false.3480:
br label %.if.end.3480
.if.end.3480:
%.tmp3489 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %param_info
%.tmp3490 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3489, i32 0, i32 3
%.tmp3491 = load %m1791$.Type.type*, %m1791$.Type.type** %param_type
store %m1791$.Type.type* %.tmp3491, %m1791$.Type.type** %.tmp3490
%.tmp3492 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3493 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3492, i32 0, i32 1
%.tmp3494 = load i8*, i8** %.tmp3493
%var_name = alloca i8*
store i8* %.tmp3494, i8** %var_name
%.tmp3495 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %param_info
%.tmp3496 = load i8, i8* @SCOPE_LOCAL
%.tmp3497 = load i8*, i8** %var_name
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp3495, i8 %.tmp3496, i8* %.tmp3497)
%.tmp3498 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3499 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %param_info
%.tmp3500 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3499, i32 0, i32 3
%.tmp3501 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3500
%.tmp3502 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3498, %m1791$.Type.type* %.tmp3501)
%param_info_tr = alloca i8*
store i8* %.tmp3502, i8** %param_info_tr
%.tmp3503 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3504 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3503, i32 0, i32 1
%.tmp3505 = load %m0$.File.type*, %m0$.File.type** %.tmp3504
%.tmp3507 = getelementptr [16 x i8], [16 x i8]*@.str3506, i32 0, i32 0
%.tmp3508 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %param_info
%.tmp3509 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3508)
%.tmp3510 = load i8*, i8** %param_info_tr
%.tmp3511 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3505, i8* %.tmp3507, i8* %.tmp3509, i8* %.tmp3510)
%.tmp3512 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3513 = load i8*, i8** %var_name
%.tmp3514 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %param_info
call void(%m1791$.CompilerCtx.type*,i8*,%m1791$.AssignableInfo.type*) @m1791$define_assignable.v.m1791$.CompilerCtx.typep.cp.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp3512, i8* %.tmp3513, %m1791$.AssignableInfo.type* %.tmp3514)
%.tmp3515 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3516 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3515, i32 0, i32 1
%.tmp3517 = load %m0$.File.type*, %m0$.File.type** %.tmp3516
%.tmp3519 = getelementptr [28 x i8], [28 x i8]*@.str3518, i32 0, i32 0
%.tmp3520 = load i8*, i8** %param_info_tr
%.tmp3521 = load i8*, i8** %var_name
%.tmp3522 = load i8*, i8** %param_info_tr
%.tmp3523 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %param_info
%.tmp3524 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3523)
%.tmp3525 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3517, i8* %.tmp3519, i8* %.tmp3520, i8* %.tmp3521, i8* %.tmp3522, i8* %.tmp3524)
%.tmp3526 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp3527 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3526, i32 0, i32 7
%.tmp3528 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3527
store %m261$.Node.type* %.tmp3528, %m261$.Node.type** %param_ptr
br label %.for.start.3456
.for.end.3456:
ret void
}
define void @m1791$compile_block.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp3529 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
call void(%m1791$.CompilerCtx.type*) @m1791$push_scope.v.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp3529)
%.tmp3531 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3532 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3531, i32 0, i32 6
%.tmp3533 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3532
%b = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3533, %m261$.Node.type** %b
br label %.for.start.3530
.for.start.3530:
%.tmp3534 = load %m261$.Node.type*, %m261$.Node.type** %b
%.tmp3535 = icmp ne %m261$.Node.type* %.tmp3534, null
br i1 %.tmp3535, label %.for.continue.3530, label %.for.end.3530
.for.continue.3530:
%.tmp3536 = load %m261$.Node.type*, %m261$.Node.type** %b
%.tmp3537 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3536, i32 0, i32 0
%.tmp3538 = load i8*, i8** %.tmp3537
%.tmp3540 = getelementptr [11 x i8], [11 x i8]*@.str3539, i32 0, i32 0
%.tmp3541 = call i32(i8*,i8*) @strcmp(i8* %.tmp3538, i8* %.tmp3540)
%.tmp3542 = icmp eq i32 %.tmp3541, 0
br i1 %.tmp3542, label %.if.true.3543, label %.if.false.3543
.if.true.3543:
%.tmp3544 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3545 = load %m261$.Node.type*, %m261$.Node.type** %b
%.tmp3546 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3545, i32 0, i32 6
%.tmp3547 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3546
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_expression.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3544, %m261$.Node.type* %.tmp3547)
br label %.if.end.3543
.if.false.3543:
br label %.if.end.3543
.if.end.3543:
%.tmp3548 = load %m261$.Node.type*, %m261$.Node.type** %b
%.tmp3549 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3548, i32 0, i32 7
%.tmp3550 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3549
store %m261$.Node.type* %.tmp3550, %m261$.Node.type** %b
br label %.for.start.3530
.for.end.3530:
%.tmp3551 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
call void(%m1791$.CompilerCtx.type*) @m1791$pop_scope.v.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp3551)
ret void
}
define %m1791$.AssignableInfo.type* @m1791$compile_builtin.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp3552 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3553 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3552, i32 0, i32 6
%.tmp3554 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3553
%.tmp3555 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3554, i32 0, i32 6
%.tmp3556 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3555
%dotted = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3556, %m261$.Node.type** %dotted
%.tmp3557 = load %m261$.Node.type*, %m261$.Node.type** %dotted
%.tmp3558 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3557, i32 0, i32 7
%.tmp3559 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3558
%.tmp3560 = icmp ne %m261$.Node.type* %.tmp3559, null
br i1 %.tmp3560, label %.if.true.3561, label %.if.false.3561
.if.true.3561:
%.tmp3562 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp3562
br label %.if.end.3561
.if.false.3561:
br label %.if.end.3561
.if.end.3561:
%.tmp3563 = load %m261$.Node.type*, %m261$.Node.type** %dotted
%.tmp3564 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3563, i32 0, i32 1
%.tmp3565 = load i8*, i8** %.tmp3564
%.tmp3567 = getelementptr [7 x i8], [7 x i8]*@.str3566, i32 0, i32 0
%.tmp3568 = call i32(i8*,i8*) @strcmp(i8* %.tmp3565, i8* %.tmp3567)
%.tmp3569 = icmp eq i32 %.tmp3568, 0
br i1 %.tmp3569, label %.if.true.3570, label %.if.false.3570
.if.true.3570:
%.tmp3571 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3573 = getelementptr [8 x i8], [8 x i8]*@.str3572, i32 0, i32 0
%.tmp3574 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3571, i8* %.tmp3573)
%args = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3574, %m261$.Node.type** %args
%.tmp3575 = load %m261$.Node.type*, %m261$.Node.type** %args
%.tmp3576 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3575, i32 0, i32 6
%.tmp3577 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3576
%.tmp3579 = getelementptr [11 x i8], [11 x i8]*@.str3578, i32 0, i32 0
%.tmp3580 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3577, i8* %.tmp3579)
%value = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3580, %m261$.Node.type** %value
%.tmp3581 = load %m261$.Node.type*, %m261$.Node.type** %value
%.tmp3582 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3581, i32 0, i32 6
%.tmp3583 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3582
%.tmp3584 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3583, i32 0, i32 6
%.tmp3585 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3584
%.tmp3586 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3585, i32 0, i32 6
%.tmp3587 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3586
%.tmp3588 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3587, i32 0, i32 6
%.tmp3589 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3588
store %m261$.Node.type* %.tmp3589, %m261$.Node.type** %value
%.tmp3590 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3591 = call i32(%m1791$.CompilerCtx.type*) @m1791$new_uid.i.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp3590)
%tmp_id = alloca i32
store i32 %.tmp3591, i32* %tmp_id
%.tmp3592 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3593 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp3592)
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3593, %m1791$.AssignableInfo.type** %info
%.tmp3594 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3595 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp3594, %m1791$.AssignableInfo.type* %.tmp3595)
%.tmp3596 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3597 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3596, i32 0, i32 3
%.tmp3598 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp3598, %m1791$.Type.type** %.tmp3597
%.tmp3599 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3600 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3599, i32 0, i32 3
%.tmp3601 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3600
%.tmp3602 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3601, i32 0, i32 0
%.tmp3604 = getelementptr [4 x i8], [4 x i8]*@.str3603, i32 0, i32 0
store i8* %.tmp3604, i8** %.tmp3602
%.tmp3605 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3606 = load %m261$.Node.type*, %m261$.Node.type** %value
%.tmp3607 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3605, %m261$.Node.type* %.tmp3606)
%inspected_type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp3607, %m1791$.Type.type** %inspected_type
%.tmp3608 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3609 = load %m1791$.Type.type*, %m1791$.Type.type** %inspected_type
%.tmp3610 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3608, %m1791$.Type.type* %.tmp3609)
%type_as_str = alloca i8*
store i8* %.tmp3610, i8** %type_as_str
%.tmp3611 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3612 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3611, i32 0, i32 1
%.tmp3613 = load %m0$.File.type*, %m0$.File.type** %.tmp3612
%.tmp3615 = getelementptr [46 x i8], [46 x i8]*@.str3614, i32 0, i32 0
%.tmp3616 = load i32, i32* %tmp_id
%.tmp3617 = load i8*, i8** %type_as_str
%.tmp3618 = load i8*, i8** %type_as_str
%.tmp3619 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3613, i8* %.tmp3615, i32 %.tmp3616, i8* %.tmp3617, i8* %.tmp3618)
%.tmp3620 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3621 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3620, i32 0, i32 1
%.tmp3622 = load %m0$.File.type*, %m0$.File.type** %.tmp3621
%.tmp3624 = getelementptr [35 x i8], [35 x i8]*@.str3623, i32 0, i32 0
%.tmp3625 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3626 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3625)
%.tmp3627 = load i8*, i8** %type_as_str
%.tmp3628 = load i32, i32* %tmp_id
%.tmp3629 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3622, i8* %.tmp3624, i8* %.tmp3626, i8* %.tmp3627, i32 %.tmp3628)
%.tmp3630 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
ret %m1791$.AssignableInfo.type* %.tmp3630
br label %.if.end.3570
.if.false.3570:
br label %.if.end.3570
.if.end.3570:
%.tmp3631 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp3631
}
define %m1791$.AssignableInfo.type* @m1791$compile_fn_call.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp3632 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3633 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3634 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_builtin.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3632, %m261$.Node.type* %.tmp3633)
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3634, %m1791$.AssignableInfo.type** %info
%.tmp3635 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3636 = icmp ne %m1791$.AssignableInfo.type* %.tmp3635, null
br i1 %.tmp3636, label %.if.true.3637, label %.if.false.3637
.if.true.3637:
%.tmp3638 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
ret %m1791$.AssignableInfo.type* %.tmp3638
br label %.if.end.3637
.if.false.3637:
br label %.if.end.3637
.if.end.3637:
%.tmp3639 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3640 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3641 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_addr.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3639, %m261$.Node.type* %.tmp3640)
store %m1791$.AssignableInfo.type* %.tmp3641, %m1791$.AssignableInfo.type** %info
%.tmp3642 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3643 = icmp eq %m1791$.AssignableInfo.type* %.tmp3642, null
br i1 %.tmp3643, label %.if.true.3644, label %.if.false.3644
.if.true.3644:
%.tmp3645 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp3645, label %.if.true.3646, label %.if.false.3646
.if.true.3646:
%.tmp3647 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3648 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3650 = getelementptr [35 x i8], [35 x i8]*@.str3649, i32 0, i32 0
%.tmp3651 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp3647, %m261$.Node.type* %.tmp3648, i8* %.tmp3650)
%.tmp3652 = call i32(i8*,...) @printf(i8* %.tmp3651)
br label %.if.end.3646
.if.false.3646:
br label %.if.end.3646
.if.end.3646:
%.tmp3653 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp3653
br label %.if.end.3644
.if.false.3644:
br label %.if.end.3644
.if.end.3644:
%.tmp3654 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3656 = getelementptr [8 x i8], [8 x i8]*@.str3655, i32 0, i32 0
%.tmp3657 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3654, i8* %.tmp3656)
%args = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3657, %m261$.Node.type** %args
%.tmp3659 = getelementptr [1 x i8], [1 x i8]*@.str3658, i32 0, i32 0
%params_buff = alloca i8*
store i8* %.tmp3659, i8** %params_buff
%tmp = alloca i8*
%.tmp3660 = load %m261$.Node.type*, %m261$.Node.type** %args
%.tmp3661 = icmp ne %m261$.Node.type* %.tmp3660, null
br i1 %.tmp3661, label %.if.true.3662, label %.if.false.3662
.if.true.3662:
%.tmp3663 = load %m261$.Node.type*, %m261$.Node.type** %args
%.tmp3664 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3663, i32 0, i32 6
%.tmp3665 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3664
%.tmp3667 = getelementptr [11 x i8], [11 x i8]*@.str3666, i32 0, i32 0
%.tmp3668 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3665, i8* %.tmp3667)
%start = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3668, %m261$.Node.type** %start
%.tmp3670 = load %m261$.Node.type*, %m261$.Node.type** %start
%pp = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3670, %m261$.Node.type** %pp
br label %.for.start.3669
.for.start.3669:
%.tmp3671 = load %m261$.Node.type*, %m261$.Node.type** %pp
%.tmp3672 = icmp ne %m261$.Node.type* %.tmp3671, null
br i1 %.tmp3672, label %.for.continue.3669, label %.for.end.3669
.for.continue.3669:
%.tmp3673 = load %m261$.Node.type*, %m261$.Node.type** %pp
%.tmp3674 = load %m261$.Node.type*, %m261$.Node.type** %start
%.tmp3675 = icmp ne %m261$.Node.type* %.tmp3673, %.tmp3674
br i1 %.tmp3675, label %.if.true.3676, label %.if.false.3676
.if.true.3676:
%.tmp3677 = getelementptr i8*, i8** %tmp, i32 0
%.tmp3679 = getelementptr [5 x i8], [5 x i8]*@.str3678, i32 0, i32 0
%.tmp3680 = load i8*, i8** %params_buff
%.tmp3681 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3677, i8* %.tmp3679, i8* %.tmp3680)
%.tmp3682 = load i8*, i8** %params_buff
%tmp_buff = alloca i8*
store i8* %.tmp3682, i8** %tmp_buff
%.tmp3683 = load i8*, i8** %tmp
store i8* %.tmp3683, i8** %params_buff
%.tmp3684 = load i8*, i8** %tmp_buff
store i8* %.tmp3684, i8** %tmp
%.tmp3685 = load i8*, i8** %tmp
call void(i8*) @free(i8* %.tmp3685)
br label %.if.end.3676
.if.false.3676:
br label %.if.end.3676
.if.end.3676:
%.tmp3686 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3687 = load %m261$.Node.type*, %m261$.Node.type** %pp
%.tmp3688 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3686, %m261$.Node.type* %.tmp3687)
%a_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3688, %m1791$.AssignableInfo.type** %a_info
%.tmp3689 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp3690 = icmp eq %m1791$.AssignableInfo.type* %.tmp3689, null
br i1 %.tmp3690, label %.if.true.3691, label %.if.false.3691
.if.true.3691:
%.tmp3692 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp3692
br label %.if.end.3691
.if.false.3691:
br label %.if.end.3691
.if.end.3691:
%.tmp3693 = getelementptr i8*, i8** %params_buff, i32 0
%.tmp3695 = getelementptr [8 x i8], [8 x i8]*@.str3694, i32 0, i32 0
%.tmp3696 = load i8*, i8** %params_buff
%.tmp3697 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3698 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp3699 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3698, i32 0, i32 3
%.tmp3700 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3699
%.tmp3701 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3697, %m1791$.Type.type* %.tmp3700)
%.tmp3702 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp3703 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3702)
%.tmp3704 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3693, i8* %.tmp3695, i8* %.tmp3696, i8* %.tmp3701, i8* %.tmp3703)
%.tmp3705 = load %m261$.Node.type*, %m261$.Node.type** %pp
%.tmp3706 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3705, i32 0, i32 7
%.tmp3707 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3706
store %m261$.Node.type* %.tmp3707, %m261$.Node.type** %pp
%.tmp3708 = load %m261$.Node.type*, %m261$.Node.type** %pp
%.tmp3710 = getelementptr [11 x i8], [11 x i8]*@.str3709, i32 0, i32 0
%.tmp3711 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3708, i8* %.tmp3710)
store %m261$.Node.type* %.tmp3711, %m261$.Node.type** %pp
br label %.for.start.3669
.for.end.3669:
br label %.if.end.3662
.if.false.3662:
br label %.if.end.3662
.if.end.3662:
%.tmp3712 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3713 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3714 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3713, i32 0, i32 3
%.tmp3715 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3714
%.tmp3716 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3715, i32 0, i32 3
%.tmp3717 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3716
%.tmp3718 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3712, %m1791$.Type.type* %.tmp3717)
%.tmp3720 = getelementptr [5 x i8], [5 x i8]*@.str3719, i32 0, i32 0
%.tmp3721 = call i32(i8*,i8*) @strcmp(i8* %.tmp3718, i8* %.tmp3720)
%.tmp3722 = icmp eq i32 %.tmp3721, 0
br i1 %.tmp3722, label %.if.true.3723, label %.if.false.3723
.if.true.3723:
%.tmp3724 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3725 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3724, i32 0, i32 1
%.tmp3726 = load %m0$.File.type*, %m0$.File.type** %.tmp3725
%.tmp3728 = getelementptr [16 x i8], [16 x i8]*@.str3727, i32 0, i32 0
%.tmp3729 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3730 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3731 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3730, i32 0, i32 3
%.tmp3732 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3731
%.tmp3733 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3729, %m1791$.Type.type* %.tmp3732)
%.tmp3734 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3735 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3734)
%.tmp3736 = load i8*, i8** %params_buff
%.tmp3737 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3726, i8* %.tmp3728, i8* %.tmp3733, i8* %.tmp3735, i8* %.tmp3736)
%.tmp3738 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp3738
br label %.if.end.3723
.if.false.3723:
br label %.if.end.3723
.if.end.3723:
%.tmp3739 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3740 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp3739)
%call_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3740, %m1791$.AssignableInfo.type** %call_info
%.tmp3741 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3742 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %call_info
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp3741, %m1791$.AssignableInfo.type* %.tmp3742)
%.tmp3743 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %call_info
%.tmp3744 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3743, i32 0, i32 3
%.tmp3745 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3746 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3745, i32 0, i32 3
%.tmp3747 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3746
%.tmp3748 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3747, i32 0, i32 3
%.tmp3749 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3748
%.tmp3750 = call %m1791$.Type.type*(%m1791$.Type.type*) @m1791$type_clone.m1791$.Type.typep.m1791$.Type.typep(%m1791$.Type.type* %.tmp3749)
store %m1791$.Type.type* %.tmp3750, %m1791$.Type.type** %.tmp3744
%.tmp3751 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %call_info
%.tmp3752 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3751, i32 0, i32 3
%.tmp3753 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3752
%.tmp3754 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp3753, i32 0, i32 4
store %m1791$.Type.type* null, %m1791$.Type.type** %.tmp3754
%.tmp3755 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3756 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3755, i32 0, i32 1
%.tmp3757 = load %m0$.File.type*, %m0$.File.type** %.tmp3756
%.tmp3759 = getelementptr [21 x i8], [21 x i8]*@.str3758, i32 0, i32 0
%.tmp3760 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %call_info
%.tmp3761 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3760)
%.tmp3762 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3763 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3764 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3763, i32 0, i32 3
%.tmp3765 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3764
%.tmp3766 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3762, %m1791$.Type.type* %.tmp3765)
%.tmp3767 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3768 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3767)
%.tmp3769 = load i8*, i8** %params_buff
%.tmp3770 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3757, i8* %.tmp3759, i8* %.tmp3761, i8* %.tmp3766, i8* %.tmp3768, i8* %.tmp3769)
%.tmp3771 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %call_info
%.tmp3772 = bitcast %m1791$.AssignableInfo.type* %.tmp3771 to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp3772
}
define void @m1791$compile_expression.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%err_msg = alloca i8*
%.tmp3773 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3774 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3773, i32 0, i32 0
%.tmp3775 = load i8*, i8** %.tmp3774
%expr_type = alloca i8*
store i8* %.tmp3775, i8** %expr_type
%.tmp3776 = bitcast ptr null to %m1791$.AssignableInfo.type*
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3776, %m1791$.AssignableInfo.type** %info
%assignable = alloca %m261$.Node.type*
%.tmp3777 = bitcast ptr null to %m1791$.AssignableInfo.type*
%a_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3777, %m1791$.AssignableInfo.type** %a_info
%.tmp3778 = load i8*, i8** %expr_type
%.tmp3780 = getelementptr [7 x i8], [7 x i8]*@.str3779, i32 0, i32 0
%.tmp3781 = call i32(i8*,i8*) @strcmp(i8* %.tmp3778, i8* %.tmp3780)
%.tmp3782 = icmp eq i32 %.tmp3781, 0
br i1 %.tmp3782, label %.if.true.3783, label %.if.false.3783
.if.true.3783:
%.tmp3784 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3785 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3784, i32 0, i32 6
%.tmp3786 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3785
%.tmp3787 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3786, i32 0, i32 7
%.tmp3788 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3787
%.tmp3789 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3788, i32 0, i32 0
%.tmp3790 = load i8*, i8** %.tmp3789
%.tmp3792 = getelementptr [3 x i8], [3 x i8]*@.str3791, i32 0, i32 0
%.tmp3793 = call i32(i8*,i8*) @strcmp(i8* %.tmp3790, i8* %.tmp3792)
%.tmp3794 = icmp ne i32 %.tmp3793, 0
br i1 %.tmp3794, label %.if.true.3795, label %.if.false.3795
.if.true.3795:
%.tmp3796 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3797 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3798 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3797, i32 0, i32 6
%.tmp3799 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3798
%.tmp3800 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3799, i32 0, i32 7
%.tmp3801 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3800
%.tmp3802 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3796, %m261$.Node.type* %.tmp3801)
store %m1791$.AssignableInfo.type* %.tmp3802, %m1791$.AssignableInfo.type** %info
%.tmp3803 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3804 = icmp eq %m1791$.AssignableInfo.type* %.tmp3803, null
br i1 %.tmp3804, label %.if.true.3805, label %.if.false.3805
.if.true.3805:
ret void
br label %.if.end.3805
.if.false.3805:
br label %.if.end.3805
.if.end.3805:
%.tmp3806 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3807 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3806, i32 0, i32 1
%.tmp3808 = load %m0$.File.type*, %m0$.File.type** %.tmp3807
%.tmp3810 = getelementptr [11 x i8], [11 x i8]*@.str3809, i32 0, i32 0
%.tmp3811 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3812 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3813 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3812, i32 0, i32 3
%.tmp3814 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3813
%.tmp3815 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3811, %m1791$.Type.type* %.tmp3814)
%.tmp3816 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp3817 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3816)
%.tmp3818 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3808, i8* %.tmp3810, i8* %.tmp3815, i8* %.tmp3817)
br label %.if.end.3795
.if.false.3795:
%.tmp3819 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3820 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3819, i32 0, i32 1
%.tmp3821 = load %m0$.File.type*, %m0$.File.type** %.tmp3820
%.tmp3823 = getelementptr [10 x i8], [10 x i8]*@.str3822, i32 0, i32 0
%.tmp3824 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3821, i8* %.tmp3823)
br label %.if.end.3795
.if.end.3795:
br label %.if.end.3783
.if.false.3783:
%.tmp3825 = load i8*, i8** %expr_type
%.tmp3827 = getelementptr [3 x i8], [3 x i8]*@.str3826, i32 0, i32 0
%.tmp3828 = call i32(i8*,i8*) @strcmp(i8* %.tmp3825, i8* %.tmp3827)
%.tmp3829 = icmp eq i32 %.tmp3828, 0
br i1 %.tmp3829, label %.if.true.3830, label %.if.false.3830
.if.true.3830:
br label %.if.end.3830
.if.false.3830:
%.tmp3831 = load i8*, i8** %expr_type
%.tmp3833 = getelementptr [8 x i8], [8 x i8]*@.str3832, i32 0, i32 0
%.tmp3834 = call i32(i8*,i8*) @strcmp(i8* %.tmp3831, i8* %.tmp3833)
%.tmp3835 = icmp eq i32 %.tmp3834, 0
br i1 %.tmp3835, label %.if.true.3836, label %.if.false.3836
.if.true.3836:
%.tmp3837 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3838 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3839 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3838, i32 0, i32 6
%.tmp3840 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3839
%.tmp3841 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_fn_call.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3837, %m261$.Node.type* %.tmp3840)
br label %.if.end.3836
.if.false.3836:
%.tmp3842 = load i8*, i8** %expr_type
%.tmp3844 = getelementptr [12 x i8], [12 x i8]*@.str3843, i32 0, i32 0
%.tmp3845 = call i32(i8*,i8*) @strcmp(i8* %.tmp3842, i8* %.tmp3844)
%.tmp3846 = icmp eq i32 %.tmp3845, 0
br i1 %.tmp3846, label %.if.true.3847, label %.if.false.3847
.if.true.3847:
%.tmp3848 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3849 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3850 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_declaration.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3848, %m261$.Node.type* %.tmp3849)
br label %.if.end.3847
.if.false.3847:
%.tmp3851 = load i8*, i8** %expr_type
%.tmp3853 = getelementptr [11 x i8], [11 x i8]*@.str3852, i32 0, i32 0
%.tmp3854 = call i32(i8*,i8*) @strcmp(i8* %.tmp3851, i8* %.tmp3853)
%.tmp3855 = icmp eq i32 %.tmp3854, 0
br i1 %.tmp3855, label %.if.true.3856, label %.if.false.3856
.if.true.3856:
%.tmp3857 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3858 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3857, i32 0, i32 6
%.tmp3859 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3858
%.tmp3861 = getelementptr [11 x i8], [11 x i8]*@.str3860, i32 0, i32 0
%.tmp3862 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp3859, i8* %.tmp3861)
store %m261$.Node.type* %.tmp3862, %m261$.Node.type** %assignable
%.tmp3863 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3864 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3865 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3864, i32 0, i32 6
%.tmp3866 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3865
%.tmp3867 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_addr.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3863, %m261$.Node.type* %.tmp3866)
%dest = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp3867, %m1791$.AssignableInfo.type** %dest
%.tmp3868 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %dest
%.tmp3869 = icmp eq %m1791$.AssignableInfo.type* %.tmp3868, null
br i1 %.tmp3869, label %.if.true.3870, label %.if.false.3870
.if.true.3870:
%.tmp3871 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp3873 = getelementptr [34 x i8], [34 x i8]*@.str3872, i32 0, i32 0
%.tmp3874 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3875 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3874, i32 0, i32 6
%.tmp3876 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3875
%.tmp3877 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3876, i32 0, i32 6
%.tmp3878 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3877
%.tmp3879 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3878, i32 0, i32 6
%.tmp3880 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3879
%.tmp3881 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3880, i32 0, i32 1
%.tmp3882 = load i8*, i8** %.tmp3881
%.tmp3883 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp3871, i8* %.tmp3873, i8* %.tmp3882)
%.tmp3884 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3885 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3886 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp3884, %m261$.Node.type* %.tmp3885, i8* %.tmp3886)
ret void
br label %.if.end.3870
.if.false.3870:
br label %.if.end.3870
.if.end.3870:
%.tmp3887 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3888 = load %m261$.Node.type*, %m261$.Node.type** %assignable
%.tmp3889 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3887, %m261$.Node.type* %.tmp3888)
store %m1791$.AssignableInfo.type* %.tmp3889, %m1791$.AssignableInfo.type** %a_info
%.tmp3890 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp3891 = icmp eq %m1791$.AssignableInfo.type* %.tmp3890, null
br i1 %.tmp3891, label %.if.true.3892, label %.if.false.3892
.if.true.3892:
ret void
br label %.if.end.3892
.if.false.3892:
br label %.if.end.3892
.if.end.3892:
%.tmp3893 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3894 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %dest
%.tmp3895 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3894, i32 0, i32 3
%.tmp3896 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3895
%.tmp3897 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3893, %m1791$.Type.type* %.tmp3896)
%dest_tr = alloca i8*
store i8* %.tmp3897, i8** %dest_tr
%.tmp3898 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3899 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp3900 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp3899, i32 0, i32 3
%.tmp3901 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp3900
%.tmp3902 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp3898, %m1791$.Type.type* %.tmp3901)
%src_tr = alloca i8*
store i8* %.tmp3902, i8** %src_tr
%.tmp3903 = load i8*, i8** %src_tr
%.tmp3905 = getelementptr [4 x i8], [4 x i8]*@.str3904, i32 0, i32 0
%.tmp3906 = call i32(i8*,i8*) @strcmp(i8* %.tmp3903, i8* %.tmp3905)
%.tmp3907 = icmp eq i32 %.tmp3906, 0
br i1 %.tmp3907, label %.if.true.3908, label %.if.false.3908
.if.true.3908:
%.tmp3909 = load i8*, i8** %dest_tr
store i8* %.tmp3909, i8** %src_tr
br label %.if.end.3908
.if.false.3908:
br label %.if.end.3908
.if.end.3908:
%.tmp3910 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3911 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3910, i32 0, i32 1
%.tmp3912 = load %m0$.File.type*, %m0$.File.type** %.tmp3911
%.tmp3914 = getelementptr [21 x i8], [21 x i8]*@.str3913, i32 0, i32 0
%.tmp3915 = load i8*, i8** %src_tr
%.tmp3916 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp3917 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3916)
%.tmp3918 = load i8*, i8** %dest_tr
%.tmp3919 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %dest
%.tmp3920 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp3919)
%.tmp3921 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3912, i8* %.tmp3914, i8* %.tmp3915, i8* %.tmp3917, i8* %.tmp3918, i8* %.tmp3920)
br label %.if.end.3856
.if.false.3856:
%.tmp3922 = load i8*, i8** %expr_type
%.tmp3924 = getelementptr [9 x i8], [9 x i8]*@.str3923, i32 0, i32 0
%.tmp3925 = call i32(i8*,i8*) @strcmp(i8* %.tmp3922, i8* %.tmp3924)
%.tmp3926 = icmp eq i32 %.tmp3925, 0
br i1 %.tmp3926, label %.if.true.3927, label %.if.false.3927
.if.true.3927:
%.tmp3928 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3929 = load %m261$.Node.type*, %m261$.Node.type** %stmt
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_if_block.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3928, %m261$.Node.type* %.tmp3929)
br label %.if.end.3927
.if.false.3927:
%.tmp3930 = load i8*, i8** %expr_type
%.tmp3932 = getelementptr [9 x i8], [9 x i8]*@.str3931, i32 0, i32 0
%.tmp3933 = call i32(i8*,i8*) @strcmp(i8* %.tmp3930, i8* %.tmp3932)
%.tmp3934 = icmp eq i32 %.tmp3933, 0
br i1 %.tmp3934, label %.if.true.3935, label %.if.false.3935
.if.true.3935:
%.tmp3936 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3937 = load %m261$.Node.type*, %m261$.Node.type** %stmt
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_for_loop.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3936, %m261$.Node.type* %.tmp3937)
br label %.if.end.3935
.if.false.3935:
%.tmp3938 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3939 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3941 = getelementptr [34 x i8], [34 x i8]*@.str3940, i32 0, i32 0
%.tmp3942 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp3938, %m261$.Node.type* %.tmp3939, i8* %.tmp3941)
%.tmp3943 = load i8*, i8** %expr_type
%.tmp3944 = call i32(i8*,...) @printf(i8* %.tmp3942, i8* %.tmp3943)
br label %.if.end.3935
.if.end.3935:
br label %.if.end.3927
.if.end.3927:
br label %.if.end.3856
.if.end.3856:
br label %.if.end.3847
.if.end.3847:
br label %.if.end.3836
.if.end.3836:
br label %.if.end.3830
.if.end.3830:
br label %.if.end.3783
.if.end.3783:
ret void
}
define void @m1791$compile_for_loop.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp3945 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3946 = call i32(%m1791$.CompilerCtx.type*) @m1791$new_uid.i.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp3945)
%for_id = alloca i32
store i32 %.tmp3946, i32* %for_id
%.tmp3947 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp3948 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3947, i32 0, i32 6
%.tmp3949 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3948
%.tmp3950 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3949, i32 0, i32 7
%.tmp3951 = load %m261$.Node.type*, %m261$.Node.type** %.tmp3950
%init_stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp3951, %m261$.Node.type** %init_stmt
%.tmp3952 = load %m261$.Node.type*, %m261$.Node.type** %init_stmt
%.tmp3953 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3952, i32 0, i32 0
%.tmp3954 = load i8*, i8** %.tmp3953
%.tmp3956 = getelementptr [12 x i8], [12 x i8]*@.str3955, i32 0, i32 0
%.tmp3957 = call i32(i8*,i8*) @strcmp(i8* %.tmp3954, i8* %.tmp3956)
%.tmp3958 = icmp eq i32 %.tmp3957, 0
br i1 %.tmp3958, label %.if.true.3959, label %.if.false.3959
.if.true.3959:
%.tmp3960 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3961 = load %m261$.Node.type*, %m261$.Node.type** %init_stmt
%.tmp3962 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_declaration.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3960, %m261$.Node.type* %.tmp3961)
br label %.if.end.3959
.if.false.3959:
%.tmp3963 = load %m261$.Node.type*, %m261$.Node.type** %init_stmt
%.tmp3964 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3963, i32 0, i32 0
%.tmp3965 = load i8*, i8** %.tmp3964
%.tmp3967 = getelementptr [11 x i8], [11 x i8]*@.str3966, i32 0, i32 0
%.tmp3968 = call i32(i8*,i8*) @strcmp(i8* %.tmp3965, i8* %.tmp3967)
%.tmp3969 = icmp eq i32 %.tmp3968, 0
br i1 %.tmp3969, label %.if.true.3970, label %.if.false.3970
.if.true.3970:
%.tmp3971 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3972 = load %m261$.Node.type*, %m261$.Node.type** %init_stmt
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_expression.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp3971, %m261$.Node.type* %.tmp3972)
br label %.if.end.3970
.if.false.3970:
%.tmp3973 = load %m261$.Node.type*, %m261$.Node.type** %init_stmt
%.tmp3974 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3973, i32 0, i32 0
%.tmp3975 = load i8*, i8** %.tmp3974
%.tmp3977 = getelementptr [9 x i8], [9 x i8]*@.str3976, i32 0, i32 0
%.tmp3978 = call i32(i8*,i8*) @strcmp(i8* %.tmp3975, i8* %.tmp3977)
%.tmp3979 = icmp eq i32 %.tmp3978, 0
br i1 %.tmp3979, label %.if.true.3980, label %.if.false.3980
.if.true.3980:
br label %.if.end.3980
.if.false.3980:
%.tmp3981 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3982 = load %m261$.Node.type*, %m261$.Node.type** %init_stmt
%.tmp3984 = getelementptr [66 x i8], [66 x i8]*@.str3983, i32 0, i32 0
%.tmp3985 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp3981, %m261$.Node.type* %.tmp3982, i8* %.tmp3984)
%.tmp3986 = load %m261$.Node.type*, %m261$.Node.type** %init_stmt
%.tmp3987 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp3986, i32 0, i32 0
%.tmp3988 = load i8*, i8** %.tmp3987
%.tmp3989 = call i32(i8*,...) @printf(i8* %.tmp3985, i8* %.tmp3988)
ret void
br label %.if.end.3980
.if.end.3980:
br label %.if.end.3970
.if.end.3970:
br label %.if.end.3959
.if.end.3959:
%.tmp3990 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3991 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3990, i32 0, i32 1
%.tmp3992 = load %m0$.File.type*, %m0$.File.type** %.tmp3991
%.tmp3994 = getelementptr [26 x i8], [26 x i8]*@.str3993, i32 0, i32 0
%.tmp3995 = load i32, i32* %for_id
%.tmp3996 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3992, i8* %.tmp3994, i32 %.tmp3995)
%.tmp3997 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp3998 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp3997, i32 0, i32 1
%.tmp3999 = load %m0$.File.type*, %m0$.File.type** %.tmp3998
%.tmp4001 = getelementptr [16 x i8], [16 x i8]*@.str4000, i32 0, i32 0
%.tmp4002 = load i32, i32* %for_id
%.tmp4003 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp3999, i8* %.tmp4001, i32 %.tmp4002)
%.tmp4004 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4005 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4004, i32 0, i32 6
%.tmp4006 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4005
%.tmp4008 = getelementptr [9 x i8], [9 x i8]*@.str4007, i32 0, i32 0
%.tmp4009 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4006, i8* %.tmp4008)
%fst_colon = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4009, %m261$.Node.type** %fst_colon
%.tmp4010 = load %m261$.Node.type*, %m261$.Node.type** %fst_colon
%.tmp4011 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4010, i32 0, i32 7
%.tmp4012 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4011
%condition = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4012, %m261$.Node.type** %condition
%.tmp4013 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4014 = load %m261$.Node.type*, %m261$.Node.type** %condition
%.tmp4015 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4013, %m261$.Node.type* %.tmp4014)
%condition_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4015, %m1791$.AssignableInfo.type** %condition_info
%.tmp4016 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4017 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4016, i32 0, i32 1
%.tmp4018 = load %m0$.File.type*, %m0$.File.type** %.tmp4017
%.tmp4020 = getelementptr [57 x i8], [57 x i8]*@.str4019, i32 0, i32 0
%.tmp4021 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4022 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %condition_info
%.tmp4023 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4022, i32 0, i32 3
%.tmp4024 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4023
%.tmp4025 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4021, %m1791$.Type.type* %.tmp4024)
%.tmp4026 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %condition_info
%.tmp4027 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4026)
%.tmp4028 = load i32, i32* %for_id
%.tmp4029 = load i32, i32* %for_id
%.tmp4030 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4018, i8* %.tmp4020, i8* %.tmp4025, i8* %.tmp4027, i32 %.tmp4028, i32 %.tmp4029)
%.tmp4031 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4032 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4031, i32 0, i32 1
%.tmp4033 = load %m0$.File.type*, %m0$.File.type** %.tmp4032
%.tmp4035 = getelementptr [19 x i8], [19 x i8]*@.str4034, i32 0, i32 0
%.tmp4036 = load i32, i32* %for_id
%.tmp4037 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4033, i8* %.tmp4035, i32 %.tmp4036)
%.tmp4038 = load %m261$.Node.type*, %m261$.Node.type** %fst_colon
%.tmp4039 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4038, i32 0, i32 7
%.tmp4040 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4039
%.tmp4042 = getelementptr [9 x i8], [9 x i8]*@.str4041, i32 0, i32 0
%.tmp4043 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4040, i8* %.tmp4042)
%snd_colon = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4043, %m261$.Node.type** %snd_colon
%.tmp4044 = load %m261$.Node.type*, %m261$.Node.type** %snd_colon
%.tmp4045 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4044, i32 0, i32 7
%.tmp4046 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4045
%increment = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4046, %m261$.Node.type** %increment
%.tmp4047 = load %m261$.Node.type*, %m261$.Node.type** %snd_colon
%.tmp4049 = getelementptr [6 x i8], [6 x i8]*@.str4048, i32 0, i32 0
%.tmp4050 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4047, i8* %.tmp4049)
%for_body = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4050, %m261$.Node.type** %for_body
%.tmp4051 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4052 = load %m261$.Node.type*, %m261$.Node.type** %for_body
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_block.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4051, %m261$.Node.type* %.tmp4052)
%.tmp4053 = load %m261$.Node.type*, %m261$.Node.type** %increment
%.tmp4054 = load %m261$.Node.type*, %m261$.Node.type** %for_body
%.tmp4055 = icmp ne %m261$.Node.type* %.tmp4053, %.tmp4054
br i1 %.tmp4055, label %.if.true.4056, label %.if.false.4056
.if.true.4056:
%.tmp4057 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4058 = load %m261$.Node.type*, %m261$.Node.type** %increment
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_expression.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4057, %m261$.Node.type* %.tmp4058)
br label %.if.end.4056
.if.false.4056:
br label %.if.end.4056
.if.end.4056:
%.tmp4059 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4060 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4059, i32 0, i32 1
%.tmp4061 = load %m0$.File.type*, %m0$.File.type** %.tmp4060
%.tmp4063 = getelementptr [26 x i8], [26 x i8]*@.str4062, i32 0, i32 0
%.tmp4064 = load i32, i32* %for_id
%.tmp4065 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4061, i8* %.tmp4063, i32 %.tmp4064)
%.tmp4066 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4067 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4066, i32 0, i32 1
%.tmp4068 = load %m0$.File.type*, %m0$.File.type** %.tmp4067
%.tmp4070 = getelementptr [14 x i8], [14 x i8]*@.str4069, i32 0, i32 0
%.tmp4071 = load i32, i32* %for_id
%.tmp4072 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4068, i8* %.tmp4070, i32 %.tmp4071)
ret void
}
define %m1791$.AssignableInfo.type* @m1791$compile_declaration.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp4073 = bitcast ptr null to %m1791$.Type.type*
%decl_type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp4073, %m1791$.Type.type** %decl_type
%.tmp4074 = bitcast ptr null to %m1791$.AssignableInfo.type*
%a_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4074, %m1791$.AssignableInfo.type** %a_info
%.tmp4075 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4076 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4075, i32 0, i32 6
%.tmp4077 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4076
%.tmp4078 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4077, i32 0, i32 0
%.tmp4079 = load i8*, i8** %.tmp4078
%.tmp4081 = getelementptr [5 x i8], [5 x i8]*@.str4080, i32 0, i32 0
%.tmp4082 = call i32(i8*,i8*) @strcmp(i8* %.tmp4079, i8* %.tmp4081)
%.tmp4083 = icmp eq i32 %.tmp4082, 0
br i1 %.tmp4083, label %.if.true.4084, label %.if.false.4084
.if.true.4084:
%.tmp4085 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4086 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4087 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4086, i32 0, i32 6
%.tmp4088 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4087
%.tmp4089 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4088, i32 0, i32 6
%.tmp4090 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4089
%.tmp4091 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4085, %m261$.Node.type* %.tmp4090)
store %m1791$.Type.type* %.tmp4091, %m1791$.Type.type** %decl_type
br label %.if.end.4084
.if.false.4084:
br label %.if.end.4084
.if.end.4084:
%.tmp4092 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4093 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4092, i32 0, i32 6
%.tmp4094 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4093
%.tmp4096 = getelementptr [11 x i8], [11 x i8]*@.str4095, i32 0, i32 0
%.tmp4097 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4094, i8* %.tmp4096)
%assignable = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4097, %m261$.Node.type** %assignable
%.tmp4098 = load %m261$.Node.type*, %m261$.Node.type** %assignable
%.tmp4099 = icmp ne %m261$.Node.type* %.tmp4098, null
br i1 %.tmp4099, label %.if.true.4100, label %.if.false.4100
.if.true.4100:
%.tmp4101 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4102 = load %m261$.Node.type*, %m261$.Node.type** %assignable
%.tmp4103 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4101, %m261$.Node.type* %.tmp4102)
store %m1791$.AssignableInfo.type* %.tmp4103, %m1791$.AssignableInfo.type** %a_info
br label %.if.end.4100
.if.false.4100:
br label %.if.end.4100
.if.end.4100:
%.tmp4104 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4105 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp4104)
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4105, %m1791$.AssignableInfo.type** %info
%.tmp4106 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4107 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4106, i32 0, i32 2
%.tmp4109 = getelementptr [9 x i8], [9 x i8]*@.str4108, i32 0, i32 0
store i8* %.tmp4109, i8** %.tmp4107
%.tmp4110 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4111 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4110, i32 0, i32 6
%.tmp4112 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4111
%.tmp4114 = getelementptr [5 x i8], [5 x i8]*@.str4113, i32 0, i32 0
%.tmp4115 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4112, i8* %.tmp4114)
%var_name = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4115, %m261$.Node.type** %var_name
%.tmp4116 = load %m261$.Node.type*, %m261$.Node.type** %var_name
%.tmp4117 = icmp eq %m261$.Node.type* %.tmp4116, null
br i1 %.tmp4117, label %.if.true.4118, label %.if.false.4118
.if.true.4118:
%.tmp4119 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4120 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4122 = getelementptr [31 x i8], [31 x i8]*@.str4121, i32 0, i32 0
%.tmp4123 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4119, %m261$.Node.type* %.tmp4120, i8* %.tmp4122)
%.tmp4124 = call i32(i8*,...) @printf(i8* %.tmp4123)
%.tmp4125 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp4125
br label %.if.end.4118
.if.false.4118:
br label %.if.end.4118
.if.end.4118:
%.tmp4126 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4127 = load i8, i8* @SCOPE_LOCAL
%.tmp4128 = load %m261$.Node.type*, %m261$.Node.type** %var_name
%.tmp4129 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4128, i32 0, i32 1
%.tmp4130 = load i8*, i8** %.tmp4129
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp4126, i8 %.tmp4127, i8* %.tmp4130)
%.tmp4131 = load %m1791$.Type.type*, %m1791$.Type.type** %decl_type
%.tmp4132 = icmp ne %m1791$.Type.type* %.tmp4131, null
br i1 %.tmp4132, label %.if.true.4133, label %.if.false.4133
.if.true.4133:
%.tmp4134 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4135 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4134, i32 0, i32 3
%.tmp4136 = load %m1791$.Type.type*, %m1791$.Type.type** %decl_type
store %m1791$.Type.type* %.tmp4136, %m1791$.Type.type** %.tmp4135
br label %.if.end.4133
.if.false.4133:
%.tmp4137 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4138 = icmp ne %m1791$.AssignableInfo.type* %.tmp4137, null
br i1 %.tmp4138, label %.if.true.4139, label %.if.false.4139
.if.true.4139:
%.tmp4140 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4141 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4140, i32 0, i32 3
%.tmp4142 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4143 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4142, i32 0, i32 3
%.tmp4144 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4143
store %m1791$.Type.type* %.tmp4144, %m1791$.Type.type** %.tmp4141
br label %.if.end.4139
.if.false.4139:
br label %.if.end.4139
.if.end.4139:
br label %.if.end.4133
.if.end.4133:
%.tmp4145 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4146 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4147 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4146, i32 0, i32 3
%.tmp4148 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4147
%.tmp4149 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4145, %m1791$.Type.type* %.tmp4148)
%var_type_repr = alloca i8*
store i8* %.tmp4149, i8** %var_type_repr
%.tmp4150 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4151 = icmp ne %m1791$.AssignableInfo.type* %.tmp4150, null
br i1 %.tmp4151, label %.if.true.4152, label %.if.false.4152
.if.true.4152:
%.tmp4153 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4154 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4155 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4154, i32 0, i32 3
%.tmp4156 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4155
%.tmp4157 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4153, %m1791$.Type.type* %.tmp4156)
%a_type_repr = alloca i8*
store i8* %.tmp4157, i8** %a_type_repr
%type_error = alloca i1
store i1 0, i1* %type_error
%.tmp4158 = load i8*, i8** %a_type_repr
%.tmp4159 = call i32(i8*) @strlen(i8* %.tmp4158)
%.tmp4160 = load i8*, i8** %var_type_repr
%.tmp4161 = call i32(i8*) @strlen(i8* %.tmp4160)
%.tmp4162 = icmp ne i32 %.tmp4159, %.tmp4161
br i1 %.tmp4162, label %.if.true.4163, label %.if.false.4163
.if.true.4163:
store i1 1, i1* %type_error
br label %.if.end.4163
.if.false.4163:
%.tmp4164 = load i8*, i8** %a_type_repr
%.tmp4165 = load i8*, i8** %var_type_repr
%.tmp4166 = call i32(i8*,i8*) @strcmp(i8* %.tmp4164, i8* %.tmp4165)
%.tmp4167 = icmp ne i32 %.tmp4166, 0
br i1 %.tmp4167, label %.if.true.4168, label %.if.false.4168
.if.true.4168:
store i1 1, i1* %type_error
br label %.if.end.4168
.if.false.4168:
br label %.if.end.4168
.if.end.4168:
br label %.if.end.4163
.if.end.4163:
%.tmp4169 = load i1, i1* %type_error
br i1 %.tmp4169, label %.if.true.4170, label %.if.false.4170
.if.true.4170:
%.tmp4171 = bitcast ptr null to i8*
%err_msg = alloca i8*
store i8* %.tmp4171, i8** %err_msg
%.tmp4172 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4174 = getelementptr [49 x i8], [49 x i8]*@.str4173, i32 0, i32 0
%.tmp4175 = load i8*, i8** %a_type_repr
%.tmp4176 = load i8*, i8** %var_type_repr
%.tmp4177 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4172, i8* %.tmp4174, i8* %.tmp4175, i8* %.tmp4176)
%.tmp4178 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4179 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4180 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4178, %m261$.Node.type* %.tmp4179, i8* %.tmp4180)
br label %.if.end.4170
.if.false.4170:
br label %.if.end.4170
.if.end.4170:
br label %.if.end.4152
.if.false.4152:
br label %.if.end.4152
.if.end.4152:
%.tmp4181 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4182 = load %m261$.Node.type*, %m261$.Node.type** %var_name
%.tmp4183 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4182, i32 0, i32 1
%.tmp4184 = load i8*, i8** %.tmp4183
%.tmp4185 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
call void(%m1791$.CompilerCtx.type*,i8*,%m1791$.AssignableInfo.type*) @m1791$define_assignable.v.m1791$.CompilerCtx.typep.cp.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp4181, i8* %.tmp4184, %m1791$.AssignableInfo.type* %.tmp4185)
%.tmp4186 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4187 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4186, i32 0, i32 1
%.tmp4188 = load %m0$.File.type*, %m0$.File.type** %.tmp4187
%.tmp4190 = getelementptr [16 x i8], [16 x i8]*@.str4189, i32 0, i32 0
%.tmp4191 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4192 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4191)
%.tmp4193 = load i8*, i8** %var_type_repr
%.tmp4194 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4188, i8* %.tmp4190, i8* %.tmp4192, i8* %.tmp4193)
%.tmp4195 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4196 = icmp ne %m1791$.AssignableInfo.type* %.tmp4195, null
br i1 %.tmp4196, label %.if.true.4197, label %.if.false.4197
.if.true.4197:
%.tmp4198 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4199 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4198, i32 0, i32 1
%.tmp4200 = load %m0$.File.type*, %m0$.File.type** %.tmp4199
%.tmp4202 = getelementptr [21 x i8], [21 x i8]*@.str4201, i32 0, i32 0
%.tmp4203 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4204 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4205 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4204, i32 0, i32 3
%.tmp4206 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4205
%.tmp4207 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4203, %m1791$.Type.type* %.tmp4206)
%.tmp4208 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4209 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4208)
%.tmp4210 = load i8*, i8** %var_type_repr
%.tmp4211 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4212 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4211)
%.tmp4213 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4200, i8* %.tmp4202, i8* %.tmp4207, i8* %.tmp4209, i8* %.tmp4210, i8* %.tmp4212)
br label %.if.end.4197
.if.false.4197:
br label %.if.end.4197
.if.end.4197:
%.tmp4214 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
ret %m1791$.AssignableInfo.type* %.tmp4214
}
define void @m1791$compile_if_block.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp4215 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4216 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4215, i32 0, i32 6
%.tmp4217 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4216
%.tmp4219 = getelementptr [11 x i8], [11 x i8]*@.str4218, i32 0, i32 0
%.tmp4220 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4217, i8* %.tmp4219)
%assignable = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4220, %m261$.Node.type** %assignable
%.tmp4221 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4222 = load %m261$.Node.type*, %m261$.Node.type** %assignable
%.tmp4223 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4221, %m261$.Node.type* %.tmp4222)
%a_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4223, %m1791$.AssignableInfo.type** %a_info
%.tmp4224 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4225 = icmp eq %m1791$.AssignableInfo.type* %.tmp4224, null
br i1 %.tmp4225, label %.if.true.4226, label %.if.false.4226
.if.true.4226:
ret void
br label %.if.end.4226
.if.false.4226:
br label %.if.end.4226
.if.end.4226:
%.tmp4227 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4228 = call i32(%m1791$.CompilerCtx.type*) @m1791$new_uid.i.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp4227)
%if_id = alloca i32
store i32 %.tmp4228, i32* %if_id
%.tmp4229 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4230 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4229, i32 0, i32 1
%.tmp4231 = load %m0$.File.type*, %m0$.File.type** %.tmp4230
%.tmp4233 = getelementptr [53 x i8], [53 x i8]*@.str4232, i32 0, i32 0
%.tmp4234 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4235 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4236 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4235, i32 0, i32 3
%.tmp4237 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4236
%.tmp4238 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4234, %m1791$.Type.type* %.tmp4237)
%.tmp4239 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %a_info
%.tmp4240 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4239)
%.tmp4241 = load i32, i32* %if_id
%.tmp4242 = load i32, i32* %if_id
%.tmp4243 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4231, i8* %.tmp4233, i8* %.tmp4238, i8* %.tmp4240, i32 %.tmp4241, i32 %.tmp4242)
%.tmp4244 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4245 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4244, i32 0, i32 1
%.tmp4246 = load %m0$.File.type*, %m0$.File.type** %.tmp4245
%.tmp4248 = getelementptr [14 x i8], [14 x i8]*@.str4247, i32 0, i32 0
%.tmp4249 = load i32, i32* %if_id
%.tmp4250 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4246, i8* %.tmp4248, i32 %.tmp4249)
%.tmp4251 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4252 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4251, i32 0, i32 6
%.tmp4253 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4252
%.tmp4255 = getelementptr [6 x i8], [6 x i8]*@.str4254, i32 0, i32 0
%.tmp4256 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4253, i8* %.tmp4255)
%block = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4256, %m261$.Node.type** %block
%.tmp4257 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4258 = load %m261$.Node.type*, %m261$.Node.type** %block
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_block.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4257, %m261$.Node.type* %.tmp4258)
%.tmp4259 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4260 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4259, i32 0, i32 1
%.tmp4261 = load %m0$.File.type*, %m0$.File.type** %.tmp4260
%.tmp4263 = getelementptr [23 x i8], [23 x i8]*@.str4262, i32 0, i32 0
%.tmp4264 = load i32, i32* %if_id
%.tmp4265 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4261, i8* %.tmp4263, i32 %.tmp4264)
%.tmp4266 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4267 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4266, i32 0, i32 1
%.tmp4268 = load %m0$.File.type*, %m0$.File.type** %.tmp4267
%.tmp4270 = getelementptr [15 x i8], [15 x i8]*@.str4269, i32 0, i32 0
%.tmp4271 = load i32, i32* %if_id
%.tmp4272 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4268, i8* %.tmp4270, i32 %.tmp4271)
%.tmp4273 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4274 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4273, i32 0, i32 6
%.tmp4275 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4274
%.tmp4277 = getelementptr [11 x i8], [11 x i8]*@.str4276, i32 0, i32 0
%.tmp4278 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4275, i8* %.tmp4277)
%else_block = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4278, %m261$.Node.type** %else_block
%.tmp4279 = load %m261$.Node.type*, %m261$.Node.type** %else_block
%.tmp4280 = icmp ne %m261$.Node.type* %.tmp4279, null
br i1 %.tmp4280, label %.if.true.4281, label %.if.false.4281
.if.true.4281:
%.tmp4282 = load %m261$.Node.type*, %m261$.Node.type** %else_block
%.tmp4283 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4282, i32 0, i32 6
%.tmp4284 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4283
%.tmp4285 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4284, i32 0, i32 0
%.tmp4286 = load i8*, i8** %.tmp4285
%.tmp4288 = getelementptr [11 x i8], [11 x i8]*@.str4287, i32 0, i32 0
%.tmp4289 = call i32(i8*,i8*) @strcmp(i8* %.tmp4286, i8* %.tmp4288)
%.tmp4290 = icmp eq i32 %.tmp4289, 0
br i1 %.tmp4290, label %.if.true.4291, label %.if.false.4291
.if.true.4291:
%.tmp4292 = load %m261$.Node.type*, %m261$.Node.type** %else_block
%.tmp4293 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4292, i32 0, i32 6
%.tmp4294 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4293
%.tmp4295 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4294, i32 0, i32 6
%.tmp4296 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4295
%.tmp4298 = getelementptr [6 x i8], [6 x i8]*@.str4297, i32 0, i32 0
%.tmp4299 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4296, i8* %.tmp4298)
store %m261$.Node.type* %.tmp4299, %m261$.Node.type** %block
%.tmp4300 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4301 = load %m261$.Node.type*, %m261$.Node.type** %block
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_block.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4300, %m261$.Node.type* %.tmp4301)
br label %.if.end.4291
.if.false.4291:
%.tmp4302 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4303 = load %m261$.Node.type*, %m261$.Node.type** %else_block
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_if_block.v.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4302, %m261$.Node.type* %.tmp4303)
br label %.if.end.4291
.if.end.4291:
br label %.if.end.4281
.if.false.4281:
br label %.if.end.4281
.if.end.4281:
%.tmp4304 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4305 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4304, i32 0, i32 1
%.tmp4306 = load %m0$.File.type*, %m0$.File.type** %.tmp4305
%.tmp4308 = getelementptr [23 x i8], [23 x i8]*@.str4307, i32 0, i32 0
%.tmp4309 = load i32, i32* %if_id
%.tmp4310 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4306, i8* %.tmp4308, i32 %.tmp4309)
%.tmp4311 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4312 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4311, i32 0, i32 1
%.tmp4313 = load %m0$.File.type*, %m0$.File.type** %.tmp4312
%.tmp4315 = getelementptr [13 x i8], [13 x i8]*@.str4314, i32 0, i32 0
%.tmp4316 = load i32, i32* %if_id
%.tmp4317 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4313, i8* %.tmp4315, i32 %.tmp4316)
ret void
}
define void @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.curr_node.arg, i8* %.msg.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%curr_node = alloca %m261$.Node.type*
store %m261$.Node.type* %.curr_node.arg, %m261$.Node.type** %curr_node
%msg = alloca i8*
store i8* %.msg.arg, i8** %msg
%.tmp4318 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4319 = icmp ne %m261$.Node.type* %.tmp4318, null
br i1 %.tmp4319, label %.if.true.4320, label %.if.false.4320
.if.true.4320:
%.tmp4321 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4322 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4321, i32 0, i32 6
%.tmp4323 = load i8*, i8** %.tmp4322
%.tmp4324 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4325 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4324, i32 0, i32 3
%.tmp4326 = load i32, i32* %.tmp4325
%.tmp4327 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4328 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4327, i32 0, i32 4
%.tmp4329 = load i32, i32* %.tmp4328
%.tmp4330 = load i8*, i8** %msg
%.tmp4331 = call %m678$.Error.type*(i8*,i32,i32,i8*) @m678$new.m678$.Error.typep.cp.i.i.cp(i8* %.tmp4323, i32 %.tmp4326, i32 %.tmp4329, i8* %.tmp4330)
%err = alloca %m678$.Error.type*
store %m678$.Error.type* %.tmp4331, %m678$.Error.type** %err
%.tmp4332 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4333 = load %m678$.Error.type*, %m678$.Error.type** %err
call void(%m1791$.CompilerCtx.type*,%m678$.Error.type*) @m1791$append_error.v.m1791$.CompilerCtx.typep.m678$.Error.typep(%m1791$.CompilerCtx.type* %.tmp4332, %m678$.Error.type* %.tmp4333)
br label %.if.end.4320
.if.false.4320:
%.tmp4335 = getelementptr [61 x i8], [61 x i8]*@.str4334, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 0, i8* %.tmp4335)
br label %.if.end.4320
.if.end.4320:
ret void
}
define void @m1791$define_assignable.v.m1791$.CompilerCtx.typep.cp.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.ctx.arg, i8* %.name.arg, %m1791$.AssignableInfo.type* %.info.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%name = alloca i8*
store i8* %.name.arg, i8** %name
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.info.arg, %m1791$.AssignableInfo.type** %info
%.tmp4336 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4337 = call %m1791$.ModuleLookup.type*(%m1791$.CompilerCtx.type*) @m1791$get_current_module.m1791$.ModuleLookup.typep.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp4336)
%mod = alloca %m1791$.ModuleLookup.type*
store %m1791$.ModuleLookup.type* %.tmp4337, %m1791$.ModuleLookup.type** %mod
%.tmp4338 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp4339 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp4338, i32 0, i32 3
%.tmp4340 = load %m1791$.Scope.type*, %m1791$.Scope.type** %.tmp4339
%.tmp4341 = icmp ne %m1791$.Scope.type* %.tmp4340, null
%.tmp4343 = getelementptr [82 x i8], [82 x i8]*@.str4342, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4341, i8* %.tmp4343)
%.tmp4344 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp4345 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp4344, i32 0, i32 3
%.tmp4346 = load %m1791$.Scope.type*, %m1791$.Scope.type** %.tmp4345
%current_scope = alloca %m1791$.Scope.type*
store %m1791$.Scope.type* %.tmp4346, %m1791$.Scope.type** %current_scope
%.tmp4347 = load i32, i32* @ScopeItem_size
%.tmp4348 = call i8*(i32) @malloc(i32 %.tmp4347)
%.tmp4349 = bitcast i8* %.tmp4348 to %m1791$.ScopeItem.type*
%newitem = alloca %m1791$.ScopeItem.type*
store %m1791$.ScopeItem.type* %.tmp4349, %m1791$.ScopeItem.type** %newitem
%.tmp4350 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %newitem
%.tmp4351 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4350, i32 0, i32 0
%.tmp4352 = load i8*, i8** %name
store i8* %.tmp4352, i8** %.tmp4351
%.tmp4353 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %newitem
%.tmp4354 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4353, i32 0, i32 1
%.tmp4355 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
store %m1791$.AssignableInfo.type* %.tmp4355, %m1791$.AssignableInfo.type** %.tmp4354
%.tmp4356 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %newitem
%.tmp4357 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4356, i32 0, i32 2
store %m1791$.ScopeItem.type* null, %m1791$.ScopeItem.type** %.tmp4357
%.tmp4358 = load %m1791$.Scope.type*, %m1791$.Scope.type** %current_scope
%.tmp4359 = getelementptr %m1791$.Scope.type, %m1791$.Scope.type* %.tmp4358, i32 0, i32 1
%.tmp4360 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %.tmp4359
%.tmp4361 = icmp eq %m1791$.ScopeItem.type* %.tmp4360, null
br i1 %.tmp4361, label %.if.true.4362, label %.if.false.4362
.if.true.4362:
%.tmp4363 = load %m1791$.Scope.type*, %m1791$.Scope.type** %current_scope
%.tmp4364 = getelementptr %m1791$.Scope.type, %m1791$.Scope.type* %.tmp4363, i32 0, i32 1
%.tmp4365 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %newitem
store %m1791$.ScopeItem.type* %.tmp4365, %m1791$.ScopeItem.type** %.tmp4364
ret void
br label %.if.end.4362
.if.false.4362:
br label %.if.end.4362
.if.end.4362:
%.tmp4366 = load %m1791$.Scope.type*, %m1791$.Scope.type** %current_scope
%.tmp4367 = getelementptr %m1791$.Scope.type, %m1791$.Scope.type* %.tmp4366, i32 0, i32 1
%.tmp4368 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %.tmp4367
%last_item = alloca %m1791$.ScopeItem.type*
store %m1791$.ScopeItem.type* %.tmp4368, %m1791$.ScopeItem.type** %last_item
br label %.for.start.4369
.for.start.4369:
%.tmp4370 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %last_item
%.tmp4371 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4370, i32 0, i32 2
%.tmp4372 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %.tmp4371
%.tmp4373 = icmp ne %m1791$.ScopeItem.type* %.tmp4372, null
br i1 %.tmp4373, label %.for.continue.4369, label %.for.end.4369
.for.continue.4369:
%.tmp4374 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %last_item
%.tmp4375 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4374, i32 0, i32 2
%.tmp4376 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %.tmp4375
store %m1791$.ScopeItem.type* %.tmp4376, %m1791$.ScopeItem.type** %last_item
br label %.for.start.4369
.for.end.4369:
%.tmp4377 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %last_item
%.tmp4378 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4377, i32 0, i32 2
%.tmp4379 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %newitem
store %m1791$.ScopeItem.type* %.tmp4379, %m1791$.ScopeItem.type** %.tmp4378
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
%.tmp4380 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4381 = load i8*, i8** %module
%.tmp4382 = load %m261$.Node.type*, %m261$.Node.type** %dotted_name
%.tmp4383 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4382, i32 0, i32 1
%.tmp4384 = load i8*, i8** %.tmp4383
%.tmp4385 = call %m1791$.ScopeItem.type*(%m1791$.CompilerCtx.type*,i8*,i8*) @m1791$find_defined_str.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.cp.cp(%m1791$.CompilerCtx.type* %.tmp4380, i8* %.tmp4381, i8* %.tmp4384)
%found = alloca %m1791$.ScopeItem.type*
store %m1791$.ScopeItem.type* %.tmp4385, %m1791$.ScopeItem.type** %found
%.tmp4386 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %found
%.tmp4387 = icmp eq %m1791$.ScopeItem.type* %.tmp4386, null
br i1 %.tmp4387, label %.if.true.4388, label %.if.false.4388
.if.true.4388:
%.tmp4389 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp4391 = getelementptr [31 x i8], [31 x i8]*@.str4390, i32 0, i32 0
%.tmp4392 = load %m261$.Node.type*, %m261$.Node.type** %dotted_name
%.tmp4393 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4392, i32 0, i32 1
%.tmp4394 = load i8*, i8** %.tmp4393
%.tmp4395 = load i8*, i8** %module
%.tmp4396 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4389, i8* %.tmp4391, i8* %.tmp4394, i8* %.tmp4395)
%.tmp4397 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4398 = load %m261$.Node.type*, %m261$.Node.type** %dotted_name
%.tmp4399 = load i8*, i8** %err_buf
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4397, %m261$.Node.type* %.tmp4398, i8* %.tmp4399)
%.tmp4400 = bitcast ptr null to %m1791$.ScopeItem.type*
ret %m1791$.ScopeItem.type* %.tmp4400
br label %.if.end.4388
.if.false.4388:
br label %.if.end.4388
.if.end.4388:
br label %.for.start.4401
.for.start.4401:
%.tmp4402 = load %m261$.Node.type*, %m261$.Node.type** %dotted_name
%.tmp4403 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4402, i32 0, i32 7
%.tmp4404 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4403
%.tmp4405 = icmp ne %m261$.Node.type* %.tmp4404, null
%.tmp4406 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %found
%.tmp4407 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4406, i32 0, i32 1
%.tmp4408 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp4407
%.tmp4409 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4408, i32 0, i32 2
%.tmp4410 = load i8*, i8** %.tmp4409
%.tmp4412 = getelementptr [7 x i8], [7 x i8]*@.str4411, i32 0, i32 0
%.tmp4413 = call i32(i8*,i8*) @strcmp(i8* %.tmp4410, i8* %.tmp4412)
%.tmp4414 = icmp eq i32 %.tmp4413, 0
%.tmp4415 = and i1 %.tmp4405, %.tmp4414
br i1 %.tmp4415, label %.for.continue.4401, label %.for.end.4401
.for.continue.4401:
%.tmp4416 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4417 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %found
%.tmp4418 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4417, i32 0, i32 1
%.tmp4419 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp4418
%.tmp4420 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4419, i32 0, i32 0
%.tmp4421 = load i8*, i8** %.tmp4420
%.tmp4422 = load %m261$.Node.type*, %m261$.Node.type** %dotted_name
%.tmp4423 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4422, i32 0, i32 7
%.tmp4424 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4423
%.tmp4425 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4424, i32 0, i32 7
%.tmp4426 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4425
%.tmp4427 = call %m1791$.ScopeItem.type*(%m1791$.CompilerCtx.type*,i8*,%m261$.Node.type*) @m1791$find_defined_in.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.cp.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4416, i8* %.tmp4421, %m261$.Node.type* %.tmp4426)
store %m1791$.ScopeItem.type* %.tmp4427, %m1791$.ScopeItem.type** %found
%.tmp4428 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %found
%.tmp4429 = icmp eq %m1791$.ScopeItem.type* %.tmp4428, null
br i1 %.tmp4429, label %.if.true.4430, label %.if.false.4430
.if.true.4430:
%.tmp4431 = bitcast ptr null to %m1791$.ScopeItem.type*
ret %m1791$.ScopeItem.type* %.tmp4431
br label %.if.end.4430
.if.false.4430:
br label %.if.end.4430
.if.end.4430:
br label %.for.start.4401
.for.end.4401:
%.tmp4432 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %found
ret %m1791$.ScopeItem.type* %.tmp4432
}
define %m1791$.ScopeItem.type* @m1791$find_defined_str.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.cp.cp(%m1791$.CompilerCtx.type* %.ctx.arg, i8* %.module.arg, i8* %.assignable_name.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%module = alloca i8*
store i8* %.module.arg, i8** %module
%assignable_name = alloca i8*
store i8* %.assignable_name.arg, i8** %assignable_name
%.tmp4433 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4434 = load i8*, i8** %module
%.tmp4435 = call %m1791$.ModuleLookup.type*(%m1791$.CompilerCtx.type*,i8*) @m1791$get_module.m1791$.ModuleLookup.typep.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.tmp4433, i8* %.tmp4434)
%mod = alloca %m1791$.ModuleLookup.type*
store %m1791$.ModuleLookup.type* %.tmp4435, %m1791$.ModuleLookup.type** %mod
%.tmp4436 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp4437 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp4436, i32 0, i32 3
%.tmp4438 = load %m1791$.Scope.type*, %m1791$.Scope.type** %.tmp4437
%.tmp4439 = icmp ne %m1791$.Scope.type* %.tmp4438, null
%.tmp4441 = getelementptr [77 x i8], [77 x i8]*@.str4440, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp4439, i8* %.tmp4441)
%.tmp4443 = load %m1791$.ModuleLookup.type*, %m1791$.ModuleLookup.type** %mod
%.tmp4444 = getelementptr %m1791$.ModuleLookup.type, %m1791$.ModuleLookup.type* %.tmp4443, i32 0, i32 3
%.tmp4445 = load %m1791$.Scope.type*, %m1791$.Scope.type** %.tmp4444
%s = alloca %m1791$.Scope.type*
store %m1791$.Scope.type* %.tmp4445, %m1791$.Scope.type** %s
br label %.for.start.4442
.for.start.4442:
%.tmp4446 = load %m1791$.Scope.type*, %m1791$.Scope.type** %s
%.tmp4447 = icmp ne %m1791$.Scope.type* %.tmp4446, null
br i1 %.tmp4447, label %.for.continue.4442, label %.for.end.4442
.for.continue.4442:
%.tmp4449 = load %m1791$.Scope.type*, %m1791$.Scope.type** %s
%.tmp4450 = getelementptr %m1791$.Scope.type, %m1791$.Scope.type* %.tmp4449, i32 0, i32 1
%.tmp4451 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %.tmp4450
%item = alloca %m1791$.ScopeItem.type*
store %m1791$.ScopeItem.type* %.tmp4451, %m1791$.ScopeItem.type** %item
br label %.for.start.4448
.for.start.4448:
%.tmp4452 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %item
%.tmp4453 = icmp ne %m1791$.ScopeItem.type* %.tmp4452, null
br i1 %.tmp4453, label %.for.continue.4448, label %.for.end.4448
.for.continue.4448:
%.tmp4454 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %item
%.tmp4455 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4454, i32 0, i32 0
%.tmp4456 = load i8*, i8** %.tmp4455
%.tmp4457 = load i8*, i8** %assignable_name
%.tmp4458 = call i32(i8*,i8*) @strcmp(i8* %.tmp4456, i8* %.tmp4457)
%.tmp4459 = icmp eq i32 %.tmp4458, 0
br i1 %.tmp4459, label %.if.true.4460, label %.if.false.4460
.if.true.4460:
%.tmp4461 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %item
ret %m1791$.ScopeItem.type* %.tmp4461
br label %.if.end.4460
.if.false.4460:
br label %.if.end.4460
.if.end.4460:
%.tmp4462 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %item
%.tmp4463 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4462, i32 0, i32 2
%.tmp4464 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %.tmp4463
store %m1791$.ScopeItem.type* %.tmp4464, %m1791$.ScopeItem.type** %item
br label %.for.start.4448
.for.end.4448:
%.tmp4465 = load %m1791$.Scope.type*, %m1791$.Scope.type** %s
%.tmp4466 = getelementptr %m1791$.Scope.type, %m1791$.Scope.type* %.tmp4465, i32 0, i32 3
%.tmp4467 = load %m1791$.Scope.type*, %m1791$.Scope.type** %.tmp4466
store %m1791$.Scope.type* %.tmp4467, %m1791$.Scope.type** %s
br label %.for.start.4442
.for.end.4442:
%.tmp4468 = bitcast ptr null to %m1791$.ScopeItem.type*
ret %m1791$.ScopeItem.type* %.tmp4468
}
define %m1791$.ScopeItem.type* @m1791$find_defined.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.dotted_name.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%dotted_name = alloca %m261$.Node.type*
store %m261$.Node.type* %.dotted_name.arg, %m261$.Node.type** %dotted_name
%.tmp4469 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4470 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4471 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4470, i32 0, i32 6
%.tmp4472 = load i8*, i8** %.tmp4471
%.tmp4473 = load %m261$.Node.type*, %m261$.Node.type** %dotted_name
%.tmp4474 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4473, i32 0, i32 6
%.tmp4475 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4474
%.tmp4476 = call %m1791$.ScopeItem.type*(%m1791$.CompilerCtx.type*,i8*,%m261$.Node.type*) @m1791$find_defined_in.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.cp.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4469, i8* %.tmp4472, %m261$.Node.type* %.tmp4475)
ret %m1791$.ScopeItem.type* %.tmp4476
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
%.tmp4477 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4478 = icmp eq %m1791$.AssignableInfo.type* %.tmp4477, null
br i1 %.tmp4478, label %.if.true.4479, label %.if.false.4479
.if.true.4479:
%.tmp4480 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4481 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4483 = getelementptr [54 x i8], [54 x i8]*@.str4482, i32 0, i32 0
%.tmp4484 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4480, %m261$.Node.type* %.tmp4481, i8* %.tmp4483)
%.tmp4485 = call i32(i8*,...) @printf(i8* %.tmp4484)
%.tmp4486 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp4486
br label %.if.end.4479
.if.false.4479:
br label %.if.end.4479
.if.end.4479:
%.tmp4487 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4488 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4487, i32 0, i32 2
%.tmp4489 = load i8*, i8** %.tmp4488
%.tmp4491 = getelementptr [9 x i8], [9 x i8]*@.str4490, i32 0, i32 0
%.tmp4492 = call i32(i8*,i8*) @strcmp(i8* %.tmp4489, i8* %.tmp4491)
%.tmp4493 = icmp eq i32 %.tmp4492, 0
%.tmp4494 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4495 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4494, i32 0, i32 2
%.tmp4496 = load i8*, i8** %.tmp4495
%.tmp4498 = getelementptr [7 x i8], [7 x i8]*@.str4497, i32 0, i32 0
%.tmp4499 = call i32(i8*,i8*) @strcmp(i8* %.tmp4496, i8* %.tmp4498)
%.tmp4500 = icmp eq i32 %.tmp4499, 0
%.tmp4501 = or i1 %.tmp4493, %.tmp4500
br i1 %.tmp4501, label %.if.true.4502, label %.if.false.4502
.if.true.4502:
%.tmp4503 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4504 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4503, i32 0, i32 7
%.tmp4505 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4504
%.tmp4506 = icmp ne %m261$.Node.type* %.tmp4505, null
br i1 %.tmp4506, label %.if.true.4507, label %.if.false.4507
.if.true.4507:
%.tmp4508 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4510 = getelementptr [46 x i8], [46 x i8]*@.str4509, i32 0, i32 0
%.tmp4511 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4512 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4511, i32 0, i32 7
%.tmp4513 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4512
%.tmp4514 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4513, i32 0, i32 7
%.tmp4515 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4514
%.tmp4516 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4515, i32 0, i32 1
%.tmp4517 = load i8*, i8** %.tmp4516
%.tmp4518 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4519 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4518, i32 0, i32 1
%.tmp4520 = load i8*, i8** %.tmp4519
%.tmp4521 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4508, i8* %.tmp4510, i8* %.tmp4517, i8* %.tmp4520)
%.tmp4522 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4523 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4524 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4522, %m261$.Node.type* %.tmp4523, i8* %.tmp4524)
%.tmp4525 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp4525
br label %.if.end.4507
.if.false.4507:
br label %.if.end.4507
.if.end.4507:
%.tmp4526 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
ret %m1791$.AssignableInfo.type* %.tmp4526
br label %.if.end.4502
.if.false.4502:
%.tmp4527 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4528 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4527, i32 0, i32 2
%.tmp4529 = load i8*, i8** %.tmp4528
%.tmp4531 = getelementptr [9 x i8], [9 x i8]*@.str4530, i32 0, i32 0
%.tmp4532 = call i32(i8*,i8*) @strcmp(i8* %.tmp4529, i8* %.tmp4531)
%.tmp4533 = icmp eq i32 %.tmp4532, 0
%.tmp4534 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4535 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4534, i32 0, i32 7
%.tmp4536 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4535
%.tmp4537 = icmp ne %m261$.Node.type* %.tmp4536, null
%.tmp4538 = and i1 %.tmp4533, %.tmp4537
br i1 %.tmp4538, label %.if.true.4539, label %.if.false.4539
.if.true.4539:
%.tmp4540 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%base_var = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4540, %m1791$.AssignableInfo.type** %base_var
%.tmp4541 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base_var
%.tmp4542 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4541, i32 0, i32 3
%.tmp4543 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4542
%struct_info = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp4543, %m1791$.Type.type** %struct_info
br label %.for.start.4544
.for.start.4544:
%.tmp4545 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base_var
%.tmp4546 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4545, i32 0, i32 3
%.tmp4547 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4546
%.tmp4548 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4547, i32 0, i32 0
%.tmp4549 = load i8*, i8** %.tmp4548
%.tmp4551 = getelementptr [4 x i8], [4 x i8]*@.str4550, i32 0, i32 0
%.tmp4552 = call i32(i8*,i8*) @strcmp(i8* %.tmp4549, i8* %.tmp4551)
%.tmp4553 = icmp eq i32 %.tmp4552, 0
br i1 %.tmp4553, label %.for.continue.4544, label %.for.end.4544
.for.continue.4544:
%.tmp4554 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4555 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp4554)
%new_base = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4555, %m1791$.AssignableInfo.type** %new_base
%.tmp4556 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4557 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp4556, %m1791$.AssignableInfo.type* %.tmp4557)
%.tmp4558 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
%.tmp4559 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4558, i32 0, i32 3
%.tmp4560 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base_var
%.tmp4561 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4560, i32 0, i32 3
%.tmp4562 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4561
%.tmp4563 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4562, i32 0, i32 3
%.tmp4564 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4563
store %m1791$.Type.type* %.tmp4564, %m1791$.Type.type** %.tmp4559
%.tmp4565 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4566 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4565, i32 0, i32 1
%.tmp4567 = load %m0$.File.type*, %m0$.File.type** %.tmp4566
%.tmp4569 = getelementptr [23 x i8], [23 x i8]*@.str4568, i32 0, i32 0
%.tmp4570 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
%.tmp4571 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4570)
%.tmp4572 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4573 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
%.tmp4574 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4573, i32 0, i32 3
%.tmp4575 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4574
%.tmp4576 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4572, %m1791$.Type.type* %.tmp4575)
%.tmp4577 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4578 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base_var
%.tmp4579 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4578, i32 0, i32 3
%.tmp4580 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4579
%.tmp4581 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4577, %m1791$.Type.type* %.tmp4580)
%.tmp4582 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base_var
%.tmp4583 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4582)
%.tmp4584 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4567, i8* %.tmp4569, i8* %.tmp4571, i8* %.tmp4576, i8* %.tmp4581, i8* %.tmp4583)
%.tmp4585 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
store %m1791$.AssignableInfo.type* %.tmp4585, %m1791$.AssignableInfo.type** %base_var
%.tmp4586 = load %m1791$.Type.type*, %m1791$.Type.type** %struct_info
%.tmp4587 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4586, i32 0, i32 3
%.tmp4588 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4587
store %m1791$.Type.type* %.tmp4588, %m1791$.Type.type** %struct_info
br label %.for.start.4544
.for.end.4544:
%.tmp4589 = load %m1791$.Type.type*, %m1791$.Type.type** %struct_info
%.tmp4590 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4589, i32 0, i32 0
%.tmp4591 = load i8*, i8** %.tmp4590
%.tmp4593 = getelementptr [10 x i8], [10 x i8]*@.str4592, i32 0, i32 0
%.tmp4594 = call i32(i8*,i8*) @strcmp(i8* %.tmp4591, i8* %.tmp4593)
%.tmp4595 = icmp eq i32 %.tmp4594, 0
br i1 %.tmp4595, label %.if.true.4596, label %.if.false.4596
.if.true.4596:
%.tmp4597 = load %m1791$.Type.type*, %m1791$.Type.type** %struct_info
%.tmp4598 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4597, i32 0, i32 3
%.tmp4599 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4598
store %m1791$.Type.type* %.tmp4599, %m1791$.Type.type** %struct_info
br label %.if.end.4596
.if.false.4596:
br label %.if.end.4596
.if.end.4596:
%.tmp4600 = load %m1791$.Type.type*, %m1791$.Type.type** %struct_info
%.tmp4601 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4600, i32 0, i32 0
%.tmp4602 = load i8*, i8** %.tmp4601
%.tmp4604 = getelementptr [7 x i8], [7 x i8]*@.str4603, i32 0, i32 0
%.tmp4605 = call i32(i8*,i8*) @strcmp(i8* %.tmp4602, i8* %.tmp4604)
%.tmp4606 = icmp ne i32 %.tmp4605, 0
br i1 %.tmp4606, label %.if.true.4607, label %.if.false.4607
.if.true.4607:
%.tmp4608 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4610 = getelementptr [48 x i8], [48 x i8]*@.str4609, i32 0, i32 0
%.tmp4611 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4612 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4611, i32 0, i32 7
%.tmp4613 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4612
%.tmp4614 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4613, i32 0, i32 7
%.tmp4615 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4614
%.tmp4616 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4615, i32 0, i32 1
%.tmp4617 = load i8*, i8** %.tmp4616
%.tmp4618 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4619 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4618, i32 0, i32 1
%.tmp4620 = load i8*, i8** %.tmp4619
%.tmp4621 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4608, i8* %.tmp4610, i8* %.tmp4617, i8* %.tmp4620)
%.tmp4622 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4623 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4624 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4622, %m261$.Node.type* %.tmp4623, i8* %.tmp4624)
%.tmp4625 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp4625
br label %.if.end.4607
.if.false.4607:
br label %.if.end.4607
.if.end.4607:
%.tmp4626 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4627 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4626, i32 0, i32 7
%.tmp4628 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4627
%.tmp4629 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4628, i32 0, i32 7
%.tmp4630 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4629
%.tmp4631 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4630, i32 0, i32 1
%.tmp4632 = load i8*, i8** %.tmp4631
%field_name = alloca i8*
store i8* %.tmp4632, i8** %field_name
%quit = alloca i1
store i1 0, i1* %quit
%field_id = alloca i32
store i32 0, i32* %field_id
%.tmp4633 = bitcast ptr null to %m1791$.Type.type*
%found_field = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp4633, %m1791$.Type.type** %found_field
%.tmp4635 = load %m1791$.Type.type*, %m1791$.Type.type** %struct_info
%.tmp4636 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4635, i32 0, i32 3
%.tmp4637 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4636
%field = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp4637, %m1791$.Type.type** %field
br label %.for.start.4634
.for.start.4634:
%.tmp4638 = load i1, i1* %quit
%.tmp4639 = icmp eq i1 %.tmp4638, 0
br i1 %.tmp4639, label %.for.continue.4634, label %.for.end.4634
.for.continue.4634:
%.tmp4640 = load %m1791$.Type.type*, %m1791$.Type.type** %field
%.tmp4641 = icmp eq %m1791$.Type.type* %.tmp4640, null
br i1 %.tmp4641, label %.if.true.4642, label %.if.false.4642
.if.true.4642:
store i1 1, i1* %quit
br label %.if.end.4642
.if.false.4642:
%.tmp4643 = load %m1791$.Type.type*, %m1791$.Type.type** %field
%.tmp4644 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4643, i32 0, i32 1
%.tmp4645 = load i8*, i8** %.tmp4644
%.tmp4646 = load i8*, i8** %field_name
%.tmp4647 = call i32(i8*,i8*) @strcmp(i8* %.tmp4645, i8* %.tmp4646)
%.tmp4648 = icmp eq i32 %.tmp4647, 0
br i1 %.tmp4648, label %.if.true.4649, label %.if.false.4649
.if.true.4649:
store i1 1, i1* %quit
%.tmp4650 = load %m1791$.Type.type*, %m1791$.Type.type** %field
store %m1791$.Type.type* %.tmp4650, %m1791$.Type.type** %found_field
br label %.if.end.4649
.if.false.4649:
%.tmp4651 = load i32, i32* %field_id
%.tmp4652 = add i32 %.tmp4651, 1
store i32 %.tmp4652, i32* %field_id
br label %.if.end.4649
.if.end.4649:
br label %.if.end.4642
.if.end.4642:
%.tmp4653 = load %m1791$.Type.type*, %m1791$.Type.type** %field
%.tmp4654 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4653, i32 0, i32 4
%.tmp4655 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4654
store %m1791$.Type.type* %.tmp4655, %m1791$.Type.type** %field
br label %.for.start.4634
.for.end.4634:
%.tmp4656 = load %m1791$.Type.type*, %m1791$.Type.type** %found_field
%.tmp4657 = icmp eq %m1791$.Type.type* %.tmp4656, null
br i1 %.tmp4657, label %.if.true.4658, label %.if.false.4658
.if.true.4658:
%.tmp4659 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4661 = getelementptr [34 x i8], [34 x i8]*@.str4660, i32 0, i32 0
%.tmp4662 = load i8*, i8** %field_name
%.tmp4663 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4664 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4663, i32 0, i32 1
%.tmp4665 = load i8*, i8** %.tmp4664
%.tmp4666 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4659, i8* %.tmp4661, i8* %.tmp4662, i8* %.tmp4665)
%.tmp4667 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4668 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4669 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4667, %m261$.Node.type* %.tmp4668, i8* %.tmp4669)
%.tmp4670 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp4670
br label %.if.end.4658
.if.false.4658:
br label %.if.end.4658
.if.end.4658:
%.tmp4671 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4672 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp4671)
%new_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4672, %m1791$.AssignableInfo.type** %new_info
%.tmp4673 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_info
%.tmp4674 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4673, i32 0, i32 3
%.tmp4675 = load %m1791$.Type.type*, %m1791$.Type.type** %found_field
store %m1791$.Type.type* %.tmp4675, %m1791$.Type.type** %.tmp4674
%.tmp4676 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4677 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_info
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp4676, %m1791$.AssignableInfo.type* %.tmp4677)
%.tmp4678 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_info
%.tmp4679 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4678, i32 0, i32 2
%.tmp4681 = getelementptr [9 x i8], [9 x i8]*@.str4680, i32 0, i32 0
store i8* %.tmp4681, i8** %.tmp4679
%.tmp4682 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4683 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base_var
%.tmp4684 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4683, i32 0, i32 3
%.tmp4685 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4684
%.tmp4686 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4682, %m1791$.Type.type* %.tmp4685)
%info_tr = alloca i8*
store i8* %.tmp4686, i8** %info_tr
%.tmp4687 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4688 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4687, i32 0, i32 1
%.tmp4689 = load %m0$.File.type*, %m0$.File.type** %.tmp4688
%.tmp4691 = getelementptr [46 x i8], [46 x i8]*@.str4690, i32 0, i32 0
%.tmp4692 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_info
%.tmp4693 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4692)
%.tmp4694 = load i8*, i8** %info_tr
%.tmp4695 = load i8*, i8** %info_tr
%.tmp4696 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base_var
%.tmp4697 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4696)
%.tmp4698 = load i32, i32* %field_id
%.tmp4699 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4689, i8* %.tmp4691, i8* %.tmp4693, i8* %.tmp4694, i8* %.tmp4695, i8* %.tmp4697, i32 %.tmp4698)
%.tmp4700 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4701 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4702 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4701, i32 0, i32 7
%.tmp4703 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4702
%.tmp4704 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4703, i32 0, i32 7
%.tmp4705 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4704
%.tmp4706 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_info
%.tmp4707 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,%m1791$.AssignableInfo.type*) @m1791$get_dotted_name.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp4700, %m261$.Node.type* %.tmp4705, %m1791$.AssignableInfo.type* %.tmp4706)
ret %m1791$.AssignableInfo.type* %.tmp4707
br label %.if.end.4539
.if.false.4539:
%.tmp4708 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4709 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4708, i32 0, i32 2
%.tmp4710 = load i8*, i8** %.tmp4709
%.tmp4712 = getelementptr [9 x i8], [9 x i8]*@.str4711, i32 0, i32 0
%.tmp4713 = call i32(i8*,i8*) @strcmp(i8* %.tmp4710, i8* %.tmp4712)
%.tmp4714 = icmp eq i32 %.tmp4713, 0
br i1 %.tmp4714, label %.if.true.4715, label %.if.false.4715
.if.true.4715:
%.tmp4716 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
ret %m1791$.AssignableInfo.type* %.tmp4716
br label %.if.end.4715
.if.false.4715:
br label %.if.end.4715
.if.end.4715:
br label %.if.end.4539
.if.end.4539:
br label %.if.end.4502
.if.end.4502:
%.tmp4717 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4718 = load %m261$.Node.type*, %m261$.Node.type** %dot_name_ptr
%.tmp4720 = getelementptr [43 x i8], [43 x i8]*@.str4719, i32 0, i32 0
%.tmp4721 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4717, %m261$.Node.type* %.tmp4718, i8* %.tmp4720)
%.tmp4722 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4723 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4722, i32 0, i32 2
%.tmp4724 = load i8*, i8** %.tmp4723
%.tmp4725 = call i32(i8*,...) @printf(i8* %.tmp4721, i8* %.tmp4724)
%.tmp4726 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp4726
}
define %m1791$.AssignableInfo.type* @m1791$compile_addr.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%err_msg = alloca i8*
%.tmp4727 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%curr_node = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4727, %m261$.Node.type** %curr_node
%.tmp4728 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4729 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4728, i32 0, i32 0
%.tmp4730 = load i8*, i8** %.tmp4729
%.tmp4732 = getelementptr [12 x i8], [12 x i8]*@.str4731, i32 0, i32 0
%.tmp4733 = call i32(i8*,i8*) @strcmp(i8* %.tmp4730, i8* %.tmp4732)
%.tmp4734 = icmp ne i32 %.tmp4733, 0
br i1 %.tmp4734, label %.if.true.4735, label %.if.false.4735
.if.true.4735:
%.tmp4737 = getelementptr [92 x i8], [92 x i8]*@.str4736, i32 0, i32 0
%.tmp4738 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4739 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4738, i32 0, i32 0
%.tmp4740 = load i8*, i8** %.tmp4739
%.tmp4741 = call i32(i8*,...) @printf(i8* %.tmp4737, i8* %.tmp4740)
%.tmp4742 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp4743 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4742, i32 0, i32 6
%.tmp4744 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4743
store %m261$.Node.type* %.tmp4744, %m261$.Node.type** %curr_node
br label %.if.end.4735
.if.false.4735:
br label %.if.end.4735
.if.end.4735:
%.tmp4745 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4746 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4745, i32 0, i32 6
%.tmp4747 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4746
%assignable_name = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4747, %m261$.Node.type** %assignable_name
%.tmp4748 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4749 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4750 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4749, i32 0, i32 6
%.tmp4751 = load i8*, i8** %.tmp4750
%.tmp4752 = load %m261$.Node.type*, %m261$.Node.type** %assignable_name
%.tmp4753 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4752, i32 0, i32 6
%.tmp4754 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4753
%.tmp4755 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4754, i32 0, i32 1
%.tmp4756 = load i8*, i8** %.tmp4755
%.tmp4757 = call %m1791$.ScopeItem.type*(%m1791$.CompilerCtx.type*,i8*,i8*) @m1791$find_defined_str.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.cp.cp(%m1791$.CompilerCtx.type* %.tmp4748, i8* %.tmp4751, i8* %.tmp4756)
%scope_info = alloca %m1791$.ScopeItem.type*
store %m1791$.ScopeItem.type* %.tmp4757, %m1791$.ScopeItem.type** %scope_info
%.tmp4758 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %scope_info
%.tmp4759 = icmp eq %m1791$.ScopeItem.type* %.tmp4758, null
br i1 %.tmp4759, label %.if.true.4760, label %.if.false.4760
.if.true.4760:
%.tmp4761 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4763 = getelementptr [25 x i8], [25 x i8]*@.str4762, i32 0, i32 0
%.tmp4764 = load %m261$.Node.type*, %m261$.Node.type** %assignable_name
%.tmp4765 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4764, i32 0, i32 6
%.tmp4766 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4765
%.tmp4767 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4766, i32 0, i32 1
%.tmp4768 = load i8*, i8** %.tmp4767
%.tmp4769 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4761, i8* %.tmp4763, i8* %.tmp4768)
%.tmp4770 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4771 = load %m261$.Node.type*, %m261$.Node.type** %assignable_name
%.tmp4772 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4770, %m261$.Node.type* %.tmp4771, i8* %.tmp4772)
%.tmp4773 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp4773
br label %.if.end.4760
.if.false.4760:
br label %.if.end.4760
.if.end.4760:
%.tmp4774 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %scope_info
%.tmp4775 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4774, i32 0, i32 1
%.tmp4776 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp4775
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4776, %m1791$.AssignableInfo.type** %info
%.tmp4777 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4778 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4777, i32 0, i32 2
%.tmp4779 = load i8*, i8** %.tmp4778
%.tmp4781 = getelementptr [7 x i8], [7 x i8]*@.str4780, i32 0, i32 0
%.tmp4782 = call i32(i8*,i8*) @strcmp(i8* %.tmp4779, i8* %.tmp4781)
%.tmp4783 = icmp eq i32 %.tmp4782, 0
br i1 %.tmp4783, label %.if.true.4784, label %.if.false.4784
.if.true.4784:
%.tmp4785 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4786 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4787 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4786)
%.tmp4788 = load %m261$.Node.type*, %m261$.Node.type** %assignable_name
%.tmp4789 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4788, i32 0, i32 6
%.tmp4790 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4789
%.tmp4791 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4790, i32 0, i32 7
%.tmp4792 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4791
%.tmp4793 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4792, i32 0, i32 7
%.tmp4794 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4793
%.tmp4795 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4794, i32 0, i32 1
%.tmp4796 = load i8*, i8** %.tmp4795
%.tmp4797 = call %m1791$.ScopeItem.type*(%m1791$.CompilerCtx.type*,i8*,i8*) @m1791$find_defined_str.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.cp.cp(%m1791$.CompilerCtx.type* %.tmp4785, i8* %.tmp4787, i8* %.tmp4796)
store %m1791$.ScopeItem.type* %.tmp4797, %m1791$.ScopeItem.type** %scope_info
%.tmp4798 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %scope_info
%.tmp4799 = icmp eq %m1791$.ScopeItem.type* %.tmp4798, null
br i1 %.tmp4799, label %.if.true.4800, label %.if.false.4800
.if.true.4800:
%.tmp4801 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4803 = getelementptr [31 x i8], [31 x i8]*@.str4802, i32 0, i32 0
%.tmp4804 = load %m261$.Node.type*, %m261$.Node.type** %assignable_name
%.tmp4805 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4804, i32 0, i32 6
%.tmp4806 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4805
%.tmp4807 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4806, i32 0, i32 7
%.tmp4808 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4807
%.tmp4809 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4808, i32 0, i32 7
%.tmp4810 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4809
%.tmp4811 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4810, i32 0, i32 1
%.tmp4812 = load i8*, i8** %.tmp4811
%.tmp4813 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4814 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4813)
%.tmp4815 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4801, i8* %.tmp4803, i8* %.tmp4812, i8* %.tmp4814)
%.tmp4816 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4817 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4818 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4816, %m261$.Node.type* %.tmp4817, i8* %.tmp4818)
%.tmp4819 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp4819
br label %.if.end.4800
.if.false.4800:
br label %.if.end.4800
.if.end.4800:
%.tmp4820 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %scope_info
%.tmp4821 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp4820, i32 0, i32 1
%.tmp4822 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp4821
store %m1791$.AssignableInfo.type* %.tmp4822, %m1791$.AssignableInfo.type** %info
%.tmp4823 = load %m261$.Node.type*, %m261$.Node.type** %assignable_name
%.tmp4824 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4823, i32 0, i32 6
%.tmp4825 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4824
%.tmp4826 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4825, i32 0, i32 7
%.tmp4827 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4826
%.tmp4828 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4827, i32 0, i32 7
%.tmp4829 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4828
store %m261$.Node.type* %.tmp4829, %m261$.Node.type** %assignable_name
br label %.if.end.4784
.if.false.4784:
%.tmp4830 = load %m261$.Node.type*, %m261$.Node.type** %assignable_name
%.tmp4831 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4830, i32 0, i32 6
%.tmp4832 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4831
store %m261$.Node.type* %.tmp4832, %m261$.Node.type** %assignable_name
br label %.if.end.4784
.if.end.4784:
%.tmp4833 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4834 = load %m261$.Node.type*, %m261$.Node.type** %assignable_name
%.tmp4835 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4836 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,%m1791$.AssignableInfo.type*) @m1791$get_dotted_name.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp4833, %m261$.Node.type* %.tmp4834, %m1791$.AssignableInfo.type* %.tmp4835)
%base = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4836, %m1791$.AssignableInfo.type** %base
%.tmp4838 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4839 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4838, i32 0, i32 6
%.tmp4840 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4839
%.tmp4841 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4840, i32 0, i32 7
%.tmp4842 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4841
%addr = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4842, %m261$.Node.type** %addr
br label %.for.start.4837
.for.start.4837:
%.tmp4843 = load %m261$.Node.type*, %m261$.Node.type** %addr
%.tmp4844 = icmp ne %m261$.Node.type* %.tmp4843, null
br i1 %.tmp4844, label %.for.continue.4837, label %.for.end.4837
.for.continue.4837:
%.tmp4845 = load %m261$.Node.type*, %m261$.Node.type** %addr
%.tmp4846 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4845, i32 0, i32 7
%.tmp4847 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4846
%index = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4847, %m261$.Node.type** %index
%.tmp4848 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4849 = load %m261$.Node.type*, %m261$.Node.type** %index
%.tmp4850 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4848, %m261$.Node.type* %.tmp4849)
%index_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4850, %m1791$.AssignableInfo.type** %index_info
%.tmp4851 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4852 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base
%.tmp4853 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4852, i32 0, i32 3
%.tmp4854 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4853
%.tmp4855 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4851, %m1791$.Type.type* %.tmp4854)
%base_type = alloca i8*
store i8* %.tmp4855, i8** %base_type
%.tmp4856 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4857 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %index_info
%.tmp4858 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4857, i32 0, i32 3
%.tmp4859 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4858
%.tmp4860 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4856, %m1791$.Type.type* %.tmp4859)
%index_type = alloca i8*
store i8* %.tmp4860, i8** %index_type
%.tmp4861 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4862 = call i32(%m1791$.CompilerCtx.type*) @m1791$new_uid.i.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp4861)
%tmp_id = alloca i32
store i32 %.tmp4862, i32* %tmp_id
%.tmp4863 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4864 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4863, i32 0, i32 1
%.tmp4865 = load %m0$.File.type*, %m0$.File.type** %.tmp4864
%.tmp4867 = getelementptr [28 x i8], [28 x i8]*@.str4866, i32 0, i32 0
%.tmp4868 = load i32, i32* %tmp_id
%.tmp4869 = load i8*, i8** %base_type
%.tmp4870 = load i8*, i8** %base_type
%.tmp4871 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base
%.tmp4872 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4871)
%.tmp4873 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4865, i8* %.tmp4867, i32 %.tmp4868, i8* %.tmp4869, i8* %.tmp4870, i8* %.tmp4872)
%.tmp4874 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4875 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp4874)
%new_base = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4875, %m1791$.AssignableInfo.type** %new_base
%.tmp4876 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4877 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp4876, %m1791$.AssignableInfo.type* %.tmp4877)
%.tmp4878 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base
%.tmp4879 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4878, i32 0, i32 3
%.tmp4880 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4879
%.tmp4881 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4880, i32 0, i32 3
%.tmp4882 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4881
%.tmp4883 = icmp eq %m1791$.Type.type* %.tmp4882, null
br i1 %.tmp4883, label %.if.true.4884, label %.if.false.4884
.if.true.4884:
%.tmp4885 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp4887 = getelementptr [35 x i8], [35 x i8]*@.str4886, i32 0, i32 0
%.tmp4888 = load i8*, i8** %base_type
%.tmp4889 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp4885, i8* %.tmp4887, i8* %.tmp4888)
%.tmp4890 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4891 = load %m261$.Node.type*, %m261$.Node.type** %addr
%.tmp4892 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp4890, %m261$.Node.type* %.tmp4891, i8* %.tmp4892)
%.tmp4893 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base
ret %m1791$.AssignableInfo.type* %.tmp4893
br label %.if.end.4884
.if.false.4884:
br label %.if.end.4884
.if.end.4884:
%.tmp4894 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
%.tmp4895 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4894, i32 0, i32 3
%.tmp4896 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base
%.tmp4897 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4896, i32 0, i32 3
%.tmp4898 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4897
%.tmp4899 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp4898, i32 0, i32 3
%.tmp4900 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4899
store %m1791$.Type.type* %.tmp4900, %m1791$.Type.type** %.tmp4895
%.tmp4901 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4902 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
%.tmp4903 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4902, i32 0, i32 3
%.tmp4904 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4903
%.tmp4905 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4901, %m1791$.Type.type* %.tmp4904)
%base_type_2 = alloca i8*
store i8* %.tmp4905, i8** %base_type_2
%.tmp4906 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4907 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4906, i32 0, i32 1
%.tmp4908 = load %m0$.File.type*, %m0$.File.type** %.tmp4907
%.tmp4910 = getelementptr [44 x i8], [44 x i8]*@.str4909, i32 0, i32 0
%.tmp4911 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
%.tmp4912 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4911)
%.tmp4913 = load i8*, i8** %base_type_2
%.tmp4914 = load i8*, i8** %base_type_2
%.tmp4915 = load i32, i32* %tmp_id
%.tmp4916 = load i8*, i8** %index_type
%.tmp4917 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %index_info
%.tmp4918 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4917)
%.tmp4919 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4908, i8* %.tmp4910, i8* %.tmp4912, i8* %.tmp4913, i8* %.tmp4914, i32 %.tmp4915, i8* %.tmp4916, i8* %.tmp4918)
%.tmp4920 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %new_base
store %m1791$.AssignableInfo.type* %.tmp4920, %m1791$.AssignableInfo.type** %base
%.tmp4921 = load %m261$.Node.type*, %m261$.Node.type** %addr
%.tmp4922 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4921, i32 0, i32 7
%.tmp4923 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4922
%.tmp4924 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4923, i32 0, i32 7
%.tmp4925 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4924
%.tmp4926 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4925, i32 0, i32 7
%.tmp4927 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4926
store %m261$.Node.type* %.tmp4927, %m261$.Node.type** %addr
br label %.for.start.4837
.for.end.4837:
%.tmp4928 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %base
ret %m1791$.AssignableInfo.type* %.tmp4928
}
%m1791$.StackHead.type = type {%m1909$.SYStack.type*}
@StackHead_size = constant i32 8
define %m1791$.AssignableInfo.type* @m1791$compile_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%curr_node = alloca %m261$.Node.type*
store %m261$.Node.type* %.curr_node.arg, %m261$.Node.type** %curr_node
%.tmp4929 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4930 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4929, i32 0, i32 6
%.tmp4931 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4930
%.tmp4933 = getelementptr [16 x i8], [16 x i8]*@.str4932, i32 0, i32 0
%.tmp4934 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4931, i8* %.tmp4933)
%assignable_start = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4934, %m261$.Node.type** %assignable_start
%.tmp4935 = load %m261$.Node.type*, %m261$.Node.type** %assignable_start
%.tmp4936 = call %m1909$.SYStack.type*(%m261$.Node.type*) @m1909$sy_algorithm.m1909$.SYStack.typep.m261$.Node.typep(%m261$.Node.type* %.tmp4935)
%operator_stack = alloca %m1909$.SYStack.type*
store %m1909$.SYStack.type* %.tmp4936, %m1909$.SYStack.type** %operator_stack
%.tmp4937 = load i32, i32* @StackHead_size
%.tmp4938 = call i8*(i32) @malloc(i32 %.tmp4937)
%.tmp4939 = bitcast i8* %.tmp4938 to %m1791$.StackHead.type*
%stack = alloca %m1791$.StackHead.type*
store %m1791$.StackHead.type* %.tmp4939, %m1791$.StackHead.type** %stack
%.tmp4940 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp4941 = getelementptr %m1791$.StackHead.type, %m1791$.StackHead.type* %.tmp4940, i32 0, i32 0
%.tmp4942 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %operator_stack
store %m1909$.SYStack.type* %.tmp4942, %m1909$.SYStack.type** %.tmp4941
%.tmp4943 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4944 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp4945 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m1791$.StackHead.type*) @m1791$compile_assignable_stack.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m1791$.StackHead.typep(%m1791$.CompilerCtx.type* %.tmp4943, %m1791$.StackHead.type* %.tmp4944)
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp4945, %m1791$.AssignableInfo.type** %info
%.tmp4946 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4947 = icmp eq %m1791$.AssignableInfo.type* %.tmp4946, null
br i1 %.tmp4947, label %.if.true.4948, label %.if.false.4948
.if.true.4948:
%.tmp4949 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
ret %m1791$.AssignableInfo.type* %.tmp4949
br label %.if.end.4948
.if.false.4948:
br label %.if.end.4948
.if.end.4948:
%.tmp4950 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp4951 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4950, i32 0, i32 6
%.tmp4952 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4951
%.tmp4954 = getelementptr [5 x i8], [5 x i8]*@.str4953, i32 0, i32 0
%.tmp4955 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4952, i8* %.tmp4954)
%cast = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4955, %m261$.Node.type** %cast
%.tmp4956 = load %m261$.Node.type*, %m261$.Node.type** %cast
%.tmp4957 = icmp ne %m261$.Node.type* %.tmp4956, null
br i1 %.tmp4957, label %.if.true.4958, label %.if.false.4958
.if.true.4958:
%.tmp4959 = load %m261$.Node.type*, %m261$.Node.type** %cast
%.tmp4960 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4959, i32 0, i32 6
%.tmp4961 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4960
%.tmp4963 = getelementptr [5 x i8], [5 x i8]*@.str4962, i32 0, i32 0
%.tmp4964 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp4961, i8* %.tmp4963)
%cast_type = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp4964, %m261$.Node.type** %cast_type
%.tmp4965 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4966 = load %m261$.Node.type*, %m261$.Node.type** %cast_type
%.tmp4967 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4966, i32 0, i32 6
%.tmp4968 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4967
%.tmp4969 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp4965, %m261$.Node.type* %.tmp4968)
%type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp4969, %m1791$.Type.type** %type
%.tmp4970 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4971 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4970)
%prev_id = alloca i8*
store i8* %.tmp4971, i8** %prev_id
%.tmp4972 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4973 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp4972, %m1791$.AssignableInfo.type* %.tmp4973)
%.tmp4974 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4975 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp4974, i32 0, i32 1
%.tmp4976 = load %m0$.File.type*, %m0$.File.type** %.tmp4975
%.tmp4978 = getelementptr [26 x i8], [26 x i8]*@.str4977, i32 0, i32 0
%.tmp4979 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4980 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp4979)
%.tmp4981 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4982 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4983 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4982, i32 0, i32 3
%.tmp4984 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp4983
%.tmp4985 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4981, %m1791$.Type.type* %.tmp4984)
%.tmp4986 = load i8*, i8** %prev_id
%.tmp4987 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp4988 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp4989 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp4987, %m1791$.Type.type* %.tmp4988)
%.tmp4990 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp4976, i8* %.tmp4978, i8* %.tmp4980, i8* %.tmp4985, i8* %.tmp4986, i8* %.tmp4989)
%.tmp4991 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp4992 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp4991, i32 0, i32 3
%.tmp4993 = load %m1791$.Type.type*, %m1791$.Type.type** %type
store %m1791$.Type.type* %.tmp4993, %m1791$.Type.type** %.tmp4992
br label %.if.end.4958
.if.false.4958:
br label %.if.end.4958
.if.end.4958:
%.tmp4994 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
ret %m1791$.AssignableInfo.type* %.tmp4994
}
define %m1791$.AssignableInfo.type* @m1791$compile_assignable_stack.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m1791$.StackHead.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.StackHead.type* %.stack.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stack = alloca %m1791$.StackHead.type*
store %m1791$.StackHead.type* %.stack.arg, %m1791$.StackHead.type** %stack
%.tmp4995 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp4996 = getelementptr %m1791$.StackHead.type, %m1791$.StackHead.type* %.tmp4995, i32 0, i32 0
%.tmp4997 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp4996
%.tmp4998 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp4997, i32 0, i32 0
%.tmp4999 = load %m261$.Node.type*, %m261$.Node.type** %.tmp4998
%.tmp5000 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp4999, i32 0, i32 0
%.tmp5001 = load i8*, i8** %.tmp5000
%.tmp5003 = getelementptr [16 x i8], [16 x i8]*@.str5002, i32 0, i32 0
%.tmp5004 = call i32(i8*,i8*) @strcmp(i8* %.tmp5001, i8* %.tmp5003)
%.tmp5005 = icmp eq i32 %.tmp5004, 0
br i1 %.tmp5005, label %.if.true.5006, label %.if.false.5006
.if.true.5006:
%.tmp5007 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5008 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp5009 = getelementptr %m1791$.StackHead.type, %m1791$.StackHead.type* %.tmp5008, i32 0, i32 0
%.tmp5010 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp5009
%.tmp5011 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp5010, i32 0, i32 0
%.tmp5012 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5011
%.tmp5013 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_mono_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp5007, %m261$.Node.type* %.tmp5012)
ret %m1791$.AssignableInfo.type* %.tmp5013
br label %.if.end.5006
.if.false.5006:
br label %.if.end.5006
.if.end.5006:
%.tmp5014 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp5015 = getelementptr %m1791$.StackHead.type, %m1791$.StackHead.type* %.tmp5014, i32 0, i32 0
%.tmp5016 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp5015
%.tmp5017 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp5016, i32 0, i32 0
%.tmp5018 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5017
%.tmp5019 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5018, i32 0, i32 6
%.tmp5020 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5019
%operator = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp5020, %m261$.Node.type** %operator
%.tmp5021 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp5022 = getelementptr %m1791$.StackHead.type, %m1791$.StackHead.type* %.tmp5021, i32 0, i32 0
%.tmp5023 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp5024 = getelementptr %m1791$.StackHead.type, %m1791$.StackHead.type* %.tmp5023, i32 0, i32 0
%.tmp5025 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp5024
%.tmp5026 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp5025, i32 0, i32 1
%.tmp5027 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp5026
store %m1909$.SYStack.type* %.tmp5027, %m1909$.SYStack.type** %.tmp5022
%.tmp5028 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5029 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp5030 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m1791$.StackHead.type*) @m1791$compile_assignable_stack.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m1791$.StackHead.typep(%m1791$.CompilerCtx.type* %.tmp5028, %m1791$.StackHead.type* %.tmp5029)
%A = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp5030, %m1791$.AssignableInfo.type** %A
%.tmp5031 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %A
%.tmp5032 = icmp eq %m1791$.AssignableInfo.type* %.tmp5031, null
br i1 %.tmp5032, label %.if.true.5033, label %.if.false.5033
.if.true.5033:
%.tmp5034 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %A
ret %m1791$.AssignableInfo.type* %.tmp5034
br label %.if.end.5033
.if.false.5033:
br label %.if.end.5033
.if.end.5033:
%.tmp5035 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp5036 = getelementptr %m1791$.StackHead.type, %m1791$.StackHead.type* %.tmp5035, i32 0, i32 0
%.tmp5037 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp5038 = getelementptr %m1791$.StackHead.type, %m1791$.StackHead.type* %.tmp5037, i32 0, i32 0
%.tmp5039 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp5038
%.tmp5040 = getelementptr %m1909$.SYStack.type, %m1909$.SYStack.type* %.tmp5039, i32 0, i32 1
%.tmp5041 = load %m1909$.SYStack.type*, %m1909$.SYStack.type** %.tmp5040
store %m1909$.SYStack.type* %.tmp5041, %m1909$.SYStack.type** %.tmp5036
%.tmp5042 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5043 = load %m1791$.StackHead.type*, %m1791$.StackHead.type** %stack
%.tmp5044 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m1791$.StackHead.type*) @m1791$compile_assignable_stack.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m1791$.StackHead.typep(%m1791$.CompilerCtx.type* %.tmp5042, %m1791$.StackHead.type* %.tmp5043)
%B = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp5044, %m1791$.AssignableInfo.type** %B
%.tmp5045 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %B
%.tmp5046 = icmp eq %m1791$.AssignableInfo.type* %.tmp5045, null
br i1 %.tmp5046, label %.if.true.5047, label %.if.false.5047
.if.true.5047:
%.tmp5048 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %B
ret %m1791$.AssignableInfo.type* %.tmp5048
br label %.if.end.5047
.if.false.5047:
br label %.if.end.5047
.if.end.5047:
%.tmp5049 = bitcast ptr null to %m261$.Node.type*
%.tmp5050 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5049)
%op_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp5050, %m1791$.AssignableInfo.type** %op_info
%.tmp5051 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %op_info
%.tmp5052 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5051, i32 0, i32 3
%.tmp5053 = load %m261$.Node.type*, %m261$.Node.type** %operator
%.tmp5054 = call %m1791$.Type.type*(%m261$.Node.type*) @m1791$operator_type.m1791$.Type.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5053)
store %m1791$.Type.type* %.tmp5054, %m1791$.Type.type** %.tmp5052
%.tmp5055 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5056 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %op_info
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp5055, %m1791$.AssignableInfo.type* %.tmp5056)
%.tmp5057 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5058 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp5057, i32 0, i32 1
%.tmp5059 = load %m0$.File.type*, %m0$.File.type** %.tmp5058
%.tmp5061 = getelementptr [19 x i8], [19 x i8]*@.str5060, i32 0, i32 0
%.tmp5062 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %op_info
%.tmp5063 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp5062)
%.tmp5064 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5065 = load %m261$.Node.type*, %m261$.Node.type** %operator
%.tmp5066 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$operator_op.cp.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp5064, %m261$.Node.type* %.tmp5065)
%.tmp5067 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5068 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %A
%.tmp5069 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5068, i32 0, i32 3
%.tmp5070 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5069
%.tmp5071 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp5067, %m1791$.Type.type* %.tmp5070)
%.tmp5072 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %A
%.tmp5073 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp5072)
%.tmp5074 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %B
%.tmp5075 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp5074)
%.tmp5076 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5059, i8* %.tmp5061, i8* %.tmp5063, i8* %.tmp5066, i8* %.tmp5071, i8* %.tmp5073, i8* %.tmp5075)
%.tmp5077 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %op_info
ret %m1791$.AssignableInfo.type* %.tmp5077
}
define i8* @m1791$operator_op.cp.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.op.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%op = alloca %m261$.Node.type*
store %m261$.Node.type* %.op.arg, %m261$.Node.type** %op
%.tmp5078 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5079 = icmp eq %m261$.Node.type* %.tmp5078, null
br i1 %.tmp5079, label %.if.true.5080, label %.if.false.5080
.if.true.5080:
%.tmp5081 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5082 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5084 = getelementptr [31 x i8], [31 x i8]*@.str5083, i32 0, i32 0
%.tmp5085 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp5081, %m261$.Node.type* %.tmp5082, i8* %.tmp5084)
%.tmp5086 = call i32(i8*,...) @printf(i8* %.tmp5085)
br label %.if.end.5080
.if.false.5080:
br label %.if.end.5080
.if.end.5080:
%.tmp5087 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5088 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5087, i32 0, i32 1
%.tmp5089 = load i8*, i8** %.tmp5088
%.tmp5091 = getelementptr [2 x i8], [2 x i8]*@.str5090, i32 0, i32 0
%.tmp5092 = call i32(i8*,i8*) @strcmp(i8* %.tmp5089, i8* %.tmp5091)
%.tmp5093 = icmp eq i32 %.tmp5092, 0
br i1 %.tmp5093, label %.if.true.5094, label %.if.false.5094
.if.true.5094:
%.tmp5096 = getelementptr [4 x i8], [4 x i8]*@.str5095, i32 0, i32 0
ret i8* %.tmp5096
br label %.if.end.5094
.if.false.5094:
%.tmp5097 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5098 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5097, i32 0, i32 1
%.tmp5099 = load i8*, i8** %.tmp5098
%.tmp5101 = getelementptr [2 x i8], [2 x i8]*@.str5100, i32 0, i32 0
%.tmp5102 = call i32(i8*,i8*) @strcmp(i8* %.tmp5099, i8* %.tmp5101)
%.tmp5103 = icmp eq i32 %.tmp5102, 0
br i1 %.tmp5103, label %.if.true.5104, label %.if.false.5104
.if.true.5104:
%.tmp5106 = getelementptr [4 x i8], [4 x i8]*@.str5105, i32 0, i32 0
ret i8* %.tmp5106
br label %.if.end.5104
.if.false.5104:
%.tmp5107 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5108 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5107, i32 0, i32 1
%.tmp5109 = load i8*, i8** %.tmp5108
%.tmp5111 = getelementptr [2 x i8], [2 x i8]*@.str5110, i32 0, i32 0
%.tmp5112 = call i32(i8*,i8*) @strcmp(i8* %.tmp5109, i8* %.tmp5111)
%.tmp5113 = icmp eq i32 %.tmp5112, 0
br i1 %.tmp5113, label %.if.true.5114, label %.if.false.5114
.if.true.5114:
%.tmp5116 = getelementptr [4 x i8], [4 x i8]*@.str5115, i32 0, i32 0
ret i8* %.tmp5116
br label %.if.end.5114
.if.false.5114:
%.tmp5117 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5118 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5117, i32 0, i32 1
%.tmp5119 = load i8*, i8** %.tmp5118
%.tmp5121 = getelementptr [2 x i8], [2 x i8]*@.str5120, i32 0, i32 0
%.tmp5122 = call i32(i8*,i8*) @strcmp(i8* %.tmp5119, i8* %.tmp5121)
%.tmp5123 = icmp eq i32 %.tmp5122, 0
br i1 %.tmp5123, label %.if.true.5124, label %.if.false.5124
.if.true.5124:
%.tmp5126 = getelementptr [5 x i8], [5 x i8]*@.str5125, i32 0, i32 0
ret i8* %.tmp5126
br label %.if.end.5124
.if.false.5124:
%.tmp5127 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5128 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5127, i32 0, i32 1
%.tmp5129 = load i8*, i8** %.tmp5128
%.tmp5131 = getelementptr [3 x i8], [3 x i8]*@.str5130, i32 0, i32 0
%.tmp5132 = call i32(i8*,i8*) @strcmp(i8* %.tmp5129, i8* %.tmp5131)
%.tmp5133 = icmp eq i32 %.tmp5132, 0
br i1 %.tmp5133, label %.if.true.5134, label %.if.false.5134
.if.true.5134:
%.tmp5136 = getelementptr [8 x i8], [8 x i8]*@.str5135, i32 0, i32 0
ret i8* %.tmp5136
br label %.if.end.5134
.if.false.5134:
%.tmp5137 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5138 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5137, i32 0, i32 1
%.tmp5139 = load i8*, i8** %.tmp5138
%.tmp5141 = getelementptr [3 x i8], [3 x i8]*@.str5140, i32 0, i32 0
%.tmp5142 = call i32(i8*,i8*) @strcmp(i8* %.tmp5139, i8* %.tmp5141)
%.tmp5143 = icmp eq i32 %.tmp5142, 0
br i1 %.tmp5143, label %.if.true.5144, label %.if.false.5144
.if.true.5144:
%.tmp5146 = getelementptr [8 x i8], [8 x i8]*@.str5145, i32 0, i32 0
ret i8* %.tmp5146
br label %.if.end.5144
.if.false.5144:
%.tmp5147 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5148 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5147, i32 0, i32 1
%.tmp5149 = load i8*, i8** %.tmp5148
%.tmp5151 = getelementptr [2 x i8], [2 x i8]*@.str5150, i32 0, i32 0
%.tmp5152 = call i32(i8*,i8*) @strcmp(i8* %.tmp5149, i8* %.tmp5151)
%.tmp5153 = icmp eq i32 %.tmp5152, 0
br i1 %.tmp5153, label %.if.true.5154, label %.if.false.5154
.if.true.5154:
%.tmp5156 = getelementptr [9 x i8], [9 x i8]*@.str5155, i32 0, i32 0
ret i8* %.tmp5156
br label %.if.end.5154
.if.false.5154:
%.tmp5157 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5158 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5157, i32 0, i32 1
%.tmp5159 = load i8*, i8** %.tmp5158
%.tmp5161 = getelementptr [2 x i8], [2 x i8]*@.str5160, i32 0, i32 0
%.tmp5162 = call i32(i8*,i8*) @strcmp(i8* %.tmp5159, i8* %.tmp5161)
%.tmp5163 = icmp eq i32 %.tmp5162, 0
br i1 %.tmp5163, label %.if.true.5164, label %.if.false.5164
.if.true.5164:
%.tmp5166 = getelementptr [9 x i8], [9 x i8]*@.str5165, i32 0, i32 0
ret i8* %.tmp5166
br label %.if.end.5164
.if.false.5164:
%.tmp5167 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5168 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5167, i32 0, i32 1
%.tmp5169 = load i8*, i8** %.tmp5168
%.tmp5171 = getelementptr [2 x i8], [2 x i8]*@.str5170, i32 0, i32 0
%.tmp5172 = call i32(i8*,i8*) @strcmp(i8* %.tmp5169, i8* %.tmp5171)
%.tmp5173 = icmp eq i32 %.tmp5172, 0
br i1 %.tmp5173, label %.if.true.5174, label %.if.false.5174
.if.true.5174:
%.tmp5176 = getelementptr [4 x i8], [4 x i8]*@.str5175, i32 0, i32 0
ret i8* %.tmp5176
br label %.if.end.5174
.if.false.5174:
%.tmp5177 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5178 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5177, i32 0, i32 1
%.tmp5179 = load i8*, i8** %.tmp5178
%.tmp5181 = getelementptr [2 x i8], [2 x i8]*@.str5180, i32 0, i32 0
%.tmp5182 = call i32(i8*,i8*) @strcmp(i8* %.tmp5179, i8* %.tmp5181)
%.tmp5183 = icmp eq i32 %.tmp5182, 0
br i1 %.tmp5183, label %.if.true.5184, label %.if.false.5184
.if.true.5184:
%.tmp5186 = getelementptr [3 x i8], [3 x i8]*@.str5185, i32 0, i32 0
ret i8* %.tmp5186
br label %.if.end.5184
.if.false.5184:
%.tmp5187 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5188 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5187, i32 0, i32 1
%.tmp5189 = load i8*, i8** %.tmp5188
%.tmp5191 = getelementptr [3 x i8], [3 x i8]*@.str5190, i32 0, i32 0
%.tmp5192 = call i32(i8*,i8*) @strcmp(i8* %.tmp5189, i8* %.tmp5191)
%.tmp5193 = icmp eq i32 %.tmp5192, 0
br i1 %.tmp5193, label %.if.true.5194, label %.if.false.5194
.if.true.5194:
%.tmp5196 = getelementptr [9 x i8], [9 x i8]*@.str5195, i32 0, i32 0
ret i8* %.tmp5196
br label %.if.end.5194
.if.false.5194:
%.tmp5197 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5198 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5197, i32 0, i32 1
%.tmp5199 = load i8*, i8** %.tmp5198
%.tmp5201 = getelementptr [3 x i8], [3 x i8]*@.str5200, i32 0, i32 0
%.tmp5202 = call i32(i8*,i8*) @strcmp(i8* %.tmp5199, i8* %.tmp5201)
%.tmp5203 = icmp eq i32 %.tmp5202, 0
br i1 %.tmp5203, label %.if.true.5204, label %.if.false.5204
.if.true.5204:
%.tmp5206 = getelementptr [9 x i8], [9 x i8]*@.str5205, i32 0, i32 0
ret i8* %.tmp5206
br label %.if.end.5204
.if.false.5204:
%.tmp5207 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5208 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5210 = getelementptr [30 x i8], [30 x i8]*@.str5209, i32 0, i32 0
%.tmp5211 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp5207, %m261$.Node.type* %.tmp5208, i8* %.tmp5210)
%.tmp5212 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5213 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5212, i32 0, i32 1
%.tmp5214 = load i8*, i8** %.tmp5213
%.tmp5215 = call i32(i8*,...) @printf(i8* %.tmp5211, i8* %.tmp5214)
br label %.if.end.5204
.if.end.5204:
br label %.if.end.5194
.if.end.5194:
br label %.if.end.5184
.if.end.5184:
br label %.if.end.5174
.if.end.5174:
br label %.if.end.5164
.if.end.5164:
br label %.if.end.5154
.if.end.5154:
br label %.if.end.5144
.if.end.5144:
br label %.if.end.5134
.if.end.5134:
br label %.if.end.5124
.if.end.5124:
br label %.if.end.5114
.if.end.5114:
br label %.if.end.5104
.if.end.5104:
br label %.if.end.5094
.if.end.5094:
%.tmp5217 = getelementptr [4 x i8], [4 x i8]*@.str5216, i32 0, i32 0
ret i8* %.tmp5217
}
define %m1791$.Type.type* @m1791$operator_type.m1791$.Type.typep.m261$.Node.typep(%m261$.Node.type* %.op.arg) {
%op = alloca %m261$.Node.type*
store %m261$.Node.type* %.op.arg, %m261$.Node.type** %op
%.tmp5218 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
%type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp5218, %m1791$.Type.type** %type
%.tmp5219 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5220 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5219, i32 0, i32 1
%.tmp5221 = load i8*, i8** %.tmp5220
%.tmp5223 = getelementptr [3 x i8], [3 x i8]*@.str5222, i32 0, i32 0
%.tmp5224 = call i32(i8*,i8*) @strcmp(i8* %.tmp5221, i8* %.tmp5223)
%.tmp5225 = icmp eq i32 %.tmp5224, 0
%.tmp5226 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5227 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5226, i32 0, i32 1
%.tmp5228 = load i8*, i8** %.tmp5227
%.tmp5230 = getelementptr [3 x i8], [3 x i8]*@.str5229, i32 0, i32 0
%.tmp5231 = call i32(i8*,i8*) @strcmp(i8* %.tmp5228, i8* %.tmp5230)
%.tmp5232 = icmp eq i32 %.tmp5231, 0
%.tmp5233 = or i1 %.tmp5225, %.tmp5232
%.tmp5234 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5235 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5234, i32 0, i32 1
%.tmp5236 = load i8*, i8** %.tmp5235
%.tmp5238 = getelementptr [2 x i8], [2 x i8]*@.str5237, i32 0, i32 0
%.tmp5239 = call i32(i8*,i8*) @strcmp(i8* %.tmp5236, i8* %.tmp5238)
%.tmp5240 = icmp eq i32 %.tmp5239, 0
%.tmp5241 = or i1 %.tmp5233, %.tmp5240
%.tmp5242 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5243 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5242, i32 0, i32 1
%.tmp5244 = load i8*, i8** %.tmp5243
%.tmp5246 = getelementptr [2 x i8], [2 x i8]*@.str5245, i32 0, i32 0
%.tmp5247 = call i32(i8*,i8*) @strcmp(i8* %.tmp5244, i8* %.tmp5246)
%.tmp5248 = icmp eq i32 %.tmp5247, 0
%.tmp5249 = or i1 %.tmp5241, %.tmp5248
%.tmp5250 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5251 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5250, i32 0, i32 1
%.tmp5252 = load i8*, i8** %.tmp5251
%.tmp5254 = getelementptr [2 x i8], [2 x i8]*@.str5253, i32 0, i32 0
%.tmp5255 = call i32(i8*,i8*) @strcmp(i8* %.tmp5252, i8* %.tmp5254)
%.tmp5256 = icmp eq i32 %.tmp5255, 0
%.tmp5257 = or i1 %.tmp5249, %.tmp5256
%.tmp5258 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5259 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5258, i32 0, i32 1
%.tmp5260 = load i8*, i8** %.tmp5259
%.tmp5262 = getelementptr [2 x i8], [2 x i8]*@.str5261, i32 0, i32 0
%.tmp5263 = call i32(i8*,i8*) @strcmp(i8* %.tmp5260, i8* %.tmp5262)
%.tmp5264 = icmp eq i32 %.tmp5263, 0
%.tmp5265 = or i1 %.tmp5257, %.tmp5264
%.tmp5266 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5267 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5266, i32 0, i32 1
%.tmp5268 = load i8*, i8** %.tmp5267
%.tmp5270 = getelementptr [3 x i8], [3 x i8]*@.str5269, i32 0, i32 0
%.tmp5271 = call i32(i8*,i8*) @strcmp(i8* %.tmp5268, i8* %.tmp5270)
%.tmp5272 = icmp eq i32 %.tmp5271, 0
%.tmp5273 = or i1 %.tmp5265, %.tmp5272
%.tmp5274 = load %m261$.Node.type*, %m261$.Node.type** %op
%.tmp5275 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5274, i32 0, i32 1
%.tmp5276 = load i8*, i8** %.tmp5275
%.tmp5278 = getelementptr [3 x i8], [3 x i8]*@.str5277, i32 0, i32 0
%.tmp5279 = call i32(i8*,i8*) @strcmp(i8* %.tmp5276, i8* %.tmp5278)
%.tmp5280 = icmp eq i32 %.tmp5279, 0
%.tmp5281 = or i1 %.tmp5273, %.tmp5280
br i1 %.tmp5281, label %.if.true.5282, label %.if.false.5282
.if.true.5282:
%.tmp5283 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5284 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5283, i32 0, i32 0
%.tmp5286 = getelementptr [5 x i8], [5 x i8]*@.str5285, i32 0, i32 0
store i8* %.tmp5286, i8** %.tmp5284
br label %.if.end.5282
.if.false.5282:
%.tmp5287 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5288 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5287, i32 0, i32 0
%.tmp5290 = getelementptr [4 x i8], [4 x i8]*@.str5289, i32 0, i32 0
store i8* %.tmp5290, i8** %.tmp5288
br label %.if.end.5282
.if.end.5282:
%.tmp5291 = load %m1791$.Type.type*, %m1791$.Type.type** %type
ret %m1791$.Type.type* %.tmp5291
}
define %m1791$.AssignableInfo.type* @m1791$compile_mono_assignable.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.curr_node.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%curr_node = alloca %m261$.Node.type*
store %m261$.Node.type* %.curr_node.arg, %m261$.Node.type** %curr_node
%.tmp5292 = bitcast ptr null to %m1791$.AssignableInfo.type*
%assignable_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp5292, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5293 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%mono = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp5293, %m261$.Node.type** %mono
%err_buf = alloca i8*
%buf = alloca i8*
%.tmp5294 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5295 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5294, i32 0, i32 6
%.tmp5296 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5295
%.tmp5297 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5296, i32 0, i32 0
%.tmp5298 = load i8*, i8** %.tmp5297
%.tmp5300 = getelementptr [7 x i8], [7 x i8]*@.str5299, i32 0, i32 0
%.tmp5301 = call i32(i8*,i8*) @strcmp(i8* %.tmp5298, i8* %.tmp5300)
%.tmp5302 = icmp eq i32 %.tmp5301, 0
br i1 %.tmp5302, label %.if.true.5303, label %.if.false.5303
.if.true.5303:
%.tmp5304 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5305 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5304)
store %m1791$.AssignableInfo.type* %.tmp5305, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5306 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5307 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5306, i32 0, i32 3
%.tmp5308 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5308, %m1791$.Type.type** %.tmp5307
%.tmp5309 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5310 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5309, i32 0, i32 3
%.tmp5311 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5310
%.tmp5312 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5311, i32 0, i32 0
%.tmp5314 = getelementptr [4 x i8], [4 x i8]*@.str5313, i32 0, i32 0
store i8* %.tmp5314, i8** %.tmp5312
%.tmp5315 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5316 = load i8, i8* @SCOPE_CONST
%.tmp5317 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5318 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5317, i32 0, i32 6
%.tmp5319 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5318
%.tmp5320 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5319, i32 0, i32 1
%.tmp5321 = load i8*, i8** %.tmp5320
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp5315, i8 %.tmp5316, i8* %.tmp5321)
br label %.if.end.5303
.if.false.5303:
%.tmp5322 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5323 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5322, i32 0, i32 6
%.tmp5324 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5323
%.tmp5325 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5324, i32 0, i32 0
%.tmp5326 = load i8*, i8** %.tmp5325
%.tmp5328 = getelementptr [5 x i8], [5 x i8]*@.str5327, i32 0, i32 0
%.tmp5329 = call i32(i8*,i8*) @strcmp(i8* %.tmp5326, i8* %.tmp5328)
%.tmp5330 = icmp eq i32 %.tmp5329, 0
br i1 %.tmp5330, label %.if.true.5331, label %.if.false.5331
.if.true.5331:
%.tmp5332 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5333 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5332, i32 0, i32 6
%.tmp5334 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5333
%.tmp5335 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5334, i32 0, i32 1
%.tmp5336 = load i8*, i8** %.tmp5335
%.tmp5338 = getelementptr [5 x i8], [5 x i8]*@.str5337, i32 0, i32 0
%.tmp5339 = call i32(i8*,i8*) @strcmp(i8* %.tmp5336, i8* %.tmp5338)
%.tmp5340 = icmp ne i32 %.tmp5339, 0
br i1 %.tmp5340, label %.if.true.5341, label %.if.false.5341
.if.true.5341:
%.tmp5342 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5343 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5345 = getelementptr [42 x i8], [42 x i8]*@.str5344, i32 0, i32 0
%.tmp5346 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp5342, %m261$.Node.type* %.tmp5343, i8* %.tmp5345)
%.tmp5347 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5348 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5347, i32 0, i32 6
%.tmp5349 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5348
%.tmp5350 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5349, i32 0, i32 1
%.tmp5351 = load i8*, i8** %.tmp5350
%.tmp5352 = call i32(i8*,...) @printf(i8* %.tmp5346, i8* %.tmp5351)
%.tmp5353 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp5353
br label %.if.end.5341
.if.false.5341:
br label %.if.end.5341
.if.end.5341:
%.tmp5354 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5355 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5354)
store %m1791$.AssignableInfo.type* %.tmp5355, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5356 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5357 = load i8, i8* @SCOPE_CONST
%.tmp5359 = getelementptr [5 x i8], [5 x i8]*@.str5358, i32 0, i32 0
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp5356, i8 %.tmp5357, i8* %.tmp5359)
%.tmp5360 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5361 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5360, i32 0, i32 3
%.tmp5362 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5362, %m1791$.Type.type** %.tmp5361
%.tmp5363 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5364 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5363, i32 0, i32 3
%.tmp5365 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5364
%.tmp5366 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5365, i32 0, i32 0
%.tmp5368 = getelementptr [8 x i8], [8 x i8]*@.str5367, i32 0, i32 0
store i8* %.tmp5368, i8** %.tmp5366
br label %.if.end.5331
.if.false.5331:
%.tmp5369 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5370 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5369, i32 0, i32 6
%.tmp5371 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5370
%.tmp5372 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5371, i32 0, i32 0
%.tmp5373 = load i8*, i8** %.tmp5372
%.tmp5375 = getelementptr [17 x i8], [17 x i8]*@.str5374, i32 0, i32 0
%.tmp5376 = call i32(i8*,i8*) @strcmp(i8* %.tmp5373, i8* %.tmp5375)
%.tmp5377 = icmp eq i32 %.tmp5376, 0
br i1 %.tmp5377, label %.if.true.5378, label %.if.false.5378
.if.true.5378:
%.tmp5379 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5380 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5379)
store %m1791$.AssignableInfo.type* %.tmp5380, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5381 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5382 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5381, i32 0, i32 6
%.tmp5383 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5382
%.tmp5384 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5383, i32 0, i32 6
%.tmp5385 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5384
%.tmp5387 = getelementptr [12 x i8], [12 x i8]*@.str5386, i32 0, i32 0
%.tmp5388 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp5385, i8* %.tmp5387)
%dest = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp5388, %m261$.Node.type** %dest
%.tmp5389 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5390 = load %m261$.Node.type*, %m261$.Node.type** %dest
%.tmp5391 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_addr.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp5389, %m261$.Node.type* %.tmp5390)
%var_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp5391, %m1791$.AssignableInfo.type** %var_info
%.tmp5392 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %var_info
%.tmp5393 = icmp eq %m1791$.AssignableInfo.type* %.tmp5392, null
br i1 %.tmp5393, label %.if.true.5394, label %.if.false.5394
.if.true.5394:
%.tmp5395 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
ret %m1791$.AssignableInfo.type* %.tmp5395
br label %.if.end.5394
.if.false.5394:
br label %.if.end.5394
.if.end.5394:
%.tmp5396 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5397 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %var_info
%.tmp5398 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5397, i32 0, i32 3
%.tmp5399 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5398
%.tmp5400 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp5396, %m1791$.Type.type* %.tmp5399)
%var_type_repr = alloca i8*
store i8* %.tmp5400, i8** %var_type_repr
%.tmp5401 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5402 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp5401, %m1791$.AssignableInfo.type* %.tmp5402)
%.tmp5403 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5404 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5403, i32 0, i32 3
%.tmp5405 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %var_info
%.tmp5406 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5405, i32 0, i32 3
%.tmp5407 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5406
store %m1791$.Type.type* %.tmp5407, %m1791$.Type.type** %.tmp5404
%.tmp5409 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5410 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5409, i32 0, i32 6
%.tmp5411 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5410
%.tmp5412 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5411, i32 0, i32 6
%.tmp5413 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5412
%ptr = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp5413, %m261$.Node.type** %ptr
br label %.for.start.5408
.for.start.5408:
%.tmp5414 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp5415 = load %m261$.Node.type*, %m261$.Node.type** %dest
%.tmp5416 = icmp ne %m261$.Node.type* %.tmp5414, %.tmp5415
br i1 %.tmp5416, label %.for.continue.5408, label %.for.end.5408
.for.continue.5408:
%.tmp5417 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
%type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp5417, %m1791$.Type.type** %type
%.tmp5418 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5419 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5418, i32 0, i32 3
%.tmp5420 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5421 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5420, i32 0, i32 3
%.tmp5422 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5421
store %m1791$.Type.type* %.tmp5422, %m1791$.Type.type** %.tmp5419
%.tmp5423 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5424 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5423, i32 0, i32 0
%.tmp5426 = getelementptr [4 x i8], [4 x i8]*@.str5425, i32 0, i32 0
store i8* %.tmp5426, i8** %.tmp5424
%.tmp5427 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5428 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5427, i32 0, i32 3
%.tmp5429 = load %m1791$.Type.type*, %m1791$.Type.type** %type
store %m1791$.Type.type* %.tmp5429, %m1791$.Type.type** %.tmp5428
%.tmp5430 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp5431 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5430, i32 0, i32 7
%.tmp5432 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5431
store %m261$.Node.type* %.tmp5432, %m261$.Node.type** %ptr
br label %.for.start.5408
.for.end.5408:
%.tmp5433 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5434 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5433, i32 0, i32 6
%.tmp5435 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5434
%.tmp5436 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5435, i32 0, i32 6
%.tmp5437 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5436
%.tmp5438 = load %m261$.Node.type*, %m261$.Node.type** %dest
%.tmp5439 = icmp ne %m261$.Node.type* %.tmp5437, %.tmp5438
br i1 %.tmp5439, label %.if.true.5440, label %.if.false.5440
.if.true.5440:
%.tmp5441 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5442 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp5441, i32 0, i32 1
%.tmp5443 = load %m0$.File.type*, %m0$.File.type** %.tmp5442
%.tmp5445 = getelementptr [38 x i8], [38 x i8]*@.str5444, i32 0, i32 0
%.tmp5446 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5447 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp5446)
%.tmp5448 = load i8*, i8** %var_type_repr
%.tmp5449 = load i8*, i8** %var_type_repr
%.tmp5450 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %var_info
%.tmp5451 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp5450)
%.tmp5452 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5443, i8* %.tmp5445, i8* %.tmp5447, i8* %.tmp5448, i8* %.tmp5449, i8* %.tmp5451)
br label %.if.end.5440
.if.false.5440:
%.tmp5453 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5454 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp5453, i32 0, i32 1
%.tmp5455 = load %m0$.File.type*, %m0$.File.type** %.tmp5454
%.tmp5457 = getelementptr [22 x i8], [22 x i8]*@.str5456, i32 0, i32 0
%.tmp5458 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5459 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp5458)
%.tmp5460 = load i8*, i8** %var_type_repr
%.tmp5461 = load i8*, i8** %var_type_repr
%.tmp5462 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %var_info
%.tmp5463 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp5462)
%.tmp5464 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5455, i8* %.tmp5457, i8* %.tmp5459, i8* %.tmp5460, i8* %.tmp5461, i8* %.tmp5463)
br label %.if.end.5440
.if.end.5440:
br label %.if.end.5378
.if.false.5378:
%.tmp5465 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5466 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5465, i32 0, i32 6
%.tmp5467 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5466
%.tmp5468 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5467, i32 0, i32 0
%.tmp5469 = load i8*, i8** %.tmp5468
%.tmp5471 = getelementptr [8 x i8], [8 x i8]*@.str5470, i32 0, i32 0
%.tmp5472 = call i32(i8*,i8*) @strcmp(i8* %.tmp5469, i8* %.tmp5471)
%.tmp5473 = icmp eq i32 %.tmp5472, 0
br i1 %.tmp5473, label %.if.true.5474, label %.if.false.5474
.if.true.5474:
%.tmp5475 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5476 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5475)
store %m1791$.AssignableInfo.type* %.tmp5476, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5477 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5478 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5477, i32 0, i32 3
%.tmp5479 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5479, %m1791$.Type.type** %.tmp5478
%.tmp5480 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5481 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5480, i32 0, i32 3
%.tmp5482 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5481
%.tmp5483 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5482, i32 0, i32 0
%.tmp5485 = getelementptr [5 x i8], [5 x i8]*@.str5484, i32 0, i32 0
store i8* %.tmp5485, i8** %.tmp5483
%.tmp5486 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5487 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5486, i32 0, i32 6
%.tmp5488 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5487
%.tmp5489 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5488, i32 0, i32 6
%.tmp5490 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5489
%.tmp5491 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5490, i32 0, i32 1
%.tmp5492 = load i8*, i8** %.tmp5491
%.tmp5494 = getelementptr [6 x i8], [6 x i8]*@.str5493, i32 0, i32 0
%.tmp5495 = call i32(i8*,i8*) @strcmp(i8* %.tmp5492, i8* %.tmp5494)
%.tmp5496 = icmp eq i32 %.tmp5495, 0
br i1 %.tmp5496, label %.if.true.5497, label %.if.false.5497
.if.true.5497:
%.tmp5498 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5499 = load i8, i8* @SCOPE_CONST
%.tmp5501 = getelementptr [2 x i8], [2 x i8]*@.str5500, i32 0, i32 0
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp5498, i8 %.tmp5499, i8* %.tmp5501)
br label %.if.end.5497
.if.false.5497:
%.tmp5502 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5503 = load i8, i8* @SCOPE_CONST
%.tmp5505 = getelementptr [2 x i8], [2 x i8]*@.str5504, i32 0, i32 0
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp5502, i8 %.tmp5503, i8* %.tmp5505)
br label %.if.end.5497
.if.end.5497:
br label %.if.end.5474
.if.false.5474:
%.tmp5506 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5507 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5506, i32 0, i32 6
%.tmp5508 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5507
%.tmp5509 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5508, i32 0, i32 0
%.tmp5510 = load i8*, i8** %.tmp5509
%.tmp5512 = getelementptr [8 x i8], [8 x i8]*@.str5511, i32 0, i32 0
%.tmp5513 = call i32(i8*,i8*) @strcmp(i8* %.tmp5510, i8* %.tmp5512)
%.tmp5514 = icmp eq i32 %.tmp5513, 0
br i1 %.tmp5514, label %.if.true.5515, label %.if.false.5515
.if.true.5515:
%.tmp5516 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5517 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5518 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5517, i32 0, i32 6
%.tmp5519 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5518
%.tmp5520 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5519, i32 0, i32 6
%.tmp5521 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5520
%.tmp5522 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$compile_fn_call.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp5516, %m261$.Node.type* %.tmp5521)
store %m1791$.AssignableInfo.type* %.tmp5522, %m1791$.AssignableInfo.type** %assignable_info
br label %.if.end.5515
.if.false.5515:
%.tmp5523 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5524 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5523, i32 0, i32 6
%.tmp5525 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5524
%.tmp5526 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5525, i32 0, i32 0
%.tmp5527 = load i8*, i8** %.tmp5526
%.tmp5529 = getelementptr [7 x i8], [7 x i8]*@.str5528, i32 0, i32 0
%.tmp5530 = call i32(i8*,i8*) @strcmp(i8* %.tmp5527, i8* %.tmp5529)
%.tmp5531 = icmp eq i32 %.tmp5530, 0
br i1 %.tmp5531, label %.if.true.5532, label %.if.false.5532
.if.true.5532:
%.tmp5533 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5534 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5535 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5534, i32 0, i32 6
%.tmp5536 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5535
%.tmp5537 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5536, i32 0, i32 1
%.tmp5538 = load i8*, i8** %.tmp5537
%.tmp5539 = call %m1791$.AssignableInfo.type*(%m1791$.CompilerCtx.type*,i8*) @m1791$define_string.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.tmp5533, i8* %.tmp5538)
%string_info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp5539, %m1791$.AssignableInfo.type** %string_info
%.tmp5540 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5541 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5540)
store %m1791$.AssignableInfo.type* %.tmp5541, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5542 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5543 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
call void(%m1791$.CompilerCtx.type*,%m1791$.AssignableInfo.type*) @m1791$set_assignable_tmp_id.v.m1791$.CompilerCtx.typep.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp5542, %m1791$.AssignableInfo.type* %.tmp5543)
%.tmp5544 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5545 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %string_info
%.tmp5546 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5545, i32 0, i32 3
%.tmp5547 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5546
%.tmp5548 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp5544, %m1791$.Type.type* %.tmp5547)
%str_tr = alloca i8*
store i8* %.tmp5548, i8** %str_tr
%.tmp5549 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5550 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp5549, i32 0, i32 1
%.tmp5551 = load %m0$.File.type*, %m0$.File.type** %.tmp5550
%.tmp5553 = getelementptr [44 x i8], [44 x i8]*@.str5552, i32 0, i32 0
%.tmp5554 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5555 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp5554)
%.tmp5556 = load i8*, i8** %str_tr
%.tmp5557 = load i8*, i8** %str_tr
%.tmp5558 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %string_info
%.tmp5559 = call i8*(%m1791$.AssignableInfo.type*) @m1791$repr_assignable_id.cp.m1791$.AssignableInfo.typep(%m1791$.AssignableInfo.type* %.tmp5558)
%.tmp5560 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp5551, i8* %.tmp5553, i8* %.tmp5555, i8* %.tmp5556, i8* %.tmp5557, i8* %.tmp5559)
%.tmp5561 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5562 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5561, i32 0, i32 3
%.tmp5563 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5563, %m1791$.Type.type** %.tmp5562
%.tmp5564 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5565 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5564, i32 0, i32 3
%.tmp5566 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5565
%.tmp5567 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5566, i32 0, i32 0
%.tmp5569 = getelementptr [4 x i8], [4 x i8]*@.str5568, i32 0, i32 0
store i8* %.tmp5569, i8** %.tmp5567
%.tmp5570 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5571 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5570, i32 0, i32 3
%.tmp5572 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5571
%.tmp5573 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5572, i32 0, i32 3
%.tmp5574 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5574, %m1791$.Type.type** %.tmp5573
%.tmp5575 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5576 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5575, i32 0, i32 3
%.tmp5577 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5576
%.tmp5578 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5577, i32 0, i32 3
%.tmp5579 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5578
%.tmp5580 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5579, i32 0, i32 0
%.tmp5582 = getelementptr [4 x i8], [4 x i8]*@.str5581, i32 0, i32 0
store i8* %.tmp5582, i8** %.tmp5580
br label %.if.end.5532
.if.false.5532:
%.tmp5583 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5584 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5583, i32 0, i32 6
%.tmp5585 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5584
%.tmp5586 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5585, i32 0, i32 0
%.tmp5587 = load i8*, i8** %.tmp5586
%.tmp5589 = getelementptr [4 x i8], [4 x i8]*@.str5588, i32 0, i32 0
%.tmp5590 = call i32(i8*,i8*) @strcmp(i8* %.tmp5587, i8* %.tmp5589)
%.tmp5591 = icmp eq i32 %.tmp5590, 0
br i1 %.tmp5591, label %.if.true.5592, label %.if.false.5592
.if.true.5592:
%.tmp5593 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5594 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5593)
store %m1791$.AssignableInfo.type* %.tmp5594, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5595 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5596 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5595, i32 0, i32 6
%.tmp5597 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5596
%.tmp5598 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5597, i32 0, i32 1
%.tmp5599 = load i8*, i8** %.tmp5598
%.tmp5600 = call i32(i8*) @strlen(i8* %.tmp5599)
%chr_len = alloca i32
store i32 %.tmp5600, i32* %chr_len
%.tmp5601 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5602 = load i8, i8* @SCOPE_CONST
%.tmp5604 = getelementptr [2 x i8], [2 x i8]*@.str5603, i32 0, i32 0
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp5601, i8 %.tmp5602, i8* %.tmp5604)
%intval = alloca i32
store i32 0, i32* %intval
%.tmp5605 = load i32, i32* %chr_len
%.tmp5606 = icmp eq i32 %.tmp5605, 5
br i1 %.tmp5606, label %.if.true.5607, label %.if.false.5607
.if.true.5607:
%.tmp5608 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5609 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5608, i32 0, i32 6
%.tmp5610 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5609
%.tmp5611 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5610, i32 0, i32 1
%.tmp5612 = load i8*, i8** %.tmp5611
%.tmp5614 = getelementptr [6 x i8], [6 x i8]*@.str5613, i32 0, i32 0
%.tmp5615 = getelementptr i32, i32* %intval, i32 0
%.tmp5616 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5612, i8* %.tmp5614, i32* %.tmp5615)
%.tmp5617 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5618 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5617, i32 0, i32 0
%.tmp5619 = getelementptr i8*, i8** %.tmp5618, i32 0
%.tmp5621 = getelementptr [3 x i8], [3 x i8]*@.str5620, i32 0, i32 0
%.tmp5622 = load i32, i32* %intval
%.tmp5623 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5619, i8* %.tmp5621, i32 %.tmp5622)
br label %.if.end.5607
.if.false.5607:
%.tmp5624 = load i32, i32* %chr_len
%.tmp5625 = icmp eq i32 %.tmp5624, 3
br i1 %.tmp5625, label %.if.true.5626, label %.if.false.5626
.if.true.5626:
%.tmp5627 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5628 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5627, i32 0, i32 6
%.tmp5629 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5628
%.tmp5630 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5629, i32 0, i32 1
%.tmp5631 = load i8*, i8** %.tmp5630
%.tmp5633 = getelementptr [5 x i8], [5 x i8]*@.str5632, i32 0, i32 0
%.tmp5634 = getelementptr i32, i32* %intval, i32 0
%.tmp5635 = call i32(i8*,i8*,...) @sscanf(i8* %.tmp5631, i8* %.tmp5633, i32* %.tmp5634)
%.tmp5636 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5637 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5636, i32 0, i32 0
%.tmp5638 = getelementptr i8*, i8** %.tmp5637, i32 0
%.tmp5640 = getelementptr [3 x i8], [3 x i8]*@.str5639, i32 0, i32 0
%.tmp5641 = load i32, i32* %intval
%.tmp5642 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5638, i8* %.tmp5640, i32 %.tmp5641)
br label %.if.end.5626
.if.false.5626:
%.tmp5643 = getelementptr i8*, i8** %err_buf, i32 0
%.tmp5645 = getelementptr [18 x i8], [18 x i8]*@.str5644, i32 0, i32 0
%.tmp5646 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5643, i8* %.tmp5645)
%.tmp5647 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5648 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5649 = load i8*, i8** %err_buf
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp5647, %m261$.Node.type* %.tmp5648, i8* %.tmp5649)
br label %.if.end.5626
.if.end.5626:
br label %.if.end.5607
.if.end.5607:
%.tmp5650 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5651 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5650, i32 0, i32 3
%.tmp5652 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5652, %m1791$.Type.type** %.tmp5651
%.tmp5653 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5654 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5653, i32 0, i32 3
%.tmp5655 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5654
%.tmp5656 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5655, i32 0, i32 0
%.tmp5658 = getelementptr [4 x i8], [4 x i8]*@.str5657, i32 0, i32 0
store i8* %.tmp5658, i8** %.tmp5656
br label %.if.end.5592
.if.false.5592:
%.tmp5659 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5660 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5662 = getelementptr [40 x i8], [40 x i8]*@.str5661, i32 0, i32 0
%.tmp5663 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp5659, %m261$.Node.type* %.tmp5660, i8* %.tmp5662)
%.tmp5664 = load %m261$.Node.type*, %m261$.Node.type** %mono
%.tmp5665 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5664, i32 0, i32 6
%.tmp5666 = load %m261$.Node.type*, %m261$.Node.type** %.tmp5665
%.tmp5667 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5666, i32 0, i32 0
%.tmp5668 = load i8*, i8** %.tmp5667
%.tmp5669 = call i32(i8*,...) @printf(i8* %.tmp5663, i8* %.tmp5668)
%.tmp5670 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp5670
br label %.if.end.5592
.if.end.5592:
br label %.if.end.5532
.if.end.5532:
br label %.if.end.5515
.if.end.5515:
br label %.if.end.5474
.if.end.5474:
br label %.if.end.5378
.if.end.5378:
br label %.if.end.5331
.if.end.5331:
br label %.if.end.5303
.if.end.5303:
%.tmp5671 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5672 = icmp eq %m1791$.AssignableInfo.type* %.tmp5671, null
br i1 %.tmp5672, label %.if.true.5673, label %.if.false.5673
.if.true.5673:
%.tmp5674 = bitcast ptr null to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp5674
br label %.if.end.5673
.if.false.5673:
br label %.if.end.5673
.if.end.5673:
%.tmp5675 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5676 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5675, i32 0, i32 4
%.tmp5677 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5678 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5677, i32 0, i32 3
%.tmp5679 = load i32, i32* %.tmp5678
store i32 %.tmp5679, i32* %.tmp5676
%.tmp5680 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5681 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5680, i32 0, i32 5
%.tmp5682 = load %m261$.Node.type*, %m261$.Node.type** %curr_node
%.tmp5683 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp5682, i32 0, i32 4
%.tmp5684 = load i32, i32* %.tmp5683
store i32 %.tmp5684, i32* %.tmp5681
%.tmp5685 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %assignable_info
%.tmp5686 = bitcast %m1791$.AssignableInfo.type* %.tmp5685 to %m1791$.AssignableInfo.type*
ret %m1791$.AssignableInfo.type* %.tmp5686
}
define i8* @m1791$type_abbr.cp.m1791$.Type.typep(%m1791$.Type.type* %.type.arg) {
%type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.type.arg, %m1791$.Type.type** %type
%.tmp5687 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5688 = icmp ne %m1791$.Type.type* %.tmp5687, null
%.tmp5690 = getelementptr [22 x i8], [22 x i8]*@.str5689, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5688, i8* %.tmp5690)
%.tmp5691 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5692 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5691, i32 0, i32 0
%.tmp5693 = load i8*, i8** %.tmp5692
%.tmp5694 = icmp ne i8* %.tmp5693, null
%.tmp5696 = getelementptr [59 x i8], [59 x i8]*@.str5695, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5694, i8* %.tmp5696)
%.tmp5697 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5698 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5697, i32 0, i32 0
%.tmp5699 = load i8*, i8** %.tmp5698
%.tmp5701 = getelementptr [4 x i8], [4 x i8]*@.str5700, i32 0, i32 0
%.tmp5702 = call i32(i8*,i8*) @strcmp(i8* %.tmp5699, i8* %.tmp5701)
%.tmp5703 = icmp eq i32 %.tmp5702, 0
br i1 %.tmp5703, label %.if.true.5704, label %.if.false.5704
.if.true.5704:
%.tmp5706 = getelementptr [2 x i8], [2 x i8]*@.str5705, i32 0, i32 0
ret i8* %.tmp5706
br label %.if.end.5704
.if.false.5704:
%.tmp5707 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5708 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5707, i32 0, i32 0
%.tmp5709 = load i8*, i8** %.tmp5708
%.tmp5711 = getelementptr [5 x i8], [5 x i8]*@.str5710, i32 0, i32 0
%.tmp5712 = call i32(i8*,i8*) @strcmp(i8* %.tmp5709, i8* %.tmp5711)
%.tmp5713 = icmp eq i32 %.tmp5712, 0
br i1 %.tmp5713, label %.if.true.5714, label %.if.false.5714
.if.true.5714:
%.tmp5716 = getelementptr [2 x i8], [2 x i8]*@.str5715, i32 0, i32 0
ret i8* %.tmp5716
br label %.if.end.5714
.if.false.5714:
%.tmp5717 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5718 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5717, i32 0, i32 0
%.tmp5719 = load i8*, i8** %.tmp5718
%.tmp5721 = getelementptr [5 x i8], [5 x i8]*@.str5720, i32 0, i32 0
%.tmp5722 = call i32(i8*,i8*) @strcmp(i8* %.tmp5719, i8* %.tmp5721)
%.tmp5723 = icmp eq i32 %.tmp5722, 0
br i1 %.tmp5723, label %.if.true.5724, label %.if.false.5724
.if.true.5724:
%.tmp5726 = getelementptr [2 x i8], [2 x i8]*@.str5725, i32 0, i32 0
ret i8* %.tmp5726
br label %.if.end.5724
.if.false.5724:
%.tmp5727 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5728 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5727, i32 0, i32 0
%.tmp5729 = load i8*, i8** %.tmp5728
%.tmp5731 = getelementptr [4 x i8], [4 x i8]*@.str5730, i32 0, i32 0
%.tmp5732 = call i32(i8*,i8*) @strcmp(i8* %.tmp5729, i8* %.tmp5731)
%.tmp5733 = icmp eq i32 %.tmp5732, 0
br i1 %.tmp5733, label %.if.true.5734, label %.if.false.5734
.if.true.5734:
%.tmp5736 = getelementptr [2 x i8], [2 x i8]*@.str5735, i32 0, i32 0
ret i8* %.tmp5736
br label %.if.end.5734
.if.false.5734:
%.tmp5737 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5738 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5737, i32 0, i32 0
%.tmp5739 = load i8*, i8** %.tmp5738
%.tmp5741 = getelementptr [4 x i8], [4 x i8]*@.str5740, i32 0, i32 0
%.tmp5742 = call i32(i8*,i8*) @strcmp(i8* %.tmp5739, i8* %.tmp5741)
%.tmp5743 = icmp eq i32 %.tmp5742, 0
br i1 %.tmp5743, label %.if.true.5744, label %.if.false.5744
.if.true.5744:
%.tmp5746 = getelementptr [3 x i8], [3 x i8]*@.str5745, i32 0, i32 0
ret i8* %.tmp5746
br label %.if.end.5744
.if.false.5744:
%.tmp5747 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5748 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5747, i32 0, i32 0
%.tmp5749 = load i8*, i8** %.tmp5748
%.tmp5751 = getelementptr [4 x i8], [4 x i8]*@.str5750, i32 0, i32 0
%.tmp5752 = call i32(i8*,i8*) @strcmp(i8* %.tmp5749, i8* %.tmp5751)
%.tmp5753 = icmp eq i32 %.tmp5752, 0
br i1 %.tmp5753, label %.if.true.5754, label %.if.false.5754
.if.true.5754:
%buf = alloca i8*
%.tmp5755 = getelementptr i8*, i8** %buf, i32 0
%.tmp5757 = getelementptr [4 x i8], [4 x i8]*@.str5756, i32 0, i32 0
%.tmp5758 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5759 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5758, i32 0, i32 3
%.tmp5760 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5759
%.tmp5761 = call i8*(%m1791$.Type.type*) @m1791$type_abbr.cp.m1791$.Type.typep(%m1791$.Type.type* %.tmp5760)
%.tmp5762 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5755, i8* %.tmp5757, i8* %.tmp5761)
%.tmp5763 = load i8*, i8** %buf
ret i8* %.tmp5763
br label %.if.end.5754
.if.false.5754:
%.tmp5764 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5765 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5764, i32 0, i32 0
%.tmp5766 = load i8*, i8** %.tmp5765
%.tmp5768 = getelementptr [10 x i8], [10 x i8]*@.str5767, i32 0, i32 0
%.tmp5769 = call i32(i8*,i8*) @strcmp(i8* %.tmp5766, i8* %.tmp5768)
%.tmp5770 = icmp eq i32 %.tmp5769, 0
br i1 %.tmp5770, label %.if.true.5771, label %.if.false.5771
.if.true.5771:
%.tmp5772 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5773 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5772, i32 0, i32 2
%.tmp5774 = load i8*, i8** %.tmp5773
ret i8* %.tmp5774
br label %.if.end.5771
.if.false.5771:
%.tmp5775 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5776 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5775, i32 0, i32 0
%.tmp5777 = load i8*, i8** %.tmp5776
%.tmp5779 = getelementptr [6 x i8], [6 x i8]*@.str5778, i32 0, i32 0
%.tmp5780 = call i32(i8*,i8*) @strcmp(i8* %.tmp5777, i8* %.tmp5779)
%.tmp5781 = icmp eq i32 %.tmp5780, 0
br i1 %.tmp5781, label %.if.true.5782, label %.if.false.5782
.if.true.5782:
%.tmp5784 = getelementptr [2 x i8], [2 x i8]*@.str5783, i32 0, i32 0
ret i8* %.tmp5784
br label %.if.end.5782
.if.false.5782:
%.tmp5786 = getelementptr [44 x i8], [44 x i8]*@.str5785, i32 0, i32 0
%.tmp5787 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5788 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5787, i32 0, i32 0
%.tmp5789 = load i8*, i8** %.tmp5788
%.tmp5790 = call i32(i8*,...) @printf(i8* %.tmp5786, i8* %.tmp5789)
br label %.if.end.5782
.if.end.5782:
br label %.if.end.5771
.if.end.5771:
br label %.if.end.5754
.if.end.5754:
br label %.if.end.5744
.if.end.5744:
br label %.if.end.5734
.if.end.5734:
br label %.if.end.5724
.if.end.5724:
br label %.if.end.5714
.if.end.5714:
br label %.if.end.5704
.if.end.5704:
%.tmp5791 = bitcast ptr null to i8*
ret i8* %.tmp5791
}
define i32 @m1791$calc_llvm_str_len.i.cp(i8* %.text.arg) {
%text = alloca i8*
store i8* %.text.arg, i8** %text
%len = alloca i32
store i32 0, i32* %len
%i = alloca i32
store i32 1, i32* %i
br label %.for.start.5792
.for.start.5792:
%.tmp5793 = load i32, i32* %i
%.tmp5794 = load i8*, i8** %text
%.tmp5795 = getelementptr i8, i8* %.tmp5794, i32 %.tmp5793
%.tmp5796 = load i8, i8* %.tmp5795
%.tmp5797 = icmp ne i8 %.tmp5796, 0
br i1 %.tmp5797, label %.for.continue.5792, label %.for.end.5792
.for.continue.5792:
%.tmp5798 = load i32, i32* %i
%.tmp5799 = load i8*, i8** %text
%.tmp5800 = getelementptr i8, i8* %.tmp5799, i32 %.tmp5798
%.tmp5801 = load i8, i8* %.tmp5800
%.tmp5802 = icmp eq i8 %.tmp5801, 92
%.tmp5803 = load i32, i32* %i
%.tmp5804 = add i32 %.tmp5803, 1
%.tmp5805 = load i8*, i8** %text
%.tmp5806 = getelementptr i8, i8* %.tmp5805, i32 %.tmp5804
%.tmp5807 = load i8, i8* %.tmp5806
%.tmp5808 = call i1(i8) @m3$is_digit.b.c(i8 %.tmp5807)
%.tmp5809 = and i1 %.tmp5802, %.tmp5808
br i1 %.tmp5809, label %.if.true.5810, label %.if.false.5810
.if.true.5810:
%.tmp5811 = load i32, i32* %i
%.tmp5812 = add i32 %.tmp5811, 1
store i32 %.tmp5812, i32* %i
br label %.if.end.5810
.if.false.5810:
%.tmp5813 = load i32, i32* %len
%.tmp5814 = add i32 %.tmp5813, 1
store i32 %.tmp5814, i32* %len
br label %.if.end.5810
.if.end.5810:
%.tmp5815 = load i32, i32* %i
%.tmp5816 = add i32 %.tmp5815, 1
store i32 %.tmp5816, i32* %i
br label %.for.start.5792
.for.end.5792:
%.tmp5817 = load i32, i32* %len
ret i32 %.tmp5817
}
define %m1791$.AssignableInfo.type* @m1791$define_string.m1791$.AssignableInfo.typep.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.ctx.arg, i8* %.text.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%text = alloca i8*
store i8* %.text.arg, i8** %text
%.tmp5818 = bitcast ptr null to %m261$.Node.type*
%.tmp5819 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5818)
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp5819, %m1791$.AssignableInfo.type** %info
%tmp_buff = alloca i8*
%.tmp5820 = getelementptr i8*, i8** %tmp_buff, i32 0
%.tmp5822 = getelementptr [7 x i8], [7 x i8]*@.str5821, i32 0, i32 0
%.tmp5823 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5824 = call i32(%m1791$.CompilerCtx.type*) @m1791$new_uid.i.m1791$.CompilerCtx.typep(%m1791$.CompilerCtx.type* %.tmp5823)
%.tmp5825 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5820, i8* %.tmp5822, i32 %.tmp5824)
%.tmp5826 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5827 = load i8, i8* @SCOPE_GLOBAL
%.tmp5828 = load i8*, i8** %tmp_buff
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp5826, i8 %.tmp5827, i8* %.tmp5828)
%.tmp5829 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5830 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5829, i32 0, i32 3
%.tmp5831 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5831, %m1791$.Type.type** %.tmp5830
%.tmp5832 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5833 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5832, i32 0, i32 3
%.tmp5834 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5833
%.tmp5835 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5834, i32 0, i32 0
%.tmp5837 = getelementptr [6 x i8], [6 x i8]*@.str5836, i32 0, i32 0
store i8* %.tmp5837, i8** %.tmp5835
%.tmp5838 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5839 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5838, i32 0, i32 3
%.tmp5840 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5839
%.tmp5841 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5840, i32 0, i32 3
%.tmp5842 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5842, %m1791$.Type.type** %.tmp5841
%.tmp5843 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5844 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5843, i32 0, i32 3
%.tmp5845 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5844
%.tmp5846 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5845, i32 0, i32 3
%.tmp5847 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5846
%.tmp5848 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5847, i32 0, i32 0
%.tmp5850 = getelementptr [4 x i8], [4 x i8]*@.str5849, i32 0, i32 0
store i8* %.tmp5850, i8** %.tmp5848
%.tmp5851 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5852 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5851, i32 0, i32 3
%.tmp5853 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5852
%.tmp5854 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5853, i32 0, i32 3
%.tmp5855 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5854
%.tmp5856 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5855, i32 0, i32 4
%.tmp5857 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
store %m1791$.Type.type* %.tmp5857, %m1791$.Type.type** %.tmp5856
%.tmp5858 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5859 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5858, i32 0, i32 3
%.tmp5860 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5859
%.tmp5861 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5860, i32 0, i32 3
%.tmp5862 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5861
%.tmp5863 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5862, i32 0, i32 4
%.tmp5864 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp5863
%.tmp5865 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5864, i32 0, i32 0
%.tmp5866 = getelementptr i8*, i8** %.tmp5865, i32 0
%.tmp5868 = getelementptr [3 x i8], [3 x i8]*@.str5867, i32 0, i32 0
%.tmp5869 = load i8*, i8** %text
%.tmp5870 = call i32(i8*) @m1791$calc_llvm_str_len.i.cp(i8* %.tmp5869)
%.tmp5871 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp5866, i8* %.tmp5868, i32 %.tmp5870)
%.tmp5872 = load i32, i32* @GlobalName_size
%.tmp5873 = call i8*(i32) @malloc(i32 %.tmp5872)
%.tmp5874 = bitcast i8* %.tmp5873 to %m1791$.GlobalName.type*
%global = alloca %m1791$.GlobalName.type*
store %m1791$.GlobalName.type* %.tmp5874, %m1791$.GlobalName.type** %global
%.tmp5875 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %global
%.tmp5876 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp5875, i32 0, i32 0
%.tmp5877 = load i8*, i8** %text
store i8* %.tmp5877, i8** %.tmp5876
%.tmp5878 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %global
%.tmp5879 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp5878, i32 0, i32 1
%.tmp5881 = getelementptr [7 x i8], [7 x i8]*@.str5880, i32 0, i32 0
store i8* %.tmp5881, i8** %.tmp5879
%.tmp5882 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %global
%.tmp5883 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp5882, i32 0, i32 4
store %m1791$.GlobalName.type* null, %m1791$.GlobalName.type** %.tmp5883
%.tmp5884 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %global
%.tmp5885 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp5884, i32 0, i32 3
%.tmp5886 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
store %m1791$.AssignableInfo.type* %.tmp5886, %m1791$.AssignableInfo.type** %.tmp5885
%.tmp5887 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %global
%.tmp5888 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp5887, i32 0, i32 2
store i1 0, i1* %.tmp5888
%.tmp5889 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5890 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %global
call void(%m1791$.CompilerCtx.type*,%m1791$.GlobalName.type*) @m1791$append_global.v.m1791$.CompilerCtx.typep.m1791$.GlobalName.typep(%m1791$.CompilerCtx.type* %.tmp5889, %m1791$.GlobalName.type* %.tmp5890)
%.tmp5891 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
ret %m1791$.AssignableInfo.type* %.tmp5891
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
%.tmp5892 = load %m261$.Node.type*, %m261$.Node.type** %mod
%.tmp5893 = call %m1791$.AssignableInfo.type*(%m261$.Node.type*) @m1791$new_assignable_info.m1791$.AssignableInfo.typep.m261$.Node.typep(%m261$.Node.type* %.tmp5892)
%info = alloca %m1791$.AssignableInfo.type*
store %m1791$.AssignableInfo.type* %.tmp5893, %m1791$.AssignableInfo.type** %info
%.tmp5894 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5895 = load i8, i8* @SCOPE_CONST
%.tmp5896 = load i8*, i8** %abspath
call void(%m1791$.AssignableInfo.type*,i8,i8*) @m1791$set_assignable_id.v.m1791$.AssignableInfo.typep.c.cp(%m1791$.AssignableInfo.type* %.tmp5894, i8 %.tmp5895, i8* %.tmp5896)
%.tmp5897 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5898 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5897, i32 0, i32 2
%.tmp5900 = getelementptr [7 x i8], [7 x i8]*@.str5899, i32 0, i32 0
store i8* %.tmp5900, i8** %.tmp5898
%.tmp5901 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
%.tmp5902 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp5901, i32 0, i32 3
store %m1791$.Type.type* null, %m1791$.Type.type** %.tmp5902
%.tmp5903 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5904 = load i8*, i8** %as_name
%.tmp5905 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %info
call void(%m1791$.CompilerCtx.type*,i8*,%m1791$.AssignableInfo.type*) @m1791$define_assignable.v.m1791$.CompilerCtx.typep.cp.m1791$.AssignableInfo.typep(%m1791$.CompilerCtx.type* %.tmp5903, i8* %.tmp5904, %m1791$.AssignableInfo.type* %.tmp5905)
ret void
}
define void @m1791$append_global.v.m1791$.CompilerCtx.typep.m1791$.GlobalName.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.GlobalName.type* %.g.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%g = alloca %m1791$.GlobalName.type*
store %m1791$.GlobalName.type* %.g.arg, %m1791$.GlobalName.type** %g
%.tmp5906 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5907 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp5906, i32 0, i32 3
%.tmp5908 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %.tmp5907
%.tmp5909 = icmp eq %m1791$.GlobalName.type* %.tmp5908, null
br i1 %.tmp5909, label %.if.true.5910, label %.if.false.5910
.if.true.5910:
%.tmp5911 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5912 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp5911, i32 0, i32 3
%.tmp5913 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
store %m1791$.GlobalName.type* %.tmp5913, %m1791$.GlobalName.type** %.tmp5912
br label %.if.end.5910
.if.false.5910:
%last_global = alloca %m1791$.GlobalName.type*
%.tmp5915 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5916 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp5915, i32 0, i32 3
%.tmp5917 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %.tmp5916
store %m1791$.GlobalName.type* %.tmp5917, %m1791$.GlobalName.type** %last_global
br label %.for.start.5914
.for.start.5914:
%.tmp5918 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %last_global
%.tmp5919 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp5918, i32 0, i32 4
%.tmp5920 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %.tmp5919
%.tmp5921 = icmp ne %m1791$.GlobalName.type* %.tmp5920, null
br i1 %.tmp5921, label %.for.continue.5914, label %.for.end.5914
.for.continue.5914:
%.tmp5922 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %last_global
%.tmp5923 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp5922, i32 0, i32 4
%.tmp5924 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %.tmp5923
store %m1791$.GlobalName.type* %.tmp5924, %m1791$.GlobalName.type** %last_global
br label %.for.start.5914
.for.end.5914:
%.tmp5925 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %last_global
%.tmp5926 = getelementptr %m1791$.GlobalName.type, %m1791$.GlobalName.type* %.tmp5925, i32 0, i32 4
%.tmp5927 = load %m1791$.GlobalName.type*, %m1791$.GlobalName.type** %g
store %m1791$.GlobalName.type* %.tmp5927, %m1791$.GlobalName.type** %.tmp5926
br label %.if.end.5910
.if.end.5910:
ret void
}
define i8* @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.Type.type* %.type.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.type.arg, %m1791$.Type.type** %type
%.tmp5928 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5929 = icmp eq %m1791$.Type.type* %.tmp5928, null
br i1 %.tmp5929, label %.if.true.5930, label %.if.false.5930
.if.true.5930:
%.tmp5931 = load i1, i1* @DEBUG_INTERNALS
br i1 %.tmp5931, label %.if.true.5932, label %.if.false.5932
.if.true.5932:
%.tmp5934 = getelementptr [44 x i8], [44 x i8]*@.str5933, i32 0, i32 0
%.tmp5935 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp5936 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp5935, i32 0, i32 6
%.tmp5937 = load i8*, i8** %.tmp5936
%.tmp5938 = call i32(i8*,...) @printf(i8* %.tmp5934, i8* %.tmp5937)
br label %.if.end.5932
.if.false.5932:
br label %.if.end.5932
.if.end.5932:
%.tmp5940 = getelementptr [2 x i8], [2 x i8]*@.str5939, i32 0, i32 0
ret i8* %.tmp5940
br label %.if.end.5930
.if.false.5930:
br label %.if.end.5930
.if.end.5930:
%.tmp5941 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5942 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5941, i32 0, i32 0
%.tmp5943 = load i8*, i8** %.tmp5942
%.tmp5944 = icmp ne i8* %.tmp5943, null
%.tmp5946 = getelementptr [59 x i8], [59 x i8]*@.str5945, i32 0, i32 0
call void(i1,i8*) @m2$assert.v.b.cp(i1 %.tmp5944, i8* %.tmp5946)
%buf = alloca i8*
%.tmp5947 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5948 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5947, i32 0, i32 0
%.tmp5949 = load i8*, i8** %.tmp5948
%.tmp5951 = getelementptr [4 x i8], [4 x i8]*@.str5950, i32 0, i32 0
%.tmp5952 = call i32(i8*,i8*) @strcmp(i8* %.tmp5949, i8* %.tmp5951)
%.tmp5953 = icmp eq i32 %.tmp5952, 0
br i1 %.tmp5953, label %.if.true.5954, label %.if.false.5954
.if.true.5954:
%.tmp5956 = getelementptr [4 x i8], [4 x i8]*@.str5955, i32 0, i32 0
ret i8* %.tmp5956
br label %.if.end.5954
.if.false.5954:
%.tmp5957 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5958 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5957, i32 0, i32 0
%.tmp5959 = load i8*, i8** %.tmp5958
%.tmp5961 = getelementptr [5 x i8], [5 x i8]*@.str5960, i32 0, i32 0
%.tmp5962 = call i32(i8*,i8*) @strcmp(i8* %.tmp5959, i8* %.tmp5961)
%.tmp5963 = icmp eq i32 %.tmp5962, 0
br i1 %.tmp5963, label %.if.true.5964, label %.if.false.5964
.if.true.5964:
%.tmp5966 = getelementptr [5 x i8], [5 x i8]*@.str5965, i32 0, i32 0
ret i8* %.tmp5966
br label %.if.end.5964
.if.false.5964:
%.tmp5967 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5968 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5967, i32 0, i32 0
%.tmp5969 = load i8*, i8** %.tmp5968
%.tmp5971 = getelementptr [5 x i8], [5 x i8]*@.str5970, i32 0, i32 0
%.tmp5972 = call i32(i8*,i8*) @strcmp(i8* %.tmp5969, i8* %.tmp5971)
%.tmp5973 = icmp eq i32 %.tmp5972, 0
br i1 %.tmp5973, label %.if.true.5974, label %.if.false.5974
.if.true.5974:
%.tmp5976 = getelementptr [3 x i8], [3 x i8]*@.str5975, i32 0, i32 0
ret i8* %.tmp5976
br label %.if.end.5974
.if.false.5974:
%.tmp5977 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5978 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5977, i32 0, i32 0
%.tmp5979 = load i8*, i8** %.tmp5978
%.tmp5981 = getelementptr [8 x i8], [8 x i8]*@.str5980, i32 0, i32 0
%.tmp5982 = call i32(i8*,i8*) @strcmp(i8* %.tmp5979, i8* %.tmp5981)
%.tmp5983 = icmp eq i32 %.tmp5982, 0
br i1 %.tmp5983, label %.if.true.5984, label %.if.false.5984
.if.true.5984:
%.tmp5986 = getelementptr [4 x i8], [4 x i8]*@.str5985, i32 0, i32 0
ret i8* %.tmp5986
br label %.if.end.5984
.if.false.5984:
%.tmp5987 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5988 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5987, i32 0, i32 0
%.tmp5989 = load i8*, i8** %.tmp5988
%.tmp5991 = getelementptr [4 x i8], [4 x i8]*@.str5990, i32 0, i32 0
%.tmp5992 = call i32(i8*,i8*) @strcmp(i8* %.tmp5989, i8* %.tmp5991)
%.tmp5993 = icmp eq i32 %.tmp5992, 0
br i1 %.tmp5993, label %.if.true.5994, label %.if.false.5994
.if.true.5994:
%.tmp5996 = getelementptr [3 x i8], [3 x i8]*@.str5995, i32 0, i32 0
ret i8* %.tmp5996
br label %.if.end.5994
.if.false.5994:
%.tmp5997 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp5998 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp5997, i32 0, i32 0
%.tmp5999 = load i8*, i8** %.tmp5998
%.tmp6001 = getelementptr [9 x i8], [9 x i8]*@.str6000, i32 0, i32 0
%.tmp6002 = call i32(i8*,i8*) @strcmp(i8* %.tmp5999, i8* %.tmp6001)
%.tmp6003 = icmp eq i32 %.tmp6002, 0
br i1 %.tmp6003, label %.if.true.6004, label %.if.false.6004
.if.true.6004:
%.tmp6005 = getelementptr i8*, i8** %buf, i32 0
%.tmp6007 = getelementptr [4 x i8], [4 x i8]*@.str6006, i32 0, i32 0
%.tmp6008 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6009 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6010 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6009, i32 0, i32 3
%.tmp6011 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6010
%.tmp6012 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp6008, %m1791$.Type.type* %.tmp6011)
%.tmp6013 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6005, i8* %.tmp6007, i8* %.tmp6012)
%.tmp6015 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6016 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6015, i32 0, i32 3
%.tmp6017 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6016
%.tmp6018 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6017, i32 0, i32 4
%.tmp6019 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6018
%p = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp6019, %m1791$.Type.type** %p
br label %.for.start.6014
.for.start.6014:
%.tmp6020 = load %m1791$.Type.type*, %m1791$.Type.type** %p
%.tmp6021 = icmp ne %m1791$.Type.type* %.tmp6020, null
br i1 %.tmp6021, label %.for.continue.6014, label %.for.end.6014
.for.continue.6014:
%.tmp6022 = load %m1791$.Type.type*, %m1791$.Type.type** %p
%.tmp6023 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6024 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6023, i32 0, i32 3
%.tmp6025 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6024
%.tmp6026 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6025, i32 0, i32 4
%.tmp6027 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6026
%.tmp6028 = icmp ne %m1791$.Type.type* %.tmp6022, %.tmp6027
br i1 %.tmp6028, label %.if.true.6029, label %.if.false.6029
.if.true.6029:
%.tmp6030 = getelementptr i8*, i8** %buf, i32 0
%.tmp6032 = getelementptr [4 x i8], [4 x i8]*@.str6031, i32 0, i32 0
%.tmp6033 = load i8*, i8** %buf
%.tmp6034 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6030, i8* %.tmp6032, i8* %.tmp6033)
br label %.if.end.6029
.if.false.6029:
br label %.if.end.6029
.if.end.6029:
%.tmp6035 = getelementptr i8*, i8** %buf, i32 0
%.tmp6037 = getelementptr [5 x i8], [5 x i8]*@.str6036, i32 0, i32 0
%.tmp6038 = load i8*, i8** %buf
%.tmp6039 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6040 = load %m1791$.Type.type*, %m1791$.Type.type** %p
%.tmp6041 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp6039, %m1791$.Type.type* %.tmp6040)
%.tmp6042 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6035, i8* %.tmp6037, i8* %.tmp6038, i8* %.tmp6041)
%.tmp6043 = load %m1791$.Type.type*, %m1791$.Type.type** %p
%.tmp6044 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6043, i32 0, i32 4
%.tmp6045 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6044
store %m1791$.Type.type* %.tmp6045, %m1791$.Type.type** %p
br label %.for.start.6014
.for.end.6014:
%.tmp6046 = getelementptr i8*, i8** %buf, i32 0
%.tmp6048 = getelementptr [4 x i8], [4 x i8]*@.str6047, i32 0, i32 0
%.tmp6049 = load i8*, i8** %buf
%.tmp6050 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6046, i8* %.tmp6048, i8* %.tmp6049)
%.tmp6051 = load i8*, i8** %buf
ret i8* %.tmp6051
br label %.if.end.6004
.if.false.6004:
%.tmp6052 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6053 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6052, i32 0, i32 0
%.tmp6054 = load i8*, i8** %.tmp6053
%.tmp6056 = getelementptr [4 x i8], [4 x i8]*@.str6055, i32 0, i32 0
%.tmp6057 = call i32(i8*,i8*) @strcmp(i8* %.tmp6054, i8* %.tmp6056)
%.tmp6058 = icmp eq i32 %.tmp6057, 0
br i1 %.tmp6058, label %.if.true.6059, label %.if.false.6059
.if.true.6059:
%.tmp6060 = getelementptr i8*, i8** %buf, i32 0
%.tmp6062 = getelementptr [4 x i8], [4 x i8]*@.str6061, i32 0, i32 0
%.tmp6063 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6064 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6065 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6064, i32 0, i32 3
%.tmp6066 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6065
%.tmp6067 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp6063, %m1791$.Type.type* %.tmp6066)
%.tmp6068 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6060, i8* %.tmp6062, i8* %.tmp6067)
%.tmp6069 = load i8*, i8** %buf
ret i8* %.tmp6069
br label %.if.end.6059
.if.false.6059:
%.tmp6070 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6071 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6070, i32 0, i32 0
%.tmp6072 = load i8*, i8** %.tmp6071
%.tmp6074 = getelementptr [7 x i8], [7 x i8]*@.str6073, i32 0, i32 0
%.tmp6075 = call i32(i8*,i8*) @strcmp(i8* %.tmp6072, i8* %.tmp6074)
%.tmp6076 = icmp eq i32 %.tmp6075, 0
br i1 %.tmp6076, label %.if.true.6077, label %.if.false.6077
.if.true.6077:
%.tmp6078 = getelementptr i8*, i8** %buf, i32 0
%.tmp6080 = getelementptr [2 x i8], [2 x i8]*@.str6079, i32 0, i32 0
%.tmp6081 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6078, i8* %.tmp6080)
%.tmp6083 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6084 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6083, i32 0, i32 3
%.tmp6085 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6084
%t = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp6085, %m1791$.Type.type** %t
br label %.for.start.6082
.for.start.6082:
%.tmp6086 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6087 = icmp ne %m1791$.Type.type* %.tmp6086, null
br i1 %.tmp6087, label %.for.continue.6082, label %.for.end.6082
.for.continue.6082:
%.tmp6088 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6089 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6090 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6089, i32 0, i32 3
%.tmp6091 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6090
%.tmp6092 = icmp ne %m1791$.Type.type* %.tmp6088, %.tmp6091
br i1 %.tmp6092, label %.if.true.6093, label %.if.false.6093
.if.true.6093:
%.tmp6094 = getelementptr i8*, i8** %buf, i32 0
%.tmp6096 = getelementptr [4 x i8], [4 x i8]*@.str6095, i32 0, i32 0
%.tmp6097 = load i8*, i8** %buf
%.tmp6098 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6094, i8* %.tmp6096, i8* %.tmp6097)
br label %.if.end.6093
.if.false.6093:
br label %.if.end.6093
.if.end.6093:
%.tmp6099 = getelementptr i8*, i8** %buf, i32 0
%.tmp6101 = getelementptr [5 x i8], [5 x i8]*@.str6100, i32 0, i32 0
%.tmp6102 = load i8*, i8** %buf
%.tmp6103 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6104 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6105 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp6103, %m1791$.Type.type* %.tmp6104)
%.tmp6106 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6099, i8* %.tmp6101, i8* %.tmp6102, i8* %.tmp6105)
%.tmp6107 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6108 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6107, i32 0, i32 4
%.tmp6109 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6108
store %m1791$.Type.type* %.tmp6109, %m1791$.Type.type** %t
br label %.for.start.6082
.for.end.6082:
%.tmp6110 = getelementptr i8*, i8** %buf, i32 0
%.tmp6112 = getelementptr [4 x i8], [4 x i8]*@.str6111, i32 0, i32 0
%.tmp6113 = load i8*, i8** %buf
%.tmp6114 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6110, i8* %.tmp6112, i8* %.tmp6113)
%.tmp6115 = load i8*, i8** %buf
ret i8* %.tmp6115
br label %.if.end.6077
.if.false.6077:
%.tmp6116 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6117 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6116, i32 0, i32 0
%.tmp6118 = load i8*, i8** %.tmp6117
%.tmp6120 = getelementptr [6 x i8], [6 x i8]*@.str6119, i32 0, i32 0
%.tmp6121 = call i32(i8*,i8*) @strcmp(i8* %.tmp6118, i8* %.tmp6120)
%.tmp6122 = icmp eq i32 %.tmp6121, 0
br i1 %.tmp6122, label %.if.true.6123, label %.if.false.6123
.if.true.6123:
%.tmp6124 = getelementptr i8*, i8** %buf, i32 0
%.tmp6126 = getelementptr [10 x i8], [10 x i8]*@.str6125, i32 0, i32 0
%.tmp6127 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6128 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6127, i32 0, i32 3
%.tmp6129 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6128
%.tmp6130 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6129, i32 0, i32 4
%.tmp6131 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6130
%.tmp6132 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6131, i32 0, i32 0
%.tmp6133 = load i8*, i8** %.tmp6132
%.tmp6134 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6135 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6136 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6135, i32 0, i32 3
%.tmp6137 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6136
%.tmp6138 = call i8*(%m1791$.CompilerCtx.type*,%m1791$.Type.type*) @m1791$type_repr.cp.m1791$.CompilerCtx.typep.m1791$.Type.typep(%m1791$.CompilerCtx.type* %.tmp6134, %m1791$.Type.type* %.tmp6137)
%.tmp6139 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6124, i8* %.tmp6126, i8* %.tmp6133, i8* %.tmp6138)
%.tmp6140 = load i8*, i8** %buf
ret i8* %.tmp6140
br label %.if.end.6123
.if.false.6123:
%.tmp6141 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6142 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6141, i32 0, i32 0
%.tmp6143 = load i8*, i8** %.tmp6142
%.tmp6145 = getelementptr [10 x i8], [10 x i8]*@.str6144, i32 0, i32 0
%.tmp6146 = call i32(i8*,i8*) @strcmp(i8* %.tmp6143, i8* %.tmp6145)
%.tmp6147 = icmp eq i32 %.tmp6146, 0
br i1 %.tmp6147, label %.if.true.6148, label %.if.false.6148
.if.true.6148:
%.tmp6149 = getelementptr i8*, i8** %buf, i32 0
%.tmp6151 = getelementptr [5 x i8], [5 x i8]*@.str6150, i32 0, i32 0
%.tmp6152 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6153 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6152, i32 0, i32 2
%.tmp6154 = load i8*, i8** %.tmp6153
%.tmp6155 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6149, i8* %.tmp6151, i8* %.tmp6154)
%.tmp6156 = load i8*, i8** %buf
ret i8* %.tmp6156
br label %.if.end.6148
.if.false.6148:
%.tmp6157 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6158 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6157, i32 0, i32 0
%.tmp6159 = load i8*, i8** %.tmp6158
%.tmp6161 = getelementptr [4 x i8], [4 x i8]*@.str6160, i32 0, i32 0
%.tmp6162 = call i32(i8*,i8*) @strcmp(i8* %.tmp6159, i8* %.tmp6161)
%.tmp6163 = icmp eq i32 %.tmp6162, 0
br i1 %.tmp6163, label %.if.true.6164, label %.if.false.6164
.if.true.6164:
%.tmp6166 = getelementptr [4 x i8], [4 x i8]*@.str6165, i32 0, i32 0
ret i8* %.tmp6166
br label %.if.end.6164
.if.false.6164:
%.tmp6167 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6168 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6167, i32 0, i32 0
%.tmp6169 = load i8*, i8** %.tmp6168
%.tmp6171 = getelementptr [7 x i8], [7 x i8]*@.str6170, i32 0, i32 0
%.tmp6172 = call i32(i8*,i8*) @strcmp(i8* %.tmp6169, i8* %.tmp6171)
%.tmp6173 = icmp eq i32 %.tmp6172, 0
br i1 %.tmp6173, label %.if.true.6174, label %.if.false.6174
.if.true.6174:
%.tmp6176 = getelementptr [4 x i8], [4 x i8]*@.str6175, i32 0, i32 0
ret i8* %.tmp6176
br label %.if.end.6174
.if.false.6174:
%.tmp6177 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6178 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6177, i32 0, i32 0
%.tmp6179 = load i8*, i8** %.tmp6178
%.tmp6181 = getelementptr [6 x i8], [6 x i8]*@.str6180, i32 0, i32 0
%.tmp6182 = call i32(i8*,i8*) @strcmp(i8* %.tmp6179, i8* %.tmp6181)
%.tmp6183 = icmp eq i32 %.tmp6182, 0
br i1 %.tmp6183, label %.if.true.6184, label %.if.false.6184
.if.true.6184:
br label %.if.end.6184
.if.false.6184:
%.tmp6186 = getelementptr [58 x i8], [58 x i8]*@.str6185, i32 0, i32 0
%.tmp6187 = load %m1791$.Type.type*, %m1791$.Type.type** %type
%.tmp6188 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6187, i32 0, i32 0
%.tmp6189 = load i8*, i8** %.tmp6188
%.tmp6190 = call i32(i8*,...) @printf(i8* %.tmp6186, i8* %.tmp6189)
br label %.if.end.6184
.if.end.6184:
br label %.if.end.6174
.if.end.6174:
br label %.if.end.6164
.if.end.6164:
br label %.if.end.6148
.if.end.6148:
br label %.if.end.6123
.if.end.6123:
br label %.if.end.6077
.if.end.6077:
br label %.if.end.6059
.if.end.6059:
br label %.if.end.6004
.if.end.6004:
br label %.if.end.5994
.if.end.5994:
br label %.if.end.5984
.if.end.5984:
br label %.if.end.5974
.if.end.5974:
br label %.if.end.5964
.if.end.5964:
br label %.if.end.5954
.if.end.5954:
%.tmp6191 = bitcast ptr null to i8*
ret i8* %.tmp6191
}
define void @m1791$append_error.v.m1791$.CompilerCtx.typep.m678$.Error.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m678$.Error.type* %.e.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%e = alloca %m678$.Error.type*
store %m678$.Error.type* %.e.arg, %m678$.Error.type** %e
%.tmp6192 = load i32, i32* @ErrorList_size
%.tmp6193 = call i8*(i32) @malloc(i32 %.tmp6192)
%.tmp6194 = bitcast i8* %.tmp6193 to %m1791$.ErrorList.type*
%new_err = alloca %m1791$.ErrorList.type*
store %m1791$.ErrorList.type* %.tmp6194, %m1791$.ErrorList.type** %new_err
%.tmp6195 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %new_err
%.tmp6196 = getelementptr %m1791$.ErrorList.type, %m1791$.ErrorList.type* %.tmp6195, i32 0, i32 0
%.tmp6197 = load %m678$.Error.type*, %m678$.Error.type** %e
store %m678$.Error.type* %.tmp6197, %m678$.Error.type** %.tmp6196
%.tmp6198 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %new_err
%.tmp6199 = getelementptr %m1791$.ErrorList.type, %m1791$.ErrorList.type* %.tmp6198, i32 0, i32 1
store %m1791$.ErrorList.type* null, %m1791$.ErrorList.type** %.tmp6199
%.tmp6200 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6201 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp6200, i32 0, i32 2
%.tmp6202 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %.tmp6201
%.tmp6203 = icmp eq %m1791$.ErrorList.type* %.tmp6202, null
br i1 %.tmp6203, label %.if.true.6204, label %.if.false.6204
.if.true.6204:
%.tmp6205 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6206 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp6205, i32 0, i32 2
%.tmp6207 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %new_err
store %m1791$.ErrorList.type* %.tmp6207, %m1791$.ErrorList.type** %.tmp6206
ret void
br label %.if.end.6204
.if.false.6204:
br label %.if.end.6204
.if.end.6204:
%.tmp6209 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6210 = getelementptr %m1791$.CompilerCtx.type, %m1791$.CompilerCtx.type* %.tmp6209, i32 0, i32 2
%.tmp6211 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %.tmp6210
%last = alloca %m1791$.ErrorList.type*
store %m1791$.ErrorList.type* %.tmp6211, %m1791$.ErrorList.type** %last
br label %.for.start.6208
.for.start.6208:
%.tmp6212 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %last
%.tmp6213 = getelementptr %m1791$.ErrorList.type, %m1791$.ErrorList.type* %.tmp6212, i32 0, i32 1
%.tmp6214 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %.tmp6213
%.tmp6215 = icmp ne %m1791$.ErrorList.type* %.tmp6214, null
br i1 %.tmp6215, label %.for.continue.6208, label %.for.end.6208
.for.continue.6208:
%.tmp6216 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %last
%.tmp6217 = getelementptr %m1791$.ErrorList.type, %m1791$.ErrorList.type* %.tmp6216, i32 0, i32 1
%.tmp6218 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %.tmp6217
store %m1791$.ErrorList.type* %.tmp6218, %m1791$.ErrorList.type** %last
br label %.for.start.6208
.for.end.6208:
%.tmp6219 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %last
%.tmp6220 = getelementptr %m1791$.ErrorList.type, %m1791$.ErrorList.type* %.tmp6219, i32 0, i32 1
%.tmp6221 = load %m1791$.ErrorList.type*, %m1791$.ErrorList.type** %new_err
store %m1791$.ErrorList.type* %.tmp6221, %m1791$.ErrorList.type** %.tmp6220
ret void
}
define i8* @m1791$syn_function_name.cp.m261$.Node.typep(%m261$.Node.type* %.stmt.arg) {
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp6222 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6223 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6222, i32 0, i32 6
%.tmp6224 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6223
%.tmp6225 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6224, i32 0, i32 7
%.tmp6226 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6225
%.tmp6227 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6226, i32 0, i32 1
%.tmp6228 = load i8*, i8** %.tmp6227
ret i8* %.tmp6228
}
define %m261$.Node.type* @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.node.arg, i8* %.type.arg) {
%node = alloca %m261$.Node.type*
store %m261$.Node.type* %.node.arg, %m261$.Node.type** %node
%type = alloca i8*
store i8* %.type.arg, i8** %type
%.tmp6230 = load %m261$.Node.type*, %m261$.Node.type** %node
%n = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp6230, %m261$.Node.type** %n
br label %.for.start.6229
.for.start.6229:
%.tmp6231 = load %m261$.Node.type*, %m261$.Node.type** %n
%.tmp6232 = icmp ne %m261$.Node.type* %.tmp6231, null
br i1 %.tmp6232, label %.for.continue.6229, label %.for.end.6229
.for.continue.6229:
%.tmp6233 = load %m261$.Node.type*, %m261$.Node.type** %n
%.tmp6234 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6233, i32 0, i32 0
%.tmp6235 = load i8*, i8** %.tmp6234
%.tmp6236 = load i8*, i8** %type
%.tmp6237 = call i32(i8*,i8*) @strcmp(i8* %.tmp6235, i8* %.tmp6236)
%.tmp6238 = icmp eq i32 %.tmp6237, 0
br i1 %.tmp6238, label %.if.true.6239, label %.if.false.6239
.if.true.6239:
%.tmp6240 = load %m261$.Node.type*, %m261$.Node.type** %n
ret %m261$.Node.type* %.tmp6240
br label %.if.end.6239
.if.false.6239:
br label %.if.end.6239
.if.end.6239:
%.tmp6241 = load %m261$.Node.type*, %m261$.Node.type** %n
%.tmp6242 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6241, i32 0, i32 7
%.tmp6243 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6242
store %m261$.Node.type* %.tmp6243, %m261$.Node.type** %n
br label %.for.start.6229
.for.end.6229:
%.tmp6244 = bitcast ptr null to %m261$.Node.type*
ret %m261$.Node.type* %.tmp6244
}
define %m1791$.Type.type* @m1791$syn_function_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp6245 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
%function_type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp6245, %m1791$.Type.type** %function_type
%.tmp6246 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6247 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6248 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6247, i32 0, i32 6
%.tmp6249 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6248
%.tmp6250 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp6246, %m261$.Node.type* %.tmp6249)
%return_value_type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp6250, %m1791$.Type.type** %return_value_type
%.tmp6251 = load %m1791$.Type.type*, %m1791$.Type.type** %function_type
%.tmp6252 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6251, i32 0, i32 0
%.tmp6254 = getelementptr [9 x i8], [9 x i8]*@.str6253, i32 0, i32 0
store i8* %.tmp6254, i8** %.tmp6252
%.tmp6255 = load %m1791$.Type.type*, %m1791$.Type.type** %function_type
%.tmp6256 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6255, i32 0, i32 3
%.tmp6257 = load %m1791$.Type.type*, %m1791$.Type.type** %return_value_type
store %m1791$.Type.type* %.tmp6257, %m1791$.Type.type** %.tmp6256
%.tmp6258 = load %m1791$.Type.type*, %m1791$.Type.type** %return_value_type
%last_type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp6258, %m1791$.Type.type** %last_type
%.tmp6259 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6260 = call %m261$.Node.type*(%m261$.Node.type*) @m1791$syn_function_params.m261$.Node.typep.m261$.Node.typep(%m261$.Node.type* %.tmp6259)
%params = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp6260, %m261$.Node.type** %params
%.tmp6262 = load %m261$.Node.type*, %m261$.Node.type** %params
%param_ptr = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp6262, %m261$.Node.type** %param_ptr
br label %.for.start.6261
.for.start.6261:
%.tmp6263 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6264 = icmp ne %m261$.Node.type* %.tmp6263, null
br i1 %.tmp6264, label %.for.continue.6261, label %.for.end.6261
.for.continue.6261:
%.tmp6265 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6266 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6265, i32 0, i32 0
%.tmp6267 = load i8*, i8** %.tmp6266
%.tmp6269 = getelementptr [5 x i8], [5 x i8]*@.str6268, i32 0, i32 0
%.tmp6270 = call i32(i8*,i8*) @strcmp(i8* %.tmp6267, i8* %.tmp6269)
%.tmp6271 = icmp eq i32 %.tmp6270, 0
br i1 %.tmp6271, label %.if.true.6272, label %.if.false.6272
.if.true.6272:
%.tmp6273 = load %m1791$.Type.type*, %m1791$.Type.type** %last_type
%.tmp6274 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6273, i32 0, i32 4
%.tmp6275 = load %m1791$.Type.type*, %m1791$.Type.type** %last_type
%.tmp6276 = call %m1791$.Type.type*(%m1791$.Type.type*) @m1791$type_clone.m1791$.Type.typep.m1791$.Type.typep(%m1791$.Type.type* %.tmp6275)
store %m1791$.Type.type* %.tmp6276, %m1791$.Type.type** %.tmp6274
%.tmp6277 = load %m1791$.Type.type*, %m1791$.Type.type** %last_type
%.tmp6278 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6277, i32 0, i32 4
%.tmp6279 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6278
%.tmp6280 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6279, i32 0, i32 4
store %m1791$.Type.type* null, %m1791$.Type.type** %.tmp6280
%.tmp6281 = load %m1791$.Type.type*, %m1791$.Type.type** %last_type
%.tmp6282 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6281, i32 0, i32 4
%.tmp6283 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6282
store %m1791$.Type.type* %.tmp6283, %m1791$.Type.type** %last_type
%.tmp6284 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6285 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6284, i32 0, i32 7
%.tmp6286 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6285
%.tmp6287 = icmp ne %m261$.Node.type* %.tmp6286, null
br i1 %.tmp6287, label %.if.true.6288, label %.if.false.6288
.if.true.6288:
%.tmp6289 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6290 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6289, i32 0, i32 7
%.tmp6291 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6290
store %m261$.Node.type* %.tmp6291, %m261$.Node.type** %param_ptr
br label %.if.end.6288
.if.false.6288:
br label %.if.end.6288
.if.end.6288:
%.tmp6292 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6293 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6292, i32 0, i32 7
%.tmp6294 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6293
%.tmp6295 = icmp ne %m261$.Node.type* %.tmp6294, null
br i1 %.tmp6295, label %.if.true.6296, label %.if.false.6296
.if.true.6296:
%.tmp6297 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6298 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6297, i32 0, i32 7
%.tmp6299 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6298
store %m261$.Node.type* %.tmp6299, %m261$.Node.type** %param_ptr
br label %.if.end.6296
.if.false.6296:
store %m261$.Node.type* null, %m261$.Node.type** %param_ptr
br label %.if.end.6296
.if.end.6296:
br label %.if.end.6272
.if.false.6272:
%.tmp6300 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6301 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6302 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6301, i32 0, i32 6
%.tmp6303 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6302
%.tmp6304 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp6300, %m261$.Node.type* %.tmp6303)
%param_type = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp6304, %m1791$.Type.type** %param_type
%.tmp6305 = load %m1791$.Type.type*, %m1791$.Type.type** %last_type
%.tmp6306 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6305, i32 0, i32 4
%.tmp6307 = load %m1791$.Type.type*, %m1791$.Type.type** %param_type
store %m1791$.Type.type* %.tmp6307, %m1791$.Type.type** %.tmp6306
%.tmp6308 = load %m1791$.Type.type*, %m1791$.Type.type** %param_type
store %m1791$.Type.type* %.tmp6308, %m1791$.Type.type** %last_type
%.tmp6309 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6310 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6309, i32 0, i32 7
%.tmp6311 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6310
store %m261$.Node.type* %.tmp6311, %m261$.Node.type** %param_ptr
%.tmp6312 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6313 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6312, i32 0, i32 7
%.tmp6314 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6313
%.tmp6315 = icmp ne %m261$.Node.type* %.tmp6314, null
br i1 %.tmp6315, label %.if.true.6316, label %.if.false.6316
.if.true.6316:
%.tmp6317 = load %m261$.Node.type*, %m261$.Node.type** %param_ptr
%.tmp6318 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6317, i32 0, i32 7
%.tmp6319 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6318
%.tmp6320 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6319, i32 0, i32 7
%.tmp6321 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6320
store %m261$.Node.type* %.tmp6321, %m261$.Node.type** %param_ptr
br label %.if.end.6316
.if.false.6316:
store %m261$.Node.type* null, %m261$.Node.type** %param_ptr
br label %.if.end.6316
.if.end.6316:
br label %.if.end.6272
.if.end.6272:
br label %.for.start.6261
.for.end.6261:
%.tmp6322 = load %m1791$.Type.type*, %m1791$.Type.type** %function_type
ret %m1791$.Type.type* %.tmp6322
}
define %m261$.Node.type* @m1791$syn_function_params.m261$.Node.typep.m261$.Node.typep(%m261$.Node.type* %.stmt.arg) {
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp6323 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6325 = getelementptr [10 x i8], [10 x i8]*@.str6324, i32 0, i32 0
%.tmp6326 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp6323, i8* %.tmp6325)
%params = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp6326, %m261$.Node.type** %params
%.tmp6327 = load %m261$.Node.type*, %m261$.Node.type** %params
%.tmp6328 = icmp eq %m261$.Node.type* %.tmp6327, null
br i1 %.tmp6328, label %.if.true.6329, label %.if.false.6329
.if.true.6329:
%.tmp6330 = bitcast ptr null to %m261$.Node.type*
ret %m261$.Node.type* %.tmp6330
br label %.if.end.6329
.if.false.6329:
br label %.if.end.6329
.if.end.6329:
%.tmp6331 = load %m261$.Node.type*, %m261$.Node.type** %params
%.tmp6332 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6331, i32 0, i32 6
%.tmp6333 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6332
ret %m261$.Node.type* %.tmp6333
}
define %m1791$.Type.type* @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.ctx.arg, %m261$.Node.type* %.stmt.arg) {
%ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.ctx.arg, %m1791$.CompilerCtx.type** %ctx
%stmt = alloca %m261$.Node.type*
store %m261$.Node.type* %.stmt.arg, %m261$.Node.type** %stmt
%.tmp6334 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
%t = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp6334, %m1791$.Type.type** %t
%.tmp6335 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6336 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6335, i32 0, i32 0
%.tmp6337 = load i8*, i8** %.tmp6336
%.tmp6339 = getelementptr [10 x i8], [10 x i8]*@.str6338, i32 0, i32 0
%.tmp6340 = call i32(i8*,i8*) @strcmp(i8* %.tmp6337, i8* %.tmp6339)
%.tmp6341 = icmp eq i32 %.tmp6340, 0
br i1 %.tmp6341, label %.if.true.6342, label %.if.false.6342
.if.true.6342:
%.tmp6343 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6344 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6343, i32 0, i32 0
%.tmp6346 = getelementptr [7 x i8], [7 x i8]*@.str6345, i32 0, i32 0
store i8* %.tmp6346, i8** %.tmp6344
%.tmp6347 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6348 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6347, i32 0, i32 1
store i8* null, i8** %.tmp6348
%.tmp6349 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6350 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6349, i32 0, i32 6
%.tmp6351 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6350
%.tmp6353 = getelementptr [5 x i8], [5 x i8]*@.str6352, i32 0, i32 0
%.tmp6354 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp6351, i8* %.tmp6353)
%curr_type = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp6354, %m261$.Node.type** %curr_type
%.tmp6355 = load %m261$.Node.type*, %m261$.Node.type** %curr_type
%.tmp6356 = icmp ne %m261$.Node.type* %.tmp6355, null
br i1 %.tmp6356, label %.if.true.6357, label %.if.false.6357
.if.true.6357:
%.tmp6358 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6359 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6358, i32 0, i32 3
%.tmp6360 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6361 = load %m261$.Node.type*, %m261$.Node.type** %curr_type
%.tmp6362 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6361, i32 0, i32 6
%.tmp6363 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6362
%.tmp6364 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp6360, %m261$.Node.type* %.tmp6363)
store %m1791$.Type.type* %.tmp6364, %m1791$.Type.type** %.tmp6359
%.tmp6365 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6366 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6365, i32 0, i32 3
%.tmp6367 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6366
%.tmp6368 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6367, i32 0, i32 1
%.tmp6369 = load %m261$.Node.type*, %m261$.Node.type** %curr_type
%.tmp6370 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6369, i32 0, i32 7
%.tmp6371 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6370
%.tmp6372 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6371, i32 0, i32 1
%.tmp6373 = load i8*, i8** %.tmp6372
store i8* %.tmp6373, i8** %.tmp6368
%.tmp6374 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6375 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6374, i32 0, i32 3
%.tmp6376 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6375
%curr_t = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp6376, %m1791$.Type.type** %curr_t
%.tmp6378 = load %m261$.Node.type*, %m261$.Node.type** %curr_type
%.tmp6379 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6378, i32 0, i32 7
%.tmp6380 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6379
%.tmp6382 = getelementptr [5 x i8], [5 x i8]*@.str6381, i32 0, i32 0
%.tmp6383 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp6380, i8* %.tmp6382)
store %m261$.Node.type* %.tmp6383, %m261$.Node.type** %curr_type
br label %.for.start.6377
.for.start.6377:
%.tmp6384 = load %m261$.Node.type*, %m261$.Node.type** %curr_type
%.tmp6385 = icmp ne %m261$.Node.type* %.tmp6384, null
br i1 %.tmp6385, label %.for.continue.6377, label %.for.end.6377
.for.continue.6377:
%.tmp6386 = load %m1791$.Type.type*, %m1791$.Type.type** %curr_t
%.tmp6387 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6386, i32 0, i32 4
%.tmp6388 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6389 = load %m261$.Node.type*, %m261$.Node.type** %curr_type
%.tmp6390 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6389, i32 0, i32 6
%.tmp6391 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6390
%.tmp6392 = call %m1791$.Type.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$node_to_type.m1791$.Type.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp6388, %m261$.Node.type* %.tmp6391)
store %m1791$.Type.type* %.tmp6392, %m1791$.Type.type** %.tmp6387
%.tmp6393 = load %m1791$.Type.type*, %m1791$.Type.type** %curr_t
%.tmp6394 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6393, i32 0, i32 4
%.tmp6395 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6394
%.tmp6396 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6395, i32 0, i32 1
%.tmp6397 = load %m261$.Node.type*, %m261$.Node.type** %curr_type
%.tmp6398 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6397, i32 0, i32 7
%.tmp6399 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6398
%.tmp6400 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6399, i32 0, i32 1
%.tmp6401 = load i8*, i8** %.tmp6400
store i8* %.tmp6401, i8** %.tmp6396
%.tmp6402 = load %m1791$.Type.type*, %m1791$.Type.type** %curr_t
%.tmp6403 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6402, i32 0, i32 4
%.tmp6404 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6403
store %m1791$.Type.type* %.tmp6404, %m1791$.Type.type** %curr_t
%.tmp6405 = load %m261$.Node.type*, %m261$.Node.type** %curr_type
%.tmp6406 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6405, i32 0, i32 7
%.tmp6407 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6406
%.tmp6409 = getelementptr [5 x i8], [5 x i8]*@.str6408, i32 0, i32 0
%.tmp6410 = call %m261$.Node.type*(%m261$.Node.type*,i8*) @m1791$skip_to_type.m261$.Node.typep.m261$.Node.typep.cp(%m261$.Node.type* %.tmp6407, i8* %.tmp6409)
store %m261$.Node.type* %.tmp6410, %m261$.Node.type** %curr_type
br label %.for.start.6377
.for.end.6377:
br label %.if.end.6357
.if.false.6357:
br label %.if.end.6357
.if.end.6357:
br label %.if.end.6342
.if.false.6342:
%.tmp6411 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6412 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6411, i32 0, i32 0
%.tmp6413 = load i8*, i8** %.tmp6412
%.tmp6415 = getelementptr [5 x i8], [5 x i8]*@.str6414, i32 0, i32 0
%.tmp6416 = call i32(i8*,i8*) @strcmp(i8* %.tmp6413, i8* %.tmp6415)
%.tmp6417 = icmp eq i32 %.tmp6416, 0
br i1 %.tmp6417, label %.if.true.6418, label %.if.false.6418
.if.true.6418:
%.tmp6419 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6420 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6419, i32 0, i32 0
%.tmp6421 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6422 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6421, i32 0, i32 1
%.tmp6423 = load i8*, i8** %.tmp6422
store i8* %.tmp6423, i8** %.tmp6420
br label %.if.end.6418
.if.false.6418:
%.tmp6424 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6425 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6424, i32 0, i32 0
%.tmp6426 = load i8*, i8** %.tmp6425
%.tmp6428 = getelementptr [12 x i8], [12 x i8]*@.str6427, i32 0, i32 0
%.tmp6429 = call i32(i8*,i8*) @strcmp(i8* %.tmp6426, i8* %.tmp6428)
%.tmp6430 = icmp eq i32 %.tmp6429, 0
br i1 %.tmp6430, label %.if.true.6431, label %.if.false.6431
.if.true.6431:
%err_msg = alloca i8*
%.tmp6432 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6433 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6434 = call %m1791$.ScopeItem.type*(%m1791$.CompilerCtx.type*,%m261$.Node.type*) @m1791$find_defined.m1791$.ScopeItem.typep.m1791$.CompilerCtx.typep.m261$.Node.typep(%m1791$.CompilerCtx.type* %.tmp6432, %m261$.Node.type* %.tmp6433)
%base = alloca %m1791$.ScopeItem.type*
store %m1791$.ScopeItem.type* %.tmp6434, %m1791$.ScopeItem.type** %base
%.tmp6435 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %base
%.tmp6436 = icmp eq %m1791$.ScopeItem.type* %.tmp6435, null
br i1 %.tmp6436, label %.if.true.6437, label %.if.false.6437
.if.true.6437:
%.tmp6438 = getelementptr i8*, i8** %err_msg, i32 0
%.tmp6440 = getelementptr [37 x i8], [37 x i8]*@.str6439, i32 0, i32 0
%.tmp6441 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6442 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6441, i32 0, i32 6
%.tmp6443 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6442
%.tmp6444 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6443, i32 0, i32 1
%.tmp6445 = load i8*, i8** %.tmp6444
%.tmp6446 = call i32(i8**,i8*,...) @asprintf(i8** %.tmp6438, i8* %.tmp6440, i8* %.tmp6445)
%.tmp6447 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6448 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6449 = load i8*, i8** %err_msg
call void(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$new_error.v.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp6447, %m261$.Node.type* %.tmp6448, i8* %.tmp6449)
%.tmp6450 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6451 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6450, i32 0, i32 0
%.tmp6453 = getelementptr [6 x i8], [6 x i8]*@.str6452, i32 0, i32 0
store i8* %.tmp6453, i8** %.tmp6451
%.tmp6454 = load %m1791$.Type.type*, %m1791$.Type.type** %t
ret %m1791$.Type.type* %.tmp6454
br label %.if.end.6437
.if.false.6437:
br label %.if.end.6437
.if.end.6437:
%.tmp6455 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6456 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6455, i32 0, i32 0
%.tmp6458 = getelementptr [10 x i8], [10 x i8]*@.str6457, i32 0, i32 0
store i8* %.tmp6458, i8** %.tmp6456
%.tmp6459 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6460 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6459, i32 0, i32 1
%.tmp6461 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %base
%.tmp6462 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp6461, i32 0, i32 0
%.tmp6463 = load i8*, i8** %.tmp6462
store i8* %.tmp6463, i8** %.tmp6460
%.tmp6464 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6465 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6464, i32 0, i32 2
%.tmp6466 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %base
%.tmp6467 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp6466, i32 0, i32 1
%.tmp6468 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp6467
%.tmp6469 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp6468, i32 0, i32 0
%.tmp6470 = load i8*, i8** %.tmp6469
store i8* %.tmp6470, i8** %.tmp6465
%.tmp6471 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6472 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6471, i32 0, i32 3
%.tmp6473 = load %m1791$.ScopeItem.type*, %m1791$.ScopeItem.type** %base
%.tmp6474 = getelementptr %m1791$.ScopeItem.type, %m1791$.ScopeItem.type* %.tmp6473, i32 0, i32 1
%.tmp6475 = load %m1791$.AssignableInfo.type*, %m1791$.AssignableInfo.type** %.tmp6474
%.tmp6476 = getelementptr %m1791$.AssignableInfo.type, %m1791$.AssignableInfo.type* %.tmp6475, i32 0, i32 3
%.tmp6477 = load %m1791$.Type.type*, %m1791$.Type.type** %.tmp6476
store %m1791$.Type.type* %.tmp6477, %m1791$.Type.type** %.tmp6472
br label %.if.end.6431
.if.false.6431:
%.tmp6478 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6479 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6478, i32 0, i32 1
%.tmp6480 = load i8*, i8** %.tmp6479
%.tmp6482 = getelementptr [4 x i8], [4 x i8]*@.str6481, i32 0, i32 0
%.tmp6483 = call i32(i8*,i8*) @strcmp(i8* %.tmp6480, i8* %.tmp6482)
%.tmp6484 = icmp eq i32 %.tmp6483, 0
br i1 %.tmp6484, label %.if.true.6485, label %.if.false.6485
.if.true.6485:
%.tmp6486 = load %m1791$.Type.type*, %m1791$.Type.type** %t
%.tmp6487 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6486, i32 0, i32 0
%.tmp6489 = getelementptr [7 x i8], [7 x i8]*@.str6488, i32 0, i32 0
store i8* %.tmp6489, i8** %.tmp6487
br label %.if.end.6485
.if.false.6485:
%.tmp6490 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %ctx
%.tmp6491 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6493 = getelementptr [54 x i8], [54 x i8]*@.str6492, i32 0, i32 0
%.tmp6494 = call i8*(%m1791$.CompilerCtx.type*,%m261$.Node.type*,i8*) @m1791$err_tmpl.cp.m1791$.CompilerCtx.typep.m261$.Node.typep.cp(%m1791$.CompilerCtx.type* %.tmp6490, %m261$.Node.type* %.tmp6491, i8* %.tmp6493)
%.tmp6495 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6496 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6495, i32 0, i32 0
%.tmp6497 = load i8*, i8** %.tmp6496
%.tmp6498 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6499 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6498, i32 0, i32 1
%.tmp6500 = load i8*, i8** %.tmp6499
%.tmp6501 = call i32(i8*,...) @printf(i8* %.tmp6494, i8* %.tmp6497, i8* %.tmp6500)
br label %.if.end.6485
.if.end.6485:
br label %.if.end.6431
.if.end.6431:
br label %.if.end.6418
.if.end.6418:
br label %.if.end.6342
.if.end.6342:
%.tmp6503 = load %m261$.Node.type*, %m261$.Node.type** %stmt
%.tmp6504 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6503, i32 0, i32 7
%.tmp6505 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6504
%ptr = alloca %m261$.Node.type*
store %m261$.Node.type* %.tmp6505, %m261$.Node.type** %ptr
br label %.for.start.6502
.for.start.6502:
%.tmp6506 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp6507 = icmp ne %m261$.Node.type* %.tmp6506, null
br i1 %.tmp6507, label %.for.continue.6502, label %.for.end.6502
.for.continue.6502:
%.tmp6508 = call %m1791$.Type.type*() @m1791$new_type.m1791$.Type.typep()
%pt = alloca %m1791$.Type.type*
store %m1791$.Type.type* %.tmp6508, %m1791$.Type.type** %pt
%.tmp6509 = load %m1791$.Type.type*, %m1791$.Type.type** %pt
%.tmp6510 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6509, i32 0, i32 0
%.tmp6512 = getelementptr [4 x i8], [4 x i8]*@.str6511, i32 0, i32 0
store i8* %.tmp6512, i8** %.tmp6510
%.tmp6513 = load %m1791$.Type.type*, %m1791$.Type.type** %pt
%.tmp6514 = getelementptr %m1791$.Type.type, %m1791$.Type.type* %.tmp6513, i32 0, i32 3
%.tmp6515 = load %m1791$.Type.type*, %m1791$.Type.type** %t
store %m1791$.Type.type* %.tmp6515, %m1791$.Type.type** %.tmp6514
%.tmp6516 = load %m1791$.Type.type*, %m1791$.Type.type** %pt
store %m1791$.Type.type* %.tmp6516, %m1791$.Type.type** %t
%.tmp6517 = load %m261$.Node.type*, %m261$.Node.type** %ptr
%.tmp6518 = getelementptr %m261$.Node.type, %m261$.Node.type* %.tmp6517, i32 0, i32 7
%.tmp6519 = load %m261$.Node.type*, %m261$.Node.type** %.tmp6518
store %m261$.Node.type* %.tmp6519, %m261$.Node.type** %ptr
br label %.for.start.6502
.for.end.6502:
%.tmp6520 = load %m1791$.Type.type*, %m1791$.Type.type** %t
ret %m1791$.Type.type* %.tmp6520
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
@.str2495 = constant [12 x i8] c"COFFEE_ROOT\00"
@.str2502 = constant [11 x i8] c"%s/.coffee\00"
@.str2504 = constant [5 x i8] c"HOME\00"
@.str2509 = constant [18 x i8] c"%s/bin/syntax.txt\00"
@.str2514 = constant [2 x i8] c"r\00"
@.str2520 = constant [42 x i8] c":panic: Unable to open grammar file '%s'\0A\00"
@.str2548 = constant [6 x i8] c"start\00"
@.str2560 = constant [6 x i8] c"start\00"
@.str2572 = constant [13 x i8] c"head_comment\00"
@.str2654 = constant [9 x i8] c"c\22%s\5C00\22\00"
@.str2667 = constant [7 x i8] c"string\00"
@.str2680 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str2708 = constant [5 x i8] c"%s%s\00"
@.str2716 = constant [9 x i8] c"function\00"
@.str2722 = constant [5 x i8] c"main\00"
@.str2734 = constant [6 x i8] c"%s.%s\00"
@.str2751 = constant [3 x i8] c"NL\00"
@.str2759 = constant [7 x i8] c"global\00"
@.str2767 = constant [11 x i8] c"assignable\00"
@.str2795 = constant [9 x i8] c"variable\00"
@.str2806 = constant [21 x i8] c"%s = constant %s %s\0A\00"
@.str2821 = constant [10 x i8] c"typealias\00"
@.str2841 = constant [11 x i8] c"%s.%s.type\00"
@.str2853 = constant [10 x i8] c"typealias\00"
@.str2874 = constant [5 x i8] c"type\00"
@.str2901 = constant [14 x i8] c"%s = type %s\0A\00"
@.str2914 = constant [7 x i8] c"extern\00"
@.str2932 = constant [7 x i8] c"extern\00"
@.str2987 = constant [15 x i8] c"declare %s %s(\00"
@.str3018 = constant [3 x i8] c", \00"
@.str3024 = constant [3 x i8] c"%s\00"
@.str3036 = constant [3 x i8] c")\0A\00"
@.str3047 = constant [9 x i8] c"function\00"
@.str3056 = constant [9 x i8] c"function\00"
@.str3111 = constant [14 x i8] c"define %s %s(\00"
@.str3137 = constant [3 x i8] c", \00"
@.str3143 = constant [5 x i8] c"type\00"
@.str3159 = constant [13 x i8] c"%s %%.%s.arg\00"
@.str3174 = constant [5 x i8] c") {\0A\00"
@.str3183 = constant [6 x i8] c"block\00"
@.str3201 = constant [3 x i8] c"NL\00"
@.str3208 = constant [9 x i8] c"OPERATOR\00"
@.str3226 = constant [7 x i8] c"return\00"
@.str3236 = constant [5 x i8] c"void\00"
@.str3243 = constant [21 x i8] c"missing return value\00"
@.str3248 = constant [10 x i8] c"ret void\0A\00"
@.str3254 = constant [3 x i8] c"}\0A\00"
@.str3260 = constant [7 x i8] c"import\00"
@.str3305 = constant [1 x i8] c"\00"
@.str3311 = constant [6 x i8] c"%s.bn\00"
@.str3316 = constant [9 x i8] c"%s/%s.bn\00"
@.str3328 = constant [60 x i8] c"Unable to import '%s' no such file or directory. (%s/%s.bn)\00"
@.str3385 = constant [5 x i8] c"m%d$\00"
@.str3434 = constant [40 x i8] c"statement of type %s is not implemented\00"
@.str3442 = constant [31 x i8] c":coffee-error: (%s: %d:%d) %s\0A\00"
@.str3471 = constant [9 x i8] c"variable\00"
@.str3476 = constant [5 x i8] c"type\00"
@.str3506 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str3518 = constant [28 x i8] c"store %s %%.%s.arg, %s* %s\0A\00"
@.str3539 = constant [11 x i8] c"expression\00"
@.str3566 = constant [7 x i8] c"sizeof\00"
@.str3572 = constant [8 x i8] c"fn_args\00"
@.str3578 = constant [11 x i8] c"assignable\00"
@.str3603 = constant [4 x i8] c"int\00"
@.str3614 = constant [46 x i8] c"%%.tmp%d = getelementptr %s, %s* null, i32 1\0A\00"
@.str3623 = constant [35 x i8] c"%s = ptrtoint %s* %%.tmp%d to i32\0A\00"
@.str3649 = constant [35 x i8] c"unable to compile function address\00"
@.str3655 = constant [8 x i8] c"fn_args\00"
@.str3658 = constant [1 x i8] c"\00"
@.str3666 = constant [11 x i8] c"assignable\00"
@.str3678 = constant [5 x i8] c"%s, \00"
@.str3694 = constant [8 x i8] c"%s%s %s\00"
@.str3709 = constant [11 x i8] c"assignable\00"
@.str3719 = constant [5 x i8] c"void\00"
@.str3727 = constant [16 x i8] c"call %s %s(%s)\0A\00"
@.str3758 = constant [21 x i8] c"%s = call %s %s(%s)\0A\00"
@.str3779 = constant [7 x i8] c"return\00"
@.str3791 = constant [3 x i8] c"NL\00"
@.str3809 = constant [11 x i8] c"ret %s %s\0A\00"
@.str3822 = constant [10 x i8] c"ret void\0A\00"
@.str3826 = constant [3 x i8] c"NL\00"
@.str3832 = constant [8 x i8] c"fn_call\00"
@.str3843 = constant [12 x i8] c"declaration\00"
@.str3852 = constant [11 x i8] c"assignment\00"
@.str3860 = constant [11 x i8] c"assignable\00"
@.str3872 = constant [34 x i8] c"%s was not declared in this scope\00"
@.str3904 = constant [4 x i8] c"ptr\00"
@.str3913 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str3923 = constant [9 x i8] c"if_block\00"
@.str3931 = constant [9 x i8] c"for_loop\00"
@.str3940 = constant [34 x i8] c"unable to compile expression '%s'\00"
@.str3955 = constant [12 x i8] c"declaration\00"
@.str3966 = constant [11 x i8] c"assignment\00"
@.str3976 = constant [9 x i8] c"OPERATOR\00"
@.str3983 = constant [66 x i8] c"unable to compile statement of type %s in for loop init condition\00"
@.str3993 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str4000 = constant [16 x i8] c".for.start.%d:\0A\00"
@.str4007 = constant [9 x i8] c"OPERATOR\00"
@.str4019 = constant [57 x i8] c"br %s %s, label %%.for.continue.%d, label %%.for.end.%d\0A\00"
@.str4034 = constant [19 x i8] c".for.continue.%d:\0A\00"
@.str4041 = constant [9 x i8] c"OPERATOR\00"
@.str4048 = constant [6 x i8] c"block\00"
@.str4062 = constant [26 x i8] c"br label %%.for.start.%d\0A\00"
@.str4069 = constant [14 x i8] c".for.end.%d:\0A\00"
@.str4080 = constant [5 x i8] c"type\00"
@.str4095 = constant [11 x i8] c"assignable\00"
@.str4108 = constant [9 x i8] c"variable\00"
@.str4113 = constant [5 x i8] c"WORD\00"
@.str4121 = constant [31 x i8] c"unable to get declaration name\00"
@.str4173 = constant [49 x i8] c"cannot assign type '%s' to variable of type '%s'\00"
@.str4189 = constant [16 x i8] c"%s = alloca %s\0A\00"
@.str4201 = constant [21 x i8] c"store %s %s, %s* %s\0A\00"
@.str4218 = constant [11 x i8] c"assignable\00"
@.str4232 = constant [53 x i8] c"br %s %s, label %%.if.true.%d, label %%.if.false.%d\0A\00"
@.str4247 = constant [14 x i8] c".if.true.%d:\0A\00"
@.str4254 = constant [6 x i8] c"block\00"
@.str4262 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4269 = constant [15 x i8] c".if.false.%d:\0A\00"
@.str4276 = constant [11 x i8] c"elif_block\00"
@.str4287 = constant [11 x i8] c"else_block\00"
@.str4297 = constant [6 x i8] c"block\00"
@.str4307 = constant [23 x i8] c"br label %%.if.end.%d\0A\00"
@.str4314 = constant [13 x i8] c".if.end.%d:\0A\00"
@.str4334 = constant [61 x i8] c"Programming error, unable to create new error from null node\00"
@.str4342 = constant [82 x i8] c":coffee-error: 'define_assignable' could not be called if context scopes are null\00"
@.str4390 = constant [31 x i8] c"Name %s not found in module %s\00"
@.str4411 = constant [7 x i8] c"module\00"
@.str4440 = constant [77 x i8] c":coffee-error: 'find_defined' could not be called if context scopes are null\00"
@.str4482 = constant [54 x i8] c"cannot call 'get_dotted_name' on null assignable info\00"
@.str4490 = constant [9 x i8] c"function\00"
@.str4497 = constant [7 x i8] c"extern\00"
@.str4509 = constant [46 x i8] c"cannot get attribute %s from function type %s\00"
@.str4530 = constant [9 x i8] c"variable\00"
@.str4550 = constant [4 x i8] c"ptr\00"
@.str4568 = constant [23 x i8] c"%s = load %s*, %s* %s\0A\00"
@.str4592 = constant [10 x i8] c"typealias\00"
@.str4603 = constant [7 x i8] c"struct\00"
@.str4609 = constant [48 x i8] c"cannot get attribute %s from non struct type %s\00"
@.str4660 = constant [34 x i8] c"field %s not defined in struct %s\00"
@.str4680 = constant [9 x i8] c"variable\00"
@.str4690 = constant [46 x i8] c"%s = getelementptr %s, %s* %s, i32 0, i32 %d\0A\00"
@.str4711 = constant [9 x i8] c"variable\00"
@.str4719 = constant [43 x i8] c"`get_dotted_name` does not handle type: %s\00"
@.str4731 = constant [12 x i8] c"destination\00"
@.str4736 = constant [92 x i8] c":coffee-error: 'compile_addr' could only be called on destinations for now. (called on %s)\0A\00"
@.str4762 = constant [25 x i8] c"name '%s' is not defined\00"
@.str4780 = constant [7 x i8] c"module\00"
@.str4802 = constant [31 x i8] c"name '%s' is not defined in %s\00"
@.str4866 = constant [28 x i8] c"%%.tmp%d = load %s, %s* %s\0A\00"
@.str4886 = constant [35 x i8] c"Unable to get address for type: %s\00"
@.str4909 = constant [44 x i8] c"%s = getelementptr %s, %s* %%.tmp%d, %s %s\0A\00"
@.str4932 = constant [16 x i8] c"mono_assignable\00"
@.str4953 = constant [5 x i8] c"cast\00"
@.str4962 = constant [5 x i8] c"type\00"
@.str4977 = constant [26 x i8] c"%s = bitcast %s %s to %s\0A\00"
@.str5002 = constant [16 x i8] c"mono_assignable\00"
@.str5060 = constant [19 x i8] c"%s = %s %s %s, %s\0A\00"
@.str5083 = constant [31 x i8] c"called 'operator_op' with null\00"
@.str5090 = constant [2 x i8] c"+\00"
@.str5095 = constant [4 x i8] c"add\00"
@.str5100 = constant [2 x i8] c"-\00"
@.str5105 = constant [4 x i8] c"sub\00"
@.str5110 = constant [2 x i8] c"*\00"
@.str5115 = constant [4 x i8] c"mul\00"
@.str5120 = constant [2 x i8] c"/\00"
@.str5125 = constant [5 x i8] c"sdiv\00"
@.str5130 = constant [3 x i8] c"==\00"
@.str5135 = constant [8 x i8] c"icmp eq\00"
@.str5140 = constant [3 x i8] c"!=\00"
@.str5145 = constant [8 x i8] c"icmp ne\00"
@.str5150 = constant [2 x i8] c">\00"
@.str5155 = constant [9 x i8] c"icmp sgt\00"
@.str5160 = constant [2 x i8] c"<\00"
@.str5165 = constant [9 x i8] c"icmp slt\00"
@.str5170 = constant [2 x i8] c"&\00"
@.str5175 = constant [4 x i8] c"and\00"
@.str5180 = constant [2 x i8] c"|\00"
@.str5185 = constant [3 x i8] c"or\00"
@.str5190 = constant [3 x i8] c">=\00"
@.str5195 = constant [9 x i8] c"icmp sge\00"
@.str5200 = constant [3 x i8] c"<=\00"
@.str5205 = constant [9 x i8] c"icmp sle\00"
@.str5209 = constant [30 x i8] c"operator '%s' not implemented\00"
@.str5216 = constant [4 x i8] c"add\00"
@.str5222 = constant [3 x i8] c"==\00"
@.str5229 = constant [3 x i8] c"!=\00"
@.str5237 = constant [2 x i8] c"|\00"
@.str5245 = constant [2 x i8] c"&\00"
@.str5253 = constant [2 x i8] c">\00"
@.str5261 = constant [2 x i8] c"<\00"
@.str5269 = constant [3 x i8] c">=\00"
@.str5277 = constant [3 x i8] c"<=\00"
@.str5285 = constant [5 x i8] c"bool\00"
@.str5289 = constant [4 x i8] c"int\00"
@.str5299 = constant [7 x i8] c"NUMBER\00"
@.str5313 = constant [4 x i8] c"int\00"
@.str5327 = constant [5 x i8] c"WORD\00"
@.str5337 = constant [5 x i8] c"null\00"
@.str5344 = constant [42 x i8] c"unable to interpret %s as mono_assignable\00"
@.str5358 = constant [5 x i8] c"null\00"
@.str5367 = constant [8 x i8] c"nullptr\00"
@.str5374 = constant [17 x i8] c"addr_destination\00"
@.str5386 = constant [12 x i8] c"destination\00"
@.str5425 = constant [4 x i8] c"ptr\00"
@.str5444 = constant [38 x i8] c"%s = getelementptr %s, %s* %s, i32 0\0A\00"
@.str5456 = constant [22 x i8] c"%s = load %s, %s* %s\0A\00"
@.str5470 = constant [8 x i8] c"boolean\00"
@.str5484 = constant [5 x i8] c"bool\00"
@.str5493 = constant [6 x i8] c"false\00"
@.str5500 = constant [2 x i8] c"0\00"
@.str5504 = constant [2 x i8] c"1\00"
@.str5511 = constant [8 x i8] c"fn_call\00"
@.str5528 = constant [7 x i8] c"STRING\00"
@.str5552 = constant [44 x i8] c"%s = getelementptr %s, %s*%s, i32 0, i32 0\0A\00"
@.str5568 = constant [4 x i8] c"ptr\00"
@.str5581 = constant [4 x i8] c"chr\00"
@.str5588 = constant [4 x i8] c"CHR\00"
@.str5603 = constant [2 x i8] c"0\00"
@.str5613 = constant [6 x i8] c"'\5C%x'\00"
@.str5620 = constant [3 x i8] c"%d\00"
@.str5632 = constant [5 x i8] c"'%c'\00"
@.str5639 = constant [3 x i8] c"%d\00"
@.str5644 = constant [18 x i8] c"Invalid character\00"
@.str5657 = constant [4 x i8] c"chr\00"
@.str5661 = constant [40 x i8] c"unable to compile assignable of type %s\00"
@.str5689 = constant [22 x i8] c"called 'abbr' on null\00"
@.str5695 = constant [59 x i8] c"called 'type_abbr' with malformed type, container is null.\00"
@.str5700 = constant [4 x i8] c"int\00"
@.str5705 = constant [2 x i8] c"i\00"
@.str5710 = constant [5 x i8] c"bool\00"
@.str5715 = constant [2 x i8] c"b\00"
@.str5720 = constant [5 x i8] c"void\00"
@.str5725 = constant [2 x i8] c"v\00"
@.str5730 = constant [4 x i8] c"chr\00"
@.str5735 = constant [2 x i8] c"c\00"
@.str5740 = constant [4 x i8] c"str\00"
@.str5745 = constant [3 x i8] c"cp\00"
@.str5750 = constant [4 x i8] c"ptr\00"
@.str5756 = constant [4 x i8] c"%sp\00"
@.str5767 = constant [10 x i8] c"typealias\00"
@.str5778 = constant [6 x i8] c"error\00"
@.str5783 = constant [2 x i8] c"?\00"
@.str5785 = constant [44 x i8] c":coffee-error: unable to abbreviate type %s\00"
@.str5821 = constant [7 x i8] c".str%d\00"
@.str5836 = constant [6 x i8] c"array\00"
@.str5849 = constant [4 x i8] c"chr\00"
@.str5867 = constant [3 x i8] c"%d\00"
@.str5880 = constant [7 x i8] c"string\00"
@.str5899 = constant [7 x i8] c"module\00"
@.str5933 = constant [44 x i8] c":panic: %s called 'type_repr' on null type\0A\00"
@.str5939 = constant [2 x i8] c"?\00"
@.str5945 = constant [59 x i8] c"called 'type_repr' with malformed type, container is null.\00"
@.str5950 = constant [4 x i8] c"int\00"
@.str5955 = constant [4 x i8] c"i32\00"
@.str5960 = constant [5 x i8] c"void\00"
@.str5965 = constant [5 x i8] c"void\00"
@.str5970 = constant [5 x i8] c"bool\00"
@.str5975 = constant [3 x i8] c"i1\00"
@.str5980 = constant [8 x i8] c"nullptr\00"
@.str5985 = constant [4 x i8] c"ptr\00"
@.str5990 = constant [4 x i8] c"chr\00"
@.str5995 = constant [3 x i8] c"i8\00"
@.str6000 = constant [9 x i8] c"function\00"
@.str6006 = constant [4 x i8] c"%s(\00"
@.str6031 = constant [4 x i8] c"%s,\00"
@.str6036 = constant [5 x i8] c"%s%s\00"
@.str6047 = constant [4 x i8] c"%s)\00"
@.str6055 = constant [4 x i8] c"ptr\00"
@.str6061 = constant [4 x i8] c"%s*\00"
@.str6073 = constant [7 x i8] c"struct\00"
@.str6079 = constant [2 x i8] c"{\00"
@.str6095 = constant [4 x i8] c"%s,\00"
@.str6100 = constant [5 x i8] c"%s%s\00"
@.str6111 = constant [4 x i8] c"%s}\00"
@.str6119 = constant [6 x i8] c"array\00"
@.str6125 = constant [10 x i8] c"[%s x %s]\00"
@.str6144 = constant [10 x i8] c"typealias\00"
@.str6150 = constant [5 x i8] c"%%%s\00"
@.str6160 = constant [4 x i8] c"str\00"
@.str6165 = constant [4 x i8] c"i8*\00"
@.str6170 = constant [7 x i8] c"vararg\00"
@.str6175 = constant [4 x i8] c"...\00"
@.str6180 = constant [6 x i8] c"error\00"
@.str6185 = constant [58 x i8] c":coffee-error: 'type_repr' not implemented for type '%s'\0A\00"
@.str6253 = constant [9 x i8] c"function\00"
@.str6268 = constant [5 x i8] c"WORD\00"
@.str6324 = constant [10 x i8] c"fn_params\00"
@.str6338 = constant [10 x i8] c"structdef\00"
@.str6345 = constant [7 x i8] c"struct\00"
@.str6352 = constant [5 x i8] c"type\00"
@.str6381 = constant [5 x i8] c"type\00"
@.str6408 = constant [5 x i8] c"type\00"
@.str6414 = constant [5 x i8] c"WORD\00"
@.str6427 = constant [12 x i8] c"dotted_name\00"
@.str6439 = constant [37 x i8] c"Name %s is not defined in this scope\00"
@.str6452 = constant [6 x i8] c"error\00"
@.str6457 = constant [10 x i8] c"typealias\00"
@.str6481 = constant [4 x i8] c"...\00"
@.str6488 = constant [7 x i8] c"vararg\00"
@.str6492 = constant [54 x i8] c"unable to convert statement of type '%s' to type (%s)\00"
@.str6511 = constant [4 x i8] c"ptr\00"
define i32 @main(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp6521 = load i32, i32* %argc
%.tmp6522 = load i8**, i8*** %argv
call void(i32,i8**) @check_args.v.i.cpp(i32 %.tmp6521, i8** %.tmp6522)
%.tmp6523 = load i32, i32* @STDERR
%.tmp6525 = getelementptr [2 x i8], [2 x i8]*@.str6524, i32 0, i32 0
%.tmp6526 = call %m0$.File.type*(i32,i8*) @fdopen(i32 %.tmp6523, i8* %.tmp6525)
%stderr = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6526, %m0$.File.type** %stderr
%.tmp6527 = load i8**, i8*** %argv
%.tmp6528 = getelementptr i8*, i8** %.tmp6527, i32 1
%.tmp6529 = load i8*, i8** %.tmp6528
%filename = alloca i8*
store i8* %.tmp6529, i8** %filename
%.tmp6530 = call %m0$.File.type*() @tmpfile()
%llvm_code = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6530, %m0$.File.type** %llvm_code
%.tmp6531 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6532 = load i8*, i8** %filename
%.tmp6533 = call %m1791$.CompilerCtx.type*(%m0$.File.type*,i8*) @m1791$new_context.m1791$.CompilerCtx.typep.m0$.File.typep.cp(%m0$.File.type* %.tmp6531, i8* %.tmp6532)
%compiler_ctx = alloca %m1791$.CompilerCtx.type*
store %m1791$.CompilerCtx.type* %.tmp6533, %m1791$.CompilerCtx.type** %compiler_ctx
%.tmp6534 = load %m1791$.CompilerCtx.type*, %m1791$.CompilerCtx.type** %compiler_ctx
%.tmp6535 = load i8*, i8** %filename
%.tmp6536 = call i1(%m1791$.CompilerCtx.type*,i8*) @m1791$compile_file.b.m1791$.CompilerCtx.typep.cp(%m1791$.CompilerCtx.type* %.tmp6534, i8* %.tmp6535)
br i1 %.tmp6536, label %.if.true.6537, label %.if.false.6537
.if.true.6537:
%.tmp6538 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6540 = getelementptr [34 x i8], [34 x i8]*@.str6539, i32 0, i32 0
%.tmp6541 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6538, i8* %.tmp6540)
ret i32 1
br label %.if.end.6537
.if.false.6537:
br label %.if.end.6537
.if.end.6537:
%.tmp6542 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6543 = call i32(%m0$.File.type*) @fflush(%m0$.File.type* %.tmp6542)
%.tmp6544 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6545 = call i32(%m0$.File.type*) @ftell(%m0$.File.type* %.tmp6544)
%llvm_code_size = alloca i32
store i32 %.tmp6545, i32* %llvm_code_size
%.tmp6546 = load %m0$.File.type*, %m0$.File.type** %llvm_code
call void(%m0$.File.type*) @rewind(%m0$.File.type* %.tmp6546)
%.tmp6548 = getelementptr [29 x i8], [29 x i8]*@.str6547, i32 0, i32 0
%.tmp6550 = getelementptr [2 x i8], [2 x i8]*@.str6549, i32 0, i32 0
%.tmp6551 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp6548, i8* %.tmp6550)
%proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6551, %m0$.File.type** %proc
%.tmp6552 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6553 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6552)
%.tmp6554 = load %m0$.File.type*, %m0$.File.type** %llvm_code
%.tmp6555 = call i32(%m0$.File.type*) @fileno(%m0$.File.type* %.tmp6554)
call void(i32,i32) @m1$copy.v.i.i(i32 %.tmp6553, i32 %.tmp6555)
%.tmp6556 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6557 = icmp eq %m0$.File.type* %.tmp6556, null
br i1 %.tmp6557, label %.if.true.6558, label %.if.false.6558
.if.true.6558:
%.tmp6559 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6561 = getelementptr [28 x i8], [28 x i8]*@.str6560, i32 0, i32 0
%.tmp6562 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6559, i8* %.tmp6561)
ret i32 0
br label %.if.end.6558
.if.false.6558:
br label %.if.end.6558
.if.end.6558:
%.tmp6563 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6564 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp6563)
%.tmp6565 = icmp ne i32 %.tmp6564, 0
br i1 %.tmp6565, label %.if.true.6566, label %.if.false.6566
.if.true.6566:
%.tmp6567 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6569 = getelementptr [24 x i8], [24 x i8]*@.str6568, i32 0, i32 0
%.tmp6570 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6567, i8* %.tmp6569)
ret i32 0
br label %.if.end.6566
.if.false.6566:
br label %.if.end.6566
.if.end.6566:
%.tmp6572 = getelementptr [17 x i8], [17 x i8]*@.str6571, i32 0, i32 0
%.tmp6574 = getelementptr [2 x i8], [2 x i8]*@.str6573, i32 0, i32 0
%.tmp6575 = call %m0$.File.type*(i8*,i8*) @popen(i8* %.tmp6572, i8* %.tmp6574)
%gcc_proc = alloca %m0$.File.type*
store %m0$.File.type* %.tmp6575, %m0$.File.type** %gcc_proc
%.tmp6576 = load %m0$.File.type*, %m0$.File.type** %gcc_proc
%.tmp6577 = icmp eq %m0$.File.type* %.tmp6576, null
br i1 %.tmp6577, label %.if.true.6578, label %.if.false.6578
.if.true.6578:
%.tmp6579 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6581 = getelementptr [28 x i8], [28 x i8]*@.str6580, i32 0, i32 0
%.tmp6582 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6579, i8* %.tmp6581)
ret i32 0
br label %.if.end.6578
.if.false.6578:
br label %.if.end.6578
.if.end.6578:
%.tmp6583 = load %m0$.File.type*, %m0$.File.type** %proc
%.tmp6584 = call i32(%m0$.File.type*) @pclose(%m0$.File.type* %.tmp6583)
%.tmp6585 = icmp ne i32 %.tmp6584, 0
br i1 %.tmp6585, label %.if.true.6586, label %.if.false.6586
.if.true.6586:
%.tmp6587 = load %m0$.File.type*, %m0$.File.type** %stderr
%.tmp6589 = getelementptr [23 x i8], [23 x i8]*@.str6588, i32 0, i32 0
%.tmp6590 = call i32(%m0$.File.type*,i8*,...) @fprintf(%m0$.File.type* %.tmp6587, i8* %.tmp6589)
br label %.if.end.6586
.if.false.6586:
%.tmp6592 = getelementptr [32 x i8], [32 x i8]*@.str6591, i32 0, i32 0
%.tmp6593 = load i8*, i8** %filename
%.tmp6594 = call i32(i8*,...) @printf(i8* %.tmp6592, i8* %.tmp6593)
br label %.if.end.6586
.if.end.6586:
ret i32 0
}
define void @check_args.v.i.cpp(i32 %.argc.arg, i8** %.argv.arg) {
%argc = alloca i32
store i32 %.argc.arg, i32* %argc
%argv = alloca i8**
store i8** %.argv.arg, i8*** %argv
%.tmp6595 = load i32, i32* %argc
%.tmp6596 = icmp eq i32 %.tmp6595, 2
br i1 %.tmp6596, label %.if.true.6597, label %.if.false.6597
.if.true.6597:
ret void
br label %.if.end.6597
.if.false.6597:
br label %.if.end.6597
.if.end.6597:
%.tmp6599 = getelementptr [21 x i8], [21 x i8]*@.str6598, i32 0, i32 0
%tmpl = alloca i8*
store i8* %.tmp6599, i8** %tmpl
%.tmp6600 = load i8**, i8*** %argv
%.tmp6601 = getelementptr i8*, i8** %.tmp6600, i32 0
%.tmp6602 = load i8*, i8** %.tmp6601
%.tmp6603 = call i32(i8*) @strlen(i8* %.tmp6602)
%.tmp6604 = load i8*, i8** %tmpl
%.tmp6605 = call i32(i8*) @strlen(i8* %.tmp6604)
%.tmp6606 = add i32 %.tmp6603, %.tmp6605
%len_filename = alloca i32
store i32 %.tmp6606, i32* %len_filename
%.tmp6607 = load i32, i32* %len_filename
%.tmp6608 = call i8*(i32) @malloc(i32 %.tmp6607)
%buf = alloca i8*
store i8* %.tmp6608, i8** %buf
%.tmp6609 = load i8*, i8** %buf
%.tmp6610 = load i8*, i8** %tmpl
%.tmp6611 = load i8**, i8*** %argv
%.tmp6612 = getelementptr i8*, i8** %.tmp6611, i32 0
%.tmp6613 = load i8*, i8** %.tmp6612
%.tmp6614 = call i32(i8*,i8*,...) @sprintf(i8* %.tmp6609, i8* %.tmp6610, i8* %.tmp6613)
%.tmp6615 = load i8*, i8** %buf
%.tmp6616 = call i32(i8*) @puts(i8* %.tmp6615)
%.tmp6617 = load i8*, i8** %buf
call void(i8*) @free(i8* %.tmp6617)
call void(i32) @exit(i32 1)
ret void
}
@.str6524 = constant [2 x i8] c"w\00"
@.str6539 = constant [34 x i8] c"Compilation to llvm interrupted.\0A\00"
@.str6547 = constant [29 x i8] c"tee debug.ll | llc - > out.s\00"
@.str6549 = constant [2 x i8] c"w\00"
@.str6560 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str6568 = constant [24 x i8] c"error on llc execution\0A\00"
@.str6571 = constant [17 x i8] c"gcc out.s -o out\00"
@.str6573 = constant [2 x i8] c"w\00"
@.str6580 = constant [28 x i8] c"unable to spawn subprocess\0A\00"
@.str6588 = constant [23 x i8] c"error on gcc execution\00"
@.str6591 = constant [32 x i8] c"File %s compiled successfully!\0A\00"
@.str6598 = constant [21 x i8] c"Usage: %s <filename>\00"
