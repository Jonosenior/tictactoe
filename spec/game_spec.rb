require_relative 'spec_helper'

describe Game do
  before do
    allow_any_instance_of(IO).to receive(:puts) # Stops any "puts" statements from printing to console during testing
  end
  subject(:game) {Game.new}


  describe "#ask_player_1_name" do
    it "saves player_1_name as object variable" do
      allow(game).to receive(:gets).and_return("Jonathan")
      game.ask_player_1_name
      expect(game.player_1_name).to eq("Jonathan")
    end
  end

  describe "#ask_player_2_name" do
    it "saves player_2_name as object variable" do
      allow(game).to receive(:gets).and_return("Takako")
      game.ask_player_2_name
      expect(game.player_2_name).to eq("Takako")
    end
  end

  describe "#update_players_array" do
    context "both player names saved" do
      before do
        allow(game).to receive(:gets).and_return("Jonathan")
        game.ask_player_1_name
        allow(game).to receive(:gets).and_return("Takako")
        game.ask_player_2_name
      end
      it "saves first player object to the array with name set to player_1_name" do
        game.update_players_array
        expect(game.players[0].name).to eq("Jonathan")
      end
      it "saves both players to array" do
        game.update_players_array
        expect(game.players.length).to eq(2)
      end
    end
  end




end
