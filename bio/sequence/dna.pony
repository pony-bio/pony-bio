use "collections"

class DNA is (Equatable[DNA box] & Stringable)
  let _seq: String box

  new create(seq: String box) =>
    _seq = seq

  fun count(): Map[Letter, USize] =>
    let map: Map[Letter, USize] = Map[Letter, USize].create(4)

    for c in _seq.values() do
      map.upsert(Letter(c), 1, {(current, provided) => current + provided })
    end

    map

  fun revcomp(): DNA =>
    let revseq: String ref = _seq.clone().reverse()

    for i in Range(0, revseq.size()) do
      try
        match revseq(i)?
        | 'A' => revseq.update(i, 'T') ?
        | 'T' => revseq.update(i, 'A') ?
        | 'G' => revseq.update(i, 'C') ?
        | 'C' => revseq.update(i, 'G') ?
        end
      end
    end
    DNA(revseq)

  fun string(): String iso^ =>
    _seq.clone()

  fun eq(that: DNA box): Bool val =>
    this._seq == that._seq

  fun ne(that: DNA box): Bool val =>
    this._seq != that._seq