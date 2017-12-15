require_relative 'spec_helper'

describe Board do
  subject(:board) { Board.new }
  let(:legal_move) { 9 }
  let(:illegal_move) { 0 }

  describe "#board" do
    it "returns the board's base array" do
      expect(board.board).to eq([[1,2,3],[4,5,6],[7,8,9]])
    end
  end

  describe "#place_move" do
    context "given marker" do
      it "places marker at random point on board" do
        board.place_move("X", 9)
        expect(board.board).to eq([[1,2,3],[4,5,6],[7,8,"X"]])
      end
    end
  end

  describe "#is_move_legit?" do
    context "given illegal move" do
      it "returns false" do
        expect(board.is_move_legit?(illegal_move)).to eq(false)
      end
    end

    context "given legal move" do
      it "returns true" do
        expect(board.is_move_legit?(legal_move))
      end
    end

  end

  describe "#check_rows" do
    context "given winning row" do
      before do
        (1..3).each {|a| board.place_move("X", a)}
      end
      #allow(die).to receive(:roll) { 3 }
      it "returns true" do
        #dbl = double("Some Collaborator", :foo => 3, :bar => 4)
        player = double(:marker => "X")
        expect(board.check_rows(player))
      end
    end

    context "given losing row" do
      before do
        (7..8).each {|a| board.place_move("X", a)}
      end
      it "returns false" do
        player = double(:marker => "X")
        expect(board.check_rows(player)).to eq(false)
      end
    end
  end

  describe "#is_it_a_draw?" do
    context "game is a draw" do
      before do
        (1..9).step(2).each {|a| board.place_move("X", a)}
        (2..8).step(2).each {|a| board.place_move("O", a)}
      end
      it "returns true" do
        current_player = double(:marker => "X")
        expect(board.is_it_a_draw?(current_player))
      end
    end

    context "game is won" do
      before do
        (6..9).each {|a| board.place_move("O", a)}
      end
      it "returns false" do
        current_player = double(:marker => "X")
        expect(board.is_it_a_draw?(current_player)).to eq(false)
      end
    end
  end

end
