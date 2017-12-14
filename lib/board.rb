
# The Board object stores the game board (as a 2-D array), displays the board for the user,
# checks if a move is legitimate, changes the board based on input from the Game object,
# and checks if a game is won or drawn.

class Board
  attr_reader :board

  def initialize
    @board = [[1,2,3],[4,5,6],[7,8,9]]
  end

  def display_board
    print "     |     |     \n  #{@board[0][0]}  |  #{@board[0][1]}  |  #{@board[0][2]}\n"
    print "_____|_____|_____\n     |     |   \n  #{@board[1][0]}  |  #{@board[1][1]}  |  #{@board[1][2]}  \n"
    print "_____|_____|_____\n     |     |   \n  #{@board[2][0]}  |  #{@board[2][1]}  |  #{@board[2][2]}  \n     |     |     "
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
