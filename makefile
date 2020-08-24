all: 	programa.l
	flex -i programa.l
	gcc lex.yy.c -o MeuPrimeiroCompilador
	clear
	./MeuPrimeiroCompilador
