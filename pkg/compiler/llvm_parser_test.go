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
				"call i32 @puts(i8*%.tmp0)\n",
				"ret i32 0\n",
				"}",
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
					"call i32 @puts(i8*%.tmp2)",
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
					"call i32 @puts(i8*%.tmp2)",
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
	}

	for i, tc := range tt {
		name := fmt.Sprintf("[%d] %s", i, tc.name)
		t.Run(name, func(t *testing.T) {
			ast, err := compile(tc.program)
			assert.NilError(t, err)

			llvmOut, err := compiler.ToLLVM(ast)
			assert.NilError(t, err)
			assert.DeepEqual(t, llvmOut, tc.expect)
		})
	}
}
