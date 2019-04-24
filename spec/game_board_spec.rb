require './game_board'

RSpec.describe GameBoard do
    describe "#full?" do
        it "checks if the whole 3x3 grid is full" do
            board = GameBoard.new
            expect(board.full?).to eql(false)
        end
    end

    describe "#is_fulled?" do
        it "checks if a specific grid is already fulled" do
            board = GameBoard.new
            board.positions[3] = "X"
            expect(board.is_fulled?(3)).to eql(true)
        end
    end
end