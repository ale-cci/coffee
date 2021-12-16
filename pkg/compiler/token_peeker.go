package compiler

type TokenPeeker struct {
	tokens []Token
	index  int
	end    int
}

func (t *TokenPeeker) PeekOne() *Token {
	if !t.HasTokens() {
		return nil
	}
	return &t.tokens[t.index]
}
func (t *TokenPeeker) PeekUntil(condition func(t *Token)bool) []*Token{
	prevIndex := t.index
	readTokens := []*Token{}

	for {
		tok := t.Read()
		if !condition(tok) {
			break
		}
		readTokens = append(readTokens, tok)
	}
	t.index = prevIndex
	return readTokens
}

func (t *TokenPeeker) Unread() {
	t.index -= 1
}

func (t *TokenPeeker) Read() *Token {
	if !t.HasTokens() {
		return nil
	}
	tok := t.tokens[t.index]
	t.index += 1
	return &tok
}

func (t *TokenPeeker) HasTokens() bool {
	return t.index != t.end
}

func NewTokenPeeker(tokens []Token) *TokenPeeker {
	realTokens := []Token{}
	for _, t := range tokens {
		if t.Type == COMMENT {
			continue
		}
		realTokens = append(realTokens, t)
	}

	return &TokenPeeker{
		tokens: realTokens,
		index:  0,
		end:    len(realTokens),
	}
}

