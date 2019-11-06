primitive DNA is Alphabet[DNA box]
  """
  DNA is the strict four-letter representation of DNA.
  
  ATGC: Any of one nucleotide codes (i.e., 4 choose 1)
  """
  fun letters(): DNA => DNA
  fun box string(): String iso^ => "ATGC"