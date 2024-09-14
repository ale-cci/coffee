from main import shunting_yard, Token, TOKEN_PRECEDENCE, Node
from main import build_tree
import unittest


class TestSample(unittest.TestCase):
    def test_first(self):
        output = shunting_yard(
            [
                Token(value='a', kind='ident', lineno=0, colno=0, filename='x'),
            ],
            TOKEN_PRECEDENCE
        )

        self.assertEqual(output, [
            Token(value='a', kind='ident', lineno=0, colno=0, filename='x'),
        ])


    def test_second(self):
        output = shunting_yard(
            [
                Token(value='a', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value='b', kind='ident', lineno=0, colno=0, filename='x'),
            ],
            TOKEN_PRECEDENCE
        )

        self.assertEqual(
            output,
            [
                Token(value='a', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value='b', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value='&', kind='and', lineno=0, colno=0, filename='x'),
            ],
        )

    def test_precedence(self):
        output = shunting_yard(
            [
                Token(value='a', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value='|', kind='or', lineno=0, colno=0, filename='x'),
                Token(value='b', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value='c', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value='|', kind='or', lineno=0, colno=0, filename='x'),
                Token(value='d', kind='ident', lineno=0, colno=0, filename='x'),
            ],
            TOKEN_PRECEDENCE
        )
        self.assertEqual(
            output,
            [
                Token(value='a', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value='b', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value='c', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value='&', kind='and', lineno=0, colno=0, filename='x'),
                Token(value='|', kind='or', lineno=0, colno=0, filename='x'),
                Token(value='d', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value='|', kind='or', lineno=0, colno=0, filename='x'),
            ]
        )

    def test_paren(self):
        output = shunting_yard(
            [
                Token(value='a', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value='(', kind='lparen', lineno=0, colno=0, filename='x'),
                Token(value='b', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value='|', kind='or', lineno=0, colno=0, filename='x'),
                Token(value='c', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value=')', kind='rparen', lineno=0, colno=0, filename='x'),
                Token(value='d', kind='ident', lineno=0, colno=0, filename='x'),
            ],
            TOKEN_PRECEDENCE
        )
        tree, _ = build_tree(output, [Token.IDENT])

        self.assertEqual(
            output,
            [
                Token(value='a', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value='b', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value='c', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value='|', kind='or', lineno=0, colno=0, filename='x'),
                Token(value='&', kind='and', lineno=0, colno=0, filename='x'),
                Token(value='d', kind='ident', lineno=0, colno=0, filename='x'),
                Token(value='&', kind='and', lineno=0, colno=0, filename='x'),
            ]
        )


if __name__ == '__main__':
    unittest.main()
