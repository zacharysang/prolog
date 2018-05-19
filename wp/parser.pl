/*
 * Given software source code, this will extract a KB to be queried against with input from the rules in defs
 * For the time being, this will only work on single-file programs
 */

% for each normal line, add a fact that allows the line number to go to the next one with a null condition


% for each if statement, add a fact that allows the line number to go from the current line to the proceeding line if the condition is met
% also add a fact that allows the line number to go to the end of the conditional block otherwise


% for each loop, add a fact that allows the line number to go inside the loop if the invariant is met
% also add a fact the line number to skip to after the loop if the invariant is not met

