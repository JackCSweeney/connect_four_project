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
        chosen_column = ('A'..'G').to_a.index(column)
        counter = 0
        @board.reverse_each do |row|
            if row[chosen_column] == '.' && counter < 7
                row[chosen_column] = piece
                counter += 7
            elsif counter == 6
                puts 'Please select a valid column'
            else
                counter += 1
            end
        end
    end
end
