# Makefile for catalan to ensure Linux compatibility and ease of testing.
# Made this to refresh my knowledge of writing Makefiles. Did have to look up
# outside documentation, lost my notes for when a previous class covered this.
# 
# Author: June

CC=g++
OBJ=catalan.o main.o
FLAGS=-g

all: $(OBJ)
	$(CC) $^ -o catalan.out
	chmod +x catalan.out

debug: $(OBJ)
	echo "debug compile..."
	$(CC) $(FLAGS) $^ -o catalan.out
	chmod +x catalan.out

clean :
	rm *.o *.c catalan.out

%.o: %.cpp
	$(CC) -c $^ -o $@
