package compiler

import (
	"bytes"
	"fmt"
	"unicode"
	"strconv"
)

type TokenType int64

const (
	INT TokenType = iota // integer numbers
	STR
	CHAR
	DECIMAL
	TYPE
	OP_STAR
	OP_PLUS
	OP_MINUS
	OP_OVER
	OP_EQ
	OP_NOT
	OP_COLONEQ
	OP_PLUSEQ
	OP_LESS
	OP_EQQ
	OP_GREATER
	OP_GREATER_EQ
	OP_BIN_OR
	OP_BIN_AND
	OP_AND
	OP_OR
	OP_NE
	OP_LESS_EQ
	KW_ALIAS
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
	KW_STRUCT
	WORD
	SEMICOLON
	LPAREN
	RPAREN
	LBRACKET
	RBRACKET
	LSBRACKET
	RSBRACKET
	NL // newline token
	COMMENT
	DOT
	T_VOID
	COMMA
	T_INT
	T_CHAR
	VARARG
	NULL
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
		"struct": KW_STRUCT,
		"alias":  KW_ALIAS,
		"null": NULL,

		"void": T_VOID,
		"int":  T_INT,
		"chr":  T_CHAR,
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
		"[":  LSBRACKET,
		"]":  RSBRACKET,
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
		} else if c == '!' {
			next, _, err := stream.ReadRune()
			if next == '=' && err == nil {
				tokens = append(tokens, Token{OP_NE, "!=", pos})
			} else {
				stream.UnreadRune()
				tokens = append(tokens, Token{OP_NOT, string(c), pos})
			}
		} else if c == '+' {
			next, _, err := stream.ReadRune()
			if next == '=' && err == nil {
				tokens = append(tokens, Token{OP_PLUSEQ, "+=", pos})
			} else {
				stream.UnreadRune()
				tokens = append(tokens, Token{OP_PLUS, string(c), pos})
			}
		} else if c == '\'' {
			next, _, err := stream.ReadRune()

			val := ""
			if next == '\\' && err == nil {
				// parse two decimal numbers
				d1, _, err := stream.ReadRune()
				if err != nil {
					return nil, &ParseError{
						Pos: pos,
						error: fmt.Sprintf("Found invalid syntax while parsing character: expecting digit, found: %q", d1),
					}
				}
				d2, _, err := stream.ReadRune()
				if err != nil {
					return nil, &ParseError{
						Pos: pos,
						error: fmt.Sprintf("Found invalid syntax while parsing character: expecting digit, found: %q", d2),
					}
				}

				repr := string(d1) + string(d2)
				intval, err := strconv.ParseUint(repr, 16, 8)
				if err != nil {
					return nil, &ParseError{
						Pos: pos,
						error: fmt.Sprintf("Unable to retrieve int value for char: %#v", repr),
					}
				}
				val = fmt.Sprintf("%d", intval)
			} else {
				val = fmt.Sprintf("%d", int(next))
			}

			r, _, err := stream.ReadRune()

			if r != '\'' || err != nil {
				return nil, &ParseError{
					Pos: pos,
					error: fmt.Sprintf("Found invalid syntax while parsing character: expecting ', found: %q", r),
				}
			}

			tokens = append(tokens, Token{CHAR, val, pos})
		} else if c == '.' {
			next, _, err := stream.ReadRune()
			if next == '.' && err == nil {
				if r, _, err := stream.ReadRune(); err != nil || r != '.' {
					return nil, &ParseError{
						Pos: pos,
						error: fmt.Sprintf("Invalid syntax for '..')"),
					}
				}

				tokens = append(tokens, Token{VARARG, "...", pos})
			} else {
				stream.UnreadRune()
				tokens = append(tokens, Token{DOT, string(c), pos})
			}
		} else if c == '&' {
			next, _, err := stream.ReadRune()
			if next == '&' && err == nil {
				tokens = append(tokens, Token{OP_AND, "&&", pos})
			} else {
				stream.UnreadRune()
				tokens = append(tokens, Token{OP_BIN_AND, string(c), pos})
			}
		} else if c == '|' {
			next, _, err := stream.ReadRune()
			if next == '|' && err == nil {
				tokens = append(tokens, Token{OP_OR, "||", pos})
			} else {
				stream.UnreadRune()
				tokens = append(tokens, Token{OP_BIN_OR, string(c), pos})
			}
		} else if c == '-' {
			next, _, err := stream.ReadRune()
			if next == '-' && err == nil {
				rest := readUntil(stream, func(c rune) bool { return c != '\n' })
				stream.UnreadRune()
				if len(rest) > 0 && rest[len(rest)-1] == '\n' {
					rest = rest[:len(rest)-1]
				}
				tokens = append(tokens, Token{COMMENT, "--" + rest, pos})
			} else {
				stream.UnreadRune()
				tokens = append(tokens, Token{OP_MINUS, string(c), pos})
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
		} else if unicode.IsLetter(c) || c == '_' {
			content := readWhile(stream, func(c rune) bool {
				return unicode.IsLetter(c) || unicode.IsDigit(c) || c == '_'
			})
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
