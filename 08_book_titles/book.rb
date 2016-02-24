class Book
  attr_reader :title
  
  CONJUNCTIONS = ["and", "but", "or", "yet", "for" ,"nor" ,"so"]
  ARTICLES = ["a", "an", "the"]
  PREPOSITIONS = ["as", "at", "by", "in", "into", "of", "on", "than", "to", "upon", "with", "within", "without"]
  LITTLE_WORDS = [CONJUNCTIONS, ARTICLES, PREPOSITIONS].flatten
  
  def title=(title)
    words = title.split(" ")
    words.map!.with_index do |word, i|
      LITTLE_WORDS.include?(word) && i != 0 ? word.downcase : word.capitalize
    end
    @title = words.join(" ")
  end
  
end