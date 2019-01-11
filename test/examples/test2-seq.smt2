(declare-const seq1 (Seq String))
(declare-const seq2 (Seq String))
(declare-const seq3 (Seq String))

(assert (= seq1 (seq.++ (seq.unit "ab") (seq.unit "def"))))
(assert (= seq2 (seq.extract seq1 0 1)))
(assert (= seq3 (seq.++ seq1 seq1)))
(check-sat)
(get-model)

