%{
#include "html.tab.h"
#include<stdlib.h>  

void yyerror(char *s);
%}

%%

"<!DOCTYPE html>"       { return DOCTYPE; }
"<html>"                { return HTML_O; }
"</html>"               { return HTML_C; }
"<head>"                { return HEAD_O; }
"</head>"               { return HEAD_C; }
"<body>"                { return BODY_O; }
"</body>"               { return BODY_C; }
"<p>"                   { return PARA_O; }
"</p>"                  { return PARA_C; }
"<h1>"                  { return H1_O; }
"</h1>"                 { return H1_C; }
"<h2>"                  { return H2_O; }
"</h2>"                 { return H2_C; }
"<h3>"                  { return H3_O; }
"</h3>"                 { return H3_C; }
"<h4>"                  { return H4_O; }
"</h4>"                 { return H4_C; }
"<h5>"                  { return H5_O; }
"</h5>"                 { return H5_C; }
"<h6>"                  { return H6_O; }
"</h6>"                 { return H6_C; }
"<button>"              { return BUTTON_O; }
"</button>"             { return BUTTON_C; }
"<ul>"                  { return UL_O; }
"</ul>"                 { return UL_C; }
"<ol>"                  { return OL_O; }
"</ol>"                 { return OL_C; }
"<li>"                  { return LI_O; }
"</li>"                 { return LI_C; }
"<a href"               { return A_O; }
"</a>"                  { return A_C; }
"<img src"              { return IMG; }
">"                     { return CLOSE; }
\"[^\"]*\"              { return STRING; }
[[:space:]]			  ;
.					  ;

%%

int yywrap(){
    return 1;
}