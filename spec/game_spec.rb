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

        # can make game also create new instances of player, computer
    end

    describe '#welcome_message' do
        it 'has a welcome message for the game' do
            game = Game.new

            expect(game.welcome_message).to eq('Welcome to Connect Four')
        end
    end
end