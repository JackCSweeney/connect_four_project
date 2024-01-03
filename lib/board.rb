class Board

    attr_reader :board

    def initialize
        @board = Array.new(6){Array.new(7, '.')}
    end

    def display
        puts 'A B C D E F G'
        @board.each {|row| puts row.join(' ')}
    end

    def add_piece(column, piece)
        range = ("A".."G").to_a
        if range.any?(column)
            chosen_column = ('A'..'G').to_a.index(column)
            rows = board.length - 1
            
            while rows >= 0 && @board[rows][chosen_column] != '.'
                rows -= 1
            end

            @board[rows][chosen_column] = piece if rows >= 0
        else
            nil
        end
    end
end
