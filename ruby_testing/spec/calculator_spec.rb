#spec/calculator_spec.rb
require './lib/calculator'

RSpec.describe Calculator do
  describe "#add" do
    it "returns the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5, 2)).to eql(7)
    end

    it "returns the sum of morethan 2 numbers" do
      calulator = Calculator.new
      expect(calulator.add(4, 5, 2)).to eql(11)
    end
  end

  describe "#sub" do
    it "returns the difference of two numbers" do
      calculator = Calculator.new
      expect(calculator.sub(4, 2)).to eql(2)
    end

    it "returns the difference of two or more numbers" do
      calculator = Calculator.new
      expect(calculator.sub(4, 2, 1)).to eql(1)
    end
  end

  describe "#mul" do
    it "returns the product of two numbers" do
      calculator = Calculator.new
      expect(calculator.mul(2, 4)).to eql(8)
    end

    it "returns the product of two or more numbers" do
      calculator = Calculator.new
      expect(calculator.mul(2, 4, 1)).to eql(8)
    end
  end

  describe "#div" do
    it "returns the quotient of two numbers" do
      calculator = Calculator.new
      expect(calculator.div(4, 4)).to eql(1.0)
    end

    it "returns the quotient of two or more numbers" do
      calculator = Calculator.new
      expect(calculator.div(10, 2, 2)).to eql(2.5)
    end
  end
end
