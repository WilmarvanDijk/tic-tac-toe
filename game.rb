# frozen-string-literal: true

# class = game
class Game
  attr_reader :players, :board, :current_player, :other_player, :game_over, :user_input, :winner

  def initialize(players, board = Board.new)
    @winner = 'Nobody'
    @game_over = false
    @players = players
    @board = board
    @current_player, @other_player = players.shuffle
  end

  def start
    puts "\n#{current_player.name} has randomly been selected as the first player."

    print_explanation_message
    play_round
  end

  private

  def play_round
    until game_over
      puts "#{current_player.name}: Enter a number between 1 and 9 to make your move, if you forgot the the rules of the game enter h to get help."

      @user_input = gets.chomp

      if ('1'..'9').include?(user_input)
        process_round
      elsif user_input == 'h'
        print_explanation_message
      else
        print_error_message
      end
    end

    puts "#{winner} wins the game!"
  end

  def process_round
    x, y = convert_user_input
    if board.get_tile(x, y).value == ' '
      board.set_tile(x, y, current_player.marker)
      board.display_board

      if board.draw? 
        @game_over = true
      elsif board.winner?(current_player)
        @game_over = true
        @winner = current_player.name
      end
      switch_players
    else
      print_error_message
    end 
  end

  def convert_user_input
    mapping = {
       '1' => [0, 0],
       '2' => [1, 0],
       '3' => [2, 0],
       '4' => [0, 1],
       '5' => [1, 1],
       '6' => [2, 1],
       '7' => [0, 2],
       '8' => [1, 2],
       '9' => [2, 2]
    }
    mapping[user_input]
  end

  def print_explanation_message
    puts "\n"
    puts 'On the board below you see the board of the tic tac toe game'
    board.display_reference_board
    puts 'The numbers (1 - 9) on the board represents the position of where the marker (x or o) will be placed.'
    puts 'By pressing one of the numbers (1 - 9) on your keyboard the marker that is assigned to the current player will replace that number.'
    puts 'When a player has three of the same marker in a row (horizontally, vertically or diagonal) he/she will win the game.'
    puts "If this doesn't happen, the game will end in a draw."
    puts 'For more information about this game see the following link: https://en.wikipedia.org/wiki/Tic-tac-toe'
    puts "\n"
  end

  def print_error_message
    puts "\nThis input is invalid, try again."
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end
end
