(declare-sort A)
(declare-const x A)
(declare-const y A)
(declare-const y_type String)
(declare-fun atype (A) String)

;(define-const string_type String "::String")
;(assert (= (atype x) string_type))
(assert (= (atype x) "::String"))
(assert (= (atype x) (atype y)))

(assert (= (atype y)  y_type))
(check-sat)
(get-model)
