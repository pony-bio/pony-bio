use "../alphabet"

primitive Translater
  fun apply(rna: RNASequence box): ProteinSequence ref =>
    let res = Array[AminoAcid](rna.seq.size() / 3)
    let codon = Array[RNALetters](3)
    for letter in rna.seq.values() do
      codon.push(letter)
      if codon.size() == 3 then
        res.push(StandardCodonTable(codon))
      end
      codon.clear()
      res.push(match letter
      end)
    end
    ProteinSequence(res)

/*
TTT F Phe      TCT S Ser      TAT Y Tyr      TGT C Cys  
TTC F Phe      TCC S Ser      TAC Y Tyr      TGC C Cys  
TTA L Leu      TCA S Ser      TAA * Ter      TGA * Ter  
TTG L Leu i    TCG S Ser      TAG * Ter      TGG W Trp  

CTT L Leu      CCT P Pro      CAT H His      CGT R Arg  
CTC L Leu      CCC P Pro      CAC H His      CGC R Arg  
CTA L Leu      CCA P Pro      CAA Q Gln      CGA R Arg  
CTG L Leu i    CCG P Pro      CAG Q Gln      CGG R Arg  

ATT I Ile      ACT T Thr      AAT N Asn      AGT S Ser  
ATC I Ile      ACC T Thr      AAC N Asn      AGC S Ser  
ATA I Ile      ACA T Thr      AAA K Lys      AGA R Arg  
ATG M Met i    ACG T Thr      AAG K Lys      AGG R Arg  

GTT V Val      GCT A Ala      GAT D Asp      GGT G Gly  
GTC V Val      GCC A Ala      GAC D Asp      GGC G Gly  
GTA V Val      GCA A Ala      GAA E Glu      GGA G Gly  
GTG V Val      GCG A Ala      GAG E Glu      GGG G Gly
*/
primitive StandardCodonTable
  fun(codon: Array[RNALetters] box) AminoAcid ref =>


// Good idea? Bad idea?
type Codon is (AminoAcid, AminoAcid, AminoAcid)