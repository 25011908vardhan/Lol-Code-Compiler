%{
#include<stdio.h>
#include<ctype.h>
#include<string.h>
#include<math.h>
#include "lex.yy.c"

void yyerror(const char *s);
int yylex();

%}

//Defining of all the tokens
%token NUMBER LESSTHAN GREATERTHAN ISEQUAL ISNOTEQUAL
%%
expr: value arithmetic value
| value
;

arithmetic: LESSTHAN
| GREATERTHAN
| ISEQUAL
| ISNOTEQUAL
;

value: NUMBER ;
%%

void yyerror(const char* msg)
{
  fprintf(stderr,"%s\n",msg);
}