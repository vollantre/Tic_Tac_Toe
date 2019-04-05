load 'game_board.rb'
load 'player.rb'

class Game
  def initialize(player1, player2)
    @player_1 = player1
    @player_2 = player2
    @game_board = GameBoard.new([0,1,2,3,4,5,6,7,8,9])
    @turn = 1
    @lines = [
              [1,2,3],[4,5,6],[7,8,9],
              [1,4,7],[2,5,8],[3,6,9],
              [1,5,9],[3,5,7]
             ]
    start
  end

  private
  def start()
    until (who_wins?() || @game_board.full?())
      @turn == 1 ? plays(@player_1) : plays(@player_2)
      @turn = @turn == 1 ? 0 : 1
    end
    end_game
  end

  def end_game
    if who_wins?()
      @game_board.display()
      puts "Congratz #{who_wins?} you're the winner"
    elsif @game_board.full?
      @game_board.display()
      puts "It's a Tie!"
    end
  end

  def who_wins?()
    players = [@player_1, @player_2]
    players.each {|player|
      @lines.each {|line|
        return player.name() if player.wins?(line)
      }
    }
    false
  end

  def plays(player)
    while 1
    @game_board.display()
      reply = player.get_choice(@game_board)
      if reply 
        @game_board.fill(reply,player.character)
        player.positions.push(reply).sort!
        puts `clear`
        break
      end
    end 
  end
end

def start_game()
  puts "Who wants to be X?"
  player1 = Player.new(gets.chomp,"X")
  puts "Who wants to be O?"
  player2 = Player.new(gets.chomp, "O")
  sleep 0.5
  Game.new(player1, player2)
  sleep 1
  puts "Do you want to play one more time? \n(Y/N)"
  reply = gets.chomp
  sleep 0.7
  puts `clear`
  start_game unless reply.downcase == "n"
end

start_game