require 'json'
require 'pry-byebug'

def process(name, j)
  if j.kind_of?(Array)
    return "[#{process(name, j.first)}]"
  elsif j.kind_of?(Hash)
    members = {}
    j.each do |k, v|
      members[k] = process(k, v)
    end
    $structs << [name, members]
    return name
  elsif j.kind_of?(Float)
    return "Double"
  elsif j.kind_of?(Integer)
    return "Int"
  elsif j.kind_of?(String)
    return "String"
  elsif j == true || j == false
    return "Bool"
  end
end

def string(structs)
  str = ""
  $structs.reverse.each do |name, members|
    str << "struct #{name} {"
    members.each do |k, v|
      str << "    let `#{k}`: #{v}\n"
    end
    str << "}\n\n"
  end
  str
end

files = `ls /Users/michaeleisel/Documents/Projects/simdjson/jsonexamples/*.json`.split("\n")
files.each do |f|
  name = File.basename(f)[0..-6]
  $structs = []
  process(name, JSON.parse(IO.read(f)))
  str = string($structs)
  # binding.pry
  IO.write(name + ".swift", str)
end


