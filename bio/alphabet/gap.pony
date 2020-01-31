type GapType is (Dash | Dot)

class Gapped[T: Letter val, U: Alphabet[T] val] is Alphabet[(T | GapType)]
    fun letters(): Array[(T | GapType)] val =>
        recover val
            let l = U.letters()
            let res = Array[(T | GapType)](l.size() + 2)
            res.append([as (T | GapType): Dot; Dash])
            res.append(l)
            res
        end

    fun string(): String iso^ =>
        recover iso
            let a = recover iso U.string() end
            let res = String(a.size() + 2)
            res.append(consume a)
            res.append(".-")
            res
        end

    fun parse(letter: String): (T | GapType | None) =>
        match letter
        | "-" => Dash
        | "." => Dot
        else U.parse(letter)
        end

class ComplementGapped[T: Letter val, U: ComplementAlphabet[T] val] is ComplementAlphabet[(T | GapType)]
    fun letters(): Array[(T | GapType)] val =>
        recover val
            let l = U.letters()
            let res = Array[(T | GapType)](l.size() + 2)
            res.append([as (T | GapType): Dot; Dash])
            res.append(l)
            res
        end

    fun string(): String iso^ =>
        recover iso
            let a = recover iso U.string() end
            let res = String(a.size() + 2)
            res.append(consume a)
            res.append(".-")
            res
        end

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
