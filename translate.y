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
%token NUMBER LESSTHAN GREATERTHAN ISEQUAL ISNOTEQUAL STRING VAR ID IZ GIMMEH PURR '(' ')' IZ_IT YARLY RELSE KTHX LOOP BREAK ADD SUBTRACT MULTIPLY DIVIDE


%%

root: block;


lit: NUMBER | STRING;


decl_stmt: VAR ID IZ expr;


assign_stmt : ID IZ expr;


expr : ar_expr | log_expr ;


ar_term: ID | lit | '(' ar_expr ')';


ar_op : ADD | SUBTRACT | MULTIPLY | DIVIDE;


ar_expr : ar_term ar_op ar_term | ar_term;


log_term : ID | lit | '(' log_expr ')';


log_op : LESSTHAN
| GREATERTHAN
| ISEQUAL
| ISNOTEQUAL
;


log_expr : log_term log_op log_term | log_term ;


inp_stmt : GIMMEH ID;


outp_stmt : PURR ID;


branch_stmt : IZ_IT log_expr YARLY block RELSE block KTHX
| IZ_IT log_expr YARLY block KTHX
;


loop_stmt : LOOP '(' log_expr ')' YARLY block KTHX
;


break_stmt : BREAK;


stmt : decl_stmt
| assign_stmt
| inp_stmt
| outp_stmt
| branch_stmt
| loop_stmt
| break_stmt
;


block : stmt block | stmt;


%%


void yyerror(const char* msg)
{
  fprintf(stderr,"%s\n",msg);
}
