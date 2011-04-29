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

(test-end)
