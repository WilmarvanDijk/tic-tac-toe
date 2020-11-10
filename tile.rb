# frozen-string-literal: true

# class = cell
class Tile
  attr_accessor :value

  def initialize(value = ' ')
    @value = value
  end
end
