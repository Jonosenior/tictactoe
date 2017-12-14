require_relative 'game'
require_relative 'board'
require_relative 'player'

def new_game
  puts "Starting game..."
  game = Game.new
  game.new_turn
end

new_game
