%{
#include<stdio.h>
%}
%token SELECT ID FROM ID
%token SELECT FUN OB ID CB FROM ID GROUPBY ID
%token SELECT OP
%token MORE ID
%token ID ASC
%token ID DSC
%token ORDER
%token WHERE ID OP ID
%token ID OP ID FUNN
%token HAVING ID
%token OR
%%
variable: SELECT ID b
                | SELECT ID MORE a
                | SELECT OP b
                | SELECT FUN OB ID CB FROM ID GROUPBY ID
                | SELECT FUN OB ID CB FROM ID GROUPBY ID OR variable
;
a: ID b
        | ID MORE a     
;
b: FROM ID d|e|f
        | FROM ID MORE c
;
c: ID d|e|f
        | ID MORE c
;
d: WHERE ID OP ID
        | WHERE OB variable CB
        | WHERE ID OP ID e|f
        | WHERE ID OP ID FUNN x
        | WHERE ID OP ID OR variable
        | WHERE OB variable CB OR variable
;
e: ORDER w
;
f: HAVING g
;
g: MORE ID g
        |ID
        |ID e
        |ID OR variable
;
w: ID ASC|DSC
;
x: ID OP ID FUNN x
    | ID OP ID
    | ID OP ID OR variable
;
%%
main()
{
yyparse();
printf("\nQuery ACCEPTED \n");
}
int yyerror(char *s)
{
printf("\nQuery REJECTED\n");
exit(0);
}
