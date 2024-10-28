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
  echo "Too Short Argument Handling Passed"
