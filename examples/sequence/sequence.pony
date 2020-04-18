// in your code this `use` statement would be:
// use "bio"
use "../../bio"
use "../../bio/alphabet"
use "../../bio/sequence"

actor Main
  new create(env: Env) =>
    let sequence = DNASequence([as DNAType: Adenine; Cytosine; Adenine])
    for letter in sequence.range(1, 3) do
      env.out.print(letter.string())
    end
