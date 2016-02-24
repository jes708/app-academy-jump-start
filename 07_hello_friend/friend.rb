class Friend
  attr_reader :name
  
  def initialize(name = "Bob")
    @name = name
  end
  
  def greeting(name = nil)
    name ? "Hello, #{name}!" : "Hello!"
  end
  
end