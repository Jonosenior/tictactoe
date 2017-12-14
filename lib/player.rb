# The Player object stores the name and marker (ie, "X" or "O") for each of the
# two players.

class Player

  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

end
