class Computer

    attr_reader :piece

    def initialize
        @piece = 'O'
    end

    def make_move(board)
        win = find_win_column(board)
        block = find_block_column(board)
        random = find_random_column(board)
        
        if win
            board.add_piece(win, @piece)
        elsif block
            board.add_piece(block, @piece)
        else
            board.add_piece(random, @piece)
        end
    end

    def find_random_column(board)
        columns = ('A'..'G').to_a
        columns.sample
    end

    def find_win_column(board)
        columns = ('A'..'G').to_a
        
        columns.each do |column|
            board_copy = Board.new
            board_copy.cells = board.dup.cells.map(&:dup)
            board_copy.add_piece(column, @piece)

            return column if board_copy.win?
        end
        nil
    end

    def find_block_column(board)
        columns = ('A'..'G').to_a
        
        columns.each do |column|
            board_copy = Board.new
            board_copy.cells = board.dup.cells.map(&:dup)
            board_copy.add_piece(column, 'X')

            return column if board_copy.win?
        end
        nil
    end


end