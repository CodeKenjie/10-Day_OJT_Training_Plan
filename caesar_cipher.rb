
def caesar_cipher(string, key)

  encrypted = ""
  
  string.each_char do | letter |
    ascii = letter.ord
    encrypted_ascii = ascii + key

    if ascii.between?(65, 90)
      encrypted_ascii -= 26 if encrypted_ascii > 90
    elsif ascii.between?(97, 122)
      encrypted_ascii -= 26 if encrypted_ascii > 122
    else
      encrypted += letter
      next
    end

    encrypted += encrypted_ascii.chr
  end

  encrypted
end

puts caesar_cipher("COMPUTER", 7)
puts caesar_cipher("computer", 7)
puts caesar_cipher("Computer", 7)

