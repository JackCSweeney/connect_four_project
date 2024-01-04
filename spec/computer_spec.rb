require './lib/board'
require './lib/computer'
require 'pry'

RSpec.describe Computer do
    describe '#initialize' do
        it 'exists' do
            computer = Computer.new

            expect(computer).to be_a(Computer)
        end

        it 'has a piece' do
            computer = Computer.new

            expect(computer.piece).to eq('O')
        end
    end

    describe '#make_move(board)' do
        it 'can make a move' do
            computer = Computer.new
            board = Board.new

            computer.make_move(board)

            expect(board.cells.last.include?('O')).to eq(true)
        end

        it 'can make multiple moves' do
            computer = Computer.new
            board = Board.new

            computer.make_move(board)
            computer.make_move(board)

            expect(board.cells.last.concat(board.cells[-2]).count('O')).to eq(2)
        end
    end

    describe '#find_win_column' do
        it 'will find a column to win horizontally' do
            computer = Computer.new
            board = Board.new

            board.add_piece('A', 'O')
            board.add_piece('B', 'O')
            board.add_piece('C', 'O')

            expect(computer.find_win_column(board)).to eq('D')
        end

        it 'will find a column to win vertically' do
            computer = Computer.new
            board = Board.new

            board.add_piece('A', 'O')
            board.add_piece('A', 'O')
            board.add_piece('A', 'O')

            expect(computer.find_win_column(board)).to eq('A')
        end
    end
end