// TODO: Make appropriate trait other than Stringable
// that has shortcode(), fullname(), etc
trait val Alphabet[A: Stringable] is Stringable
  fun letters(): A
