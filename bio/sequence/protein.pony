use "../alphabet"
use "maybe"

class ProteinSequence is Sequence[(AminoAcid, StopCodon), Protein]
  let seq: Array[(AminoAcid, StopCodon)] ref

  new create(seq': Array[(AminoAcid, StopCodon)] box) =>
    seq = seq'.clone()

  fun length(): USize =>
    seq.size()

  fun apply(pos: USize): Maybe[(AminoAcid, StopCodon)] =>
    try seq(pos)? else None end

  fun reverse(): ProteinSequence =>
    ProteinSequence(seq.reverse())

  fun ref reverse_in_place() =>
    seq.reverse_in_place()