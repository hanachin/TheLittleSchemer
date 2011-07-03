(use gauche.test)
(add-load-path ".")
(load "func")
(load "test-util")

(test-start "chapter 8")
(f-test
 (eq?-salad ['salad => #t]
            ['tuna => #f])
 (rember-eq? ['tuna '(tuna salad is good)
                    => '(salad is good)]))
(test-section "rember-f")
(test* "((rember-f eq?) 'tuna '(shrimp salad and tuna salad))" '(shrimp salad and salad) ((rember-f eq?) 'tuna '(shrimp salad and tuna salad)))
(test* "((rember-f eq?) 'eq? '(equal? eq? eqan? eqlist? eqpair?))" '(equal? eqan? eqlist? eqpair?) ((rember-f eq?) 'eq? '(equal? eq? eqan? eqlist? eqpair?)))

(test-section "multirember-f")
(test* "((multirember-f eq?) 'tuna '(shrimp salad tuna salad and tuna))"
       '(shrimp salad salad and)
       ((multirember-f eq?) 'tuna '(shrimp salad tuna salad and tuna)))

(test-section "multiremberT")
(test* "(multiremberT eq?-tuna '(shrimp salad tuna salad and tuna))"
       '(shrimp salad salad and)
       (multiremberT eq?-tuna '(shrimp salad tuna salad and tuna)))
(f-test
 (multirember&co ['tuna '(tuna) a-friend
                        => #f]
                 ['tuna '(and tuna) latest-friend
                        => #f]
                 ['tuna
                  '(strawberries tuna and swordfish)
                  (lambda (x y) (length x))
                  => 3]))

(test-section "multiinsertLR&co")
(let ((col (lambda (newlat L R) (list newlat L R))))
  (test* "(multiinsertLR&co 'cranberries 'fish 'chips '() col)"
         '(() 0 0)
         (multiinsertLR&co 'cranberries 'fish 'chips '() col))
  (test* "(multiinsertLR&co 'salty 'fish 'chips '(chips and fish or fish and chips) col)"
         '((chips salty and salty fish or salty fish and chips salty) 2 2)
         (multiinsertLR&co 'salty 'fish 'chips '(chips and fish or fish and chips) col)))

(f-test
 (evens-only* ['((9 1 2 8) 3 10 ((9 9) 7 6) 2)
               => '((2 8) 10 (() 6) 2)])
 (evens-only*&co ['((9 1 2 8) 3 10 ((9 9) 7 6) 2) the-last-friend
                  ;; 本文では'(28 1920 (2 8) 10 (() 6) 2)となっているが実際は38
                  => '(38 1920 (2 8) 10 (() 6) 2)]))

(test-end)
