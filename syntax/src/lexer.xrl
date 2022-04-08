Definitions.
D = [0-9]         %Digits
L = [A-Za-z]      %Letters
AL = [0-9A-Za-z]  %Alphanumeric
WS = (\n|\t|\"?"?|\\|\s)  %Whitespace
PUNCT = [/*-+~!@#$%^&*()-=_+[\]{}\|:""''<>?,./] %Punctuation

Rules.
\s                    :skip_token.

% Identifiers
[_A-Za-z]+[_0-9A-Za-z]*       :{token, {identifier,TokenLine,  TokenChars}}.

% Data types
{D}+                            :{token, {int,TokenLine,  TokenChars}}.
{D}+\.{D}*f?                    :{token, {float,TokenLine,  TokenChars}}.
{D}+\.{D}*e[+\-]?{D}+f?          :{token, {float,TokenLine,  TokenChars}}.
"({AL}|{WS}|{PUNCT})+"                            :{token, {string,TokenLine, TokenChars}}.
'{L}'                           :{token, {char,TokenLine, TokenChars}}.

% Operators
\+                              :{token, {operator,TokenLine, TokenChars}}.
\=                              :{token, {operator,TokenLine, TokenChars}}.
\-                              :{token, {operator,TokenLine, TokenChars}}.
\/                              :{token, {operator,TokenLine, TokenChars}}.
\*                              :{token, {operator,TokenLine, TokenChars}}.



% Keywords
% Include
#(include)                       :{token, {include,TokenLine, TokenChars}}.
<{L}+.?{L}*>                    :{token, {header,TokenLine, TokenChars}}.



Erlang code.
