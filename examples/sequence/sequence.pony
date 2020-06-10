// in your code this `use` statement would be:
// use "bio"
use "../../bio"
use "../../bio/alphabet"
use "../../bio/sequence"

actor Main
  new create(env: Env) =>
    let sequence = DNASequence([as DNALetters: Adenine; Cytosine; Guanine])
    env.out.print("Here is the sequence `ACG`: ")

    for letter in sequence.range(0, 3) do
      env.out.print(letter.string())
    end

    env.out.print("Here is the same sequence, reversed: ")

    for letter in DNASequence(sequence.range(0, 3).collect()).reverse().range() do
      env.out.print(letter.string())
    end
