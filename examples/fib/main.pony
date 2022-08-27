use "cli"
use "../../bio/common"

actor Main
  new create(env: Env) =>
    let cs =
      try
        CommandSpec.leaf("count", "Transcribe a provided DNA sequence to RNA", [], [
          ArgSpec.u64("n", "The number of generations")
          ArgSpec.u64("k", "The number of new generators per generation")
        ])? .> add_help()?
      else
        env.exitcode(-1)  // some kind of coding error
        return
      end

    let cmd =
      match CommandParser(cs).parse(env.args, env.vars)
      | let c: Command => c
      | let ch: CommandHelp =>
          ch.print_help(env.out)
          env.exitcode(0)
          return
      | let se: SyntaxError =>
          env.out.print(se.string())
          env.exitcode(1)
          return
      end

    let n = cmd.arg("n").u64().usize()
    let k = cmd.arg("k").u64().usize()
    let count: USize = Fib(n, k)

    env.out.print(count.string())
