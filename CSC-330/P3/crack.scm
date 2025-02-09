#lang racket
(require file/sha1)

(define alphabet '("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n"
                   "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z"))

(define hashes '("fd1286353570c5703799ba76999323b7c7447b06"
                 "66b27417d37e024c46526c2f6d358a754fc552f3"
                 "39ccb32d95edfdbcd882f2b01809724ec640ea16"
                 "8abf15bef376e0e21f1f9e9c3d74483d5018f3d5"
                 "163e65be076bbea20ab8275969700373a6179a3c"))

(define (permutations sz hash)
  (if (= sz 1) alphabet
    (let
      (
        (rest (permutations (- sz 1) hash))
      )
      (let
        (
          (foo
            (foldl append '()
               (map
                 (lambda (v) (map (lambda (a) (string-append a v)) (cons "" alphabet)))
                 rest
               )))
        )
        (if
          (> (length (filter (check hash) foo)) 0)
          (filter (check hash) foo)
          foo
        )
      ))))

(define (check hashed) (lambda (attempt) (string-ci=? (sha1 (open-input-string attempt)) hashed)))
(map
  (lambda (h) (display (string-append (list-ref (time (permutations 6 h)) 0) "\n")))
  hashes
)
