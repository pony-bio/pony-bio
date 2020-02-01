class val Protein is Alphabet[AminoAcid]
    fun letters(): Array[AminoAcid] val =>
        [
            Alanine       ; Cysteine  ; AsparticAcid ; GlutamicAcid
            Phenylalanine ; Glycine   ; Histidine    ; Isoleucine
            Lysine        ; Leucine   ; Methionine   ; Asparagine
            Proline       ; Glutamine ; Arginine     ; Serine
            Threonine     ; Valine    ; Tryptophan   ; Tyrosine
        ]
    fun string(): String iso^ => "ACDEFGHIKLMNPQRSTVWY".clone()
    fun parse(raw: String): (AminoAcid | None) =>
        if raw.size() == 1 then
            try
                match raw.upper().at_offset(1)?
                | 'A' => Alanine
                | 'C' => Cysteine
                | 'D' => AsparticAcid
                | 'E' => GlutamicAcid
                | 'F' => Phenylalanine
                | 'G' => Glycine
                | 'H' => Histidine
                | 'I' => Isoleucine
                | 'K' => Lysine
                | 'L' => Leucine
                | 'M' => Methionine
                | 'N' => Asparagine
                | 'P' => Proline
                | 'Q' => Glutamine
                | 'R' => Arginine
                | 'S' => Serine
                | 'T' => Threonine
                | 'V' => Valine
                | 'W' => Tryptophan
                | 'Y' => Tyrosine
                end
            end
        elseif raw.size() == 3 then
            match raw.upper()
            | "ALA" => Alanine
            | "CYS" => Cysteine
            | "ASP" => AsparticAcid
            | "GLU" => GlutamicAcid
            | "PHE" => Phenylalanine
            | "GLY" => Glycine
            | "HIS" => Histidine
            | "ILE" => Isoleucine
            | "LYS" => Lysine
            | "LEU" => Leucine
            | "MET" => Methionine
            | "ASN" => Asparagine
            | "PRO" => Proline
            | "GLN" => Glutamine
            | "ARG" => Arginine
            | "SER" => Serine
            | "THR" => Threonine
            | "VAL" => Valine
            | "TRP" => Tryptophan
            | "TYR" => Tyrosine
            end
        end

type AminoAcid is (Alanine       | Cysteine  | AsparticAcid | GlutamicAcid |
                   Phenylalanine | Glycine   | Histidine    | Isoleucine   |
                   Lysine        | Leucine   | Methionine   | Asparagine   |
                   Proline       | Glutamine | Arginine     | Serine       |
                   Threonine     | Valine    | Tryptophan   | Tyrosine)

primitive Alanine
    fun string(): String iso^ => "Alanine".clone()
    fun oneletter(): String => "A"
    fun threeletter(): String => "Ala"

primitive Cysteine
    fun string(): String iso^ => "Cysteine".clone()
    fun oneletter(): String => "C"
    fun threeletter(): String => "Cys"

primitive AsparticAcid
    fun string(): String iso^ => "Aspartic Acid".clone()
    fun oneletter(): String => "D"
    fun threeletter(): String => "Asp"

primitive GlutamicAcid
    fun string(): String iso^ => "Glutamic Acid".clone()
    fun oneletter(): String => "E"
    fun threeletter(): String => "Glu"

primitive Phenylalanine
    fun string(): String iso^ => "Phenylalanine".clone()
    fun oneletter(): String => "F"
    fun threeletter(): String => "Phe"

primitive Glycine
    fun string(): String iso^ => "Glycine".clone()
    fun oneletter(): String => "G"
    fun threeletter(): String => "Gly"

primitive Histidine
    fun string(): String iso^ => "Histidine".clone()
    fun oneletter(): String => "H"
    fun threeletter(): String => "His"

primitive Isoleucine
    fun string(): String iso^ => "Isoleucine".clone()
    fun oneletter(): String => "I"
    fun threeletter(): String => "Ile"

primitive Lysine
    fun string(): String iso^ => "Lysine".clone()
    fun oneletter(): String => "K"
    fun threeletter(): String => "Lys"

primitive Leucine
    fun string(): String iso^ => "Leucine".clone()
    fun oneletter(): String => "L"
    fun threeletter(): String => "Leu"

primitive Methionine
    fun string(): String iso^ => "Methionine".clone()
    fun oneletter(): String => "M"
    fun threeletter(): String => "Met"

primitive Asparagine
    fun string(): String iso^ => "Asparagine".clone()
    fun oneletter(): String => "N"
    fun threeletter(): String => "Asn"

primitive Proline
    fun string(): String iso^ => "Proline".clone()
    fun oneletter(): String => "P"
    fun threeletter(): String => "Pro"

primitive Glutamine
    fun string(): String iso^ => "Glutamine".clone()
    fun oneletter(): String => "Q"
    fun threeletter(): String => "Gln"

primitive Arginine
    fun string(): String iso^ => "Arginine".clone()
    fun oneletter(): String => "R"
    fun threeletter(): String => "Arg"

primitive Serine
    fun string(): String iso^ => "Serine".clone()
    fun oneletter(): String => "S"
    fun threeletter(): String => "Ser"

primitive Threonine
    fun string(): String iso^ => "Threonine".clone()
    fun oneletter(): String => "T"
    fun threeletter(): String => "Thr"

primitive Valine
    fun string(): String iso^ => "Valine".clone()
    fun oneletter(): String => "V"
    fun threeletter(): String => "Val"

primitive Tryptophan
    fun string(): String iso^ => "Tryptophan".clone()
    fun oneletter(): String => "W"
    fun threeletter(): String => "Trp"

primitive Tyrosine
    fun string(): String iso^ => "Tyrosined".clone()
    fun oneletter(): String => "Y"
    fun threeletter(): String => "Tyr"
