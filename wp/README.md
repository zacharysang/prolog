# Weakest Precondition Finder

## What is weakest precondition?
For a dense authoritative definition, please see [here](https://en.wikipedia.org/wiki/Predicate_transformer_semantics#Weakest_preconditions).
But in loose terms, the weakest precondition is the most general state (A) such that when a statement (s) is executed, the resulting state is B.
For the purposes of this program, we will call a state a set of variables and their assignments.
With this in mind, a weakest precondition simply becomes the answer to the question: `What variable values be present for this expression to give me this set of variable values?`

## Why weakest precondition?
The goal of this effort is to leverage this concept to enable people to ask questions about software like:
* what state is required for this variable to take a certain value (eg: for isAuthorized=TRUE)
* what state is required for me to execute a function f? (imagine f is a sensitive operation like: `deleteData()`)
* what state is required for me to access certain information?

## Why prolog?
Prolog is a declarative language that has a built-in prover, and is centered around the concept of proving goals using backtracking.
I am not super familiar with the concept of weakest preconditions (I am hoping to learn more while working on this), 
but it feels like these features will be useful when searching for and proving certain properties about given software.

## The Vision
The goal of this tool is to allow the user to select a given line of code and to ask: what variables values needed to eb assigned to get to this point?
or: what variable values are needed for this statement to produce this state?

## The approach
* Build a utility to parse code into a prolog knowledge base (this will be most of the work)
* Define concepts in prolog such as literals, operators, statements, etc. that can be used as the terminology in queries
* provide a means for people to access and use this tool with any codebase
