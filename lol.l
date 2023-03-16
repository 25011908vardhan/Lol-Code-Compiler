%{
    /* directly copied to c file */
    #include "y.tab.h"
    int countn=0;
%}
%option noyywrap
%option yylineno
/* declarations */

number [0-9]
letter [a-zA-Z]
char [{number}{letter}]
spaces [ \t\n]
numbers {number}+
letters {letter}+
chars { char }+
eol [\n]
%%  /* rules */

spaces {
    // chuck it
    ;
}

"BIGER" { printf("<OP>|GREATERTHAN\n"); return GREATERTHAN; }
"LEZER" { printf("<OP>|LESSTHAN\n"); return LESSTHAN; }
"SAEM" { printf("<OP>|ISEQUAL\n"); return ISEQUAL; }
"DIFFERENT" { printf("<OP>|ISNOTEQUAL\n"); return ISNOTEQUAL; }

BTW[A-Za-z0-9 ]*\n { 
    printf("Single Line Comment ");
}

OBTW[A-Za-z0-9 \n]*_TLDR {
    printf("Multi Line Comment");
}

I_HAS_A {
    printf( "<KEY|VAR> " );
}

GIMMEH {
    printf( "<KEY|INPUT> " );
}

PURR { 
	printf( "<KEY|OUTPUT> " );
}

IZ_IT {
	printf( "<KEY|IF> ");
}

RELSE {
    printf( "<KEY|ELSE> " );
}

IM_IN_UR_LOOP {
    printf( "<KEY|LOOP> " );
}

GTFO {
    printf( "<KEY|BREAK> " );
}

YARLY {
    printf("<KEY|START OF LOOOP>");
}
KTHX {
    printf("<KEY|END OF LOOP>");
}

IZ  { 
    printf( "<OP|ASSIGNMENT> " );
}

UP  {
    printf("<OP|INCR> ");
}

DOWN  {
    printf("<OP|DECR> ");
}
{number}* {
    printf("<LIT|NUMBER> ");
    return NUMBER;
}
\".*\" {
    printf("<String>");
}
.* {
    printf("Error! ");
}

%%  /* subroutines */

