use "pony_test"

actor \nodoc\ Main is TestList
  new create(env: Env) => PonyTest(env, this)

  new make() => None

  fun tag tests(test: PonyTest) =>
    test(_TestCount)

class iso _TestCount is UnitTest
  fun name():String => "DNA.count"

  fun apply(h: TestHelper) =>
    let seq: String = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"

    let counts = DNA(seq).count()

    let got = recover String(12) end
    got.append(counts.get_or_else('A', 0).string())
    got.append(" ")
    got.append(counts.get_or_else('C', 0).string())
    got.append(" ")
    got.append(counts.get_or_else('G', 0).string())
    got.append(" ")
    got.append(counts.get_or_else('T', 0).string())

    let expect: String = "20 12 17 21"

    h.assert_eq[String](consume got, expect)