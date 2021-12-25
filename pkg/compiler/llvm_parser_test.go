package compiler_test

import (
	"fmt"
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
				"br label .if.end.1\n",
				".if.false.1:\n",
				"br label .if.end.1\n",
				".if.end.1:\n",
				"}",
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
