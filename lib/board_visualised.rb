
class Board

  def initialize
    @board = [["X",2,3],[4,5,6],[7,8,9]]
  end

  def display_board
    print "     |     |     \n  #{@board[0][0]}  |  #{@board[0][1]}  |  #{@board[0][2]}\n"
    print "_____|_____|_____\n     |     |   \n  #{@board[1][0]}  |  #{@board[1][1]}  |  #{@board[1][2]}  \n"
    print "_____|_____|_____\n     |     |   \n  #{@board[2][0]}  |  #{@board[2][1]}  |  #{@board[2][2]}  \n     |     |     "
  end

end

board = Board.new
board.display_board
