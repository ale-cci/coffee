package compiler_test

import (
	"fmt"
	"strings"
	"testing"

	"bitbucket.org/ale-cci/elk/pkg/compiler"
	"gotest.tools/v3/assert"
)

func TestParsing(t *testing.T) {
	tt := []struct {
		name    string
		program string
		expect  string
	}{
		{
			name:    "parses empty main",
			program: "int main() { return 0 }",
			expect: fmt.Sprint(
				"define i32 @main() {\n",
				"ret i32 0\n",
				"}",
			),
		},
		{
			name:    "parses char type",
			program: strings.Join(
				[]string{
					"void main() {",
					"    chr[4] t",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
				"define void @main() {",
				"",
				"%t = alloca [ 4 x i8 ]",
				"",
				"ret void",
				"}",
				}, "\n",
			),
		},
		{
			name:    "parses main return value",
			program: "int main() { return 1 }",
			expect: fmt.Sprint(
				"define i32 @main() {\n",
				"ret i32 1\n",
				"}",
			),
		},
		{
			name: "parses extern puts call",
			program: fmt.Sprint(
				"extern int puts(str text)\n",
				"",
				"int main() {\n",
				"puts(\"hi from cj!\")\n",
				"return 0\n",
				"}",
			),
			expect: fmt.Sprint(
				"@.str0 = constant [12 x i8] c\"hi from cj!\\00\"\n",
				"declare i32 @puts(i8*)\n",
				"define i32 @main() {\n",
				"%.tmp0 = getelementptr [12 x i8], [12 x i8]*@.str0, i64 0, i64 0\n",
				"%.tmp1 = call i32 (i8*) @puts(i8*%.tmp0)\n",
				"ret i32 0\n",
				"}",
			),
		},
		{
			name: "parses string escape characters",
			program: strings.Join(
				[]string{
					"void main() {",
					"    t := \"sample\\13\"",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"@.str0 = constant [8 x i8] c\"sample\\13\\00\"",
					"define void @main() {",
					"%.tmp0 = getelementptr [8 x i8], [8 x i8]*@.str0, i64 0, i64 0",
					"%t = alloca i8*",
					"store i8* %.tmp0, i8** %t",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "should parse if else block",
			program: fmt.Sprint(
				"int main() {\n",
				"    if false {\n",
				"    }\n",
				"}",
			),
			expect: fmt.Sprint(
				"define i32 @main() {\n",
				"%.tmp0 = add i1 0, 0\n",
				"br i1 %.tmp0, label %.if.true.1, label %.if.false.1\n",
				".if.true.1:\n",
				"\n",
				"br label %.if.end.1\n",
				".if.false.1:\n",
				"\n",
				"br label %.if.end.1\n",
				".if.end.1:\n",
				"}",
			),
		},
		{
			name: "parses void return type",
			program: strings.Join(
				[]string{
					"void fn() {",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"define void @fn() {",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "if condition",
			program: strings.Join(
				[]string{
					"void main() {",
					"    if 5 < 4 {",
					"    }",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"define void @main() {",
					"%.tmp0 = icmp slt i32 5, 4",
					"br i1 %.tmp0, label %.if.true.1, label %.if.false.1",
					".if.true.1:",
					"",
					"br label %.if.end.1",
					".if.false.1:",
					"",
					"br label %.if.end.1",
					".if.end.1:",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "if condition block",
			program: strings.Join(
				[]string{
					"void main() {",
					"    if 1 + 2 < 4 {",
					"    }",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"define void @main() {",
					"%.tmp0 = add i32 1, 2",
					"%.tmp1 = icmp slt i32 %.tmp0, 4",
					"br i1 %.tmp1, label %.if.true.2, label %.if.false.2",
					".if.true.2:",
					"",
					"br label %.if.end.2",
					".if.false.2:",
					"",
					"br label %.if.end.2",
					".if.end.2:",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "if condition body",
			program: strings.Join(
				[]string{
					"extern int puts(str text)",
					"void main() {",
					"    if true {",
					"        puts(\"hi\")",
					"    }",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"@.str0 = constant [3 x i8] c\"hi\\00\"",
					"declare i32 @puts(i8*)",
					"define void @main() {",
					"%.tmp0 = add i1 0, 1",
					"br i1 %.tmp0, label %.if.true.1, label %.if.false.1",
					".if.true.1:",
					"%.tmp2 = getelementptr [3 x i8], [3 x i8]*@.str0, i64 0, i64 0",
					"%.tmp3 = call i32 (i8*) @puts(i8*%.tmp2)",
					"br label %.if.end.1",
					".if.false.1:",
					"",
					"br label %.if.end.1",
					".if.end.1:",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "else condition has body parsed",
			program: strings.Join(
				[]string{
					"extern int puts(str text)",
					"void main() {",
					"    if true {",
					"    } else {",
					"        puts(\"hi\")",
					"    }",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"@.str0 = constant [3 x i8] c\"hi\\00\"",
					"declare i32 @puts(i8*)",
					"define void @main() {",
					"%.tmp0 = add i1 0, 1",
					"br i1 %.tmp0, label %.if.true.1, label %.if.false.1",
					".if.true.1:",
					"",
					"br label %.if.end.1",
					".if.false.1:",
					"%.tmp2 = getelementptr [3 x i8], [3 x i8]*@.str0, i64 0, i64 0",
					"%.tmp3 = call i32 (i8*) @puts(i8*%.tmp2)",
					"br label %.if.end.1",
					".if.end.1:",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "parses varible declaration",
			program: strings.Join(
				[]string{
					"void main() {",
					"    x := 0",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"define void @main() {",
					"",
					"%x = alloca i32",
					"store i32 0, i32* %x",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "parses varible declaration",
			program: strings.Join(
				[]string{
					"void main() {",
					"    x := 3 + 4",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"define void @main() {",
					"%.tmp0 = add i32 3, 4",
					"%x = alloca i32",
					"store i32 %.tmp0, i32* %x",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "parses varible declaration",
			program: strings.Join(
				[]string{
					"void main() {",
					"    y := 2",
					"    x := 3 + y",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"define void @main() {",
					"",
					"%y = alloca i32",
					"store i32 2, i32* %y",
					"%.tmp0 = load i32, i32* %y",
					"%.tmp1 = add i32 3, %.tmp0",
					"%x = alloca i32",
					"store i32 %.tmp1, i32* %x",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "parses expression assignment",
			program: strings.Join(
				[]string{
					"void main() {",
					"    y := 3 > 2",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"define void @main() {",
					"%.tmp0 = icmp sgt i32 3, 2",
					"%y = alloca i1",
					"store i1 %.tmp0, i1* %y",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "test string assignment",
			program: strings.Join(
				[]string{
					"void main() {",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"define void @main() {",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "test variable assignment",
			program: strings.Join(
				[]string{
					"void main() {",
					"    i := 0",
					"    i = 1",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"define void @main() {",
					"",
					"%i = alloca i32",
					"store i32 0, i32* %i",
					"store i32 1, i32* %i",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "test variable assignment with non llvmimmediates",
			program: strings.Join(
				[]string{
					"void main() {",
					"    i := 0",
					"    i = i + 1",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"define void @main() {",
					"",
					"%i = alloca i32",
					"store i32 0, i32* %i",
					"%.tmp0 = load i32, i32* %i",
					"%.tmp1 = add i32 %.tmp0, 1",
					"",
					"store i32 %.tmp1, i32* %i",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "for loop implementation",
			program: strings.Join(
				[]string{
					"void main() {",
					"    for i := 0; i < 3; i = i + 1 {",
					"        a := 3",
					"    }",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"define void @main() {",
					"",
					"%i = alloca i32",
					"store i32 0, i32* %i",
					"br label %.for.start.0",
					".for.start.0:",
					"%.tmp1 = load i32, i32* %i",
					"%.tmp2 = icmp slt i32 %.tmp1, 3",
					"br i1 %.tmp2, label %.for.continue.0, label %.for.end.0",
					".for.continue.0:",
					"",
					"%a = alloca i32",
					"store i32 3, i32* %a",

					"%.tmp3 = load i32, i32* %i",
					"%.tmp4 = add i32 %.tmp3, 1",
					"",
					"store i32 %.tmp4, i32* %i",

					"br label %.for.start.0",
					".for.end.0:",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "equal operator",
			program: strings.Join(
				[]string{
					"void main() {",
					"    t := 3 == 3",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"define void @main() {",
					"%.tmp0 = icmp seq i32 3, 3",
					"%t = alloca i32",
					"store i32 %.tmp0, i32* %t",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "parses array types",
			program: strings.Join(
				[]string{
					"void main() {",
					"   int[32] t",
					"   t[1] = 2",
					"   t[0] = t[2]",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"define void @main() {",
					"",
					"%t = alloca [ 32 x i32 ]",
					"",
					"%.tmp0 = getelementptr [ 32 x i32 ], [ 32 x i32 ]*%t, i32 0, i32 1",
					"store i32 2, i32* %.tmp0",
					"%.tmp1 = getelementptr [ 32 x i32 ], [ 32 x i32 ]*%t, i32 0, i32 2",
					"%.tmp2 = load i32, i32* %.tmp1",
					"%.tmp3 = getelementptr [ 32 x i32 ], [ 32 x i32 ]*%t, i32 0, i32 0",
					"store i32 %.tmp2, i32* %.tmp3",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "parses type alias",
			program: strings.Join(
				[]string{
					"alias X = struct {",
					"    int a,",
					"    int b,",
					"}",
					"void main() {",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"%.type.X = type {i32, i32}",
					"define void @main() {",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "custom types are defined",
			program: strings.Join(
				[]string{
					"alias myint = int",
					"myint main() {",
					"    return 3",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"%.type.myint = type i32",
					"define %.type.myint @main() {",
					"ret i32 3",
					"}",
				}, "\n",
			),
		},
		{
			name: "imports modules",
			program: strings.Join(
				[]string{
					"import \"../../samples/empty-main\" as x",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"declare i32 @puts(i8*)",
					"define void @.mod0.main() {",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "parses return statement with assignment",
			program: strings.Join(
				[]string{
					"int main() {",
					"    return 3 + 4",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"define i32 @main() {",
					"%.tmp0 = add i32 3, 4",
					"ret i32 %.tmp0",
					"}",
				}, "\n",
			),
		},
		{
			name: "does not import module twice",
			program: strings.Join(
				[]string{
					"import \"../../samples/empty-main\" as x",
					"import \"../../samples/empty-main\" as y",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"declare i32 @puts(i8*)",
					"define void @.mod0.main() {",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "does not import module twice",
			program: strings.Join(
				[]string{
					"import \"../../samples/empty-main\" as x",
					"void main() {",
					"    x.puts(\"test\")",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"@.str0 = constant [5 x i8] c\"test\\00\"",
					"declare i32 @puts(i8*)",
					"define void @.mod0.main() {",
					"ret void",
					"}",
					"define void @main() {",
					"%.tmp1 = getelementptr [5 x i8], [5 x i8]*@.str0, i64 0, i64 0",
					"%.tmp2 = call i32 (i8*) @puts(i8*%.tmp1)",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "can parse varargs",
			program: strings.Join(
				[]string{
					"extern int printf(str text, ...args)",
					"void main() {",
					"    printf(\"sample %d\", 4)",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"@.str0 = constant [10 x i8] c\"sample %d\\00\"",
					"declare i32 @printf(i8*,...)",
					"define void @main() {",
					"%.tmp0 = getelementptr [10 x i8], [10 x i8]*@.str0, i64 0, i64 0",
					"%.tmp1 = call i32 (i8*, ...) @printf(i8*%.tmp0, i32 4)",
					"ret void",
					"}",
				}, "\n",
			),
		},
		{
			name: "can use external fns",
			program: strings.Join(
				[]string{
					"import \"../../samples/fn-declaration\" as x",
					"int main() {",
					"    return x.add(1, 2)",
					"}",
				}, "\n",
			),
			expect: strings.Join(
				[]string{
					"define i32 @.mod0.add(i32 %.arg.a, i32 %.arg.b) {",
					"%a = alloca i32",
					"store i32 %.arg.a, i32* %a",

					"%b = alloca i32",
					"store i32 %.arg.b, i32* %b",

					"%.tmp1 = load i32, i32* %a",
					"%.tmp2 = load i32, i32* %b",
					"%.tmp3 = add i32 %.tmp1, %.tmp2",
					"ret i32 %.tmp3",
					"}",
					"define i32 @main() {",
					"%.tmp4 = call i32 (i32, i32) @.mod0.add(i32 1, i32 2)",
					"ret i32 %.tmp4",
					"}",
				}, "\n",
			),
		},
	}

	for i, tc := range tt {
		name := fmt.Sprintf("[%d] %s", i, tc.name)
		t.Run(name, func(t *testing.T) {
			ast, err := compile(tc.program)
			assert.NilError(t, err)

			scopes := compiler.BuildScopes("")
			llvmOut, err := compiler.ToLLVM(scopes, ast)
			assert.NilError(t, err)
			assert.DeepEqual(t, llvmOut, tc.expect)
		})
	}
}
