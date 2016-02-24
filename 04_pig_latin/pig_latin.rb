VOWELS = ["a", "e", "i", "o", "u"]
ALPHABET = ("a".."z").to_a + ("A".."Z").to_a 

def translate(str)
  words = str.split(" ")
  words.map! {|word| preserve_punctuation(word)}
  words.join(" ")
end

def translate_word(word)
  word.each_char.with_index do |char, i|
    if VOWELS.include?(word[0].downcase)
      return word << "ay"
    elsif VOWELS.include?(char.downcase) && word[(i - 1)..i].downcase != "qu"
      pig_latin_word = word[i..-1] + "#{word[0..(i - 1)].downcase}ay"
      return word.capitalize == word ? pig_latin_word.capitalize : pig_latin_word
    end
  end
end

def preserve_punctuation(word)

  intro_punctuation = ""
  end_punctuation = ""

  i = 0
  until ALPHABET.include?(word[i])

    return word if i >= word.length
    intro_punctuation << word[i]
    i += 1
  end

  j = word.length - 1
  until ALPHABET.include?(word[j])

    end_punctuation = word[j] + end_punctuation

    j -= 1
  end  

  return intro_punctuation << translate_word(word[i..j]) << end_punctuation

end