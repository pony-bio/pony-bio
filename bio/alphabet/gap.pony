type Gap is (Dash | Dot)

class Gapped[T: Letter val, U: (Alphabet[T] val & Complement[T] val)] is (Alphabet[(T | Gap)] & Complement[(T | Gap)])
    """
    Extends the alphabet `U` with `Dash` and `Dot`.
    """
    fun letters(): Array[(T | Gap)] val =>
        recover val
            let l = U.letters()
            let res = Array[(T | Gap)](l.size() + 2)
            res.append([as (T | Gap): Dot; Dash])
            res.append(l)
            res
        end

    fun parse(letter: String): (T | Gap | None) =>
        match letter
        | "-" => Dash
        | "." => Dot
        else U.parse(letter)
        end

    fun complement(nucleotide: (T | Gap)): (T | Gap | None) =>
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
