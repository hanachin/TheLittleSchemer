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
(test* "((rember-f eq?) 'tuna '(shrimp salad and tuna salad))" '(shrimp salad and salad) ((rember-f eq?) 'tuna '(shrimp salad and tuna salad)))
(test-end)