require './lib/board'
require './lib/player'
require 'pry'

RSpec.describe Player do
    describe '#initialize' do
        it 'exists' do
            player = Player.new

            expect(player).to be_a(Player)
        end

        it 'has a piece' do
            player = Player.new

            expect(player.piece).to eq('X')
        end
    end

    describe '#make_move(column, board)' do
        it 'can make a move on the board' do
            board = Board.new
            player = Player.new

            player.make_move('A', board)

            expect(board.cells.last[0]).to eq('X')
        end
    end
end