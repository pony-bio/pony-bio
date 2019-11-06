primitive RNA is Alphabet[RNA]
  """
  RNA is the strict four-letter representation of RNA.
  
  AUGC: Any of one nucleotide codes (i.e., 4 choose 1)
  """
  fun letters(): RNA => RNA
  fun box string(): String iso => "AUGC"