# Makefile for catalan to ensure Linux compatibility and ease of testing.
# Made this to refresh my knowledge of writing Makefiles. Did have to look up
# outside documentation, lost my notes for when a previous class covered this.
# 
# Author: June

CXX=g++
OBJ=main.o catalan.o
CXXFLAGS=

all: $(OBJ)
	$(CXX) $(CXXFLAGS) $^ -o catalan.out
	chmod +x catalan.out

debug: CXXFLAGS=-g
debug: $(OBJ)
	echo "debug compile..."
	$(CXX) $(CXXFLAGS) $^ -o catalan.out
	chmod +x catalan.out

clean :
	rm *.o *.c catalan.out

%.o: %.cpp
	$(CC) $(CXXFLAGS) -c $^ -o $@
