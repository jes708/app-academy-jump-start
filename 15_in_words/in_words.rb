class Fixnum

  ONES = {
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine"
  }
  
  TEENS = {
    0 => "ten",
    1 => "eleven",
    2 => "twelve",
    3 => "thirteen",
    4 => "fourteen",
    5 => "fifteen",
    6 => "sixteen",
    7 => "seventeen",
    8 => "eighteen",
    9 => "nineteen"
  }
  
  TENS = {
    2 => "twenty",
    3 => "thirty",
    4 => "forty",
    5 => "fifty",
    6 => "sixty",
    7 => "seventy",
    8 => "eighty",
    9 => "ninety"
  }
  
  SUFFIXES = {
    -3 => "hundred",
    -4 => "thousand",
    -7 => "million",
    -10 => "billion",
    -13 => "trillion"
  }

  def in_words
    digits = self.to_s.split(//)
    words = []
    i = -1
    while digits[i] != nil
      number = word(digits, i)
      words.unshift(number) unless number.nil?
      TEENS.has_value?(number) ? i -= 2 : i -= 1
    end
    words.join(" ")
  end
  
  def word(digits, i)
      case i % -3
      when -1
        ones_and_suffixes(digits, i)
      when -2
        TENS[digits[i].to_i]
      when 0
        "#{ONES[digits[i].to_i]} hundred" if digits[i].to_i > 0
      end
  end
  
  def ones(digits, i)
        if digits.length == 1 && digits[i] == "0"
          "zero"
        elsif digits[i - 1].to_i != 1 
          ONES[digits[i].to_i]
        else 
          TEENS[digits[i].to_i]
        end
  end
  
  def ones_and_suffixes(digits, i)
    if  i == -1
      ones(digits, i)
    elsif !ones(digits, i).nil?
      "#{ones(digits, i)} #{SUFFIXES[i]}"
    elsif digits[(i - 2)..i].any? {|digit| digit.to_i != 0}
      SUFFIXES[i]
    end
  end
  
end