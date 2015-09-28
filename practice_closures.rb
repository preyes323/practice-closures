require 'pry'
class Array
  def iterate!
    # binding.pry
    self.each_with_index do |n, i|
      self[i] = yield(n)
    end
  end

  def iterate
    self.each_with_index do |n, i|
      yield(n)
    end
    self
  end
end

my_array = [1, 2 ,3, 4]

my_array.iterate do |n|
  p "#{n} raised to 2: #{n**2}"
end

p my_array

my_array.iterate! do |n|
  n**2
end

p my_array
