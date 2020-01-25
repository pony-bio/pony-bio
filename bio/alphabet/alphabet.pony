// TODO: Make appropriate trait other than Stringable
// that has shortcode(), fullname(), etc

interface val Letter
  fun string(): String val
  fun oneletter(): String val

trait val Alphabet[A: Letter] is Stringable
  fun letters(): Array[A] val
