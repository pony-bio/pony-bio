use "collections"

primitive Fib
  """
  Compute the total number of elements after `n` iterations of each element producing `k` new elements.
  """
  
  fun apply(n: USize, k: USize): USize =>
    var a: USize = 1
    var b: USize = 1

    for i in Range(2, n) do
      a = b = (k*a) + b
    end

    b