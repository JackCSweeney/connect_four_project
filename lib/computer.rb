class Computer

    attr_reader :piece

    def initialize
        @piece = 'O'
    end

    def make_move(board)
        columns = ('A'..'G').to_a
        board.add_piece(columns.sample, @piece)
    end
end
