use "pony_test"
use sequence = "sequence"
use common = "common"

actor \nodoc\ Main is TestList
  new create(env: Env) => PonyTest(env, this)

  new make() => None

  fun tag tests(test: PonyTest) =>
    sequence.Main.make().tests(test)
    common.Main.make().tests(test)
