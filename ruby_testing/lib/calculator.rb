class Calculator
  def add(a, b, *c)
    a + b + c.sum
  end

  def sub(a, b, *c)
    result = a - b
    c.each { |num| result -= num }
    result
  end

  def mul(a, b, *c)
    result = a * b
    c.each { |num| result *= num }
    result
  end

  def div(a, b, *c)
    result = a / b.to_f
    c.each { |num| result /= num }
    result
  end
end
