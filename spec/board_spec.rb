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

    describe '#add_piece(column)' do
        it 'can add a piece to the first column and will stack pieces vertically' do
            board = Board.new

            board.add_piece('A')

            expect(board.board.last[0]).to eq('X')

            board.add_piece('A')

            expect(board.board[-2][0]).to eq('X')
        end
    end
end