package lexer

import (
	"bytes"
	"fmt"
	"unicode"
)

type TokenType int64

const (
	INT TokenType = iota
	STR
	OP_PLUS
	KW_FN
	WORD
	LPAREN
	RPAREN
	LBRACKET
	RBRACKET
)

type Token struct {
	Type     TokenType
	Value    string
	Position int64
}

func Tokenize(stream *bytes.Reader) ([]Token, error) {
	tokens := []Token{}
	keywords := map[string]TokenType {
		"fn": KW_FN,
	}
	special_chars := map[string]TokenType {
		"+": OP_PLUS,
		"(": LPAREN,
		")": RPAREN,
		"{": LBRACKET,
		"}": RBRACKET,
	}

	for {
		c, _, err := stream.ReadRune()
		pos, _ := stream.Seek(0, 1)
		fmt.Printf("Pos: %d", pos)

		if err != nil {
			// end of parsing
			break
		}

		if unicode.IsDigit(c) {
			rest := readWhile(stream, unicode.IsDigit)
			tokens = append(tokens, Token{INT, string(c) + rest, pos})
		} else if c == '\'' {
			content := readUntil(stream, func(c rune) bool {
				return c != '\''
			})
			tokens = append(tokens, Token{STR, string(c) + content, pos})
		} else if typ, ok := special_chars[string(c)]; ok {
			tokens = append(tokens, Token{typ, string(c), pos})

		} else if unicode.IsLetter(c) {
			content := readWhile(stream, unicode.IsLetter)
			name := string(c) + content

			if typ, ok := keywords[name]; ok {
				tokens = append(tokens, Token{typ, name, pos})
			} else {
				tokens = append(tokens, Token{WORD, name, pos})
			}
		}
	}
	return tokens, nil
}

func readUntil(stream *bytes.Reader, cond func(rune) bool) string {
	str := ""
	for {
		val, _, err := stream.ReadRune()
		if err != nil {
			stream.UnreadRune()
			break
		}
		str += string(val)
		if !cond(val) {
			break
		}
	}

	return str
}

func readWhile(stream *bytes.Reader, cond func(rune) bool) string {
	str := ""
	for {
		val, _, err := stream.ReadRune()
		if err != nil || !cond(val) {
			// something bad just happened bailing out
			stream.UnreadRune()
			break
		}

		str += string(val)
	}
	return str
}
