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
