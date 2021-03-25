%{
    #include <stdio.h>
    #include <stdlib.h>

    int symbols[52];

    void yyerror(char *s);
    int symbolVal(char symbol);
    void updateSymbolVal(char symbol, int val);
%}

%union {int sum; char id;}

%start line

%token print
%token exit_command

%type <num> number
%type <id> identifier
%type <num> line exp term
%type <id> assignment

%%

line    : exit_command ';'       {exit(EXIT_SUCCESS);}
        | assignment ';'         {;}
        | print exp ';'          {printf("Print %d\n", $2);}

        | line exit_command ';'  {exit(EXIT_SUCCESS);}
        | line assignment ';'    {;}
        | line print exp ';'     {printf("Print %d\n", $3);}
        ;

assignment : identifier '=' exp  { updateSymbolVal($1,$3); }
           ;

exp     : term                   {$$ = $1;}
        | exp '+' term           {$$ = $1 + $3;}
        | exp '-' term           {$$ = $1 - $3;}
        ;

term    : number                 {$$ = $1;}
        | identifier             {$$ = symbolVal($1);} 
        ;

%%

int symbolVal(char symbol) {
    int bucket = computeSymbolIndex(symbol);
    return symbols[bucket];
}

void updateSymbolVal(char symbol, int val) {
    int bucket = computeSymbolIndex(symbol);
    symbols[bucket] = val;
}

int computeSymbolIndex(char token) {
    int idx = -1;
    if(islower(token)) {
        idx = token - 'a' + 26;
    }
    else if(isupper(token)) {
        idx = token - 'A';
    }
    return idx;
} 

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}

int main(void) {
    int i;
    for(i=0; i<52; i++) {
        symbols[i] = 0;
    }
    return yyparse();
}
