class Dictionary
  attr_reader :entries
  
  def initialize(entries = {})
    @entries = entries
  end
  
  def add(entry)
    if entry.is_a?(String)
      @entries.merge!(entry => nil)
    elsif entry.is_a?(Hash)
      @entries.merge!(entry)
    end
    @keywords = @entries.keys
  end
  
  def include?(word)
    @entries.has_key?(word)
  end
  
  def find(word)
    result = {}
    @entries.keys.grep(/#{word}/).each do |entry|
      result.merge!({entry => @entries[entry]})
    end
    result
  end
  
  def keywords
    @entries.keys.sort
  end
  
  def printable
    arr = keywords.map do |word|
       %Q{[#{word}] "#{@entries[word]}"}
    end
    arr.join("\n")
  end
  
end