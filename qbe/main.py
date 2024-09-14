import io
import collections
TOKEN_PRECEDENCE = {
    "and": 2,
    "or": 1,
}
NON_LEFT_ASSOCIATIVE = []

class Node:
    def __init__(self, op: str, left, right):
        self.op = op
        self.left = left
        self.right = right
    def __repr__(self):
        return f"<Node ({self.op}\n- {self.left}\n- {self.right}>"

class Token:
    NUMBER = "number"
    IDENT = "ident"
    OPERATOR = "operator"
    STRING = "string"
    EOF = "eof"
    NL = "nl"
    LINE_COMMENT = "line-comment"

    def __init__(self, kind, value, lineno, colno, filename):
        self.kind = kind
        self.value = value
        self.lineno = lineno
        self.colno = colno
        self.filename = filename

    def __repr__(self):
        return "<Token: %r %r %d:%d>" % (self.kind, self.value, self.lineno, self.colno)
    def __eq__(self, other):
        return self.kind == other.kind and self.value == other.value and self.lineno == other.lineno and self.colno == other.lineno and self.filename == other.filename


class Lexer:
    # single line comments
    # multiline comments
    # single line string
    # multiline string
    # single line char
    def __init__(self, fd, operators, keywords, filename, whitespaces=[' ' '\t']):
        self.fd = fd
        self._buffer = None
        self._operators = operators
        self._keywords = keywords
        self._filename = filename
        self._whitespaces = whitespaces

        self._lineno = 1
        self._colno = 0

    def _getchr(self):
        if self._buffer:
            value = self._buffer
            self._buffer = None
        else:
            value = self.fd.read(1).decode('utf-8')

        pos = {
            "lineno": self._lineno,
            "colno": self._colno,
        }
        self._colno += 1
        if value == '\n':
            self._lineno += 1
            self._colno = 0
        return value, pos

    def _peekchr(self):
        if self._buffer:
            value = self._buffer
            return value

        self._buffer = self.fd.read(1).decode('utf-8')
        return self._buffer

    def next(self):
        token = {
            "value": [],
            "type": None,
        }

        c, pos = self._getchr()
        while c in self._whitespaces:
            c, pos = self._getchr()

        if c == '':
            return Token(kind=Token.EOF, value='', filename=self._filename, **pos)

        if c == '\n':
            return Token(kind=Token.NL, value=c, filename=self._filename, **pos)

        # number parser
        elif'0' <= c <='9':
            while True:
                token["value"].append(c)
                c = self._peekchr()
                if not ('0' <= c <='9'):
                    break
                c, _ = self._getchr()

            value = "".join(token["value"])
            return Token(kind=Token.NUMBER, value=value, filename=self._filename, **pos)


        elif c =='_' or'a' <= c <='z' or'A' <= c <='Z':
            while True:
                token["value"].append(c)
                c = self._peekchr()
                if not (c =='_' or'a' <= c <='z' or'A' <= c <='Z' or'0' <= c <='9'):
                    break

                c, _ = self._getchr()
            return Token(kind=Token.IDENT, value="".join(token["value"]), filename=self._filename, **pos)

        elif operators := self._filter_operators(self._operators, c, 0):
            i = 1
            _filter = []

            while True:
                _filter.append(c)
                c = self._peekchr()
                operators = self._filter_operators(operators, c, i)
                if not operators:
                    break
                c, _ = self._getchr()

            key = "".join(_filter)
            if self._operators[key] == Token.LINE_COMMENT:
                while True:
                    c = self._peekchr()
                    if c != '\n':
                        self._getchr()
                        continue
                    else:
                        break
                return self.next()
            return Token(kind=self._operators[key], value=key, filename=self._filename, **pos)

        elif c == '"':
            # parse string
            _escape = False
            while True:
                token["value"].append(c)
                c, _ = self._getchr()
                if _escape and c == '"':
                    continue

                if c == '':
                    raise RuntimeError("Reached end of file while parsing string literal")

                if c == '"':
                    token["value"].append(c)
                    break
            return Token(kind=Token.STRING, value="".join(token["value"]), filename=self._filename, **pos)

        raise RuntimeError("Token not found %r" %c)

    def _filter_operators(self, operators, char, pos):
        records = {}
        for k, v in operators.items():
            if len(k) <= pos:
                continue
            if k[pos] == char:
                records[k] = v
        return records


class Grammar:
    def __init__(self):
        self.rules = {}
        self.start = "start"


GRAMMAR = b"""
start := "def";
one := a | b;
two := a b;
three := (a b) | c;
four := "test";
five := STRING; # comment
six[parser_callback] := xyz;
"""

def parse_main():
    pass

PARSER_CALLBACKS = {
    "parser_callback": parse_main,
}


def main(filename):
    g = gen_grammar(io.BytesIO(GRAMMAR), "grammar.bnf")
    # assume grammar is safely parsable

    fd = open(filename, 'rb')
    lex = Lexer(fd, {
        ">": Token.OPERATOR,
        "<": Token.OPERATOR,
        "<=": Token.OPERATOR,
        ">=": Token.OPERATOR,
        "(": Token.OPERATOR,
        ")": Token.OPERATOR,
        "->": Token.OPERATOR,
        ":": Token.OPERATOR,
    }, keywords=["if", "fn", "for", "else"], filename=filename)
    syntax_tree = gen_ast(g["start"], g, lex)


class AstNode:
    def __init__(self, callback, node_id, children):
        self.callback = callback
        self.node_id = node_id
        self.children = children



def gen_ast(rule_root, g, lex):
    pass




class ParseError(Exception):
    def __init__(self, token, msg):
        super().__init__(f"{token.filename}:{token.lineno}:{token.colno} - {msg}")
        pass

class GrammarRule:
    def __init__(self, name, callback, definition):
        self.name = name
        self.callback = callback
        self.definition = definition
    def __repr__(self):
        return "<Rule (%r) %r>" % (self.callback, self.definition)

def parse_rule_def(lexer, precedence):
    tokens = []
    while True:
        tok = lexer.next()
        if tok.kind == "eol" or tok.kind == "eof":
            break

        # add "and" for two consecutive ident tokens
        tokens.append(tok)

    leaves = [Token.IDENT, Token.STRING]
    output = shunting_yard(tokens, precedence, leaves)
    tree = build_tree(output, leaves)
    return tree



def build_tree(output, leaves, i=None):
    if i is None:
        i = len(output) -1

    if output[i].kind in leaves:
        return output[i], i -1

    op = output[i]
    left, i = build_tree(output, leaves, i - 1)
    right, i = build_tree(output, leaves, i)

    return Node(
        op=op,
        left=left,
        right=right,
    ), i

def shunting_yard(in_tokens, precedence, leaves=[Token.IDENT, Token.NUMBER]):
    def add_and(prev, curr):
        if prev.kind == curr.kind and curr.kind in leaves:
            return True
        if prev.kind in leaves and curr.kind == "lparen":
            return True
        if prev.kind == "rparen" and curr.kind in leaves:
            return True
        return False

    tokens = collections.deque()

    prev_token = None
    for t in in_tokens:
        if prev_token is not None and add_and(prev_token, t):
            tokens.append(Token(
                value='&',
                kind='and',
                lineno=t.lineno,
                colno=t.colno,
                filename=t.filename,
            ))
        tokens.append(t)
        prev_token = t

    output = []

    op_stack = collections.deque()
    while len(tokens):
        t = tokens.popleft()

        if t.kind in leaves:
            output.append(t)

        elif t.kind == "lparen":
            op_stack.append(t)

        elif t.kind == "rparen":
            while len(op_stack) and op_stack[-1].kind != "lparen":
                output.append(op_stack.pop())
            assert len(op_stack) and op_stack[-1].kind == "lparen"
            op_stack.pop()

        else:
            o1 = t
            o1_prec = precedence[t.kind]

            while len(op_stack) and op_stack[-1].kind != 'lparen' and (o1_prec < precedence[op_stack[-1].kind] or (o1_prec == precedence[op_stack[-1].kind] and op_stack[-1].kind not in NON_LEFT_ASSOCIATIVE)):
                o2 = op_stack.pop()
                output.append(o2)

            op_stack.append(o1)

    while len(op_stack):
        o = op_stack.pop()
        assert o.kind != "lparen"
        output.append(o)

    return list(output)

def gen_grammar(fd, filename):
    lex = Lexer(fd, {
        ":=": "def",
        "|": "or",
        "*": "many",
        "?": "opt",
        "(": "lparen",
        ")": "rparen",
        "[": "lsqparen",
        "]": "rsqparen",
        ";": "eol",
        "#": Token.LINE_COMMENT,
    }, keywords=[], filename=filename, whitespaces=[' ', '\n', '\t'])

    op_priority = {
        "or": 1,
        "and": 2,
    }

    rules = {}
    while True:
        rule_name = lex.next()
        if rule_name.kind == Token.EOF:
            break
        if rule_name.kind != Token.IDENT:
            raise ParseError(rule_name, f" Got unexpected token {rule_name.kind} while reading rule name")

        if rule_name.value in rules:
            raise ParseError(rule_name, f"{rule_name.value} already defined")

        eqq = lex.next()
        callback_value = None
        if eqq.kind == "lsqparen":
            cb_token = lex.next()
            if cb_token.kind != Token.IDENT:
                raise ParseError(cb_token, f"Got unexpected token {cb_token.kind}, expected ident")
            closed_paren = lex.next()
            callback_value = cb_token.value
            if closed_paren.kind != "rsqparen":
                raise ParseError(cb_token, f"Got unexpected token {cb_token.kind}, expected ]")
            eqq = lex.next()

        if eqq.kind != "def":
            raise ParseError(eqq, f"Got unexpected token {eqq.kind}, expected rule definition symbol")

        definition = parse_rule_def(lex, op_priority)
        rules[rule_name.value] = GrammarRule(rule_name.value, callback_value, definition)
    return rules

if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('filename')
    args = parser.parse_args()
    main(args.filename)
