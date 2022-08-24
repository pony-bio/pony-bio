use "collections"

class RNA
  let _seq: String

  new create(seq: String) =>
    _seq = seq

  fun count(): Map[Letter, USize] =>
    let map: Map[Letter, USize] = Map[Letter, USize].create(4)

    for c in _seq.values() do
      map.upsert(Letter(c), 1, {(current, provided) => current + provided })
    end

    map

  fun string(): String iso^ =>
    _seq.clone()