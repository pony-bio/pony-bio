use "maybe"

interface val Letter is Stringable
    fun code(): String val

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
    fun parse(letter: String): Maybe[L]
    fun string(): String iso^ => 
        recover iso
            let arr = this.letters()
            let str = String(arr.size())
            for l in arr.values() do
                str.append(l.code())
            end
            str
        end

interface val Complement[L: Letter val]
    fun complement(letter: L): Maybe[L] => None
