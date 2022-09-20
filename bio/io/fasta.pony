use "files"

class val Fasta 
  let header: String
  let body: String

  new val create(header': String, body': String) =>
    header = header'
    body = body'

primitive OpenFasta
  fun multi(fp: FilePath): Array[Fasta] =>
    var records = Array[Fasta](8)
    try 
      let fh = OpenFile(fp) as File

      var header: String = ""
      var body: String = ""

      for line in fh.lines() do
        if line.at(">") then
          if header != "" then
            records.push(Fasta(header, body))
            header = ""
            body = ""
          end
          header = line.substring(1, line.size().isize())
        else
          body = body + consume line
        end
      end
      records.push(Fasta(header, body))
    end
    records