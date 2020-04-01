class val Protein is Alphabet[AminoAcid]
    fun letters(): Array[AminoAcid] val =>
        [
            Alanine       ; Cysteine  ; AsparticAcid ; GlutamicAcid
            Phenylalanine ; Glycine   ; Histidine    ; Isoleucine
            Lysine        ; Leucine   ; Methionine   ; Asparagine
            Proline       ; Glutamine ; Arginine     ; Serine
            Threonine     ; Valine    ; Tryptophan   ; Tyrosine
        ]

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

class val ThreeLetterProtein is Alphabet[AminoAcid]
    fun letters(): Array[AminoAcid] val => Protein.letters()

    fun parse(raw: String) => Protein.parse(raw)

    fun string(): String iso^ =>
        recover iso
            let arr = this.letters()
            let str = String(arr.size() * 3)
            for l in arr.values() do
                str.append(l.code_long())
            end
            str
        end

type AminoAcid is (Alanine       | Cysteine  | AsparticAcid | GlutamicAcid |
                   Phenylalanine | Glycine   | Histidine    | Isoleucine   |
                   Lysine        | Leucine   | Methionine   | Asparagine   |
                   Proline       | Glutamine | Arginine     | Serine       |
                   Threonine     | Valine    | Tryptophan   | Tyrosine)

primitive Alanine
    fun string(): String iso^ => "Alanine".clone()
    fun code(): String => "A"
    fun code_long(): String => "Ala"

primitive Cysteine
    fun string(): String iso^ => "Cysteine".clone()
    fun code(): String => "C"
    fun code_long(): String => "Cys"

primitive AsparticAcid
    fun string(): String iso^ => "Aspartic Acid".clone()
    fun code(): String => "D"
    fun code_long(): String => "Asp"

primitive GlutamicAcid
    fun string(): String iso^ => "Glutamic Acid".clone()
    fun code(): String => "E"
    fun code_long(): String => "Glu"

primitive Phenylalanine
    fun string(): String iso^ => "Phenylalanine".clone()
    fun code(): String => "F"
    fun code_long(): String => "Phe"

primitive Glycine
    fun string(): String iso^ => "Glycine".clone()
    fun code(): String => "G"
    fun code_long(): String => "Gly"

primitive Histidine
    fun string(): String iso^ => "Histidine".clone()
    fun code(): String => "H"
    fun code_long(): String => "His"

primitive Isoleucine
    fun string(): String iso^ => "Isoleucine".clone()
    fun code(): String => "I"
    fun code_long(): String => "Ile"

primitive Lysine
    fun string(): String iso^ => "Lysine".clone()
    fun code(): String => "K"
    fun code_long(): String => "Lys"

primitive Leucine
    fun string(): String iso^ => "Leucine".clone()
    fun code(): String => "L"
    fun code_long(): String => "Leu"

primitive Methionine
    fun string(): String iso^ => "Methionine".clone()
    fun code(): String => "M"
    fun code_long(): String => "Met"

primitive Asparagine
    fun string(): String iso^ => "Asparagine".clone()
    fun code(): String => "N"
    fun code_long(): String => "Asn"

primitive Proline
    fun string(): String iso^ => "Proline".clone()
    fun code(): String => "P"
    fun code_long(): String => "Pro"

primitive Glutamine
    fun string(): String iso^ => "Glutamine".clone()
    fun code(): String => "Q"
    fun code_long(): String => "Gln"

primitive Arginine
    fun string(): String iso^ => "Arginine".clone()
    fun code(): String => "R"
    fun code_long(): String => "Arg"

primitive Serine
    fun string(): String iso^ => "Serine".clone()
    fun code(): String => "S"
    fun code_long(): String => "Ser"

primitive Threonine
    fun string(): String iso^ => "Threonine".clone()
    fun code(): String => "T"
    fun code_long(): String => "Thr"

primitive Valine
    fun string(): String iso^ => "Valine".clone()
    fun code(): String => "V"
    fun code_long(): String => "Val"

primitive Tryptophan
    fun string(): String iso^ => "Tryptophan".clone()
    fun code(): String => "W"
    fun code_long(): String => "Trp"

primitive Tyrosine
    fun string(): String iso^ => "Tyrosined".clone()
    fun code(): String => "Y"
    fun code_long(): String => "Tyr"
