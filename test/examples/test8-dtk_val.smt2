(declare-datatypes (T) ((Lst nil (cons (hd T) (tl Lst)))))
(declare-const list1 (Lst (Seq Int)))
(declare-const list2 (Lst (Seq Int)))
(declare-const seq1 (Seq Int))
(assert (= 1 (seq.len seq1)))
(assert  (not (= list1 list2)))
(assert (= list1 (cons seq1 nil)))  
(check-sat)
(get-model)

(reset)
(declare-datatypes () ((Tree leaf (node0 (s String)) (node1 (stringvar String) (value Int) (children TreeList))) (TreeList nil (cons (car Tree) (cdr TreeList)))))
(declare-const t1 Tree)
(declare-const t2 Tree)
(declare-const t3 TreeList)
(assert (= t1 (node0 "this is test")))
(assert (= t2 (node1 "this is 2nd test" 2 t3)))

(assert (not (= t3 (as nil TreeList))))
(assert (not (is-node0 t2)))
(assert (> (value t1) 20))
(assert (not (is-leaf t2)))
(assert (= 2 (value t2)))
(assert (not (=  t1 t2)))
(check-sat)
(get-model)

(reset)

;(declare-datatypes () ((DTKBaseVal nil (string (s String)) (int (i Int)) (bool (b Bool)))))
;(declare-datatypes () ((DTKVal nil (hash (h (Array String DTKBaseVal))))))


(declare-datatypes () ((DTKVal nil (string (s String)) (int (i Int)) (bool (b Bool)) (hash (h DTKHash)))
                       (DTKHashPair (pair (s String) (b DTKVal)))
                       (DTKHash  (seq (Seq DTKHashPair)))))

; does not work                       (DTKHash (s (Array Int DTKHashPair)))))

(declare-const v1 DTKVal)
(declare-const v2 DTKVal)
(declare-const seq_hp (Seq DTKHashPair))
(assert (is-hash v1))
(assert (is-hash v2))

;(assert (= a1 (hash (seq seq_hp)))) doesnt work

(check-sat)
(get-model)

