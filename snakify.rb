class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end

r = IO.read("TwitterUser.swift").split("\n").map do |line|
  next line unless line.match(/^\s*let /)
  # bits = line.split("_")
  # [bits[0]] + bits.drop(1).map { |b| b.capitalize }
  idx = line.index(":")
  line[0...idx].underscore + line[idx..-1]
end.to_a
puts r
