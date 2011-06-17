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
           ;=> '(pear plum apple lemon peach)
           => '(apple peach pear plum lemon)])
 (subset? ['(5 chicken wings)
           '(5 hamburgers
               2 pieces fried chicken and
               light duckling wings)
           => #t]
          ['(4 pounds of horseradish)
           '(four pounds chicken and
                  5 ounces horseradish)
           => #f])
 (eqset? ['(6 large chickens with wings)
          '(6 chickens with large wings)
          => #t]))

(test-end)