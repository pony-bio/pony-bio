primitive Transcribe
  fun apply(dna: DNA): RNA =>
    let seq: String ref = dna.string()

    seq.replace("T", "U")

    RNA(seq.clone())