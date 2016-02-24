def echo(str)
  str 
end

def shout(str)
  str.upcase
end

def repeat(str, num = 2)
  ("#{str} " * num).chomp(" ")
end

def start_of_word(str, num)
  str[0..(num - 1)]
end

def first_word(str)
  str.partition(" ").first
end


# A constant keeps a dictionary of what is considered to be a small word

SMALL_WORDS = ["a", "an", "and", "are", "for", "in", "is", "or", "over", "the", "with"]

# titleize uses #map! to overwrite values with capitalized words
# unless SMALL_WORDS includes the current word, and the current
# word index is not 0

def titleize(str)
  words = str.split(" ")
  words.map!.with_index do |word, i|
    SMALL_WORDS.include?(word) && i != 0 ? word : word.capitalize
  end

  words.join(" ")
end