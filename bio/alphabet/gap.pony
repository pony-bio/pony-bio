type GapType is (Dash | Dot)

primitive Gapped[T: Letter val, U: NucleotideAlphabet[T] val] is NucleotideAlphabet[(T | GapType)]
    fun letters(): Array[(T | GapType)] val =>
        recover val
            let res = [as (T | GapType): Dash; Dot]
            res.concat(U.letters().values())
            res
        end
    fun string(): String iso^ => (U.string().clone() + "-.").clone()

    fun parse(letter: String): (T | GapType | None) =>
        match letter
        | "-" => Dash
        | "." => Dot
        else U.parse(letter)
        end

    fun complement(nucleotide: (T | GapType)): (T | GapType) =>
        match nucleotide
        | Dash => Dash
        | Dot => Dot
        | let x: T => U.complement(x)
        end

primitive Dash
    fun string(): String val => "-"
    fun oneletter(): String val => "-"

primitive Dot
    fun string(): String val => "."
    fun oneletter(): String val => "."
