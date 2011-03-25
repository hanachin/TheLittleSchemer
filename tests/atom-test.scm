(use gauche.test)
(test-start "little schemer")

(test-section "atom?")
(test "(quote 0)" #f (lambda () (atom? (quote 0))))

(test-end)