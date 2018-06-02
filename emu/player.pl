% this file takes the pattern in notes and emits a sequence of notes

:- [notes].

next(X,Z) :- scale_c(X,Y), scale_c(Y,Z).

generate(Filename, Start, Next, X) :- open(Filename, append, Stream)
                            , write(Stream, Start), write(Stream, ", ")
                            , close(Stream)
                            , next(Start, Next)
                            , X > 1
                            , Y is X-1
                            , generate(Filename, Next,_,Y).
