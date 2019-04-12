%{
    #include <stdio.h>
    
    enum TOKEN { _ID = 256, _FOR, _IF, _INT, _FLOAT, _MAIG, _MEIG, _IG, _DIF, _STRING, _COMENTARIO };
%}

DIGITO  [0-9]
LETRA   [A-Za-z_]
WS      [ \t\n]

NUMERO  {DIGITO}+
ID      {LETRA}({LETRA}|{DIGITO})*
INT     {DIGITO}+
FLOAT   {INT}("."{INT})?([E|e]("+"|"-")?{INT})?

STRING  \"(\"\"|\\\"|[^\n])*\"
COMENTARIO \/\*(((([^\*])*\*(\*)*([^\*\/]))*)|(([^\*])*\*(\*)*))\/

RESTO [^\n]

%%

{WS}    {}

"for"   { return _FOR; }
"if"    { return _IF; }

{INT}   { return _INT; }
{FLOAT} { return _FLOAT; }

">="    { return _MAIG; }
"<="    { return _MEIG; }
"=="    { return _IG; }
"!="    { return _DIF; }

{STRING} { return _STRING; }
{COMENTARIO} { return _COMENTARIO; }

{ID}    { return _ID; }

{RESTO} { return *yytext; }

%%