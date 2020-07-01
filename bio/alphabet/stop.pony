use "maybe"

primitive Stop
    fun string(): String iso^ => "Stop".clone()
    fun code(): String => "*"
    fun code_long(): String => "Ter"  // Terminator

class Stoppable[T: Letter val, U: Alphabet[T] val] is Alphabet[(T | Stop)]
    """
    Extends the alphabet `U` with `Stop`
    """
    fun letters(): Array[(T | Stop)] val =>
        recover val
            let l = U.letters()
            let res = Array[(T | Stop)](l.size() + 1)
            res.append([as (T | Stop): Stop])
            res.append(l)
            res
        end

    fun parse(letter: String): Maybe[(T | Stop)] =>
        match letter
        | "*" => Stop
        else U.parse(letter)
        end