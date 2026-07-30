def substrings(string, dictionary)
  clean_word = string.gsub(/[^a-zA-Z\s]/, "")
  words = clean_word.downcase.split(" ")
  word_count = Hash.new(0)

  words.each do |word|
    dictionary.flatten.map do |dictionary_word| 
      if word.include?(dictionary_word)
        word_count[dictionary_word] += 1
      end
    end
  end

  word_count
end

dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"]

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
