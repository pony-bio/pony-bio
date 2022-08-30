use "collections"

class NucleotideCount
  var _map: Map[Letter, USize] = Map[Letter, USize].create(4)

  fun ref increment(l: Letter) =>
    _map.upsert(l, 1, {(current, provided) => current + provided })

  fun adenine(): USize =>
    _map.get_or_else('A', 0)

  fun thymine(): USize =>
    _map.get_or_else('T', 0)
  
  fun guanine(): USize =>
    _map.get_or_else('G', 0)

  fun cytosine(): USize =>
    _map.get_or_else('C', 0)