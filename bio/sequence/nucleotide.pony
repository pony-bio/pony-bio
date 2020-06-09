use "../alphabet"
use "maybe"

class DNASequence is Sequence[DNALetters, DNA]
  let seq: Array[DNALetters] ref

  new create(seq': Array[DNALetters] box) =>
    seq = seq'.clone()

  fun length(): USize =>
    seq.size()

  fun apply(pos: USize): Maybe[DNALetters] =>
    try seq(pos)? else None end

  fun reverse(): DNASequence ref =>
    DNASequence(seq.reverse())

  fun ref reverse_in_place() =>
    seq.reverse_in_place()

  fun complement(): DNASequence ref =>
    let res = DNASequence(seq)
    res.complement_in_place()
    res

  fun ref complement_in_place() =>
    for (index, letter) in seq.pairs() do
      try
        seq(index)? = match letter
          | Adenine => Thymine
          | Cytosine => Guanine
          | Guanine => Cytosine
          | Thymine => Adenine
        end
      else None end // should not fail
    end

  fun revcomp(): DNASequence ref =>
    let res = DNASequence(seq)
    res.complement_in_place()
    res.reverse_in_place()
    res

  fun ref revcomp_in_place() =>
    complement_in_place()
    reverse_in_place()

class RNASequence is Sequence[RNALetters, RNA]
  let seq: Array[RNALetters] ref

  new create(seq': Array[RNALetters] box) =>
    seq = seq'.clone()

  fun length(): USize =>
    seq.size()

  fun apply(pos: USize): Maybe[RNALetters] =>
    try seq(pos)? else None end

  fun reverse(): RNASequence =>
    RNASequence(seq.reverse())

  fun ref reverse_in_place() =>
    seq.reverse_in_place()

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
