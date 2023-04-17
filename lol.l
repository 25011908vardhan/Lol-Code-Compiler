%{
    /* directly copied to c file */
    #include "y.tab.h"
    int countn=0;
    int no_line=1;
%}

%option yylineno
/* declarations */


number [0-9]
letter [a-zA-Z]
char [{number}{letter}]
spaces [ \t]+
numbers {number}+
letters {letter}+
chars { char }+
eol [\n]
%%  /* rules */

[ \t]+ {
    printf(" detected spaces \n " );
}

{eol}         { no_line++; }

"("         { return '('; }

")"         { return ')'; }

"BIGER" {
    printf("<OP>|GREATERTHAN\n");
    return GREATERTHAN;
}


"LEZER" {
    printf("<OP>|LESSTHAN\n");
    return LESSTHAN;
}


"SAEM" {
    printf("<OP>|ISEQUAL\n");
    return ISEQUAL;
}


"DIFFERENT" {
    printf("<OP>|ISNOTEQUAL\n");
    return ISNOTEQUAL;
}


"BTW"[A-Za-z0-9 ]*\n {
    printf("Single Line Comment\n");
    // return no token
    no_line++;
}


"OBTW"[A-Za-z0-9 \n]*"_TLDR" {
    printf("Multi Line Comment\n");
    // return no token
}


"I_HAS_A" {
    printf( "<KEY|VAR>\n" );
    return VAR;
}


"GIMMEH" {
    printf( "<KEY|INPUT>\n" );
    return GIMMEH;
}


"PURR" {
    printf( "<KEY|OUTPUT>\n" );
    return PURR;
}


"IZ_IT" {
    printf( "<KEY|IF>\n");
    return IZ_IT;
}


"RELSE" {
    printf( "<KEY|ELSE>\n" );
    return RELSE;
}


"IM_IN_UR_LOOP" {
    printf( "<KEY|LOOP>\n" );
    return LOOP;
}


"GTFO" {
    printf( "<KEY|BREAK>\n" );
    return BREAK;
}


"YARLY" {
    printf( "<KEY|START OF BLOCK>\n");
    return YARLY;
}


"KTHX" {
    printf( "<KEY|END OF STMT>\n");
    return KTHX;
}


"IZ"  {
    printf( "<OP|ASSIGNMENT>\n" );
    return IZ;
}

[a-zA-Z][A-Za-z_0-9]* {
    printf( "<ID> " );
    return ID;
}


{number}* {
    printf( "<LIT|NUMBER>\n");
    return NUMBER;
}


\".*\" {
    printf( "<String>\n");
    return STRING;
}

"+" {
    return ADD;
}

"-" {
    return SUBTRACT;
}

"*" {
    return MULTIPLY;
}

"/" {
    return DIVIDE;
}

.* {
    printf( "Error in line no: %d \n", no_line );
}


%%  /* subroutines */
