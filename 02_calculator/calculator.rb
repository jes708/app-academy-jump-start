def add(x, y)
  x + y
end

def subtract(x, y)
  x - y
end

def sum(numbers)
  sum = numbers.reduce(:+)
  sum.nil? ? 0 : sum
end

def multiply(numbers)
  product = numbers.reduce(:*)
  product.nil? ? 0 : product
end

def power(x, y)
  x ** y
end

def factorial(x)
  puts "x must be non-negative" if x < 0
  return 1 if x == 0
  x * factorial(x - 1)
end