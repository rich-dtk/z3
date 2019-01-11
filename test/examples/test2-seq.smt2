(declare-const seq1 (Seq String))
(declare-const seq2 (Seq String))

(assert (= seq1 (seq.++ (seq.unit "ab") (seq.unit "def"))))
(assert (= (seq.extract seq1 0 1) seq2))
(check-sat)
(get-model)

