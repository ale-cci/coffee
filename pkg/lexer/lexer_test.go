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
		prg := []byte("'string'")

		tokens, err := lexer.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []lexer.Token{{lexer.STR, "'string'", 1}})
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
		prg := []byte("fn main() {}")

		tokens, err := lexer.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)
		assert.DeepEqual(t, tokens, []lexer.Token{
			{lexer.KW_FN, "fn", 1},
			{lexer.WORD, "main", 4},
			{lexer.LPAREN, "(", 8},
			{lexer.RPAREN, ")", 9},
			{lexer.LBRACKET, "{", 11},
			{lexer.RBRACKET, "}", 12},
		})
	})
}
