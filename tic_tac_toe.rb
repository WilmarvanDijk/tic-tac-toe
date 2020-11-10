require_relative 'board'
require_relative 'game'
require_relative 'player'
require_relative 'tile'

puts "Welcome tic tac toe. \n"
puts 'Enter name of player 1: '
player1 = gets.chomp
puts 'Enter name of player 2: '
player2 = gets.chomp

player1 = Player.new(player1, 'x')
player2 = Player.new(player2, 'o')
game = Game.new([player1, player2])
game.start
