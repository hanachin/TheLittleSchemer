(use gauche.test)
(add-load-path ".")
(load "func")
(load "test-util")

(test-start "chapter 6")
(f-test
 (numbered? [1 => #t]
            ['(3 + (4 expt 5)) => #t]
            ['(2 * sausage) => #f]))

(test-end)
