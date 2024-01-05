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

    describe '#welcome_message' do
        it 'has a welcome message for the game' do
            game = Game.new

            expect(game.welcome_message).to eq('Welcome to Connect Four')
        end
    end

    describe '#change_current_player & #current_player' do
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

    describe '#take_turn' do
        it 'will make a move and change the current player' do
            game = Game.new

            expect(game.current_player).to be_a(Player)

            game.take_turn

            expect(game.current_player).to be_a(Computer)
            expect(game.board.cells.last.include?('X')).to eq(true)            
        end

        it 'will keep track of the number of turns taken' do
            game = Game.new

            game.take_turn

            expect(game.turns_taken).to eq(1)
        end
    end

    # describe '#player_turn' do
end