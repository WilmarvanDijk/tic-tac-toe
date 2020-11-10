# frozen-string-literal: true

# class = board
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3) { Tile.new } }
  end

  def display_board
    print "\n"

    grid.each do |row|
      row.each { |tile| print " #{tile.value} │"}
      print "\n"
      puts '───┼───┼───┼'
    end
    print "\n"
  end

  def display_reference_board
    print "\n"
    i = 1

    grid.each do |row|
      row.each do
        print " #{i} │"
        i += 1
      end
      print "\n"
      puts "───┼───┼───┼"
    end

    print "\n"
  end

  def get_tile(x, y)
    grid[y][x]
  end

  def set_tile(x, y, value) 
    get_tile(x, y).value = value
  end

  def draw?
    grid.flatten.none? { |tile| tile.value == ' '}
  end

  def winner?(player)
    grid.each do |row|
      return true if row.all? { |tile| tile.value == player.marker }
    end

    grid.transpose.each do |column|
      return true if column.all? { |tile| tile.value == player.marker }
    end

    diagonal_1 = [grid[0][0], grid[1][1], grid[2][2]]
    diagonal_2 = [grid[0][2], grid[1][1], grid[2][0]]

    return true if diagonal_1.all? { |tile| tile.value == player.marker }
    return true if diagonal_2.all? { |tile| tile.value == player.marker }

    false
  end
end
