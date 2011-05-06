(use gauche.test)
(add-load-path ".")
(load "func")
(load "test-util")

(test-start "chapter 4")

(test-section "atom?")
(eqt (atom? 14) #t)

(test-section "number?")
(eqt (number? -3) #t)
(eqt (number? 3.1415) #t)
(eqt (and (number? -3)
          (number? 3.1415))
     #t)

(test-end)