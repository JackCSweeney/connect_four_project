require './lib/board'
require 'pry'

RSpec.describe Board do
    describe '#initialize' do
        it 'exists' do
            board = Board.new

            expect(board).to be_a(Board)
        end

        it 'has a game board' do
            board = Board.new

            expect(board.board).to be_a(Array)
            expect(board.board.first).to be_a(Array)
            expect(board.board.last).to be_a(Array)
            expect(board.board.first[0]).to eq('.') 
        end
    end
end