% Test 1
%path(a, b, 10).
%path(b, c, 15).
%path(d, c, 5).
%path(d, b, 10).

% Test 2
%path(a, b, 5).
%path(c, d, 10).

% Test 3
%path(a, b, 5).
%path(b, c, 10).
%path(a, c, 15).
%path(d, c, 5).
%path(f, c, 15).
%path(b, f, 5).
%path(e, d, 10).

% Test 4
%path(a, b, 2).
%path(a, c, 14).
%path(b, d, 41).
%path(c, e, 15).
%path(c, f, 20).
%path(d, h, 18).
%path(e, h, 17).
%path(f, g, 39).
%path(g, h, 21).

% Test 5
path(a, b, 10).
path(a, d, 5).
path(b, c, 10).
path(c, d, 20).
path(b, d, 15).
path(d, e, 5).
path(b, e, 15).

% Test 6
%path(ab, cd, 10).
%path(ac, db, 20).
%path(ab, db, 15).
%path(fg, ab, 5).
%path(zz, xx, 100).
%path(hk, db, 1).
%path(fg, hk, 15).
%path(xx, yy, 120).
%path(zz, ww, 115).
%path(yy, zz, 110).



% Bidirectional pathways
direction(X, Y, N) :- path(X, Y, N);
		      path(Y, X, N).


% Recurse through the available pathways, trying to find a path from X to Y.
% Keep a list of visted nodes to avoid entering cycles.
walk(X, Y, V, [Y|V], S, S) :- X = Y.
walk(X, Y, V, L, S, N) :- direction(X, Z, M),
			  not(member(Z, V)),
			  K is S + M,
			  walk(Z, Y, [X|V], L, K, N).


% Travels from X to Y, storing the path taken in P and the total distance traveled in N.
% Otherwise, if no path from X to Y is found, returns false.
% Envoked by User.
solve(X, Y, P, N) :- walk(X, Y, [], L, 0, N),
		     reverse(L, P).

