Package Parse;
Import Error.LexicalError;
%%
digits = 0|[1-9][0-9]*
letter = [A-Za-z]
identifier = {letter}({letter}|[0=9_])*
whitespace = [\ \t\n\r]+
%%
{whitespace} {  return new Token(WS, yytext());}
{digits}	{ return new Token(INT, Integer.Valueof(yytext()); }
"if"		{ return new Token(IF, null);
"while"		{ return new Token(WHILE, null);
{identifyer}	{ return new Token(ID, yytext()); }
		{ return new Token(ERROR, yytext()); }
