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
          => #t])
 (intersect? ['(stewed tomatoes and macaroni)
              '(macaroni and cheese)
              => #t])
 (intersect ['(stewed tomatoes and macaroni)
             '(macaroni and cheese)
             => '(and macaroni)])
 (union ['(stewed tomatoes and macaroni casserole)
         '(macaroni and cheese)
         => '(stewed tomatoes casserole macaroni and cheese)])
 (intersectall ['((a b c) (c a d e) (e f g h a b))
                => '(a)]
               ['((6 pears and)
                  (3 peaches and 6 peppers)
                  (8 pears and 6 plums)
                  (and 6 prunes with lots of apples))
                => '(6 and)])
 (a-pair? ['(pear pear) => #t]
          ['(3 7) => #t]
          ['((2) (pair)) => #t]
          ['(full (house)) => #t]
          ['(one two three) => #f])
 (fun? ['((4 3) (4 2) (7 6) (6 2) (3 4)) => #f]
       ['((8 3) (4 2) (7 6) (6 2) (3 4)) => #t]
       ['((b 4) (b 0) (b 9) (e 5) (g 4)) => #f])
 (revrel ['((8 a) (pumpkin pie) (got sick))
          => '((a 8) (pie pumpkin) (sick got))])
 (fullfun? ['((8 3) (4 2) (7 6) (6 2) (3 4))
            => #f]
           ['((8 3) (4 8) (7 6) (6 2) (3 4))
            => #t]
           ['((grape raisin) (plum prune) (stewed prune))
            => #f]
           ['((grape raisin) (plum prune) (stewed grape))
            => #t]))

(test-end)