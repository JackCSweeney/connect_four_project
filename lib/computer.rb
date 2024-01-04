class Computer

    attr_reader :piece

    def initialize
        @piece = 'O'
    end

    def make_move(board)
        columns = ('A'..'G').to_a
        board.add_piece(columns.sample, @piece)
    end

    # method to scan the board for 3 in a row vertically, horizontally, and diagonally of it's own piece value and for the opponent piece value
    # 

    # columns.each do |column|
    #     add_piece(column) if add_piece(column).win?

    def find_win_column(board)
        columns = ('A'..'G').to_a
        board_copy = board.dup
        counter = 0
        7.times do
            board_copy.add_piece(columns[counter], @piece)
            return columns[counter] if board_copy.win?
            counter += 1
        end
    end
end
