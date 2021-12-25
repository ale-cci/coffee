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

func TestFunctionParser(t *testing.T) {
	tt := []struct {
		name    string
		program string
		expect  *compiler.Function
	}{
		{
			name:    "parses function statement",
			program: "void main() { }",
			expect: &compiler.Function{
				Name:       "main",
				ReturnType: "void",
				Args:       []compiler.Argument{},
				Body:       []compiler.Expression{},
			},
		},
		{
			name: "parses if-else case inside block",
			program: `void main() {
				if true {
				}
			}
			`,
			expect: &compiler.Function{
				Name:       "main",
				ReturnType: "void",
				Args:       []compiler.Argument{},
				Body: []compiler.Expression{
					&compiler.IfElseBlock{
						Condition: &compiler.Boolean{Value: "true"},
						Body:      []compiler.Expression{},
						Else:      nil,
					},
				},
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
			vals, err := compiler.ParseFunction(p)

			assert.NilError(t, err)
			assert.DeepEqual(t, vals, tc.expect)
		})
	}
}

func TestCompiler(t *testing.T) {
	t.Run("test compile full program to ast", func(t *testing.T) {
		tt := []struct {
			name    string
			program string
			expect  *compiler.AST
		}{
			{
				name:    "Parses extern declaration",
				program: "extern int puts()",
				expect: &compiler.AST{
					&compiler.ExternFunc{
						Name:       "puts",
						ReturnType: "int",
						Args:       []compiler.Argument{},
					},
				},
			},
		}
		for i, tc := range tt {
			testName := fmt.Sprintf("[%d] %s", i, tc.name)
			t.Run(testName, func(t *testing.T) {
				ast, err := compile(tc.program)
				assert.NilError(t, err)
				assert.DeepEqual(t, ast, tc.expect)
			})
		}
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
			{
				name:    "parses return call",
				program: "return 3",
				expect: &compiler.Return{
					compiler.Number{"3", "int"},
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
			expect:  &compiler.String{Value: "test"},
		},
		{
			name:    "should parse false",
			program: "false",
			expect:  &compiler.Boolean{Value: "false"},
		},
		{
			name:    "parses addition",
			program: "3 + 4",
			expect: compiler.Sum{
				Left:  compiler.Number{Value: "3", Type: "int"},
				Right: compiler.Number{Value: "4", Type: "int"},
			},
		},
		{
			name:    "multiplication has precendence over sum",
			program: "3 + 4 * 5",
			expect: compiler.Sum{
				Left: compiler.Number{Value: "3", Type: "int"},
				Right: compiler.OpTimes{
					Left:  compiler.Number{Value: "4", Type: "int"},
					Right: compiler.Number{Value: "5", Type: "int"},
				},
			},
		},
		{
			name:    "parses multiplication",
			program: "4 * 5 + 3",
			expect: compiler.Sum{
				Left: compiler.OpTimes{
					Left:  compiler.Number{Value: "4", Type: "int"},
					Right: compiler.Number{Value: "5", Type: "int"},
				},
				Right: compiler.Number{Value: "3", Type: "int"},
			},
		},
		{
			name:    "parses subtraction",
			program: "4 - 5 + 3",
			expect: compiler.Sum{
				Left: compiler.OpMinus{
					Left:  compiler.Number{"4", "int"},
					Right: compiler.Number{"5", "int"},
				},
				Right: compiler.Number{"3", "int"},
			},
		},
		{
			name:    "subtraction is commutative",
			program: "4 + 5 - 3",
			expect: compiler.OpMinus{
				Left: compiler.Sum{
					Left:  compiler.Number{"4", "int"},
					Right: compiler.Number{"5", "int"},
				},
				Right: compiler.Number{"3", "int"},
			},
		},
		{
			name:    "parses division",
			program: "4 + 5 / 3",
			expect: compiler.Sum{
				Left: compiler.Number{"4", "int"},
				Right: compiler.OpOver{
					Left:  compiler.Number{"5", "int"},
					Right: compiler.Number{"3", "int"},
				},
			},
		},
		{
			name:    "division has priority",
			program: "5 / 3 + 4",
			expect: compiler.Sum{
				Left: compiler.OpOver{
					Left:  compiler.Number{"5", "int"},
					Right: compiler.Number{"3", "int"},
				},
				Right: compiler.Number{"4", "int"},
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
			assert.DeepEqual(t, vals, tc.expect)
		})
	}
}
