primitive Protein is Alphabet[Protein]
  """
  Protein is the gapless encoding of standard amino acids.
  """
  fun letters(): Protein => Protein
  fun box string(): String iso => "ACDEFGHIKLMNPQRSTVWY"

primitive ProteinGapped is Alphabet[ProteinGapped]
  """
  Protein is the gapped encoding of standard amino acids.
  """
  fun letters(): ProteinGapped => ProteinGapped
  fun box string(): String iso => Protein.apply() + Gap.apply()