package compiler_test

import (
	"bytes"
	"testing"

	"bitbucket.org/ale-cci/elk/pkg/compiler"
	"gotest.tools/v3/assert"
)

func TestCompiler(t *testing.T) {
	t.Run("parses function statement", func(t *testing.T) {
		prg := []byte(`
		void main() {
		}
		`)
		tokens, err := compiler.Tokenize(bytes.NewReader(prg))
		assert.NilError(t, err)

		fn := compiler.Function{}
		newErr := fn.Parse(tokens)
		assert.NilError(t, newErr)

		assert.DeepEqual(t, fn.Body, []compiler.Statement{})
		assert.Equal(t, fn.Name, "main")
		assert.DeepEqual(t, fn.Args, []compiler.Argument{})
	})

}
