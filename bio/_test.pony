use "pony_test"
use sequence = "sequence"

actor \nodoc\ Main is TestList
  new create(env: Env) => PonyTest(env, this)

  new make() => None

  fun tag tests(test: PonyTest) =>
    sequence.Main.make().tests(test)