require File.expand_path("../../lib/player", __FILE__)


describe Player do
  let(:name) {"Jonathan"}
  let(:marker) {"O"}
  subject(:player) {Player.new(name, marker)}

  describe "#name" do
    it "returns the given name" do
      expect(subject.name).to eq("Jonathan")
    end
  end

  describe "#marker" do
    it "returns the given marker" do
      expect(subject.marker).to eq("O")
    end
  end
end
