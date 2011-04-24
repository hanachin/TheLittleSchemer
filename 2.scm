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

(test-section "or")
(test* "(or (null? '()) (null? '(d e f g)))" #t (or (null? '()) (null? '(d e f g))))
(test* "(or (null? '(a b c)) (null? '()))" #t (or (null? '(a b c)) (null? '())))
(test* "(or (null? '(a b c)) (null? '(atom)))" #f (or (null? '(a b c)) (null? '(atom))))

(test-section "member?")
(test* "(member? 'tea '(coffee tea or milk))" #t (member? 'tea '(coffee tea or milk)))
(test* "(member? 'poached '(fried eggs and scrambled eggs))" #f (member? 'poached '(fried eggs and scrambled eggs)))

(test-end)
