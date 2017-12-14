require 'spec_helper'

describe Game do
  subject(:tic) { Game.new }
  subject.stub(:gets) {"Dan"}

  describe ".ask_player_names" do
    it "asks user to input player names" do
      expect(:tic.ask_player_names).to eq("Dan")
    end

  end

end
