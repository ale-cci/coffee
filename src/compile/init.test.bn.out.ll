@.str95 = constant [6 x i8] c"%s.%s\00"
@.str96 = constant [2 x i8] c"r\00"
@.str97 = constant [13 x i8] c"./syntax.txt\00"
@.str98 = constant [2 x i8] c"r\00"
@.str99 = constant [3 x i8] c"in\00"
@.str100 = constant [6 x i8] c"start\00"
@.str101 = constant [4 x i8] c"out\00"
@.str102 = constant [23 x i8] c"Unable to open %s.out\0A\00"
@.str103 = constant [21 x i8] c"compile/init.test.bn\00"
@.str104 = constant [33 x i8] c"./compile/__test__/01-empty_main\00"
@.str74 = constant [22 x i8] c"define i32 @main() {\0A\00"
@.str75 = constant [11 x i8] c"ret i32 0\0A\00"
@.str76 = constant [3 x i8] c"}\0A\00"
declare i32 @fork()
declare i8* @memmove(i8*,i8*,i32)
declare i8* @realloc(i8*,i32)
declare void @free(i8*)
declare i32 @waitpid(i32,i32*,i32)
declare i32 @pipe(i32*)
declare void @exit(i32)
declare i8* @malloc(i32)
declare i32 @fseek(%.type.File*,i32,i32)
declare i32 @fflush(%.type.File*)
declare i32 @printf(i8*,...)
declare i32 @sprintf(i8*,i8*,...)
declare i32 @snprintf(i8*,i32,i8*,...)
declare i32 @write(i32,i8*,i32)
declare i32 @open(i8*,i32)
declare i32 @lseek(i32,i32,i32)
declare i32 @fscanf(%.type.File*,i8*,...)
declare void @sync()
declare i32 @puts(i8*)
declare i32 @scanf(i8*,...)
declare i32 @close(i32)
declare i32 @ftell(%.type.File*)
declare void @rewind(%.type.File*)
declare %.type.File* @fopen(i8*,i8*)
declare %.type.File* @tmpfile()
declare i32 @fsync(i32)
declare void @perror(i8*)
declare i32 @sscanf(i8*,i8*,...)
declare i32 @read(i32,i8*,i32)
declare i32 @fprintf(%.type.File*,i8*,...)
declare %.type.File* @fdopen(i32,i8*)
declare i32 @fileno(%.type.File*)
declare i32 @fclose(%.type.File*)
@STDIN = constant i32 0
@STDOUT = constant i32 1
@STDERR = constant i32 2
@SEEK_SET = constant i32 0
@SEEK_CUR = constant i32 1
@SEEK_END = constant i32 2
@O_RDONLY = constant i32 0
@O_WRONLY = constant i32 1
@O_RDWR = constant i32 2
@O_CREAT = constant i32 64
@O_TRUNC = constant i32 512
%.type.File = type {i8*, i32, i8*, i32, i32, i32, i32, i8*}
declare i32 @strlen(i8*)
declare i8* @strcat(i8*,i8*)
declare i8* @strncat(i8*,i8*,i32)
declare i32 @strcmp(i8*,i8*)
declare i32 @strncmp(i8*,i8*,i32)
declare i8* @strcpy(i8*,i8*)
declare i8* @strncpy(i8*,i8*,i32)
define i1 @.mod3.is_letter(i8 %.arg.c) {
%c = alloca i8
store i8 %.arg.c, i8* %c
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
define i1 @.mod3.is_digit(i8 %.arg.c) {
%c = alloca i8
store i8 %.arg.c, i8* %c
%.tmp15 = load i8, i8* %c
%.tmp16 = icmp sge i8 %.tmp15, 48
%.tmp17 = load i8, i8* %c
%.tmp18 = icmp sle i8 %.tmp17, 57
%.tmp19 = and i1 %.tmp16, %.tmp18
ret i1 %.tmp19
}
define i1 @.mod3.is_whitespace(i8 %.arg.c) {
%c = alloca i8
store i8 %.arg.c, i8* %c
%.tmp20 = load i8, i8* %c
%.tmp21 = icmp eq i8 %.tmp20, 32
%.tmp22 = load i8, i8* %c
%.tmp23 = icmp eq i8 %.tmp22, 9
%.tmp24 = or i1 %.tmp21, %.tmp23
ret i1 %.tmp24
}
define i1 @.mod3.is_lower(i8* %.arg.string) {
%string = alloca i8*
store i8* %.arg.string, i8** %string

%idx = alloca i32
store i32 0, i32* %idx
br label %.for.start.25
.for.start.25:
%.tmp28 = load i32, i32* %idx
%.tmp26 = load i8*, i8** %string
%.tmp27 = getelementptr i8, i8* %.tmp26, i32 %.tmp28
%.tmp29 = load i8, i8* %.tmp27
%.tmp30 = icmp ne i8 %.tmp29, 0
br i1 %.tmp30, label %.for.continue.25, label %.for.end.25
.for.continue.25:
%.tmp33 = load i32, i32* %idx
%.tmp31 = load i8*, i8** %string
%.tmp32 = getelementptr i8, i8* %.tmp31, i32 %.tmp33
%.tmp34 = load i8, i8* %.tmp32
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
%.tmp44 = add i1 0, 0
ret i1 %.tmp44
br label %.if.end.43
.if.false.43:

br label %.if.end.43
.if.end.43:
br label %.if.end.37
.if.end.37:
%.tmp45 = load i32, i32* %idx
%.tmp46 = add i32 %.tmp45, 1

store i32 %.tmp46, i32* %idx
br label %.for.start.25
.for.end.25:
%.tmp47 = add i1 0, 1
ret i1 %.tmp47
}
define i1 @.mod3.is_upper(i8* %.arg.string) {
%string = alloca i8*
store i8* %.arg.string, i8** %string

%idx = alloca i32
store i32 0, i32* %idx
br label %.for.start.48
.for.start.48:
%.tmp51 = load i32, i32* %idx
%.tmp49 = load i8*, i8** %string
%.tmp50 = getelementptr i8, i8* %.tmp49, i32 %.tmp51
%.tmp52 = load i8, i8* %.tmp50
%.tmp53 = icmp ne i8 %.tmp52, 0
br i1 %.tmp53, label %.for.continue.48, label %.for.end.48
.for.continue.48:
%.tmp56 = load i32, i32* %idx
%.tmp54 = load i8*, i8** %string
%.tmp55 = getelementptr i8, i8* %.tmp54, i32 %.tmp56
%.tmp57 = load i8, i8* %.tmp55
%c = alloca i8
store i8 %.tmp57, i8* %c
%.tmp58 = load i8, i8* %c
%.tmp59 = icmp eq i8 %.tmp58, 95
br i1 %.tmp59, label %.if.true.60, label %.if.false.60
.if.true.60:

br label %.if.end.60
.if.false.60:
%.tmp61 = load i8, i8* %c
%.tmp62 = icmp slt i8 %.tmp61, 65
%.tmp63 = load i8, i8* %c
%.tmp64 = icmp sgt i8 %.tmp63, 90
%.tmp65 = or i1 %.tmp62, %.tmp64
br i1 %.tmp65, label %.if.true.66, label %.if.false.66
.if.true.66:
%.tmp67 = add i1 0, 0
ret i1 %.tmp67
br label %.if.end.66
.if.false.66:

br label %.if.end.66
.if.end.66:
br label %.if.end.60
.if.end.60:
%.tmp68 = load i32, i32* %idx
%.tmp69 = add i32 %.tmp68, 1

store i32 %.tmp69, i32* %idx
br label %.for.start.48
.for.end.48:
%.tmp70 = add i1 0, 1
ret i1 %.tmp70
}
@ptr_size = constant i32 8
define void @.mod1.assert(i1 %.arg.condition, i8* %.arg.message) {
%condition = alloca i1
store i1 %.arg.condition, i1* %condition
%message = alloca i8*
store i8* %.arg.message, i8** %message
%.tmp71 = load i1, i1* %condition
%.tmp72 = add i1 0, 1
%.tmp73 = icmp ne i1 %.tmp71, %.tmp72
br i1 %.tmp73, label %.if.true.74, label %.if.false.74
.if.true.74:
%.tmp75 = load i8*, i8** %message
%.tmp76 = call i32 (i8*) @strlen(i8*%.tmp75)
%size = alloca i32
store i32 %.tmp76, i32* %size
%.tmp77 = load i8*, i8** %message
%.tmp78 = load i32, i32* %size
%.tmp79 = call i32 (i32, i8*, i32) @write(i32 1, i8*%.tmp77, i32%.tmp78)
call void (i32) @exit(i32 1)
br label %.if.end.74
.if.false.74:

br label %.if.end.74
.if.end.74:
ret void
}
define i8* @.mod1.memset(i8* %.arg.buf, i8 %.arg.val, i32 %.arg.n) {
%buf = alloca i8*
store i8* %.arg.buf, i8** %buf
%val = alloca i8
store i8 %.arg.val, i8* %val
%n = alloca i32
store i32 %.arg.n, i32* %n

%i = alloca i32
store i32 0, i32* %i
br label %.for.start.81
.for.start.81:
%.tmp82 = load i32, i32* %i
%.tmp83 = load i32, i32* %n
%.tmp84 = icmp slt i32 %.tmp82, %.tmp83
br i1 %.tmp84, label %.for.continue.81, label %.for.end.81
.for.continue.81:
%.tmp85 = load i8, i8* %val
%.tmp86 = load i32, i32* %i
%.tmp87 = load i8*, i8** %buf
%.tmp88 = getelementptr i8, i8* %.tmp87, i32 %.tmp86
store i8 %.tmp85, i8* %.tmp88
%.tmp89 = load i32, i32* %i
%.tmp90 = add i32 %.tmp89, 1

store i32 %.tmp90, i32* %i
br label %.for.start.81
.for.end.81:
%.tmp91 = load i8*, i8** %buf
ret i8* %.tmp91
}

@.str19 = constant [14 x i8] c"{\0A\22querys\22: [\00"
@.str20 = constant [30 x i8] c"\0A{\22type\22: \22%c\22, \22value\22: %s},\00"
@.str21 = constant [32 x i8] c"\0A{\22type\22: \22%c\22, \22value\22: \22%s\22},\00"
@.str22 = constant [14 x i8] c"],\0A\22next\22: [\0A\00"
@.str23 = constant [13 x i8] c"],\0A\22alt\22: [\0A\00"
@.str24 = constant [5 x i8] c"]\0A}\0A\00"
@.str25 = constant [2 x i8] c"(\00"
@.str26 = constant [2 x i8] c"|\00"
@.str27 = constant [2 x i8] c")\00"
@.str28 = constant [4 x i8] c"EOF\00"
@.str29 = constant [2 x i8] c"|\00"
@.str30 = constant [2 x i8] c")\00"
@.str31 = constant [48 x i8] c"[%d:%d] malformed grammar, expected | got '%s'\0A\00"
@.str32 = constant [2 x i8] c"|\00"
@.str33 = constant [2 x i8] c")\00"
@.str34 = constant [22 x i8] c"open brace not closed\00"
@.str35 = constant [2 x i8] c"+\00"
@.str36 = constant [2 x i8] c"*\00"
@.str37 = constant [2 x i8] c"?\00"
@.str38 = constant [2 x i8] c"(\00"
@.str39 = constant [5 x i8] c"WORD\00"
@.str40 = constant [5 x i8] c"WORD\00"
@.str41 = constant [7 x i8] c"STRING\00"
@.str42 = constant [7 x i8] c"STRING\00"
@.str43 = constant [17 x i8] c"rule name: '%s'\0A\00"
@.str44 = constant [50 x i8] c"Some characters are not allowed in this rule name\00"
@.str45 = constant [5 x i8] c"WORD\00"
@.str46 = constant [37 x i8] c"Identifier: {type: %s, value: '%s'}\0A\00"
@.str47 = constant [31 x i8] c"rule identifier must be a WORD\00"
@.str48 = constant [2 x i8] c":\00"
@.str49 = constant [27 x i8] c"expected : after rule name\00"
@.str50 = constant [4 x i8] c"EOF\00"
@.str51 = constant [2 x i8] c"\0A\00"
@.str52 = constant [8 x i8] c"\22%[^\22]\22\00"
@.str53 = constant [7 x i8] c"(null)\00"
@.str54 = constant [15 x i8] c"%s: %s != \22%s\22\00"
@.str55 = constant [31 x i8] c"unable to match token by value\00"
@.str56 = constant [13 x i8] c"%s: %s != %s\00"
@.str57 = constant [30 x i8] c"unable to match token by type\00"
@.str58 = constant [30 x i8] c"unable to retrieve alias rule\00"
@.str59 = constant [41 x i8] c"parser.bn: query matcher not implemented\00"
@.str60 = constant [44 x i8] c"Unable to find starting rule in the grammar\00"
@.str61 = constant [4 x i8] c"EOF\00"
@.str62 = constant [26 x i8] c"syntax parsing ended here\00"



%.type.PeekerInfo = type {i32, i32, i32, i32, i8, i1}
@PeekerInfo_size = constant i32 34
@EOF = constant i32 0
define i8 @.mod93.read(%.type.PeekerInfo* %.arg.p) {
%p = alloca %.type.PeekerInfo*
store %.type.PeekerInfo* %.arg.p, %.type.PeekerInfo** %p
%.tmp94 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp95 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp94, i32 0, i32 5
%.tmp96 = load i1, i1* %.tmp95
br i1 %.tmp96, label %.if.true.97, label %.if.false.97
.if.true.97:
ret i8 0
br label %.if.end.97
.if.false.97:

br label %.if.end.97
.if.end.97:
%.tmp98 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp99 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp98, i32 0, i32 4
%.tmp100 = load i8, i8* %.tmp99
%.tmp101 = icmp eq i8 %.tmp100, 10
br i1 %.tmp101, label %.if.true.102, label %.if.false.102
.if.true.102:
%.tmp103 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp104 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp103, i32 0, i32 2
%.tmp105 = load i32, i32* %.tmp104
%.tmp106 = add i32 %.tmp105, 1
%.tmp107 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp108 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp107, i32 0, i32 2
store i32 %.tmp106, i32* %.tmp108
%.tmp109 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp110 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp109, i32 0, i32 3
store i32 0, i32* %.tmp110
br label %.if.end.102
.if.false.102:

br label %.if.end.102
.if.end.102:
%.tmp111 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp112 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp111, i32 0, i32 1
%.tmp113 = load i32, i32* %.tmp112
%.tmp114 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp115 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp114, i32 0, i32 4
%.tmp116 = getelementptr i8, i8* %.tmp115, i32 0
%.tmp117 = call i32 (i32, i8*, i32) @read(i32%.tmp113, i8*%.tmp116, i32 1)
%.tmp118 = icmp eq i32 %.tmp117, 0
br i1 %.tmp118, label %.if.true.119, label %.if.false.119
.if.true.119:
%.tmp120 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp121 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp120, i32 0, i32 4
store i8 0, i8* %.tmp121
%.tmp122 = add i1 0, 1
%.tmp123 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp124 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp123, i32 0, i32 5
store i1 %.tmp122, i1* %.tmp124
%.tmp125 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp126 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp125, i32 0, i32 4
%.tmp127 = load i8, i8* %.tmp126
ret i8 %.tmp127
br label %.if.end.119
.if.false.119:

br label %.if.end.119
.if.end.119:
%.tmp128 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp129 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp128, i32 0, i32 3
%.tmp130 = load i32, i32* %.tmp129
%.tmp131 = add i32 %.tmp130, 1
%.tmp132 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp133 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp132, i32 0, i32 3
store i32 %.tmp131, i32* %.tmp133
%.tmp134 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp135 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp134, i32 0, i32 0
%.tmp136 = load i32, i32* %.tmp135
%.tmp137 = add i32 %.tmp136, 1
%.tmp138 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp139 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp138, i32 0, i32 0
store i32 %.tmp137, i32* %.tmp139
%.tmp140 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp141 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp140, i32 0, i32 4
%.tmp142 = load i8, i8* %.tmp141
ret i8 %.tmp142
}
define void @.mod93.seek(%.type.PeekerInfo* %.arg.p, i32 %.arg.pos) {
%p = alloca %.type.PeekerInfo*
store %.type.PeekerInfo* %.arg.p, %.type.PeekerInfo** %p
%pos = alloca i32
store i32 %.arg.pos, i32* %pos
%.tmp143 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp144 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp143, i32 0, i32 1
%.tmp145 = load i32, i32* %.tmp144
%.tmp146 = load i32, i32* %pos
%.tmp147 = load i32, i32* @SEEK_SET
%.tmp148 = call i32 (i32, i32, i32) @lseek(i32%.tmp145, i32%.tmp146, i32%.tmp147)
ret void
}
define %.type.PeekerInfo* @.mod93.new(i32 %.arg.fd) {
%fd = alloca i32
store i32 %.arg.fd, i32* %fd
%.tmp149 = load i32, i32* @PeekerInfo_size
%.tmp150 = call i8* (i32) @malloc(i32%.tmp149)
%.tmp151 = bitcast i8* %.tmp150 to %.type.PeekerInfo*
%p = alloca %.type.PeekerInfo*
store %.type.PeekerInfo* %.tmp151, %.type.PeekerInfo** %p
%.tmp152 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp153 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp152, i32 0, i32 0
store i32 0, i32* %.tmp153
%.tmp154 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp155 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp154, i32 0, i32 2
store i32 1, i32* %.tmp155
%.tmp156 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp157 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp156, i32 0, i32 3
store i32 0, i32* %.tmp157
%.tmp158 = load i32, i32* %fd
%.tmp159 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp160 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp159, i32 0, i32 1
store i32 %.tmp158, i32* %.tmp160
%.tmp161 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp162 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp161, i32 0, i32 4
store i8 0, i8* %.tmp162
%.tmp163 = add i1 0, 0
%.tmp164 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp165 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp164, i32 0, i32 5
store i1 %.tmp163, i1* %.tmp165
%.tmp166 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
ret %.type.PeekerInfo* %.tmp166
}
@.str0 = constant [16 x i8] c"digit too large\00"
@.str1 = constant [7 x i8] c"NUMBER\00"
@.str2 = constant [16 x i8] c"digit too large\00"
@.str3 = constant [5 x i8] c"WORD\00"
@.str4 = constant [61 x i8] c"lexer: reached end of file while scanning for 'STRING' token\00"
@.str5 = constant [17 x i8] c"string too large\00"
@.str6 = constant [7 x i8] c"STRING\00"
@.str7 = constant [15 x i8] c"char too large\00"
@.str8 = constant [4 x i8] c"CHR\00"
@.str9 = constant [3 x i8] c"NL\00"
@.str10 = constant [2 x i8] c"\0A\00"
@.str11 = constant [8 x i8] c"COMMENT\00"
@.str12 = constant [9 x i8] c"OPERATOR\00"
@.str13 = constant [2 x i8] c"-\00"
@.str14 = constant [47 x i8] c"%d:%d error: found non ascii token: '%c' (%d)\0A\00"
@.str15 = constant [9 x i8] c"OPERATOR\00"
@.str16 = constant [4 x i8] c"EOF\00"
@.str17 = constant [1 x i8] c"\00"




%.type.Token = type {i8*, i8*, i32, i32, i8*, %.type.Token*, %.type.Token*}
@Token_size = constant i32 48
%.type.ParseCtx = type {i8*, i32, i32, %.type.Token*, %.type.Token*}
@ParseCtx_size = constant i32 160
define %.type.Token* @.mod167.push_token(%.type.ParseCtx* %.arg.c, i8* %.arg.type, i8* %.arg.value) {
%c = alloca %.type.ParseCtx*
store %.type.ParseCtx* %.arg.c, %.type.ParseCtx** %c
%type = alloca i8*
store i8* %.arg.type, i8** %type
%value = alloca i8*
store i8* %.arg.value, i8** %value
%.tmp168 = load i32, i32* @Token_size
%.tmp169 = call i8* (i32) @malloc(i32%.tmp168)
%.tmp170 = bitcast i8* %.tmp169 to %.type.Token*
%root = alloca %.type.Token*
store %.type.Token* %.tmp170, %.type.Token** %root
%.tmp171 = load i8*, i8** %type
%.tmp172 = load %.type.Token*, %.type.Token** %root
%.tmp173 = getelementptr %.type.Token, %.type.Token* %.tmp172, i32 0, i32 0
store i8* %.tmp171, i8** %.tmp173
%.tmp174 = load i8*, i8** %value
%.tmp175 = load %.type.Token*, %.type.Token** %root
%.tmp176 = getelementptr %.type.Token, %.type.Token* %.tmp175, i32 0, i32 1
store i8* %.tmp174, i8** %.tmp176
%.tmp177 = load %.type.ParseCtx*, %.type.ParseCtx** %c
%.tmp178 = getelementptr %.type.ParseCtx, %.type.ParseCtx* %.tmp177, i32 0, i32 0
%.tmp179 = load i8*, i8** %.tmp178
%.tmp180 = load %.type.Token*, %.type.Token** %root
%.tmp181 = getelementptr %.type.Token, %.type.Token* %.tmp180, i32 0, i32 4
store i8* %.tmp179, i8** %.tmp181
%.tmp182 = load %.type.ParseCtx*, %.type.ParseCtx** %c
%.tmp183 = getelementptr %.type.ParseCtx, %.type.ParseCtx* %.tmp182, i32 0, i32 1
%.tmp184 = load i32, i32* %.tmp183
%.tmp185 = load %.type.Token*, %.type.Token** %root
%.tmp186 = getelementptr %.type.Token, %.type.Token* %.tmp185, i32 0, i32 2
store i32 %.tmp184, i32* %.tmp186
%.tmp187 = load %.type.ParseCtx*, %.type.ParseCtx** %c
%.tmp188 = getelementptr %.type.ParseCtx, %.type.ParseCtx* %.tmp187, i32 0, i32 2
%.tmp189 = load i32, i32* %.tmp188
%.tmp190 = load %.type.Token*, %.type.Token** %root
%.tmp191 = getelementptr %.type.Token, %.type.Token* %.tmp190, i32 0, i32 3
store i32 %.tmp189, i32* %.tmp191
%.tmp192 = load %.type.ParseCtx*, %.type.ParseCtx** %c
%.tmp193 = getelementptr %.type.ParseCtx, %.type.ParseCtx* %.tmp192, i32 0, i32 4
%.tmp194 = load %.type.Token*, %.type.Token** %.tmp193
%.tmp195 = load %.type.Token*, %.type.Token** %root
%.tmp196 = getelementptr %.type.Token, %.type.Token* %.tmp195, i32 0, i32 6
store %.type.Token* %.tmp194, %.type.Token** %.tmp196
%.tmp197 = load %.type.Token*, %.type.Token** %root
%.tmp198 = getelementptr %.type.Token, %.type.Token* %.tmp197, i32 0, i32 5
store %.type.Token* null, %.type.Token** %.tmp198
%.tmp199 = load %.type.ParseCtx*, %.type.ParseCtx** %c
%.tmp200 = getelementptr %.type.ParseCtx, %.type.ParseCtx* %.tmp199, i32 0, i32 4
%.tmp201 = load %.type.Token*, %.type.Token** %.tmp200
%.tmp202 = icmp ne %.type.Token* %.tmp201, null
br i1 %.tmp202, label %.if.true.203, label %.if.false.203
.if.true.203:
%.tmp204 = load %.type.Token*, %.type.Token** %root
%.tmp205 = load %.type.ParseCtx*, %.type.ParseCtx** %c
%.tmp206 = getelementptr %.type.ParseCtx, %.type.ParseCtx* %.tmp205, i32 0, i32 4
%.tmp207 = load %.type.Token*, %.type.Token** %.tmp206
%.tmp208 = getelementptr %.type.Token, %.type.Token* %.tmp207, i32 0, i32 5
store %.type.Token* %.tmp204, %.type.Token** %.tmp208
br label %.if.end.203
.if.false.203:

br label %.if.end.203
.if.end.203:
%.tmp209 = load %.type.Token*, %.type.Token** %root
%.tmp210 = load %.type.ParseCtx*, %.type.ParseCtx** %c
%.tmp211 = getelementptr %.type.ParseCtx, %.type.ParseCtx* %.tmp210, i32 0, i32 4
store %.type.Token* %.tmp209, %.type.Token** %.tmp211
%.tmp212 = load %.type.ParseCtx*, %.type.ParseCtx** %c
%.tmp213 = getelementptr %.type.ParseCtx, %.type.ParseCtx* %.tmp212, i32 0, i32 3
%.tmp214 = load %.type.Token*, %.type.Token** %.tmp213
%.tmp215 = icmp eq %.type.Token* %.tmp214, null
br i1 %.tmp215, label %.if.true.216, label %.if.false.216
.if.true.216:
%.tmp217 = load %.type.Token*, %.type.Token** %root
%.tmp218 = load %.type.ParseCtx*, %.type.ParseCtx** %c
%.tmp219 = getelementptr %.type.ParseCtx, %.type.ParseCtx* %.tmp218, i32 0, i32 3
store %.type.Token* %.tmp217, %.type.Token** %.tmp219
br label %.if.end.216
.if.false.216:

br label %.if.end.216
.if.end.216:
%.tmp220 = load %.type.Token*, %.type.Token** %root
ret %.type.Token* %.tmp220
}
define %.type.Token* @.mod167.tokenize(%.type.PeekerInfo* %.arg.p, i1 %.arg.keep_comments) {
%p = alloca %.type.PeekerInfo*
store %.type.PeekerInfo* %.arg.p, %.type.PeekerInfo** %p
%keep_comments = alloca i1
store i1 %.arg.keep_comments, i1* %keep_comments
%.tmp221 = load i32, i32* @ParseCtx_size
%.tmp222 = call i8* (i32) @malloc(i32%.tmp221)
%.tmp223 = bitcast i8* %.tmp222 to %.type.ParseCtx*
%ctx = alloca %.type.ParseCtx*
store %.type.ParseCtx* %.tmp223, %.type.ParseCtx** %ctx
%.tmp224 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp225 = getelementptr %.type.ParseCtx, %.type.ParseCtx* %.tmp224, i32 0, i32 3
store %.type.Token* null, %.type.Token** %.tmp225
%.tmp226 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp227 = getelementptr %.type.ParseCtx, %.type.ParseCtx* %.tmp226, i32 0, i32 4
store %.type.Token* null, %.type.Token** %.tmp227

%max_token_size = alloca i32
store i32 128, i32* %max_token_size

%.tmp228 = bitcast ptr null to i8*
%buf = alloca i8*
store i8* %.tmp228, i8** %buf

%idx = alloca i32
store i32 0, i32* %idx
%.tmp229 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp230 = call i8 (%.type.PeekerInfo*) @.mod93.read(%.type.PeekerInfo*%.tmp229)
%c = alloca i8
store i8 %.tmp230, i8* %c

br label %.for.start.231
.for.start.231:
%.tmp232 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp233 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp232, i32 0, i32 5
%.tmp234 = load i1, i1* %.tmp233
%.tmp235 = add i1 0, 0
%.tmp236 = icmp eq i1 %.tmp234, %.tmp235
br i1 %.tmp236, label %.for.continue.231, label %.for.end.231
.for.continue.231:
%.tmp237 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp238 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp237, i32 0, i32 2
%.tmp239 = load i32, i32* %.tmp238
%.tmp240 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp241 = getelementptr %.type.ParseCtx, %.type.ParseCtx* %.tmp240, i32 0, i32 1
store i32 %.tmp239, i32* %.tmp241
%.tmp242 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp243 = getelementptr %.type.PeekerInfo, %.type.PeekerInfo* %.tmp242, i32 0, i32 3
%.tmp244 = load i32, i32* %.tmp243
%.tmp245 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp246 = getelementptr %.type.ParseCtx, %.type.ParseCtx* %.tmp245, i32 0, i32 2
store i32 %.tmp244, i32* %.tmp246
%.tmp247 = load i8, i8* %c
%.tmp248 = icmp eq i8 %.tmp247, 0
br i1 %.tmp248, label %.if.true.249, label %.if.false.249
.if.true.249:
%.tmp250 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp251 = call i8 (%.type.PeekerInfo*) @.mod93.read(%.type.PeekerInfo*%.tmp250)

store i8 %.tmp251, i8* %c
br label %.if.end.249
.if.false.249:
%.tmp252 = load i8, i8* %c
%.tmp253 = call i1 (i8) @.mod3.is_digit(i8%.tmp252)
br i1 %.tmp253, label %.if.true.254, label %.if.false.254
.if.true.254:
%.tmp255 = load i32, i32* %max_token_size
%.tmp256 = call i8* (i32) @malloc(i32%.tmp255)

store i8* %.tmp256, i8** %buf
store i32 0, i32* %idx
br label %.for.start.257
.for.start.257:
%.tmp258 = load i8, i8* %c
%.tmp259 = call i1 (i8) @.mod3.is_digit(i8%.tmp258)
br i1 %.tmp259, label %.for.continue.257, label %.for.end.257
.for.continue.257:
%.tmp260 = load i8, i8* %c
%.tmp261 = load i32, i32* %idx
%.tmp262 = load i8*, i8** %buf
%.tmp263 = getelementptr i8, i8* %.tmp262, i32 %.tmp261
store i8 %.tmp260, i8* %.tmp263
%.tmp264 = load i32, i32* %idx
%.tmp265 = add i32 %.tmp264, 1

store i32 %.tmp265, i32* %idx
%.tmp266 = load i32, i32* %idx
%.tmp267 = load i32, i32* %max_token_size
%.tmp268 = icmp slt i32 %.tmp266, %.tmp267
%.tmp269 = getelementptr [16 x i8], [16 x i8]*@.str0, i64 0, i64 0
call void (i1, i8*) @.mod1.assert(i1%.tmp268, i8*%.tmp269)
%.tmp271 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp272 = call i8 (%.type.PeekerInfo*) @.mod93.read(%.type.PeekerInfo*%.tmp271)

store i8 %.tmp272, i8* %c
br label %.for.start.257
.for.end.257:
%.tmp273 = load i32, i32* %idx
%.tmp274 = load i8*, i8** %buf
%.tmp275 = getelementptr i8, i8* %.tmp274, i32 %.tmp273
store i8 0, i8* %.tmp275
%.tmp276 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp277 = getelementptr [7 x i8], [7 x i8]*@.str1, i64 0, i64 0
%.tmp278 = load i8*, i8** %buf
%.tmp279 = call %.type.Token* (%.type.ParseCtx*, i8*, i8*) @.mod167.push_token(%.type.ParseCtx*%.tmp276, i8*%.tmp277, i8*%.tmp278)
br label %.if.end.254
.if.false.254:
%.tmp280 = load i8, i8* %c
%.tmp281 = call i1 (i8) @.mod3.is_letter(i8%.tmp280)
%.tmp282 = load i8, i8* %c
%.tmp283 = icmp eq i8 %.tmp282, 95
%.tmp284 = or i1 %.tmp281, %.tmp283
br i1 %.tmp284, label %.if.true.285, label %.if.false.285
.if.true.285:
%.tmp286 = load i32, i32* %max_token_size
%.tmp287 = call i8* (i32) @malloc(i32%.tmp286)

store i8* %.tmp287, i8** %buf
store i32 0, i32* %idx
br label %.for.start.288
.for.start.288:
%.tmp289 = load i8, i8* %c
%.tmp290 = call i1 (i8) @.mod3.is_letter(i8%.tmp289)
%.tmp291 = load i8, i8* %c
%.tmp292 = call i1 (i8) @.mod3.is_digit(i8%.tmp291)
%.tmp293 = or i1 %.tmp290, %.tmp292
%.tmp294 = load i8, i8* %c
%.tmp295 = icmp eq i8 %.tmp294, 95
%.tmp296 = or i1 %.tmp293, %.tmp295
br i1 %.tmp296, label %.for.continue.288, label %.for.end.288
.for.continue.288:
%.tmp297 = load i8, i8* %c
%.tmp298 = load i32, i32* %idx
%.tmp299 = load i8*, i8** %buf
%.tmp300 = getelementptr i8, i8* %.tmp299, i32 %.tmp298
store i8 %.tmp297, i8* %.tmp300
%.tmp301 = load i32, i32* %idx
%.tmp302 = add i32 %.tmp301, 1

store i32 %.tmp302, i32* %idx
%.tmp303 = load i32, i32* %idx
%.tmp304 = load i32, i32* %max_token_size
%.tmp305 = icmp slt i32 %.tmp303, %.tmp304
%.tmp306 = getelementptr [16 x i8], [16 x i8]*@.str2, i64 0, i64 0
call void (i1, i8*) @.mod1.assert(i1%.tmp305, i8*%.tmp306)
%.tmp308 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp309 = call i8 (%.type.PeekerInfo*) @.mod93.read(%.type.PeekerInfo*%.tmp308)

store i8 %.tmp309, i8* %c
br label %.for.start.288
.for.end.288:
%.tmp310 = load i32, i32* %idx
%.tmp311 = load i8*, i8** %buf
%.tmp312 = getelementptr i8, i8* %.tmp311, i32 %.tmp310
store i8 0, i8* %.tmp312
%.tmp313 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp314 = getelementptr [5 x i8], [5 x i8]*@.str3, i64 0, i64 0
%.tmp315 = load i8*, i8** %buf
%.tmp316 = call %.type.Token* (%.type.ParseCtx*, i8*, i8*) @.mod167.push_token(%.type.ParseCtx*%.tmp313, i8*%.tmp314, i8*%.tmp315)
br label %.if.end.285
.if.false.285:
%.tmp317 = load i8, i8* %c
%.tmp318 = call i1 (i8) @.mod3.is_whitespace(i8%.tmp317)
br i1 %.tmp318, label %.if.true.319, label %.if.false.319
.if.true.319:
%.tmp320 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp321 = call i8 (%.type.PeekerInfo*) @.mod93.read(%.type.PeekerInfo*%.tmp320)

store i8 %.tmp321, i8* %c
br label %.if.end.319
.if.false.319:
%.tmp322 = load i8, i8* %c
%.tmp323 = icmp eq i8 %.tmp322, 34
br i1 %.tmp323, label %.if.true.324, label %.if.false.324
.if.true.324:
%.tmp325 = load i32, i32* %max_token_size
%.tmp326 = call i8* (i32) @malloc(i32%.tmp325)

store i8* %.tmp326, i8** %buf
%.tmp327 = load i8, i8* %c
%.tmp328 = load i8*, i8** %buf
%.tmp329 = getelementptr i8, i8* %.tmp328, i32 0
store i8 %.tmp327, i8* %.tmp329
%.tmp330 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp331 = call i8 (%.type.PeekerInfo*) @.mod93.read(%.type.PeekerInfo*%.tmp330)

store i8 %.tmp331, i8* %c
store i32 1, i32* %idx
br label %.for.start.332
.for.start.332:
%.tmp333 = load i8, i8* %c
%.tmp334 = icmp ne i8 %.tmp333, 34
br i1 %.tmp334, label %.for.continue.332, label %.for.end.332
.for.continue.332:
%.tmp335 = load i8, i8* %c
%.tmp336 = icmp ne i8 %.tmp335, 0
%.tmp337 = getelementptr [61 x i8], [61 x i8]*@.str4, i64 0, i64 0
call void (i1, i8*) @.mod1.assert(i1%.tmp336, i8*%.tmp337)
%.tmp339 = load i32, i32* %idx
%.tmp340 = load i32, i32* %max_token_size
%.tmp341 = sub i32 %.tmp340, 2
%.tmp342 = icmp slt i32 %.tmp339, %.tmp341
%.tmp343 = getelementptr [17 x i8], [17 x i8]*@.str5, i64 0, i64 0
call void (i1, i8*) @.mod1.assert(i1%.tmp342, i8*%.tmp343)
%.tmp345 = load i8, i8* %c
%.tmp346 = load i32, i32* %idx
%.tmp347 = load i8*, i8** %buf
%.tmp348 = getelementptr i8, i8* %.tmp347, i32 %.tmp346
store i8 %.tmp345, i8* %.tmp348
%.tmp349 = load i32, i32* %idx
%.tmp350 = add i32 %.tmp349, 1

store i32 %.tmp350, i32* %idx
%.tmp351 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp352 = call i8 (%.type.PeekerInfo*) @.mod93.read(%.type.PeekerInfo*%.tmp351)

store i8 %.tmp352, i8* %c
br label %.for.start.332
.for.end.332:
%.tmp353 = load i8, i8* %c
%.tmp354 = load i32, i32* %idx
%.tmp355 = load i8*, i8** %buf
%.tmp356 = getelementptr i8, i8* %.tmp355, i32 %.tmp354
store i8 %.tmp353, i8* %.tmp356
%.tmp357 = load i32, i32* %idx
%.tmp358 = add i32 %.tmp357, 1
%.tmp359 = load i8*, i8** %buf
%.tmp360 = getelementptr i8, i8* %.tmp359, i32 %.tmp358
store i8 0, i8* %.tmp360
%.tmp361 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp362 = call i8 (%.type.PeekerInfo*) @.mod93.read(%.type.PeekerInfo*%.tmp361)

store i8 %.tmp362, i8* %c
%.tmp363 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp364 = getelementptr [7 x i8], [7 x i8]*@.str6, i64 0, i64 0
%.tmp365 = load i8*, i8** %buf
%.tmp366 = call %.type.Token* (%.type.ParseCtx*, i8*, i8*) @.mod167.push_token(%.type.ParseCtx*%.tmp363, i8*%.tmp364, i8*%.tmp365)
br label %.if.end.324
.if.false.324:
%.tmp367 = load i8, i8* %c
%.tmp368 = icmp eq i8 %.tmp367, 39
br i1 %.tmp368, label %.if.true.369, label %.if.false.369
.if.true.369:
%.tmp370 = load i32, i32* %max_token_size
%.tmp371 = call i8* (i32) @malloc(i32%.tmp370)

store i8* %.tmp371, i8** %buf
%.tmp372 = load i8, i8* %c
%.tmp373 = load i8*, i8** %buf
%.tmp374 = getelementptr i8, i8* %.tmp373, i32 0
store i8 %.tmp372, i8* %.tmp374
%.tmp375 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp376 = call i8 (%.type.PeekerInfo*) @.mod93.read(%.type.PeekerInfo*%.tmp375)

store i8 %.tmp376, i8* %c
store i32 1, i32* %idx
br label %.for.start.377
.for.start.377:
%.tmp378 = load i8, i8* %c
%.tmp379 = icmp ne i8 %.tmp378, 39
br i1 %.tmp379, label %.for.continue.377, label %.for.end.377
.for.continue.377:
%.tmp380 = load i32, i32* %idx
%.tmp381 = load i32, i32* %max_token_size
%.tmp382 = sub i32 %.tmp381, 2
%.tmp383 = icmp slt i32 %.tmp380, %.tmp382
%.tmp384 = getelementptr [15 x i8], [15 x i8]*@.str7, i64 0, i64 0
call void (i1, i8*) @.mod1.assert(i1%.tmp383, i8*%.tmp384)
%.tmp386 = load i8, i8* %c
%.tmp387 = load i32, i32* %idx
%.tmp388 = load i8*, i8** %buf
%.tmp389 = getelementptr i8, i8* %.tmp388, i32 %.tmp387
store i8 %.tmp386, i8* %.tmp389
%.tmp390 = load i32, i32* %idx
%.tmp391 = add i32 %.tmp390, 1

store i32 %.tmp391, i32* %idx
%.tmp392 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp393 = call i8 (%.type.PeekerInfo*) @.mod93.read(%.type.PeekerInfo*%.tmp392)

store i8 %.tmp393, i8* %c
br label %.for.start.377
.for.end.377:
%.tmp394 = load i8, i8* %c
%.tmp395 = load i32, i32* %idx
%.tmp396 = load i8*, i8** %buf
%.tmp397 = getelementptr i8, i8* %.tmp396, i32 %.tmp395
store i8 %.tmp394, i8* %.tmp397
%.tmp398 = load i32, i32* %idx
%.tmp399 = add i32 %.tmp398, 1
%.tmp400 = load i8*, i8** %buf
%.tmp401 = getelementptr i8, i8* %.tmp400, i32 %.tmp399
store i8 0, i8* %.tmp401
%.tmp402 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp403 = call i8 (%.type.PeekerInfo*) @.mod93.read(%.type.PeekerInfo*%.tmp402)

store i8 %.tmp403, i8* %c
%.tmp404 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp405 = getelementptr [4 x i8], [4 x i8]*@.str8, i64 0, i64 0
%.tmp406 = load i8*, i8** %buf
%.tmp407 = call %.type.Token* (%.type.ParseCtx*, i8*, i8*) @.mod167.push_token(%.type.ParseCtx*%.tmp404, i8*%.tmp405, i8*%.tmp406)
br label %.if.end.369
.if.false.369:
%.tmp408 = load i8, i8* %c
%.tmp409 = icmp eq i8 %.tmp408, 10
br i1 %.tmp409, label %.if.true.410, label %.if.false.410
.if.true.410:
%.tmp411 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp412 = getelementptr [3 x i8], [3 x i8]*@.str9, i64 0, i64 0
%.tmp413 = getelementptr [2 x i8], [2 x i8]*@.str10, i64 0, i64 0
%.tmp414 = call %.type.Token* (%.type.ParseCtx*, i8*, i8*) @.mod167.push_token(%.type.ParseCtx*%.tmp411, i8*%.tmp412, i8*%.tmp413)
%.tmp415 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp416 = call i8 (%.type.PeekerInfo*) @.mod93.read(%.type.PeekerInfo*%.tmp415)

store i8 %.tmp416, i8* %c
br label %.if.end.410
.if.false.410:
%.tmp417 = load i8, i8* %c
%.tmp418 = icmp eq i8 %.tmp417, 45
br i1 %.tmp418, label %.if.true.419, label %.if.false.419
.if.true.419:
%.tmp420 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp421 = call i8 (%.type.PeekerInfo*) @.mod93.read(%.type.PeekerInfo*%.tmp420)

store i8 %.tmp421, i8* %c
%.tmp422 = load i8, i8* %c
%.tmp423 = icmp eq i8 %.tmp422, 45
br i1 %.tmp423, label %.if.true.424, label %.if.false.424
.if.true.424:
%.tmp425 = load i32, i32* %max_token_size
%.tmp426 = call i8* (i32) @malloc(i32%.tmp425)

store i8* %.tmp426, i8** %buf
%.tmp427 = load i8*, i8** %buf
%.tmp428 = getelementptr i8, i8* %.tmp427, i32 0
store i8 45, i8* %.tmp428
store i32 1, i32* %idx
br label %.for.start.429
.for.start.429:
%.tmp430 = load i8, i8* %c
%.tmp431 = icmp ne i8 %.tmp430, 10
%.tmp432 = load i8, i8* %c
%.tmp433 = icmp ne i8 %.tmp432, 0
%.tmp434 = and i1 %.tmp431, %.tmp433
br i1 %.tmp434, label %.for.continue.429, label %.for.end.429
.for.continue.429:
%.tmp435 = load i8, i8* %c
%.tmp436 = load i32, i32* %idx
%.tmp437 = load i8*, i8** %buf
%.tmp438 = getelementptr i8, i8* %.tmp437, i32 %.tmp436
store i8 %.tmp435, i8* %.tmp438
%.tmp439 = load i32, i32* %idx
%.tmp440 = add i32 %.tmp439, 1

store i32 %.tmp440, i32* %idx
%.tmp441 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp442 = call i8 (%.type.PeekerInfo*) @.mod93.read(%.type.PeekerInfo*%.tmp441)

store i8 %.tmp442, i8* %c
br label %.for.start.429
.for.end.429:
%.tmp443 = load i32, i32* %idx
%.tmp444 = load i8*, i8** %buf
%.tmp445 = getelementptr i8, i8* %.tmp444, i32 %.tmp443
store i8 0, i8* %.tmp445
%.tmp446 = load i1, i1* %keep_comments
br i1 %.tmp446, label %.if.true.447, label %.if.false.447
.if.true.447:
%.tmp448 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp449 = getelementptr [8 x i8], [8 x i8]*@.str11, i64 0, i64 0
%.tmp450 = load i8*, i8** %buf
%.tmp451 = call %.type.Token* (%.type.ParseCtx*, i8*, i8*) @.mod167.push_token(%.type.ParseCtx*%.tmp448, i8*%.tmp449, i8*%.tmp450)
br label %.if.end.447
.if.false.447:
%.tmp452 = load i8*, i8** %buf
%.tmp453 = bitcast i8* %.tmp452 to i8*
call void (i8*) @free(i8*%.tmp453)
br label %.if.end.447
.if.end.447:
br label %.if.end.424
.if.false.424:
%.tmp455 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp456 = getelementptr [9 x i8], [9 x i8]*@.str12, i64 0, i64 0
%.tmp457 = getelementptr [2 x i8], [2 x i8]*@.str13, i64 0, i64 0
%.tmp458 = call %.type.Token* (%.type.ParseCtx*, i8*, i8*) @.mod167.push_token(%.type.ParseCtx*%.tmp455, i8*%.tmp456, i8*%.tmp457)
br label %.if.end.424
.if.end.424:
br label %.if.end.419
.if.false.419:
%.tmp459 = load i8, i8* %c
%.tmp460 = icmp sgt i8 %.tmp459, 126
br i1 %.tmp460, label %.if.true.461, label %.if.false.461
.if.true.461:
%.tmp462 = getelementptr [47 x i8], [47 x i8]*@.str14, i64 0, i64 0
%.tmp463 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp464 = getelementptr %.type.ParseCtx, %.type.ParseCtx* %.tmp463, i32 0, i32 1
%.tmp465 = load i32, i32* %.tmp464
%.tmp466 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp467 = getelementptr %.type.ParseCtx, %.type.ParseCtx* %.tmp466, i32 0, i32 2
%.tmp468 = load i32, i32* %.tmp467
%.tmp469 = load i8, i8* %c
%.tmp470 = load i8, i8* %c
%.tmp471 = call i32 (i8*, ...) @printf(i8*%.tmp462, i32%.tmp465, i32%.tmp468, i8%.tmp469, i8%.tmp470)
call void (i32) @exit(i32 1)
br label %.if.end.461
.if.false.461:

br label %.if.end.461
.if.end.461:
%.tmp473 = call i8* (i32) @malloc(i32 2)

store i8* %.tmp473, i8** %buf
%.tmp474 = load i8, i8* %c
%.tmp475 = load i8*, i8** %buf
%.tmp476 = getelementptr i8, i8* %.tmp475, i32 0
store i8 %.tmp474, i8* %.tmp476
%.tmp477 = load i8*, i8** %buf
%.tmp478 = getelementptr i8, i8* %.tmp477, i32 1
store i8 0, i8* %.tmp478
%.tmp479 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp480 = getelementptr [9 x i8], [9 x i8]*@.str15, i64 0, i64 0
%.tmp481 = load i8*, i8** %buf
%.tmp482 = call %.type.Token* (%.type.ParseCtx*, i8*, i8*) @.mod167.push_token(%.type.ParseCtx*%.tmp479, i8*%.tmp480, i8*%.tmp481)
%.tmp483 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp484 = call i8 (%.type.PeekerInfo*) @.mod93.read(%.type.PeekerInfo*%.tmp483)

store i8 %.tmp484, i8* %c
br label %.if.end.419
.if.end.419:
br label %.if.end.410
.if.end.410:
br label %.if.end.369
.if.end.369:
br label %.if.end.324
.if.end.324:
br label %.if.end.319
.if.end.319:
br label %.if.end.285
.if.end.285:
br label %.if.end.254
.if.end.254:
br label %.if.end.249
.if.end.249:

br label %.for.start.231
.for.end.231:
%.tmp485 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp486 = getelementptr [4 x i8], [4 x i8]*@.str16, i64 0, i64 0
%.tmp487 = getelementptr [1 x i8], [1 x i8]*@.str17, i64 0, i64 0
%.tmp488 = call %.type.Token* (%.type.ParseCtx*, i8*, i8*) @.mod167.push_token(%.type.ParseCtx*%.tmp485, i8*%.tmp486, i8*%.tmp487)
%.tmp489 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp490 = getelementptr %.type.ParseCtx, %.type.ParseCtx* %.tmp489, i32 0, i32 3
%.tmp491 = load %.type.Token*, %.type.Token** %.tmp490
%root = alloca %.type.Token*
store %.type.Token* %.tmp491, %.type.Token** %root
%.tmp492 = load %.type.ParseCtx*, %.type.ParseCtx** %ctx
%.tmp493 = bitcast %.type.ParseCtx* %.tmp492 to i8*
call void (i8*) @free(i8*%.tmp493)
%.tmp495 = load %.type.Token*, %.type.Token** %root
%.tmp496 = bitcast %.type.Token* %.tmp495 to %.type.Token*
ret %.type.Token* %.tmp496
}
@.str18 = constant [19 x i8] c"[%d:%d] error: %s\0A\00"



%.type.Error = type {i32, i32, i8*, i8*}
@Error_size = constant i32 24
define %.type.Error* @.mod497.from(%.type.Token* %.arg.t, i8* %.arg.message) {
%t = alloca %.type.Token*
store %.type.Token* %.arg.t, %.type.Token** %t
%message = alloca i8*
store i8* %.arg.message, i8** %message

%.tmp498 = bitcast ptr null to i8*
%.tmp499 = load %.type.Token*, %.type.Token** %t
%.tmp500 = getelementptr %.type.Token, %.type.Token* %.tmp499, i32 0, i32 2
%.tmp501 = load i32, i32* %.tmp500
%.tmp502 = load %.type.Token*, %.type.Token** %t
%.tmp503 = getelementptr %.type.Token, %.type.Token* %.tmp502, i32 0, i32 3
%.tmp504 = load i32, i32* %.tmp503
%.tmp505 = load i8*, i8** %message
%.tmp506 = call %.type.Error* (i8*, i32, i32, i8*) @.mod497.new(i8*%.tmp498, i32%.tmp501, i32%.tmp504, i8*%.tmp505)
ret %.type.Error* %.tmp506
}
define %.type.Error* @.mod497.new(i8* %.arg.filename, i32 %.arg.line, i32 %.arg.char_of_line, i8* %.arg.message) {
%filename = alloca i8*
store i8* %.arg.filename, i8** %filename
%line = alloca i32
store i32 %.arg.line, i32* %line
%char_of_line = alloca i32
store i32 %.arg.char_of_line, i32* %char_of_line
%message = alloca i8*
store i8* %.arg.message, i8** %message
%.tmp507 = load i32, i32* @Error_size
%.tmp508 = call i8* (i32) @malloc(i32%.tmp507)
%.tmp509 = bitcast i8* %.tmp508 to %.type.Error*
%e = alloca %.type.Error*
store %.type.Error* %.tmp509, %.type.Error** %e
%.tmp510 = load i32, i32* %line
%.tmp511 = load %.type.Error*, %.type.Error** %e
%.tmp512 = getelementptr %.type.Error, %.type.Error* %.tmp511, i32 0, i32 0
store i32 %.tmp510, i32* %.tmp512
%.tmp513 = load i32, i32* %char_of_line
%.tmp514 = load %.type.Error*, %.type.Error** %e
%.tmp515 = getelementptr %.type.Error, %.type.Error* %.tmp514, i32 0, i32 1
store i32 %.tmp513, i32* %.tmp515
%.tmp516 = load i8*, i8** %message
%.tmp517 = load %.type.Error*, %.type.Error** %e
%.tmp518 = getelementptr %.type.Error, %.type.Error* %.tmp517, i32 0, i32 3
store i8* %.tmp516, i8** %.tmp518
%.tmp519 = load i8*, i8** %filename
%.tmp520 = load %.type.Error*, %.type.Error** %e
%.tmp521 = getelementptr %.type.Error, %.type.Error* %.tmp520, i32 0, i32 2
store i8* %.tmp519, i8** %.tmp521
%.tmp522 = load %.type.Error*, %.type.Error** %e
ret %.type.Error* %.tmp522
}
define void @.mod497.report(%.type.Error* %.arg.e) {
%e = alloca %.type.Error*
store %.type.Error* %.arg.e, %.type.Error** %e
%.tmp523 = getelementptr [19 x i8], [19 x i8]*@.str18, i64 0, i64 0
%.tmp524 = load %.type.Error*, %.type.Error** %e
%.tmp525 = getelementptr %.type.Error, %.type.Error* %.tmp524, i32 0, i32 0
%.tmp526 = load i32, i32* %.tmp525
%.tmp527 = load %.type.Error*, %.type.Error** %e
%.tmp528 = getelementptr %.type.Error, %.type.Error* %.tmp527, i32 0, i32 1
%.tmp529 = load i32, i32* %.tmp528
%.tmp530 = load %.type.Error*, %.type.Error** %e
%.tmp531 = getelementptr %.type.Error, %.type.Error* %.tmp530, i32 0, i32 3
%.tmp532 = load i8*, i8** %.tmp531
%.tmp533 = call i32 (i8*, ...) @printf(i8*%.tmp523, i32%.tmp526, i32%.tmp529, i8*%.tmp532)
ret void
}
%.type.Query = type {i8, i8*, %.type.Query*}
@Query_size = constant i32 24
%.type.Matcher = type {%.type.Query*, i8, %.type.Matcher*, %.type.Matcher*}
@Matcher_size = constant i32 32
define void @.mod92.debug_matcher(%.type.Matcher* %.arg.m) {
%m = alloca %.type.Matcher*
store %.type.Matcher* %.arg.m, %.type.Matcher** %m
%.tmp534 = getelementptr [14 x i8], [14 x i8]*@.str19, i64 0, i64 0
%.tmp535 = call i32 (i8*, ...) @printf(i8*%.tmp534)
%.tmp536 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp537 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp536, i32 0, i32 0
%.tmp538 = load %.type.Query*, %.type.Query** %.tmp537
%q = alloca %.type.Query*
store %.type.Query* %.tmp538, %.type.Query** %q
br label %.for.start.539
.for.start.539:
%.tmp540 = load %.type.Query*, %.type.Query** %q
%.tmp541 = icmp ne %.type.Query* %.tmp540, null
br i1 %.tmp541, label %.for.continue.539, label %.for.end.539
.for.continue.539:
%.tmp542 = load %.type.Query*, %.type.Query** %q
%.tmp543 = getelementptr %.type.Query, %.type.Query* %.tmp542, i32 0, i32 0
%.tmp544 = load i8, i8* %.tmp543
%.tmp545 = icmp eq i8 %.tmp544, 118
br i1 %.tmp545, label %.if.true.546, label %.if.false.546
.if.true.546:
%.tmp547 = getelementptr [30 x i8], [30 x i8]*@.str20, i64 0, i64 0
%.tmp548 = load %.type.Query*, %.type.Query** %q
%.tmp549 = getelementptr %.type.Query, %.type.Query* %.tmp548, i32 0, i32 0
%.tmp550 = load i8, i8* %.tmp549
%.tmp551 = load %.type.Query*, %.type.Query** %q
%.tmp552 = getelementptr %.type.Query, %.type.Query* %.tmp551, i32 0, i32 1
%.tmp553 = load i8*, i8** %.tmp552
%.tmp554 = call i32 (i8*, ...) @printf(i8*%.tmp547, i8%.tmp550, i8*%.tmp553)
br label %.if.end.546
.if.false.546:
%.tmp555 = getelementptr [32 x i8], [32 x i8]*@.str21, i64 0, i64 0
%.tmp556 = load %.type.Query*, %.type.Query** %q
%.tmp557 = getelementptr %.type.Query, %.type.Query* %.tmp556, i32 0, i32 0
%.tmp558 = load i8, i8* %.tmp557
%.tmp559 = load %.type.Query*, %.type.Query** %q
%.tmp560 = getelementptr %.type.Query, %.type.Query* %.tmp559, i32 0, i32 1
%.tmp561 = load i8*, i8** %.tmp560
%.tmp562 = call i32 (i8*, ...) @printf(i8*%.tmp555, i8%.tmp558, i8*%.tmp561)
br label %.if.end.546
.if.end.546:
%.tmp563 = load %.type.Query*, %.type.Query** %q
%.tmp564 = getelementptr %.type.Query, %.type.Query* %.tmp563, i32 0, i32 2
%.tmp565 = load %.type.Query*, %.type.Query** %.tmp564

store %.type.Query* %.tmp565, %.type.Query** %q
br label %.for.start.539
.for.end.539:
%.tmp566 = getelementptr [14 x i8], [14 x i8]*@.str22, i64 0, i64 0
%.tmp567 = call i32 (i8*, ...) @printf(i8*%.tmp566)
%.tmp568 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp569 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp568, i32 0, i32 3
%.tmp570 = load %.type.Matcher*, %.type.Matcher** %.tmp569
%.tmp571 = icmp ne %.type.Matcher* %.tmp570, null
br i1 %.tmp571, label %.if.true.572, label %.if.false.572
.if.true.572:
%.tmp573 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp574 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp573, i32 0, i32 3
%.tmp575 = load %.type.Matcher*, %.type.Matcher** %.tmp574
call void (%.type.Matcher*) @.mod92.debug_matcher(%.type.Matcher*%.tmp575)
br label %.if.end.572
.if.false.572:

br label %.if.end.572
.if.end.572:
%.tmp577 = getelementptr [13 x i8], [13 x i8]*@.str23, i64 0, i64 0
%.tmp578 = call i32 (i8*, ...) @printf(i8*%.tmp577)
%.tmp579 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp580 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp579, i32 0, i32 2
%.tmp581 = load %.type.Matcher*, %.type.Matcher** %.tmp580
%.tmp582 = icmp ne %.type.Matcher* %.tmp581, null
br i1 %.tmp582, label %.if.true.583, label %.if.false.583
.if.true.583:
%.tmp584 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp585 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp584, i32 0, i32 2
%.tmp586 = load %.type.Matcher*, %.type.Matcher** %.tmp585
call void (%.type.Matcher*) @.mod92.debug_matcher(%.type.Matcher*%.tmp586)
br label %.if.end.583
.if.false.583:

br label %.if.end.583
.if.end.583:
%.tmp588 = getelementptr [5 x i8], [5 x i8]*@.str24, i64 0, i64 0
%.tmp589 = call i32 (i8*, ...) @printf(i8*%.tmp588)
ret void
}
%.type.Rule = type {i8*, %.type.Matcher*}
@Rule_size = constant i32 16
%.type.ParsingContext = type {%.type.Token*}
@ParsingContext_size = constant i32 8
define %.type.ParsingContext* @.mod92.new_context(%.type.File* %.arg.f) {
%f = alloca %.type.File*
store %.type.File* %.arg.f, %.type.File** %f
%.tmp590 = load i32, i32* @ParsingContext_size
%.tmp591 = call i8* (i32) @malloc(i32%.tmp590)
%.tmp592 = bitcast i8* %.tmp591 to %.type.ParsingContext*
%ctx = alloca %.type.ParsingContext*
store %.type.ParsingContext* %.tmp592, %.type.ParsingContext** %ctx
%.tmp593 = load %.type.File*, %.type.File** %f
%.tmp594 = call i32 (%.type.File*) @fileno(%.type.File*%.tmp593)
%fd = alloca i32
store i32 %.tmp594, i32* %fd
%.tmp595 = load i32, i32* %fd
%.tmp596 = call %.type.PeekerInfo* (i32) @.mod93.new(i32%.tmp595)
%p = alloca %.type.PeekerInfo*
store %.type.PeekerInfo* %.tmp596, %.type.PeekerInfo** %p
%.tmp597 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp598 = add i1 0, 0
%.tmp599 = call %.type.Token* (%.type.PeekerInfo*, i1) @.mod167.tokenize(%.type.PeekerInfo*%.tmp597, i1%.tmp598)
%token_list = alloca %.type.Token*
store %.type.Token* %.tmp599, %.type.Token** %token_list
%.tmp600 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp601 = bitcast %.type.PeekerInfo* %.tmp600 to i8*
call void (i8*) @free(i8*%.tmp601)
%.tmp603 = load %.type.Token*, %.type.Token** %token_list
%.tmp604 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp605 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp604, i32 0, i32 0
store %.type.Token* %.tmp603, %.type.Token** %.tmp605
%.tmp606 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
ret %.type.ParsingContext* %.tmp606
}
define %.type.Matcher* @.mod92.new_matcher() {
%.tmp607 = load i32, i32* @Matcher_size
%.tmp608 = call i8* (i32) @malloc(i32%.tmp607)
%.tmp609 = bitcast i8* %.tmp608 to %.type.Matcher*
%m = alloca %.type.Matcher*
store %.type.Matcher* %.tmp609, %.type.Matcher** %m
%.tmp610 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp611 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp610, i32 0, i32 1
store i8 49, i8* %.tmp611
%.tmp612 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp613 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp612, i32 0, i32 2
store %.type.Matcher* null, %.type.Matcher** %.tmp613
%.tmp614 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp615 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp614, i32 0, i32 3
store %.type.Matcher* null, %.type.Matcher** %.tmp615
%.tmp616 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp617 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp616, i32 0, i32 0
store %.type.Query* null, %.type.Query** %.tmp617
%.tmp618 = load %.type.Matcher*, %.type.Matcher** %m
ret %.type.Matcher* %.tmp618
}
define %.type.Matcher* @.mod92.parse_matcher(%.type.ParsingContext* %.arg.ctx) {
%ctx = alloca %.type.ParsingContext*
store %.type.ParsingContext* %.arg.ctx, %.type.ParsingContext** %ctx

%m = alloca %.type.Matcher*

%.tmp619 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp620 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp619, i32 0, i32 0
%.tmp621 = load %.type.Token*, %.type.Token** %.tmp620
%.tmp622 = getelementptr %.type.Token, %.type.Token* %.tmp621, i32 0, i32 1
%.tmp623 = load i8*, i8** %.tmp622
%.tmp624 = getelementptr [2 x i8], [2 x i8]*@.str25, i64 0, i64 0
%.tmp625 = call i32 (i8*, i8*) @strcmp(i8*%.tmp623, i8*%.tmp624)
%.tmp626 = icmp eq i32 %.tmp625, 0
br i1 %.tmp626, label %.if.true.627, label %.if.false.627
.if.true.627:
%.tmp628 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp629 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp628, i32 0, i32 0
%.tmp630 = load %.type.Token*, %.type.Token** %.tmp629
%.tmp631 = getelementptr %.type.Token, %.type.Token* %.tmp630, i32 0, i32 5
%.tmp632 = load %.type.Token*, %.type.Token** %.tmp631
%.tmp633 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp634 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp633, i32 0, i32 0
store %.type.Token* %.tmp632, %.type.Token** %.tmp634

%max_matchers = alloca i32
store i32 10, i32* %max_matchers
%.tmp635 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp636 = call %.type.Matcher* (%.type.ParsingContext*) @.mod92.parse_matcher(%.type.ParsingContext*%.tmp635)

store %.type.Matcher* %.tmp636, %.type.Matcher** %m
%.tmp637 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp638 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp637, i32 0, i32 0
%.tmp639 = load %.type.Token*, %.type.Token** %.tmp638
%.tmp640 = getelementptr %.type.Token, %.type.Token* %.tmp639, i32 0, i32 1
%.tmp641 = load i8*, i8** %.tmp640
%.tmp642 = getelementptr [2 x i8], [2 x i8]*@.str26, i64 0, i64 0
%.tmp643 = call i32 (i8*, i8*) @strcmp(i8*%.tmp641, i8*%.tmp642)
%.tmp644 = icmp eq i32 %.tmp643, 0
br i1 %.tmp644, label %.if.true.645, label %.if.false.645
.if.true.645:
%.tmp646 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp647 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp646, i32 0, i32 0
%.tmp648 = load %.type.Token*, %.type.Token** %.tmp647
%.tmp649 = getelementptr %.type.Token, %.type.Token* %.tmp648, i32 0, i32 5
%.tmp650 = load %.type.Token*, %.type.Token** %.tmp649
%.tmp651 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp652 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp651, i32 0, i32 0
store %.type.Token* %.tmp650, %.type.Token** %.tmp652
%.tmp653 = load %.type.Matcher*, %.type.Matcher** %m
%last_matcher = alloca %.type.Matcher*
store %.type.Matcher* %.tmp653, %.type.Matcher** %last_matcher

br label %.for.start.654
.for.start.654:
%.tmp655 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp656 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp655, i32 0, i32 0
%.tmp657 = load %.type.Token*, %.type.Token** %.tmp656
%.tmp658 = getelementptr %.type.Token, %.type.Token* %.tmp657, i32 0, i32 1
%.tmp659 = load i8*, i8** %.tmp658
%.tmp660 = getelementptr [2 x i8], [2 x i8]*@.str27, i64 0, i64 0
%.tmp661 = call i32 (i8*, i8*) @strcmp(i8*%.tmp659, i8*%.tmp660)
%.tmp662 = icmp ne i32 %.tmp661, 0
%.tmp663 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp664 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp663, i32 0, i32 0
%.tmp665 = load %.type.Token*, %.type.Token** %.tmp664
%.tmp666 = getelementptr %.type.Token, %.type.Token* %.tmp665, i32 0, i32 0
%.tmp667 = load i8*, i8** %.tmp666
%.tmp668 = getelementptr [4 x i8], [4 x i8]*@.str28, i64 0, i64 0
%.tmp669 = call i32 (i8*, i8*) @strcmp(i8*%.tmp667, i8*%.tmp668)
%.tmp670 = icmp ne i32 %.tmp669, 0
%.tmp671 = and i1 %.tmp662, %.tmp670
br i1 %.tmp671, label %.for.continue.654, label %.for.end.654
.for.continue.654:
%.tmp672 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp673 = call %.type.Matcher* (%.type.ParsingContext*) @.mod92.parse_matcher(%.type.ParsingContext*%.tmp672)
%.tmp674 = load %.type.Matcher*, %.type.Matcher** %last_matcher
%.tmp675 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp674, i32 0, i32 2
store %.type.Matcher* %.tmp673, %.type.Matcher** %.tmp675
%.tmp676 = load %.type.Matcher*, %.type.Matcher** %last_matcher
%.tmp677 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp676, i32 0, i32 2
%.tmp678 = load %.type.Matcher*, %.type.Matcher** %.tmp677

store %.type.Matcher* %.tmp678, %.type.Matcher** %last_matcher
%.tmp679 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp680 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp679, i32 0, i32 0
%.tmp681 = load %.type.Token*, %.type.Token** %.tmp680
%.tmp682 = getelementptr %.type.Token, %.type.Token* %.tmp681, i32 0, i32 1
%.tmp683 = load i8*, i8** %.tmp682
%.tmp684 = getelementptr [2 x i8], [2 x i8]*@.str29, i64 0, i64 0
%.tmp685 = call i32 (i8*, i8*) @strcmp(i8*%.tmp683, i8*%.tmp684)
%.tmp686 = icmp ne i32 %.tmp685, 0
%.tmp687 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp688 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp687, i32 0, i32 0
%.tmp689 = load %.type.Token*, %.type.Token** %.tmp688
%.tmp690 = getelementptr %.type.Token, %.type.Token* %.tmp689, i32 0, i32 1
%.tmp691 = load i8*, i8** %.tmp690
%.tmp692 = getelementptr [2 x i8], [2 x i8]*@.str30, i64 0, i64 0
%.tmp693 = call i32 (i8*, i8*) @strcmp(i8*%.tmp691, i8*%.tmp692)
%.tmp694 = icmp ne i32 %.tmp693, 0
%.tmp695 = and i1 %.tmp686, %.tmp694
br i1 %.tmp695, label %.if.true.696, label %.if.false.696
.if.true.696:
%.tmp697 = getelementptr [48 x i8], [48 x i8]*@.str31, i64 0, i64 0
%.tmp698 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp699 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp698, i32 0, i32 0
%.tmp700 = load %.type.Token*, %.type.Token** %.tmp699
%.tmp701 = getelementptr %.type.Token, %.type.Token* %.tmp700, i32 0, i32 2
%.tmp702 = load i32, i32* %.tmp701
%.tmp703 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp704 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp703, i32 0, i32 0
%.tmp705 = load %.type.Token*, %.type.Token** %.tmp704
%.tmp706 = getelementptr %.type.Token, %.type.Token* %.tmp705, i32 0, i32 3
%.tmp707 = load i32, i32* %.tmp706
%.tmp708 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp709 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp708, i32 0, i32 0
%.tmp710 = load %.type.Token*, %.type.Token** %.tmp709
%.tmp711 = getelementptr %.type.Token, %.type.Token* %.tmp710, i32 0, i32 1
%.tmp712 = load i8*, i8** %.tmp711
%.tmp713 = call i32 (i8*, ...) @printf(i8*%.tmp697, i32%.tmp702, i32%.tmp707, i8*%.tmp712)
call void (i32) @exit(i32 1)
br label %.if.end.696
.if.false.696:

br label %.if.end.696
.if.end.696:
%.tmp715 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp716 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp715, i32 0, i32 0
%.tmp717 = load %.type.Token*, %.type.Token** %.tmp716
%.tmp718 = getelementptr %.type.Token, %.type.Token* %.tmp717, i32 0, i32 1
%.tmp719 = load i8*, i8** %.tmp718
%.tmp720 = getelementptr [2 x i8], [2 x i8]*@.str32, i64 0, i64 0
%.tmp721 = call i32 (i8*, i8*) @strcmp(i8*%.tmp719, i8*%.tmp720)
%.tmp722 = icmp eq i32 %.tmp721, 0
br i1 %.tmp722, label %.if.true.723, label %.if.false.723
.if.true.723:
%.tmp724 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp725 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp724, i32 0, i32 0
%.tmp726 = load %.type.Token*, %.type.Token** %.tmp725
%.tmp727 = getelementptr %.type.Token, %.type.Token* %.tmp726, i32 0, i32 5
%.tmp728 = load %.type.Token*, %.type.Token** %.tmp727
%.tmp729 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp730 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp729, i32 0, i32 0
store %.type.Token* %.tmp728, %.type.Token** %.tmp730
br label %.if.end.723
.if.false.723:

br label %.if.end.723
.if.end.723:

br label %.for.start.654
.for.end.654:
br label %.if.end.645
.if.false.645:

br label %.if.end.645
.if.end.645:
%.tmp731 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp732 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp731, i32 0, i32 0
%.tmp733 = load %.type.Token*, %.type.Token** %.tmp732
%.tmp734 = getelementptr %.type.Token, %.type.Token* %.tmp733, i32 0, i32 1
%.tmp735 = load i8*, i8** %.tmp734
%.tmp736 = getelementptr [2 x i8], [2 x i8]*@.str33, i64 0, i64 0
%.tmp737 = call i32 (i8*, i8*) @strcmp(i8*%.tmp735, i8*%.tmp736)
%.tmp738 = icmp ne i32 %.tmp737, 0
br i1 %.tmp738, label %.if.true.739, label %.if.false.739
.if.true.739:
%.tmp740 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp741 = getelementptr [22 x i8], [22 x i8]*@.str34, i64 0, i64 0
call void (%.type.ParsingContext*, i8*) @.mod92.parser_error(%.type.ParsingContext*%.tmp740, i8*%.tmp741)
br label %.if.end.739
.if.false.739:

br label %.if.end.739
.if.end.739:
%.tmp743 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp744 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp743, i32 0, i32 0
%.tmp745 = load %.type.Token*, %.type.Token** %.tmp744
%.tmp746 = getelementptr %.type.Token, %.type.Token* %.tmp745, i32 0, i32 5
%.tmp747 = load %.type.Token*, %.type.Token** %.tmp746
%.tmp748 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp749 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp748, i32 0, i32 0
store %.type.Token* %.tmp747, %.type.Token** %.tmp749
%.tmp750 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp751 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp750, i32 0, i32 0
%.tmp752 = load %.type.Token*, %.type.Token** %.tmp751
%.tmp753 = getelementptr %.type.Token, %.type.Token* %.tmp752, i32 0, i32 1
%.tmp754 = load i8*, i8** %.tmp753
%.tmp755 = getelementptr [2 x i8], [2 x i8]*@.str35, i64 0, i64 0
%.tmp756 = call i32 (i8*, i8*) @strcmp(i8*%.tmp754, i8*%.tmp755)
%.tmp757 = icmp eq i32 %.tmp756, 0
br i1 %.tmp757, label %.if.true.758, label %.if.false.758
.if.true.758:
%.tmp759 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp760 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp759, i32 0, i32 0
%.tmp761 = load %.type.Token*, %.type.Token** %.tmp760
%.tmp762 = getelementptr %.type.Token, %.type.Token* %.tmp761, i32 0, i32 5
%.tmp763 = load %.type.Token*, %.type.Token** %.tmp762
%.tmp764 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp765 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp764, i32 0, i32 0
store %.type.Token* %.tmp763, %.type.Token** %.tmp765
%.tmp766 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp767 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp766, i32 0, i32 1
store i8 43, i8* %.tmp767
br label %.if.end.758
.if.false.758:
%.tmp768 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp769 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp768, i32 0, i32 0
%.tmp770 = load %.type.Token*, %.type.Token** %.tmp769
%.tmp771 = getelementptr %.type.Token, %.type.Token* %.tmp770, i32 0, i32 1
%.tmp772 = load i8*, i8** %.tmp771
%.tmp773 = getelementptr [2 x i8], [2 x i8]*@.str36, i64 0, i64 0
%.tmp774 = call i32 (i8*, i8*) @strcmp(i8*%.tmp772, i8*%.tmp773)
%.tmp775 = icmp eq i32 %.tmp774, 0
br i1 %.tmp775, label %.if.true.776, label %.if.false.776
.if.true.776:
%.tmp777 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp778 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp777, i32 0, i32 0
%.tmp779 = load %.type.Token*, %.type.Token** %.tmp778
%.tmp780 = getelementptr %.type.Token, %.type.Token* %.tmp779, i32 0, i32 5
%.tmp781 = load %.type.Token*, %.type.Token** %.tmp780
%.tmp782 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp783 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp782, i32 0, i32 0
store %.type.Token* %.tmp781, %.type.Token** %.tmp783
%.tmp784 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp785 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp784, i32 0, i32 1
store i8 42, i8* %.tmp785
br label %.if.end.776
.if.false.776:
%.tmp786 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp787 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp786, i32 0, i32 0
%.tmp788 = load %.type.Token*, %.type.Token** %.tmp787
%.tmp789 = getelementptr %.type.Token, %.type.Token* %.tmp788, i32 0, i32 1
%.tmp790 = load i8*, i8** %.tmp789
%.tmp791 = getelementptr [2 x i8], [2 x i8]*@.str37, i64 0, i64 0
%.tmp792 = call i32 (i8*, i8*) @strcmp(i8*%.tmp790, i8*%.tmp791)
%.tmp793 = icmp eq i32 %.tmp792, 0
br i1 %.tmp793, label %.if.true.794, label %.if.false.794
.if.true.794:
%.tmp795 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp796 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp795, i32 0, i32 0
%.tmp797 = load %.type.Token*, %.type.Token** %.tmp796
%.tmp798 = getelementptr %.type.Token, %.type.Token* %.tmp797, i32 0, i32 5
%.tmp799 = load %.type.Token*, %.type.Token** %.tmp798
%.tmp800 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp801 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp800, i32 0, i32 0
store %.type.Token* %.tmp799, %.type.Token** %.tmp801
%.tmp802 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp803 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp802, i32 0, i32 1
store i8 63, i8* %.tmp803
br label %.if.end.794
.if.false.794:

br label %.if.end.794
.if.end.794:
br label %.if.end.776
.if.end.776:
br label %.if.end.758
.if.end.758:
br label %.if.end.627
.if.false.627:
%.tmp804 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp805 = call %.type.Matcher* (%.type.ParsingContext*) @.mod92.parse_simple_matcher(%.type.ParsingContext*%.tmp804)

store %.type.Matcher* %.tmp805, %.type.Matcher** %m
br label %.if.end.627
.if.end.627:
%.tmp806 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp807 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp806, i32 0, i32 0
%.tmp808 = load %.type.Token*, %.type.Token** %.tmp807
%.tmp809 = getelementptr %.type.Token, %.type.Token* %.tmp808, i32 0, i32 1
%.tmp810 = load i8*, i8** %.tmp809
%.tmp811 = getelementptr [2 x i8], [2 x i8]*@.str38, i64 0, i64 0
%.tmp812 = call i32 (i8*, i8*) @strcmp(i8*%.tmp810, i8*%.tmp811)
%.tmp813 = icmp eq i32 %.tmp812, 0
%.tmp814 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp815 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp814, i32 0, i32 0
%.tmp816 = load %.type.Token*, %.type.Token** %.tmp815
%.tmp817 = getelementptr %.type.Token, %.type.Token* %.tmp816, i32 0, i32 0
%.tmp818 = load i8*, i8** %.tmp817
%.tmp819 = getelementptr [5 x i8], [5 x i8]*@.str39, i64 0, i64 0
%.tmp820 = call i32 (i8*, i8*) @strcmp(i8*%.tmp818, i8*%.tmp819)
%.tmp821 = icmp eq i32 %.tmp820, 0
%.tmp822 = or i1 %.tmp813, %.tmp821
br i1 %.tmp822, label %.if.true.823, label %.if.false.823
.if.true.823:
%.tmp824 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp825 = call %.type.Matcher* (%.type.ParsingContext*) @.mod92.parse_matcher(%.type.ParsingContext*%.tmp824)
%.tmp826 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp827 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp826, i32 0, i32 3
store %.type.Matcher* %.tmp825, %.type.Matcher** %.tmp827
br label %.if.end.823
.if.false.823:

br label %.if.end.823
.if.end.823:
%.tmp828 = load %.type.Matcher*, %.type.Matcher** %m
ret %.type.Matcher* %.tmp828
}
define %.type.Matcher* @.mod92.parse_simple_matcher(%.type.ParsingContext* %.arg.ctx) {
%ctx = alloca %.type.ParsingContext*
store %.type.ParsingContext* %.arg.ctx, %.type.ParsingContext** %ctx
%.tmp829 = call %.type.Matcher* () @.mod92.new_matcher()
%m = alloca %.type.Matcher*
store %.type.Matcher* %.tmp829, %.type.Matcher** %m

%count = alloca i32

%.tmp830 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp831 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp830, i32 0, i32 0
%.tmp832 = load %.type.Token*, %.type.Token** %.tmp831
%ptr = alloca %.type.Token*
store %.type.Token* %.tmp832, %.type.Token** %ptr
store i32 0, i32* %count
br label %.for.start.833
.for.start.833:
%.tmp834 = load %.type.Token*, %.type.Token** %ptr
%.tmp835 = getelementptr %.type.Token, %.type.Token* %.tmp834, i32 0, i32 0
%.tmp836 = load i8*, i8** %.tmp835
%.tmp837 = getelementptr [5 x i8], [5 x i8]*@.str40, i64 0, i64 0
%.tmp838 = call i32 (i8*, i8*) @strcmp(i8*%.tmp836, i8*%.tmp837)
%.tmp839 = icmp eq i32 %.tmp838, 0
%.tmp840 = load %.type.Token*, %.type.Token** %ptr
%.tmp841 = getelementptr %.type.Token, %.type.Token* %.tmp840, i32 0, i32 0
%.tmp842 = load i8*, i8** %.tmp841
%.tmp843 = getelementptr [7 x i8], [7 x i8]*@.str41, i64 0, i64 0
%.tmp844 = call i32 (i8*, i8*) @strcmp(i8*%.tmp842, i8*%.tmp843)
%.tmp845 = icmp eq i32 %.tmp844, 0
%.tmp846 = or i1 %.tmp839, %.tmp845
br i1 %.tmp846, label %.for.continue.833, label %.for.end.833
.for.continue.833:
%.tmp847 = load i32, i32* %count
%.tmp848 = add i32 %.tmp847, 1

store i32 %.tmp848, i32* %count
%.tmp849 = load %.type.Token*, %.type.Token** %ptr
%.tmp850 = getelementptr %.type.Token, %.type.Token* %.tmp849, i32 0, i32 5
%.tmp851 = load %.type.Token*, %.type.Token** %.tmp850

store %.type.Token* %.tmp851, %.type.Token** %ptr

br label %.for.start.833
.for.end.833:
%.tmp852 = load i32, i32* @Query_size
%.tmp853 = icmp sgt i32 %.tmp852, 0
br i1 %.tmp853, label %.if.true.854, label %.if.false.854
.if.true.854:
%.tmp855 = load i32, i32* @Query_size
%.tmp856 = call i8* (i32) @malloc(i32%.tmp855)
%.tmp857 = bitcast i8* %.tmp856 to %.type.Query*
%.tmp858 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp859 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp858, i32 0, i32 0
store %.type.Query* %.tmp857, %.type.Query** %.tmp859
br label %.if.end.854
.if.false.854:
%.tmp860 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp861 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp860, i32 0, i32 0
store %.type.Query* null, %.type.Query** %.tmp861
br label %.if.end.854
.if.end.854:
%.tmp862 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp863 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp862, i32 0, i32 0
%.tmp864 = load %.type.Query*, %.type.Query** %.tmp863
%q = alloca %.type.Query*
store %.type.Query* %.tmp864, %.type.Query** %q

%i = alloca i32
store i32 0, i32* %i
br label %.for.start.865
.for.start.865:
%.tmp866 = load i32, i32* %i
%.tmp867 = load i32, i32* %count
%.tmp868 = icmp slt i32 %.tmp866, %.tmp867
br i1 %.tmp868, label %.for.continue.865, label %.for.end.865
.for.continue.865:
%.tmp869 = load i32, i32* %i
%.tmp870 = icmp sgt i32 %.tmp869, 0
br i1 %.tmp870, label %.if.true.871, label %.if.false.871
.if.true.871:
%.tmp872 = load i32, i32* @Query_size
%.tmp873 = call i8* (i32) @malloc(i32%.tmp872)
%.tmp874 = bitcast i8* %.tmp873 to %.type.Query*
%.tmp875 = load %.type.Query*, %.type.Query** %q
%.tmp876 = getelementptr %.type.Query, %.type.Query* %.tmp875, i32 0, i32 2
store %.type.Query* %.tmp874, %.type.Query** %.tmp876
%.tmp877 = load %.type.Query*, %.type.Query** %q
%.tmp878 = getelementptr %.type.Query, %.type.Query* %.tmp877, i32 0, i32 2
%.tmp879 = load %.type.Query*, %.type.Query** %.tmp878

store %.type.Query* %.tmp879, %.type.Query** %q
br label %.if.end.871
.if.false.871:

br label %.if.end.871
.if.end.871:
%.tmp880 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp881 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp880, i32 0, i32 0
%.tmp882 = load %.type.Token*, %.type.Token** %.tmp881
%.tmp883 = getelementptr %.type.Token, %.type.Token* %.tmp882, i32 0, i32 0
%.tmp884 = load i8*, i8** %.tmp883
%.tmp885 = getelementptr [7 x i8], [7 x i8]*@.str42, i64 0, i64 0
%.tmp886 = call i32 (i8*, i8*) @strcmp(i8*%.tmp884, i8*%.tmp885)
%.tmp887 = icmp eq i32 %.tmp886, 0
br i1 %.tmp887, label %.if.true.888, label %.if.false.888
.if.true.888:
%.tmp889 = load %.type.Query*, %.type.Query** %q
%.tmp890 = getelementptr %.type.Query, %.type.Query* %.tmp889, i32 0, i32 0
store i8 118, i8* %.tmp890
br label %.if.end.888
.if.false.888:
%.tmp891 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp892 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp891, i32 0, i32 0
%.tmp893 = load %.type.Token*, %.type.Token** %.tmp892
%.tmp894 = getelementptr %.type.Token, %.type.Token* %.tmp893, i32 0, i32 1
%.tmp895 = load i8*, i8** %.tmp894
%.tmp896 = call i1 (i8*) @.mod3.is_lower(i8*%.tmp895)
br i1 %.tmp896, label %.if.true.897, label %.if.false.897
.if.true.897:
%.tmp898 = load %.type.Query*, %.type.Query** %q
%.tmp899 = getelementptr %.type.Query, %.type.Query* %.tmp898, i32 0, i32 0
store i8 97, i8* %.tmp899
br label %.if.end.897
.if.false.897:
%.tmp900 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp901 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp900, i32 0, i32 0
%.tmp902 = load %.type.Token*, %.type.Token** %.tmp901
%.tmp903 = getelementptr %.type.Token, %.type.Token* %.tmp902, i32 0, i32 1
%.tmp904 = load i8*, i8** %.tmp903
%.tmp905 = call i1 (i8*) @.mod3.is_upper(i8*%.tmp904)
br i1 %.tmp905, label %.if.true.906, label %.if.false.906
.if.true.906:
%.tmp907 = load %.type.Query*, %.type.Query** %q
%.tmp908 = getelementptr %.type.Query, %.type.Query* %.tmp907, i32 0, i32 0
store i8 116, i8* %.tmp908
br label %.if.end.906
.if.false.906:
%.tmp909 = getelementptr [17 x i8], [17 x i8]*@.str43, i64 0, i64 0
%.tmp910 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp911 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp910, i32 0, i32 0
%.tmp912 = load %.type.Token*, %.type.Token** %.tmp911
%.tmp913 = getelementptr %.type.Token, %.type.Token* %.tmp912, i32 0, i32 1
%.tmp914 = load i8*, i8** %.tmp913
%.tmp915 = call i32 (i8*, ...) @printf(i8*%.tmp909, i8*%.tmp914)
%.tmp916 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp917 = getelementptr [50 x i8], [50 x i8]*@.str44, i64 0, i64 0
call void (%.type.ParsingContext*, i8*) @.mod92.parser_error(%.type.ParsingContext*%.tmp916, i8*%.tmp917)
br label %.if.end.906
.if.end.906:
br label %.if.end.897
.if.end.897:
br label %.if.end.888
.if.end.888:
%.tmp919 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp920 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp919, i32 0, i32 0
%.tmp921 = load %.type.Token*, %.type.Token** %.tmp920
%.tmp922 = getelementptr %.type.Token, %.type.Token* %.tmp921, i32 0, i32 1
%.tmp923 = load i8*, i8** %.tmp922
%.tmp924 = load %.type.Query*, %.type.Query** %q
%.tmp925 = getelementptr %.type.Query, %.type.Query* %.tmp924, i32 0, i32 1
store i8* %.tmp923, i8** %.tmp925
%.tmp926 = load %.type.Query*, %.type.Query** %q
%.tmp927 = getelementptr %.type.Query, %.type.Query* %.tmp926, i32 0, i32 2
store %.type.Query* null, %.type.Query** %.tmp927
%.tmp928 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp929 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp928, i32 0, i32 0
%.tmp930 = load %.type.Token*, %.type.Token** %.tmp929
%.tmp931 = getelementptr %.type.Token, %.type.Token* %.tmp930, i32 0, i32 5
%.tmp932 = load %.type.Token*, %.type.Token** %.tmp931
%.tmp933 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp934 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp933, i32 0, i32 0
store %.type.Token* %.tmp932, %.type.Token** %.tmp934
%.tmp935 = load i32, i32* %i
%.tmp936 = add i32 %.tmp935, 1

store i32 %.tmp936, i32* %i
br label %.for.start.865
.for.end.865:
%.tmp937 = load %.type.Matcher*, %.type.Matcher** %m
ret %.type.Matcher* %.tmp937
}
define %.type.Rule* @.mod92.parse_rule(%.type.ParsingContext* %.arg.ctx) {
%ctx = alloca %.type.ParsingContext*
store %.type.ParsingContext* %.arg.ctx, %.type.ParsingContext** %ctx
%.tmp938 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp939 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp938, i32 0, i32 0
%.tmp940 = load %.type.Token*, %.type.Token** %.tmp939
%.tmp941 = getelementptr %.type.Token, %.type.Token* %.tmp940, i32 0, i32 1
%.tmp942 = load i8*, i8** %.tmp941
%rule_name = alloca i8*
store i8* %.tmp942, i8** %rule_name
%.tmp943 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp944 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp943, i32 0, i32 0
%.tmp945 = load %.type.Token*, %.type.Token** %.tmp944
%.tmp946 = getelementptr %.type.Token, %.type.Token* %.tmp945, i32 0, i32 0
%.tmp947 = load i8*, i8** %.tmp946
%.tmp948 = getelementptr [5 x i8], [5 x i8]*@.str45, i64 0, i64 0
%.tmp949 = call i32 (i8*, i8*) @strcmp(i8*%.tmp947, i8*%.tmp948)
%.tmp950 = icmp ne i32 %.tmp949, 0
br i1 %.tmp950, label %.if.true.951, label %.if.false.951
.if.true.951:
%.tmp952 = getelementptr [37 x i8], [37 x i8]*@.str46, i64 0, i64 0
%.tmp953 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp954 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp953, i32 0, i32 0
%.tmp955 = load %.type.Token*, %.type.Token** %.tmp954
%.tmp956 = getelementptr %.type.Token, %.type.Token* %.tmp955, i32 0, i32 0
%.tmp957 = load i8*, i8** %.tmp956
%.tmp958 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp959 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp958, i32 0, i32 0
%.tmp960 = load %.type.Token*, %.type.Token** %.tmp959
%.tmp961 = getelementptr %.type.Token, %.type.Token* %.tmp960, i32 0, i32 1
%.tmp962 = load i8*, i8** %.tmp961
%.tmp963 = call i32 (i8*, ...) @printf(i8*%.tmp952, i8*%.tmp957, i8*%.tmp962)
%.tmp964 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp965 = getelementptr [31 x i8], [31 x i8]*@.str47, i64 0, i64 0
call void (%.type.ParsingContext*, i8*) @.mod92.parser_error(%.type.ParsingContext*%.tmp964, i8*%.tmp965)
br label %.if.end.951
.if.false.951:

br label %.if.end.951
.if.end.951:
%.tmp967 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp968 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp967, i32 0, i32 0
%.tmp969 = load %.type.Token*, %.type.Token** %.tmp968
%.tmp970 = getelementptr %.type.Token, %.type.Token* %.tmp969, i32 0, i32 5
%.tmp971 = load %.type.Token*, %.type.Token** %.tmp970
%.tmp972 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp973 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp972, i32 0, i32 0
store %.type.Token* %.tmp971, %.type.Token** %.tmp973
%.tmp974 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp975 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp974, i32 0, i32 0
%.tmp976 = load %.type.Token*, %.type.Token** %.tmp975
%.tmp977 = getelementptr %.type.Token, %.type.Token* %.tmp976, i32 0, i32 1
%.tmp978 = load i8*, i8** %.tmp977
%.tmp979 = getelementptr [2 x i8], [2 x i8]*@.str48, i64 0, i64 0
%.tmp980 = call i32 (i8*, i8*) @strcmp(i8*%.tmp978, i8*%.tmp979)
%.tmp981 = icmp ne i32 %.tmp980, 0
br i1 %.tmp981, label %.if.true.982, label %.if.false.982
.if.true.982:
%.tmp983 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp984 = getelementptr [27 x i8], [27 x i8]*@.str49, i64 0, i64 0
call void (%.type.ParsingContext*, i8*) @.mod92.parser_error(%.type.ParsingContext*%.tmp983, i8*%.tmp984)
br label %.if.end.982
.if.false.982:

br label %.if.end.982
.if.end.982:
%.tmp986 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp987 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp986, i32 0, i32 0
%.tmp988 = load %.type.Token*, %.type.Token** %.tmp987
%.tmp989 = getelementptr %.type.Token, %.type.Token* %.tmp988, i32 0, i32 5
%.tmp990 = load %.type.Token*, %.type.Token** %.tmp989
%.tmp991 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp992 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp991, i32 0, i32 0
store %.type.Token* %.tmp990, %.type.Token** %.tmp992
%.tmp993 = load i32, i32* @Rule_size
%.tmp994 = call i8* (i32) @malloc(i32%.tmp993)
%.tmp995 = bitcast i8* %.tmp994 to %.type.Rule*
%rule = alloca %.type.Rule*
store %.type.Rule* %.tmp995, %.type.Rule** %rule
%.tmp996 = load i8*, i8** %rule_name
%.tmp997 = load %.type.Rule*, %.type.Rule** %rule
%.tmp998 = getelementptr %.type.Rule, %.type.Rule* %.tmp997, i32 0, i32 0
store i8* %.tmp996, i8** %.tmp998
%.tmp999 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp1000 = call %.type.Matcher* (%.type.ParsingContext*) @.mod92.parse_matcher(%.type.ParsingContext*%.tmp999)
%.tmp1001 = load %.type.Rule*, %.type.Rule** %rule
%.tmp1002 = getelementptr %.type.Rule, %.type.Rule* %.tmp1001, i32 0, i32 1
store %.type.Matcher* %.tmp1000, %.type.Matcher** %.tmp1002
%.tmp1003 = load %.type.Rule*, %.type.Rule** %rule
ret %.type.Rule* %.tmp1003
}
define void @.mod92.parser_error(%.type.ParsingContext* %.arg.ctx, i8* %.arg.error) {
%ctx = alloca %.type.ParsingContext*
store %.type.ParsingContext* %.arg.ctx, %.type.ParsingContext** %ctx
%error = alloca i8*
store i8* %.arg.error, i8** %error
%.tmp1004 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp1005 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp1004, i32 0, i32 0
%.tmp1006 = load %.type.Token*, %.type.Token** %.tmp1005
%.tmp1007 = load i8*, i8** %error
%.tmp1008 = call %.type.Error* (%.type.Token*, i8*) @.mod497.from(%.type.Token*%.tmp1006, i8*%.tmp1007)
%e = alloca %.type.Error*
store %.type.Error* %.tmp1008, %.type.Error** %e
%.tmp1009 = load %.type.Error*, %.type.Error** %e
call void (%.type.Error*) @.mod497.report(%.type.Error*%.tmp1009)
call void (i32) @exit(i32 1)
ret void
}
define %.type.Rule** @.mod92.parse_grammar(%.type.ParsingContext* %.arg.ctx) {
%ctx = alloca %.type.ParsingContext*
store %.type.ParsingContext* %.arg.ctx, %.type.ParsingContext** %ctx

%max_rules = alloca i32
store i32 40, i32* %max_rules
%.tmp1012 = load i32, i32* @ptr_size
%.tmp1013 = load i32, i32* %max_rules
%.tmp1014 = mul i32 %.tmp1012, %.tmp1013
%.tmp1015 = call i8* (i32) @malloc(i32%.tmp1014)
%.tmp1016 = bitcast i8* %.tmp1015 to %.type.Rule**
%grammar = alloca %.type.Rule**
store %.type.Rule** %.tmp1016, %.type.Rule*** %grammar

%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1017
.for.start.1017:
%.tmp1018 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp1019 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp1018, i32 0, i32 0
%.tmp1020 = load %.type.Token*, %.type.Token** %.tmp1019
%.tmp1021 = getelementptr %.type.Token, %.type.Token* %.tmp1020, i32 0, i32 0
%.tmp1022 = load i8*, i8** %.tmp1021
%.tmp1023 = getelementptr [4 x i8], [4 x i8]*@.str50, i64 0, i64 0
%.tmp1024 = call i32 (i8*, i8*) @strcmp(i8*%.tmp1022, i8*%.tmp1023)
%.tmp1025 = icmp ne i32 %.tmp1024, 0
br i1 %.tmp1025, label %.for.continue.1017, label %.for.end.1017
.for.continue.1017:
%.tmp1026 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp1027 = call %.type.Rule* (%.type.ParsingContext*) @.mod92.parse_rule(%.type.ParsingContext*%.tmp1026)
%.tmp1028 = load i32, i32* %i
%.tmp1029 = load %.type.Rule**, %.type.Rule*** %grammar
%.tmp1030 = getelementptr %.type.Rule*, %.type.Rule** %.tmp1029, i32 %.tmp1028
store %.type.Rule* %.tmp1027, %.type.Rule** %.tmp1030

br label %.for.start.1031
.for.start.1031:
%.tmp1032 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp1033 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp1032, i32 0, i32 0
%.tmp1034 = load %.type.Token*, %.type.Token** %.tmp1033
%.tmp1035 = getelementptr %.type.Token, %.type.Token* %.tmp1034, i32 0, i32 1
%.tmp1036 = load i8*, i8** %.tmp1035
%.tmp1037 = getelementptr [2 x i8], [2 x i8]*@.str51, i64 0, i64 0
%.tmp1038 = call i32 (i8*, i8*) @strcmp(i8*%.tmp1036, i8*%.tmp1037)
%.tmp1039 = icmp eq i32 %.tmp1038, 0
br i1 %.tmp1039, label %.for.continue.1031, label %.for.end.1031
.for.continue.1031:
%.tmp1040 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp1041 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp1040, i32 0, i32 0
%.tmp1042 = load %.type.Token*, %.type.Token** %.tmp1041
%.tmp1043 = getelementptr %.type.Token, %.type.Token* %.tmp1042, i32 0, i32 5
%.tmp1044 = load %.type.Token*, %.type.Token** %.tmp1043
%.tmp1045 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp1046 = getelementptr %.type.ParsingContext, %.type.ParsingContext* %.tmp1045, i32 0, i32 0
store %.type.Token* %.tmp1044, %.type.Token** %.tmp1046

br label %.for.start.1031
.for.end.1031:
%.tmp1047 = load i32, i32* %i
%.tmp1048 = add i32 %.tmp1047, 1

store i32 %.tmp1048, i32* %i
br label %.for.start.1017
.for.end.1017:
%.tmp1049 = load %.type.Rule**, %.type.Rule*** %grammar
%.tmp1050 = bitcast %.type.Rule** %.tmp1049 to %.type.Rule**
ret %.type.Rule** %.tmp1050
}
%.type.Node = type {i8*, i8*, i32, i32, %.type.Node*, %.type.Node*, %.type.Node*}
@Node_size = constant i32 48
define %.type.Node* @.mod92.new_node(%.type.Token* %.arg.t, i8* %.arg.type, i8* %.arg.value) {
%t = alloca %.type.Token*
store %.type.Token* %.arg.t, %.type.Token** %t
%type = alloca i8*
store i8* %.arg.type, i8** %type
%value = alloca i8*
store i8* %.arg.value, i8** %value
%.tmp1051 = load i32, i32* @Node_size
%.tmp1052 = call i8* (i32) @malloc(i32%.tmp1051)
%.tmp1053 = bitcast i8* %.tmp1052 to %.type.Node*
%node = alloca %.type.Node*
store %.type.Node* %.tmp1053, %.type.Node** %node
%.tmp1054 = load i8*, i8** %type
%.tmp1055 = load %.type.Node*, %.type.Node** %node
%.tmp1056 = getelementptr %.type.Node, %.type.Node* %.tmp1055, i32 0, i32 0
store i8* %.tmp1054, i8** %.tmp1056
%.tmp1057 = load i8*, i8** %value
%.tmp1058 = load %.type.Node*, %.type.Node** %node
%.tmp1059 = getelementptr %.type.Node, %.type.Node* %.tmp1058, i32 0, i32 1
store i8* %.tmp1057, i8** %.tmp1059
%.tmp1060 = load %.type.Token*, %.type.Token** %t
%.tmp1061 = getelementptr %.type.Token, %.type.Token* %.tmp1060, i32 0, i32 2
%.tmp1062 = load i32, i32* %.tmp1061
%.tmp1063 = load %.type.Node*, %.type.Node** %node
%.tmp1064 = getelementptr %.type.Node, %.type.Node* %.tmp1063, i32 0, i32 2
store i32 %.tmp1062, i32* %.tmp1064
%.tmp1065 = load %.type.Token*, %.type.Token** %t
%.tmp1066 = getelementptr %.type.Token, %.type.Token* %.tmp1065, i32 0, i32 3
%.tmp1067 = load i32, i32* %.tmp1066
%.tmp1068 = load %.type.Node*, %.type.Node** %node
%.tmp1069 = getelementptr %.type.Node, %.type.Node* %.tmp1068, i32 0, i32 3
store i32 %.tmp1067, i32* %.tmp1069
%.tmp1070 = load %.type.Node*, %.type.Node** %node
%.tmp1071 = getelementptr %.type.Node, %.type.Node* %.tmp1070, i32 0, i32 4
store %.type.Node* null, %.type.Node** %.tmp1071
%.tmp1072 = load %.type.Node*, %.type.Node** %node
%.tmp1073 = getelementptr %.type.Node, %.type.Node* %.tmp1072, i32 0, i32 5
store %.type.Node* null, %.type.Node** %.tmp1073
%.tmp1074 = load %.type.Node*, %.type.Node** %node
ret %.type.Node* %.tmp1074
}
define void @.mod92.child_append(%.type.Node* %.arg.parent, %.type.Node* %.arg.child) {
%parent = alloca %.type.Node*
store %.type.Node* %.arg.parent, %.type.Node** %parent
%child = alloca %.type.Node*
store %.type.Node* %.arg.child, %.type.Node** %child
%.tmp1075 = load %.type.Node*, %.type.Node** %parent
%.tmp1076 = getelementptr %.type.Node, %.type.Node* %.tmp1075, i32 0, i32 5
%.tmp1077 = load %.type.Node*, %.type.Node** %.tmp1076
%.tmp1078 = icmp eq %.type.Node* %.tmp1077, null
br i1 %.tmp1078, label %.if.true.1079, label %.if.false.1079
.if.true.1079:
%.tmp1080 = load %.type.Node*, %.type.Node** %child
%.tmp1081 = load %.type.Node*, %.type.Node** %parent
%.tmp1082 = getelementptr %.type.Node, %.type.Node* %.tmp1081, i32 0, i32 5
store %.type.Node* %.tmp1080, %.type.Node** %.tmp1082
br label %.if.end.1079
.if.false.1079:
%.tmp1083 = load %.type.Node*, %.type.Node** %parent
%.tmp1084 = getelementptr %.type.Node, %.type.Node* %.tmp1083, i32 0, i32 5
%.tmp1085 = load %.type.Node*, %.type.Node** %.tmp1084
%c = alloca %.type.Node*
store %.type.Node* %.tmp1085, %.type.Node** %c

br label %.for.start.1086
.for.start.1086:
%.tmp1087 = load %.type.Node*, %.type.Node** %c
%.tmp1088 = getelementptr %.type.Node, %.type.Node* %.tmp1087, i32 0, i32 6
%.tmp1089 = load %.type.Node*, %.type.Node** %.tmp1088
%.tmp1090 = icmp ne %.type.Node* %.tmp1089, null
br i1 %.tmp1090, label %.for.continue.1086, label %.for.end.1086
.for.continue.1086:

%.tmp1091 = load %.type.Node*, %.type.Node** %c
%.tmp1092 = getelementptr %.type.Node, %.type.Node* %.tmp1091, i32 0, i32 6
%.tmp1093 = load %.type.Node*, %.type.Node** %.tmp1092

store %.type.Node* %.tmp1093, %.type.Node** %c
br label %.for.start.1086
.for.end.1086:
%.tmp1094 = load %.type.Node*, %.type.Node** %child
%.tmp1095 = load %.type.Node*, %.type.Node** %c
%.tmp1096 = getelementptr %.type.Node, %.type.Node* %.tmp1095, i32 0, i32 6
store %.type.Node* %.tmp1094, %.type.Node** %.tmp1096
br label %.if.end.1079
.if.end.1079:
%.tmp1097 = load %.type.Node*, %.type.Node** %child
%.tmp1098 = getelementptr %.type.Node, %.type.Node* %.tmp1097, i32 0, i32 6
store %.type.Node* null, %.type.Node** %.tmp1098
ret void
}
define void @.mod92.child_pop(%.type.Node* %.arg.parent) {
%parent = alloca %.type.Node*
store %.type.Node* %.arg.parent, %.type.Node** %parent
%.tmp1099 = load %.type.Node*, %.type.Node** %parent
%.tmp1100 = getelementptr %.type.Node, %.type.Node* %.tmp1099, i32 0, i32 5
%.tmp1101 = load %.type.Node*, %.type.Node** %.tmp1100
%.tmp1102 = icmp eq %.type.Node* %.tmp1101, null
br i1 %.tmp1102, label %.if.true.1103, label %.if.false.1103
.if.true.1103:
ret void
br label %.if.end.1103
.if.false.1103:

br label %.if.end.1103
.if.end.1103:
%.tmp1104 = load %.type.Node*, %.type.Node** %parent
%.tmp1105 = getelementptr %.type.Node, %.type.Node* %.tmp1104, i32 0, i32 5
%.tmp1106 = load %.type.Node*, %.type.Node** %.tmp1105
%c = alloca %.type.Node*
store %.type.Node* %.tmp1106, %.type.Node** %c
%.tmp1107 = load %.type.Node*, %.type.Node** %c
%.tmp1108 = getelementptr %.type.Node, %.type.Node* %.tmp1107, i32 0, i32 6
%.tmp1109 = load %.type.Node*, %.type.Node** %.tmp1108
%.tmp1110 = icmp eq %.type.Node* %.tmp1109, null
br i1 %.tmp1110, label %.if.true.1111, label %.if.false.1111
.if.true.1111:
%.tmp1112 = load %.type.Node*, %.type.Node** %c
%.tmp1113 = bitcast %.type.Node* %.tmp1112 to i8*
call void (i8*) @free(i8*%.tmp1113)
%.tmp1115 = load %.type.Node*, %.type.Node** %parent
%.tmp1116 = getelementptr %.type.Node, %.type.Node* %.tmp1115, i32 0, i32 5
store %.type.Node* null, %.type.Node** %.tmp1116
ret void
br label %.if.end.1111
.if.false.1111:

br label %.if.end.1111
.if.end.1111:

br label %.for.start.1117
.for.start.1117:
%.tmp1118 = load %.type.Node*, %.type.Node** %c
%.tmp1119 = getelementptr %.type.Node, %.type.Node* %.tmp1118, i32 0, i32 6
%.tmp1120 = load %.type.Node*, %.type.Node** %.tmp1119
%.tmp1121 = getelementptr %.type.Node, %.type.Node* %.tmp1120, i32 0, i32 6
%.tmp1122 = load %.type.Node*, %.type.Node** %.tmp1121
%.tmp1123 = icmp ne %.type.Node* %.tmp1122, null
br i1 %.tmp1123, label %.for.continue.1117, label %.for.end.1117
.for.continue.1117:

%.tmp1124 = load %.type.Node*, %.type.Node** %c
%.tmp1125 = getelementptr %.type.Node, %.type.Node* %.tmp1124, i32 0, i32 6
%.tmp1126 = load %.type.Node*, %.type.Node** %.tmp1125

store %.type.Node* %.tmp1126, %.type.Node** %c
br label %.for.start.1117
.for.end.1117:
%.tmp1127 = load %.type.Node*, %.type.Node** %c
%.tmp1128 = getelementptr %.type.Node, %.type.Node* %.tmp1127, i32 0, i32 6
%.tmp1129 = load %.type.Node*, %.type.Node** %.tmp1128
%.tmp1130 = bitcast %.type.Node* %.tmp1129 to i8*
call void (i8*) @free(i8*%.tmp1130)
%.tmp1132 = load %.type.Node*, %.type.Node** %c
%.tmp1133 = getelementptr %.type.Node, %.type.Node* %.tmp1132, i32 0, i32 6
store %.type.Node* null, %.type.Node** %.tmp1133
ret void
}
%.type.AstContext = type {%.type.Token*, %.type.Rule**}
define %.type.Rule* @.mod92._find_rule(%.type.Rule** %.arg.grammar, i8* %.arg.rule_name) {
%grammar = alloca %.type.Rule**
store %.type.Rule** %.arg.grammar, %.type.Rule*** %grammar
%rule_name = alloca i8*
store i8* %.arg.rule_name, i8** %rule_name

%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1134
.for.start.1134:
%.tmp1135 = add i1 0, 1
br i1 %.tmp1135, label %.for.continue.1134, label %.for.end.1134
.for.continue.1134:
%.tmp1138 = load i32, i32* %i
%.tmp1136 = load %.type.Rule**, %.type.Rule*** %grammar
%.tmp1137 = getelementptr %.type.Rule*, %.type.Rule** %.tmp1136, i32 %.tmp1138
%.tmp1139 = load %.type.Rule*, %.type.Rule** %.tmp1137
%rule = alloca %.type.Rule*
store %.type.Rule* %.tmp1139, %.type.Rule** %rule
%.tmp1140 = load %.type.Rule*, %.type.Rule** %rule
%.tmp1141 = getelementptr %.type.Rule, %.type.Rule* %.tmp1140, i32 0, i32 0
%.tmp1142 = load i8*, i8** %.tmp1141
%.tmp1143 = load i8*, i8** %rule_name
%.tmp1144 = call i32 (i8*, i8*) @strcmp(i8*%.tmp1142, i8*%.tmp1143)
%.tmp1145 = icmp eq i32 %.tmp1144, 0
br i1 %.tmp1145, label %.if.true.1146, label %.if.false.1146
.if.true.1146:
%.tmp1147 = load %.type.Rule*, %.type.Rule** %rule
ret %.type.Rule* %.tmp1147
br label %.if.end.1146
.if.false.1146:

br label %.if.end.1146
.if.end.1146:
%.tmp1148 = load i32, i32* %i
%.tmp1149 = add i32 %.tmp1148, 1

store i32 %.tmp1149, i32* %i
br label %.for.start.1134
.for.end.1134:

%.tmp1150 = bitcast ptr null to %.type.Rule*
ret %.type.Rule* %.tmp1150
}
%.type.ParseResult = type {%.type.Error*, %.type.Node*}
@ParseResult_size = constant i32 16
define %.type.Error* @.mod92.parse_query(%.type.AstContext* %.arg.c, %.type.Matcher* %.arg.m, %.type.Node* %.arg.base) {
%c = alloca %.type.AstContext*
store %.type.AstContext* %.arg.c, %.type.AstContext** %c
%m = alloca %.type.Matcher*
store %.type.Matcher* %.arg.m, %.type.Matcher** %m
%base = alloca %.type.Node*
store %.type.Node* %.arg.base, %.type.Node** %base

%child = alloca %.type.Node*

%.tmp1151 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1152 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1151, i32 0, i32 0
%.tmp1153 = load %.type.Token*, %.type.Token** %.tmp1152
%start_token = alloca %.type.Token*
store %.type.Token* %.tmp1153, %.type.Token** %start_token

%new_children = alloca i32
store i32 0, i32* %new_children

%.tmp1154 = bitcast ptr null to %.type.Error*
%err = alloca %.type.Error*
store %.type.Error* %.tmp1154, %.type.Error** %err
%.tmp1155 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp1156 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp1155, i32 0, i32 0
%.tmp1157 = load %.type.Query*, %.type.Query** %.tmp1156
%q = alloca %.type.Query*
store %.type.Query* %.tmp1157, %.type.Query** %q
br label %.for.start.1158
.for.start.1158:
%.tmp1159 = load %.type.Query*, %.type.Query** %q
%.tmp1160 = icmp ne %.type.Query* %.tmp1159, null
%.tmp1161 = load %.type.Error*, %.type.Error** %err
%.tmp1162 = icmp eq %.type.Error* %.tmp1161, null
%.tmp1163 = and i1 %.tmp1160, %.tmp1162
br i1 %.tmp1163, label %.for.continue.1158, label %.for.end.1158
.for.continue.1158:
%.tmp1164 = load %.type.Query*, %.type.Query** %q
%.tmp1165 = getelementptr %.type.Query, %.type.Query* %.tmp1164, i32 0, i32 0
%.tmp1166 = load i8, i8* %.tmp1165
%.tmp1167 = icmp eq i8 %.tmp1166, 118
br i1 %.tmp1167, label %.if.true.1168, label %.if.false.1168
.if.true.1168:
%.tmp1169 = load %.type.Query*, %.type.Query** %q
%.tmp1170 = getelementptr %.type.Query, %.type.Query* %.tmp1169, i32 0, i32 1
%.tmp1171 = load i8*, i8** %.tmp1170
%.tmp1172 = call i32 (i8*) @strlen(i8*%.tmp1171)
%.tmp1173 = sub i32 %.tmp1172, 2
%qv_len = alloca i32
store i32 %.tmp1173, i32* %qv_len
%.tmp1174 = load i32, i32* %qv_len
%.tmp1175 = add i32 %.tmp1174, 1
%.tmp1176 = call i8* (i32) @malloc(i32%.tmp1175)
%tmp_buff = alloca i8*
store i8* %.tmp1176, i8** %tmp_buff
%.tmp1177 = load %.type.Query*, %.type.Query** %q
%.tmp1178 = getelementptr %.type.Query, %.type.Query* %.tmp1177, i32 0, i32 1
%.tmp1179 = load i8*, i8** %.tmp1178
%.tmp1180 = getelementptr [8 x i8], [8 x i8]*@.str52, i64 0, i64 0
%.tmp1181 = load i8*, i8** %tmp_buff
%.tmp1182 = call i32 (i8*, i8*, ...) @sscanf(i8*%.tmp1179, i8*%.tmp1180, i8*%.tmp1181)
%.tmp1183 = load i8*, i8** %tmp_buff
%.tmp1184 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1185 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1184, i32 0, i32 0
%.tmp1186 = load %.type.Token*, %.type.Token** %.tmp1185
%.tmp1187 = getelementptr %.type.Token, %.type.Token* %.tmp1186, i32 0, i32 1
%.tmp1188 = load i8*, i8** %.tmp1187
%.tmp1189 = load i32, i32* %qv_len
%.tmp1190 = call i32 (i8*, i8*, i32) @strncmp(i8*%.tmp1183, i8*%.tmp1188, i32%.tmp1189)
%.tmp1191 = icmp eq i32 %.tmp1190, 0
%.tmp1192 = load i32, i32* %qv_len
%.tmp1193 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1194 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1193, i32 0, i32 0
%.tmp1195 = load %.type.Token*, %.type.Token** %.tmp1194
%.tmp1196 = getelementptr %.type.Token, %.type.Token* %.tmp1195, i32 0, i32 1
%.tmp1197 = load i8*, i8** %.tmp1196
%.tmp1198 = call i32 (i8*) @strlen(i8*%.tmp1197)
%.tmp1199 = icmp eq i32 %.tmp1192, %.tmp1198
%.tmp1200 = and i1 %.tmp1191, %.tmp1199
br i1 %.tmp1200, label %.if.true.1201, label %.if.false.1201
.if.true.1201:
%.tmp1202 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1203 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1202, i32 0, i32 0
%.tmp1204 = load %.type.Token*, %.type.Token** %.tmp1203
%.tmp1205 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1206 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1205, i32 0, i32 0
%.tmp1207 = load %.type.Token*, %.type.Token** %.tmp1206
%.tmp1208 = getelementptr %.type.Token, %.type.Token* %.tmp1207, i32 0, i32 0
%.tmp1209 = load i8*, i8** %.tmp1208
%.tmp1210 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1211 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1210, i32 0, i32 0
%.tmp1212 = load %.type.Token*, %.type.Token** %.tmp1211
%.tmp1213 = getelementptr %.type.Token, %.type.Token* %.tmp1212, i32 0, i32 1
%.tmp1214 = load i8*, i8** %.tmp1213
%.tmp1215 = call %.type.Node* (%.type.Token*, i8*, i8*) @.mod92.new_node(%.type.Token*%.tmp1204, i8*%.tmp1209, i8*%.tmp1214)

store %.type.Node* %.tmp1215, %.type.Node** %child
%.tmp1216 = load %.type.Node*, %.type.Node** %base
%.tmp1217 = load %.type.Node*, %.type.Node** %child
call void (%.type.Node*, %.type.Node*) @.mod92.child_append(%.type.Node*%.tmp1216, %.type.Node*%.tmp1217)
%.tmp1219 = load i32, i32* %new_children
%.tmp1220 = add i32 %.tmp1219, 1

store i32 %.tmp1220, i32* %new_children
%.tmp1221 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1222 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1221, i32 0, i32 0
%.tmp1223 = load %.type.Token*, %.type.Token** %.tmp1222
%.tmp1224 = getelementptr %.type.Token, %.type.Token* %.tmp1223, i32 0, i32 5
%.tmp1225 = load %.type.Token*, %.type.Token** %.tmp1224
%.tmp1226 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1227 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1226, i32 0, i32 0
store %.type.Token* %.tmp1225, %.type.Token** %.tmp1227
br label %.if.end.1201
.if.false.1201:
%.tmp1228 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1229 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1228, i32 0, i32 0
%.tmp1230 = load %.type.Token*, %.type.Token** %.tmp1229
%.tmp1231 = getelementptr %.type.Token, %.type.Token* %.tmp1230, i32 0, i32 1
%.tmp1232 = load i8*, i8** %.tmp1231
%token_value = alloca i8*
store i8* %.tmp1232, i8** %token_value
%.tmp1233 = load i8*, i8** %token_value
%.tmp1234 = icmp eq i8* %.tmp1233, null
br i1 %.tmp1234, label %.if.true.1235, label %.if.false.1235
.if.true.1235:
%.tmp1236 = getelementptr [7 x i8], [7 x i8]*@.str53, i64 0, i64 0

store i8* %.tmp1236, i8** %token_value
br label %.if.end.1235
.if.false.1235:

br label %.if.end.1235
.if.end.1235:
%.tmp1237 = getelementptr [15 x i8], [15 x i8]*@.str54, i64 0, i64 0
%err_fmt = alloca i8*
store i8* %.tmp1237, i8** %err_fmt
%.tmp1238 = getelementptr [31 x i8], [31 x i8]*@.str55, i64 0, i64 0
%err_msg = alloca i8*
store i8* %.tmp1238, i8** %err_msg
%.tmp1239 = load i8*, i8** %err_msg
%.tmp1240 = call i32 (i8*) @strlen(i8*%.tmp1239)
%.tmp1241 = load i8*, i8** %tmp_buff
%.tmp1242 = call i32 (i8*) @strlen(i8*%.tmp1241)
%.tmp1243 = add i32 %.tmp1240, %.tmp1242
%.tmp1244 = load i8*, i8** %token_value
%.tmp1245 = call i32 (i8*) @strlen(i8*%.tmp1244)
%.tmp1246 = add i32 %.tmp1243, %.tmp1245
%.tmp1247 = load i8*, i8** %err_fmt
%.tmp1248 = call i32 (i8*) @strlen(i8*%.tmp1247)
%.tmp1249 = add i32 %.tmp1246, %.tmp1248
%.tmp1250 = mul i32 3, 2
%.tmp1251 = sub i32 %.tmp1249, %.tmp1250
%.tmp1252 = add i32 %.tmp1251, 1
%err_len = alloca i32
store i32 %.tmp1252, i32* %err_len
%.tmp1253 = load i32, i32* %err_len
%.tmp1254 = call i8* (i32) @malloc(i32%.tmp1253)
%err_buf = alloca i8*
store i8* %.tmp1254, i8** %err_buf
%.tmp1255 = load i8*, i8** %err_buf
%.tmp1256 = load i32, i32* %err_len
%.tmp1257 = load i8*, i8** %err_fmt
%.tmp1258 = load i8*, i8** %err_msg
%.tmp1259 = load i8*, i8** %tmp_buff
%.tmp1260 = load i8*, i8** %token_value
%.tmp1261 = call i32 (i8*, i32, i8*, ...) @snprintf(i8*%.tmp1255, i32%.tmp1256, i8*%.tmp1257, i8*%.tmp1258, i8*%.tmp1259, i8*%.tmp1260)
%.tmp1262 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1263 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1262, i32 0, i32 0
%.tmp1264 = load %.type.Token*, %.type.Token** %.tmp1263
%.tmp1265 = load i8*, i8** %err_buf
%.tmp1266 = call %.type.Error* (%.type.Token*, i8*) @.mod497.from(%.type.Token*%.tmp1264, i8*%.tmp1265)

store %.type.Error* %.tmp1266, %.type.Error** %err
br label %.if.end.1201
.if.end.1201:
%.tmp1267 = load i8*, i8** %tmp_buff
call void (i8*) @free(i8*%.tmp1267)
br label %.if.end.1168
.if.false.1168:
%.tmp1269 = load %.type.Query*, %.type.Query** %q
%.tmp1270 = getelementptr %.type.Query, %.type.Query* %.tmp1269, i32 0, i32 0
%.tmp1271 = load i8, i8* %.tmp1270
%.tmp1272 = icmp eq i8 %.tmp1271, 116
br i1 %.tmp1272, label %.if.true.1273, label %.if.false.1273
.if.true.1273:
%.tmp1274 = load %.type.Query*, %.type.Query** %q
%.tmp1275 = getelementptr %.type.Query, %.type.Query* %.tmp1274, i32 0, i32 1
%.tmp1276 = load i8*, i8** %.tmp1275
%.tmp1277 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1278 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1277, i32 0, i32 0
%.tmp1279 = load %.type.Token*, %.type.Token** %.tmp1278
%.tmp1280 = getelementptr %.type.Token, %.type.Token* %.tmp1279, i32 0, i32 0
%.tmp1281 = load i8*, i8** %.tmp1280
%.tmp1282 = call i32 (i8*, i8*) @strcmp(i8*%.tmp1276, i8*%.tmp1281)
%.tmp1283 = icmp eq i32 %.tmp1282, 0
br i1 %.tmp1283, label %.if.true.1284, label %.if.false.1284
.if.true.1284:
%.tmp1285 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1286 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1285, i32 0, i32 0
%.tmp1287 = load %.type.Token*, %.type.Token** %.tmp1286
%.tmp1288 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1289 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1288, i32 0, i32 0
%.tmp1290 = load %.type.Token*, %.type.Token** %.tmp1289
%.tmp1291 = getelementptr %.type.Token, %.type.Token* %.tmp1290, i32 0, i32 0
%.tmp1292 = load i8*, i8** %.tmp1291
%.tmp1293 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1294 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1293, i32 0, i32 0
%.tmp1295 = load %.type.Token*, %.type.Token** %.tmp1294
%.tmp1296 = getelementptr %.type.Token, %.type.Token* %.tmp1295, i32 0, i32 1
%.tmp1297 = load i8*, i8** %.tmp1296
%.tmp1298 = call %.type.Node* (%.type.Token*, i8*, i8*) @.mod92.new_node(%.type.Token*%.tmp1287, i8*%.tmp1292, i8*%.tmp1297)

store %.type.Node* %.tmp1298, %.type.Node** %child
%.tmp1299 = load %.type.Node*, %.type.Node** %base
%.tmp1300 = load %.type.Node*, %.type.Node** %child
call void (%.type.Node*, %.type.Node*) @.mod92.child_append(%.type.Node*%.tmp1299, %.type.Node*%.tmp1300)
%.tmp1302 = load i32, i32* %new_children
%.tmp1303 = add i32 %.tmp1302, 1

store i32 %.tmp1303, i32* %new_children
%.tmp1304 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1305 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1304, i32 0, i32 0
%.tmp1306 = load %.type.Token*, %.type.Token** %.tmp1305
%.tmp1307 = getelementptr %.type.Token, %.type.Token* %.tmp1306, i32 0, i32 5
%.tmp1308 = load %.type.Token*, %.type.Token** %.tmp1307
%.tmp1309 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1310 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1309, i32 0, i32 0
store %.type.Token* %.tmp1308, %.type.Token** %.tmp1310
br label %.if.end.1284
.if.false.1284:
%.tmp1311 = getelementptr [13 x i8], [13 x i8]*@.str56, i64 0, i64 0
%err_fmt_t = alloca i8*
store i8* %.tmp1311, i8** %err_fmt_t
%.tmp1312 = getelementptr [30 x i8], [30 x i8]*@.str57, i64 0, i64 0
%err_msg_t = alloca i8*
store i8* %.tmp1312, i8** %err_msg_t
%.tmp1313 = load i8*, i8** %err_fmt_t
%.tmp1314 = call i32 (i8*) @strlen(i8*%.tmp1313)
%.tmp1315 = load i8*, i8** %err_msg_t
%.tmp1316 = call i32 (i8*) @strlen(i8*%.tmp1315)
%.tmp1317 = add i32 %.tmp1314, %.tmp1316
%.tmp1318 = load %.type.Query*, %.type.Query** %q
%.tmp1319 = getelementptr %.type.Query, %.type.Query* %.tmp1318, i32 0, i32 1
%.tmp1320 = load i8*, i8** %.tmp1319
%.tmp1321 = call i32 (i8*) @strlen(i8*%.tmp1320)
%.tmp1322 = add i32 %.tmp1317, %.tmp1321
%.tmp1323 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1324 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1323, i32 0, i32 0
%.tmp1325 = load %.type.Token*, %.type.Token** %.tmp1324
%.tmp1326 = getelementptr %.type.Token, %.type.Token* %.tmp1325, i32 0, i32 0
%.tmp1327 = load i8*, i8** %.tmp1326
%.tmp1328 = call i32 (i8*) @strlen(i8*%.tmp1327)
%.tmp1329 = add i32 %.tmp1322, %.tmp1328
%err_len_t = alloca i32
store i32 %.tmp1329, i32* %err_len_t
%.tmp1330 = load i32, i32* %err_len_t
%.tmp1331 = call i8* (i32) @malloc(i32%.tmp1330)
%err_buf_t = alloca i8*
store i8* %.tmp1331, i8** %err_buf_t
%.tmp1332 = load i8*, i8** %err_buf_t
%.tmp1333 = load i32, i32* %err_len_t
%.tmp1334 = load i8*, i8** %err_fmt_t
%.tmp1335 = load i8*, i8** %err_msg_t
%.tmp1336 = load %.type.Query*, %.type.Query** %q
%.tmp1337 = getelementptr %.type.Query, %.type.Query* %.tmp1336, i32 0, i32 1
%.tmp1338 = load i8*, i8** %.tmp1337
%.tmp1339 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1340 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1339, i32 0, i32 0
%.tmp1341 = load %.type.Token*, %.type.Token** %.tmp1340
%.tmp1342 = getelementptr %.type.Token, %.type.Token* %.tmp1341, i32 0, i32 0
%.tmp1343 = load i8*, i8** %.tmp1342
%.tmp1344 = call i32 (i8*, i32, i8*, ...) @snprintf(i8*%.tmp1332, i32%.tmp1333, i8*%.tmp1334, i8*%.tmp1335, i8*%.tmp1338, i8*%.tmp1343)
%.tmp1345 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1346 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1345, i32 0, i32 0
%.tmp1347 = load %.type.Token*, %.type.Token** %.tmp1346
%.tmp1348 = load i8*, i8** %err_buf_t
%.tmp1349 = call %.type.Error* (%.type.Token*, i8*) @.mod497.from(%.type.Token*%.tmp1347, i8*%.tmp1348)

store %.type.Error* %.tmp1349, %.type.Error** %err
br label %.if.end.1284
.if.end.1284:
br label %.if.end.1273
.if.false.1273:
%.tmp1350 = load %.type.Query*, %.type.Query** %q
%.tmp1351 = getelementptr %.type.Query, %.type.Query* %.tmp1350, i32 0, i32 0
%.tmp1352 = load i8, i8* %.tmp1351
%.tmp1353 = icmp eq i8 %.tmp1352, 97
br i1 %.tmp1353, label %.if.true.1354, label %.if.false.1354
.if.true.1354:
%.tmp1355 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1356 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1355, i32 0, i32 1
%.tmp1357 = load %.type.Rule**, %.type.Rule*** %.tmp1356
%.tmp1358 = load %.type.Query*, %.type.Query** %q
%.tmp1359 = getelementptr %.type.Query, %.type.Query* %.tmp1358, i32 0, i32 1
%.tmp1360 = load i8*, i8** %.tmp1359
%.tmp1361 = call %.type.Rule* (%.type.Rule**, i8*) @.mod92._find_rule(%.type.Rule**%.tmp1357, i8*%.tmp1360)
%alias_rule = alloca %.type.Rule*
store %.type.Rule* %.tmp1361, %.type.Rule** %alias_rule
%.tmp1362 = load %.type.Rule*, %.type.Rule** %alias_rule
%.tmp1363 = icmp eq %.type.Rule* %.tmp1362, null
br i1 %.tmp1363, label %.if.true.1364, label %.if.false.1364
.if.true.1364:
%.tmp1365 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1366 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1365, i32 0, i32 0
%.tmp1367 = load %.type.Token*, %.type.Token** %.tmp1366
%.tmp1368 = getelementptr [30 x i8], [30 x i8]*@.str58, i64 0, i64 0
%.tmp1369 = call %.type.Error* (%.type.Token*, i8*) @.mod497.from(%.type.Token*%.tmp1367, i8*%.tmp1368)

store %.type.Error* %.tmp1369, %.type.Error** %err
br label %.if.end.1364
.if.false.1364:
%.tmp1370 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1371 = load %.type.Rule*, %.type.Rule** %alias_rule
%.tmp1372 = call %.type.ParseResult* (%.type.AstContext*, %.type.Rule*) @.mod92.parse_to_ast(%.type.AstContext*%.tmp1370, %.type.Rule*%.tmp1371)
%parse_result = alloca %.type.ParseResult*
store %.type.ParseResult* %.tmp1372, %.type.ParseResult** %parse_result
%.tmp1373 = load %.type.ParseResult*, %.type.ParseResult** %parse_result
%.tmp1374 = getelementptr %.type.ParseResult, %.type.ParseResult* %.tmp1373, i32 0, i32 0
%.tmp1375 = load %.type.Error*, %.type.Error** %.tmp1374
%.tmp1376 = icmp ne %.type.Error* %.tmp1375, null
br i1 %.tmp1376, label %.if.true.1377, label %.if.false.1377
.if.true.1377:
%.tmp1378 = load %.type.ParseResult*, %.type.ParseResult** %parse_result
%.tmp1379 = getelementptr %.type.ParseResult, %.type.ParseResult* %.tmp1378, i32 0, i32 0
%.tmp1380 = load %.type.Error*, %.type.Error** %.tmp1379

store %.type.Error* %.tmp1380, %.type.Error** %err
br label %.if.end.1377
.if.false.1377:
%.tmp1381 = load %.type.Node*, %.type.Node** %base
%.tmp1382 = load %.type.ParseResult*, %.type.ParseResult** %parse_result
%.tmp1383 = getelementptr %.type.ParseResult, %.type.ParseResult* %.tmp1382, i32 0, i32 1
%.tmp1384 = load %.type.Node*, %.type.Node** %.tmp1383
call void (%.type.Node*, %.type.Node*) @.mod92.child_append(%.type.Node*%.tmp1381, %.type.Node*%.tmp1384)
%.tmp1386 = load i32, i32* %new_children
%.tmp1387 = add i32 %.tmp1386, 1

store i32 %.tmp1387, i32* %new_children
br label %.if.end.1377
.if.end.1377:
%.tmp1388 = load %.type.ParseResult*, %.type.ParseResult** %parse_result
%.tmp1389 = bitcast %.type.ParseResult* %.tmp1388 to i8*
call void (i8*) @free(i8*%.tmp1389)
br label %.if.end.1364
.if.end.1364:
br label %.if.end.1354
.if.false.1354:
%.tmp1391 = add i1 0, 0
%.tmp1392 = getelementptr [41 x i8], [41 x i8]*@.str59, i64 0, i64 0
call void (i1, i8*) @.mod1.assert(i1%.tmp1391, i8*%.tmp1392)
br label %.if.end.1354
.if.end.1354:
br label %.if.end.1273
.if.end.1273:
br label %.if.end.1168
.if.end.1168:
%.tmp1394 = load %.type.Query*, %.type.Query** %q
%.tmp1395 = getelementptr %.type.Query, %.type.Query* %.tmp1394, i32 0, i32 2
%.tmp1396 = load %.type.Query*, %.type.Query** %.tmp1395

store %.type.Query* %.tmp1396, %.type.Query** %q
br label %.for.start.1158
.for.end.1158:
%.tmp1397 = load %.type.Error*, %.type.Error** %err
%.tmp1398 = icmp ne %.type.Error* %.tmp1397, null
br i1 %.tmp1398, label %.if.true.1399, label %.if.false.1399
.if.true.1399:
%.tmp1400 = load %.type.Token*, %.type.Token** %start_token
%.tmp1401 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1402 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1401, i32 0, i32 0
store %.type.Token* %.tmp1400, %.type.Token** %.tmp1402

%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1403
.for.start.1403:
%.tmp1404 = load i32, i32* %i
%.tmp1405 = load i32, i32* %new_children
%.tmp1406 = icmp slt i32 %.tmp1404, %.tmp1405
br i1 %.tmp1406, label %.for.continue.1403, label %.for.end.1403
.for.continue.1403:
%.tmp1407 = load %.type.Node*, %.type.Node** %base
call void (%.type.Node*) @.mod92.child_pop(%.type.Node*%.tmp1407)
%.tmp1409 = load i32, i32* %i
%.tmp1410 = add i32 %.tmp1409, 1

store i32 %.tmp1410, i32* %i
br label %.for.start.1403
.for.end.1403:
br label %.if.end.1399
.if.false.1399:

br label %.if.end.1399
.if.end.1399:
%.tmp1411 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp1412 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp1411, i32 0, i32 2
%.tmp1413 = load %.type.Matcher*, %.type.Matcher** %.tmp1412
%.tmp1414 = icmp ne %.type.Matcher* %.tmp1413, null
%.tmp1415 = load %.type.Error*, %.type.Error** %err
%.tmp1416 = icmp ne %.type.Error* %.tmp1415, null
%.tmp1417 = and i1 %.tmp1414, %.tmp1416
br i1 %.tmp1417, label %.if.true.1418, label %.if.false.1418
.if.true.1418:
%.tmp1419 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1420 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp1421 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp1420, i32 0, i32 2
%.tmp1422 = load %.type.Matcher*, %.type.Matcher** %.tmp1421
%.tmp1423 = load %.type.Node*, %.type.Node** %base
%.tmp1424 = call %.type.Error* (%.type.AstContext*, %.type.Matcher*, %.type.Node*) @.mod92.parse_query(%.type.AstContext*%.tmp1419, %.type.Matcher*%.tmp1422, %.type.Node*%.tmp1423)
%new_err = alloca %.type.Error*
store %.type.Error* %.tmp1424, %.type.Error** %new_err
%.tmp1425 = load %.type.Error*, %.type.Error** %new_err
%.tmp1426 = icmp eq %.type.Error* %.tmp1425, null
br i1 %.tmp1426, label %.if.true.1427, label %.if.false.1427
.if.true.1427:
store %.type.Error* null, %.type.Error** %err
br label %.if.end.1427
.if.false.1427:
%.tmp1428 = load %.type.Error*, %.type.Error** %new_err
%.tmp1429 = bitcast %.type.Error* %.tmp1428 to i8*
call void (i8*) @free(i8*%.tmp1429)
br label %.if.end.1427
.if.end.1427:
br label %.if.end.1418
.if.false.1418:

br label %.if.end.1418
.if.end.1418:
%.tmp1431 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp1432 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp1431, i32 0, i32 1
%.tmp1433 = load i8, i8* %.tmp1432
%.tmp1434 = icmp eq i8 %.tmp1433, 49
br i1 %.tmp1434, label %.if.true.1435, label %.if.false.1435
.if.true.1435:

br label %.if.end.1435
.if.false.1435:
%.tmp1436 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp1437 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp1436, i32 0, i32 1
%.tmp1438 = load i8, i8* %.tmp1437
%.tmp1439 = icmp eq i8 %.tmp1438, 43
%.tmp1440 = load %.type.Error*, %.type.Error** %err
%.tmp1441 = icmp eq %.type.Error* %.tmp1440, null
%.tmp1442 = and i1 %.tmp1439, %.tmp1441
br i1 %.tmp1442, label %.if.true.1443, label %.if.false.1443
.if.true.1443:
%.tmp1444 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1445 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp1446 = load %.type.Node*, %.type.Node** %base
%.tmp1447 = call %.type.Error* (%.type.AstContext*, %.type.Matcher*, %.type.Node*) @.mod92.parse_query(%.type.AstContext*%.tmp1444, %.type.Matcher*%.tmp1445, %.type.Node*%.tmp1446)

store %.type.Error* %.tmp1447, %.type.Error** %err
%.tmp1448 = load %.type.Error*, %.type.Error** %err
%.tmp1449 = icmp ne %.type.Error* %.tmp1448, null
br i1 %.tmp1449, label %.if.true.1450, label %.if.false.1450
.if.true.1450:
%.tmp1451 = load %.type.Error*, %.type.Error** %err
%.tmp1452 = bitcast %.type.Error* %.tmp1451 to i8*
call void (i8*) @free(i8*%.tmp1452)
store %.type.Error* null, %.type.Error** %err
br label %.if.end.1450
.if.false.1450:

%.tmp1454 = bitcast ptr null to %.type.Error*
ret %.type.Error* %.tmp1454
br label %.if.end.1450
.if.end.1450:
br label %.if.end.1443
.if.false.1443:
%.tmp1455 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp1456 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp1455, i32 0, i32 1
%.tmp1457 = load i8, i8* %.tmp1456
%.tmp1458 = icmp eq i8 %.tmp1457, 63
%.tmp1459 = load %.type.Error*, %.type.Error** %err
%.tmp1460 = icmp ne %.type.Error* %.tmp1459, null
%.tmp1461 = and i1 %.tmp1458, %.tmp1460
br i1 %.tmp1461, label %.if.true.1462, label %.if.false.1462
.if.true.1462:
%.tmp1463 = load %.type.Error*, %.type.Error** %err
%.tmp1464 = bitcast %.type.Error* %.tmp1463 to i8*
call void (i8*) @free(i8*%.tmp1464)
store %.type.Error* null, %.type.Error** %err
br label %.if.end.1462
.if.false.1462:
%.tmp1466 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp1467 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp1466, i32 0, i32 1
%.tmp1468 = load i8, i8* %.tmp1467
%.tmp1469 = icmp eq i8 %.tmp1468, 42
br i1 %.tmp1469, label %.if.true.1470, label %.if.false.1470
.if.true.1470:
%.tmp1471 = load %.type.Error*, %.type.Error** %err
%.tmp1472 = icmp ne %.type.Error* %.tmp1471, null
br i1 %.tmp1472, label %.if.true.1473, label %.if.false.1473
.if.true.1473:
%.tmp1474 = load %.type.Error*, %.type.Error** %err
%.tmp1475 = bitcast %.type.Error* %.tmp1474 to i8*
call void (i8*) @free(i8*%.tmp1475)
store %.type.Error* null, %.type.Error** %err
br label %.if.end.1473
.if.false.1473:
%.tmp1477 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1478 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp1479 = load %.type.Node*, %.type.Node** %base
%.tmp1480 = call %.type.Error* (%.type.AstContext*, %.type.Matcher*, %.type.Node*) @.mod92.parse_query(%.type.AstContext*%.tmp1477, %.type.Matcher*%.tmp1478, %.type.Node*%.tmp1479)
ret %.type.Error* %.tmp1480
br label %.if.end.1473
.if.end.1473:
br label %.if.end.1470
.if.false.1470:

br label %.if.end.1470
.if.end.1470:
br label %.if.end.1462
.if.end.1462:
br label %.if.end.1443
.if.end.1443:
br label %.if.end.1435
.if.end.1435:
%.tmp1481 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp1482 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp1481, i32 0, i32 3
%.tmp1483 = load %.type.Matcher*, %.type.Matcher** %.tmp1482
%.tmp1484 = icmp ne %.type.Matcher* %.tmp1483, null
%.tmp1485 = load %.type.Error*, %.type.Error** %err
%.tmp1486 = icmp eq %.type.Error* %.tmp1485, null
%.tmp1487 = and i1 %.tmp1484, %.tmp1486
br i1 %.tmp1487, label %.if.true.1488, label %.if.false.1488
.if.true.1488:
%.tmp1489 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1490 = load %.type.Matcher*, %.type.Matcher** %m
%.tmp1491 = getelementptr %.type.Matcher, %.type.Matcher* %.tmp1490, i32 0, i32 3
%.tmp1492 = load %.type.Matcher*, %.type.Matcher** %.tmp1491
%.tmp1493 = load %.type.Node*, %.type.Node** %base
%.tmp1494 = call %.type.Error* (%.type.AstContext*, %.type.Matcher*, %.type.Node*) @.mod92.parse_query(%.type.AstContext*%.tmp1489, %.type.Matcher*%.tmp1492, %.type.Node*%.tmp1493)

store %.type.Error* %.tmp1494, %.type.Error** %err
br label %.if.end.1488
.if.false.1488:

br label %.if.end.1488
.if.end.1488:
%.tmp1495 = load %.type.Error*, %.type.Error** %err
%.tmp1496 = bitcast %.type.Error* %.tmp1495 to %.type.Error*
ret %.type.Error* %.tmp1496
}
define %.type.ParseResult* @.mod92.parse_to_ast(%.type.AstContext* %.arg.c, %.type.Rule* %.arg.rule) {
%c = alloca %.type.AstContext*
store %.type.AstContext* %.arg.c, %.type.AstContext** %c
%rule = alloca %.type.Rule*
store %.type.Rule* %.arg.rule, %.type.Rule** %rule
%.tmp1497 = load i32, i32* @ParseResult_size
%.tmp1498 = call i8* (i32) @malloc(i32%.tmp1497)
%.tmp1499 = bitcast i8* %.tmp1498 to %.type.ParseResult*
%res = alloca %.type.ParseResult*
store %.type.ParseResult* %.tmp1499, %.type.ParseResult** %res
%.tmp1500 = load %.type.ParseResult*, %.type.ParseResult** %res
%.tmp1501 = getelementptr %.type.ParseResult, %.type.ParseResult* %.tmp1500, i32 0, i32 0
store %.type.Error* null, %.type.Error** %.tmp1501
%.tmp1502 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1503 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1502, i32 0, i32 0
%.tmp1504 = load %.type.Token*, %.type.Token** %.tmp1503
%.tmp1505 = load %.type.Rule*, %.type.Rule** %rule
%.tmp1506 = getelementptr %.type.Rule, %.type.Rule* %.tmp1505, i32 0, i32 0
%.tmp1507 = load i8*, i8** %.tmp1506

%.tmp1508 = bitcast ptr null to i8*
%.tmp1509 = call %.type.Node* (%.type.Token*, i8*, i8*) @.mod92.new_node(%.type.Token*%.tmp1504, i8*%.tmp1507, i8*%.tmp1508)
%.tmp1510 = load %.type.ParseResult*, %.type.ParseResult** %res
%.tmp1511 = getelementptr %.type.ParseResult, %.type.ParseResult* %.tmp1510, i32 0, i32 1
store %.type.Node* %.tmp1509, %.type.Node** %.tmp1511
%.tmp1512 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1513 = getelementptr %.type.AstContext, %.type.AstContext* %.tmp1512, i32 0, i32 0
%.tmp1514 = load %.type.Token*, %.type.Token** %.tmp1513
%start_match = alloca %.type.Token*
store %.type.Token* %.tmp1514, %.type.Token** %start_match
%.tmp1515 = load %.type.AstContext*, %.type.AstContext** %c
%.tmp1516 = load %.type.Rule*, %.type.Rule** %rule
%.tmp1517 = getelementptr %.type.Rule, %.type.Rule* %.tmp1516, i32 0, i32 1
%.tmp1518 = load %.type.Matcher*, %.type.Matcher** %.tmp1517
%.tmp1519 = load %.type.ParseResult*, %.type.ParseResult** %res
%.tmp1520 = getelementptr %.type.ParseResult, %.type.ParseResult* %.tmp1519, i32 0, i32 1
%.tmp1521 = load %.type.Node*, %.type.Node** %.tmp1520
%.tmp1522 = call %.type.Error* (%.type.AstContext*, %.type.Matcher*, %.type.Node*) @.mod92.parse_query(%.type.AstContext*%.tmp1515, %.type.Matcher*%.tmp1518, %.type.Node*%.tmp1521)
%.tmp1523 = load %.type.ParseResult*, %.type.ParseResult** %res
%.tmp1524 = getelementptr %.type.ParseResult, %.type.ParseResult* %.tmp1523, i32 0, i32 0
store %.type.Error* %.tmp1522, %.type.Error** %.tmp1524
%.tmp1525 = load %.type.ParseResult*, %.type.ParseResult** %res
ret %.type.ParseResult* %.tmp1525
}
define %.type.ParseResult* @.mod92.ast(%.type.Rule** %.arg.grammar, i8* %.arg.start, %.type.Token* %.arg.tokens) {
%grammar = alloca %.type.Rule**
store %.type.Rule** %.arg.grammar, %.type.Rule*** %grammar
%start = alloca i8*
store i8* %.arg.start, i8** %start
%tokens = alloca %.type.Token*
store %.type.Token* %.arg.tokens, %.type.Token** %tokens
%.tmp1526 = load %.type.Rule**, %.type.Rule*** %grammar
%.tmp1527 = load i8*, i8** %start
%.tmp1528 = call %.type.Rule* (%.type.Rule**, i8*) @.mod92._find_rule(%.type.Rule**%.tmp1526, i8*%.tmp1527)
%start_matcher = alloca %.type.Rule*
store %.type.Rule* %.tmp1528, %.type.Rule** %start_matcher
%.tmp1529 = load %.type.Rule*, %.type.Rule** %start_matcher
%.tmp1530 = icmp ne %.type.Rule* %.tmp1529, null
%.tmp1531 = getelementptr [44 x i8], [44 x i8]*@.str60, i64 0, i64 0
call void (i1, i8*) @.mod1.assert(i1%.tmp1530, i8*%.tmp1531)

%c = alloca %.type.AstContext

%.tmp1533 = load %.type.Token*, %.type.Token** %tokens
%.tmp1534 = getelementptr %.type.AstContext, %.type.AstContext* %c, i32 0, i32 0
store %.type.Token* %.tmp1533, %.type.Token** %.tmp1534
%.tmp1535 = load %.type.Rule**, %.type.Rule*** %grammar
%.tmp1536 = getelementptr %.type.AstContext, %.type.AstContext* %c, i32 0, i32 1
store %.type.Rule** %.tmp1535, %.type.Rule*** %.tmp1536
%.tmp1537 = getelementptr %.type.AstContext, %.type.AstContext* %c, i32 0
%.tmp1538 = load %.type.Rule*, %.type.Rule** %start_matcher
%.tmp1539 = call %.type.ParseResult* (%.type.AstContext*, %.type.Rule*) @.mod92.parse_to_ast(%.type.AstContext*%.tmp1537, %.type.Rule*%.tmp1538)
%res = alloca %.type.ParseResult*
store %.type.ParseResult* %.tmp1539, %.type.ParseResult** %res
%.tmp1540 = getelementptr %.type.AstContext, %.type.AstContext* %c, i32 0, i32 0
%.tmp1541 = load %.type.Token*, %.type.Token** %.tmp1540
%.tmp1542 = getelementptr %.type.Token, %.type.Token* %.tmp1541, i32 0, i32 0
%.tmp1543 = load i8*, i8** %.tmp1542
%.tmp1544 = getelementptr [4 x i8], [4 x i8]*@.str61, i64 0, i64 0
%.tmp1545 = call i32 (i8*, i8*) @strcmp(i8*%.tmp1543, i8*%.tmp1544)
%.tmp1546 = icmp ne i32 %.tmp1545, 0
%.tmp1547 = load %.type.ParseResult*, %.type.ParseResult** %res
%.tmp1548 = getelementptr %.type.ParseResult, %.type.ParseResult* %.tmp1547, i32 0, i32 0
%.tmp1549 = load %.type.Error*, %.type.Error** %.tmp1548
%.tmp1550 = icmp eq %.type.Error* %.tmp1549, null
%.tmp1551 = and i1 %.tmp1546, %.tmp1550
br i1 %.tmp1551, label %.if.true.1552, label %.if.false.1552
.if.true.1552:
%.tmp1553 = getelementptr %.type.AstContext, %.type.AstContext* %c, i32 0, i32 0
%.tmp1554 = load %.type.Token*, %.type.Token** %.tmp1553
%.tmp1555 = getelementptr [26 x i8], [26 x i8]*@.str62, i64 0, i64 0
%.tmp1556 = call %.type.Error* (%.type.Token*, i8*) @.mod497.from(%.type.Token*%.tmp1554, i8*%.tmp1555)
%.tmp1557 = load %.type.ParseResult*, %.type.ParseResult** %res
%.tmp1558 = getelementptr %.type.ParseResult, %.type.ParseResult* %.tmp1557, i32 0, i32 0
store %.type.Error* %.tmp1556, %.type.Error** %.tmp1558
br label %.if.end.1552
.if.false.1552:

br label %.if.end.1552
.if.end.1552:
%.tmp1559 = load %.type.ParseResult*, %.type.ParseResult** %res
ret %.type.ParseResult* %.tmp1559
}
@.str63 = constant [2 x i8] c"\0A\00"
@.str64 = constant [3 x i8] c"  \00"
@.str65 = constant [7 x i8] c"(null)\00"
@.str66 = constant [2 x i8] c"{\00"
@.str67 = constant [13 x i8] c"\22type\22: \22%s\22\00"
@.str68 = constant [12 x i8] c"\22value\22: %s\00"
@.str69 = constant [11 x i8] c"\22line\22: %d\00"
@.str70 = constant [19 x i8] c"\22char_of_line\22: %d\00"
@.str71 = constant [9 x i8] c"\22next\22: \00"
@.str72 = constant [13 x i8] c"\22children\22: \00"
@.str73 = constant [2 x i8] c"}\00"



define i8* @.mod1560.node_to_string(%.type.Node* %.arg.n) {
%n = alloca %.type.Node*
store %.type.Node* %.arg.n, %.type.Node** %n
%.tmp1561 = call %.type.File* () @tmpfile()
%tmp = alloca %.type.File*
store %.type.File* %.tmp1561, %.type.File** %tmp
%.tmp1562 = load %.type.Node*, %.type.Node** %n
%.tmp1563 = load %.type.File*, %.type.File** %tmp
call void (%.type.Node*, %.type.File*, i32) @.mod1560._node_to_string(%.type.Node*%.tmp1562, %.type.File*%.tmp1563, i32 1)
%.tmp1565 = load %.type.File*, %.type.File** %tmp
%.tmp1566 = call i32 (%.type.File*) @ftell(%.type.File*%.tmp1565)
%str_len = alloca i32
store i32 %.tmp1566, i32* %str_len
%.tmp1567 = load %.type.File*, %.type.File** %tmp
%.tmp1568 = call i32 (%.type.File*) @fileno(%.type.File*%.tmp1567)
%tmp_fd = alloca i32
store i32 %.tmp1568, i32* %tmp_fd
%.tmp1569 = load i32, i32* %tmp_fd
%.tmp1570 = load i32, i32* @SEEK_SET
%.tmp1571 = call i32 (i32, i32, i32) @lseek(i32%.tmp1569, i32 0, i32%.tmp1570)
%.tmp1572 = load i32, i32* %str_len
%.tmp1573 = call i8* (i32) @malloc(i32%.tmp1572)
%buf = alloca i8*
store i8* %.tmp1573, i8** %buf
%.tmp1574 = load i32, i32* %tmp_fd
%.tmp1575 = load i8*, i8** %buf
%.tmp1576 = load i32, i32* %str_len
%.tmp1577 = call i32 (i32, i8*, i32) @read(i32%.tmp1574, i8*%.tmp1575, i32%.tmp1576)
%read = alloca i32
store i32 %.tmp1577, i32* %read
%.tmp1578 = load i32, i32* %read
%.tmp1579 = load i32, i32* %str_len
%.tmp1580 = icmp ne i32 %.tmp1578, %.tmp1579
br i1 %.tmp1580, label %.if.true.1581, label %.if.false.1581
.if.true.1581:
%.tmp1582 = load i8*, i8** %buf
call void (i8*) @free(i8*%.tmp1582)
store i8* null, i8** %buf
br label %.if.end.1581
.if.false.1581:

br label %.if.end.1581
.if.end.1581:
%.tmp1584 = load i8*, i8** %buf
ret i8* %.tmp1584
}
define void @.mod1560._print_indent(%.type.File* %.arg.stdout, i32 %.arg.indent) {
%stdout = alloca %.type.File*
store %.type.File* %.arg.stdout, %.type.File** %stdout
%indent = alloca i32
store i32 %.arg.indent, i32* %indent
%.tmp1585 = load %.type.File*, %.type.File** %stdout
%.tmp1586 = getelementptr [2 x i8], [2 x i8]*@.str63, i64 0, i64 0
%.tmp1587 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1585, i8*%.tmp1586)

%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1588
.for.start.1588:
%.tmp1589 = load i32, i32* %i
%.tmp1590 = load i32, i32* %indent
%.tmp1591 = icmp slt i32 %.tmp1589, %.tmp1590
br i1 %.tmp1591, label %.for.continue.1588, label %.for.end.1588
.for.continue.1588:
%.tmp1592 = load %.type.File*, %.type.File** %stdout
%.tmp1593 = getelementptr [3 x i8], [3 x i8]*@.str64, i64 0, i64 0
%.tmp1594 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1592, i8*%.tmp1593)
%.tmp1595 = load i32, i32* %i
%.tmp1596 = add i32 %.tmp1595, 1

store i32 %.tmp1596, i32* %i
br label %.for.start.1588
.for.end.1588:
ret void
}
define void @.mod1560._node_to_string(%.type.Node* %.arg.node, %.type.File* %.arg.stdout, i32 %.arg.indent) {
%node = alloca %.type.Node*
store %.type.Node* %.arg.node, %.type.Node** %node
%stdout = alloca %.type.File*
store %.type.File* %.arg.stdout, %.type.File** %stdout
%indent = alloca i32
store i32 %.arg.indent, i32* %indent
%.tmp1597 = load %.type.Node*, %.type.Node** %node
%.tmp1598 = icmp eq %.type.Node* %.tmp1597, null
br i1 %.tmp1598, label %.if.true.1599, label %.if.false.1599
.if.true.1599:
%.tmp1600 = load %.type.File*, %.type.File** %stdout
%.tmp1601 = getelementptr [7 x i8], [7 x i8]*@.str65, i64 0, i64 0
%.tmp1602 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1600, i8*%.tmp1601)
ret void
br label %.if.end.1599
.if.false.1599:

br label %.if.end.1599
.if.end.1599:
%.tmp1603 = load %.type.File*, %.type.File** %stdout
%.tmp1604 = getelementptr [2 x i8], [2 x i8]*@.str66, i64 0, i64 0
%.tmp1605 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1603, i8*%.tmp1604)
%.tmp1606 = load %.type.File*, %.type.File** %stdout
%.tmp1607 = load i32, i32* %indent
call void (%.type.File*, i32) @.mod1560._print_indent(%.type.File*%.tmp1606, i32%.tmp1607)
%.tmp1609 = load %.type.File*, %.type.File** %stdout
%.tmp1610 = getelementptr [13 x i8], [13 x i8]*@.str67, i64 0, i64 0
%.tmp1611 = load %.type.Node*, %.type.Node** %node
%.tmp1612 = getelementptr %.type.Node, %.type.Node* %.tmp1611, i32 0, i32 0
%.tmp1613 = load i8*, i8** %.tmp1612
%.tmp1614 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1609, i8*%.tmp1610, i8*%.tmp1613)
%.tmp1615 = load %.type.File*, %.type.File** %stdout
%.tmp1616 = load i32, i32* %indent
call void (%.type.File*, i32) @.mod1560._print_indent(%.type.File*%.tmp1615, i32%.tmp1616)
%.tmp1618 = load %.type.File*, %.type.File** %stdout
%.tmp1619 = getelementptr [12 x i8], [12 x i8]*@.str68, i64 0, i64 0
%.tmp1620 = load %.type.Node*, %.type.Node** %node
%.tmp1621 = getelementptr %.type.Node, %.type.Node* %.tmp1620, i32 0, i32 1
%.tmp1622 = load i8*, i8** %.tmp1621
%.tmp1623 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1618, i8*%.tmp1619, i8*%.tmp1622)
%.tmp1624 = load %.type.File*, %.type.File** %stdout
%.tmp1625 = load i32, i32* %indent
call void (%.type.File*, i32) @.mod1560._print_indent(%.type.File*%.tmp1624, i32%.tmp1625)
%.tmp1627 = load %.type.File*, %.type.File** %stdout
%.tmp1628 = getelementptr [11 x i8], [11 x i8]*@.str69, i64 0, i64 0
%.tmp1629 = load %.type.Node*, %.type.Node** %node
%.tmp1630 = getelementptr %.type.Node, %.type.Node* %.tmp1629, i32 0, i32 2
%.tmp1631 = load i32, i32* %.tmp1630
%.tmp1632 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1627, i8*%.tmp1628, i32%.tmp1631)
%.tmp1633 = load %.type.File*, %.type.File** %stdout
%.tmp1634 = load i32, i32* %indent
call void (%.type.File*, i32) @.mod1560._print_indent(%.type.File*%.tmp1633, i32%.tmp1634)
%.tmp1636 = load %.type.File*, %.type.File** %stdout
%.tmp1637 = getelementptr [19 x i8], [19 x i8]*@.str70, i64 0, i64 0
%.tmp1638 = load %.type.Node*, %.type.Node** %node
%.tmp1639 = getelementptr %.type.Node, %.type.Node* %.tmp1638, i32 0, i32 3
%.tmp1640 = load i32, i32* %.tmp1639
%.tmp1641 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1636, i8*%.tmp1637, i32%.tmp1640)
%.tmp1642 = load %.type.File*, %.type.File** %stdout
%.tmp1643 = load i32, i32* %indent
call void (%.type.File*, i32) @.mod1560._print_indent(%.type.File*%.tmp1642, i32%.tmp1643)
%.tmp1645 = load %.type.File*, %.type.File** %stdout
%.tmp1646 = getelementptr [9 x i8], [9 x i8]*@.str71, i64 0, i64 0
%.tmp1647 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1645, i8*%.tmp1646)
%.tmp1648 = load %.type.Node*, %.type.Node** %node
%.tmp1649 = getelementptr %.type.Node, %.type.Node* %.tmp1648, i32 0, i32 6
%.tmp1650 = load %.type.Node*, %.type.Node** %.tmp1649
%.tmp1651 = load %.type.File*, %.type.File** %stdout
%.tmp1652 = load i32, i32* %indent
%.tmp1653 = add i32 %.tmp1652, 1
call void (%.type.Node*, %.type.File*, i32) @.mod1560._node_to_string(%.type.Node*%.tmp1650, %.type.File*%.tmp1651, i32%.tmp1653)
%.tmp1655 = load %.type.File*, %.type.File** %stdout
%.tmp1656 = load i32, i32* %indent
call void (%.type.File*, i32) @.mod1560._print_indent(%.type.File*%.tmp1655, i32%.tmp1656)
%.tmp1658 = load %.type.File*, %.type.File** %stdout
%.tmp1659 = getelementptr [13 x i8], [13 x i8]*@.str72, i64 0, i64 0
%.tmp1660 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1658, i8*%.tmp1659)
%.tmp1661 = load %.type.Node*, %.type.Node** %node
%.tmp1662 = getelementptr %.type.Node, %.type.Node* %.tmp1661, i32 0, i32 5
%.tmp1663 = load %.type.Node*, %.type.Node** %.tmp1662
%.tmp1664 = load %.type.File*, %.type.File** %stdout
%.tmp1665 = load i32, i32* %indent
%.tmp1666 = add i32 %.tmp1665, 1
call void (%.type.Node*, %.type.File*, i32) @.mod1560._node_to_string(%.type.Node*%.tmp1663, %.type.File*%.tmp1664, i32%.tmp1666)
%.tmp1668 = load %.type.File*, %.type.File** %stdout
%.tmp1669 = load i32, i32* %indent
%.tmp1670 = sub i32 %.tmp1669, 1
call void (%.type.File*, i32) @.mod1560._print_indent(%.type.File*%.tmp1668, i32%.tmp1670)
%.tmp1672 = load %.type.File*, %.type.File** %stdout
%.tmp1673 = getelementptr [2 x i8], [2 x i8]*@.str73, i64 0, i64 0
%.tmp1674 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1672, i8*%.tmp1673)
ret void
}
%.type.CompilerCtx = type {%.type.Node*, %.type.File*}
@CompilerCtx_size = constant i32 16
define %.type.CompilerCtx* @.mod0.new_context() {
%.tmp1675 = load i32, i32* @CompilerCtx_size
%.tmp1676 = call i8* (i32) @malloc(i32%.tmp1675)
%.tmp1677 = bitcast i8* %.tmp1676 to %.type.CompilerCtx*
%ctx = alloca %.type.CompilerCtx*
store %.type.CompilerCtx* %.tmp1677, %.type.CompilerCtx** %ctx
%.tmp1678 = call %.type.File* () @tmpfile()
%.tmp1679 = load %.type.CompilerCtx*, %.type.CompilerCtx** %ctx
%.tmp1680 = getelementptr %.type.CompilerCtx, %.type.CompilerCtx* %.tmp1679, i32 0, i32 1
store %.type.File* %.tmp1678, %.type.File** %.tmp1680
%.tmp1681 = bitcast ptr null to %.type.Node*
%.tmp1682 = load %.type.CompilerCtx*, %.type.CompilerCtx** %ctx
%.tmp1683 = getelementptr %.type.CompilerCtx, %.type.CompilerCtx* %.tmp1682, i32 0, i32 0
store %.type.Node* %.tmp1681, %.type.Node** %.tmp1683
%.tmp1684 = load %.type.CompilerCtx*, %.type.CompilerCtx** %ctx
%.tmp1685 = bitcast %.type.CompilerCtx* %.tmp1684 to %.type.CompilerCtx*
ret %.type.CompilerCtx* %.tmp1685
}
define void @.mod0.compile(%.type.CompilerCtx* %.arg.ctx, %.type.Node* %.arg.ast) {
%ctx = alloca %.type.CompilerCtx*
store %.type.CompilerCtx* %.arg.ctx, %.type.CompilerCtx** %ctx
%ast = alloca %.type.Node*
store %.type.Node* %.arg.ast, %.type.Node** %ast
%.tmp1686 = load %.type.CompilerCtx*, %.type.CompilerCtx** %ctx
%.tmp1687 = getelementptr %.type.CompilerCtx, %.type.CompilerCtx* %.tmp1686, i32 0, i32 1
%.tmp1688 = load %.type.File*, %.type.File** %.tmp1687
%.tmp1689 = getelementptr [22 x i8], [22 x i8]*@.str74, i64 0, i64 0
%.tmp1690 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1688, i8*%.tmp1689)
%.tmp1691 = load %.type.CompilerCtx*, %.type.CompilerCtx** %ctx
%.tmp1692 = getelementptr %.type.CompilerCtx, %.type.CompilerCtx* %.tmp1691, i32 0, i32 1
%.tmp1693 = load %.type.File*, %.type.File** %.tmp1692
%.tmp1694 = getelementptr [11 x i8], [11 x i8]*@.str75, i64 0, i64 0
%.tmp1695 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1693, i8*%.tmp1694)
%.tmp1696 = load %.type.CompilerCtx*, %.type.CompilerCtx** %ctx
%.tmp1697 = getelementptr %.type.CompilerCtx, %.type.CompilerCtx* %.tmp1696, i32 0, i32 1
%.tmp1698 = load %.type.File*, %.type.File** %.tmp1697
%.tmp1699 = getelementptr [3 x i8], [3 x i8]*@.str76, i64 0, i64 0
%.tmp1700 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1698, i8*%.tmp1699)
ret void
}
@.str77 = constant [2 x i8] c"w\00"
@.str78 = constant [21 x i8] c"Running tests in %s\0A\00"
@.str79 = constant [20 x i8] c"unable to open pipe\00"
@.str80 = constant [2 x i8] c"w\00"
@.str81 = constant [22 x i8] c"unable to open stdout\00"
@.str82 = constant [2 x i8] c"w\00"
@.str83 = constant [25 x i8] c"[ \1B[31mERROR\1B[0m ] %s: \0A\00"
@.str84 = constant [41 x i8] c"[ \1B[33mWARN\1B[0m  ] %s: no asserts found\0A\00"
@.str85 = constant [23 x i8] c"[ \1B[32mOK\1B[0m    ] %s\0A\00"
@.str86 = constant [2 x i8] c"\0A\00"
@.str87 = constant [6 x i8] c"#%d: \00"
@.str88 = constant [25 x i8] c"expected '%d', got '%d'\0A\00"
@.str89 = constant [35 x i8] c"expected '%c' (%d), got '%c' (%d)\0A\00"
@.str90 = constant [24 x i8] c"value %s is not truthy\0A\00"
@.str91 = constant [27 x i8] c"expected '%s', got (null)\0A\00"
@.str92 = constant [25 x i8] c"expected '%s', got '%s'\0A\00"
@.str93 = constant [32 x i8] c"expected null pointer, got: %p\0A\00"
@.str94 = constant [30 x i8] c"expected pointer, got: (null)\00"



%.type.T = type {i1, i8*, i8*, i32, i32*, %.type.File*}
@T_ptr_size = constant i32 48
define %.type.T* @.mod1701.init(i8* %.arg.filename) {
%filename = alloca i8*
store i8* %.arg.filename, i8** %filename
%.tmp1702 = load i32, i32* @T_ptr_size
%.tmp1703 = call i8* (i32) @malloc(i32%.tmp1702)
%.tmp1704 = bitcast i8* %.tmp1703 to %.type.T*
%t = alloca %.type.T*
store %.type.T* %.tmp1704, %.type.T** %t
%.tmp1705 = load i8*, i8** %filename
%.tmp1706 = load %.type.T*, %.type.T** %t
%.tmp1707 = getelementptr %.type.T, %.type.T* %.tmp1706, i32 0, i32 1
store i8* %.tmp1705, i8** %.tmp1707
%.tmp1708 = mul i32 2, 32
%.tmp1709 = call i8* (i32) @malloc(i32%.tmp1708)
%.tmp1710 = bitcast i8* %.tmp1709 to i32*
%.tmp1711 = load %.type.T*, %.type.T** %t
%.tmp1712 = getelementptr %.type.T, %.type.T* %.tmp1711, i32 0, i32 4
store i32* %.tmp1710, i32** %.tmp1712
%.tmp1713 = load i32, i32* @STDERR
%.tmp1714 = getelementptr [2 x i8], [2 x i8]*@.str77, i64 0, i64 0
%.tmp1715 = call %.type.File* (i32, i8*) @fdopen(i32%.tmp1713, i8*%.tmp1714)
%stderr = alloca %.type.File*
store %.type.File* %.tmp1715, %.type.File** %stderr
%.tmp1716 = load %.type.File*, %.type.File** %stderr
%.tmp1717 = getelementptr [21 x i8], [21 x i8]*@.str78, i64 0, i64 0
%.tmp1718 = load i8*, i8** %filename
%.tmp1719 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1716, i8*%.tmp1717, i8*%.tmp1718)
%.tmp1720 = load %.type.T*, %.type.T** %t
ret %.type.T* %.tmp1720
}
define void @.mod1701.setup(%.type.T* %.arg.t, i8* %.arg.test_name) {
%t = alloca %.type.T*
store %.type.T* %.arg.t, %.type.T** %t
%test_name = alloca i8*
store i8* %.arg.test_name, i8** %test_name
%.tmp1721 = add i1 0, 0
%.tmp1722 = load %.type.T*, %.type.T** %t
%.tmp1723 = getelementptr %.type.T, %.type.T* %.tmp1722, i32 0, i32 0
store i1 %.tmp1721, i1* %.tmp1723
%.tmp1724 = load i8*, i8** %test_name
%.tmp1725 = load %.type.T*, %.type.T** %t
%.tmp1726 = getelementptr %.type.T, %.type.T* %.tmp1725, i32 0, i32 2
store i8* %.tmp1724, i8** %.tmp1726
%.tmp1727 = load %.type.T*, %.type.T** %t
%.tmp1728 = getelementptr %.type.T, %.type.T* %.tmp1727, i32 0, i32 4
%.tmp1729 = load i32*, i32** %.tmp1728
%.tmp1730 = call i32 (i32*) @pipe(i32*%.tmp1729)
%.tmp1731 = icmp sge i32 %.tmp1730, 0
%.tmp1732 = getelementptr [20 x i8], [20 x i8]*@.str79, i64 0, i64 0
call void (i1, i8*) @.mod1.assert(i1%.tmp1731, i8*%.tmp1732)
%.tmp1734 = load %.type.T*, %.type.T** %t
%.tmp1735 = getelementptr %.type.T, %.type.T* %.tmp1734, i32 0, i32 3
store i32 0, i32* %.tmp1735
%.tmp1736 = load %.type.T*, %.type.T** %t
%.tmp1737 = getelementptr %.type.T, %.type.T* %.tmp1736, i32 0, i32 4
%.tmp1738 = load i32*, i32** %.tmp1737
%fds = alloca i32*
store i32* %.tmp1738, i32** %fds
%.tmp1741 = load i32, i32* @STDOUT
%.tmp1739 = load i32*, i32** %fds
%.tmp1740 = getelementptr i32, i32* %.tmp1739, i32 %.tmp1741
%.tmp1742 = load i32, i32* %.tmp1740
%.tmp1743 = getelementptr [2 x i8], [2 x i8]*@.str80, i64 0, i64 0
%.tmp1744 = call %.type.File* (i32, i8*) @fdopen(i32%.tmp1742, i8*%.tmp1743)
%.tmp1745 = load %.type.T*, %.type.T** %t
%.tmp1746 = getelementptr %.type.T, %.type.T* %.tmp1745, i32 0, i32 5
store %.type.File* %.tmp1744, %.type.File** %.tmp1746
%.tmp1747 = load %.type.T*, %.type.T** %t
%.tmp1748 = getelementptr %.type.T, %.type.T* %.tmp1747, i32 0, i32 5
%.tmp1749 = load %.type.File*, %.type.File** %.tmp1748
%.tmp1750 = icmp ne %.type.File* %.tmp1749, null
%.tmp1751 = getelementptr [22 x i8], [22 x i8]*@.str81, i64 0, i64 0
call void (i1, i8*) @.mod1.assert(i1%.tmp1750, i8*%.tmp1751)
ret void
}
define void @.mod1701.run(%.type.T* %.arg.t, i32 %.arg._unused) {
%t = alloca %.type.T*
store %.type.T* %.arg.t, %.type.T** %t
%_unused = alloca i32
store i32 %.arg._unused, i32* %_unused
%.tmp1753 = load %.type.T*, %.type.T** %t
%.tmp1754 = getelementptr %.type.T, %.type.T* %.tmp1753, i32 0, i32 4
%.tmp1755 = load i32*, i32** %.tmp1754
%fds = alloca i32*
store i32* %.tmp1755, i32** %fds
%.tmp1756 = load %.type.T*, %.type.T** %t
%.tmp1757 = getelementptr %.type.T, %.type.T* %.tmp1756, i32 0, i32 5
%.tmp1758 = load %.type.File*, %.type.File** %.tmp1757
%.tmp1759 = call i32 (%.type.File*) @fflush(%.type.File*%.tmp1758)
%.tmp1762 = load i32, i32* @STDOUT
%.tmp1760 = load i32*, i32** %fds
%.tmp1761 = getelementptr i32, i32* %.tmp1760, i32 %.tmp1762
%.tmp1763 = load i32, i32* %.tmp1761
%.tmp1764 = call i32 (i32) @close(i32%.tmp1763)
%.tmp1765 = load i32, i32* @STDERR
%.tmp1766 = getelementptr [2 x i8], [2 x i8]*@.str82, i64 0, i64 0
%.tmp1767 = call %.type.File* (i32, i8*) @fdopen(i32%.tmp1765, i8*%.tmp1766)
%stderr = alloca %.type.File*
store %.type.File* %.tmp1767, %.type.File** %stderr
%.tmp1768 = load %.type.T*, %.type.T** %t
%.tmp1769 = getelementptr %.type.T, %.type.T* %.tmp1768, i32 0, i32 0
%.tmp1770 = load i1, i1* %.tmp1769
br i1 %.tmp1770, label %.if.true.1771, label %.if.false.1771
.if.true.1771:
%.tmp1772 = load %.type.File*, %.type.File** %stderr
%.tmp1773 = getelementptr [25 x i8], [25 x i8]*@.str83, i64 0, i64 0
%.tmp1774 = load %.type.T*, %.type.T** %t
%.tmp1775 = getelementptr %.type.T, %.type.T* %.tmp1774, i32 0, i32 2
%.tmp1776 = load i8*, i8** %.tmp1775
%.tmp1777 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1772, i8*%.tmp1773, i8*%.tmp1776)
%.tmp1780 = load i32, i32* @STDIN
%.tmp1778 = load i32*, i32** %fds
%.tmp1779 = getelementptr i32, i32* %.tmp1778, i32 %.tmp1780
%.tmp1781 = load i32, i32* %.tmp1779
call void (i32) @.mod1701._read_all(i32%.tmp1781)
br label %.if.end.1771
.if.false.1771:
%.tmp1783 = load %.type.T*, %.type.T** %t
%.tmp1784 = getelementptr %.type.T, %.type.T* %.tmp1783, i32 0, i32 3
%.tmp1785 = load i32, i32* %.tmp1784
%.tmp1786 = icmp eq i32 %.tmp1785, 0
br i1 %.tmp1786, label %.if.true.1787, label %.if.false.1787
.if.true.1787:
%.tmp1788 = load %.type.File*, %.type.File** %stderr
%.tmp1789 = getelementptr [41 x i8], [41 x i8]*@.str84, i64 0, i64 0
%.tmp1790 = load %.type.T*, %.type.T** %t
%.tmp1791 = getelementptr %.type.T, %.type.T* %.tmp1790, i32 0, i32 2
%.tmp1792 = load i8*, i8** %.tmp1791
%.tmp1793 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1788, i8*%.tmp1789, i8*%.tmp1792)
br label %.if.end.1787
.if.false.1787:
%.tmp1794 = load %.type.File*, %.type.File** %stderr
%.tmp1795 = getelementptr [23 x i8], [23 x i8]*@.str85, i64 0, i64 0
%.tmp1796 = load %.type.T*, %.type.T** %t
%.tmp1797 = getelementptr %.type.T, %.type.T* %.tmp1796, i32 0, i32 2
%.tmp1798 = load i8*, i8** %.tmp1797
%.tmp1799 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1794, i8*%.tmp1795, i8*%.tmp1798)
br label %.if.end.1787
.if.end.1787:
br label %.if.end.1771
.if.end.1771:
%.tmp1802 = load i32, i32* @STDIN
%.tmp1800 = load i32*, i32** %fds
%.tmp1801 = getelementptr i32, i32* %.tmp1800, i32 %.tmp1802
%.tmp1803 = load i32, i32* %.tmp1801
%.tmp1804 = call i32 (i32) @close(i32%.tmp1803)
ret void
}
define void @.mod1701.cleanup(%.type.T* %.arg.t) {
%t = alloca %.type.T*
store %.type.T* %.arg.t, %.type.T** %t
%.tmp1805 = load %.type.T*, %.type.T** %t
%.tmp1806 = getelementptr %.type.T, %.type.T* %.tmp1805, i32 0, i32 5
%.tmp1807 = load %.type.File*, %.type.File** %.tmp1806
%.tmp1808 = call i32 (%.type.File*) @fclose(%.type.File*%.tmp1807)
%.tmp1809 = load %.type.T*, %.type.T** %t
%.tmp1810 = getelementptr %.type.T, %.type.T* %.tmp1809, i32 0, i32 4
%.tmp1811 = load i32*, i32** %.tmp1810
%.tmp1812 = bitcast i32* %.tmp1811 to i8*
call void (i8*) @free(i8*%.tmp1812)
%.tmp1814 = load %.type.T*, %.type.T** %t
%.tmp1815 = bitcast %.type.T* %.tmp1814 to i8*
call void (i8*) @free(i8*%.tmp1815)
ret void
}
define void @.mod1701._read_all(i32 %.arg.fd) {
%fd = alloca i32
store i32 %.arg.fd, i32* %fd

%len = alloca i32
store i32 1024, i32* %len
%.tmp1817 = load i32, i32* %len
%.tmp1818 = call i8* (i32) @malloc(i32%.tmp1817)
%buf = alloca i8*
store i8* %.tmp1818, i8** %buf

%read = alloca i32
store i32 0, i32* %read
%.tmp1819 = add i1 0, 0
%quit = alloca i1
store i1 %.tmp1819, i1* %quit

br label %.for.start.1820
.for.start.1820:
%.tmp1821 = load i1, i1* %quit
%.tmp1822 = add i1 0, 0
%.tmp1823 = icmp eq i1 %.tmp1821, %.tmp1822
br i1 %.tmp1823, label %.for.continue.1820, label %.for.end.1820
.for.continue.1820:
%.tmp1824 = load i32, i32* %fd
%.tmp1825 = load i8*, i8** %buf
%.tmp1826 = load i32, i32* %len
%.tmp1827 = call i32 (i32, i8*, i32) @read(i32%.tmp1824, i8*%.tmp1825, i32%.tmp1826)

store i32 %.tmp1827, i32* %read
%.tmp1828 = load i32, i32* %read
%.tmp1829 = icmp sgt i32 %.tmp1828, 0
br i1 %.tmp1829, label %.if.true.1830, label %.if.false.1830
.if.true.1830:
%.tmp1831 = load i32, i32* @STDERR
%.tmp1832 = load i8*, i8** %buf
%.tmp1833 = load i32, i32* %len
%.tmp1834 = call i32 (i32, i8*, i32) @write(i32%.tmp1831, i8*%.tmp1832, i32%.tmp1833)
br label %.if.end.1830
.if.false.1830:
%.tmp1835 = add i1 0, 1

store i1 %.tmp1835, i1* %quit
br label %.if.end.1830
.if.end.1830:

br label %.for.start.1820
.for.end.1820:
%.tmp1836 = load i32, i32* @STDERR
%.tmp1837 = getelementptr [2 x i8], [2 x i8]*@.str86, i64 0, i64 0
%.tmp1838 = call i32 (i32, i8*, i32) @write(i32%.tmp1836, i8*%.tmp1837, i32 1)
%.tmp1839 = load i8*, i8** %buf
call void (i8*) @free(i8*%.tmp1839)
ret void
}
define void @.mod1701.fail(%.type.T* %.arg.t) {
%t = alloca %.type.T*
store %.type.T* %.arg.t, %.type.T** %t
%.tmp1841 = add i1 0, 1
%.tmp1842 = load %.type.T*, %.type.T** %t
%.tmp1843 = getelementptr %.type.T, %.type.T* %.tmp1842, i32 0, i32 0
store i1 %.tmp1841, i1* %.tmp1843
%.tmp1844 = load %.type.T*, %.type.T** %t
%.tmp1845 = getelementptr %.type.T, %.type.T* %.tmp1844, i32 0, i32 5
%.tmp1846 = load %.type.File*, %.type.File** %.tmp1845
%.tmp1847 = getelementptr [6 x i8], [6 x i8]*@.str87, i64 0, i64 0
%.tmp1848 = load %.type.T*, %.type.T** %t
%.tmp1849 = getelementptr %.type.T, %.type.T* %.tmp1848, i32 0, i32 3
%.tmp1850 = load i32, i32* %.tmp1849
%.tmp1851 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1846, i8*%.tmp1847, i32%.tmp1850)
ret void
}
define void @.mod1701.assert_equal_int(%.type.T* %.arg.t, i32 %.arg.expect, i32 %.arg.got) {
%t = alloca %.type.T*
store %.type.T* %.arg.t, %.type.T** %t
%expect = alloca i32
store i32 %.arg.expect, i32* %expect
%got = alloca i32
store i32 %.arg.got, i32* %got
%.tmp1852 = load %.type.T*, %.type.T** %t
%.tmp1853 = getelementptr %.type.T, %.type.T* %.tmp1852, i32 0, i32 3
%.tmp1854 = load i32, i32* %.tmp1853
%.tmp1855 = add i32 %.tmp1854, 1
%.tmp1856 = load %.type.T*, %.type.T** %t
%.tmp1857 = getelementptr %.type.T, %.type.T* %.tmp1856, i32 0, i32 3
store i32 %.tmp1855, i32* %.tmp1857
%.tmp1858 = load i32, i32* %expect
%.tmp1859 = load i32, i32* %got
%.tmp1860 = icmp ne i32 %.tmp1858, %.tmp1859
br i1 %.tmp1860, label %.if.true.1861, label %.if.false.1861
.if.true.1861:
%.tmp1862 = load %.type.T*, %.type.T** %t
call void (%.type.T*) @.mod1701.fail(%.type.T*%.tmp1862)
%.tmp1864 = load %.type.T*, %.type.T** %t
%.tmp1865 = getelementptr %.type.T, %.type.T* %.tmp1864, i32 0, i32 5
%.tmp1866 = load %.type.File*, %.type.File** %.tmp1865
%.tmp1867 = getelementptr [25 x i8], [25 x i8]*@.str88, i64 0, i64 0
%.tmp1868 = load i32, i32* %expect
%.tmp1869 = load i32, i32* %got
%.tmp1870 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1866, i8*%.tmp1867, i32%.tmp1868, i32%.tmp1869)
br label %.if.end.1861
.if.false.1861:

br label %.if.end.1861
.if.end.1861:
ret void
}
define void @.mod1701.assert_equal_chr(%.type.T* %.arg.t, i8 %.arg.expect, i8 %.arg.got) {
%t = alloca %.type.T*
store %.type.T* %.arg.t, %.type.T** %t
%expect = alloca i8
store i8 %.arg.expect, i8* %expect
%got = alloca i8
store i8 %.arg.got, i8* %got
%.tmp1871 = load %.type.T*, %.type.T** %t
%.tmp1872 = getelementptr %.type.T, %.type.T* %.tmp1871, i32 0, i32 3
%.tmp1873 = load i32, i32* %.tmp1872
%.tmp1874 = add i32 %.tmp1873, 1
%.tmp1875 = load %.type.T*, %.type.T** %t
%.tmp1876 = getelementptr %.type.T, %.type.T* %.tmp1875, i32 0, i32 3
store i32 %.tmp1874, i32* %.tmp1876
%.tmp1877 = load i8, i8* %expect
%.tmp1878 = load i8, i8* %got
%.tmp1879 = icmp ne i8 %.tmp1877, %.tmp1878
br i1 %.tmp1879, label %.if.true.1880, label %.if.false.1880
.if.true.1880:
%.tmp1881 = load %.type.T*, %.type.T** %t
call void (%.type.T*) @.mod1701.fail(%.type.T*%.tmp1881)
%.tmp1883 = load %.type.T*, %.type.T** %t
%.tmp1884 = getelementptr %.type.T, %.type.T* %.tmp1883, i32 0, i32 5
%.tmp1885 = load %.type.File*, %.type.File** %.tmp1884
%.tmp1886 = getelementptr [35 x i8], [35 x i8]*@.str89, i64 0, i64 0
%.tmp1887 = load i8, i8* %expect
%.tmp1888 = load i8, i8* %expect
%.tmp1889 = load i8, i8* %got
%.tmp1890 = load i8, i8* %got
%.tmp1891 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1885, i8*%.tmp1886, i8%.tmp1887, i8%.tmp1888, i8%.tmp1889, i8%.tmp1890)
br label %.if.end.1880
.if.false.1880:

br label %.if.end.1880
.if.end.1880:
ret void
}
define void @.mod1701.assert_true(%.type.T* %.arg.t, i8* %.arg.label, i1 %.arg.val) {
%t = alloca %.type.T*
store %.type.T* %.arg.t, %.type.T** %t
%label = alloca i8*
store i8* %.arg.label, i8** %label
%val = alloca i1
store i1 %.arg.val, i1* %val
%.tmp1892 = load %.type.T*, %.type.T** %t
%.tmp1893 = getelementptr %.type.T, %.type.T* %.tmp1892, i32 0, i32 3
%.tmp1894 = load i32, i32* %.tmp1893
%.tmp1895 = add i32 %.tmp1894, 1
%.tmp1896 = load %.type.T*, %.type.T** %t
%.tmp1897 = getelementptr %.type.T, %.type.T* %.tmp1896, i32 0, i32 3
store i32 %.tmp1895, i32* %.tmp1897
%.tmp1898 = load i1, i1* %val
%.tmp1899 = add i1 0, 0
%.tmp1900 = icmp eq i1 %.tmp1898, %.tmp1899
br i1 %.tmp1900, label %.if.true.1901, label %.if.false.1901
.if.true.1901:
%.tmp1902 = load %.type.T*, %.type.T** %t
call void (%.type.T*) @.mod1701.fail(%.type.T*%.tmp1902)
%.tmp1904 = load %.type.T*, %.type.T** %t
%.tmp1905 = getelementptr %.type.T, %.type.T* %.tmp1904, i32 0, i32 5
%.tmp1906 = load %.type.File*, %.type.File** %.tmp1905
%.tmp1907 = getelementptr [24 x i8], [24 x i8]*@.str90, i64 0, i64 0
%.tmp1908 = load i8*, i8** %label
%.tmp1909 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1906, i8*%.tmp1907, i8*%.tmp1908)
br label %.if.end.1901
.if.false.1901:

br label %.if.end.1901
.if.end.1901:
ret void
}
define void @.mod1701.assert_equal_str(%.type.T* %.arg.t, i8* %.arg.expect, i8* %.arg.got) {
%t = alloca %.type.T*
store %.type.T* %.arg.t, %.type.T** %t
%expect = alloca i8*
store i8* %.arg.expect, i8** %expect
%got = alloca i8*
store i8* %.arg.got, i8** %got
%.tmp1910 = load %.type.T*, %.type.T** %t
%.tmp1911 = getelementptr %.type.T, %.type.T* %.tmp1910, i32 0, i32 3
%.tmp1912 = load i32, i32* %.tmp1911
%.tmp1913 = add i32 %.tmp1912, 1
%.tmp1914 = load %.type.T*, %.type.T** %t
%.tmp1915 = getelementptr %.type.T, %.type.T* %.tmp1914, i32 0, i32 3
store i32 %.tmp1913, i32* %.tmp1915
%.tmp1916 = load i8*, i8** %got
%.tmp1917 = icmp eq i8* %.tmp1916, null
br i1 %.tmp1917, label %.if.true.1918, label %.if.false.1918
.if.true.1918:
%.tmp1919 = load %.type.T*, %.type.T** %t
call void (%.type.T*) @.mod1701.fail(%.type.T*%.tmp1919)
%.tmp1921 = load %.type.T*, %.type.T** %t
%.tmp1922 = getelementptr %.type.T, %.type.T* %.tmp1921, i32 0, i32 5
%.tmp1923 = load %.type.File*, %.type.File** %.tmp1922
%.tmp1924 = getelementptr [27 x i8], [27 x i8]*@.str91, i64 0, i64 0
%.tmp1925 = load i8*, i8** %expect
%.tmp1926 = load i8*, i8** %got
%.tmp1927 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1923, i8*%.tmp1924, i8*%.tmp1925, i8*%.tmp1926)
br label %.if.end.1918
.if.false.1918:
%.tmp1928 = load i8*, i8** %expect
%.tmp1929 = load i8*, i8** %got
%.tmp1930 = call i32 (i8*, i8*) @strcmp(i8*%.tmp1928, i8*%.tmp1929)
%.tmp1931 = icmp ne i32 %.tmp1930, 0
br i1 %.tmp1931, label %.if.true.1932, label %.if.false.1932
.if.true.1932:
%.tmp1933 = load %.type.T*, %.type.T** %t
call void (%.type.T*) @.mod1701.fail(%.type.T*%.tmp1933)
%.tmp1935 = load %.type.T*, %.type.T** %t
%.tmp1936 = getelementptr %.type.T, %.type.T* %.tmp1935, i32 0, i32 5
%.tmp1937 = load %.type.File*, %.type.File** %.tmp1936
%.tmp1938 = getelementptr [25 x i8], [25 x i8]*@.str92, i64 0, i64 0
%.tmp1939 = load i8*, i8** %expect
%.tmp1940 = load i8*, i8** %got
%.tmp1941 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1937, i8*%.tmp1938, i8*%.tmp1939, i8*%.tmp1940)
br label %.if.end.1932
.if.false.1932:

br label %.if.end.1932
.if.end.1932:
br label %.if.end.1918
.if.end.1918:
ret void
}
define void @.mod1701.assert_null(%.type.T* %.arg.t, i8* %.arg.ptr) {
%t = alloca %.type.T*
store %.type.T* %.arg.t, %.type.T** %t
%ptr = alloca i8*
store i8* %.arg.ptr, i8** %ptr
%.tmp1942 = load %.type.T*, %.type.T** %t
%.tmp1943 = getelementptr %.type.T, %.type.T* %.tmp1942, i32 0, i32 3
%.tmp1944 = load i32, i32* %.tmp1943
%.tmp1945 = add i32 %.tmp1944, 1
%.tmp1946 = load %.type.T*, %.type.T** %t
%.tmp1947 = getelementptr %.type.T, %.type.T* %.tmp1946, i32 0, i32 3
store i32 %.tmp1945, i32* %.tmp1947
%.tmp1948 = load i8*, i8** %ptr
%.tmp1949 = icmp ne i8* %.tmp1948, null
br i1 %.tmp1949, label %.if.true.1950, label %.if.false.1950
.if.true.1950:
%.tmp1951 = load %.type.T*, %.type.T** %t
call void (%.type.T*) @.mod1701.fail(%.type.T*%.tmp1951)
%.tmp1953 = load %.type.T*, %.type.T** %t
%.tmp1954 = getelementptr %.type.T, %.type.T* %.tmp1953, i32 0, i32 5
%.tmp1955 = load %.type.File*, %.type.File** %.tmp1954
%.tmp1956 = getelementptr [32 x i8], [32 x i8]*@.str93, i64 0, i64 0
%.tmp1957 = load i8*, i8** %ptr
%.tmp1958 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1955, i8*%.tmp1956, i8*%.tmp1957)
br label %.if.end.1950
.if.false.1950:

br label %.if.end.1950
.if.end.1950:
ret void
}
define void @.mod1701.assert_not_null(%.type.T* %.arg.t, i8* %.arg.ptr) {
%t = alloca %.type.T*
store %.type.T* %.arg.t, %.type.T** %t
%ptr = alloca i8*
store i8* %.arg.ptr, i8** %ptr
%.tmp1959 = load %.type.T*, %.type.T** %t
%.tmp1960 = getelementptr %.type.T, %.type.T* %.tmp1959, i32 0, i32 3
%.tmp1961 = load i32, i32* %.tmp1960
%.tmp1962 = add i32 %.tmp1961, 1
%.tmp1963 = load %.type.T*, %.type.T** %t
%.tmp1964 = getelementptr %.type.T, %.type.T* %.tmp1963, i32 0, i32 3
store i32 %.tmp1962, i32* %.tmp1964
%.tmp1965 = load i8*, i8** %ptr
%.tmp1966 = icmp eq i8* %.tmp1965, null
br i1 %.tmp1966, label %.if.true.1967, label %.if.false.1967
.if.true.1967:
%.tmp1968 = load %.type.T*, %.type.T** %t
call void (%.type.T*) @.mod1701.fail(%.type.T*%.tmp1968)
%.tmp1970 = load %.type.T*, %.type.T** %t
%.tmp1971 = getelementptr %.type.T, %.type.T* %.tmp1970, i32 0, i32 5
%.tmp1972 = load %.type.File*, %.type.File** %.tmp1971
%.tmp1973 = getelementptr [30 x i8], [30 x i8]*@.str94, i64 0, i64 0
%.tmp1974 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1972, i8*%.tmp1973)
br label %.if.end.1967
.if.false.1967:

br label %.if.end.1967
.if.end.1967:
ret void
}
define %.type.File* @.mod1701.tempfile(i8* %.arg.content) {
%content = alloca i8*
store i8* %.arg.content, i8** %content
%.tmp1975 = call %.type.File* () @tmpfile()
%fd = alloca %.type.File*
store %.type.File* %.tmp1975, %.type.File** %fd
%.tmp1976 = load %.type.File*, %.type.File** %fd
%.tmp1977 = load i8*, i8** %content
%.tmp1978 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp1976, i8*%.tmp1977)
%.tmp1979 = load %.type.File*, %.type.File** %fd
call void (%.type.File*) @rewind(%.type.File*%.tmp1979)
%.tmp1981 = load %.type.File*, %.type.File** %fd
ret %.type.File* %.tmp1981
}


define i8* @.mod1982.readall(i32 %.arg.fd) {
%fd = alloca i32
store i32 %.arg.fd, i32* %fd

%buf_len = alloca i32
store i32 1024, i32* %buf_len
%.tmp1983 = load i32, i32* %buf_len
%.tmp1984 = call i8* (i32) @malloc(i32%.tmp1983)
%buf = alloca i8*
store i8* %.tmp1984, i8** %buf

%content_len = alloca i32
store i32 0, i32* %content_len
%.tmp1985 = call i8* (i32) @malloc(i32 1)
%content = alloca i8*
store i8* %.tmp1985, i8** %content
%.tmp1986 = load i32, i32* %fd
%.tmp1987 = load i8*, i8** %buf
%.tmp1988 = load i32, i32* %buf_len
%.tmp1989 = call i32 (i32, i8*, i32) @read(i32%.tmp1986, i8*%.tmp1987, i32%.tmp1988)
%read_bytes = alloca i32
store i32 %.tmp1989, i32* %read_bytes

br label %.for.start.1990
.for.start.1990:
%.tmp1991 = load i32, i32* %read_bytes
%.tmp1992 = icmp sgt i32 %.tmp1991, 0
br i1 %.tmp1992, label %.for.continue.1990, label %.for.end.1990
.for.continue.1990:
%.tmp1993 = load i8*, i8** %content
%.tmp1994 = load i32, i32* %content_len
%.tmp1995 = load i32, i32* %read_bytes
%.tmp1996 = add i32 %.tmp1994, %.tmp1995
%.tmp1997 = call i8* (i8*, i32) @realloc(i8*%.tmp1993, i32%.tmp1996)

store i8* %.tmp1997, i8** %content

%i = alloca i32
store i32 0, i32* %i
br label %.for.start.1998
.for.start.1998:
%.tmp1999 = load i32, i32* %i
%.tmp2000 = load i32, i32* %read_bytes
%.tmp2001 = icmp slt i32 %.tmp1999, %.tmp2000
br i1 %.tmp2001, label %.for.continue.1998, label %.for.end.1998
.for.continue.1998:
%.tmp2004 = load i32, i32* %i
%.tmp2002 = load i8*, i8** %buf
%.tmp2003 = getelementptr i8, i8* %.tmp2002, i32 %.tmp2004
%.tmp2005 = load i8, i8* %.tmp2003
%.tmp2006 = load i32, i32* %i
%.tmp2007 = load i32, i32* %content_len
%.tmp2008 = add i32 %.tmp2006, %.tmp2007
%.tmp2009 = load i8*, i8** %content
%.tmp2010 = getelementptr i8, i8* %.tmp2009, i32 %.tmp2008
store i8 %.tmp2005, i8* %.tmp2010
%.tmp2011 = load i32, i32* %i
%.tmp2012 = add i32 %.tmp2011, 1

store i32 %.tmp2012, i32* %i
br label %.for.start.1998
.for.end.1998:
%.tmp2013 = load i32, i32* %content_len
%.tmp2014 = load i32, i32* %read_bytes
%.tmp2015 = add i32 %.tmp2013, %.tmp2014

store i32 %.tmp2015, i32* %content_len
%.tmp2016 = load i32, i32* %fd
%.tmp2017 = load i8*, i8** %buf
%.tmp2018 = load i32, i32* %buf_len
%.tmp2019 = call i32 (i32, i8*, i32) @read(i32%.tmp2016, i8*%.tmp2017, i32%.tmp2018)

store i32 %.tmp2019, i32* %read_bytes
br label %.for.start.1990
.for.end.1990:
%.tmp2020 = load i32, i32* %content_len
%.tmp2021 = load i8*, i8** %content
%.tmp2022 = getelementptr i8, i8* %.tmp2021, i32 %.tmp2020
store i8 0, i8* %.tmp2022
%.tmp2023 = load i8*, i8** %buf
call void (i8*) @free(i8*%.tmp2023)
%.tmp2025 = load i8*, i8** %content
ret i8* %.tmp2025
}




define i8* @_build_filename(i8* %.arg.filename, i8* %.arg.ext) {
%filename = alloca i8*
store i8* %.arg.filename, i8** %filename
%ext = alloca i8*
store i8* %.arg.ext, i8** %ext
%.tmp2026 = load i8*, i8** %filename
%.tmp2027 = call i32 (i8*) @strlen(i8*%.tmp2026)
%.tmp2028 = load i8*, i8** %ext
%.tmp2029 = call i32 (i8*) @strlen(i8*%.tmp2028)
%.tmp2030 = add i32 %.tmp2027, %.tmp2029
%.tmp2031 = add i32 %.tmp2030, 1
%name_len = alloca i32
store i32 %.tmp2031, i32* %name_len
%.tmp2032 = load i32, i32* %name_len
%.tmp2033 = call i8* (i32) @malloc(i32%.tmp2032)
%full_filename = alloca i8*
store i8* %.tmp2033, i8** %full_filename
%.tmp2034 = load i8*, i8** %full_filename
%.tmp2035 = getelementptr [6 x i8], [6 x i8]*@.str95, i64 0, i64 0
%.tmp2036 = load i8*, i8** %filename
%.tmp2037 = load i8*, i8** %ext
%.tmp2038 = call i32 (i8*, i8*, ...) @sprintf(i8*%.tmp2034, i8*%.tmp2035, i8*%.tmp2036, i8*%.tmp2037)
%.tmp2039 = load i8*, i8** %full_filename
ret i8* %.tmp2039
}
define i8* @read_testfile(i8* %.arg.filename, i8* %.arg.ext) {
%filename = alloca i8*
store i8* %.arg.filename, i8** %filename
%ext = alloca i8*
store i8* %.arg.ext, i8** %ext
%.tmp2040 = load i8*, i8** %filename
%.tmp2041 = load i8*, i8** %ext
%.tmp2042 = call i8* (i8*, i8*) @_build_filename(i8*%.tmp2040, i8*%.tmp2041)
%full_filename = alloca i8*
store i8* %.tmp2042, i8** %full_filename
%.tmp2043 = load i8*, i8** %full_filename
%.tmp2044 = getelementptr [2 x i8], [2 x i8]*@.str96, i64 0, i64 0
%.tmp2045 = call %.type.File* (i8*, i8*) @fopen(i8*%.tmp2043, i8*%.tmp2044)
%f = alloca %.type.File*
store %.type.File* %.tmp2045, %.type.File** %f
%.tmp2046 = load %.type.File*, %.type.File** %f
%.tmp2047 = icmp eq %.type.File* %.tmp2046, null
br i1 %.tmp2047, label %.if.true.2048, label %.if.false.2048
.if.true.2048:
%.tmp2049 = load i8*, i8** %full_filename
call void (i8*) @free(i8*%.tmp2049)

%.tmp2051 = bitcast ptr null to i8*
ret i8* %.tmp2051
br label %.if.end.2048
.if.false.2048:

br label %.if.end.2048
.if.end.2048:
%.tmp2052 = load i8*, i8** %full_filename
call void (i8*) @free(i8*%.tmp2052)
%.tmp2054 = load %.type.File*, %.type.File** %f
%.tmp2055 = call i32 (%.type.File*) @fileno(%.type.File*%.tmp2054)
%fd = alloca i32
store i32 %.tmp2055, i32* %fd
%.tmp2056 = load i32, i32* %fd
%.tmp2057 = call i8* (i32) @.mod1982.readall(i32%.tmp2056)
%content = alloca i8*
store i8* %.tmp2057, i8** %content
%.tmp2058 = load %.type.File*, %.type.File** %f
%.tmp2059 = call i32 (%.type.File*) @fclose(%.type.File*%.tmp2058)
%.tmp2060 = load i8*, i8** %content
ret i8* %.tmp2060
}
define i32 @testfile(%.type.T* %.arg.t, i8* %.arg.filename) {
%t = alloca %.type.T*
store %.type.T* %.arg.t, %.type.T** %t
%filename = alloca i8*
store i8* %.arg.filename, i8** %filename
%.tmp2061 = load %.type.T*, %.type.T** %t
%.tmp2062 = load i8*, i8** %filename
call void (%.type.T*, i8*) @.mod1701.setup(%.type.T*%.tmp2061, i8*%.tmp2062)
%.tmp2064 = getelementptr [13 x i8], [13 x i8]*@.str97, i64 0, i64 0
%.tmp2065 = getelementptr [2 x i8], [2 x i8]*@.str98, i64 0, i64 0
%.tmp2066 = call %.type.File* (i8*, i8*) @fopen(i8*%.tmp2064, i8*%.tmp2065)
%grammar_file = alloca %.type.File*
store %.type.File* %.tmp2066, %.type.File** %grammar_file
%.tmp2067 = load %.type.File*, %.type.File** %grammar_file
%.tmp2068 = call %.type.ParsingContext* (%.type.File*) @.mod92.new_context(%.type.File*%.tmp2067)
%ctx = alloca %.type.ParsingContext*
store %.type.ParsingContext* %.tmp2068, %.type.ParsingContext** %ctx
%.tmp2069 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp2070 = call %.type.Rule** (%.type.ParsingContext*) @.mod92.parse_grammar(%.type.ParsingContext*%.tmp2069)
%grammar = alloca %.type.Rule**
store %.type.Rule** %.tmp2070, %.type.Rule*** %grammar
%.tmp2071 = load %.type.ParsingContext*, %.type.ParsingContext** %ctx
%.tmp2072 = bitcast %.type.ParsingContext* %.tmp2071 to i8*
call void (i8*) @free(i8*%.tmp2072)
%.tmp2074 = load i8*, i8** %filename
%.tmp2075 = getelementptr [3 x i8], [3 x i8]*@.str99, i64 0, i64 0
%.tmp2076 = call i8* (i8*, i8*) @_build_filename(i8*%.tmp2074, i8*%.tmp2075)
%input_filename = alloca i8*
store i8* %.tmp2076, i8** %input_filename
%.tmp2077 = load i8*, i8** %input_filename
%.tmp2078 = load i32, i32* @O_RDONLY
%.tmp2079 = call i32 (i8*, i32) @open(i8*%.tmp2077, i32%.tmp2078)
%input_fd = alloca i32
store i32 %.tmp2079, i32* %input_fd
%.tmp2080 = load i32, i32* %input_fd
%.tmp2081 = icmp sle i32 %.tmp2080, 0
br i1 %.tmp2081, label %.if.true.2082, label %.if.false.2082
.if.true.2082:
%.tmp2083 = load %.type.T*, %.type.T** %t
call void (%.type.T*) @.mod1701.fail(%.type.T*%.tmp2083)
ret i32 0
br label %.if.end.2082
.if.false.2082:

br label %.if.end.2082
.if.end.2082:
%.tmp2085 = load i32, i32* %input_fd
%.tmp2086 = call %.type.PeekerInfo* (i32) @.mod93.new(i32%.tmp2085)
%p = alloca %.type.PeekerInfo*
store %.type.PeekerInfo* %.tmp2086, %.type.PeekerInfo** %p
%.tmp2087 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp2088 = add i1 0, 0
%.tmp2089 = call %.type.Token* (%.type.PeekerInfo*, i1) @.mod167.tokenize(%.type.PeekerInfo*%.tmp2087, i1%.tmp2088)
%tokens = alloca %.type.Token*
store %.type.Token* %.tmp2089, %.type.Token** %tokens
%.tmp2090 = load %.type.PeekerInfo*, %.type.PeekerInfo** %p
%.tmp2091 = bitcast %.type.PeekerInfo* %.tmp2090 to i8*
call void (i8*) @free(i8*%.tmp2091)
%.tmp2093 = load %.type.Rule**, %.type.Rule*** %grammar
%.tmp2094 = getelementptr [6 x i8], [6 x i8]*@.str100, i64 0, i64 0
%.tmp2095 = load %.type.Token*, %.type.Token** %tokens
%.tmp2096 = call %.type.ParseResult* (%.type.Rule**, i8*, %.type.Token*) @.mod92.ast(%.type.Rule**%.tmp2093, i8*%.tmp2094, %.type.Token*%.tmp2095)
%ast = alloca %.type.ParseResult*
store %.type.ParseResult* %.tmp2096, %.type.ParseResult** %ast
%.tmp2097 = call %.type.CompilerCtx* () @.mod0.new_context()
%compiler_ctx = alloca %.type.CompilerCtx*
store %.type.CompilerCtx* %.tmp2097, %.type.CompilerCtx** %compiler_ctx
%.tmp2098 = load %.type.CompilerCtx*, %.type.CompilerCtx** %compiler_ctx
%.tmp2099 = load %.type.ParseResult*, %.type.ParseResult** %ast
%.tmp2100 = getelementptr %.type.ParseResult, %.type.ParseResult* %.tmp2099, i32 0, i32 1
%.tmp2101 = load %.type.Node*, %.type.Node** %.tmp2100
call void (%.type.CompilerCtx*, %.type.Node*) @.mod0.compile(%.type.CompilerCtx*%.tmp2098, %.type.Node*%.tmp2101)
%.tmp2103 = load i8*, i8** %filename
%.tmp2104 = getelementptr [4 x i8], [4 x i8]*@.str101, i64 0, i64 0
%.tmp2105 = call i8* (i8*, i8*) @read_testfile(i8*%.tmp2103, i8*%.tmp2104)
%expect = alloca i8*
store i8* %.tmp2105, i8** %expect
%.tmp2106 = load i8*, i8** %expect
%.tmp2107 = icmp eq i8* %.tmp2106, null
br i1 %.tmp2107, label %.if.true.2108, label %.if.false.2108
.if.true.2108:
%.tmp2109 = load %.type.T*, %.type.T** %t
call void (%.type.T*) @.mod1701.fail(%.type.T*%.tmp2109)
%.tmp2111 = load %.type.T*, %.type.T** %t
%.tmp2112 = getelementptr %.type.T, %.type.T* %.tmp2111, i32 0, i32 5
%.tmp2113 = load %.type.File*, %.type.File** %.tmp2112
%.tmp2114 = getelementptr [23 x i8], [23 x i8]*@.str102, i64 0, i64 0
%.tmp2115 = load i8*, i8** %filename
%.tmp2116 = call i32 (%.type.File*, i8*, ...) @fprintf(%.type.File*%.tmp2113, i8*%.tmp2114, i8*%.tmp2115)
ret i32 0
br label %.if.end.2108
.if.false.2108:

br label %.if.end.2108
.if.end.2108:
%.tmp2117 = load %.type.CompilerCtx*, %.type.CompilerCtx** %compiler_ctx
%.tmp2118 = getelementptr %.type.CompilerCtx, %.type.CompilerCtx* %.tmp2117, i32 0, i32 1
%.tmp2119 = load %.type.File*, %.type.File** %.tmp2118
call void (%.type.File*) @rewind(%.type.File*%.tmp2119)
%.tmp2121 = load %.type.CompilerCtx*, %.type.CompilerCtx** %compiler_ctx
%.tmp2122 = getelementptr %.type.CompilerCtx, %.type.CompilerCtx* %.tmp2121, i32 0, i32 1
%.tmp2123 = load %.type.File*, %.type.File** %.tmp2122
%.tmp2124 = call i32 (%.type.File*) @fileno(%.type.File*%.tmp2123)
%.tmp2125 = call i8* (i32) @.mod1982.readall(i32%.tmp2124)
%got = alloca i8*
store i8* %.tmp2125, i8** %got
%.tmp2126 = load %.type.T*, %.type.T** %t
%.tmp2127 = load i8*, i8** %expect
%.tmp2128 = load i8*, i8** %got
call void (%.type.T*, i8*, i8*) @.mod1701.assert_equal_str(%.type.T*%.tmp2126, i8*%.tmp2127, i8*%.tmp2128)
ret i32 0
}
define i32 @main() {
%.tmp2130 = getelementptr [21 x i8], [21 x i8]*@.str103, i64 0, i64 0
%.tmp2131 = call %.type.T* (i8*) @.mod1701.init(i8*%.tmp2130)
%t = alloca %.type.T*
store %.type.T* %.tmp2131, %.type.T** %t
%.tmp2132 = load %.type.T*, %.type.T** %t
%.tmp2133 = load %.type.T*, %.type.T** %t
%.tmp2134 = getelementptr [33 x i8], [33 x i8]*@.str104, i64 0, i64 0
%.tmp2135 = call i32 (%.type.T*, i8*) @testfile(%.type.T*%.tmp2133, i8*%.tmp2134)
call void (%.type.T*, i32) @.mod1701.run(%.type.T*%.tmp2132, i32%.tmp2135)
%.tmp2137 = load %.type.T*, %.type.T** %t
call void (%.type.T*) @.mod1701.cleanup(%.type.T*%.tmp2137)
ret i32 0
}