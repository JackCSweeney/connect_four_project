require './lib/board'
class Game

    attr_reader :board

    def initialize
        @board = Board.new
    end

    def welcome_message
        p 'Welcome to Connect Four'
    end
end