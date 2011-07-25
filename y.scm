;; 定義済みの関数を読み込む
(add-load-path ".")
(load "func")

;; defineがなかったらlengthは定義出来るか?

;; 空リストの長さを決めるが他に何も決めない。
;; 名前を付けるとしたらlength0
(lambda (l)
  (cond ((null? l) 0)
        (else (add1 (eternity (cdr l))))))

;; 要素が1以下のリストの長さを決めるlength<=1はこんな感じ
(lambda (l)
  (cond ((null? l) 0)
        (else (add1 (length0 (cdr l))))))

;; length0の名前を付けられない。
;; length<=1の中のlength0の部分をlength0の定義で置き換え
(lambda (l)
  (cond ((null? l) 0)
        (else (add1 ((lambda (l)
                       (cond ((null? l) 0)
                             (else (add1 (eternity (cdr l))))))
                     (cdr l))))))

;; もしもlength<=3、length<=4、length<=5のような形で無限の関数を書ければlength∞が書ける。
;; それは無理なのでパターンを探す。
;; lengthに似た関数があるので、それを抽象化する。
;; length0を作る関数を書く
((lambda (length)
   (lambda (l)
     (cond ((null? l) 0)
           (else (add1 (length (cdr l)))))))
 eternity)

;; 同じようにlength<=1
((lambda (length)
   (lambda (l)
     (cond ((null? l) 0)
           (else (add1 (length (cdr l)))))))
 ((lambda (length)
    (lambda (l)
      (cond ((null? l) 0)
            (else (add1 (length (cdr l)))))))
  eternity))

;; length<=2
((lambda (length)
   (lambda (l)
     (cond ((null? l) 0)
           (else (add1 (length (cdr l)))))))
 ((lambda (length)
    (lambda (l)
      (cond ((null? l) 0)
            (else (add1 (length (cdr l)))))))
  ((lambda (length)
     (lambda (l)
       (cond ((null? l) 0)
             (else (add1 (length (cdr l)))))))
   eternity)))

;; まだ繰り返しがある。lengthに似た関数を返す関数に名前をつける。
;; length0
((lambda (mk-length)
   (mk-length eternity))
 (lambda (length)
   (lambda (l)
     (cond ((null? l) 0)
           (else (add1 (length (cdr l))))))))

;; length<=1
((lambda (mk-length)
   (mk-length (mk-length eternity)))
 (lambda (length)
   (lambda (l)
     (cond ((null? l) 0)
           (else (add1 (length (cdr l))))))))

;; length<=2
((lambda (mk-length)
   (mk-length (mk-length (mk-length eternity))))
 (lambda (length)
   (lambda (l)
     (cond ((null? l) 0)
           (else (add1 (length (cdr l))))))))

;; 再帰とは無限にmk-lengthの適用が続いてるようなもの
;; eternityを渡さないでも誰も気にしない。
((lambda (mk-length)
   (mk-length mk-length))
 (lambda (mk-length)
   (lambda (l)
     (cond ((null? l) 0)
           (else (add1 (mk-length (cdr l))))))))

;; lengthと似た関数を作る関数を1回適用するとlength<=1が出来る。
((lambda (mk-length)
   (mk-length mk-length))
 (lambda (mk-length)
   (lambda (l)
     (cond ((null? l) 0)
           (else (add1 ((mk-length eternity) (cdr l))))))))

;; mk-length自身を渡す事で再帰が出来る(!)
((lambda (mk-length)
   (mk-length mk-length))
 (lambda (mk-length)
   (lambda (l)
     (cond ((null? l) 0)
           (else (add1 ((mk-length mk-length) (cdr l))))))))

;; mk-lengthの部分を取り出して、それにlengthという名前を付ける事が出来る。
;; だけど引数に(mk-length mk-length)を渡すと引数を評価してるとこで再帰する。
;; なのでlambdaで包んで評価しないようにしてみる。
((lambda (mk-length)
   (mk-length mk-length))
 (lambda (mk-length)
   ((lambda (length)
      (lambda (l)
        (cond ((null? l) 0)
              (else (add1 (length (cdr l)))))))
    (lambda (x)
      ((mk-length mk-length) x)))))

;; 後はlengthの部分だけを取り出す
((lambda (le)
   ((lambda (mk-length)
      (mk-length mk-length))
    (lambda (mk-length)
      (le
       (lambda (x)
         ((mk-length mk-length) x))))))
 (lambda (length)
   (lambda (l)
     (cond ((null? l) 0)
           (else (add1 (length (cdr l))))))))

;; このlengthを生成してる関数はYコンビネータというらしい。
(define Y
  (lambda (le)
    ((lambda (f)
      (f f))
     (lambda (f)
       (le (lambda (x) ((f f) x)))))))
