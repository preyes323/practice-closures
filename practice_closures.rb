require 'pry'
class Array
  def iterate!(code)
    # binding.pry
    self.each_with_index do |n, i|
      self[i] = code.call(n)
    end
  end

  def iterate(code)
    self.each_with_index do |n, i|
      code.call(n)
    end
    self
  end
end

square = proc { |n| n**2 }
my_array = [1, 2 ,3, 4]
my_array.iterate(square)
p my_array
my_array.iterate!(square)
p my_array

def args(code)
  one, two, three = 1, 2, 3
  code.call(one, two, three)
end

args(Proc.new{ |a, b, c| puts "Give me a #{a} and a #{b} and a #{c.class}" })
args(lambda do |a, b, c|
              # binding.pry
              puts "Give me a #{a} and a #{b} and a #{c.class}"
            end)
