(use gauche.test)
(add-load-path ".")
(load "func")
(load "test-util")

(test-start "chapter 7")
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
(test-end)
