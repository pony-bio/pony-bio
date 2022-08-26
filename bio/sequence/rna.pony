use "collections"

class RNA is (Equatable[RNA box] & Stringable)
  let _seq: String box

  new create(seq: String box) =>
    _seq = seq

  fun count(): Map[Letter, USize] =>
    let map: Map[Letter, USize] = Map[Letter, USize].create(4)

    for c in _seq.values() do
      map.upsert(Letter(c), 1, {(current, provided) => current + provided })
    end

    map

  fun string(): String iso^ =>
    _seq.clone()

  fun eq(that: RNA box): Bool val =>
    this._seq == that._seq

  fun ne(that: RNA box): Bool val =>
    this._seq != that._seq