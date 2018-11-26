# взять цели из make
# запускать make install для выполнения install
CC 	= -g -O0
CFLAGS 	= -ansi -pedantic -Wall -Wextra
ALL	= $(basename $(wildcard *.c))

main: main.o
	gcc $(CC) -o main main.o

main.o: main.c
	gcc $(CC) -c main.c

test:
	kdbg main

install:
	install ./main /home/01/valeksee/inf

tar:
	tar -cf main_tar.tar main.c Makefile main.o main.h 

all: ${ALL}

clean:
	rm *.o

cleanall:
	rm -i main
	rm -i main.o
	rm -i main_tar.tar

doc:
	doxygen Doxyfile

help:
	@echo "make test - запуск в отладчике kdbg"

sys:
	(uname -o; uname -n; uname -p; uname -v)
