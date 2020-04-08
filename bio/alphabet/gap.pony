use "maybe"

type GapType is (Dash | Dot)

class Gapped[T: Letter val, U: (Alphabet[T] val & Complement[T] val)] is (Alphabet[(T | GapType)] & Complement[(T | GapType)])
    """
    Extends the alphabet `U` with `Dash` and `Dot`.
    """
    fun letters(): Array[(T | GapType)] val =>
        recover val
            let l = U.letters()
            let res = Array[(T | GapType)](l.size() + 2)
            res.append([as (T | GapType): Dot; Dash])
            res.append(l)
            res
        end

    fun parse(letter: String): Maybe[(T | GapType)] =>
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
    fun string(): String iso^ => "-".clone()
    fun code(): String => "-"

primitive Dot
    fun string(): String iso^ => ".".clone()
    fun code(): String => "."
