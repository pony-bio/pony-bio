// TODO: Make appropriate trait other than Stringable
// that has shortcode(), fullname(), etc

interface val Letter is Stringable
    fun oneletter(): String val

trait val Alphabet[L: Letter val] is Stringable
    new val create()
    fun letters(): Array[L] val
    fun parse(letter: String): (L | None)

trait val ComplementAlphabet[L: Letter val] is Alphabet[L]
    fun complement(nucleotide: L): L
