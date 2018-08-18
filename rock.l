%{
#include"y.tab.h"
%}
%%
"SELECT" {printf("TABLES:\n");return SELECT;}
"FROM" {printf("\nCOLUMNS:\n");return FROM;}
"ORDERBY" {printf("\nORDERED:\n");return ORDER;}
"GROUPBY" {printf("\nGROUPED:\n");return GROUPBY;}
"WHERE" {printf("\nCONDITIONS:\n");return WHERE;}
"HAVING" {printf("\nCONDITIONS:\n");return HAVING;}
"ASC" {return ASC;}
"DSC" {return DSC;}
"MIN"|"MAX"|"AVG" {printf(" ->CONDITIONS:\n");return FUN;}
"OR"|"AND"|"NOT" {printf("\n");return FUNN;}
"UNION" {printf("\n\n OR \n\n");return OR;}
"INTERSECT" {printf("\n\n AND \n\n");return OR;}
"(" {return OB;}
")" {return CB;}
"," {printf("\n");return MORE;}
([a-z])* {printf("%s",yytext); return ID;}
"+"|"<"|"="|">"|"-"|"%"|"!"|"*"|"=="|"!=" {printf("%s",yytext);return OP;}
[\t]
[\n] {return 0;}
%%
