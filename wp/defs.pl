/*
 * This file will hold definitions about weakest preconditions
 * and how they relate to typical programming constructs like variables, values, operators, etc.
 */

% example query: is it possible for me to reach Ln1? reachable when a=5 (Ln0, Ln1, {a:5})

% 2 ways to evolve line number: branching, normal execution (will treat normal line increment as a special case of branching)
evolve(Ln1, Ln2, condition(Op, A, B)). % we can go from line 1 to line 2 if condition is met
evolve(Ln1, Ln2, null). % a null condition always allows us to make the jump

% it is possible to directly use text from the code for the KB
condition(lt, A, B) :- A < B.
condition(le, A, B) :- A <= B.
condition(eq, A, B) :- A = B.
condition(gt, A, B) :- A > B.
condition(ge, A, B) :- A >= B.