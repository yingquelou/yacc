%require "3.0"
%{
#define SCANNER_HEADER
#include"pch.h"
void yyerror(void* yyscanner,const char *msg);
%}
//%define api.pure
%union {
    int n;
}
%param {void* yyscanner}

%code provides{
//extern YY_DECL;
}

%token <long double> number

%%
start:
|start number {
}
;

%%
void yyerror(void* yyscanner,const char *msg)
{
    
}