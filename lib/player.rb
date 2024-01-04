class Player

    attr_reader :piece

    def initialize
        @piece = 'X'
    end

    def make_move(column, board)
        board.add_piece(column, @piece)
    end
end