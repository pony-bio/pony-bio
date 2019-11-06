primitive Protein is Alphabet[Protein]
  """
  Protein is the gapless encoding of standard amino acids.
  """
  fun letters(): Protein => "ACDEFGHIKLMNPQRSTVWY"

primitive ProteinGapped is Alphabet[ProteinGapped]
  """
  Protein is the gapped encoding of standard amino acids.
  """
  fun letters(): ProteinGapped => Protein.apply() + Gap.apply()