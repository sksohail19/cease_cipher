def caesar_cipher(text, shift)
  shift = shift % 26
  encrypted_text = text.chars.map do |char|
   
    if char.match(/[A-Za-z]/)
      base = char.ord < 97 ? 65 : 97 
      ((char.ord - base + shift) % 26 + base).chr
    else
      
      char
    end
  end

  encrypted_text.join
end


puts "Enter the text to encrypt:"
text = gets.chomp
puts "Enter the shift value (integer):"
shift = gets.to_i

encrypted_text = caesar_cipher(text, shift)
puts "Encrypted text: #{encrypted_text}"
