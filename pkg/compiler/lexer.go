package compiler

import (
	"bytes"
	"unicode"
)

type TokenType int64

const (
	INT TokenType = iota // integer numbers
	STR
	DECIMAL
	TYPE
	OP_STAR
	OP_PLUS
	OP_MINUS
	OP_OVER
	OP_EQ
	OP_COLONEQ
	OP_PLUSEQ
	OP_LESS
	OP_EQQ
	OP_GREATER
	OP_GREATER_EQ
	OP_LESS_EQ
	KW_FOR
	KW_RETURN
	KW_IMPORT
	KW_AS
	KW_TRUE
	KW_FALSE
	KW_IF
	KW_ELSE
	KW_ELIF
	KW_EXTERN
	WORD
	SEMICOLON
	LPAREN
	RPAREN
	LBRACKET
	RBRACKET
	NL // newline token
	COMMENT
	DOT
	T_VOID
	COMMA
	T_INT
)

type Token struct {
	Type     TokenType
	Value    string
	Position int64
}

func Tokenize(stream *bytes.Reader) ([]Token, error) {
	tokens := []Token{}
	keywords := map[string]TokenType{
		"for":    KW_FOR,
		"import": KW_IMPORT,
		"as":     KW_AS,
		"if":     KW_IF,
		"true":   KW_TRUE,
		"false":  KW_FALSE,
		"elif":   KW_ELIF,
		"else":   KW_ELSE,
		"return": KW_RETURN,
		"extern": KW_EXTERN,

		"void": T_VOID,
		"int":  T_INT,
	}
	special_chars := map[string]TokenType{
		"+":  OP_PLUS,
		"-":  OP_MINUS,
		"*":  OP_STAR,
		"/":  OP_OVER,
		",":  COMMA,
		"(":  LPAREN,
		")":  RPAREN,
		"{":  LBRACKET,
		"}":  RBRACKET,
		".":  DOT,
		";":  SEMICOLON,
		"\n": NL,
	}

	for {
		c, _, err := stream.ReadRune()
		pos, _ := stream.Seek(0, 1)

		if err != nil {
			// end of parsing
			break
		}

		if unicode.IsDigit(c) {
			rest := readWhile(stream, unicode.IsDigit)
			nextChr, _, err := stream.ReadRune()
			if err == nil && nextChr == '.' {
				rest += string(nextChr)
				rest += readWhile(stream, unicode.IsDigit)
				tokens = append(tokens, Token{DECIMAL, string(c) + rest, pos})
			} else {
				stream.UnreadRune()
				tokens = append(tokens, Token{INT, string(c) + rest, pos})
			}
		} else if c == '"' {
			content := readUntil(stream, func(c rune) bool {
				return c != '"'
			})
			tokens = append(tokens, Token{STR, string(c) + content, pos})
		} else if c == ':' {
			nextChr, _, err := stream.ReadRune()
			if err == nil && nextChr == '=' {
				tokens = append(tokens, Token{OP_COLONEQ, ":=", pos})
			} else {
				stream.UnreadRune()
			}
		} else if c == '+' {
			next, _, err := stream.ReadRune()
			if next == '=' && err == nil {
				tokens = append(tokens, Token{OP_PLUSEQ, "+=", pos})
			} else {
				stream.UnreadRune()
				tokens = append(tokens, Token{OP_PLUS, string(c), pos})
			}
		} else if c == '>' {
			next, _, err := stream.ReadRune()
			if next == '=' && err == nil {
				tokens = append(tokens, Token{OP_GREATER_EQ, ">=", pos})
			} else {
				stream.UnreadRune()
				tokens = append(tokens, Token{OP_GREATER, string(c), pos})
			}
		} else if c == '<' {
			next, _, err := stream.ReadRune()
			if next == '=' && err == nil {
				tokens = append(tokens, Token{OP_LESS_EQ, "<=", pos})
			} else {
				stream.UnreadRune()
				tokens = append(tokens, Token{OP_LESS, string(c), pos})
			}
		} else if c == '=' {
			next, _, err := stream.ReadRune()
			if next == '=' && err == nil {
				tokens = append(tokens, Token{OP_EQQ, "==", pos})
			} else {
				stream.UnreadRune()
				tokens = append(tokens, Token{OP_EQ, string(c), pos})
			}
		} else if c == '#' {
			content := readUntil(stream, func(c rune) bool { return c != '\n' })
			tokens = append(tokens, Token{COMMENT, string(c) + content, pos})
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
