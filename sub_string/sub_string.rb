dictionary = ["below",
"down",
"go",
"going",
"horn",
"how",
"howdy",
"it",
"i",
"low",
"own",
"part",
"partner",
"sit"]

def sub_string(string, dictionary)
  output = Hash.new(0)
  dictionary.each do |word|
    count = string.downcase.scan(word).count
    output[word] += count
  end
  output.delete_if{ |_, value| value == 0}
  return output
end
puts sub_string("Howdy partner, sit down! How's it going?",dictionary)
