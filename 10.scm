(use gauche.test)
(add-load-path ".")
(load "func")
(load "test-util")

(test-start "chapter 10")
(test-section "new-entry")
(test* "(equal? '((appetizer entree beverage)
                 (patee boeuf vin))
               (new-entry '(appetizer entree beverage)
                          '(patee boeuf vin)))"
       #t
       (equal? '((appetizer entree beverage)
                 (patee boeuf vin))
               (new-entry '(appetizer entree beverage)
                          '(patee boeuf vin))))
(test* "(equal? '((appetizer entree beverage)
                 (beer beer beer))
               (new-entry '(appetizer entree beverage)
                          '(beer beer beer)))"
       #t
       (equal? '((appetizer entree beverage)
                 (beer beer beer))
               (new-entry '(appetizer entree beverage)
                          '(beer beer beer))))
(test* "(equal? '((beverage dessert)
                 ((food is) (number one with us)))
               (new-entry '(beverage dessert)
                          '((food is) (number one with us))))"
       #t
       (equal? '((beverage dessert)
                 ((food is) (number one with us)))
               (new-entry '(beverage dessert)
                          '((food is) (number one with us)))))

(test-end)
