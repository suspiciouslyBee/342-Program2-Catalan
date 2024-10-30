#!/bin/bash

##
# Name: June
#
# File: Catlan Tester
#
# Description: Unit Tests for Catalan. Calls Makefile, then tests compiled work.
#
##

TESTINGSCORE=0

make

# Confirms error data. 

./catalan.out
if [ $? -eq 2 ];
then
  echo "Print check: that print is not fwd'd to dev/null"
  echo "Too Short Argument Handling Length Passed"
  TESTINGSCORE=$((TESTINGSCORE + 1))
fi

./catalan.out 3 4 > /dev/null
if [ $? -eq 2 ];
then
  echo "Too Long Argument Handling Passed"
  
  TESTINGSCORE=$((TESTINGSCORE + 1))
fi



./catalan.out string > /dev/null
if [ $? -eq 3 ];
then
  echo "Non-Number Argument Handling Passed"
  TESTINGSCORE=$((TESTINGSCORE + 1))
fi


./catalan.out 3.4 > /dev/null
if [ $? -eq 3 ];
then
  echo "Non-Int Argument Handling Passed"
  TESTINGSCORE=$((TESTINGSCORE + 1))
fi


./catalan.out -4 > /dev/null
if [ $? -eq 4 ];
then
  echo "Negative Argument Handling Passed"
  TESTINGSCORE=$((TESTINGSCORE + 1))
fi

./catalan.out 1000 > /dev/null
if [ $? -eq 5 ];
then
  echo "Max Argument Handling Passed"
  
  TESTINGSCORE=$((TESTINGSCORE + 1))
fi


if [ $(./catalan.out 0 | tail -n 1) == "1" ];
then
  echo "Passed Case for 0"
  
  TESTINGSCORE=$((TESTINGSCORE + 1))
fi

if [ $(./catalan.out 1 | tail -n 1) == "1" ];
then
  echo "Passed Case for 1"
  
  TESTINGSCORE=$((TESTINGSCORE + 1))
fi

if [ $(./catalan.out 4 | tail -n 1) == "14" ];
then
  echo "Passed Case for 4"
  
  TESTINGSCORE=$((TESTINGSCORE + 1))
fi

if [ $(./catalan.out 10 | tail -n 1) == "16796" ];
then
  echo "Passed Case for 10"
  
  TESTINGSCORE=$((TESTINGSCORE + 1))
fi

echo "Testing Complete"
echo "Final total out of 9: ${TESTINGSCORE}"
