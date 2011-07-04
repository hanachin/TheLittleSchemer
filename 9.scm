(use gauche.test)
(add-load-path ".")
(load "func")
(load "test-util")

(test-start "chapter 9")
(f-test
 (looking ['caviar '(6 2 4 caviar 5 7 3)
                   => #t]
          ['caviar '(6 2 grits caviar 5 7 3)
                   => #f]
          ['caviar '(6 2 4 caviar 5 7 3)
                   => #t])
 (shift ['((a b) c) => '(a (b c))]
        ['((a b) (c d)) => '(a (b (c d)))])
 (weight* ['((a b) c) => 7]
          ['(a (b c)) => 5])
 (shuffle ['(a (b c)) => '(a (b c))]
          ['(a b) => '(a b)]))

(test-end)
