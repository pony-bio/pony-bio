use "../alphabet"

primitive Translater
  fun apply(rna: RNASequence box): StoppableProteinSequence ref =>
    let res = Array[(AminoAcid | Stop)](rna.seq.size() / 3)
    let codon = Array[RNALetters](3)
    for (i, l) in rna.seq.pairs() do
      if (i % 3) == 0 then 
        if i == 0 then continue end  // Skip the first index
        try
          let aa: (AminoAcid | Stop | None) = StandardCodonTable((codon(0)?, codon(1)?, codon(2)?))
          match aa 
            | AminoAcid => res.push(aa)
            | Stop => res.push(aa)
            | None => error  // Translation table should be exhaustive
          end
        end
        codon.clear()
      end
      codon.push(l)
    end
    StoppableProteinSequence(res)

primitive StandardCodonTable
  fun apply(codon: Codon): (AminoAcid | Stop | None) => 
    match codon 
      | (Uracil, Uracil, Uracil)       => Phenylalanine // UUU F Phe
      | (Uracil, Uracil, Cytosine)     => Phenylalanine // UUC F Phe
      | (Uracil, Uracil, Adenine)      => Leucine       // UUA L Leu
      | (Uracil, Uracil, Guanine)      => Leucine       // UUG L Leu i
      | (Uracil, Cytosine, Uracil)     => Serine        // UCU S Ser
      | (Uracil, Cytosine, Cytosine)   => Serine        // UCC S Ser
      | (Uracil, Cytosine, Adenine)    => Serine        // UCA S Ser
      | (Uracil, Cytosine, Guanine)    => Serine        // UCG S Ser
      | (Uracil, Adenine, Uracil)      => Tyrosine      // UAU Y Tyr
      | (Uracil, Adenine, Cytosine)    => Tyrosine      // UAC Y Tyr
      | (Uracil, Adenine, Adenine)     => Stop          // UAA * Ter 
      | (Uracil, Adenine, Guanine)     => Stop          // UAG * Ter
      | (Uracil, Guanine, Uracil)      => Cysteine      // UGU C Cys
      | (Uracil, Guanine, Cytosine)    => Cysteine      // UGC C Cys  
      | (Uracil, Guanine, Adenine)     => Stop          // UGA * Ter 
      | (Uracil, Guanine, Guanine)     => Tryptophan    // UGG W Trp
      | (Cytosine, Uracil, Uracil)     => Leucine       // CUU L Leu
      | (Cytosine, Uracil, Cytosine)   => Leucine       // CUC L Leu
      | (Cytosine, Uracil, Adenine)    => Leucine       // CUA L Leu
      | (Cytosine, Uracil, Guanine)    => Leucine       // CUG L Leu i
      | (Cytosine, Cytosine, Uracil)   => Proline       // CCU P Pro
      | (Cytosine, Cytosine, Cytosine) => Proline       // CCC P Pro
      | (Cytosine, Cytosine, Adenine)  => Proline       // CCA P Pro
      | (Cytosine, Cytosine, Guanine)  => Proline       // CCG P Pro
      | (Cytosine, Adenine, Uracil)    => Histidine     // CAU H His
      | (Cytosine, Adenine, Cytosine)  => Histidine     // CAC H His
      | (Cytosine, Adenine, Adenine)   => Glutamine     // CAA Q Gln 
      | (Cytosine, Adenine, Guanine)   => Glutamine     // CAG Q Gln
      | (Cytosine, Guanine, Uracil)    => Arginine      // CGU R Arg
      | (Cytosine, Guanine, Cytosine)  => Arginine      // CGC R Arg
      | (Cytosine, Guanine, Adenine)   => Arginine      // CGA R Arg
      | (Cytosine, Guanine, Guanine)   => Arginine      // CGG R Arg
      | (Adenine, Uracil, Uracil)      => Isoleucine    // AUU I Ile  
      | (Adenine, Uracil, Cytosine)    => Isoleucine    // AUC I Ile   
      | (Adenine, Uracil, Adenine)     => Isoleucine    // AUA I Ile  
      | (Adenine, Uracil, Guanine)     => Methionine    // AUG M Met i
      | (Adenine, Cytosine, Uracil)    => Threonine     // ACU U Thr
      | (Adenine, Cytosine, Cytosine)  => Threonine     // ACC U Thr
      | (Adenine, Cytosine, Adenine)   => Threonine     // ACA U Thr
      | (Adenine, Cytosine, Guanine)   => Threonine     // ACG U Thr
      | (Adenine, Adenine, Uracil)     => Asparagine    // AAU N Asn
      | (Adenine, Adenine, Cytosine)   => Asparagine    // AAC N Asn
      | (Adenine, Adenine, Adenine)    => Lysine        // AAA K Lys
      | (Adenine, Adenine, Guanine)    => Lysine        // AAG K Lys
      | (Adenine, Guanine, Uracil)     => Serine        // AGU S Ser
      | (Adenine, Guanine, Cytosine)   => Serine        // AGC S Ser
      | (Adenine, Guanine, Adenine)    => Arginine      // AGA R Arg
      | (Adenine, Guanine, Guanine)    => Arginine      // AGG R Arg
      | (Guanine, Uracil, Uracil)      => Valine        // GUU V Val
      | (Guanine, Uracil, Cytosine)    => Valine        // GUC V Val
      | (Guanine, Uracil, Adenine)     => Valine        // GUA V Val
      | (Guanine, Uracil, Guanine)     => Valine        // GUG V Val
      | (Guanine, Cytosine, Uracil)    => Alanine       // GCU A Ala
      | (Guanine, Cytosine, Cytosine)  => Alanine       // GCC A Ala
      | (Guanine, Cytosine, Adenine)   => Alanine       // GCA A Ala 
      | (Guanine, Cytosine, Guanine)   => Alanine       // GCG A Ala 
      | (Guanine, Adenine, Uracil)     => AsparticAcid  // GAU D Asp
      | (Guanine, Adenine, Cytosine)   => AsparticAcid  // GAC D Asp
      | (Guanine, Adenine, Adenine)    => GlutamicAcid  // GAA E Glu 
      | (Guanine, Adenine, Guanine)    => GlutamicAcid  // GAG E Glu 
      | (Guanine, Guanine, Uracil)     => Glycine       // GGU G Gly
      | (Guanine, Guanine, Cytosine)   => Glycine       // GGC G Gly
      | (Guanine, Guanine, Adenine)    => Glycine       // GGA G Gly
      | (Guanine, Guanine, Guanine)    => Glycine       // GGG G Gly
    else 
      None
    end

  fun start(): Codon => 
    let x: Codon = (Adenine, Uracil, Guanine)
    x

// Good idea? Bad idea?
type Codon is (RNALetters, RNALetters, RNALetters)