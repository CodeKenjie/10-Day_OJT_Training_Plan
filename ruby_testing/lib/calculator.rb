class Calculator
  def add(a, b, c = 0)
    a + b + c
  end

  def sub(a, b, c = 0)
    a - b - c
  end

  def mul(a, b, c = 1)
    a * b * c
  end

  def div(a, b, c = 1.0)
    a / b.to_f / c
  end
end
