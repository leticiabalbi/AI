s(a,b).
s(b,c).
s(c,a).
s(c,f(d)).
s(f(N),f(g(N))).
s(f(g(X)),X).
goal(d).

member(X,[X,_]).
member(X,[_|Y]) :- member(X,Y).

solve(Bound,Node,Path):-
    dfs(Bound,[],Node,Path).
solve(Bound,Node,Path):-
    NBound is Bound+1,
    write('Now bound is: '), write(NBound),nl,
    solve(NBound,Node,Path).
dfs(_,Path,Node,[Node|Path]):-
    goal(Node),
    write('Node visited: '), write(Node),nl.
dfs(Bound,Path,Node,FinalPath):-
    Bound > 0,
    s(Node,Node1),
    \+ member(Node1,Path),
    Bottom is Bound - 1,
    write('Node visited: '), write(Node),nl,
    dfs(Bottom,[Node|Path],Node1,FinalPath).