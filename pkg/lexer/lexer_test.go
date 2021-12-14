package lexer_test

import (
	"bytes"
	"testing"

	"bitbucket.org/ale-cci/elk/pkg/lexer"
	"gotest.tools/v3/assert"
)

func TestTokenizer(t *testing.T) {
	t.Run("tokenize integer", func(t *testing.T) {
		prg := []byte("2")

		tokens, err := lexer.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []lexer.Token{{lexer.INT, "2", 1}})
	})

	t.Run("tokenize single quoted string", func(t *testing.T) {
		prg := []byte("\"string\"")

		tokens, err := lexer.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []lexer.Token{{lexer.STR, "\"string\"", 1}})
	})

	t.Run("tokenize sum of two numbers", func(t *testing.T) {
		prg := []byte("34 + 68")

		tokens, err := lexer.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []lexer.Token{
			{lexer.INT, "34", 1},
			{lexer.OP_PLUS, "+", 4},
			{lexer.INT, "68", 6},
		})
	})

	t.Run("should tokenize fn keyword", func(t *testing.T) {
		prg := []byte("void main() {}")

		tokens, err := lexer.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []lexer.Token{
			{lexer.T_VOID, "void", 1},
			{lexer.WORD, "main", 6},
			{lexer.LPAREN, "(", 10},
			{lexer.RPAREN, ")", 11},
			{lexer.LBRACKET, "{", 13},
			{lexer.RBRACKET, "}", 14},
		})
	})

	t.Run("should parse newlines", func(t *testing.T) {
		prg := []byte(`
		`)
		tokens, err := lexer.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []lexer.Token{
			{lexer.NL, "\n", 1},
		})
	})

	t.Run("parses decimal numbers", func(t *testing.T) {
		prg := []byte("2.7")
		tokens, err := lexer.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []lexer.Token{
			{lexer.DECIMAL, "2.7", 1},
		})
	})

	t.Run("should parse leading comment lines", func(t *testing.T) {
		prg := []byte("#!/usr/bin/env elk")
		tokens, err := lexer.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []lexer.Token{
			{lexer.COMMENT, "#!/usr/bin/env elk", 1},
		})
	})

	t.Run("should parse dot token", func(t *testing.T) {
		prg := []byte("os.print()")
		tokens, err := lexer.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []lexer.Token{
			{lexer.WORD, "os", 1},
			{lexer.DOT, ".", 3},
			{lexer.WORD, "print", 4},
			{lexer.LPAREN, "(", 9},
			{lexer.RPAREN, ")", 10},
		})
	})

	t.Run("should parse plus equal", func(t *testing.T) {
		prg := []byte("i=i-1")
		tokens, err := lexer.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []lexer.Token{
			{lexer.WORD, "i", 1},
			{lexer.OP_EQ, "=", 2},
			{lexer.WORD, "i", 3},
			{lexer.OP_MINUS, "-", 4},
			{lexer.INT, "1", 5},
		})
	})

	t.Run("should parse colons", func(t *testing.T) {
		prg := []byte(`for a := 0; a < 6; a += 1 {}`)
		tokens, err := lexer.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []lexer.Token{
			{lexer.KW_FOR, "for", 1},
			{lexer.WORD, "a", 5},
			{lexer.OP_COLONEQ, ":=", 7},
			{lexer.INT, "0", 10},
			{lexer.SEMICOLON, ";", 11},
			{lexer.WORD, "a", 13},
			{lexer.OP_LESS, "<", 15},
			{lexer.INT, "6", 17},
			{lexer.SEMICOLON, ";", 18},
			{lexer.WORD, "a", 20},
			{lexer.OP_PLUSEQ, "+=", 22},
			{lexer.INT, "1", 25},
			{lexer.LBRACKET, "{", 27},
			{lexer.RBRACKET, "}", 28},
		})
	})

	t.Run("should parse star operator", func (t *testing.T) {
		prg := []byte(`3 * 4`)
		tokens, err := lexer.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []lexer.Token{
			{lexer.INT, "3", 1},
			{lexer.OP_STAR, "*", 3},
			{lexer.INT, "4", 5},
		})
	})

	t.Run("should parse import keyword", func(t *testing.T) {
		prg := []byte(`import "sys" as os`)
		tokens, err := lexer.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []lexer.Token{
			{lexer.KW_IMPORT, "import", 1},
			{lexer.STR, "\"sys\"", 8},
			{lexer.KW_AS, "as", 14},
			{lexer.WORD, "os", 17},
		})
	})

	t.Run("should parse int type", func(t *testing.T) {
		prg := []byte("int")
		tokens, err := lexer.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []lexer.Token{
			{lexer.T_INT, "int", 1},
		})
	})
}

