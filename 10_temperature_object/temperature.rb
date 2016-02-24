class Temperature
  
  def initialize(degrees)
    if degrees[:f]
      @degrees = self.class.ftoc(degrees[:f])
    else
      @degrees = degrees[:c]
    end
  end
  
  def self.ftoc(value)
    (value.to_f - 32) * 5 / 9
  end

  def self.ctof(value)
    (value.to_f * 9 / 5) + 32
  end

  def in_fahrenheit
    self.class.ctof(@degrees)
  end
  
  def in_celsius
    @degrees
  end

  def self.from_celsius(value)
    self.new(c: value)
  end

  def self.from_fahrenheit(value)
    self.new(f: value)
  end

end

class Celsius < Temperature
  def initialize(value)
    @degrees = value
  end
end

class Fahrenheit < Temperature
  def initialize(value)
    @degrees = self.class.ftoc(value)
  end
end