#import "@preview/lemmify:0.1.5": *

= Chapter 3

== 3.1 -- Arithmetic on $NN$

#let notin = math.class(
  "relation",
  $cancel(in)$,
)

#let my-thm-style(
  thm-type, name, number, body
) = grid(
  columns: (1fr, 3fr),
  column-gutter: 1em,
  stack(spacing: .5em, [#strong(thm-type) #number], emph(name)),
  body
)
#let my-styling = (
  thm-styling: my-thm-style,
  thm-numbering: _ => none
)

#let (
  definition: def, theorem, proof, lemma, rules, example
) = default-theorems("thm-group", lang: "en", ..my-styling)
#show: rules
#let (
  exercise, prop, rules
) = new-theorems("thm-group", ("exercise": "Exercise", "prop": "Proposition"), ..my-styling)
#show: rules
#show thm-selector("thm-group"): box.with(inset: 0.8em)
#show thm-selector("thm-group", subgroup: "theorem"): it => box(
  it, fill: rgb("#eeffee"))

#def[
  A binary operation on a set $S$ is a function $compose: S times S -> S$
]

Notation: let $compose: S times S ->S$ be a binary operation: $forall a,b in S: a compose b = compose (a,b)$

def: $forall m,n in NN$, the relation $+: NN times NN -> NN$ is defined by:

$n + 1 = n'$ \
$n + m' = (n + m)'$

Set theoretic terms:

1. $forall m,n in NN: ((m,n), 1) notin +$
2. $forall n in NN: ((n, 1), m') in +$
3. $((n, m'), k') in + <==> ((n, m), k') in +$

prop:

The relation $+$ is a binary operation on $NN$. 

#proof[
  1. To prove $+$ is totally defined, we must prove $n + m in NN$, $forall m, n
     in NN$. let $n in NN$ be ABF.  Let $S = { m in N : [ exists k in NN: ((n,
     m), k) in + ]}$.  We will use induction on $m$.  By def of $NN$, $1 in S$.
     Then $((n, 1), n') in +$.  Moreover, $forall m in S : exists k in NN :
     ((n, m), k) in +$.  By def of $+$, $((n, m'), k') in +$, hence, $m' in S$,
     therefore by P of I, $S = NN$ and $+$ is totally defined.
  2. To prove well-definedness, we muyst prove $n + m$ is unique $forall m, n
     in NN$.  let $n in NN$ be ABF and $S = {m in N : forall k, l in NN : ((n,
     m), k) in + and ((n, m), l) in + ==> l = k }$.  let $m = 1$, then $n + m =
     n + 1 = n'$.  Then, $l = n' = k ==> l = k$ and $1 in S$.  To show $m' in
     S$, let $m in S$, let $((n, m'), k) in + and ((n, m'), l) in +$.  Since,
     $((n, m), 1) notin +$, $exists j_k, j_l: k = j_k ' and l = j_l '$.  By
     definition, since $((n,m'), l) in +$, we have $((n, m), j_l) in + and$
     since $((n, m'), k) in +$, we have $((n, m), j_k) in +$.  Since $m in S$,
     we have $j_k = j_l$.  By def, $j_k ' = j_l ' ==> k = l ==> m' in S$ and $S
     = NN$.  Thus, $+$ is well-defined.
  Thus, since $+$ is totally and well defined, it is a function and thus a
  binary operation.
]

Properties of $NN$

1. $forall m, n, k in NN: (n + m) + k = n + (m + k)$ -- Associativity
2. $forall m, n in NN: n + m = m + n$ -- Commutativity


#proof(name: [Associativity on $+$ by induction on $k$])[
  let $m, n, k in NN$.  Let $m, n$ be ABF.  Let $S = { k in NN : (n + m) + k = n + (m + k) }$. \

  Let $k = 1$: \
  $ (n + m) + 1 = (n + m)' = n + m' = n + (m + 1) ==> 1 in S$

  Let $k in S$ to show $k' in S$ \
  $ (n + m) + k' &= ((n + m) + k) \
    &= (n + (m + k))' \
    &= n + (m + k)' \
    &= n + (m + k') ==> k' in S "and" S = NN
  $
]

#exercise[Prove Commutativity]

// #let foo(n) = {
//   if n == 1 {
//     ($emptyset$,)
//   } else {
//     foo(n - 1) + (foo(n - 1),)
//   }
// };
// 
// #let a = foo(2)
// #a

#def(name: [Usual Representation of $NN$])[
  $
  1 &= {0} \
  2 &= 1' &= 1 + 1 &= { emptyset, { emptyset } } \
  3 &= 2' &= 2 + 1 &= { emptyset, { emptyset }, { emptyset, { emptyset } } } \
  &&dots.v \
  m' &= m + 1
  $
]

#prop[$3 + 5 = 8$]

#proof[
  $
  3 + 5 &= 5 + 3 \
  &= 5 + 2' \
  &= 5 + (2 + 1) \
  &= 5 + (1 + 1 + 1) \
  &= ((5 + 1) + 1) + 1 \
  &= (6 + 1) + 1 \
  &= 7 + 1 \
  &= 8 \
  $
]

#def[
  $forall m, n in NN$, the relation $dot: NN times NN -> NN$ is defined as \
  $n dot 1 = n$ \
  $n dot m' = n dot m + n$

  Or in set-theoretic notation: \
  1. $forall m, n in NN: ((n, m), 1) in dot <==> n = m = 1$
  2. $forall n in NN: ((n, 1), n) in dot$ is unique
  3. $forall m, n, k in NN$, we have $((n, m'), k + n) in dot <==> ((n, m), k) in dot$
]

#prop[$dot$ is a binary opoeration]
#exercise[Proof of above]

Properties:
1. $forall m, n, k in NN: (m dot n) dot k = m dot (n dot k)$
2. $forall m, n in NN: m dot n = n dot m$
2. $forall n in NN: n dot 1 = 1 dot n = n$ and $1$ is called the neutral element.

#exercise[proofs for these properties]

#prop(name: [Right Distributivity])[
  $forall m, n, k in NN: (n + m) dot k = n dot k + m dot k$
]

#prop(name: [Left Distributivity])[
  $forall m, n, k in NN n dot (m + k) = n dot m + n dot k$
]

#proof[
  (Assuming we proved Right distributivity)
  $
  n dot (m + k) = (m + k) dot n = m dot n + k dot n = n dot m + n dot k
  $
]

#prop[
  Let $a, b, c, d in NN$.  Then, $(a + b) dot (c + d) = a dot c + a dot d + b dot c + b dot d$
]

#proof[
  $
  (a + b)(c + d) &= (a + b)c + (a + b)d \
  &= a c + b c + a d + b d \
  &= a c + a d + b c + b d
  $
]

#proof(name: $2 dot 3 = 6$)[
  $
  2 dot 3 &= 2 dot 2 + 2 \
  &= 2 dot 1 + 2 + 2 \
  &= 2 + 2 + 2 \
  &= 2 + (1 + 1) + (1 + 1) \
  &= (((2 + 1) + 1) + 1) + 1 \
  &= ((3 + 1) + 1) + 1 \
  &= (4 + 1) + 1 \
  &= 5 + 1 \
  &= 6 \
  $
]

== 3.2 -- Ordering the Natural Numbers

#theorem(name: [The Trichotomy Condition])[
  $forall m, n in NN:$ exactly one of the following statements holds:

  1. $n = m$
  2. $exists d in NN: n + d = m$
  3. $exists d in NN: m + d = n$
]

#lemma[
  $forall n, d in NN: n + d != n$
]
#proof[
  Induction on $n$:  let $d in NN$ be ABF and $S = { n in NN: n + d != n }$

  To show $1 in S$, consider $1 + d = d + 1 = d'$.  Since $1$ is not a
  successor for any natural number, $1 + d != 1$, thus $1 in S$.

  Let $n in S$ and consider $n' + d$.  SFAC, $n' + d = n'$. $n' = n + d = d +
  n' = (d + n)'$.  Then, by def of successors, $n = d + n$.  Contradiction
  since $n in S$.  Therefore, $n' + d != n'$ and $n' in S$.  Thus, $S = NN$.
]

#proof(name: [Trichotomy Condition])[
  SFAC, $exists m, n in NN:$ two of the statements are satisfied.  
  Suppose (1) is satisfied and either (2) or (3) holds also.

  Then, either $n + d = m =n$ or $m + d = n = m$. a contradiction to the above
  lemma.  Now suppose 2 and 3 both hold.  Then, $n + d = m ==> m + d + d = m$.
  A contradiction to the lemma.

  Therefore, no two of the statements can hold simultaneously.

  For each $n in NN$, let $S(n)$ be the set of all $m in NN$ such that  one of
  (1), (2), or (3) holds for $m, n$.  Moreover, let $S = { n in NN : S(n) = NN
  }$. The result is proven if $S = NN$.

  First we need $1 in S$.  We must show $S(1) = NN$ and we will use mutual
  containment. Clearly, $S(1) subset.eq NN$.  Let $m in NN$ be ABF.  If $m =
  1$, (1) holds. If $m != 1, exists d in NN: m = d' = d + 1 = 1 + d ==>$ (2)
  holds.  Thus, $m in S(1)$ and $NN subset.eq S(1)$.  Therefore $S(1) = NN$ and
  $1 in S$.

  Now, let $n in S$.  Then $S(n) = NN$ and we must show $n' in S$, i.e. $S(n')
  = NN$. Because $S(1) = NN$, we have $1 in S(n')$  Let $m in S(n')$, we need
  to show that $m' in S(n')$.  Since $m in S(n')$, we have 3 cases.

  1. $m = n'$
  2. $exists d in NN: n' + d = m$
  3. $exists tilde(d) in NN: m + tilde(d) = n'$

  Case 1: Suppose $m = n'$.  Then $m' = m + 1 = n' + 1 ==>$ (2) holds and $m'
  in S(n')$ \
  Case 2: Suppose $exists d in NN : n' + d = m$.  Then, $m' = m + 1 = n' + d +
  1 ==>$ (2) holds and $m' in S(n')$ \
  Case 3: Suppose $exists tilde(d) in NN: m + tilde(d) = n'$ \
    if $tilde(d) = 1$, then $m' = m + 1 = m + tilde(d) = n' ==>$ (1) holds and
    $m' = S(n')$ \
    if $tilde(d) != 1$, then $tilde(d) = q'$ for some $q in NN$.  Then, $n' = m =
    tilde(d) = m + q' = m + q + 1 = (m + 1) + q = m' + q ==>$ (3) holds and $m'
    in S(n')$.

  Therefore, by the principle of induction, $S(n') = NN$.  Therefore $n' in S$
  and by P of I, $S = NN$, i.e. at least one of (1)-(3) holds and since at most
  one of (1)-(3) holds, we have that $forall m, n in NN$, exactly one of
  (1)-(3) holds.
]

#prop[
  Let $a, b, c in NN: c + a = c + b$.  Then, $a = b$.
]
#proof[
  SFAC, $a != b$.  Then $exists d in NN: a + d = b or b + d = a$.  Without loss
  of generality, assume $a + d = b$.  Then, $c + b = c + a + d = c + a + d = c
  + a$.  Contradiction.  Thus, $a = b$.
]

#prop[ Let $a, b, c in NN: a + c = b + c.$  Then, $a = b$ ]
#proof[ proof by commutativity ]

#line(length: 100%)
#proof(name: [commutativity of base case (addition 1 in S)])[
  Prove $forall n in NN, n + 1 = 1 + n$

  Let $S = { n in NN : n + 1 = 1 + n }$

  Let $1 in S$

  $1 + 1 = 1 + 1 ==> 1 in S$

  Let $n in S$.

  $n' + 1 = (n + 1) + 1 = (1 + n) + 1 = 1 + (n + 1) = 1 + n' ==> n' in S$

  By PI: $S = NN$.
]
#line(length: 100%)

#def[
  For $m, n in NN$, we define $m < n$ iff $exists d in NN : m + d
  = n$. We define $m <= n$ iff $m = n$ or $m < n$.
]

#def[
  Let $P$ be a set and let $<= in P times P$ be a relation on $P$.  Then $<=$
  is called an order relation iff: 

  1. $<=$ is reflexive: $forall x in P$, we have $x <= x$.
  2. $<=$ is antisymmetric: $forall x, y in P$, we  have that $x <= y and y <=
     x ==> x = y$
  3. $<=$ is transitive: $forall x, y, z, in P$, we have that $x <= y and y <=
     z ==> x <= y$

  The relation, $<=$ is called a total order iff $forall x, y in P$, we have $x
  <= y or y <= x$
]

#theorem[The relation $<=$ on $NN$ is a total order relation]

#proof(name: [Relation $<=$ on $NN$ is a total order relation])[
  Reflexivity: Let $x in NN$.  Since $x = x$, $x <= x$.

  Antisymmetry: Let $x, y in NN$ and suppose that $x <= y and y <= x$.
  SFAC $x != y$.  Then $x < y and y < x$.  Then, $exists d_1, d_2 in NN: x +
  d_1 = y and y + d_2 = x$.  Then, $y = x + d_1 = y + (d_2 + d_1)$, a
  contradiction.  Thus, $x = y$.

  Transivity: #strike[Let $x, y, z in NN and x <= y and y <= z$.  If $x < y$ or if $y <
  z$, we are done.] [ If $x < y$, then $exists d in NN: x + d = y$.  If $y = z$,
  then $x + d = z ==> x <= z$ if $y < z ==> exists tilde(d) in NN: y + tilde(d)
  = z.$  Then $y + tilde(d) = x + d + tilde(d) = z ==> x < z$] \
  #strike[If $x = y$ or $y = z$, we are also done.]  If $x = y$ and $y <= z ==> x <= z$.
  If $y = z$ and $x <= y ==> x <= z$.

  By the trichotomy condition, $<=$ on $NN$ is a total order.
]

#theorem[
  Let $x, y, z in NN$
  
  1. If $x <= y$, then $x + z < y + z$
  2. If $x <= y$, then $x dot z <= x dot z$
]

#proof(name: [Part 1])[
  Let $x, y, z in NN$ and $x <= y$.  If $x = y$, then $x + z = y + z ==> x + z <=
  y + z$.  If $x < y, exists d in NN: x + d = y$

  $y + z = (x + d) + z = x + (d + z) = (x + z) + d ==> x + z <= y + z$
]

#exercise[Proof of Part 2]

== 3.4 -- Induction

#theorem[
  Let $P(n)$ be a statement about a natural number $n$.  If $P(1)$ is true, and
  if $forall n in NN$, the truth of $P(n)$ implies the truth of $P(n + 1)$,
  then $P(n)$ holds $forall n in NN$.
]

#example[
  Prove the sum of the first $n$ odd natural numbers is $n^2$.

  $
  P(n): sum _(i = 1) ^n 2i - 1 = n^2
  $
  #proof[
    1. Base Case: Let $n = 1$. \
      LHS: $sum _(i = 1) ^1 (2i - 1) = 2 - 1 = 1$ \
      RHS: $(1)^2 = 1$
  
      Thus, $P(1)$ holds

    2. Assume $P(n)$ holds for some $n in NN$, $n > 1$

    3. Induction step: We will now prove $P(n + 1)$: $
      sum _(i = 1) ^(n + 1) (2i - 1) = (n + 1)^2
      $

      LHS: $
      sum _(i = 1) ^(n + 1) (2i - 1) &= sum _(i = 1) ^n (2i - 1) + 2(n + 1) - 1 \
      &= n^2 + 2(n + 1) - 1 &&& "By induction hypothesis" \
      &= n^2 + 2n + 1 \
      &= (n + 1)^2 &&& ": RHS" \
      $

      Thus, $P(n + 1)$ holds and by the Principle of Mathematical Induction,
      $P(n)$ holds $forall n in NN$.
  ]
]

#theorem[ Every nonempty set $A$ of natural numbers has a smallest element ]

#proof[
  Let $A subset.eq NN$ such that $A != emptyset$.  SFAC, $A$ has no smallest
  element

  We will prove by induction $P(n): { 1, 2, dots, n } sect A = emptyset$

  Base Case: Let $n = 1$.  ${ 1 } sect A = emptyset$, otherwise $1$ would be
  the smallest element, a contradiction.

  IH: For some natural number $n > 1$, assume $P(n)$ holds.

  IS: We will prove $P(n + 1): { 1, 2, dots, n, n + 1 } sect A = emptyset$.

  None of $1, 2, dots, n$ are in $A$ by I.H.  If $n + 1 in A$, then we have a
  smallest element. A contradiction.  Thus, ${1, 2, dots, n, n + 1} sect A =
  emptyset$ and $P(n + 1)$ holds.

  By PMI, $P(n)$ holds for all $n in NN$.  Therefore $A$ has no natural
  numbers, a contradiction.

  Thus, $A$ has a smallest element.
]

#def(name: [Finite Sets])[
  A set $F$ is called finite iff $F = emptyset$ or $exists n in NN$ and a
  bijective function $f: {1, 2, dots, n} -> F$  Then, we denote the cardinality
  of $F$ as $|F| = n$.

  - A non-finite set is called infinite and we define $|F| = oo$,
  - $|emptyset| = 0$.
]

#theorem[
  Let $A$ and $B$ be finite sets so that $A subset.eq B and |A| = |B|$.  Then,
  $A = B$.

  #proof[ In Text ]
]

== 3.5 -- Sums and Products

#def[
  Let $(S, +)$ be a semigroup and $forall j in NN,$ let $a_j in S$.

  Define the sum $ sum _(j=1) ^1 a_j = a_1 $ and $forall n in NN$,
  $ sum _(j=1) ^(n + 1) a_j = sum _(j=1) ^n a_j + a_(n+1) $
]

#theorem[
  Let $(S, +)$ be a semigroup and $forall j in NN$, let $a_j in NN$, then:

  1. $forall k in NN: sum _(j=1) ^n a_(j+k) = sum _(i=k+1) ^(k+n) a_i$
  2. $forall m, n in NN$, with $m < n$, $sum _(j=1) ^m a_j + sum _(j=m+1) ^n
     a_j = sum _(j=1) ^n a_j$
]

#proof(name: [Proof of 1])[
  Induction on $n$.

  BC: Let $n = 1$

  LHS: $sum _(j=1) ^1 a_(j+k) = a_(1+k)$ \
  RHS: $sum _(i=k+1) ^(k+1) a_i = a_(k + 1) = a_(1+k)$ \

  IH: Assume $P(n)$ holds for some natural number $n > 1$.

  IS: We will now prove $P(n + 1)$: $
  sum _(j=1) ^(n+1) a_(j+k) = sum _(i=k+1) ^(k+n+1) a_i
  $

  LHS: $
  sum _(j=1) ^(n+1) a_(j+k) &= sum _(j=1) ^(n) a_(j+k) + a_((n + 1) + k) \
  &= sum _(i=k + 1) ^(k+n) a_i + a_((n + 1) + k) &&& "By IH" \
  &= sum _(i=k + 1) ^(k+n) a_i + a_((k + n) + 1) \
  &= sum _(i=k + 1) ^(k+n+1) a_i = "RHS"\
  $

  Thus, $P(n + 1)$ holds and by PMI, $P(n)$ holds $forall n in NN$.
]

#exercise[
  Prove by induction for a semigroup $(S, +)$, the binary operator $compose: S
  times S -> S$ is distributive over $+$, i.e. $forall c, n in S$, we have $sum
  _(j=1) ^n c a_j = c sum _(j=1) ^n a_j$
]


#def[
  Let $(S, dot)$ be a semigroup and $forall j in NN$, let $a_j in S$.

  We define the product:

  $
  product _(j=1) ^(1) = a_j = a_1
  $ and $forall n = 2, dots$

  $
  product _(j=1) ^(n+1) = product _(j=1) ^(n) a_j dot a_(n+1)
  $ and $forall n = 2, dots$

  - $a^n = product _(j=1) ^n a$
]

#theorem[
  Let $(S, dot)$ be a semigroup.  Let $a, b in S$ and $m, n in NN$.

  1. $a^(m + n) = a^m dot a^n$
  2. If $a b = b a$, then $(a b)^n = a^n b^n$
  3. $(a^m)^n = a^(m n)$
]

#proof(name: [Part 2])[
  Suppose $a b = b a$.

  Induction on $n$.

  BC: Let $n = 1$:
  $
  (a b)^1 = product _(j=1) ^1 a b = a b \
  a^1 b^1 = product _(j=1) ^1 a product _(j=1) ^1 b = a b
  $
  Thus, $P(1)$ holds.

  IH: Assume $P(n)$ holds for some $n in NN, n > 1$.

  IS: We will now prove $P(n + 1):$ $
  (a b)^(n+1) = a^(n+1) b^(n+1)
  $

  LHS: $
  (a b)^(n+1) &= (a b)^n dot (a b) \
  &= (a^n b^n) (a b) &&& "By IH"   \
  &= a^n (b^n a) b                 \
  &= a^n (a b^n) b                 \
  &= (a^n a) (b^n b)               \
  &= a^(n+1) b^(n+1) = "RHS"       \
  $
]

#def[
  Let $0 = |emptyset|$ and consider $NN_0 = NN union {0}$

  $forall n in NN_0, n + 0 = 0 + n = n$ and $0 dot n = n dot 0 = 0$ with
  $+$/$dot$ previously defined.
]

== 3.7 -- Equivalence Relations

#def[
  Let $X$ be a set.  A relation $~ subset.eq X times X$ is called an equivalence
  relation iiff:

  1. $~$ is reflexive: $forall x in X: x ~ x$
  2. $~$ is symmetric: $forall x, y in X: x ~ y <==> y ~ x$
  3. $~$ is transitive: $forall x, y, z in X: x ~ y and y ~ z ==> x ~ z$
]

#example[
  Equality on $NN$ is an E.R.
]

#example(name: [2])[
  The relation $x tilde y <==> x - y in ZZ$ is an equivalence relation.

  1. $x - x = 0 in ZZ ==> x tilde x$ and $tilde$ is reflexive.
  2. Suppose $x tilde y$, then $x - y in ZZ ==> exists d in ZZ: x = y + d ==> y - x
     = y - (y + d) = -d in ZZ ==> y tilde x$ \
     Similarly, if $y tilde x$, then $x tilde y$ and $tilde$ is symmetric.
  3. Suppose $x tilde y and y tilde z$.  Then, $exists d_1, d_2 in ZZ: x - y = d_1 and
     y - z = d_2 ==> x - z = (y + d_1) - (y - d_2) = d_1 + d_2 in ZZ ==> tilde$ is
     transitive
]

#def[
  Let $tilde subset.eq X times X$ be an E.R. on $X$.  For each $x in X$, the
  set $[x] = { y in X : y tilde x }$ is called the equivalence class of $x$.

  - $[x] subset.eq X forall x in X$
]

If $tilde$ is $=$ on $ZZ$, then $[x] = { x }$

If $tilde$ is as ex2, $[x] = ZZ$

#example[
  On $NN$, $x ~ y$ iff they are both divisible by 2.

  - $[4] = { 2, 4, 6, 8, dots } = 2 NN$
  - $[2] = [4] = [6] = dots$
]

#def(name: [Partition])[
  Let $X$ be a set, then a family of sets ${X_i}_(i in I)$ of subsets of $X$ is
  called a partition of $X$ iff:

  1. $forall i in I, X_I != emptyset$
  2. $forall i, j in I, i != j, X_i sect X_j = emptyset$ (Pairwise Disjoint)
  3. $union.big_(i in I) X_i = X$
]

#prop(name: [foo])[
  Let $X$ be a set. If $tilde$ is an E.R. on $X$, then the equivalence classes
  of $tilde$ form a partition on $X$.

  Conversely, if $X$ is a set and ${ X_i }_(i in I)$ is a partition of $X$,
  then $a tilde b$ iff $exists i in I: a, b in X_i$ defines an equivelence
  relation on $X$.

  (proof in text)
]
