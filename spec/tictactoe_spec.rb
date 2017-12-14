require 'spec_helper'

describe Game do
  subject(:tic) { Game.new }
  subject.stub(:gets) { 1 }

  describe ".ask_player_names"
  it "asks user to input player names" do

  end

end
