%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
%}

%option noyywrap

DIGIT    [0-9]
LETTER   [a-zA-Z]
FLOAT    ({DIGIT}+\.{DIGIT}*|{DIGIT}*\.{DIGIT}+)
INT      {DIGIT}+
COMMENT  \/\/.*

%%

{COMMENT}    { /* Ignora comentarios */ }
"f"          { return FLOAT; }
"i"          { return INT; }
"p"          { return PRINT; }
"="          { return ASSIGN; }
"+"          { return PLUS; }
"-"          { return MINUS; }
"*"          { return TIMES; }
"/"          { return DIVIDE; }
{FLOAT}      {
    yylval.float_val = atof(yytext);
    return FNUM;
}
{INT}        {
    yylval.int_val = atoi(yytext);
    return INUM;
}
{LETTER}     {
    yylval.string_val = strdup(yytext);
    return ID;
}
[ \t\n]      ;
.            {
    yyerror("Carácter no válido");
    return -1;
}
%%


