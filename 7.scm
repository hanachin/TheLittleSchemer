(use gauche.test)
(add-load-path ".")
(load "func")
(load "test-util")

(test-start "chapter 7")

(f-test
 (set? ['(apple peaches apple plum) => #f]
       ['(apples peaches pears plums) => #t]
       ['() => #t]))

(test-end)