ydb=$(shell pkg-config --variable=prefix yottadb)
options=-I$(ydb) -L$(ydb) -lyottadb -Wall

all: test1 test2 test3

test1: test1.o ydb-global.o
	g++ test1.o ydb-global.o $(options) -o test1

test2: test2.o ydb-global.o
	g++ test2.o ydb-global.o $(options) -o test2

test3: test3.o ydb-global.o
	g++ test3.o ydb-global.o $(options) -o test3

ydb-global.o: ydb-global.cpp ydb-global.h
	g++ -c ydb-global.cpp $(options)

test1.o: test1.cpp
	g++ -c test1.cpp $(options)

test2.o: test2.cpp
	g++ -c test2.cpp $(options)

test3.o: test3.cpp
	g++ -c test3.cpp $(options)

clean:
	rm -f *.o
