compile: comp_sql.y comp_sql.l
	bison -d comp_sql.y
	flex -o comp_sql.l.c comp_sql.l
	gcc -o comp_sql comp_sql.l.c comp_sql.tab.c -lfl -lm
clean:
	rm -f *.c *.h comp_sql

test: 	
	./comp_sql sql