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
          (else (or (eq? (car lat) a)
                    (member? a (cdr lat)))))))
;; p.41
(define rember
  (lambda (a lat)
    (cond ((null? lat) '())
          ((eq? (car lat) a) (cdr lat))
          (else (cons (car lat)
                      (rember a (cdr lat)))))))

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
          ((eq? (car lat) a) (multirember a (cdr lat)))
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
