use "../alphabet"

primitive Transcriber
  fun to_rna(dna: DNASequence box): RNASequence ref =>
    let res = Array[RNALetters](dna.seq.size())
    for letter in dna.seq.values() do
      res.push(match letter
        | Adenine => Adenine
        | Cytosine => Cytosine
        | Guanine => Guanine
        | Thymine => Uracil
      end)
    end
    RNASequence(res)

  fun to_dna(rna: RNASequence box): DNASequence ref =>
    let res = Array[DNALetters](rna.seq.size())
    for letter in rna.seq.values() do
      res.push(match letter
        | Adenine => Adenine
        | Cytosine => Cytosine
        | Guanine => Guanine
        | Uracil => Thymine
      end)
    end
    DNASequence(res)