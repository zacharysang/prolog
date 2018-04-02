%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Patrick Blackburn, 1999.
% Kristina Striegnitz, 2002.
%
% This file contains the code for a simple fsa recognizer:
%
%   recognize1(+Node,?SymbolList)
%        
%        SymbolList:  list of words which you want to test.
%                 
%        Node:  number of the node you wish to start from
%
% This clause succeeds if SymbolList can be recognized by the fsa in the
% database starting from the node 'Node' and ending in a final state.
%
% The program is based on the Gazdar and Mellish program
% fstnrecg.pl. 
%
% This file furthermore defines:
% + two driver predicates test1(+SymbolList) (for recognition) and 
%                         generate1(-SymbolList) (for generation)
% + traverse1/3
%
% NOTE: traverse1 cannot handle jump arcs or abreviations/categories.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% recognize1(+Node,?List)

%%% base case
recognize1(Node,[]) :-
    final(Node).

%%% make a transition reading the first Symbol of the input 
%%% and call recognize1 recursively with the rest of the input
recognize1(Node_1,String) :-
    arc(Node_1,Node_2,Label),
    traverse1(Label,String,NewString),
    recognize1(Node_2,NewString).


%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% traverse1(+Label,?List, -List)
%%% Evaluates to true if Label is the first element of the List in
%%% the second argument, and returns the rest of this list in its
%%% third argument.

traverse1(Label,[Label|Symbols],Symbols).

%%%%%%%%%%%%%%%%%%%%%%%%%
%%% two driver predicates

test1(Symbols) :-
    initial(Node),
    recognize1(Node,Symbols).

generate1(X) :-
   test1(X).