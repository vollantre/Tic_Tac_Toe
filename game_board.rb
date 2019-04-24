class GameBoard
  attr_accessor :positions

  def initialize()
    @positions = [0,1,2,3,4,5,6,7,8,9]
  end

  def display()
    puts "\t  #{@positions[7]} | #{@positions[8]} | #{@positions[9]} "
    puts "\t ---|---|---"
    puts "\t  #{@positions[4]} | #{@positions[5]} | #{@positions[6]} "
    puts "\t ---|---|---"
    puts "\t  #{@positions[1]} | #{@positions[2]} | #{@positions[3]} "
    puts ""
  end

  def fill(pos, character)
    @positions[pos] = character
  end

  def full?
    @positions[1..9].all? {|x|
      x.instance_of?(String)
    }
  end

  def is_fulled?(num)
    @positions[num] == "X" || "O" == @positions[num]
  end
end