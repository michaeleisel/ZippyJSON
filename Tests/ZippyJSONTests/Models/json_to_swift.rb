require 'json'
require 'pry-byebug'

def find(j, name)
  # binding.pry
  if j.kind_of?(Array)
    return j.detect { |jj| find(jj, name) }
  elsif j.kind_of?(Hash)
    a = j.detect do |k, v|
      next v if k == name && v != nil#  && !v.kind_of?(Hash) && !v.kind_of?(Array)
      next find(v, name) if v.kind_of?(Hash) || v.kind_of?(Array)
      next nil
    end
    return a
  end
  nil
end

def process(orig, name, j)
  # binding.pry if name == "urls"
  if j.kind_of?(Array)
    return "[#{process(orig, name, j.first)}]"
  elsif j.kind_of?(Hash)
    members = {}
    j.each do |k, v|
      members[k] = process(orig, k, v)
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
  elsif j == nil
    match = find(orig, name)
    if match == nil
      puts "aborted for #{name}"
      return nil
    end
    return process(orig, name, match) + "?"
  end
end

def string(structs)
  str = ""
  $structs.reverse.each do |name, members|
    str << "struct #{name} {\n"
    members.each do |k, v|
      str << "    let `#{k}`: #{v}\n"
    end
    str << "}\n\n"
  end
  str
end

files = `ls *.json`.split("\n")
files.each do |f|
  next unless f.end_with?(".json")
  puts f
  name = File.basename(f)[0..-6]
  $structs = []
  orig = JSON.parse(IO.read(f))
  process(orig, name, orig)
  str = string($structs)
  # binding.pry
  IO.write(name + ".swift", str)
end
