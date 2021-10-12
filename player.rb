class Player
  attr_accessor :lives, :name
  def initialize()
    @lives = 3
  end

  def alive?
    @lives > 0
  end
end