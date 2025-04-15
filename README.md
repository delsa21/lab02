# lab02
Objective: Enhance your understanding of context-free grammar (CFG) by creating a CFG for the calculator you previously developed using YACC, ensuring the grammar is unambiguous.

Requirements:

A Linux machine (either a virtual machine or a physical host)
GCC compiler
Git send mail server installed and configured on your Linux machine
YACC (Yet Another Compiler Compiler) installed on your Linux machine
Instructions:

Understanding the Code:

Review the following basic code snippet:
// basic code
// float bf b
// integer ai a
// a = 5
a = 5
// b = a + 3.2
b = a + 3.2
// print 8.5
p b
This code defines a simple calculator with variable declarations and operations.
Token Generation:

Reuse the code from Lab 04 
Ensure your calculator accepts operators: +, -, *, /.
CFG Analysis with YACC:

Use YACC to define the grammar for your calculator.
Ensure that the grammar is unambiguous. This means:
Each valid input string should have exactly one parse tree.
Avoid common ambiguities such as those caused by operator precedence and associativity.
Testing the Compiler:

Run the lexical analyzer with the command:
./compiler SOURCE_CODE
SOURCE_CODE
 

// basic code

// float b
f b

// integer a
i a

a = 5 
b = a + 3.2 
// print 8.5

p b
Additional Resources:

Review YACC documentation and examples to understand better how to define and work with grammar.
