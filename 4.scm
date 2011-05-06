(use gauche.test)
(add-load-path ".")
(load "func")
(load "test-util")

(test-start "chapter 4")

(test-section "atom?")
(eqt (atom? 14) #t)

(test-end)