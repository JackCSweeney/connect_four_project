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

    describe '#find_random_column(board)' do
        it 'can make a move' do
            computer = Computer.new
            board = Board.new

            expect(computer.find_random_column(board)).to be_a(String)

            columns = ('A'..'G').to_a
            expected = computer.find_random_column(board) 
            expect(columns.include?(expected)).to eq(true)
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

        it 'will find a column to win diagonally' do
            computer = Computer.new
            board = Board.new

            board.add_piece('A', 'O')
            board.add_piece('B', 'X')
            board.add_piece('B', 'O')
            board.add_piece('C', 'X')
            board.add_piece('C', 'X')
            board.add_piece('C', 'O')
            board.add_piece('D', 'X')
            board.add_piece('D', 'X')
            board.add_piece('D', 'X')

            expect(computer.find_win_column(board)).to eq('D')
        end

        it 'will return nil if theres no wins available in the board' do
            computer = Computer.new
            board = Board.new

            board.add_piece('A', 'O')
            board.add_piece('E', 'O')
            board.add_piece('B', 'O')

            expect(computer.find_win_column(board)).to eq(nil)
        end
    end

    describe '#find_block_column' do
        it 'will find a column to block horizontally' do
            computer = Computer.new
            board = Board.new

            board.add_piece('A', 'X')
            board.add_piece('B', 'X')
            board.add_piece('C', 'X')

            expect(computer.find_block_column(board)).to eq('D')
        end

        it 'will find a column to block vertically' do
            computer = Computer.new
            board = Board.new

            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('A', 'X')

            expect(computer.find_block_column(board)).to eq('A')
        end

        it 'will find a column to block diagonally' do
            computer = Computer.new
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

            expect(computer.find_block_column(board)).to eq('D')
        end

        it 'returns nil if no blocking available' do
            computer = Computer.new
            board = Board.new

            board.add_piece('A', 'X')
            board.add_piece('E', 'X')
            board.add_piece('G', 'X')

            expect(computer.find_block_column(board)).to eq(nil)
        end
    end

    describe '#make_move(board)' do
        it 'will chose to win before blocking' do
            computer = Computer.new
            board = Board.new

            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('B', 'O')
            board.add_piece('B', 'O')
            board.add_piece('B', 'O')

            computer.make_move(board)
            expect(board.win?).to eq(true)
            expect(board.cells[2][1]).to eq('O')
        end

        it 'will chose blocking over random if no win possible' do
            computer = Computer.new
            board = Board.new

            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('B', 'O')
            board.add_piece('B', 'O')

            computer.make_move(board)
            expect(board.win?).to eq(false)
            expect(board.cells[2][0]).to eq('O')
        end

        it 'no blocking or win possible, chose random' do
            computer = Computer.new
            board = Board.new

            computer.make_move(board)

            expect(board.cells.last.include?('O')).to eq(true)
        end
    end

    describe '#find_column' do
        it 'will find a win column' do
            computer = Computer.new
            board = Board.new

            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('B', 'O')
            board.add_piece('B', 'O')
            board.add_piece('B', 'O')

            expect(computer.find_column('O', board)).to eq('B')
        end

        it 'will find a blocking column' do
            computer = Computer.new
            board = Board.new

            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('A', 'X')
            board.add_piece('B', 'O')
            board.add_piece('B', 'O')

            expect(computer.find_column('X', board)).to eq('A')
        end
    end
end