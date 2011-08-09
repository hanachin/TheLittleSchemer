;; p.xiii, p.10
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

;; p.16 lat?
;; (define lat?
;;   (lambda (l)
;;     (cond ((null? l) #t)
;;           ((atom? (car l)) (lat? (cdr l)))
;;           (else #f))))

;; my lat?
(define lat?
  (lambda (l)
    (cond ((null? l) #t)
          ((not (atom? (car l))) #f)
          (else (lat? (cdr l))))))

;; p.23 (fixed first question answer.)
(define member?
  (lambda (a lat)
    (cond ((null? lat) #f)
          (else (or (equal? (car lat) a)
                    (member? a (cdr lat)))))))

;; p.46, p.48
(define firsts
  (lambda (l)
    (cond ((null? l) '())
          (else (cons (car (car l))
                      (firsts (cdr l)))))))

;; my seconds
(define seconds
  (lambda (l)
    (cond ((null? l) '())
          (else (cons (car (cdr (car l)))
                      (seconds (cdr l)))))))

;; p.53 (simplify)
(define subst2
  (lambda (new o1 o2 lat)
    (cond ((null? lat) '())
          ((or (eq? (car lat) o1)
               (eq? (car lat) o2))
           (cons new (cdr lat)))
          (else (cons (car lat)
                      (subst new o1 o2 (cdr lat)))))))

;; p.54 (simplify)
(define multirember
  (lambda (a lat)
    (cond ((null? lat) '())
          ((equal? (car lat) a) (multirember a (cdr lat)))
          (else (cons (car lat)
                      (multirember a (cdr lat)))))))

;; p.57
(define multiinsertR
  (lambda (new old lat)
    (cond ((null? lat) '())
          ((eq? (car lat) old) (cons old (cons new (multiinsertR new old (cdr lat)))))
          (else (cons (car lat)
                      (multiinsertR new old (cdr lat)))))))

;; p.58
(define multiinsertL
  (lambda (new old lat)
    (cond ((null? lat) '())
          ((eq? (car lat) old) (cons new (cons old (multiinsertL new old (cdr lat)))))
          (else (cons (car lat)
                      (multiinsertL new old (cdr lat)))))))

;; p.59
(define multisubst
  (lambda (new old lat)
    (cond ((null? lat) '())
          ((eq? (car lat) old) (cons new (multisubst new old (cdr lat))))
          (else (cons (car lat)
                      (multisubst new old (cdr lat)))))))

;; p.61
(define add1
  (lambda (n)
    (+ n 1)))

;; p.61
(define sub1
  (lambda (n)
    (- n 1)))

;; p.62
(define o+
  (lambda (n m)
    (cond ((zero? m) n)
          (else (add1 (o+ n (sub1 m)))))))

;; p.63
;; (define o-
;;   (lambda (n m)
;;     (cond ((zero? m) n)
;;           (else (sub1 (o- n (sub1 m)))))))

;; my o-
(define o-
  (lambda (n m)
    (cond ((zero? m) n)
          (else (o- (sub1 n) (sub1 m))))))

;; my tup?
(define tup?
  (lambda (l)
    (cond ((null? l) #t)
          ((number? (car l)) (tup? (cdr l)))
          (else #f))))

;; p.66
(define addtup
  (lambda (tup)
    (cond ((null?  tup) 0)
          (else (o+ (car tup) (addtup (cdr tup)))))))

;; p.67
(define o*
  (lambda (n m)
    (cond ((zero? m) 0)
          (else (o+ n (o* n (sub1 m)))))))

;; p.73
(define tup+
  (lambda (tup1 tup2)
    (cond ((null? tup1) tup2)
          ((null? tup2) tup1)
          (else (cons (o+ (car tup1) (car tup2))
                      (tup+ (cdr tup1) (cdr tup2)))))))

;; p.75
(define o>
  (lambda (n m)
    (cond ((zero? n) #f)
          ((zero? m) #t)
          (else (o> (sub1 n) (sub1 m))))))

;; p.75
(define o<
  (lambda (n m)
    (cond ((zero? m) #f)
          ((zero? n) #t)
          (else (o< (sub1 n) (sub1 m))))))

;; p.76
(define o=
  (lambda (n m)
    (cond ((o> n m) #f)
          ((o< n m) #f)
          (else #t))))

;; p.76
(define o-expt
  (lambda (n m)
    (cond ((zero? m) 1)
          (else (o* n (o-expt n (sub1 m)))))))

;; p.77
(define o/
  (lambda (n m)
    (cond ((o< n m) 0)
          (else (add1 (o/ (o- n m) m))))))

;; p.78
(define length
  (lambda (lat)
    (cond ((null? lat) 0)
          (else (add1 (length (cdr lat)))))))

;; p.78
;; (define pick
;;   (lambda (n lat)
;;     (cond ((zero? (sub1 n)) (car lat))
;;           (else (pick (sub1 n) (cdr lat))))))

;; my pick
(define pick
  (lambda (n lat)
    (cond ((= 1 n) (car lat))
          (else (pick (sub1 n) (cdr lat))))))

;; p.79
;; (define rempick
;;   (lambda (n lat)
;;     (cond ((zero? (sub1 n)) (cdr lat))
;;           (else (cons (car lat)
;;                       (rempick (sub1 n) (cdr lat)))))))

;; my rempick
(define rempick
  (lambda (n lat)
    (cond ((one? n) (cdr lat))
          (else (cons (car lat)
                      (rempick (sub1 n) (cdr lat)))))))

;; p.79
(define no-nums
  (lambda (lat)
    (cond ((null? lat) '())
          (else (cond ((number? (car lat)) (no-nums (cdr lat)))
                      (else (cons (car lat)
                                  (no-nums (cdr lat)))))))))

;; p.80
(define all-nums
  (lambda (lat)
    (cond ((null? lat) '())
          (else (cond ((number? (car lat))
                       (cons (car lat)
                             (all-nums (cdr lat))))
                      (else (all-nums (cdr lat))))))))

;; p.80
(define eqan?
  (lambda (a1 a2)
    (cond ((and (number? a1) (number? a2)) (o= a1 a2))
          ((or (number? a1) (number? a2)) #f)
          (else (eq? a1 a2)))))

;; p.80
(define occur
  (lambda (a lat)
    (cond ((null? lat) 0)
          (else (cond ((eqan? (car lat) a) (add1 (occur a (cdr lat))))
                      (else (occur a (cdr lat))))))))

;; p.81
(define one?
  (lambda (n)
    (o= n 1)))

;; p.83
(define rember*
  (lambda (a l)
    (cond ((null? l) '())
          ((atom? (car l))
           (cond ((eq? (car l) a) (rember* a (cdr l)))
                 (else (cons (car l)
                             (rember* a (cdr l))))))
          (else (cons (rember* a (car l))
                      (rember* a (cdr l)))))))

;; p.84
(define insertR*
  (lambda (new old l)
    (cond ((null? l) '())
          ((atom? (car l))
           (cond ((eq? (car l) old)
                  (cons old (cons new (insertR* new old (cdr l)))))
                 (else (cons (car l)
                             (insertR* new old (cdr l))))))
          (else (cons (insertR* new old (car l))
                      (insertR* new old (cdr l)))))))

;; p.87
(define occur*
  (lambda (a l)
    (cond ((null? l) 0)
          ((atom? (car l))
           (cond ((eq? (car l) a)
                  (add1 (occur* a (cdr l))))
                 (else (occur* a (cdr l)))))
          (else (o+ (occur* a (car l))
                    (occur* a (cdr l)))))))

;; p.87
(define subst*
  (lambda (new old l)
    (cond ((null? l) '())
          ((atom? (car l))
           (cond ((eq? (car l) old)
                  (cons new (subst* new old (cdr l))))
                 (else (cons (car l)
                             (subst* new old (cdr l))))))
          (else (cons (subst* new old (car l))
                      (subst* new old (cdr l)))))))

;; p.88
(define insertL*
  (lambda (new old l)
    (cond ((null? l) '())
          ((atom? (car l))
           (cond ((eq? (car l) old)
                  (cons new (cons old (insertL* new old (cdr l)))))
                 (else (cons (car l) (insertL* new old (cdr l))))))
          (else (cons (insertL* new old (car l))
                      (insertL* new old (cdr l)))))))
;; p.89
(define member*
  (lambda (a l)
    (cond ((null? l) #f)
          ((atom? (car l)) (or (eq? (car l) a)
                               (member* a (cdr l))))
          (else (or (member* a (car l))
                    (member* a (cdr l)))))))

;; p.90
(define leftmost
  (lambda (l)
    (cond ((atom? (car l)) (car l))
          (else (leftmost (car l))))))

;; p.96
(define eqlist?
  (lambda (l1 l2)
    (cond ((and (null? l1) (null? l2)) #t)
          ((or (null? l1) (null? l2)) #f)
          (else (and (equal? (car l1) (car l2))
                     (equal? (cdr l1) (cdr l2)))))))
;; p.95
(define equal?
  (lambda (s1 s2)
    (cond ((and (atom? s1) (atom? s2))
           (eqan? s1 s2))
          ((or (atom? s1) (atom? s2)) #f)
          (else (eqlist? s1 s2)))))

;; p.103
(define numbered?
  (lambda (aexp)
    (cond ((atom? aexp) (number? aexp))
          (else
           (and (numbered? (car aexp))
                (numbered? (car (cdr (cdr aexp)))))))))

;; p.107
(define 1st-sub-exp
  (lambda (aexp)
    (car (cdr aexp))))

(define 2nd-sub-exp
  (lambda (aexp)
    (car (cdr (cdr aexp)))))

(define operator
  (lambda (aexp)
    (car aexp)))

;; p.109
(define sero?
  (lambda (n)
    (null? n)))

(define edd1
  (lambda (n)
    (cons '() n)))

(define zub1
  (lambda (n)
    (cdr n)))

(define oo+
  (lambda (n m)
    (cond ((sero? m) n)
          (else (edd1 (oo+ n (zub1 m)))))))

;; p.113
(define set?
  (lambda (lat)
    (cond ((null? lat) #t)
          ((member? (car lat) (cdr lat)) #f)
          (else (set? (cdr lat))))))

;; p.114
(define makeset
  (lambda (lat)
    (cond ((null? lat) '())
          (else (cons (car lat)
                      (makeset (multirember (car lat) (cdr lat))))))))

;; p.115
(define subset?
  (lambda (set1 set2)
    (cond ((null? set1) #t)
          (else (and (member? (car set1) set2)
                     (subset? (cdr set1) set2))))))

;; p.116
(define eqset?
  (lambda (set1 set2)
    (and (subset? set1 set2)
         (subset? set2 set1))))

;; p.117
(define intersect?
  (lambda (set1 set2)
    (cond ((null? set1) #f)
          (else (or (member? (car set1) set2)
                    (intersect? (cdr set1) set2))))))

;; p.118
(define intersect
  (lambda (set1 set2)
    (cond ((null? set1) '())
          ((member? (car set1) set2)
           (cons (car set1)
                 (intersect (cdr set1) set2)))
          (else (intersect (cdr set1) set2)))))

;; p.118
(define union
  (lambda (set1 set2)
    (cond ((null? set1) set2)
          ((member? (car set1) set2) (union (cdr set1) set2))
          (else (cons (car set1)
                      (union (cdr set1) set2))))))

;; p.118
(define xxx
  (lambda (set1 set2)
    (cond ((null? set1) '())
          ((member? (car set1) set2)
           (xxx (cdr set1) set2))
          (else (cons (car set1)
                      (xxx (cdr set1) set2))))))

;; p.119 + first question (null? l-set)
(define intersectall
  (lambda (l-set)
    (cond ((null? l-set) '())
          ((null? (cdr l-set)) (car l-set))
          (else (intersect (car l-set)
                           (intersectall (cdr l-set)))))))

;; p.119
(define a-pair?
  (lambda (x)
    (cond ((atom? x) #f)
          ((null? x) #f)
          ((null? (cdr x)) #f)
          ((null? (cdr (cdr x))) #t)
          (else #f))))

;; p.120
(define first
  (lambda (p) (car p)))

(define second
  (lambda (p) (car (cdr p))))

(define build
  (lambda (a1 a2)
    (cons a1 (cons a2 '()))))

(define third
  (lambda (l)
    (car (cdr (cdr l)))))

;; p.122
(define fun?
  (lambda (rel)
    (set? (firsts rel))))

;; p.123
(define revpair
  (lambda (pair)
    (build (second pair) (first pair))))

;; p.123
(define revrel
  (lambda (rel)
    (cond ((null? rel) '())
          (else (cons (revpair (car rel))
                      (revrel (cdr rel)))))))

;; p.123
(define fullfun?
  (lambda (fun)
    (set? (seconds fun))))

;; p.124
(define one-to-one?
  (lambda (fun)
    (fun? (revrel fun))))

;; p.131
(define rember-f
  (lambda (test?)
    (lambda (a l)
      (cond ((null? l) '())
            ((test? (car l) a) (cdr l))
            (else (cons (car l)
                        ((rember-f test?) a (cdr l))))))))

;; p.129
(define eq?-c
  (lambda (a)
    (lambda (x)
      (eq? x a))))

;;p.130
(define eq?-salad (eq?-c 'salad))

;; p.131
(define rember-eq? (rember-f eq?))

;; p.132
(define insertL-f
  (lambda (test?)
    (lambda (new old l)
      (cond ((null? l) '())
            ((test? (car l) old) (cons new (cons old (cdr l))))
            (else (cons (car l)
                        ((insertL-f test?) new old (cdr l))))))))

;; p.132
(define insertR-f
  (lambda (test?)
    (lambda (new old l)
      (cond ((null? l) '())
            ((test? (car l) old) (cons old (cons new (cdr l))))
            (else (cons (car l)
                        ((insertR-f test?) new old (cdr l))))))))

;; p.133
(define seqL
  (lambda (new old l)
    (cons new (cons old l))))

;; p.133
(define seqR
  (lambda (new old l)
    (cons old (cons new l))))

;; p.134
(define insert-g
  (lambda (seq)
    (lambda (new old l)
      (cond ((null? l) '())
            ((eq? (car l) old) (seq new old (cdr l)))
            (else (cons (car l)
                        ((insert-g seq) new old (cdr l))))))))

;; p.134
(define insertL
  (insert-g
   (lambda (new old l)
     (cons new (cons old l)))))

;; p.134
(define insertR
  (insert-g
   (lambda (new old l)
    (cons old (cons new l)))))

;; p.135
(define seqS
  (lambda (new old l)
    (cons new l)))

;; p.135
(define subst (insert-g seqS))

;; p.135
(define seqrem
  (lambda (new old l)
    l))

;; p.135
(define rember
  (lambda (a l)
    ((insert-g seqrem) #f a l)))

;; p.136
(define atom-to-function
  (lambda (x)
    (cond ((eq? x '+) o+)
          ((eq? x '*) o*)
          (else o-expt))))

;; p.137
(define value
  (lambda (nexp)
    (cond ((atom? nexp) nexp)
          (else
           ((atom-to-function
             (operator nexp))
            (value (1st-sub-exp nexp))
            (value (2nd-sub-exp nexp)))))))

;; p.137
(define multirember-f
  (lambda (test?)
    (lambda (a lat)
      (cond ((null? lat) '())
            ((test? (car lat) a) ((multirember-f test?) a (cdr lat)))
            (else (cons (car lat)
                        ((multirember-f test?) a (cdr lat))))))))

;; p.138
(define multirember-eq?
  (multirember-f eq?))

;; p.138
(define eq?-tuna
  (eq?-c 'tuna))

;; p.139
(define multiremberT
  (lambda (test? lat)
    (cond ((null? lat) '())
          ((test? (car lat)) (multiremberT test? (cdr lat)))
          (else (cons (car lat)
                      (multiremberT test? (cdr lat)))))))

;; p.139
(define multirember&co
  (lambda (a lat col)
    (cond ((null? lat)
           (col '() '()))
          ((eq? (car lat) a)
           (multirember&co a
                           (cdr lat)
                           (lambda (newlat seen)
                             (col newlat (cons (car lat) seen)))))
          (else
           (multirember&co a
                           (cdr lat)
                           (lambda (newlat seen)
                             (col (cons (car lat) newlat) seen)))))))

;; p.140
(define a-friend
  (lambda (x y)
    (null? y)))

;; p.141
(define latest-friend
  (lambda (newlat seen)
    (a-friend (cons 'and newlat) seen)))

;; p.143
(define multiinsertLR
  (lambda (new oldL oldR lat)
    (cond ((null? lat) '())
          ((eq? (car lat) oldL)
           (cons new
                 (cons oldL
                       (multiinsertLR new oldL oldR (cdr lat)))))
          ((eq? (car lat) oldR)
           (cons oldR
                 (cons new
                       (multiinsertLR new oldL oldR (cdr lat)))))
          (else (cons (car lat)
                      (multiinsertLR new oldL oldR (cdr lat)))))))

;; p.145 multiinsertLR&co
(define multiinsertLR&co
  (lambda (new oldL oldR lat col)
    (cond ((null? lat) (col '() 0 0))
          ((eq? (car lat) oldL)
           (multiinsertLR&co new oldL oldR (cdr lat)
                             (lambda (newlat L R)
                               (col (cons new
                                          (cons oldL
                                                newlat))
                                    (+ L 1)
                                    R))))
          ((eq? (car lat) oldR)
           (multiinsertLR&co new oldL oldR (cdr lat)
                             (lambda (newlat L R)
                               (col (cons oldR
                                          (cons new
                                                newlat))
                                    L
                                    (+ R 1)))))
          (else (multiinsertLR&co new oldL oldR (cdr lat)
                                  (lambda (newlat L R)
                                    (col (cons (car lat)
                                               newlat)
                                         L R)))))))

;; p.146
(define even?
  (lambda (n)
    (o= (o* (o/ n 2) 2) n)))

;; p.146
(define evens-only*
  (lambda (l)
    (cond ((null? l) '())
          ((atom? (car l))
           (cond ((even? (car l)) (cons (car l) (evens-only* (cdr l))))
                 (else (evens-only* (cdr l)))))
          (else (cons (evens-only* (car l))
                      (evens-only* (cdr l)))))))

;; p.148
(define evens-only*&co
  (lambda (l col)
    (cond ((null? l) (col '() 1 0))
          ((atom? (car l))
           (cond ((even? (car l))
                  (evens-only*&co
                   (cdr l)
                   (lambda (newl p s)
                     (col (cons (car l) newl)
                          (* (car l) p)
                          s))))
                 (else (evens-only*&co
                        (cdr l)
                        (lambda (newl p s)
                          (col newl p (+ s (car l))))))))
           (else (evens-only*&co
                  (car l)
                  (lambda (al ap as)
                    (evens-only*&co (cdr l)
                                    (lambda (dl dp ds)
                                      (col (cons al dl)
                                           (* ap dp)
                                           (+ as ds))))))))))
;; p.148
(define the-last-friend
  (lambda (newl product sum)
    (cons sum
          (cons product newl))))

;; p.151
(define looking
  (lambda (a lat)
    (keep-looking a (pick 1 lat) lat)))

;; p.152
(define keep-looking
  (lambda (a sorn lat)
    (cond ((number? sorn) (keep-looking a (pick sorn lat) lat))
          (else (eq? sorn a)))))

;; p.154
(define shift
  (lambda (pair)
    (build (first (first pair))
           (build (second (first pair))
                  (second pair)))))

;; p.154
(define align
  (lambda (para)
    (cond ((atom? para) para)
          ((a-pair? (first para))
           (align (shift para)))
          (else (build (first para)
                       (align (second para)))))))

;; p.155
(define length*
  (lambda (para)
    (cond ((atom? para) 1)
          (else (o+ (length* (first para))
                    (length* (second para)))))))

;; p.156
(define weight*
  (lambda (pora)
    (cond ((atom? pora) 1)
          (else (o+ (o* (weight* (first pora)) 2)
                    (weight* (second pora)))))))

;; p.156
(define shuffle
  (lambda (pora)
    (cond ((atom? pora) pora)
          ((a-pair? (first pora))
           (shuffle (revpair pora)))
          (else (build (first pora)
                       (shuffle (second pora)))))))

;; p.157
(define C
  (lambda (n)
    (cond ((one? n) 1)
          ((even? n) (C (o/ n 2)))
          (else (C (add1 (o* 3 n)))))))

;; p.158
(define A
  (lambda (n m)
    (cond ((zero? n) (add1 m))
          ((zero? m) (A (sub1 n) 1))
          (else (A (sub1 n)
                   (A n (sub1 m)))))))

;; p.153
(define (eternity x) (eternity x))

;; p.177
(define new-entry build)

;; p.178
(define lookup-in-entry
  (lambda (name entry entry-f)
    (lookup-in-entry-help name
                          (first entry)
                          (second entry)
                          entry-f)))

;; p.178
(define lookup-in-entry-help
  (lambda (name names values entry-f)
    (cond ((null? names) (entry-f name))
          ((equal? name (car names)) (car values))
          (else (lookup-in-entry-help name (cdr names) (cdr values) entry-f)))))

;; p.178
(define extend-table cons)

;; p.179
(define lookup-in-table
  (lambda (name table table-f)
    (cond ((null? table) (table-f name))
          (else (lookup-in-entry name
                                 (car table)
                                 (lambda (name)
                                   (lookup-in-table name (cdr table) table-f)))))))

;; p.183
(define expression-to-action
  (lambda (e)
    (cond ((atom? e) (atom-to-action e))
          (else (list-to-action e)))))

;; p.183
(define atom-to-action
  (lambda (e)
    (cond
     ((number? e) *const)
     ((eq? e #t) *const)
     ((eq? e #f) *const)
     ((eq? e 'cons) *const)
     ((eq? e 'car) *const)
     ((eq? e 'cdr) *const)
     ((eq? e 'null?) *const)
     ((eq? e 'eq?) *const)
     ((eq? e 'atom?) *const)
     ((eq? e 'zero?) *const)
     ((eq? e 'add1?) *const)
     ((eq? e 'sub1?) *const)
     ((eq? e 'number?) *const)
     (else *identifier))))

;; p184
(define list-to-action
  (lambda (e)
    (cond ((atom? (car e))
           (cond ((eq? (car e) 'quote) *quote)
                 ((eq? (car e) 'lambda) *lambda)
                 ((eq? (car e) 'cond) *cond)
                 (else *application)))
          (else *application))))

(define value
  (lambda (e)
    (meaning e '())))

(define meaning
  (lambda (e table)
    ((expression-to-action e) e table)))

;; p185
(define *const
  (lambda (e table)
    (cond ((number? e) e)
          ((eq? e #t) #t)
          ((eq? e #f) #f)
          (else (build 'primitive e)))))

;; p185
(define *quote
  (lambda (e table)
    (text-of e)))

(define text-of second)

;; p185
(define identifier
  (lambda (e table)
    (lookup-in-table e table initial-table)))

(define initial-table (lambda (name) (car '())))

;; p186
(define *lambda
  (lambda (e table)
    (build 'non-primitive
           (cons table (cdr e)))))
(define table-of first)
(define formals-of second)
(define body-of third)

;; p187
(define evcon
  (lambda (lines table)
    (cond ((else? (question-of (car lines)))
           (meaning (answer-of (car lines)) table))
          ((meaning (question-of (car lines)) table)
           (meaning (answer-of (car lines)) table))
          (else (evcon (cdr lines) table)))))
(define else?
  (lambda (x)
    (cond ((atom? x) (eq? x 'else))
          (else #f))))
(define question-of first)
(define answer-of second)

;; p187
(define *cond
  (lambda (e table)
    (evcon (cond-lines-of e) table)))
(define cond-lines-of cdr)

;; p188
(define evlis
  (lambda (args)
    (cond ((null? args) '())
          (else (cons (meaning (car args) table)
                      (evlis (cdr args) table))))))

;; p188
(define *application
  (lambda (e table)
    (apply (meaning (function-of e) table)
           (evlis (arguments-of e) table))))

;; p189
(define function-of car)
(define arguments-of cdr)

(define primitive?
  (lambda (l)
    (eq? (first l) 'primitive)))

(define non-primitive?
  (lambda (l)
    (eq? (first l) 'non-primitive)))

(define apply
  (lambda (fun vals)
    (cond ((primitive? fun)
           (apply-primitive (second fun) vals))
          ((non-primitive? fun)
           (apply-closure (second fun) vals)))))

(define apply-primitive
  (lambda (name vals)
    (cond ((eq? name 'cons) (cons (first vals) (second vals)))
          ((eq? name 'car) (car (first vals)))
          ((eq? name 'cdr) (cdr (second vals)))
          ((eq? name 'null?) (null? (first vals)))
          ((eq? name 'eq?) (eq? (first vals) (second vals)))
          ((eq? name 'atom?) (atom? (first vals)))
          ((eq? name 'zero?) (zero? (first vals)))
          ((eq? name 'add1) (add1 (first vals)))
          ((eq? name 'sub1) (sub1 (first vals)))
          ((eq? name 'number?) (number? (first vals))))))

(define apply-closure
  (lambda (closure vals)
    (meaning (body-of closure)
             (extend-table
              (new-entry (formals-of closure) vals)
              (table-of closure)))))
