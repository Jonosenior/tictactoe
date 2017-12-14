# The Game object interfaces with the user - asking for their names and moves - and
# conducts the game.

class Game
  attr_reader :board, :players, :current_player, :move

  def initialize
    @board = Board.new
    @players = []
  end

  def set_current_player
    @current_player = @players[0]
  end

  def update_players_array
    @players << Player.new(@player_1_name, "X")
    @players << Player.new(@player_2_name, "O")
  end

  def introduction
    puts "Let's play some Noughts and Crosses!"
  end

  def ask_player_1_name
    puts "First, please give me your name Player 1"
    @player_1_name = gets.chomp
    #player_1 = Player.new(player_1_name, "X")
  end

  def ask_player_2_name
    puts "And your name Player 2?"
    @player_2_name = gets.chomp
    #player_2 = Player.new(player_2_name, "O")
  end

  def print_instructions
    puts "Lovely to meet you, #{@player_1_name} and #{@player_2_name}!"
    puts "The rules are simple: choose where you want to play by selecting a number on the grid."
    puts "The first player to reach three in a row wins."
  end

  def change_current_player
    @current_player = (@current_player == @players[0] ? @players[1] : @players[0])
  end

  def verify_input
    # board.display_board
    # @move = ask_user_for_move
    while !(board.is_move_legit?(@move))
      puts "Make a proper move, moron"
      @move = ask_user_for_move
    end
    #board.place_move(@current_player.marker, @move.to_i)
    #status
  end

  def ask_user_for_move
    puts "\nOK #{current_player.name}. Make your move."
    @move = gets.chomp
  end

  # def status
  #   if board.any_winning_lines?(@current_player)
  #     we_have_a_winner
  #   elsif board.is_it_a_draw?
  #     everyone_loses
  #   else
  #     change_current_player
  #     new_turn
  #   end
  # end

  def we_have_a_winner
    puts "\n\nCongratulations #{current_player.name}! You smashed it!"
  end

  def everyone_loses
    puts "\n\nI'm afraid you're both losers, #{players[0].name} and #{players[1].name}."
  end

  def user_wants_new_game?
    puts "Do you want to play again? (y/n)"
    answer = gets.chomp.downcase
    answer == "y" ? true : false
  end

  def goodbye
    puts "Great playing with you. Let's play again soon!"
    exit
  end

end
