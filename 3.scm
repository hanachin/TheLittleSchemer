(use gauche.test)
(add-load-path ".")
(load "func")

(test-start "chapter 3")
(test-section "rember")
(test* "(rember 'mint '(lamb chops and mint jelly))" '(lamb chops and jelly) (rember 'mint '(lamb chops and mint jelly)))
(test* "(rember 'mint '(lamb chops and mint flavored mint jelly))" '(lamb chops and flavored mint jelly) (rember 'mint '(lamb chops and mint flavored mint jelly)))
(test* "(rember 'toast '(bacon lettuce and tomato))" '(bacon lettuce and tomato) (rember 'toast '(bacon lettuce and tomato)))
(test* "(rember 'cup '(coffee cup tea cup and hick cup))" '(coffee tea cup and hick cup) (rember 'cup '(coffee cup tea cup and hick cup)))
(test* "(rember 'bacon '(bacon lettuce and tomato))" '(lettuce and tomato) (rember 'bacon '(bacon lettuce and tomato)))
(test* "(rember 'and '(bacon lettuce and tomato))" '(bacon lettuce tomato) (rember 'and '(bacon lettuce and tomato)))
(test* "(rember 'sauce '(soy sauce and tomato sauce))" '(soy and tomato sauce) (rember 'sauce '(soy sauce and tomato sauce)))

(test-section "firsts")
(test* "(firsts '((apple peach pumpkin) (plum pear cherry) (grape raisin pea) (bean carrot eggplant)))"
       '(apple plum grape bean)
       (firsts '((apple peach pumpkin)
                 (plum pear cherry)
                 (grape raisin pea)
                 (bean carrot eggplant))))
(test* "(firsts '((a b) (c d) (e f)))" '(a c e) (firsts '((a b) (c d) (e f))))
(test* "(firsts '())" '() (firsts '()))
(test* "(firsts '((five plums) (four) (eleven green oranges)))" '(five four eleven) (firsts '((five plums) (four) (eleven green oranges))))
(test* "(firsts '(((five plums) four) (eleven green oranges) ((no) more)))"
       '((five plums) eleven (no))
       (firsts '(((five plums) four)
                 (eleven green oranges)
                 ((no) more))))

(test-section "seconds")
(test* "(seconds '((a b) (c d) (e f)))" '(b d f) (seconds '((a b) (c d) (e f))))

(test-section "insertR")
(test* "(insertR 'topping 'fudge '(ice cream with fudge for dessert))" '(ice cream with fudge for dessert) (insertR 'topping 'fudge '(ice cream with fudge for dessert)))
;; Gauche
;; (test* "(insertR '|jalapeño| 'and '(tacos tamales and salsa))" '(tacos tamales and |jalapeño| salsa) (insertR '|jalapeño| 'and '(tacos tamales and salsa)))
(test* "(insertR 'jalapeno 'and '(tacos tamales and salsa))" '(tacos tamales and jalapeno salsa) (insertR 'jalapeno 'and '(tacos tamales and salsa)))
(test* "(insertR 'e 'd '(a b c d f g d h))" '(a b c d e f g d h) (insertR 'e 'd '(a b c d f g d h)))

(test-end)
