#import "@preview/lemmify:0.1.5": *

#set table(
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  } else { 
    (
      bottom: .1pt + black,
      left: if x == 0 { none } else {
        .1pt + black
      }
    )
  },
  fill: (x, y) => if calc.rem(y, 2) == 1 {
    rgb(0, 0, 255, 0x11)
  }
)

#let todo = (content) => text(fill: red, size: 2em)[ TODO: #content ];
#let hr = line(length: 100%)

#set enum(numbering: "1)")
#let notin = math.class(
  "relation",
  $cancel(in)$,
)

#let V = math.arrow($v$)

#set math.mat(delim: "[")
#set math.vec(delim: "[")

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
  definition, theorem, proof, lemma, rules, example
) = default-theorems("thm-group", lang: "en", ..my-styling)
#let def(name, c) = definition(name: name)[#c]
#show: rules
#show thm-selector("thm-group"): box.with(inset: 0.8em)
#show thm-selector("thm-group", subgroup: "theorem"): it => box(
  it, fill: rgb("#eeffee"))

= Exam 2

#def([Transpose])[
  For a matrix $A$, the transpose of $A$, denoted $A^T$ is the matrix whose
  entry  with index $i,j$ is given by $
  A^T_(i,j) = A_(j,i)
  $
]

Additive inverse of $A$ is denoted as $-A$

#def([Matrix Multiplication])[
  $A$ is $m times n$ matrix and $B$ is $n times p$ matrix. \
  $C$ is $m times p$ matrix with $
  c_(i,j) = a_(i,1) b_(1,j) + a_(i,2)b_(2,j) + dots.c + a_(i,n) b_(n,j) = sum _(k=1) ^n a_(i,k) b_(k,j)
  $
]

#def([Elementary Matrix])[
  A matrix resulting in applying a single ERO to an identity matrix
]

#theorem(name: [Invertable Matrix Theorem])[
  Let $A$ be an $n times n$ matrix and $arrow(b) in RR^n$, then the following
  are equivalent:

  1. $A$ is invertible
  2. $A arrow(x) = arrow(b)$ has a unique solution
  3. $A$ is row equivalent to $I_n$
  4. $A$ is the product of elementary matricies
]

#def([The LU factorisation])[
  $
  A = L U = mat(1, 0, 0; ?, 1, 0; ?, ?, 1) mat(?, ?, ?; 0, ?, ?; 0, 0, ?)
  $

  $
  A -> U <=> E_3 E_2 E_1 A = U \
  $

  $
  (E_3 E_2 E_1)^(-1)(E_3 E_2 E_1) A &= (E_3 E_2 E_1)^(-1) U \
  A &= underbrace(E_1^(-1) E_2^(-1) E_3^(-1), L) U
  $
]
