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
