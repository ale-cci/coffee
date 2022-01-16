package compiler_test

import (
	"bytes"
	"fmt"
	"testing"

	"bitbucket.org/ale-cci/elk/pkg/compiler"
	"github.com/google/go-cmp/cmp/cmpopts"
	"gotest.tools/v3/assert"
)

func TestAssignable(t *testing.T) {
	tt := []struct {
		name    string
		program string
		expect  compiler.Assignable
	}{
		{
			name:    "parses addition",
			program: "3 + 4",
			expect: &compiler.Operator{
				Optype: compiler.OP_PLUS,
				Left:   compiler.NewInt("3"),
				Right:  compiler.NewInt("4"),
			},
		},
		{
			name:    "multiplication has precendence over sum",
			program: "3 + 4 * 5",
			expect: &compiler.Operator{
				Optype: compiler.OP_PLUS,
				Left:   compiler.NewInt("3"),
				Right: &compiler.Operator{
					Optype: compiler.OP_STAR,
					Left:   compiler.NewInt("4"),
					Right:  compiler.NewInt("5"),
				},
			},
		},
		{
			name:    "parses multiplication",
			program: "4 * 5 + 3",
			expect: &compiler.Operator{
				Optype: compiler.OP_PLUS,
				Left: &compiler.Operator{
					Optype: compiler.OP_STAR,
					Left:   compiler.NewInt("4"),
					Right:  compiler.NewInt("5"),
				},
				Right: compiler.NewInt("3"),
			},
		},
		{
			name:    "parses subtraction",
			program: "4 - 5 + 3",
			expect: &compiler.Operator{
				Optype: compiler.OP_PLUS,
				Left: &compiler.Operator{
					Optype: compiler.OP_MINUS,
					Left:   compiler.NewInt("4"),
					Right:  compiler.NewInt("5"),
				},
				Right: compiler.NewInt("3"),
			},
		},
		{
			name:    "subtraction is commutative",
			program: "4 + 5 - 3",
			expect: &compiler.Operator{
				Optype: compiler.OP_MINUS,
				Left: &compiler.Operator{
					Optype: compiler.OP_PLUS,
					Left:   compiler.NewInt("4"),
					Right:  compiler.NewInt("5"),
				},
				Right: compiler.NewInt("3"),
			},
		},
		{
			name:    "parses division",
			program: "4 + 5 / 3",
			expect: &compiler.Operator{
				Optype: compiler.OP_PLUS,
				Left:   compiler.NewInt("4"),
				Right: &compiler.Operator{
					Optype: compiler.OP_OVER,
					Left:   compiler.NewInt("5"),
					Right:  compiler.NewInt("3"),
				},
			},
		},
		{
			name:    "division has priority",
			program: "5 / 3 + 4",
			expect: &compiler.Operator{
				Optype: compiler.OP_PLUS,
				Left: &compiler.Operator{
					Optype: compiler.OP_OVER,
					Left:   compiler.NewInt("5"),
					Right:  compiler.NewInt("3"),
				},
				Right: compiler.NewInt("4"),
			},
		},
	}

	for i, tc := range tt {
		name := fmt.Sprintf("[%d] %s", i, tc.name)
		t.Run(name, func(t *testing.T) {
			tokens, err := compiler.Tokenize(
				bytes.NewReader([]byte(tc.program)),
			)
			assert.NilError(t, err)
			t.Logf("Tokens %q", tokens)
			p := compiler.NewTokenPeeker(tokens)
			vals, err := compiler.ParseAssignable(p)

			assert.NilError(t, err)
			assert.DeepEqual(t, vals, tc.expect, cmpopts.IgnoreUnexported(compiler.Operator{}, compiler.Number{}))
		})
	}
}
