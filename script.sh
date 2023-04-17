clear
flex lol.l
yacc -v -d translate.y
gcc -o lex.out lex.yy.c -lfl
gcc -o y.out -ll y.tab.c
./y.out < input.lol
