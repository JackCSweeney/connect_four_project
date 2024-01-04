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

    describe '#add_piece(column, piece)' do
        it 'can add a piece to the first column and will stack pieces vertically' do
            board = Board.new

            board.add_piece('A', 'X')

            expect(board.board.last[0]).to eq('X')

            board.add_piece('A', 'X')

            expect(board.board[-2][0]).to eq('X')
        end

        it 'will return nil from puts statement when a column is full' do
            board = Board.new

            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('A', 'X')

            expect(board.add_piece('A', 'X')).to eq(nil)
        end

        it 'will return nil if column is invalid or out of range' do
            board = Board.new

            expect(board.add_piece('X', 'X')).to eq(nil)
        end
    end

    describe '#win?' do
        it 'checks if player or computer won the game horizontally' do
            board = Board.new

            board.add_piece('A', 'X')
            board.add_piece('B', 'X')
            board.add_piece('C', 'X')
            board.add_piece('D', 'X')

            expect(board.win?).to eq true
        end

        it 'checks if player or computer won the game vertically' do
            board = Board.new

            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('A', 'X')

            expect(board.win?).to eq true
        end
    end

    describe '#four_in_a_row_by_row' do
        it 'returns true if 4 elements in a row' do
            board = Board.new

            board.add_piece('A', 'X')
            board.add_piece('B', 'X')
            board.add_piece('C', 'X')
            board.add_piece('D', 'X')

            expect(board.four_in_a_row_by_row(board.board)).to eq true
        end
    end

    describe '#diagonals(grid)' do
        it 'returns true if 4 elements in a row diagonally' do
            board = Board.new

            board.add_piece('A', 'X')
            board.add_piece('B', 'O')
            board.add_piece('B', 'X')
            board.add_piece('C', 'O')
            board.add_piece('C', 'O')
            board.add_piece('C', 'X')
            board.add_piece('D', 'O')
            board.add_piece('D', 'O')
            board.add_piece('D', 'O')
            board.add_piece('D', 'X')

            expect(board.diagonals(board.board)).to eq([[".", ".", ".", "O", ".", "."], [".", ".", "X", "O", "."], [".", ".", "O", "O"], [".", ".", "X", ".", "."], [".", ".", ".", "."], [".", ".", "."]])
        end

        it 'rotate the board 90 degrees so we can check diagonals' do
            board = Board.new

            board.add_piece('A', 'X')
            board.add_piece('B', 'O')
            board.add_piece('B', 'X')
            board.add_piece('C', 'O')
            board.add_piece('C', 'O')
            board.add_piece('C', 'X')
            board.add_piece('D', 'O')
            board.add_piece('D', 'O')
            board.add_piece('D', 'O')
            board.add_piece('D', 'X')

            expect(board.diagonals(board.board.transpose.reverse)).to eq([[".", ".", ".", "O", "O", "O", nil], [".", ".", "X", "X", "X", "X"], [".", ".", ".", ".", "."], [".", ".", ".", "."], [".", ".", ".", "O", "O", nil], [".", ".", ".", "O", nil]])
        end
    end
end