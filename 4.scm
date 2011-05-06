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

(f-test
 (add1 [67 => 68])
 (sub1 [5 => 4]
       ;; In practice
       [0 => -1])
 (zero? [0 => #t]
        [1492 => #f])
 (o+ [46 12 => 58])
 (o- [14 3 => 11]
     [17 9 => 8]
     ;; [18 25 => -7]
     ))

(test-end)
