package compiler_test

import (
	"bytes"
	"fmt"
	"testing"

	"bitbucket.org/ale-cci/elk/pkg/compiler"
	"gotest.tools/v3/assert"
)

func compile(prg string) (*compiler.AST, error) {
	tokens, err := compiler.Tokenize(bytes.NewReader([]byte(prg)))
	if err != nil {
		return nil, err
	}

	ast, err := compiler.Parse(tokens)
	return ast, err
}

func TestCompiler(t *testing.T) {

	t.Run("parses function statement", func(t *testing.T) {
		ast, err := compile(`
		void main() {
		}
		`)
		assert.NilError(t, err)

		assert.DeepEqual(t, ast, &[]compiler.Statement{
			&compiler.Function{
				Name:       "main",
				ReturnType: "void",
				Args:       []compiler.Argument{},
				Body:       []compiler.Expression{},
			},
		})
	})
	t.Run("parses function body", func(t *testing.T) {
		ast, err := compile(`
		int main() {
			a := 0
		}
		`)
		assert.NilError(t, err)
		assert.DeepEqual(t, ast, &[]compiler.Statement{
			&compiler.Function{
				Name:       "main",
				ReturnType: "int",
				Args:       []compiler.Argument{},
				Body: []compiler.Expression{
					compiler.Declaration{
						To: "a",
						Value: compiler.Number{
							Value: "0",
							Type:  "int",
						},
					},
				},
			},
		})
	})

	t.Run("fully parses expressions", func(t *testing.T) {
		expressions := []struct {
			name    string
			program string
			expect  compiler.Expression
		}{
			{
				name:    "parses the declaration expression",
				program: "b := 76",
				expect: compiler.Declaration{
					To: compiler.Var("b"),
					Value: compiler.Number{
						Value: "76",
						Type:  "int",
					},
				},
			},
			{
				name:    "parses assignment",
				program: "a = b",
				expect: compiler.Assignment{
					To:    compiler.Var("a"),
					Value: compiler.Var("b"),
				},
			},
			{
				name:    "parses funciton call",
				program: "a()",
				expect: &compiler.FnCall{
					Name:   compiler.Var("a"),
					Params: []compiler.Assignable{},
				},
			},
			{
				name:    "parases function parameters",
				program: "a(b, c, d)",
				expect: &compiler.FnCall{
					Name: compiler.Var("a"),
					Params: []compiler.Assignable{
						compiler.Var("b"),
						compiler.Var("c"),
						compiler.Var("d"),
					},
				},
			},
			{
				name:    "parses nested function calls",
				program: "a(b(c))",
				expect: &compiler.FnCall{
					Name: compiler.Var("a"),
					Params: []compiler.Assignable{
						&compiler.FnCall{
							Name: compiler.Var("b"),
							Params: []compiler.Assignable{
								compiler.Var("c"),
							},
						},
					},
				},
			},
		}

		for i, tc := range expressions {
			tcName := fmt.Sprintf("[%d] %s", i, tc.name)
			t.Run(tcName, func(t *testing.T) {
				tokens, err := compiler.Tokenize(bytes.NewReader([]byte(tc.program)))
				assert.NilError(t, err)

				t.Logf("Tokens %q", tokens)
				p := compiler.NewTokenPeeker(tokens)
				exprs, err := compiler.ParseExpression(p)
				assert.NilError(t, err)
				assert.DeepEqual(t, exprs, tc.expect)
			})
		}
	})
}

func TestParseAssignable(t *testing.T) {
	tt := []struct {
		name    string
		program string
		expect  compiler.Assignable
	}{
		{
			name:    "should parse string",
			program: "\"test\"",
			expect:  compiler.String("test"),
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
			assert.DeepEqual(t, vals, tc.expect)
		})
	}
}
