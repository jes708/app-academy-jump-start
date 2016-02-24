class RPNCalculator
  
  def initialize
    @stack = []
  end
  
  def push(num)
    @stack.push(num)
  end
  
  def plus
    error
    @stack.push(@stack.pop + @stack.pop)
  end
  
  def minus
    error
    @stack.push(-(@stack.pop - @stack.pop))
  end
  
  def times
    error
    @stack.push(@stack.pop * @stack.pop)
  end
  
  def divide
    error
    n2 = @stack.pop
    n1 = @stack.pop
    @stack.push(n1 / n2.to_f)
  end
  
  def value
    @stack[-1]
  end
  
  def error
    raise "calculator is empty" if @stack.size < 2
  end
  
  def tokens(str)
    str.split(" ").map {|token| /\d/ =~ token ? token.to_i : token.intern}
  end
  
  def evaluate(str)
    tokens(str).each do |token|
      case token
      when :+
        plus
      when :-
        minus
      when :*
        times
      when :/
        divide
      else
        push(token)
      end
    end
    value
  end
  
end
