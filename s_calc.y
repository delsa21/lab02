%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s) {
    printf("Error de sintaxis: %s\n", s);
}
%}

/* Definimos una unión para que YACC sepa qué tipos puede tener yylval */
%union {
    int int_val;
    float float_val;
    char* string_val;
}

/* Tokens con tipo de dato */
%token <int_val> INUM
%token <float_val> FNUM
%token <string_val> ID

/* Tokens sin valor asociado */
%token FLOATDCL INTDCL ASSIGN PRINT
%token PLUS MINUS TIMES DIVIDE

/* Precedencia y asociatividad para eliminar ambigüedad */
%left PLUS MINUS
%left TIMES DIVIDE

%%

program:
    statement_list
    {
        printf("digraph G {\n");
        printf("  program -> statement_list;\n");
        printf("}\n");
    }
    ;

statement_list:
      statement_list statement
        { printf("  statement_list -> statement;\n"); }
    | statement
        { printf("  statement_list -> statement;\n"); }
    ;

statement:
      FLOATDCL ID
        { printf("  statement -> FLOAT ID;\n"); }
    | INTDCL ID
        { printf("  statement -> INT ID;\n"); }
    | ID ASSIGN expression
        { printf("  statement -> ID ASSIGN expression;\n"); }
    | PRINT ID
        { printf("  statement -> PRINT ID;\n"); }
    ;

expression:
      ID
        { printf("  expression -> ID;\n"); }
    | INUM
        { printf("  expression -> INUM;\n"); }
    | FNUM
        { printf("  expression -> FNUM;\n"); }
    | expression PLUS expression
        { printf("  expression -> expression PLUS expression;\n"); }
    | expression MINUS expression
        { printf("  expression -> expression MINUS expression;\n"); }
    | expression TIMES expression
        { printf("  expression -> expression TIMES expression;\n"); }
    | expression DIVIDE expression
        { printf("  expression -> expression DIVIDE expression;\n"); }
    ;

%%

int main(void) {
    yyparse();
    return 0;
}
