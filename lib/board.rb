require 'matrix'

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

    def win?
        @board.each do |row|
            row.each_cons(4) do |group|
                if group.join == 'XXXX' || group.join == 'OOOO'
                    return true
                end
            end
        end
        
        @board.transpose.each do |row|
            row.each_cons(4) do |group|
                if group.join == 'XXXX' || group.join == 'OOOO'
                    return true
                end
            end
        end
    end
end
# matrix = []
        # Matrix.rows(@board).each do |row|
        #     # matrix << diagonal
        #     require 'pry';binding.pry
        # end
        (0..3) (i=var.length; i--) do
            (0..4) (j=another_var.length; j--)
        end