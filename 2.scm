(use gauche.test)
(add-load-path ".")
(load "func")

(test-start "chapter 2")

(test-section "lat?")
(test* "(lat? '(Jack Sprat could eat no chicken fat))" #t (lat? '(Jack Sprat could eat no chicken fat)))
(test* "(lat? '((Jack) Sprat could eat no chicken fat))" #f (lat? '((Jack) Sprat could eat no chicken fat)))
(test* "(lat? '(Jack (Sprat could) eat no chicken fat))" #f (lat? '((Jack) Sprat could eat no chicken fat)))
(test* "(lat? '())" #t (lat? '()))
(test* "(lat? '(bacon and eggs))" #t (lat? '(bacon and eggs)))
(test* "(lat? '(bacon (and eggs)))" #f (lat? '(bacon (and eggs))))

(test-end)
