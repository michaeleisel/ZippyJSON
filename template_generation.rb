require 'erb'
# require 'pry-byebug'

$number_types = (["UInt", "Int"].product([8, 16, 32, 64].map(&:to_s))).map { |a, b| a + b }
$other_types = ["Bool", "String", "Double", "Float", "Int", "UInt"]
$extended_types = ["Date", "Data", "Decimal"]

inline = ""

def additional_args(type)
  args = {
    "Date" => "dateDecodingStrategy",
    "Data" => "dataDecodingStrategy",
  }[type]
  args ? "" : ", #{args}"
end

def c_type(type)
  if $number_types.include?(type)
    type.downcase + "_t"
  else
    type
  end
end

def convert(type)
  conversion = {
    "String" => "String(utf8String: result!)!"
  }[type]
  # binding.pry if type == "String"
  conversion || "result"
end

def throws(type)
  type == "T" ? "throws " : ""
end

def try(type)
  type == "T" ? "try " : ""
end

types = $number_types + $other_types
all_types = types + $extended_types
template = ERB.new(IO.read("template.swift"), 0, "<>").result
name_to_template = template.split("\n").chunk_while { |a, b| a.start_with?("//") == b.start_with?("//") }.each_slice(2).to_h
# binding.pry
def is_delimiter(line)
  line.match(/^\s*\/\/.*(Begin|End)$/)
end
code_file = "Sources/ZippyJSON/ZippyJSONDecoder.swift"
chunks = IO.read(code_file).split("\n").chunk_while do |a, b|
  is_delimiter(a) == is_delimiter(b)
end

product = (chunks.first + chunks.drop(1).each_slice(2).flat_map do |name_a, lines|
  # next lines unless is_delimiter(line) && line.end_with?("Begin")
  # binding.pry
  name = name_a.first
  next name_a + lines unless name.end_with?("Begin")
  # binding.pry
  [name] + name_to_template[[name.strip]]
end.flatten).join("\n")
# binding.pry 
`cp #{code_file} /tmp/backup.swift`
IO.write(code_file, product)
