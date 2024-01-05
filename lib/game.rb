require './lib/board'
class Game

    attr_reader :board, :player, :computer, :current_player, :turns_taken

    def initialize
        @board = Board.new
        @player = Player.new
        @computer = Computer.new
        @current_player = @player
        @turns_taken = 0
    end

    def welcome_message
        p 'Welcome to Connect Four'
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
        @player.make_move(input, @board)
    end

    def computer_turn
        until @computer.make_move(@board) != nil
            @computer.make_move(@board)
        end
    end

    def endgame_win
        if @board.win? && @current_player == @player
            puts "You won!"
        elsif @board.win? && @current_player == @computer
            puts "You lose!"
        end
    end

    def endgame_draw
        if @board.draw?
            puts "The game has ended in a draw!"
        end
    end

    def take_turn
        endgame_win
        endgame_draw
        if @current_player == @player
            player_turn
        else
            computer_turn
        end
        @turns_taken += 1
        change_current_player
    end

            

        

end

# GAME FLOW
# game should initialize with a computer and a player object
# Welcome message and main menu where you select to play or quit
# once play is selected, display game board and ask player to choose a column
# will need to track current player through each turn, could be done by cycling through player and computer object, or use a counter
# player chooses column, game board is updated with piece and displayed again
    # can we delay this somehow so that there is a few seconds in between?
    # if player selects invalid column (full or outside of range), it will ask to select a valid column and let them choose again until they choose a valid one
# computer chooses column, game board is update with piece and displayed again
# each turn will check for win? then check for draw? then ask to place piece
    # this will happen before a turn is taken for both player and computer
# once either win? or draw? happens, will display the correct message on whether the player won, lost, or the game was a draw
# after the end game message is displayed, returns player to the main menu to ask to play again or quit

