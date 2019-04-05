class Player
  attr_accessor :positions
  attr_reader :character, :name

  def initialize(name, character)
    @name = name
    @character = character
    @positions = []
  end

  def wins?(line)
    line & @positions == line
  end
  
  def get_choice(game_board)
    puts "#{@name} select a number>>"
    choice = gets.chomp.to_i
    if (1..9).include?(choice)
      game_board.is_fulled?(choice) ? puts("Try again, that spot has been taken already.\n\n") : choice
    else
      puts("Enter a valid number, please.")
    end
  end
end
