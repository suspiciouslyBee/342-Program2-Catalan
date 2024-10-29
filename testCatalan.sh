#!/bin/bash

'
Name: June

File: Catlan Tester

Description: Unit Tests for Catalan. Calls Makefile, then tests compiled work.

TODO: need to write make clean routine


'

TESTINGSCORE = 0;

make

# Format

./catalan
if [ $? -eq -2];
then
  echo "Too Short Argument Handling Length Passed"
  TESTINGSCORE = $((TESTINGSCORE + 1))
fi

./calalan 3 4
if [ $? -eq -2];
then
  echo "Too Long Argument Handling Passed"
  
  TESTINGSCORE = $((TESTINGSCORE + 1))
fi



./calalan string
if [ $? -eq -3];
then
  echo "Non-Number Argument Handling Passed"
  TESTINGSCORE = $((TESTINGSCORE + 1))
fi


./calalan 3.4
if [ $? -eq -3];
then
  echo "Non-Int Argument Handling Passed"
  TESTINGSCORE = $((TESTINGSCORE + 1))
fi


./calalan -4
if [ $? -eq -4];
then
  echo "Negative Argument Handling Passed"
  TESTINGSCORE = $((TESTINGSCORE + 1))
fi

./calalan 1000
if [ $? -eq -5];
then
  echo "Max Argument Handling Passed"
  
  TESTINGSCORE = $((TESTINGSCORE + 1))
fi


./calalan 0
if [ $? -eq 1];
then
  echo "Passed Case 0"
  
  TESTINGSCORE = $((TESTINGSCORE + 1))
fi

./calalan 1
if [ $? -eq 1];
then
  echo "Passed Case 1"
  
  TESTINGSCORE = $((TESTINGSCORE + 1))
fi

./calalan 4
if [ $? -eq 14];
then
  echo "Passed Case 4"
  
  TESTINGSCORE = $((TESTINGSCORE + 1))
fi

./calalan 10
if [ $? -eq 16796];
then
  echo "Passed Case 10"
  
  TESTINGSCORE = $((TESTINGSCORE + 1))
fi

echo "Testing Complete"
echo $(TESTINGSCORE)
