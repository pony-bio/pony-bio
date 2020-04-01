type Nucleotide is (DNAType | RNAType)

type RNAType is (Adenine | Cytosine | Guanine | Uracil)
type GappedRNA is Gapped[RNAType, RNA]
primitive RNA is (Alphabet[RNAType] & Complement[RNAType])
    fun letters(): Array[RNAType] val => [Adenine; Cytosine; Guanine; Uracil]

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
type GappedDNA is Gapped[DNAType, DNA]
primitive DNA is (Alphabet[DNAType] & Complement[DNAType])
    fun letters(): Array[DNAType] val => [Adenine; Cytosine; Guanine; Thymine]

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
type GappedIUPAC is Gapped[IUPACType, IUPAC]
primitive IUPAC is (Alphabet[IUPACType] & Complement[IUPACType])
    fun letters(): Array[IUPACType] val =>
        [
            Adenine; Cytosine; Guanine; Thymine
            Amino; Purine; Weak; Strong; Pyrimidine; Keto
            V; H; D; B; N
        ]

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
    fun string(): String iso^ => "Adenine".clone()
    fun oneletter(): String => "A"

primitive Guanine
    fun string(): String iso^ => "Guanine".clone()
    fun oneletter(): String => "G"

primitive Thymine
    fun string(): String iso^ => "Thymine".clone()
    fun oneletter(): String => "T"

primitive Cytosine
    fun string(): String iso^ => "Cytosine".clone()
    fun oneletter(): String => "C"

primitive Uracil
    fun string(): String iso^ =>  "Uracil".clone()
    fun oneletter(): String => "U"

// Start IUPAC nucleotide codes
// See: https://www.bioinformatics.org/sms/iupac.html
primitive Amino // (Adenine | Cytosine)
    fun string(): String iso^ => "Amino".clone()
    fun oneletter(): String => "M"

primitive Purine // (Adenine | Guanine)
    fun string(): String iso^ => "Purine".clone()
    fun oneletter(): String => "R"

primitive Weak // (Adenine | Thymine)
    fun string(): String iso^ => "Weak".clone()
    fun oneletter(): String => "W"

primitive Strong // (Adenine | Guanine)
    fun string(): String iso^ => "Strong".clone()
    fun oneletter(): String => "S"

primitive Pyrimidine // (Cytosine | Thymine)
    fun string(): String iso^ => "Pyrimidine".clone()
    fun oneletter(): String => "Y"

primitive Keto // (Guanine | Thymine)
    fun string(): String iso^ => "Keto".clone()
    fun oneletter(): String => "K"

primitive V // (Adenine | Cytosine | Thymine)
    fun string(): String iso^ => "V".clone()
    fun oneletter(): String => "V"

primitive H // (Adenine | Cytosine | Thymine)
    fun string(): String iso^ => "H".clone()
    fun oneletter(): String => "H"

primitive D // (Adenine | Cytosine | Thymine)
    fun string(): String iso^ => "D".clone()
    fun oneletter(): String => "D"

primitive B // (Cytosine | Guanine | Thymine)
    fun string(): String iso^ => "B".clone()
    fun oneletter(): String => "B"

primitive N // (Adenine | Guanine | Cytosine | Thymine)
    fun string(): String iso^ => "N".clone()
    fun oneletter(): String => "N"
