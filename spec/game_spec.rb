require './game'

RSpec.describe Game do
    describe "#who_wins?" do
        it "return the name of the winner if there's one" do
            player1 = double("player1")
            player2 = double("player2")

            allow(player1).to receive(:name) {"Diego"}
            allow(player2).to receive(:name) {"Jose"}

            allow(player1).to receive(:wins?) {true}
            allow(player2).to receive(:wins?) {false}

            game = Game.new player1, player2
            expect(game.who_wins?).to eql('Diego')
        end
    end

    describe "#"
end
