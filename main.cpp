////
//  Program: Catalan Main
//
//  Author: June
//  
//  Class: 342
//
//  Description: This is the outer wrapper for Catalan that interfaces it with 
//  the Catalan class. Handles input, where Catalan itself is just computation.
//
//  Usage: Accepts one positive integer via command line and calculates it's
//  Catalan result. After calculating, prints result to cout, and returns
//  result to cout. Has compile-time adjustable max value under "maximum".
//
//  Special Return Codes: 
//    1    : Potential Memory Corruption
//    2, 3 : invalid format
//    4, 5 : out of bounds
//    0    : Calculated Sucessfully
////
#include <stdlib.h>

#include <iostream>
#include <sstream>
#include <cstdint>

#include "catalan.h"

constexpr int64_t maximum = 40;   // For easy adjusting.

void ErrorPrint(int errCode, std::ostream& out);

int main(int argc, char *argv[]) {
    

    
  if (argc != 2){
    ErrorPrint(2, std::cout);    // too many/few arguments
  }

  std::stringstream argument;
  argument << argv[1];
  int64_t number = 0;
  argument >> number;    
  

  //Input Sanity Checks
  if (argument.fail()) {
    if (argument.bad()) {
      ErrorPrint(1, std::cout);  // Potential Mem Corruption
    }
    ErrorPrint(3, std::cout);    // Non-Integer Argument
  }

  if (number < 0) {
    ErrorPrint(4, std::cout);
  }
    
  if (number >= maximum) {
    ErrorPrint(5, std::cout);
  }
  
  //Input is now sanitized to supported for catalan()
    
  int64_t answer = 0;
  answer = Catalan::catalan(number);
  std::cout << answer << std::endl;

  return 0;
    
}  

//Prints error code to ostream, then exits program via exit.
//Returns an error code via exit()
void ErrorPrint(int errCode, std::ostream& out){
 
  out << "Error: ";
   switch (errCode){
    case 1:
      out << "stringstream badbit is true! (Is your memory stable?)";
      break;
    case 2:
      out << "invalid format - too many/few arguments";
      break;
    case 3:
      out << "invalid format - argument is not an integer";
      break;
    case 4:
      out << "out of bounds - argument is negative";
      break;
    case 5:
      out << "out of bounds - argument exceeds maximum";
      break;
    default:
      out << "unexpected!! return val is " << errCode << "!";
      break;
  }
   
  out << "\nusage: catalan <number>\n";
  out << "  note: number must be a postive integer\n\n";
  out << "        maximum input: " << maximum << std::endl;
  
  //There is a problem, program needs to tear it all down as fast as it can.
  exit(errCode);
}
