type Nucleotide is (DNAType | RNAType)

trait NucleotideAlphabet[T: Letter] is Alphabet[T]
    new val create()
    fun val parse(letter: String): (T | None)
    fun val complement(nucleotide: T): T

type RNAType is (Adenine | Cytosine | Guanine | Uracil)
class RNA is NucleotideAlphabet[RNAType]
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
class DNA is NucleotideAlphabet[DNAType]
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
class IUPAC is NucleotideAlphabet[IUPACType]
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
        | "P" => Purine
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
        | Pyrimidine => Pyrimidine
        | Keto => Amino
        | V => B
        | H => D
        | D => H
        | B => V
        | N => N
        end

primitive Adenine
    fun string(): String val => "Adenine"
    fun oneletter(): String val => "A"

primitive Guanine
    fun string(): String val => "Guanine"
    fun oneletter(): String val => "G"

primitive Thymine
    fun string(): String val => "Thymine"
    fun oneletter(): String val => "T"

primitive Cytosine
    fun string(): String val => "Cytosine"
    fun oneletter(): String val => "C"

primitive Uracil
    fun string(): String val =>  "Uracil"
    fun oneletter(): String val => "U"

// Start IUPAC nucleotide codes
// See: https://www.bioinformatics.org/sms/iupac.html
primitive Amino // (Adenine | Cytosine)
    fun string(): String val => "Amino"
    fun oneletter(): String val => "M"

primitive Purine // (Adenine | Guanine)
    fun string(): String val => "Purine"
    fun oneletter(): String val => "R"

primitive Weak // (Adenine | Thymine)
    fun string(): String val => "Weak"
    fun oneletter(): String val => "W"

primitive Strong // (Adenine | Guanine)
    fun string(): String val => "Strong"
    fun oneletter(): String val => "S"

primitive Pyrimidine // (Cytosine | Thymine)
    fun string(): String val => "Pyrimidine"
    fun oneletter(): String val => "Y"

primitive Keto // (Guanine | Thymine)
    fun string(): String val => "Keto"
    fun oneletter(): String val => "K"

primitive V // (Adenine | Cytosine | Thymine)
    fun string(): String val => "V"
    fun oneletter(): String val => "V"

primitive H // (Adenine | Cytosine | Thymine)
    fun string(): String val => "H"
    fun oneletter(): String val => "H"

primitive D // (Adenine | Cytosine | Thymine)
    fun string(): String val => "D"
    fun oneletter(): String val => "D"

primitive B // (Cytosine | Guanine | Thymine)
    fun string(): String val => "B"
    fun oneletter(): String val => "B"

primitive N // (Adenine | Guanine | Cytosine | Thymine)
    fun string(): String val => "N"
    fun oneletter(): String val => "N"
