require_relative 'game'
require_relative 'board'
require_relative 'player'

def start_game
  puts "Starting game...\n...\n...\n"
  game = Game.new
  board = game.board
  game.introduction
  game.ask_player_1_name
  game.ask_player_2_name
  game.update_players_array
  game.print_instructions
  game.set_current_player
  loop do
    board.display_board
    game.ask_user_for_move
    game.verify_input
    board.place_move(game.current_player.marker, game.move.to_i)
    if board.is_it_a_draw? || board.any_winning_lines?(game.current_player)
      board.display_board
      break
    end
    game.change_current_player
  end
  board.any_winning_lines?(game.current_player) ? game.we_have_a_winner : game.everyone_loses
  game.user_wants_new_game? ? start_game : game.goodbye
end

start_game
