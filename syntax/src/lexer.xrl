Definitions.
D = [0-9]
LE = [A-Za-z]
AL = [0-9A-Za-z]
WS = (\n|\t|\"?"?|\\|\s)
PUNCT = [/*-+~!@#$%^&*()-=_+[\]{}\|:""''<>?,./]

% Notas
% Si dos string coinciden con el patron de la regex, toma el que este mas arriba
Rules.
% SPACES
[\s\t]+                        :{token, {space,  TokenChars}}.
\n                             :{token, {newline,  TokenChars}}.

% COMMENTS
\//.*                          :{token, {comment,  TokenChars}}.
\/\*({AL}|{WS}|{PUNCT})+\*\/   :{token, {comment,  TokenChars}}.

% DATA
% Types
int                             :{token, {data_type,  TokenChars}}.
float                           :{token, {data_type,  TokenChars}}.
string                          :{token, {data_type,  TokenChars}}.
bool                            :{token, {data_type,  TokenChars}}.
char                            :{token, {data_type,  TokenChars}}.
double                          :{token, {data_type,  TokenChars}}.
bool                            :{token, {data_type,  TokenChars}}.

% Values
{D}+                            :{token, {number,  TokenChars}}.
{D}+\.{D}*f?                    :{token, {number,  TokenChars}}.
{D}+\.{D}*e[+\-]?{D}+f?         :{token, {number,  TokenChars}}.
"({AL}|{WS}|{PUNCT})+"          :{token, {string, TokenChars}}.
'{L}'                           :{token, {string, TokenChars}}.

% CONDITIONALS
if                              :{token, {keyword, TokenChars}}.
case                            :{token, {keyword, TokenChars}}.
while                           :{token, {keyword, TokenChars}}.

% Keywords (first round)
auto                            :{token, {keyword, TokenChars}}.
break                           :{token, {keyword, TokenChars}}.
const                           :{token, {keyword, TokenChars}}.
continue                        :{token, {keyword, TokenChars}}.
default                         :{token, {keyword, TokenChars}}.
do                              :{token, {keyword, TokenChars}}.
else                            :{token, {keyword, TokenChars}}.
enum                            :{token, {keyword, TokenChars}}.
extern                          :{token, {keyword, TokenChars}}.
for                             :{token, {keyword, TokenChars}}.
goto                            :{token, {keyword, TokenChars}}.
long                            :{token, {keyword, TokenChars}}.
register                        :{token, {keyword, TokenChars}}.
return                          :{token, {keyword, TokenChars}}.
short                           :{token, {keyword, TokenChars}}.
signed                          :{token, {keyword, TokenChars}}.
sizeof                          :{token, {keyword, TokenChars}}.
static                          :{token, {keyword, TokenChars}}.
struct                          :{token, {keyword, TokenChars}}.
switch                          :{token, {keyword, TokenChars}}.
typedef                         :{token, {keyword, TokenChars}}.
union                           :{token, {keyword, TokenChars}}.
unsigned                        :{token, {keyword, TokenChars}}.
void                            :{token, {keyword, TokenChars}}.
volatile                        :{token, {keyword, TokenChars}}.

% Keywords (second round)                           :{token, {keyword, TokenChars}}.
asm                             :{token, {keyword, TokenChars}}.
catch                           :{token, {keyword, TokenChars}}.
class                           :{token, {keyword, TokenChars}}.
const_cast                      :{token, {keyword, TokenChars}}.
delete                          :{token, {keyword, TokenChars}}.
dynamic_cast                    :{token, {keyword, TokenChars}}.
explicit                        :{token, {keyword, TokenChars}}.
export                          :{token, {keyword, TokenChars}}.
false                           :{token, {keyword, TokenChars}}.
friend                          :{token, {keyword, TokenChars}}.
inline                          :{token, {keyword, TokenChars}}.
mutable                         :{token, {keyword, TokenChars}}.
namespace                       :{token, {keyword, TokenChars}}.
new                             :{token, {keyword, TokenChars}}.
operator                        :{token, {keyword, TokenChars}}.
private                         :{token, {keyword, TokenChars}}.
protected                       :{token, {keyword, TokenChars}}.
public                          :{token, {keyword, TokenChars}}.
reinterpret_cast                :{token, {keyword, TokenChars}}.
static_cast                     :{token, {keyword, TokenChars}}.
template                        :{token, {keyword, TokenChars}}.
this                            :{token, {keyword, TokenChars}}.
throw                           :{token, {keyword, TokenChars}}.
true                            :{token, {keyword, TokenChars}}.
try                             :{token, {keyword, TokenChars}}.
typeid                          :{token, {keyword, TokenChars}}.
typename                        :{token, {keyword, TokenChars}}.
using                           :{token, {keyword, TokenChars}}.
virtual                         :{token, {keyword, TokenChars}}.
wchar_t                         :{token, {keyword, TokenChars}}.


% Functions




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

% AGRUPACION
[\(\)]                          :{token, {more, TokenChars}}.
[\{\}]                          :{token, {more, TokenChars}}.
::                              :{token, {more, TokenChars}}.
<<                              :{token, {more, TokenChars}}.
>>                              :{token, {more, TokenChars}}.
;                              :{token, {more, TokenChars}}.



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
