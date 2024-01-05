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

            expect(board.cells).to be_a(Array)
            expect(board.cells.first).to be_a(Array)
            expect(board.cells.last).to be_a(Array)
            expect(board.cells.first[0]).to eq('.') 
        end
    end

    describe '#add_piece(column, piece)' do
        it 'can add a piece to the first column and will stack pieces vertically' do
            board = Board.new

            board.add_piece('A', 'X')

            expect(board.cells.last[0]).to eq('X')

            board.add_piece('A', 'X')

            expect(board.cells[-2][0]).to eq('X')
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

        it 'check if player or computer won the game diagonally' do
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

            expect(board.four_in_a_row_by_row(board.cells)).to eq true
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

            expect(board.diagonals(board.cells)).to eq([[".", ".", ".", "O", ".", "."], [".", ".", "X", "O", "."], [".", ".", "O", "O"], [".", ".", "X", ".", "."], [".", ".", ".", "."], [".", ".", "."]])
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

            expect(board.diagonals(board.cells.transpose.reverse)).to eq([[".", ".", ".", "O", "O", "O", nil], [".", ".", "X", "X", "X", "X"], [".", ".", ".", ".", "."], [".", ".", ".", "."], [".", ".", ".", "O", "O", nil], [".", ".", ".", "O", nil]])
        end
    end

    describe '#draw?' do
        it 'check if the board is full' do
            board = Board.new

            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('A', 'O')
            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('B', 'O')
            board.add_piece('B', 'O')
            board.add_piece('B', 'O')
            board.add_piece('B', 'X')
            board.add_piece('B', 'O')
            board.add_piece('B', 'X')
            board.add_piece('C', 'X')
            board.add_piece('C', 'O')
            board.add_piece('C', 'X')
            board.add_piece('C', 'X')
            board.add_piece('C', 'X')
            board.add_piece('C', 'O')
            board.add_piece('D', 'X')
            board.add_piece('D', 'O')
            board.add_piece('D', 'X')
            board.add_piece('D', 'X')
            board.add_piece('D', 'X')
            board.add_piece('D', 'O')
            board.add_piece('E', 'O')
            board.add_piece('E', 'X')
            board.add_piece('E', 'O')
            board.add_piece('E', 'O')
            board.add_piece('E', 'O')
            board.add_piece('E', 'X')
            board.add_piece('F', 'O')
            board.add_piece('F', 'O')
            board.add_piece('F', 'X')
            board.add_piece('F', 'O')
            board.add_piece('F', 'X')
            board.add_piece('F', 'X')
            board.add_piece('G', 'O')
            board.add_piece('G', 'O')
            board.add_piece('G', 'X')
            board.add_piece('G', 'O')
            board.add_piece('G', 'X')
            board.add_piece('G', 'O')

            expect(board.draw?).to eq(true)
        end

        it 'returns false if no draw' do
            board = Board.new

            expect(board.draw?).to eq(false)
        end

        it 'returns false if there is space left on the board' do
            board = Board.new
            
            board.add_piece('B', 'X')
            board.add_piece('A', 'X')
            board.add_piece('C', 'X')
           
            expect(board.draw?).to eq(false)
        end
    end
end