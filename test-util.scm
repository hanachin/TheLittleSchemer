(define-syntax eqt
  (syntax-rules ()
    ((_ expr expected)
     (test* (quote expr) expected expr))))

(define-syntax f-test
  (syntax-rules (=>)
    ((_ (f (=> a args ...) ...) ...)
     (begin
       (begin
         (test-section (symbol->string (quote f)))
         (eqt (f args ...) a) ...) ...))
  ((_ (f (args rest ...) ...) ...)
   (begin (f-test (f (rest ... args) ...)) ...))))
