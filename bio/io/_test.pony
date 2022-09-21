use "pony_test"
use "files"

actor \nodoc\ Main is TestList
  new create(env: Env) => PonyTest(env, this)

  new make() => None

  fun tag tests(test: PonyTest) =>
    test(_TestFasta)

class iso _TestFasta is UnitTest
  fun name(): String => "Fasta"

  fun apply(h: TestHelper) =>
    let fp: FilePath = FilePath(FileAuth(h.env.root), "testdata/input.fa")
    h.assert_true(fp.exists(), fp.path + " does not exist")
    
    let fa = OpenFasta.multi(fp)
    h.assert_true(fa.size() == 3, "Expected 3, size was " + fa.size().string())
