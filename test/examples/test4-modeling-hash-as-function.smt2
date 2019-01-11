(declare-sort A)
(declare-fun hash (String) A)
(declare-fun hash2 (String) A)
(declare-fun string_val (A) String)
(declare-const a1 A)
(declare-const a2 A)
(declare-const v1 String)
(declare-const v2 String)
(assert (= (hash "key1") a1))
(assert (= (hash "key2") a2))
(assert (= (string_val a1) "v1"))
(assert (= (string_val a2) "v2"))

(assert (forall ((s String)) (= (hash s) (hash2 s)))) 

(assert (= v1 (string_val (hash2 "key1"))))
(assert (= v2 (string_val (hash2 "key2"))))

(check-sat)
(get-model)

