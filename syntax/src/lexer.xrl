Definitions.
D = [0-9]
LE = [A-Za-z]
AL = [0-9A-Za-z]
WS = (\n|\t|\"?"?|\\|\s)
PUNCT = [/*-+~!@#$%^&*()-=_+[\]{}\|:""''<>?,./]

Rules.
\s                    :skip_token.

% Notas
% Si dos string coinciden con el patron de la regex, toma el que este mas arriba


% Data types
% Keyword
int                             :{token, {data_type,  TokenChars}}.
float                           :{token, {data_type,  TokenChars}}.
string                          :{token, {data_type,  TokenChars}}.
bool                            :{token, {data_type,  TokenChars}}.
char                            :{token, {data_type,  TokenChars}}.
double                          :{token, {data_type,  TokenChars}}.
bool                            :{token, {data_type,  TokenChars}}.
% Values
{D}+                            :{token, {int,  TokenChars}}.
{D}+\.{D}*f?                    :{token, {float,  TokenChars}}.
{D}+\.{D}*e[+\-]?{D}+f?         :{token, {float,  TokenChars}}.
"({AL}|{WS}|{PUNCT})+"          :{token, {data, TokenChars}}.
'{L}'                           :{token, {data, TokenChars}}.


% Operators
% Asignment
\=                              :{token, {assign, TokenChars}}.
\+=                             :{token, {assign, TokenChars}}.
\-=                             :{token, {assign, TokenChars}}.
\/=                             :{token, {assign, TokenChars}}.
\*=                             :{token, {assign, TokenChars}}.
\%=                             :{token, {assign, TokenChars}}.
% Arithmetic
\+                              :{token, {operator, TokenChars}}.
\-                              :{token, {operator, TokenChars}}.
\/                              :{token, {operator, TokenChars}}.
\*                              :{token, {operator, TokenChars}}.
\%                              :{token, {operator, TokenChars}}.
\+\+                            :{token, {operator, TokenChars}}.
\-\-                            :{token, {operator, TokenChars}}.
% Relational
==                              :{token, {relation, TokenChars}}.
!=                              :{token, {relation, TokenChars}}.
<                               :{token, {relation, TokenChars}}.
>                               :{token, {relation, TokenChars}}.
<=                              :{token, {relation, TokenChars}}.
>=                              :{token, {relation, TokenChars}}.
% Logical
&&                              :{token, {logical, TokenChars}}.
\|\|                            :{token, {logical, TokenChars}}.
!                               :{token, {logical, TokenChars}}.
[\(\)]                          :{token, {logical, TokenChars}}.



% Keywords
% Include
#(include)                      :{token, {include, TokenChars}}.
<{LE}+.?{LE}*>                    :{token, {header, TokenChars}}.


% Identifiers
[_A-Za-z]+[_0-9A-Za-z]*         :{token, {identifier,  TokenChars}}.




% Pruebas de Angel
hola                          :{token, {titlePrueba,  TokenChars}}.

Erlang code.



% Run this file in iex -S mix
% :lexer.string 'ab'