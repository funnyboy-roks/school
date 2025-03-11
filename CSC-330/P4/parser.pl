use_module(library(pcre)).
% use this predicate from SWI terminal, i.e. "parse_file."
parse_file :- parse_file("src.txt"). % invokes a version of parse_file that takes in a file

%% Parsing and Pretty Printing
parse_file(FileName, X) :- open(FileName, read, Stream),
                     read_string(Stream, _, String),
                     string_lines(String, Lines),
                     exclude(is_whitespace, Lines, Lines2),
                     maplist(parse_line, X, Lines2).

is_whitespace(S) :- re_match("^\\s*$", S).

print_line([]).
print_line([H|T]) :- write("\033[32m"), write(H), write(" \033[33m"), print_line(T).

lex_line(Tokens, Line) :- normalize_space(string(S), Line),
                          % split_string(S, " ", "", L),
                          re_split("=|\\+|\\*|([a-zA-Z0-9]+)", S, L),
                          exclude(is_whitespace, L, L2),
                          maplist(atom_string, Tokens, L2). 

eval_rvalue([N], V) :- num(X, N), V = X, !.
eval_rvalue([D], V) :- ident(D), nb_current(D, V), !.

split_assign([_, X|R], Y, V) :- Y = X, eval_rvalue(R, V).
print_eval(X) :- assignment(X),
             split_assign(X, D, V),
             eval_rvalue(V, R),
             write(D),
             write(" = "),
             write(R), !.

parse_line(X, Line) :- lex_line(T, Line),
                      print_line(T),
                      write("-> \033[35m"),
                      print_eval(T),
                      nl.

% define more predicates here

% Grammar
unit(Tokens, X) :- X = assignment(Tokens).
unit(Tokens, X) :- X = print_call(Tokens).

% define assignment, print_call, and more predicates here
assignment(L) :- append([set, Foo], [=|R], L), ident(Foo), rvalue(R), !.
print_call(L) :- append([print], R, L), rvalue(R).

rvalue(R) :- math_exp(R), !.
rvalue([N]) :- num(_, N), !.
rvalue([D]) :- ident(D), !.

math_exp(L) :- append([N, +], L2, L), num(_, N), math_exp(L2), !.
math_exp(L) :- append([N, *], L2, L), num(_, N), math_exp(L2), !.
math_exp(L) :- append([I, +], L2, L), ident(I), math_exp(L2), !.
math_exp(L) :- append([I, *], L2, L), ident(I), math_exp(L2), !.
math_exp([M]) :- num(_, M), !.
math_exp([M]) :- ident(M), !.

% Terminal Tokens (facts)
set('set').
print('print').
equals('=').
add('+').
mul('*').

%% Terminal Tokens (rules)
ident(Chars) :- atom_string(Chars, S), re_match("^[a-zA-Z][a-zA-Z0-9]+$", S).
num(Num, Val) :- atom_number(Val, Num).
