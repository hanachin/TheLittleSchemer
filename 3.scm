(use gauche.test)
(add-load-path ".")
(load "func")
(load "test-util")

(test-start "chapter 3")
(f-test
 (rember ['mint '(lamb chops and mint jelly) => '(lamb chops and jelly)]
         ['mint '(lamb chops and mint flavored mint jelly)
                => '(lamb chops and flavored mint jelly)]
         ['toast '(bacon lettuce and tomato) => '(bacon lettuce and tomato)]
         ['cup '(coffee cup tea cup and hick cup)
               => '(coffee tea cup and hick cup)]
         ['bacon '(bacon lettuce and tomato) => '(lettuce and tomato)]
         ['and '(bacon lettuce and tomato) => '(bacon lettuce tomato)]
         ['sauce '(soy sauce and tomato sauce) => '(soy and tomato sauce)])
 
 (firsts ['((apple peach pumpkin) (plum pear cherry)
            (grape raisin pea) (bean carrot eggplant))
          => '(apple plum grape bean)]
         ['((a b) (c d) (e f)) => '(a c e)]
         ['() => '()]
         ['((five plums) (four) (eleven green oranges)) => '(five four eleven)]
         ['(((five plums) four) (eleven green oranges) ((no) more))
          => '((five plums) eleven (no))])
 
 (seconds ['((a b) (c d) (e f)) => '(b d f)])
 
 (insertR ['topping 'fudge '(ice cream with fudge for dessert)
                    => '(ice cream with fudge topping for dessert)]
          ;; Gauche
          ;; ['|jalapeño| 'and '(tacos tamales and salsa)
          ;;              => (tacos tamales and |jalapeño| salsa)]
          ['jalapeno 'and '(tacos tamales and salsa)
                     => '(tacos tamales and jalapeno salsa)]
          ['e 'd '(a b c d f g d h) => '(a b c d e f g d h)])
 
 ;; my insertL test
 (insertL ['topping 'fudge '(ice cream with fudge for dessert)
                    => '(ice cream with topping fudge for dessert)]
          ['jalapeno 'and '(tacos tamales and salsa)
                     => '(tacos tamales jalapeno and salsa)]
          ['e 'd '(a b c d f g d h) => '(a b c e d f g d h)])
 
 (subst ['topping 'fudge '(ice cream with fudge for dessert)
                  => '(ice cream with topping for dessert)])
 
 (subst2 ['vanilla 'chocolate 'banana '(banana ice creamwith chocolate topping)
                   => '(vanilla ice creamwith chocolate topping)])
 
 (multirember ['cup '(coffee cup tea cup and hick cup)
                    => '(coffee tea and hick)])
 
 ;; my multiinsertR test
 (multiinsertR ['e 'd '(a b c d f g d h) => '(a b c d e f g d e h)]
               ['y 'y '(w r y y y y y) => '(w r y y y y y y y y y y)])
 
 (multiinsertL ['fried 'fish '(chips and fish or fish and fried)
                       => '(chips and fried fish or fried fish and fried)]
               ['j 'o '(o o) => '(j o j o)])
 
 (multisubst ['o 'i '(i p p a i) => '(o p p a o)]
             ['o 'i '() => '()]))

(test-end)
