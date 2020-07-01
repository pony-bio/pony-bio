use "../alphabet"
use "maybe"

class ProteinSequence is Sequence[AminoAcid, Protein]
  let seq: Array[AminoAcid] ref

  new create(seq': Array[AminoAcid] box) =>
    seq = seq'.clone()

  fun length(): USize =>
    seq.size()

  fun apply(pos: USize): Maybe[AminoAcid] =>
    try seq(pos)? else None end

  fun reverse(): ProteinSequence =>
    ProteinSequence(seq.reverse())

  fun ref reverse_in_place() =>
    seq.reverse_in_place()

class StoppableProteinSequence is Sequence[(AminoAcid | Stop), StoppableProtein]
  let seq: Array[(AminoAcid | Stop)] ref

  new create(seq': Array[(AminoAcid | Stop)] box) =>
    seq = seq'.clone()

  fun length(): USize =>
    seq.size()

  fun apply(pos: USize): Maybe[(AminoAcid | Stop)] =>
    try seq(pos)? else None end

  fun reverse(): StoppableProteinSequence =>
    StoppableProteinSequence(seq.reverse())

  fun ref reverse_in_place() =>
    seq.reverse_in_place()