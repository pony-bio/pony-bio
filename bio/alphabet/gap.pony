// Hardly believe this *should* be an Alphabet, but
// no current knowledge on better practice.
// TODO: Learn better =)
primitive Gap is Alphabet[Gap]
  """
  Gap is the encoding of a gap in a sequence.
  
  -: Any of zero nucleotide codes (i.e., 4 choose 0)
  """"
  fun letters(): Gap => Gap
  fun box string(): String iso => "-"