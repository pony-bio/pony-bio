type Nucleotide is (DNAType | RNAType)

type RNAType is (Adenine | Cytosine | Guanine | Uracil)
primitive RNA is ComplementAlphabet[RNAType]
    fun letters(): Array[RNAType] val => [Adenine; Cytosine; Guanine; Uracil]
    fun string(): String iso^ => "ACGU".clone()

    fun parse(letter: String): (RNAType | None) =>
        match letter
        | "A" => Adenine
        | "C" => Cytosine
        | "G" => Guanine
        | "U" => Uracil
        end

    fun complement(nucleotide: RNAType): RNAType =>
        match nucleotide
        | Adenine => Uracil
        | Cytosine => Guanine
        | Guanine => Cytosine
        | Uracil => Adenine
        end

type DNAType is (Adenine | Cytosine | Guanine | Thymine)
primitive DNA is ComplementAlphabet[DNAType]
    fun letters(): Array[DNAType] val => [Adenine; Cytosine; Guanine; Thymine]
    fun string(): String iso^ => "ACGT".clone()

    fun parse(letter: String): (DNAType | None) =>
        match letter
        | "A" => Adenine
        | "C" => Cytosine
        | "G" => Guanine
        | "T" => Thymine
        end

    fun complement(nucleotide: DNAType): DNAType =>
        match nucleotide
        | Adenine => Thymine
        | Cytosine => Guanine
        | Guanine => Cytosine
        | Thymine => Adenine
        end

type IUPACType is (Adenine | Cytosine | Guanine | Thymine
    | Amino | Purine | Weak | Strong | Pyrimidine | Keto
    | V | H | D | B | N)
primitive IUPAC is ComplementAlphabet[IUPACType]
    fun letters(): Array[IUPACType] val =>
        [
            Adenine; Cytosine; Guanine; Thymine
            Amino; Purine; Weak; Strong; Pyrimidine; Keto
            V; H; D; B; N
        ]
    fun string(): String iso^ => "AGCTMPWSYKVHDBN".clone()

    fun parse(letter: String): (IUPACType | None) =>
        match letter
        | "A" => Adenine
        | "C" => Cytosine
        | "G" => Guanine
        | "T" => Thymine
        | "M" => Amino
        | "R" => Purine
        | "W" => Weak
        | "S" => Strong
        | "Y" => Pyrimidine
        | "K" => Keto
        | "V" => V
        | "H" => H
        | "D" => D
        | "B" => B
        | "N" => N
        else None
        end

    fun complement(nucleotide: IUPACType): IUPACType =>
        match nucleotide
        | Adenine => Thymine
        | Cytosine => Guanine
        | Guanine => Cytosine
        | Thymine => Adenine
        | Amino => Keto
        | Purine => Pyrimidine
        // Note: both Weak and Strong are self-complementing
        | Weak => Weak
        | Strong => Strong
        | Pyrimidine => Purine
        | Keto => Amino
        | V => B
        | H => D
        | D => H
        | B => V
        | N => N
        end

primitive Adenine
    fun string(): String => "Adenine"
    fun oneletter(): String => "A"

primitive Guanine
    fun string(): String => "Guanine"
    fun oneletter(): String => "G"

primitive Thymine
    fun string(): String => "Thymine"
    fun oneletter(): String => "T"

primitive Cytosine
    fun string(): String => "Cytosine"
    fun oneletter(): String => "C"

primitive Uracil
    fun string(): String =>  "Uracil"
    fun oneletter(): String => "U"

// Start IUPAC nucleotide codes
// See: https://www.bioinformatics.org/sms/iupac.html
primitive Amino // (Adenine | Cytosine)
    fun string(): String => "Amino"
    fun oneletter(): String => "M"

primitive Purine // (Adenine | Guanine)
    fun string(): String => "Purine"
    fun oneletter(): String => "R"

primitive Weak // (Adenine | Thymine)
    fun string(): String => "Weak"
    fun oneletter(): String => "W"

primitive Strong // (Adenine | Guanine)
    fun string(): String => "Strong"
    fun oneletter(): String => "S"

primitive Pyrimidine // (Cytosine | Thymine)
    fun string(): String => "Pyrimidine"
    fun oneletter(): String => "Y"

primitive Keto // (Guanine | Thymine)
    fun string(): String => "Keto"
    fun oneletter(): String => "K"

primitive V // (Adenine | Cytosine | Thymine)
    fun string(): String => "V"
    fun oneletter(): String => "V"

primitive H // (Adenine | Cytosine | Thymine)
    fun string(): String => "H"
    fun oneletter(): String => "H"

primitive D // (Adenine | Cytosine | Thymine)
    fun string(): String => "D"
    fun oneletter(): String => "D"

primitive B // (Cytosine | Guanine | Thymine)
    fun string(): String => "B"
    fun oneletter(): String => "B"

primitive N // (Adenine | Guanine | Cytosine | Thymine)
    fun string(): String => "N"
    fun oneletter(): String => "N"
