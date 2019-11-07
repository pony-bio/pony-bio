type Nucleotide is (DNA | RNA)

type RNA is Alphabet[(Cytosine | Guanine | Thymine | Uracil)]
type DNA is Alphabet[(Adenine | Cytosine | Guanine | Thymine)]

primitive Adenine
    fun string(): String val => "Adenine"
    
    // complement is Thymine in DNA and Uracil in RNA
    fun complement(): (Thymine | Uracil) => (Thymine | Uracil)

primitive Guanine
    fun string(): String val => "Guanine"
    fun complement(): Cytosine => Cytosine

primitive Thymine
    fun string(): String val => "Thymine"
    fun complement(): Adenine => Adenine

primitive Cytosine
    fun string(): String val => "Cytosine"
    fun complement(): Guanine => Guanine

primitive Uracil
    fun string(): String val =>  "Uracil"
    fun complement(): Adenine => Adenine

// Start IUPAC nucleotide codes
// See: https://www.bioinformatics.org/sms/iupac.html
type Amino is (Adenine | Cytosine)
    fun singleletter(): String val => "M"
    fun complement(): Keto => Keto

type Purine is (Adenine | Guanine)
    fun singleletter(): String val => "R"
    fun complement(): Pyrimidine => Pyrimidine

type Weak is (Adenine | Thymine)
    fun singleletter(): String val => "W"

    // Note: Weak is self-complementing
    fun complement(): Weak => Weak

type Strong is (Adenine | Guanine)
    fun singleletter(): String val => "S"

    // Note: Strong is self-complementing
    fun complement(): Strong => Strong

type Pyrimidine is (Cytosine | Thymine)
    fun singleletter(): String val => "Y"
    fun complement(): Purine => Purine

type Keto is (Guanine | Thymine)
    fun singleletter(): String val => "K"
    fun complement(): Amino => Amino

type V is (Adenine | Cytosine | Thymine)
    fun singleletter(): String val => "V"
    fun complement(): B => B

type H is (Adenine | Cytosine | Thymine)
    fun singleletter(): String val => "H"
    fun complement(): D => D

type D is (Adenine | Cytosine | Thymine)
    fun singleletter(): String val => "D"
    fun complement(): H => H

type B is (Cytosine | Guanine | Thymine)
    fun singleletter(): String val => "B"
    fun complement(): V => V

type N is (Adenine | Guanine | Cytosine | Thymine)
    fun singleletter(): String val => "N"
    fun complement(): N => N
