%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
%}

%token ESPACO
%token SELECT FROM WHERE AS
%token AND OR NOT XOR
%token GROUP ORDER BY ASC DESC
%token CAMPO CAMPO_TABELA
%token INTEIRO REAL STRING
%token FIM

%token MAIS
%token MENOS
%token DIVISOR

%token ASTERISCO
%token VIRGULA
%token ABRE_PARENTESE
%token FECHA_PARENTESE
%token IGUAL
%token DIFERENTE
%token MENOR
%token MENOR_IGUAL
%token MAIOR
%token MAIOR_IGUAL

%left OR
%left XOR
%left AND
%left NOT
%left IGUAL DIFERENTE MENOR MENOR_IGUAL MAIOR MAIOR_IGUAL
%left MAIS MENOS
%left DIVISOR ASTERISCO

%nonassoc NEG

%start Input
%%

Input:

	| Input Query
;

Query:
	Select FIM
;

Select:
	SELECT Campo FROM Tabelas Where OrderBy
	| SELECT Campo FROM Tabelas Where GroupBy
	| SELECT Campo FROM Tabelas Where GroupBy OrderBy  
;

Campo:
	ASTERISCO
	| Lista_Campos
;

Lista_Campos:
	CAMPO
	| CAMPO_TABELA
	| Lista_Campos VIRGULA CAMPO
	| Lista_Campos VIRGULA CAMPO_TABELA
;

Tabelas:
	Tabela
	| Tabelas VIRGULA Tabela
;

Tabela:
	CAMPO
	| CAMPO AS CAMPO
;

OrderBy:
	| ORDER BY Campos_OrderBy
;

GroupBy:
	 GROUP BY Campos_GroupBy
;

Campos_GroupBy:
	Campo_GroupBy
	| Campos_GroupBy VIRGULA Campo_GroupBy
;

Campo_GroupBy:
	| CAMPO	
;

Campos_OrderBy:
	Campo_OrderBy
	| Campos_OrderBy VIRGULA Campo_OrderBy
;

Campo_OrderBy:
	CAMPO
	| CAMPO_TABELA
	| CAMPO ASC
	| CAMPO_TABELA ASC
	| CAMPO DESC
	| CAMPO_TABELA DESC
;

Where:
	| WHERE Expression
;

Expression:
	CAMPO
	| CAMPO_TABELA
	| INTEIRO		
	| REAL
	| STRING
	| ABRE_PARENTESE Expression FECHA_PARENTESE
	| Expression Operador_booleano Expression
	| Expression Operador_comparativo Expression	
	| Expression Operador_matematico Expression
	| MENOS Expression %prec NEG
	| NOT Expression	
	| Expression Operador_comparativo ABRE_PARENTESE Select FECHA_PARENTESE
;

Operador_booleano:
	AND
	| OR
	| XOR	
;

Operador_comparativo:
	IGUAL
	| DIFERENTE
	| MENOR
	| MENOR_IGUAL
	| MAIOR
	| MAIOR_IGUAL
;

Operador_matematico:
	MAIS
	| MENOS
	| ASTERISCO
	| DIVISOR
;

		
%%

extern int 	yylineno;	
extern char 	*yytext;

int yyerror(char *s) {
	printf("%s. Linha: %d. Token não esperado: %s\n", s, yylineno, yytext);
}

int main(int ac, char **av) {
	extern FILE *yyin;

	if(ac > 1 && (yyin = fopen(av[1], "r")) == NULL) {
		perror(av[1]);
		exit(1);
	}

	if(!yyparse())
		printf("Todas as clausulas SQL sao validas!\n");
	else
		printf("Existem erros de SQL.\n");
}