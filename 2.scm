(use gauche.test)
(add-load-path ".")
(load "func")

(test-start "chapter 2")

(test-section "lat?")
(test* "(lat? '(Jack Sprat could eat no chicken fat))" #t (lat? '(Jack Sprat could eat no chicken fat)))
(test* "(lat? '((Jack) Sprat could eat no chicken fat))" #f (lat? '((Jack) Sprat could eat no chicken fat)))
(test* "(lat? '(Jack (Sprat could) eat no chicken fat))" #f (lat? '((Jack) Sprat could eat no chicken fat)))
(test* "(lat? '())" #t (lat? '()))

(test-end)