require 'pry'

class Triangle
  
  attr_reader :side_one, :side_two, :side_three

  class TriangleError < StandardError
  end

  def initialize(side_one, side_two, side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
  end

  def kind
    # binding.pry
    if @side_one  <= 0 || @side_two  <= 0 || @side_three <= 0 ||
      @side_one + @side_two <= @side_three ||
      @side_one + @side_three <= @side_two ||
      @side_two + @side_three <= @side_one
      raise TriangleError
    end
    if @side_one == @side_three && @side_one == @side_two
      :equilateral
    elsif (@side_three == @side_two && @side_one != @side_two) ||
      (@side_one == @side_two && @side_three != @side_two) || 
      (@side_three == @side_one && @side_two != @side_one)
      :isosceles
    else
      :scalene
    end
  end
end
