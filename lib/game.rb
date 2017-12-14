# The Game object interfaces with the user - asking for their names and moves - and
# conducts the game.

class Game
  attr_reader :board, :players, :current_player

  def initialize
    @board = Board.new
    @players = []
    ask_player_names
    @current_player = players[0]
  end

  def ask_player_names
    puts "Let's play some Noughts and Crosses!"
    puts "First, please give me your name Player 1"
    player_1_name = gets.chomp
    player_1 = Player.new(player_1_name, "X")
    puts "And your name Player 2?"
    player_2_name = gets.chomp
    player_2 = Player.new(player_2_name, "O")
    @players.push(player_1, player_2)
    puts "Lovely to meet you, #{player_1_name} and #{player_2_name}!"
    puts "The rules are simple: choose where you want to play by selecting a number on the grid."
    puts "The first player to reach three in a row wins."
  end

  def change_current_player
    @current_player = (@current_player == @players[0] ? @players[1] : @players[0])
  end

  def new_turn
    board.display_board
    @move = ask_user_for_move
    if !(board.is_move_legit?(@move))
     puts "Make a proper move, moron"
     new_turn
    end
    board.place_move(@current_player.marker, @move.to_i)
    status
  end

  def ask_user_for_move
    puts "\nOK #{current_player.name}. Make your move."
    @move = gets.chomp
  end

  def status
    if board.any_winning_lines?(@current_player)
      we_have_a_winner
    elsif board.is_it_a_draw?
      everyone_loses
    else
      change_current_player
      new_turn
    end
  end

  def we_have_a_winner
    puts "Congratulations #{current_player.name}! You smashed it!"
    suggest_new_game
  end

  def everyone_loses
    puts "I'm afraid you're both losers, #{players[0].name} and #{players[1].name}."
    suggest_new_game
  end

  def suggest_new_game
    puts "Do you want to play again? (y/n)"
    answer = gets.chomp
    answer == "y" ? new_game : goodbye
  end

  def goodbye
    puts "Great playing with you. Let's play again soon!"
    exit
  end

end
