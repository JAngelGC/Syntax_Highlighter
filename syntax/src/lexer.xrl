Definitions.
D = [0-9]
LE = [A-Za-z]
AL = [0-9A-Za-z]
WS = (\r|\n|\t|\?"?|\\|\s)
% "
PUNCT = [*-/+~!@#$%^&*()-=_+[\]{}\|:""''<>?,./]
PUNCTNOQUOTES = [/*-+~!@#$%^&*()-=_+[\]{}\|:''<>?,./]
PUNCTNOSTAR = [/*-+~!@#$%^&*()-=_+[\]{}\|:""''<>?,./][^(*/)]

% Notas
% Si dos string coinciden con el patron de la regex, toma el que este mas arriba
% Falta checar para lo de las funciones, aunque es en realidad un identificador???
% OOP??

Rules.
% WHITESPACE
[\s\t]+                        :{token, {space, TokenChars}}.
\n                             :{token, {newline, TokenChars}}.
\r                             :{token, {newline, TokenChars}}.

% COMMENTS
\//.*                          :{token, {comment, TokenChars}}.
\/\*({AL}|{WS}|{PUNCTNOSTAR})+\*\/ :{token, {comment, TokenChars}}.

% DATA
% Types
void                            :{token, {data_type, TokenChars}}.
int                             :{token, {data_type, TokenChars}}.
float                           :{token, {data_type, TokenChars}}.
string                          :{token, {data_type, TokenChars}}.
char                            :{token, {data_type, TokenChars}}.
double                          :{token, {data_type, TokenChars}}.
bool                            :{token, {data_type, TokenChars}}.
long                            :{token, {data_type, TokenChars}}.
short                           :{token, {data_type, TokenChars}}.
signed                          :{token, {data_type, TokenChars}}.
unsigned                        :{token, {data_type, TokenChars}}.

% Values
{D}+                            :{token, {int, TokenChars}}.
0b?{D}+                         :{token, {int, TokenChars}}.
0x[0-9a-fA-F]+                  :{token, {int, TokenChars}}.
{D}+\.{D}*f?                    :{token, {float, TokenChars}}.
{D}+\.{D}*e[+\-]?{D}+f?         :{token, {float, TokenChars}}.
"({AL}|{WS}|{PUNCTNOQUOTES})*?" :{token, {string, TokenChars}}.
'.'                          :{token, {char, TokenChars}}.
true                            :{token, {keywordBool, TokenChars}}.
false                           :{token, {keywordBool, TokenChars}}.

% CONDITIONALS
if                              :{token, {conditional, TokenChars}}.
else                            :{token, {conditional, TokenChars}}.
while                           :{token, {conditional, TokenChars}}.
switch                          :{token, {conditional, TokenChars}}.
case                            :{token, {conditional, TokenChars}}.
break                           :{token, {conditional, TokenChars}}.
\?                              :{token, {conditional, TokenChars}}.
default                         :{token, {conditional, TokenChars}}.
do                              :{token, {conditional, TokenChars}}.
continue                        :{token, {conditional, TokenChars}}.
return                          :{token, {conditional, TokenChars}}.
for                             :{token, {conditional, TokenChars}}.
\:                              :{token, {conditional, TokenChars}}.

try                             :{token, {conditional, TokenChars}}.
catch                           :{token, {conditional, TokenChars}}.

% Keywords (first round)
auto                            :{token, {keyword, TokenChars}}.
const                           :{token, {keyword, TokenChars}}.
enum                            :{token, {keyword, TokenChars}}.
extern                          :{token, {keyword, TokenChars}}.
goto                            :{token, {keyword, TokenChars}}.
register                        :{token, {keyword, TokenChars}}.
sizeof                          :{token, {keyword, TokenChars}}.
static                          :{token, {keyword, TokenChars}}.
struct                          :{token, {keyword, TokenChars}}.
typedef                         :{token, {keyword, TokenChars}}.
union                           :{token, {keyword, TokenChars}}.
volatile                        :{token, {keyword, TokenChars}}.

% Keywords (second round)                           :{token, {keyword, TokenChars}}.
asm                             :{token, {keyword, TokenChars}}.
class                           :{token, {keyword, TokenChars}}.
const_cast                      :{token, {keyword, TokenChars}}.
delete                          :{token, {keyword, TokenChars}}.
dynamic_cast                    :{token, {keyword, TokenChars}}.
explicit                        :{token, {keyword, TokenChars}}.
export                          :{token, {keyword, TokenChars}}.
friend                          :{token, {keyword, TokenChars}}.
inline                          :{token, {keyword, TokenChars}}.
mutable                         :{token, {keyword, TokenChars}}.
new                             :{token, {keyword, TokenChars}}.
operator                        :{token, {keyword, TokenChars}}.
private                         :{token, {keyword, TokenChars}}.
protected                       :{token, {keyword, TokenChars}}.
public                          :{token, {keyword, TokenChars}}.
reinterpret_cast                :{token, {keyword, TokenChars}}.
static_cast                     :{token, {keyword, TokenChars}}.
template                        :{token, {keyword, TokenChars}}.
this                            :{token, {keyword, TokenChars}}.
throw                           :{token, {keyword, TokenChars}}.

typeid                          :{token, {keyword, TokenChars}}.
typename                        :{token, {keyword, TokenChars}}.
virtual                         :{token, {keyword, TokenChars}}.
wchar_t                         :{token, {keyword, TokenChars}}.


% Operators
% Asignment
\=                              :{token, {assign, TokenChars}}.
\+=                             :{token, {assign, TokenChars}}.
\-=                             :{token, {assign, TokenChars}}.
\/=                             :{token, {assign, TokenChars}}.
\*=                             :{token, {assign, TokenChars}}.
\%=                             :{token, {assign, TokenChars}}.
% Arithmetic
\+                              :{token, {arithmetic, TokenChars}}.
\-                              :{token, {arithmetic, TokenChars}}.
\/                              :{token, {arithmetic, TokenChars}}.
\*                              :{token, {arithmetic, TokenChars}}.
\%                              :{token, {arithmetic, TokenChars}}.
\+\+                            :{token, {arithmetic, TokenChars}}.
\-\-                            :{token, {arithmetic, TokenChars}}.
% Relational
==                              :{token, {relation, TokenChars}}.
!=                              :{token, {relation, TokenChars}}.
<                               :{token, {relation, TokenChars}}.
>                               :{token, {relation, TokenChars}}.
<=                              :{token, {relation, TokenChars}}.
>=                              :{token, {relation, TokenChars}}.
% Logical
&&                              :{token, {logical, TokenChars}}.
\|\|                            :{token, {logical, TokenChars}}.
!                               :{token, {logical, TokenChars}}.

% GROUPS
[\(\)]                          :{token, {group, TokenChars}}.
[\{\}]                          :{token, {group, TokenChars}}.
[\[\]]                          :{token, {group, TokenChars}}.

% PUNCTUATION
::                              :{token, {punctuationColor, TokenChars}}.
<<                              :{token, {punctuationColor, TokenChars}}.
>>                              :{token, {punctuationColor, TokenChars}}.
;                               :{token, {punctuation, TokenChars}}.
\.                               :{token, {punctuation, TokenChars}}.
,                               :{token, {punctuation, TokenChars}}.


% Include
using                           :{token, {include, TokenChars}}.
namespace                       :{token, {include, TokenChars}}.
#(include)                      :{token, {include, TokenChars}}.
<{LE}+.?{LE}*>                  :{token, {header, TokenChars}}.
#define                         :{token, {macro, TokenChars}}.

% Identifiers
% ([_A-Za-z]+[_0-9A-Za-z]*)\(         :{token, {function, TokenChars}}.
[_A-Za-z]+[_0-9A-Za-z]*         :{token, {identifier, TokenChars}}.

%
&                               :{token, {reference, TokenChars}}.

Erlang code.


% Run this file in iex -S mix
% :lexer.string 'ab'
