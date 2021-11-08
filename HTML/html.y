%{
#include<stdio.h>
extern FILE* yyin;

void yyerror(char *s);
int yylex(void);
int yyparse();
int yydebug;
%}

%token DOCTYPE HTML_O HTML_C HEAD_O HEAD_C BODY_O BODY_C
%token STRING CLOSE
%token PARA_O PARA_C
%token H1_O H1_C H2_O H2_C H3_O H3_C H4_O H4_C H5_O H5_C H6_O H6_C
%token BUTTON_O BUTTON_C
%token UL_O UL_C OL_O OL_C LI_O LI_C
%token A_O A_C IMG

%%

HTML_VALID:
    DOCTYPE HTML{ printf("Tags aceitas!\n"); }
    ;

HTML:
    HTML_O BODY HTML_C
    ;

BODY:
    BODY_O CONTENT BODY_C
    ;

CONTENT: 
    PARAGRAPH
    | LINK
    | OL_LIST
    | HEADING
    | BUTTON
    | IMAGE
    | UL_LIST
    | CONTENT CONTENT
    ;

PARAGRAPH:
    PARA_O PARA_C
    ;

OL_LIST:
    OL_O LIST OL_C
    ;
    
UL_LIST:
    UL_O LIST UL_C
    ;

LIST:
    LI_O LI_C
    | LIST LIST
    ;

IMAGE:
    IMG STRING CLOSE
    ;

LINK:
    A_O STRING CLOSE A_C
    ;

BUTTON: 
    BUTTON_O BUTTON_C
    ;

HEADING:
    H1_O H1_C
    | H2_O H2_C
    | H3_O H3_C
    | H4_O H4_C
    | H5_O H5_C
    | H6_O H6_C
    ;

%%

void yyerror(char *s)
{
	printf("Error: %s\n", s);
}

int main(int argc, char *argv[])
{
	yydebug = 0;
	
	if (argc == 1)
    {
		yyparse();
    }

	if (argc == 2)
	{
        yyin = fopen(argv[1], "r");
		yyparse();
    }

	return 0;
}