use "itertools"
use "pony_test"
use "pony_check"

actor \nodoc\ Main is TestList
  new create(env: Env) => PonyTest(env, this)

  new make() => None

  fun tag tests(test: PonyTest) =>
    test(_TestCount)
    test(_TestTranscribe)
    test(Property1UnitTest[DNA](_PropertyDnaRevComp))
    test(_TestDnaGc)

class iso _TestCount is UnitTest
  fun name(): String => "DNA.count"

  fun apply(h: TestHelper) =>
    let seq: String = "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"

    let counts: NucleotideCount = DNA(seq).count()

    let got = recover String(12) end
    got.append(counts.adenine().string())
    got.append(" ")
    got.append(counts.cytosine().string())
    got.append(" ")
    got.append(counts.guanine().string())
    got.append(" ")
    got.append(counts.thymine().string())

    let expect: String = "20 12 17 21"

    h.assert_eq[String](consume got, expect)

class iso _TestTranscribe is UnitTest
  fun name(): String => "Transcribe"

  fun apply(h: TestHelper) =>
    let got: RNA = Transcribe(DNA("GATGGAACTTGACTACGTAAATT"))
    let expect: RNA = RNA("GAUGGAACUUGACUACGUAAAUU")

    h.assert_eq[RNA](got, expect)

class _PropertyDnaRevComp is Property1[DNA]
  fun name(): String => "Prop: DNA = DNA.revcomp().revcomp()"

  fun gen(): Generator[DNA] =>
    Generator[DNA](
      object is GenObj[DNA]
        fun generate(rnd: Randomness): GenerateResult[DNA] =>
          let size = rnd.usize(0, 100)
          let gen = Generators.one_of[U8]("ATGC")
          let gen_iter = Iter[U8^](gen.value_iter(rnd)).take(size)
          let arr: Array[U8] iso = recover Array[U8](size) end
          for b in gen_iter do
            arr.push(b)
          end
          DNA(String.from_iso_array(consume arr))
    end)

  fun property(arg1: DNA, ph: PropertyHelper) =>
    ph.assert_eq[DNA](arg1, arg1.revcomp().revcomp())

class iso _TestDnaGc is UnitTest
  fun name(): String => "DNA.gc()"

  fun apply(h: TestHelper) =>
    let dna: DNA = DNA("CCACCCTCGTGGTATGGCTAGGCATTCAGGAACCGGAGAACGCTTCAGACCAGCCCGGACTGGGAACCTGCGGGCAGTAGGTGGAAT")
    let got: F64 = dna.gc()
    let expect: F64 = 60.9195
    let rel: F64 = 0.0001
    let diff = if got < expect then expect - got else got - expect end
    
    h.assert_true(diff < rel)