(declare-const str1 String)
(declare-const seq1 (Seq String))
(declare-const seq2 (Seq String))

(assert (= str1 "ab"))
(assert (= seq1 (seq.unit str1)))
(assert (= (seq.extract seq1 0 1) seq2))
(check-sat)
(get-model)

