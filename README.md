# HW5 Option 1 - Flex/Bison Arithmetic Expression Evaluator 

This program implements a simple compiler front-end using Flex (Lex) and Bison (Yacc) to:

- Evaluate valid arithmetic expressions using +, -, *, /, unary minus, integers, and parentheses.
- Invalid expressions and division by zero print:  
     Entered expression is invalid!
  
---

## Table of Contents

1. [Grammar Used](#-Grammar-Used)
2. [Getting Started](#-Getting-Started)
3. [References](#-References)  
4. [Core Features](#-Core-Features)

---

## Grammar Used

The program is based on the following context-free grammar:

E → E+T|E-T|-E|T
T → T*F|T/F|F
F → int|(E)

---

## Getting Started

**Prerequisites**
- Flex
- Bison
- GCC (or g++) 

**Setup**
- Bison for Windows: http://gnuwin32.sourceforge.net/packages/bison.htm
- Bison for Ubuntu/Linux: https://installati.one/ubuntu/21.04/bison/

**How to Run**
Compile and run on Linux / macOS / MSYS2:
flex lex.l  
bison -d yacc.y  
gcc lex.yy.c yacc.tab.c -o hw5_compiler  
./hw5_compiler < sample_test_cases.txt > test_case_output.txt  

**Run manually**
./hw5_compiler
Then type one expression per line and press Enter.

---

## References 
- Keith Clarke, "The top-down parsing of expressions",  
  Research Report 383, Dept of Computer Science, Queen Mary College.

---

## Core Features 

**1. Recognize arithmetic expressions based on the given grammar**

**2. Evaluate valid expressions**

**3. Report errors for invalid expressions**
