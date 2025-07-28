%option nounistd noyywrap stack reentrant
%top {

}
%{
#define PARSER_HEADER
#include"pch.h"
#include <sstream>
template <typename T>
T As(const std::string &s)
{
	T t;
	std::istringstream is(s);
	is >> t;
	return t;
}
%}
digit [[:digit:]]
space [[:space:]]
cntrl [[:cntrl:]]
number [+-]?{digit}+(\.{digit}+)?([eE][+-]?{digit}+)?

%%

%{
	// rules节第一个Action之前的所有%{...}%块,将按出现顺序逐字追加到扫描器函数体初始化区域的末尾
%}

{number} {
 auto s = As<long double>({yytext,yytext+yyleng});
 return number;
}

%%
