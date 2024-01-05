require 'matrix'

class Board

    attr_accessor :cells

    def initialize
        @cells = Array.new(6){Array.new(7, '.')}
    end

    def display
        puts '-------------'
        puts 'A B C D E F G'
        puts '============='
        @cells.each {|row| puts row.join(' ')}
        puts '-------------'
    end

    def add_piece(column, piece)
        range = ("A".."G").to_a
        if range.any?(column)
            chosen_column = ('A'..'G').to_a.index(column)
            rows = cells.length - 1
            
            while rows >= 0 && @cells[rows][chosen_column] != '.'
                rows -= 1
            end

            @cells[rows][chosen_column] = piece if rows >= 0
        else
            nil
        end
    end

    def win?
        four_in_a_row_by_row(@cells) ||
        four_in_a_row_by_row(@cells.transpose) ||
        four_in_a_row_by_row(diagonals(@cells)) ||
        four_in_a_row_by_row(diagonals((@cells.transpose.reverse)))
    end

    def four_in_a_row_by_row(cells)
        cells.each do |row|
            a = row.each_cons(4).find { |a| a.uniq.size == 1 && a.first != '.' }
            return true unless a.nil?        
        end
        false
    end

    def diagonals(cells)
        (0..cells.size-4).map do |i|
            (0..cells.size-1-i).map { |j| cells[i+j][j] }
        end.concat((1..cells.first.size-4).map do |j|
            (0..cells.size-j-1).map { |i| cells[i][j+i] }
        end)
    end

    def draw?
        !@cells[0].include?('.')
    end
end