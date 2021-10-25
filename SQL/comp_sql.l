%option yylineno
%{
#define YYSTYPE double
#include "comp_sql.tab.h"
#include <stdlib.h>
%}

espaco			[ \t\r]+
inteiro			[0-9]+
real			{inteiro}[\.{inteiro}]?
string			\'.*\'

select			[S|s][E|e][L|l][E|e][C|c][T|t]	
from			[F|f][R|r][O|o][M|m]
where			[W|w][H|h][E|e][R|r][E|e]
as			    [A|a][S|s]

group			[g|G][r|R][o|O][u|U][p|P]
order			[O|o][R|r][D|d][E|e][R|r]	
by			    [B|b][Y|y]
asc			    [A|a][S|s][C|c]
desc		    [D|d][E|e][S|s][C|c]

not			    [N|n][O|o][T|t]
and			    [A|a][N|n][D|d]
or			    [O|o][R|r]
xor			    [X|x][O|o][R|r]

palavra			    [A-Za-z][A-Za-z0-9_]*
palavra_tabela		{palavra}\.{palavra}

%%

{espaco} 		{ }

"\n" 			{}


{inteiro}		return INTEIRO;
{real}			return REAL;
{string}		return STRING;


{select}		return SELECT;
{from}			return FROM;
{where}			return WHERE;
{as}			return AS;

{group}			return GROUP;
{order}			return ORDER;
{by}			return BY;
{asc}			return ASC;
{desc}			return DESC;

{and}			return AND;
{or}			return OR;
{not}			return NOT;
{xor}			return XOR;

{palavra}		    return CAMPO;			
{palavra_tabela}	return CAMPO_TABELA;

"+" 		return MAIS;
"="			return IGUAL;
"<>"		return DIFERENTE;
"<"			return MENOR;
"<="		return MENOR_IGUAL;
">"			return MAIOR;
">="		return MAIOR_IGUAL;
"-" 		return MENOS;
"/" 		return DIVISOR;
"*"			return ASTERISCO;
","			return VIRGULA;
"["			return ABRE_PARENTESE;
";"			return FIM;
"]"			return FECHA_PARENTESE;
.			{printf("Invalido: %s\n", yytext);}
%%  