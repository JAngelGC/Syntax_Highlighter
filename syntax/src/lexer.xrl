Definitions.
D = [0-9]
L = [A-Za-z]
A = [0-9A-Za-z]

Rules.
\s                    :skip_token.

% Identifiers
[_A-Za-z]+[_0-9A-Za-z]*       :{token, {identifier,TokenLine,  TokenChars}}.

% Data types
{D}+                            :{token, {int,TokenLine,  TokenChars}}.
{D}+\.{D}*f?                    :{token, {float,TokenLine,  TokenChars}}.
{D}+.{D}*e[+\-]?{D}+f?          :{token, {float,TokenLine,  TokenChars}}.
".+"                          :{token, {string,TokenLine, TokenChars}}.
'{L}'                           :{token, {char,TokenLine, TokenChars}}.


% Keywords



Erlang code.
