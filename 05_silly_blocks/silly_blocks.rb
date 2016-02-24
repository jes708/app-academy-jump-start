def reverser

  str = yield
  words = str.split(" ")
  words.map! {|word| word.reverse}
  words.join(" ")

end

def adder(num = 1)
  num + yield
end

def repeater(repeats = 1, &prc)
  repeats.times do
    prc.call
  end
end