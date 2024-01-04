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

    def four_in_a_row_by_row(board)
        board.each do |row|
            a = row.each_cons(4).find { |a| a.uniq.size == 1 && a.first != '.' }
            return true unless a.nil?        
        end
        nil
    end

    def diagonals(board)
        (0..board.size-4).map do |i|
            (0..board.size-1-i).map { |j| board[i+j][j] }
        end.concat((1..board.first.size-4).map do |j|
            (0..board.size-j-1).map { |i| board[i][j+i] }
        end)
    end
end