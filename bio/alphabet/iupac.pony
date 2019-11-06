primitive IUPAC is Alphabet[IUPAC]
  """
  IUPAC is the IUPAC ambiguous encodings.
  
  RYSWKM: Any of two nucleotide codes (i.e., 4 choose 2)
  BDHV: Any of three nucleotide codes (i.e., 4 choose 3)
  N: Any of four nucleotide codes (i.e., 4 choose 4)
  """
  fun letters(): A => "RYSWKM" + "BDHV" + "N"

primitive DnaIupac is Alphabet[DnaIupac]
  """
  DnaIupac is the IUPAC representation of DNA.
  
  -: Any of zero nucleotide codes (i.e., 4 choose 0)
  ATGC: Any of one nucleotide codes (i.e., 4 choose 1)
  RYSWKM: Any of two nucleotide codes (i.e., 4 choose 2)
  BDHV: Any of three nucleotide codes (i.e., 4 choose 3)
  N: Any of four nucleotide codes (i.e., 4 choose 4)
  """
  fun letters(): A => DNA.letters() + IUPAC.letters() + Gap.letters()

primitive RnaIupac is Alphabet
  """
  RnaIupac is the IUPAC representation of RNA.
  
  -: Any of zero nucleotide codes (i.e., 4 choose 0)
  AUGC: Any of one nucleotide codes (i.e., 4 choose 1)
  RYSWKM: Any of two nucleotide codes (i.e., 4 choose 2)
  BDHV: Any of three nucleotide codes (i.e., 4 choose 3)
  N: Any of four nucleotide codes (i.e., 4 choose 4)
  """
  fun letters(): A => RNA.letters() + IUPAC.letters() + Gap.letters()
