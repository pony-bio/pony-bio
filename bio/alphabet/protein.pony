primitive Protein is Alphabet[Protein]
  """
  Protein is the gapless encoding of standard amino acids.
  """
  fun letters(): A => "ACDEFGHIKLMNPQRSTVWY"

primitive ProteinGapped is Alphabet[ProteinGapped]
  """
  Protein is the gapped encoding of standard amino acids.
  """
  fun letters(): A => Protein.apply() + Gap.apply()