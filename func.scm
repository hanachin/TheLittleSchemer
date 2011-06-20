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
;; p.97
(define rember
  (lambda (s l)
    (cond ((null? l) '())
          ((equal? (car l) s) (cdr l))
          (else (cons (car l)
                      (rember s (cdr l)))))))

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

;; p.52 (simplify)
(define insertR
  (lambda (new old lat)
    (cond ((null? lat) '())
          ((eq? (car lat) old) (cons old (cons new (cdr lat))))
          (else (cons (car lat)
                      (insertR new old (cdr lat)))))))

;; p.52 insertL (simplify)
(define insertL
  (lambda (new old lat)
    (cond ((null? lat) '())
          ((eq? (car lat) old) (cons new lat))
          (else (cons (car lat)
                      (insertL new old (cdr lat)))))))

;; p.53 (simplify)
(define subst
  (lambda (new old lat)
    (cond ((null? lat) '())
          ((eq? (car lat) old) (cons new (cdr lat)))
          (else (cons (car lat)
                      (subst new old (cdr lat)))))))

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

;; p.105
(define value
  (lambda (nexp)
    (cond ((atom? nexp) nexp)
          ((eq? (operator nexp) '+)
           (o+ (value (1st-sub-exp nexp))
               (value (2nd-sub-exp nexp))))
          ((eq? (operator nexp) '*)
           (o* (value (1st-sub-exp nexp))
               (value (2nd-sub-exp nexp))))
          (else
           (o-expt (value (1st-sub-exp nexp))
                   (value (2nd-sub-exp nexp)))))))

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
