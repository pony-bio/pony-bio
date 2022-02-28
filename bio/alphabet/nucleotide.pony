type Nucleotide is (DNALetters | RNALetters)

type RNALetters is (Adenine | Cytosine | Guanine | Uracil)
type GappedRNA is Gapped[RNALetters, RNA]
primitive RNA is (Alphabet[RNALetters] & Complement[RNALetters])
    fun letters(): Array[RNALetters] val => [Adenine; Cytosine; Guanine; Uracil]

    fun parse(letter: String): (RNALetters | None) =>
        match letter
        | "A" => Adenine
        | "C" => Cytosine
        | "G" => Guanine
        | "U" => Uracil
        else
          None
        end

    fun complement(nucleotide: RNALetters): (RNALetters| None) =>
        match nucleotide
        | Adenine => Uracil
        | Cytosine => Guanine
        | Guanine => Cytosine
        | Uracil => Adenine
        end

type DNALetters is (Adenine | Cytosine | Guanine | Thymine)
type GappedDNA is Gapped[DNALetters, DNA]
primitive DNA is (Alphabet[DNALetters] & Complement[DNALetters])
    fun letters(): Array[DNALetters] val => [Adenine; Cytosine; Guanine; Thymine]

    fun parse(letter: String): (DNALetters | None) =>
        match letter
        | "A" => Adenine
        | "C" => Cytosine
        | "G" => Guanine
        | "T" => Thymine
        end

    fun complement(nucleotide: DNALetters): (DNALetters | None) =>
        match nucleotide
        | Adenine => Thymine
        | Cytosine => Guanine
        | Guanine => Cytosine
        | Thymine => Adenine
        end

type IUPACLetters is (Adenine | Cytosine | Guanine | Thymine
    | Amino | Purine | Weak | Strong | Pyrimidine | Keto
    | V | H | D | B | N)
type GappedIUPAC is Gapped[IUPACLetters, IUPAC]
primitive IUPAC is (Alphabet[IUPACLetters] & Complement[IUPACLetters])
    fun letters(): Array[IUPACLetters] val =>
        [
            Adenine; Cytosine; Guanine; Thymine
            Amino; Purine; Weak; Strong; Pyrimidine; Keto
            V; H; D; B; N
        ]

    fun parse(letter: String): (IUPACLetters | None) =>
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

    fun complement(nucleotide: IUPACLetters): (IUPACLetters | None) =>
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
    fun code(): String => "A"

primitive Guanine
    fun string(): String iso^ => "Guanine".clone()
    fun code(): String => "G"

primitive Thymine
    fun string(): String iso^ => "Thymine".clone()
    fun code(): String => "T"

primitive Cytosine
    fun string(): String iso^ => "Cytosine".clone()
    fun code(): String => "C"

primitive Uracil
    fun string(): String iso^ =>  "Uracil".clone()
    fun code(): String => "U"

// Start IUPAC nucleotide codes
// See: https://www.bioinformatics.org/sms/iupac.html
primitive Amino // (Adenine | Cytosine)
    fun string(): String iso^ => "Amino".clone()
    fun code(): String => "M"

primitive Purine // (Adenine | Guanine)
    fun string(): String iso^ => "Purine".clone()
    fun code(): String => "R"

primitive Weak // (Adenine | Thymine)
    fun string(): String iso^ => "Weak".clone()
    fun code(): String => "W"

primitive Strong // (Adenine | Guanine)
    fun string(): String iso^ => "Strong".clone()
    fun code(): String => "S"

primitive Pyrimidine // (Cytosine | Thymine)
    fun string(): String iso^ => "Pyrimidine".clone()
    fun code(): String => "Y"

primitive Keto // (Guanine | Thymine)
    fun string(): String iso^ => "Keto".clone()
    fun code(): String => "K"

primitive V // (Adenine | Cytosine | Thymine)
    fun string(): String iso^ => "V".clone()
    fun code(): String => "V"

primitive H // (Adenine | Cytosine | Thymine)
    fun string(): String iso^ => "H".clone()
    fun code(): String => "H"

primitive D // (Adenine | Cytosine | Thymine)
    fun string(): String iso^ => "D".clone()
    fun code(): String => "D"

primitive B // (Cytosine | Guanine | Thymine)
    fun string(): String iso^ => "B".clone()
    fun code(): String => "B"

primitive N // (Adenine | Guanine | Cytosine | Thymine)
    fun string(): String iso^ => "N".clone()
    fun code(): String => "N"
