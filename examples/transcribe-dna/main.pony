use "cli"
use "../../bio/sequence"

actor Main
  new create(env: Env) =>
    let cs =
      try
        CommandSpec.leaf("count", "Transcribe a provided DNA sequence to RNA", [], [
          ArgSpec.string("sequence", "The sequence to count nucleotides within")
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

    let seq = cmd.arg("sequence").string()
    let rna = Transcribe(DNA(seq))

    env.out.print(rna.string())
