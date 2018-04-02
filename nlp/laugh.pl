% Define the fsm for laughing
initial(1).
final(4).
arc(1,2,h).
arc(2,3,a).
arc(3,4,!).
arc(3,2,h).

% code to define a valid path
% valid if arg2(list) - arg1(label) = arg3(tail)
path(Label, [Label|Symbols], Symbols).

% function for recognizing text

% Node with empty list is matched if Node is the final state
recognize(Node, []) :- final(Node).

% Node with list of symbols matches if
% there is a path through arcs that puts us in a final state with an empty list and final(Node) being valid
recognize(Node, Symbols) :-
	arc(Node,Node2,Label), % should recognize if there is an arc from Node to Node2 for Label
	path(Label, Symbols, Symbols2), % and Label is the next symbol in the string
	recognize(Node2,Symbols2). % this pattern continues recursivey down to the base case