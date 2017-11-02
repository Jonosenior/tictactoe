#require_relative 'ticmessingaround'

board = [[1,2,3],[4,5,6],[7,8,9]]
$p1 = "Player One"
$p2 = "Player Two"
current_player = $p1
game_over = false


def check_player_input(move, board, current_player)
  if is_move_legit?(move, board)
    board = find_and_replace(move, board, current_player)
    #puts "was legit"
  else
    puts "Make a proper move you moron"
    new_turn(board, current_player)
  end
  #print board
end

def is_move_legit?(move, board)
  board.flatten.include?(move)
end

def find_and_replace(move, board, current_player)
  #puts "move: #{move}"
  board.each_with_index do |subarray, index|
    for j in 0..subarray.length
      if subarray[j] == move
        subarray[j] = (current_player == $p1 ? "X" : "O")
        #puts "placed x"
      end
    end
  end
  #print board
  board
end

def setup_next_turn(move, board, current_player)
  if has_someone_won?(board)
    game_over = true
    puts "Congratulations, #{current_player}! You KILLED it."
    exit
  else
    current_player = (current_player == $p1 ? $p2 : $p1)
    check_for_x_or_o(current_player)
    new_turn(board, current_player)
  end
end

def new_turn(board, current_player)
  puts "#{board[0]}\n#{board[1]}\n#{board[2]}"
  puts "#{current_player}'s turn:"
  move = gets.chomp.to_i
  check_player_input(move, board, current_player)
  setup_next_turn(move, board, current_player)
end

###########HAS SOMEONE WON? METHODS
def has_someone_won?(board)
  return true if check_rows(board) || check_columns(board) || check_diagonals(board)
  false
end

def check_for_x_or_o(current_player)
  $x_or_o = (current_player == $p1 ? "X" : "O")
end


def check_rows(board)
  board.each { |subarray| return true if (subarray.all? {|x| (x == $x_or_o)})}
    false
end
# #
# # #Check columns
def check_columns(board)
  column_a = []
  column_b = []
  column_c = []
  for x in 0..2
    column_a.push(board[x][0])
    column_b.push(board[x][1])
    column_c.push(board[x][2])
  end
  # print column_a
  # print column_b
  # print column_c
  return true if (column_a.all? {|x| (x == $x_or_o)})
  return true if (column_b.all? {|x| (x == $x_or_o)})
  return true if (column_c.all? {|x| (x == $x_or_o)})
  false
end

# #Check diagonals
def check_diagonals(board)
  diagonal_a = [board[0][0], board[1][1], board[2][2]]
  diagonal_b = [board[0][2], board[1][1], board[2][0]]
  return true if (diagonal_a.all? {|x| (x == $x_or_o)})
  return true if (diagonal_b.all? {|x| (x == $x_or_o)})
  false
end

unless game_over
  new_turn(board, current_player)
end






#5.times {new_turn(board, current_player)}
