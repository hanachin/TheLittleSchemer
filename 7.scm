(use gauche.test)
(add-load-path ".")
(load "func")
(load "test-util")

(test-start "chapter 7")

(f-test
 (set? ['(apple peaches apple plum) => #f]
       ['(apples peaches pears plums) => #t]
       ['() => #t]
       ['(apple 3 pear 4 9 apple 3 4) => #f])
 (makeset ['(apple peach pear peach plum apple lemon peach)
           => '(apple peach pear plum lemon)]))

(test-end)