/*Begin Question 4.1*/
isprime( X, Y )
	:- N is Y * Y,
	   N =< X,
       ( X mod Y ) =:= 0.
isprime( X, Y )
	:- Y < X,
       Y1 is Y + 1,
       isprime(X, Y1).

prime( N )
  	:- Y is 2,
       N > 1,
       \+ isprime(N,Y).

/*End Question 4.1*/
/*Begin Question 4.2*/
/* the digits 1 to 9 should occur in all 3 bearings */
numcheck(V,A,B,C,D,E,F,G,H,I)
	:- number_codes(V,N), 
       maplist(plus(48),X,N),    
       member(A,X),
       member(B,X),
       member(C,X),
       member(D,X),
	   member(E,X),
	   member(F,X),
	   member(G,X),
	   member(H,X),
	   member(I,X).

concat_num(N1, N2, N3, R) 
	:- number_chars(N1, [Ch1, Ch2, Ch3]),
       number_chars(N2, [Ch4, Ch5, Ch6]),
       number_chars(N3, [Ch7, Ch8, Ch9]),
       number_chars(R, [Ch1,Ch2,Ch3,Ch4,Ch5,Ch6,Ch7,Ch8,Ch9]).


gen_list(A, A, [A]).
gen_list(A, B, [A|T])
	:- \+ prime( A ),
       A < B,
       A1 is A + 1,
       gen_list( A1, B, T ).
gen_list(A, B, T)
	:- prime(A),
       A < B,
       A1 is A + 1,
       gen_list( A1, B, T ).


first_element([H|_], H).
second_element([_,X|_], X).
third_element([_,_,X|_], X).

combinations(L1, L2, L3, N) 
	:- findall((X,Y,Z), (member(X, L1), member(Y, L2), member(Z, L3)), N).


tuple_to_list_convert(Tuples, List)
	:- maplist(tuple_to_list, Tuples, List).

tuple_to_list((A,B,C), [A,B,C]).


possible( X, Y, Z )
  	:- X1 is 130,
       Y1 is 220,
       Z1 is 330,
       gen_list(X1, 179, XS),
       gen_list(Y1, 269, YS),
       gen_list(Z1, 359, ZS),
       combinations(XS, YS, ZS, AS),
       tuple_to_list_convert(AS,BS),
       member(V, BS),
       first_element(V, X),
       second_element(V, Y),
       third_element(V, Z).

/*End Question 4.2*/
/*Begin Question 4.3*/

acceptable( X, Y, Z ) 
  	:- \+ prime( X ),
       \+ prime( Y ),
       \+ prime( Z ),
       X > 90,
       X < 180,
       Y > 180,
       Y < 270,
       Z > 270,
       Z < 360,
       concat_num(X, Y, Z, V),
       numcheck(V,1,2,3,4,5,6,7,8,9).
       

trait( X, Y, Z )
  	:- possible(X, Y, Z),
       acceptable(X, Y, Z).

/*End Question 4.3*/
% any main predicates for testing goes here
/*main
    :- trait(X, Y, Z). */