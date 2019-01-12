(define-sort A () (Array Int String))
(define-fun prepend ((x A) (y A)) A ((_ map (str.++ (String String) String)) x y))
(define-const prefix A ((as const (Array Int String)) "pre-"))

(declare-const s1 A)
(declare-const s2 A)

(assert (= s2 (prepend prefix s1)))
(assert (= (select s1 0) "v1"))
(assert (= (select s1 1) "v2"))
(check-sat)
(get-model)
