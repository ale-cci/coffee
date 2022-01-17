package compiler_test

import (
	"bytes"
	"fmt"
	"testing"

	"bitbucket.org/ale-cci/elk/pkg/compiler"
	"gotest.tools/v3/assert"
)

func TestTokenizer(t *testing.T) {
	t.Run("tokenize integer", func(t *testing.T) {
		prg := []byte("2")

		tokens, err := compiler.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []compiler.Token{{compiler.INT, "2", 1}})
	})

	t.Run("tokenize single quoted string", func(t *testing.T) {
		prg := []byte("\"string\"")

		tokens, err := compiler.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []compiler.Token{{compiler.STR, "\"string\"", 1}})
	})

	t.Run("tokenize sum of two numbers", func(t *testing.T) {
		prg := []byte("34 + 68")

		tokens, err := compiler.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []compiler.Token{
			{compiler.INT, "34", 1},
			{compiler.OP_PLUS, "+", 4},
			{compiler.INT, "68", 6},
		})
	})

	t.Run("should tokenize fn keyword", func(t *testing.T) {
		prg := []byte("void main() {}")

		tokens, err := compiler.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []compiler.Token{
			{compiler.T_VOID, "void", 1},
			{compiler.WORD, "main", 6},
			{compiler.LPAREN, "(", 10},
			{compiler.RPAREN, ")", 11},
			{compiler.LBRACKET, "{", 13},
			{compiler.RBRACKET, "}", 14},
		})
	})

	t.Run("should parse newlines", func(t *testing.T) {
		prg := []byte(`
		`)
		tokens, err := compiler.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []compiler.Token{
			{compiler.NL, "\n", 1},
		})
	})

	t.Run("parses decimal numbers", func(t *testing.T) {
		prg := []byte("2.7")
		tokens, err := compiler.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []compiler.Token{
			{compiler.DECIMAL, "2.7", 1},
		})
	})

	t.Run("should parse leading comment lines", func(t *testing.T) {
		prg := []byte("#!/usr/bin/env elk")
		tokens, err := compiler.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []compiler.Token{
			{compiler.COMMENT, "#!/usr/bin/env elk", 1},
		})
	})

	t.Run("should parse dot token", func(t *testing.T) {
		prg := []byte("os.print()")
		tokens, err := compiler.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []compiler.Token{
			{compiler.WORD, "os", 1},
			{compiler.DOT, ".", 3},
			{compiler.WORD, "print", 4},
			{compiler.LPAREN, "(", 9},
			{compiler.RPAREN, ")", 10},
		})
	})

	t.Run("should parse plus equal", func(t *testing.T) {
		prg := []byte("i=i-1")
		tokens, err := compiler.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []compiler.Token{
			{compiler.WORD, "i", 1},
			{compiler.OP_EQ, "=", 2},
			{compiler.WORD, "i", 3},
			{compiler.OP_MINUS, "-", 4},
			{compiler.INT, "1", 5},
		})
	})

	t.Run("should parse colons", func(t *testing.T) {
		prg := []byte(`for a := 0; a < 6; a += 1 {}`)
		tokens, err := compiler.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []compiler.Token{
			{compiler.KW_FOR, "for", 1},
			{compiler.WORD, "a", 5},
			{compiler.OP_COLONEQ, ":=", 7},
			{compiler.INT, "0", 10},
			{compiler.SEMICOLON, ";", 11},
			{compiler.WORD, "a", 13},
			{compiler.OP_LESS, "<", 15},
			{compiler.INT, "6", 17},
			{compiler.SEMICOLON, ";", 18},
			{compiler.WORD, "a", 20},
			{compiler.OP_PLUSEQ, "+=", 22},
			{compiler.INT, "1", 25},
			{compiler.LBRACKET, "{", 27},
			{compiler.RBRACKET, "}", 28},
		})
	})

	t.Run("should parse star operator", func(t *testing.T) {
		prg := []byte(`3 * 4`)
		tokens, err := compiler.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []compiler.Token{
			{compiler.INT, "3", 1},
			{compiler.OP_STAR, "*", 3},
			{compiler.INT, "4", 5},
		})
	})

	t.Run("should parse import keyword", func(t *testing.T) {
		prg := []byte(`import "sys" as os`)
		tokens, err := compiler.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []compiler.Token{
			{compiler.KW_IMPORT, "import", 1},
			{compiler.STR, "\"sys\"", 8},
			{compiler.KW_AS, "as", 14},
			{compiler.WORD, "os", 17},
		})
	})

	t.Run("should parse int type", func(t *testing.T) {
		prg := []byte("int")
		tokens, err := compiler.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []compiler.Token{
			{compiler.T_INT, "int", 1},
		})
	})

	t.Run("should parse comma token", func(t *testing.T) {
		prg := []byte(",")
		tokens, err := compiler.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []compiler.Token{
			{compiler.COMMA, ",", 1},
		})
	})

	t.Run("should parse if token", func(t *testing.T) {
		prg := []byte("if")
		tokens, err := compiler.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []compiler.Token{
			{compiler.KW_IF, "if", 1},
		})
	})

	t.Run("parses tokens correctly", func(t *testing.T) {
		tt := []struct {
			program string
			expects []compiler.Token
			name    string
		}{
			{
				program: "if",
				expects: []compiler.Token{{compiler.KW_IF, "if", 1}},
				name: "parses if token",
			},
			{
				program: "else",
				expects: []compiler.Token{{compiler.KW_ELSE, "else", 1}},
				name: "parses else token",
			},
			{
				program: "elif",
				expects: []compiler.Token{{compiler.KW_ELIF, "elif", 1}},
				name: "parses elif token",
			},
			{
				program: "true",
				expects: []compiler.Token{{compiler.KW_TRUE, "true", 1}},
				name: "parses true token",
			},
			{
				program: "false",
				expects: []compiler.Token{{compiler.KW_FALSE, "false", 1}},
				name: "parses false token",
			},
			{
				program: "/",
				expects: []compiler.Token{{compiler.OP_OVER, "/", 1}},
				name: "parses division token",
			},
			{
				program: "return",
				expects: []compiler.Token{{compiler.KW_RETURN, "return", 1}},
				name: "parses return primitive",
			},
			{
				program: "extern",
				expects: []compiler.Token{{compiler.KW_EXTERN, "extern", 1}},
				name: "parses extern primitive",
			},
			{
				program: ">",
				expects: []compiler.Token{{compiler.OP_GREATER, ">", 1}},
				name: "parses > token",
			},
			{
				program: ">=",
				expects: []compiler.Token{{compiler.OP_GREATER_EQ, ">=", 1}},
				name: "parses >= token",
			},
			{
				program: "<=",
				expects: []compiler.Token{{compiler.OP_LESS_EQ, "<=", 1}},
				name: "parses <= token",
			},
			{
				program: "==",
				expects: []compiler.Token{{compiler.OP_EQQ, "==", 1}},
				name: "parses == token",
			},
		}

		for i, tc := range tt {
			testName := fmt.Sprintf("[%d] %s", i, tc.name)
			t.Run(testName, func(t *testing.T) {
				tokens, err := compiler.Tokenize(bytes.NewReader([]byte(tc.program)))
				assert.NilError(t, err)
				assert.DeepEqual(t, tokens, tc.expects)
			})
		}
	})
}
