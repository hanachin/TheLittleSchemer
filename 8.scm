(use gauche.test)
(add-load-path ".")
(load "func")
(load "test-util")

(test-start "chapter 7")
(f-test
 ;; (rember-f [= 5 '(6 2 5 3) => '(6 2 3)]
 ;;           [eq? 'jelly '(jelly beans are good)
 ;;                => '(beans are good)]
 ;;           [equal? '(pop corn) '(lemonade (pop corn) and (cake))
 ;;                   => '(lemonade and (cake))])
 (eq?-salad ['salad => #t]
            ['tuna => #f])
 (rember-eq? ['tuna '(tuna salad is good)
                    => '(salad is good)]))
(test-end)