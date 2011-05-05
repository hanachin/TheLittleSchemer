(use gauche.test)
(add-load-path ".")
(load "func")
(load "test-util")

(test-start "chapter 2")

(f-test
 (lat? ['(Jack Sprat could eat no chicken fat) => #t]
       ['((Jack) Sprat could eat no chicken fat) => #f]
       ['(Jack (Sprat could) eat no chicken fat) => #f]
       ['() => #t]
       ['(bacon and eggs) => #t]
       ['(bacon (and eggs)) => #f])
 
 (or [(null? '()) (null? '(d e f g)) => #t]
     [(null? '(a b c)) (null? '()) => #t]
     [(null? '(a b c)) (null? '(atom)) => #f])

 (member? ['tea '(coffee tea or milk) => #t]
          ['poached '(fried eggs and scrambled eggs) => #f]
          ['meat '(mashed potatoes and meat gravy) => #t]
          ['liver '(bagels and lox) => #f]))

(test-end)
