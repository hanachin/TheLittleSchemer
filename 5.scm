(use gauche.test)
(add-load-path ".")
(load "func")
(load "test-util")

(test-start "chapter 5")
(test-section "rember*")

(f-test
 (rember* ['cup '((coffee) cup ((tea) cup) (and (hick)) cup)
                => '((coffee) ((tea)) (and (hick)))]
          ['sauce '(((tomato sauce))
                   ((bean) sauce)
                   (and ((flying)) sauce))
                 => '(((tomato))
                      ((bean))
                      (and ((flying))))])
 (insertR* ['roast 'chuck '((how much (wood))
                            cloud
                            ((a (wood) chuck))
                            (((chuck)))
                            (if (a) ((wood chuck)))
                            cloud chuck wood)
                   => '((how much (wood))
                        cloud
                        ((a (wood) chuck roast))
                        (((chuck roast)))
                        (if (a) ((wood chuck roast)))
                        cloud chuck roast wood)])
 (occur* ['banana '((banana)
                    (split '((((banana ice)))
                             (cream (banana))
                             sherbet))
                    (banana)
                    (bread)
                    (banana brandy))
                  => 5])
 (subst* ['orange 'banana '((banana)
                            (split ((((banana ice)))
                                    (cream (banana))
                                    sherbet))
                            (banana)
                            (bread)
                            (banana brandy))
                  => '((orange)
                       (split ((((orange ice)))
                               (cream (orange))
                               sherbet))
                       (orange)
                       (bread)
                       (orange brandy))])
 (insertL* ['pecker 'chuck '((how much (wood))
                             could
                             ((a (wood) chuck))
                             (((chuck)))
                             (if (a) (wood chuck))
                             could chuck wood)
                    => '((how much (wood))
                         could
                         ((a (wood) pecker chuck))
                         (((pecker chuck)))
                         (if (a) (wood pecker chuck))
                         could pecker chuck wood)])
 (member* ['chips '((potato) (chips ((with) fish) (chips)))
                  => #t])
 (leftmost ['((potato) (chips ((with) fish) (chips))) => 'potato]
           ['(((hot) (tuna (and))) cheese) => 'hot]
           ['(((() four)) 17 (seventeen)) => (test-error)]
           [(quote ()) => (test-error)])
 (eqlist? ['(strawberry ice cream) '(strawberry ice cream) => #t]
          ['(strawberry ice cream) '(strawberry cream ice) => #f]
          ['(banana ((split))) '((banana) (split)) => #f]
          ['(beef ((sausage)) (and (soda)))
           '(beef ((salami)) (and (soda)))
           => #f]
          ['(beef ((sausage)) (and (soda)))
           '(beef ((sausage)) (and (soda)))
           => #t]))

(test-end)
