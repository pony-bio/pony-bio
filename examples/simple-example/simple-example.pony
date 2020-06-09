// in your code this `use` statement would be:
// use "bio"
use "../../bio"
use "../../bio/alphabet"

actor Main
  new create(env: Env) =>
    try
      let a = DNA.parse("A") as DNALetters
      let c = Cytosine
      let g = GappedDNA.parse("G") as DNALetters
      let t = Thymine
      env.out.print("These are the DNA nucleotides: " + DNA.string())
      env.out.print("Their names being, respectively:")
      env.out.print("\n".join(DNA.letters().values()))
    else
      env.err.print("Woops, failed to parse something!")
    end
