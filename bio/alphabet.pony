trait val Alphabet
  fun apply(): String

primitive DNA is Alphabet
  """
  DNA is the strict four-letter representation of DNA.
  
  ATGC: Any of one nucleotide codes (i.e., 4 choose 1)
  """
  fun apply(): String => "ATGC"

primitive RNA is Alphabet
  """
  RNA is the strict four-letter representation of RNA.
  
  AUGC: Any of one nucleotide codes (i.e., 4 choose 1)
  """
  fun apply(): String => "AUGC"

primitive IUPAC is Alphabet
  """
  IUPAC is the IUPAC ambiguous encodings.
  
  RYSWKM: Any of two nucleotide codes (i.e., 4 choose 2)
  BDHV: Any of three nucleotide codes (i.e., 4 choose 3)
  N: Any of four nucleotide codes (i.e., 4 choose 4)
  """
  fun apply(): String => "RYSWKM" + "BDHV" + "N"

primitive DnaIupac is Alphabet
  """
  DnaIupac is the IUPAC representation of DNA.
  
  -: Any of zero nucleotide codes (i.e., 4 choose 0)
  ATGC: Any of one nucleotide codes (i.e., 4 choose 1)
  RYSWKM: Any of two nucleotide codes (i.e., 4 choose 2)
  BDHV: Any of three nucleotide codes (i.e., 4 choose 3)
  N: Any of four nucleotide codes (i.e., 4 choose 4)
  """
  fun apply(): String => DNA.apply() + IUPAC.apply() + Gap.apply()

primitive RnaIupac is Alphabet
  """
  RnaIupac is the IUPAC representation of RNA.
  
  -: Any of zero nucleotide codes (i.e., 4 choose 0)
  AUGC: Any of one nucleotide codes (i.e., 4 choose 1)
  RYSWKM: Any of two nucleotide codes (i.e., 4 choose 2)
  BDHV: Any of three nucleotide codes (i.e., 4 choose 3)
  N: Any of four nucleotide codes (i.e., 4 choose 4)
  """
  fun apply(): String => RNA.apply() + IUPAC.apply() + Gap.apply()

// Hardly believe this *should* be an Alphabet, but
// no current knowledge on better practice.
// TODO: Learn better =)
primitive Gap is Alphabet
  """
  Gap is the encoding of a gap in a sequence.
  
  -: Any of zero nucleotide codes (i.e., 4 choose 0)
  """"
  fun apply(): String => "-"

primitive Protein is Alphabet
  """
  Protein is the gapless encoding of standard amino acids.
  """
  fun apply(): String => "ACDEFGHIKLMNPQRSTVWY"

primitive ProteinGapped is Alphabet
  """
  Protein is the gapped encoding of standard amino acids.
  """
  fun apply(): String => Protein.apply() + Gap.apply()