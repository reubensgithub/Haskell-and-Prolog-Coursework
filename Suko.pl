/*Begin Question 3.1*/
findindex( 0, [H|_], H ).
findindex( N, [_|T], W )
	:- N1 is N - 1,
       findindex( N1, T, W ).

indices( [], [], [] ).
indices( [_|_], [], [] ).
indices( [], [_|_], [] ).
indices( [H|T], L, [V|W] )
  :- findindex( H, L, V ),
     indices( T, L, W ).

/*End Question 3.1*/
/*Begin Question 3.2*/
movenum( X, [X|T], T ).  
movenum( X, [H|T], [H|V] )
	:- movenum( X, T, V ).

arrangements( [],[] ).
arrangements( [H|T], V )
	:- arrangements( T, W ), 
       movenum( H, V, W ).

possible( GRID )
	:- X = [1,2,3,4,5,6,7,8,9],
       arrangements( X, GRID ),
       write(GRID).

/*End Question 3.2*/
/*Begin Question 3.3*/
sumlist( [], 0 ).
sumlist( [H|T], N )
	:- sumlist( T, W ),
       N is H + W.

acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID )
  	:- indices( US, GRID, X ),
	   sumlist( X, Y ),
       Y is U,
       indices( VS, GRID, A ),
       sumlist( A, B ),
       B is V,
       indices( WS, GRID, C ),
       sumlist( C, D ),
       D is W,
       indices( [0,1,3,4], GRID, E ),
       sumlist( E, F ),
       F is T0,
       indices( [1,2,4,5], GRID, G ),
       sumlist( G, H ),
       H is T1,
       indices( [3,4,6,7], GRID, I ),
       sumlist( I, J ),
       J is T2,
       indices( [4,5,7,8], GRID, K ),
       sumlist( K, L ),
       L is T3.

suko( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID)
  	:- possible( GRID ),
       acceptable( T0, T1, T2, T3, US, U, VS, V, WS, W, GRID),
       write(GRID).
       

/*End Question 3.3*/

% any main predicates for testing goes here
main
    :- suko( 15, 14, 26, 23
, [0,1,2,3], 16
, [4,6,7], 17
, [5,8], 12
, GRID ).






