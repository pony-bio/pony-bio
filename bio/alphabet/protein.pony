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
    fun box string(): String => "Alanine"
    fun box oneletter(): String => "A"
    fun box threeletter(): String => "Ala"

primitive Cysteine
    fun box string(): String => "Cysteine"
    fun box oneletter(): String => "C"
    fun box threeletter(): String => "Cys"

primitive AsparticAcid
    fun box string(): String => "Aspartic Acid"
    fun box oneletter(): String => "D"
    fun box threeletter(): String => "Asp"

primitive GlutamicAcid
    fun box string(): String => "Glutamic Acid"
    fun box oneletter(): String => "E"
    fun box threeletter(): String => "Glu"

primitive Phenylalanine
    fun box string(): String => "Phenylalanine"
    fun box oneletter(): String => "F"
    fun box threeletter(): String => "Phe"

primitive Glycine
    fun box string(): String => "Glycine"
    fun box oneletter(): String => "G"
    fun box threeletter(): String => "Gly"

primitive Histidine
    fun box string(): String => "Histidine"
    fun box oneletter(): String => "H"
    fun box threeletter(): String => "His"

primitive Isoleucine
    fun box string(): String => "Isoleucine"
    fun box oneletter(): String => "I"
    fun box threeletter(): String => "Ile"

primitive Lysine
    fun box string(): String => "Lysine"
    fun box oneletter(): String => "K"
    fun box threeletter(): String => "Lys"

primitive Leucine
    fun box string(): String => "Leucine"
    fun box oneletter(): String => "L"
    fun box threeletter(): String => "Leu"

primitive Methionine
    fun box string(): String => "Methionine"
    fun box oneletter(): String => "M"
    fun box threeletter(): String => "Met"

primitive Asparagine
    fun box string(): String => "Asparagine"
    fun box oneletter(): String => "N"
    fun box threeletter(): String => "Asn"

primitive Proline
    fun box string(): String => "Proline"
    fun box oneletter(): String => "P"
    fun box threeletter(): String => "Pro"

primitive Glutamine
    fun box string(): String => "Glutamine"
    fun box oneletter(): String => "Q"
    fun box threeletter(): String => "Gln"

primitive Arginine
    fun box string(): String => "Arginine"
    fun box oneletter(): String => "R"
    fun box threeletter(): String => "Arg"

primitive Serine
    fun box string(): String => "Serine"
    fun box oneletter(): String => "S"
    fun box threeletter(): String => "Ser"

primitive Threonine
    fun box string(): String => "Threonine"
    fun box oneletter(): String => "T"
    fun box threeletter(): String => "Thr"

primitive Valine
    fun box string(): String => "Valine"
    fun box oneletter(): String => "V"
    fun box threeletter(): String => "Val"

primitive Tryptophan
    fun box string(): String => "Tryptophan"
    fun box oneletter(): String => "W"
    fun box threeletter(): String => "Trp"

primitive Tyrosine
    fun box string(): String => "Tyrosined"
    fun box oneletter(): String => "Y"
    fun box threeletter(): String => "Tyr"
