interface val Letter is Stringable
    fun oneletter(): String val

trait val Alphabet[L: Letter val] is Stringable
    new val create()
    fun contains(letter: L): Bool =>
        for l in this.letters().values() do
            if letter is l then 
                return true
            end
        end
        false
    fun letters(): Array[L] val
    fun parse(letter: String): (L | None)

interface val Complement[L: Letter val]
    fun complement(letter: L): L => letter
