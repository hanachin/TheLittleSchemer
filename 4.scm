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
     )
 (tup? ['(2 11 3 79 47 6) => #t]
       ['(8 55 5 555) => #t]
       ['(1 2 8 apple 4 3) => #f]
       ['(3 (7 4) 13 9) => #f]
       ['() => #t])
 (addtup ['(3 5 2 8) => 18]
         ['(15 6 7 12 3) => 43])
 (o* [5 3 => 15]
     [13 4 => 52]
     [12 3 => 36])
 (tup+ ['(3 6 9 11 4) '(8 5 2 0 7) => '(11 11 11 11 11)]
       ['(2 3) '(4 6) => '(6 9)]
       ['(3 7) '(4 6) => '(7 13)]
       ['(3 7) '(4 6 8 1) => '(7 13 8 1)])
 (o> [12 133 => #f]
     [120 11 => #t]
     [3 3 => #f])
 ;; my o< test
 (o< [12 133 => #t]
     [120 11 => #f]
     [3 3 => #f]))

(test-end)
