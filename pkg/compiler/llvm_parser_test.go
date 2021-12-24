package compiler_test

import (
	"fmt"
	"testing"

	"bitbucket.org/ale-cci/elk/pkg/compiler"
	"gotest.tools/v3/assert"
)

func TestParsing(t *testing.T) {
	tt := []struct {
		name string
		program string
		expect string
	}{
		{
			name: "parses empty main",
			program: "int main() { return 0 }",
			expect: fmt.Sprint(
				"define i32 @main() {\n",
					"ret i32 0\n",
				"}",
			),
		},
		{
			name: "parses main return value",
			program: "int main() { return 1 }",
			expect: fmt.Sprint(
				"define i32 @main() {\n",
					"ret i32 1\n",
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
