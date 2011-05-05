(define-syntax f-test
  (syntax-rules (=>)
    ((_ (f (=> a args ...) ...) ...)
     (let-syntax
         ((eqt (syntax-rules ()
                 ((_ expr expected)
                  (test* (quote expr) expected expr)))))
       (begin
         (test-section (symbol->string (quote f)))
         (eqt (f args ...) a) ...) ...))
    ((_ (f (args rest ...) ...) ...)
     (begin (f-test (f (rest ... args) ...)) ...))))
