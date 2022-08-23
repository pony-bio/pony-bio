use "cli"
use "../../bio/alphabet"

actor Main
  new create(env: Env) =>
    let cs =
      try
        CommandSpec.leaf("count", "Count the nucleotides. Order: AGCT", [], [
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
    let counts = DNA(seq).count()

    let output = recover String(12) end
    output.append(counts.get_or_else('A', 0).string())
    output.append(" ")
    output.append(counts.get_or_else('C', 0).string())
    output.append(" ")
    output.append(counts.get_or_else('G', 0).string())
    output.append(" ")
    output.append(counts.get_or_else('T', 0).string())

    env.out.print(consume output)
