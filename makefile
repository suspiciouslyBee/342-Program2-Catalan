# Makefile for catalan to ensure Linux compatibility and ease of testing.
# Made this to refresh my knowledge of writing Makefiles. Did have to look up
# outside documentation, lost my notes for when a previous class covered this.
# 
# Author: June

CXX=g++
OBJ=main.o catalan.o
CXXFLAGS=

all: $(OBJ)
	$(CXX) $(CXXFLAGS) $^ -o catalan
	chmod +x catalan

debug: CXXFLAGS=-g
debug: $(OBJ)
	echo "debug compile..."
	$(CXX) $(CXXFLAGS) $^ -o catalan
	chmod +x catalan

clean :
	rm *.o *.c catalan

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o $@
