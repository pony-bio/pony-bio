use "pony_test"

actor \nodoc\ Main is TestList
  new create(env: Env) => PonyTest(env, this)

  new make() => None

  fun tag tests(test: PonyTest) =>
    test(_TestFib)

class iso _TestFib is UnitTest
  fun name(): String => "Fib"

  fun apply(h: TestHelper) =>
    let n: USize = 5
    let k: USize = 3

    let got: USize = Fib(n, k)
    let expect: USize = 19

    h.assert_eq[USize](consume got, expect)
