first(F, [F|_]).

middle(M, [_,_,M,_,_]).

left(A, B, [A,B|_]).

left(A, B, [_|R]) :- 
    left(A, B, R).

next_to(A, B, L) :-
    left(A,B,L);
    left(B,A,L).

run :-
    X = [_,_,_,_,_],                                                        % There are five houses
    member([red,british,_,_,_], X),                                         % The Brit lives in the red house.
    member([_,swedish,_,_,dog], X),                                         % The Swede is keeping a dog.
    member([_,danish,tea,_,_], X),                                          % The Dane likes to drink tea.
    left([green,_,_,_,_], [white,_,_,_,_], X),                              % The green house is directly to the left of the white house.
    member([green, _, coffee, _, _], X),                                    % The owner of the green house drinks coffee.
    member([_,_,_,pall_mall,bird], X),                                      % The person smoking Pall Mall is keeping a bird.
    middle([_,_,milk,_,_], X),                                              % The man who lives in the middle house drinks milk.
    member([yellow,_,_,dunhill,_], X),                                      % The owner of the yellow house smokes Dunhill.
    first([_,norwegian,_,_,_], X),                                          % The Norwegian lives in the first house.
    next_to([_,_,_,marlboro,_], [_,_,_,_,cat], X),                          % The Marlboro smoker lives next to the one who keeps a cat.
    next_to([_,_,_,_,horse], [_,_,_,dunhill,_], X),                         % The man who keeps a horse lives next to the one who smokes Dunhill.
    member([_,_,beer,winfield,_], X),                                       % The Winfield smoker likes to drink beer.
    next_to([_,norwegian,_,_,_], [blue,_,_,_,_], X),                        % The Norwegian lives next to the blue house.
    member([_,german,_,rothmans,_], X),                                     % The German smokes Rothmans.
    next_to([_,_,_,marlboro,_], [_,_,water,_,_], X),                        % The Marlboro smoker has a neighbour who drinks water.
    member([_,N,_,_,fish], X),                                              % The person with the nationality N keeps the fish
    write(X), nl,                                                           % Print all houses
    write('The '), write(N), write(' keeps a fish as a pet.'), nl.

% | ?-
%   [
%       [yellow, norwegian, water,  dunhill,   cat],
%       [blue,   danish,    tea,    marlboro,  horse],
%       [red,    british,   milk,   pall_mall, bird],
%       [green,  german,    coffee, rothmans,  fish],
%       [white,  swedish,   beer,   winfield,  dog]
%   ]
% The german keeps a fish as a pet.