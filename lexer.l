%{
  #include "y.tab.h"
  int yylex();
  void yyerror(char *s);
%}

%%

"exit"                 {return exit_command;}
"print"                {return print;}

[a-zA-Z]               {yylval.id = yytext[0]; return identifier;}
[0-9]+                 {yylval.num = atoi(yytext); return number;}

[-+=;]                 {return yytext[0];}

[ \t\n]                ;
.                      {ECHO; yyerror ("unexpected character");}

%%

int yywrap(void) {
  return 1;
}
