require './lib/board'
require './lib/player'
require './lib/computer'

class Game

    attr_reader :board, :player, :computer, :current_player, :turns_taken

    def initialize
        @board = Board.new
        @player = Player.new
        @computer = Computer.new
        @current_player = @player
        @turns_taken = 0
    end

    def make_new_board
        @board = Board.new
    end

    def welcome_message
        puts 'Welcome to Connect Four'
    end

    def change_current_player
        @current_player = (@current_player == @player) ? @computer : @player
    end

    def player_turn
        puts 'Please select a column between A - G:'
        input = gets.chomp.upcase

        until @player.make_move(input, @board) != nil
            puts 'Please select a valid column between A - G:'
            input = gets.chomp.upcase
        end
    end

    def computer_turn
        until @computer.make_move(@board) != nil
            @computer.make_move(@board)
        end
    end

    def endgame_win
        @board.win?
    end

    def endgame_draw
        @board.draw?
    end

    def take_turn
        loop do
                if @current_player == @player
                    @board.display
                    player_turn
                else
                    computer_turn
                end
                @turns_taken += 1
                    if endgame_win && @current_player == @player
                        puts "You won in a total of #{@turns_taken} turns!"
                        @board.display
                        break
                    elsif endgame_win && @current_player == @computer
                        puts "You lose!"
                        @board.display
                        break
                    elsif endgame_draw
                        puts "The game has ended in a draw!"
                        break 
                    end
                change_current_player
            end
        play_game
    end

    def main_menu
        puts "Press 'P' to play or 'Q' to quit"
        input = gets.chomp.upcase
    end

    def play_game
        make_new_board
        welcome_message
        play_input = main_menu
        loop do
            case play_input
                when 'P'
                    take_turn
                when 'Q'
                    puts 'Goodbye!'
                    break
                else
                    puts 'Please select a valid option'
                    play_input = main_menu
                end
            end
        end
end

game = Game.new
game.play_game
