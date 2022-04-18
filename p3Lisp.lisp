(defmacro +=(a b)
    `(setf , a (+ , a , b))
)

(defmacro iterate(cV bVe eVe iE &rest others)
    (let ((incr(gensym)) (end(gensym)) )
        `(do ((, incr , iE) (, end , eVe) (, cV , bVe(+= , cV , incr)))
            ((> , cV , end) T)
            ,@ others
         )
    )
)

(setf x 1)
(+= x 5)

(iterate i 1 5 1
    (print (list 'one i))
)

(setf n 5)

(iterate i 1 n 1
    (print (list 'two i n))
    (+= i 1)
)

(setf n 5)

(iterate i 1 n 1
    (print (list 'three i n))
    (+= n 1)
)

(setf n 5)
(setf inc 2)

(iterate i 1 n inc
    (print (list 'three i n inc))
    (+= inc 1)
)

;; test +=
(setf x 10)
(+= x 5)
(print x)

;; iterate
(iterate i 1 5 1
    (print (list 'one i) )
)

(setf n 5)

(iterate i 1 n 1
    (print (list 'two i n))
    (+= i 1)
)

(setf n 5)

(iterate i 1 n 1
    (print (list 'three i n))
    (+= n 1)
)

(setf n 5)

(setf inc 2)

(iterate i 1 n inc
    (print (list 'three i n inc))
    (+= inc 1)
)

(setf n 5)
(setf inc 5)
(iterate i 1 (+ n 2) inc
    (print (list 'four i n inc))
    (+= n 1)
    (+= i 1)
    (+= inc 1)
)
