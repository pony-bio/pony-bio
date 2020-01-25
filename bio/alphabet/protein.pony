class Protein is Alphabet[AminoAcid]
    fun tag letters(): Array[AminoAcid] val =>
        [
            Alanine       ; Cysteine  ; AsparticAcid ; GlutamicAcid
            Phenylalanine ; Glycine   ; Histidine    ; Isoleucine
            Lysine        ; Leucine   ; Methionine   ; Asparagine
            Proline       ; Glutamine ; Arginine     ; Serine
            Threonine     ; Valine    ; Tryptophan   ; Tyrosine
        ]
    fun tag string(): String iso^ => "ACDEFGHIKLMNPQRSTVWXY".clone()

type AminoAcid is (Alanine       | Cysteine  | AsparticAcid | GlutamicAcid |
                   Phenylalanine | Glycine   | Histidine    | Isoleucine   |
                   Lysine        | Leucine   | Methionine   | Asparagine   |
                   Proline       | Glutamine | Arginine     | Serine       |
                   Threonine     | Valine    | Tryptophan   | Tyrosine)

primitive Alanine
    fun box string(): String val => "Alanine"
    fun box oneletter(): String val => "A"
    fun box threeletter(): String val => "Ala"

primitive Cysteine
    fun box string(): String val => "Cysteine"
    fun box oneletter(): String val => "C"
    fun box threeletter(): String val => "Cys"

primitive AsparticAcid
    fun box string(): String val => "Aspartic Acid"
    fun box oneletter(): String val => "D"
    fun box threeletter(): String val => "Asp"

primitive GlutamicAcid
    fun box string(): String val => "Glutamic Acid"
    fun box oneletter(): String val => "E"
    fun box threeletter(): String val => "Glu"

primitive Phenylalanine
    fun box string(): String val => "Phenylalanine"
    fun box oneletter(): String val => "F"
    fun box threeletter(): String val => "Phe"

primitive Glycine
    fun box string(): String val => "Glycine"
    fun box oneletter(): String val => "G"
    fun box threeletter(): String val => "Gly"

primitive Histidine
    fun box string(): String val => "Histidine"
    fun box oneletter(): String val => "H"
    fun box threeletter(): String val => "His"

primitive Isoleucine
    fun box string(): String val => "Isoleucine"
    fun box oneletter(): String val => "I"
    fun box threeletter(): String val => "Ile"

primitive Lysine
    fun box string(): String val => "Lysine"
    fun box oneletter(): String val => "K"
    fun box threeletter(): String val => "Lys"

primitive Leucine
    fun box string(): String val => "Leucine"
    fun box oneletter(): String val => "L"
    fun box threeletter(): String val => "Leu"

primitive Methionine
    fun box string(): String val => "Methionine"
    fun box oneletter(): String val => "M"
    fun box threeletter(): String val => "Met"

primitive Asparagine
    fun box string(): String val => "Asparagine"
    fun box oneletter(): String val => "N"
    fun box threeletter(): String val => "Asn"

primitive Proline
    fun box string(): String val => "Proline"
    fun box oneletter(): String val => "P"
    fun box threeletter(): String val => "Pro"

primitive Glutamine
    fun box string(): String val => "Glutamine"
    fun box oneletter(): String val => "Q"
    fun box threeletter(): String val => "Gln"

primitive Arginine
    fun box string(): String val => "Arginine"
    fun box oneletter(): String val => "R"
    fun box threeletter(): String val => "Arg"

primitive Serine
    fun box string(): String val => "Serine"
    fun box oneletter(): String val => "S"
    fun box threeletter(): String val => "Ser"

primitive Threonine
    fun box string(): String val => "Threonine"
    fun box oneletter(): String val => "T"
    fun box threeletter(): String val => "Thr"

primitive Valine
    fun box string(): String val => "Valine"
    fun box oneletter(): String val => "V"
    fun box threeletter(): String val => "Val"

primitive Tryptophan
    fun box string(): String val => "Tryptophan"
    fun box oneletter(): String val => "W"
    fun box threeletter(): String val => "Trp"

primitive Tyrosine
    fun box string(): String val => "Tyrosined"
    fun box oneletter(): String val => "Y"
    fun box threeletter(): String val => "Tyr"
