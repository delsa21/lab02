all: compilador

compilador: s_calc.l s_calc.y
	yacc -d s_calc.y
	lex s_calc.l
	gcc lex.yy.c y.tab.c -o compilador -ll -lm

clean:
	rm -f compilador lex.yy.c y.tab.c y.tab.h
