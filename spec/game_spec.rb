require 'simplecov'
SimpleCov.start
require './lib/game'
require './lib/board'
require 'pry'

RSpec.describe Game do
    describe '#initialize' do
        it 'exists' do
            game = Game.new

            expect(game).to be_a(Game)
        end
        
        it 'starts with a board' do
            game = Game.new

            expect(game.board).to be_a(Board)
        end

        it 'starts with a player object' do
            game = Game.new

            expect(game.player).to be_a(Player)
        end

        it 'starts with a computer object' do
            game = Game.new
            
            expect(game.computer).to be_a(Computer)
        end

        it 'starts with the player as the current player' do
            game = Game.new

            expect(game.current_player).to be_a(Player)
        end

        it 'starts with 0 turns taken' do
            game = Game.new

            expect(game.turns_taken).to eq(0)
        end
    end

    describe '#make_new_board' do
        it 'create a new board when game over and player selects play again' do
            game = Game.new

            board_1 = game.board
            board_2 = game.make_new_board

            expect(board_1).to_not eq(board_2)
        end
    end

    describe '#change_current_player' do
        it 'will change current player from player to computer' do
            game = Game.new

            expect(game.current_player).to be_a(Player)

            game.change_current_player

            expect(game.current_player).to be_a(Computer)
        end

        it 'will change current player from computer to player' do
            game = Game.new

            expect(game.current_player).to be_a(Player)

            game.change_current_player

            expect(game.current_player).to be_a(Computer)
            
            game.change_current_player

            expect(game.current_player).to be_a(Player)
        end
    end

    # The below tests for take turn pass. The initial approach was to check if changed the current player when called and also add to the turns_taken instance variable. However the method does initiate the game to start and interrupts RSpec. We decided to leave it here for documentation.

    # describe '#take_turn' do
    #     it 'will make a move and change the current player' do
    #         game = Game.new

    #         game.change_current_player
            
    #         expect(game.current_player).to be_a(Computer)

    #         game.take_turn

    #         expect(game.current_player).to be_a(Player)
    #         expect(game.board.cells.last.include?('O')).to eq(true)            
    #     end

    #     it 'will keep track of the number of turns taken' do
    #         game = Game.new

    #         game.change_current_player
    #         game.take_turn

    #         expect(game.turns_taken).to eq(1)
    #     end
    # end

    describe '#computer_turn' do
        it 'takes a turn and adds a piece to the board when the computer is the current player' do
            game = Game.new

            game.change_current_player
            game.computer_turn

            expect(game.board.cells.last.include?('O')).to eq(true)
        end
    end

    describe '#endgame_win' do
        it 'returns true if game over and player won' do
            game = Game.new

            game.board.add_piece('A', 'X')
            game.board.add_piece('A', 'X')
            game.board.add_piece('A', 'X')
            game.board.add_piece('A', 'X')

            expect(game.endgame_win?).to eq(true)
        end

        it 'returns true if game over and computer won' do
            game = Game.new

            game.board.add_piece('A', 'O')
            game.board.add_piece('A', 'O')
            game.board.add_piece('A', 'O')
            game.board.add_piece('A', 'O')

            expect(game.endgame_win?).to eq(true)
        end

        it 'returns false if no one wins' do
            game = Game.new

            game.board.add_piece('A', 'X')
            game.board.add_piece('A', 'X')
            game.board.add_piece('A', 'X')
            game.board.add_piece('B', 'O')
            game.board.add_piece('B', 'O')
            game.board.add_piece('B', 'O')

            expect(game.endgame_win?).to eq(false)
        end
    end

    describe '#endgame_draw?' do
        it 'returns true if it is a draw game' do
            game = Game.new

            game.board.add_piece('A', 'X')
            game.board.add_piece('A', 'X')
            game.board.add_piece('A', 'X')
            game.board.add_piece('A', 'O')
            game.board.add_piece('A', 'X')
            game.board.add_piece('A', 'X')
            game.board.add_piece('B', 'O')
            game.board.add_piece('B', 'O')
            game.board.add_piece('B', 'O')
            game.board.add_piece('B', 'X')
            game.board.add_piece('B', 'O')
            game.board.add_piece('B', 'X')
            game.board.add_piece('C', 'X')
            game.board.add_piece('C', 'O')
            game.board.add_piece('C', 'X')
            game.board.add_piece('C', 'X')
            game.board.add_piece('C', 'X')
            game.board.add_piece('C', 'O')
            game.board.add_piece('D', 'X')
            game.board.add_piece('D', 'O')
            game.board.add_piece('D', 'X')
            game.board.add_piece('D', 'X')
            game.board.add_piece('D', 'X')
            game.board.add_piece('D', 'O')
            game.board.add_piece('E', 'O')
            game.board.add_piece('E', 'X')
            game.board.add_piece('E', 'O')
            game.board.add_piece('E', 'O')
            game.board.add_piece('E', 'O')
            game.board.add_piece('E', 'X')
            game.board.add_piece('F', 'O')
            game.board.add_piece('F', 'O')
            game.board.add_piece('F', 'X')
            game.board.add_piece('F', 'O')
            game.board.add_piece('F', 'X')
            game.board.add_piece('F', 'X')
            game.board.add_piece('G', 'O')
            game.board.add_piece('G', 'O')
            game.board.add_piece('G', 'X')
            game.board.add_piece('G', 'O')
            game.board.add_piece('G', 'X')
            game.board.add_piece('G', 'O')

            expect(game.endgame_draw?).to eq(true)
        end

        it 'returns false if it is not a draw game' do
            game = Game.new

            expect(game.endgame_draw?).to eq (false)
        end
    end

    describe '#player_selector' do
        it 'will make the computer take turn when computer is the current player' do
            game = Game.new

            game.change_current_player

            game.player_selector

            expect(game.board.cells.last.include?('O')).to eq(true)
        end
    end
end