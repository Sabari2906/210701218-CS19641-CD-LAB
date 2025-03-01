%option noyywrap
letter [a-zA-Z]
digit [0-9]
id [_|a-zA-Z]
AO [+|-|/|%|*]
RO  [<|>|<=|>=|==]
pp [#]
%{
int n=0;
%}

%%
"void" 				printf("%s return type\n",yytext);
{letter}*[(][)] 			printf("%s  Function\n",yytext);
"int"|"float"|"if"|"else" 	printf("%s keywords\n",yytext);
"printf" 				printf("%s keywords\n",yytext);
{id}({id}|{digit})* 		printf("%s Identifier\n",yytext);
{digit}{digit}* 			printf("%d Numbers\n",yytext);
{AO} 					printf("%s Arithmetic Operators\n",yytext);
{RO} 					printf("%s Relational Operators\n",yytext);
{pp}{letter}[<]{letter}[.]{letter}[>] printf("%s processor Directive\n",yytext);
[\n] 					n++;
"."|","|"}"|"{"|";" 		printf("%s others\n",yytext);

%%
int main()
{
	printf("256 - Sreena R \n");
	yyin=fopen("sample.c","r");
	yylex();
	printf("No of Lines %d\n",n);
}
