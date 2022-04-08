Definitions.
D = [0-9]
LE = [A-Za-z]
AL = [0-9A-Za-z]
WS = (\n|\t|\"?"?|\\|\s)
PUNCT = [/*-+~!@#$%^&*()-=_+[\]{}\|:""''<>?,./]

Rules.
\s                    :skip_token.


% Data types
% Keyword
int                             :{token, {data_type,TokenLine,  TokenChars}}.
float                           :{token, {data_type,TokenLine,  TokenChars}}.
string                          :{token, {data_type,TokenLine,  TokenChars}}.
bool                            :{token, {data_type,TokenLine,  TokenChars}}.
char                            :{token, {data_type,TokenLine,  TokenChars}}.
double                          :{token, {data_type,TokenLine,  TokenChars}}.
bool                            :{token, {data_type,TokenLine,  TokenChars}}.
% Values
{D}+                            :{token, {int,TokenLine,  TokenChars}}.
{D}+\.{D}*f?                    :{token, {float,TokenLine,  TokenChars}}.
{D}+\.{D}*e[+\-]?{D}+f?         :{token, {float,TokenLine,  TokenChars}}.
"({AL}|{WS}|{PUNCT})+"          :{token, {string,TokenLine, TokenChars}}.
'{L}'                           :{token, {char,TokenLine, TokenChars}}.


% Operators
% Asignment
\=                              :{token, {assign,TokenLine, TokenChars}}.
\+=                             :{token, {assign,TokenLine, TokenChars}}.
\-=                             :{token, {assign,TokenLine, TokenChars}}.
\/=                             :{token, {assign,TokenLine, TokenChars}}.
\*=                             :{token, {assign,TokenLine, TokenChars}}.
\%=                             :{token, {assign,TokenLine, TokenChars}}.
% Arithmetic
\+                              :{token, {operator,TokenLine, TokenChars}}.
\-                              :{token, {operator,TokenLine, TokenChars}}.
\/                              :{token, {operator,TokenLine, TokenChars}}.
\*                              :{token, {operator,TokenLine, TokenChars}}.
\%                              :{token, {operator,TokenLine, TokenChars}}.
\+\+                            :{token, {operator,TokenLine, TokenChars}}.
\-\-                            :{token, {operator,TokenLine, TokenChars}}.
% Relational
==                              :{token, {relation,TokenLine, TokenChars}}.
!=                              :{token, {relation,TokenLine, TokenChars}}.
<                               :{token, {relation,TokenLine, TokenChars}}.
>                               :{token, {relation,TokenLine, TokenChars}}.
<=                              :{token, {relation,TokenLine, TokenChars}}.
>=                              :{token, {relation,TokenLine, TokenChars}}.
% Logical
&&                              :{token, {logical,TokenLine, TokenChars}}.
\|\|                            :{token, {logical,TokenLine, TokenChars}}.
!                               :{token, {logical,TokenLine, TokenChars}}.
[\(\)]                          :{token, {parentheses,TokenLine, TokenChars}}.



% Keywords
% Include
#(include)                      :{token, {include,TokenLine, TokenChars}}.
<{L}+.?{L}*>                    :{token, {header,TokenLine, TokenChars}}.


% Identifiers
[_A-Za-z]+[_0-9A-Za-z]*         :{token, {identifier,TokenLine,  TokenChars}}.

Erlang code.



% Run this file in iex -S mix
% :lexer.string 'ab'