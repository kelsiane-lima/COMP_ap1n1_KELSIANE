%{
 
%}

OA "+"|"-"|"*"|"/"
OL "&&"|"||"
LETRA[a-zA-Z]
DIGITO[0-9]
RECEBE"="
COMPARADORES"=="|"=>"|"<="|"!="|"<"|">"
LETRAMINUSCULA[a-z]+
LER"kin>>"
SAIDA"kout<<"
TIPOINT"int"
TIPOFLOAT"float"
TIPODOUBLE"double"
TIPOSTR"str"
STRING\"[a-zA-Z0-9]*.*\"
COMENTARIO"#".*
VALORREAL{DIGITO}*\.{DIGITO}+
VALORINTEIRO{DIGITO}+
NOMEVAR{LETRAMINUSCULA}({LETRA}|{DIGITO})*
END";"
KFIM"k_fim"
KINICIO"k_inicio"
IGNORE","|"("|")"|" "
IF"if"
ELSE"else"
FOR"for"
INVALIDO .
%%

{KFIM} {
	printf("IDENTIFICADOR DE FINAL DO PROGRAMA: %s", yytext);
	}
{IGNORE} {
        }


{KINICIO} {
	printf("IDENTIFICADOR DE INICIO DO PROGRAMA: %s\n", yytext);

	}
{FOR} {
    printf("ESTRUTURA DE REPETICAO: %s", yytext);
}
{IF} {
    printf("ESTRUTURA CONDICIONAL: %s\n", yytext);
}
{ELSE} {
    printf("ESTRUTURA CONDICIONAL: %s\n", yytext);
}
{END} {
    printf("END: %s", yytext);
}
{COMPARADORES} {
    printf("COMPARAR: %s\n", yytext);
}
{RECEBE} {
	printf("RECEBE: %s\n", yytext);

	}
{STRING} {
	printf("STRING: %s\n", yytext);

	}
{TIPOINT} {
    printf("TIPO INTEIRO: %s\n", yytext);
}
{TIPOFLOAT} {
    printf("TIPO FLOAT: %s\n", yytext);
}
{TIPODOUBLE} {
    printf("TIPO DOUBLE: %s\n", yytext);
}
{TIPOSTR} {
    printf("TIPO STRING: %s\n", yytext);
}
{SAIDA} {
    printf("OPERADOR DE ESCRITA: %s\n", yytext);
}
{LER} {
    printf("OPERADOR DE LEITURA: %s\n", yytext);
}
{NOMEVAR} {
    printf("NOME VARIÁVEL: %s\n",yytext);
}
{OA} {

	printf("OPERADORES ARITMETICOS: %s\n", yytext);

}
{OL} {

	printf("OPERADORES LOGICOS: %s\n", yytext);

}

{COMENTARIO} {

    printf("COMENTARIO: %s\n", yytext);
}

{VALORREAL} {
    printf("VALOR REAL: %s\n", yytext);
}
{VALORINTEIRO} {
    printf("VALOR INTEIRO: %s\n", yytext);
}

{INVALIDO} {
    printf("caractere invalido: %s", yytext);
}

%%

int main() {
    yyin=fopen("entradas.in","r");    
    yylex();
	fclose(yyin);
    return 0;
}

int yywrap(){
	return 1;
}
