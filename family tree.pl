%facts
female(sahba).
female(saye).
female(shams).
female(tia).
female(sue).
male(randy).
male(shirou).
male(mani).
male(ardavan).
male(karim).
male(masoud).
male(abdolah).
male(soroush).
male(abbas).
male(gholi).
married(shams,abdolah).
married(abdolah,shams).
married(saye,masoud).
married(masoud,saye).
married(sahba,shirou).
married(shirou,sahba).
parent(shams,sahba).
parent(shams,saye).
parent(abdolah,sahba).
parent(abdolah,saye).
parent(karim,shirou).
parent(sahba,mani).
parent(sahba,ardavan).
parent(shirou,mani).
parent(shirou,ardavan).
parent(saye,soroush).
parent(masoud,soroush).
parent(shirou,tia).
parent(shirou,randy).
parent(sue,tia).
parent(sue,randy).
parent(abbas,karim).
parent(gholi,abbas).


%rules
%father should be male and parent of C
father(F,C):-male(F),parent(F,C).
son(S,P):-male(S),parent(P,S).
daughter(D,P):-female(D),parent(P,D).
%mother should be female and parent of C
mother(M,C):-female(M),parent(M,C).
grandfather(G,X):-parent(G,C),parent(C,X).
%same parent for sistem and brother and they should nt be the same person
sibilings(X,Y):-parent(M,X),parent(M,Y),X\=Y.
sister(X,Y):-female(X),sibilings(X,Y).
brother(X,Y):-male(X),sibilings(X,Y).
%aunt and uncle is the parent sister and brother 
aunt(A,X):-sister(A,Z),parent(Z,X).
uncle(U,X):-brother(U,Y),parent(Y,X).
cousin(X,Y):-parent(Px,X),parent(Py,Y),sibilings(Px,Py).
%persons that have one same parent and their other parent are not the same 
half_sibling(X,Y) :-parent(Parent1,X),parent(Parent1,Y),parent(Parent2,X),parent(Parent3,Y),Parent1\==Parent2,Parent1\==Parent3,Parent2\==Parent3.
%ansestor returns all the persons that are on top of you 
ancestor(A,X):-parent(A,X).
ancestor(A,X):-aunt(A,X).
ancestor(A,X):-uncle(A,X).
ancestor(A,X):-parent(A,Y),ancestor(Y,X).


%test cases
/*
father(X,mani).
son(ardavan,X).
grandfather(X.mani).
sibilings(sahba,X).
aunt(X,mani).
cousin(X,ardavan).
half_sibling(X,mani).
ancestor(X,shirou).
*/





