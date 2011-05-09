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
                      (and ((flying))))]))

(test-end)
