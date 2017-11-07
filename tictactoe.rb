
# The Board object stores the game board (as a 2-D array), displays the board for the user,
# checks if a move is legitimate, changes the board based on input from the Game object,
# and checks if a game is won or drawn.
class Board
  attr_reader :board

  def initialize
    @board = [[1,2,3],[4,5,6],[7,8,9]]
  end

  def display_board
    puts "#{@board[0]}\n#{@board[1]}\n#{@board[2]}"
  end

  def place_move(marker, grid_number)
    @board.each do |sub_array|
      for element in 0..sub_array.length-1
        if grid_number == sub_array[element]
          sub_array[element] = marker
        end
      end
    end
  end

  def is_move_legit?(move)
    @board.flatten.include?(move.to_i)
  end

  def is_it_a_draw?
    @board.each { |subarray| return false if (subarray.any? {|x| x.class == Fixnum})}
    true
  end

  def any_winning_lines?(current_player)
    return true if check_rows(current_player) || check_columns(current_player) || check_diagonals(current_player)
    false
  end

  def check_rows(current_player)
    @board.each { |subarray| return true if (subarray.all? {|x| (x == current_player.marker)})}
      false
  end

  def check_columns(current_player)
    column_a = []
    column_b = []
    column_c = []
    for x in 0..2
      column_a.push(@board[x][0])
      column_b.push(@board[x][1])
      column_c.push(@board[x][2])
    end
    return true if (column_a.all? {|x| (x == current_player.marker)})
    return true if (column_b.all? {|x| (x == current_player.marker)})
    return true if (column_c.all? {|x| (x == current_player.marker)})
    false
  end

  def check_diagonals(current_player)
    diagonal_a = [@board[0][0], @board[1][1], @board[2][2]]
    diagonal_b = [@board[0][2], @board[1][1], @board[2][0]]
    return true if (diagonal_a.all? {|x| (x == current_player.marker)})
    return true if (diagonal_b.all? {|x| (x == current_player.marker)})
    false
  end

end

# The Player object stores the name and marker (ie, "X" or "O") for each of the
# two players.

class Player

  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

end

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
    puts "Please give me your name Player 1"
    player_1_name = gets.chomp
    player_1 = Player.new(player_1_name, "X")
    puts "Your name Player 2"
    player_2_name = gets.chomp
    player_2 = Player.new(player_2_name, "O")
    @players.push(player_1, player_2)
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
    puts board.display_board
    status
  end

  def ask_user_for_move
    puts "OK #{current_player.name}. Make your move."
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
    puts "Congratulations #{current_player.name}!"
    exit
  end

  def everyone_loses
    puts "I'm afraid you're both losers, #{players[0].name} and #{players[1].name}."
    exit
  end

end


game = Game.new
game.new_turn
