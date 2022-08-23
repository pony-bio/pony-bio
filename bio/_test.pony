use "pony_test"
use alphabet = "alphabet"

actor \nodoc\ Main is TestList
  new create(env: Env) => PonyTest(env, this)

  new make() => None

  fun tag tests(test: PonyTest) =>
    alphabet.Main.make().tests(test)