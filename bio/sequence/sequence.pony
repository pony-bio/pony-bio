use "../alphabet"
use "maybe"

trait Sequence[L: Letter val, A: Alphabet[L] val] is Stringable
  new create(seq': Array[L] box)

  fun length(): USize

  fun apply(pos: USize): Maybe[L]

  fun range(from: USize = 0, to: USize = USize(-1)): RangeIterator[L, A] =>
    RangeIterator[L, A](this, from, if to == USize(-1) then this.length() else to end)

  fun tag alphabet(): Alphabet[L] => A

  fun string(): String iso^ =>
    let len: USize val = this.length()
    let res = recover iso String(len) end
    for letter in this.range(0, len) do
      res.append(letter.string())
    end
    res

  fun reverse(): Sequence[L, A]

  fun ref reverse_in_place()

class RangeIterator[L: Letter val, A: Alphabet[L] val] is Iterator[L]
  let _seq: Sequence[L, A] box
  let _to: USize
  var _pos: USize

  new ref create(seq: Sequence[L, A] box, from: USize, to: USize) =>
    _seq = seq
    _pos = from
    _to = to

  fun has_next(): Bool =>
    (_pos < _to) and (_pos < _seq.length())

  fun ref next(): L? =>
    Opt.force[L](_seq.apply(_pos = _pos + 1))?

  fun ref collect(): Array[L] ref =>
    let res = Array[L](_to - _pos)
    while has_next() do
      try
        res.push(next()?)
      else
        break
      end
    end
    res
