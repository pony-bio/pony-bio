primitive IUPAC is Alphabet[IUPAC]
  """
  IUPAC is the IUPAC ambiguous encodings.
  
  RYSWKM: Any of two nucleotide codes (i.e., 4 choose 2)
  BDHV: Any of three nucleotide codes (i.e., 4 choose 3)
  N: Any of four nucleotide codes (i.e., 4 choose 4)
  """
  fun letters(): IUPAC => "RYSWKM" + "BDHV" + "N"

primitive DnaIupac is Alphabet[DnaIupac]
  """
  DnaIupac is the IUPAC representation of DNA.
  
  -: Any of zero nucleotide codes (i.e., 4 choose 0)
  ATGC: Any of one nucleotide codes (i.e., 4 choose 1)
  RYSWKM: Any of two nucleotide codes (i.e., 4 choose 2)
  BDHV: Any of three nucleotide codes (i.e., 4 choose 3)
  N: Any of four nucleotide codes (i.e., 4 choose 4)
  """
  fun letters(): DnaIupac => DNA.letters() + IUPAC.letters() + Gap.letters()

primitive RnaIupac is Alphabet[RnaIupac]
  """
  RnaIupac is the IUPAC representation of RNA.
  
  -: Any of zero nucleotide codes (i.e., 4 choose 0)
  AUGC: Any of one nucleotide codes (i.e., 4 choose 1)
  RYSWKM: Any of two nucleotide codes (i.e., 4 choose 2)
  BDHV: Any of three nucleotide codes (i.e., 4 choose 3)
  N: Any of four nucleotide codes (i.e., 4 choose 4)
  """
  fun letters(): RnaIupac => RNA.letters() + IUPAC.letters() + Gap.letters()
