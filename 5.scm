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
                        cloud chuck roast wood)]))

(test-end)
