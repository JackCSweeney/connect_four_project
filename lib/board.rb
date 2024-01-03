class Board

    attr_reader :board

    def initialize
        @board = Array.new(6){Array.new(7, '.')}
    end

    def display
        puts 'A B C D E F G'
        @board.each {|row| puts row.join(' ')}
    end
end
