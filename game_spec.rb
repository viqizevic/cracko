require_relative 'game'

describe Game do
    
    before do
        @code = Code.new(1234)
        @game = Game.new(@code)
        #$stdout = StringIO.new
    end
    
    it "shows the end of the game correctly" do
        expect(@game).not_to be_finish
        
        @game.pass_guess(Code.new(1235))
        expect(@game).not_to be_finish
        
        @game.pass_guess(@code)
        expect(@game).to be_finish
    end
    
    it "gives user correct progress after pass of new guess" do
        @game.pass_guess(Code.new(1235))
        expect(@game.progress).to eq("3 numbers are correctly placed.")
        
        @game.pass_guess(Code.new(1243))
        expect(@game.progress).to eq("2 numbers are correctly placed; 2 almost correct.")
        
        @game.pass_guess(@code)
        expect(@game.progress).to eq("Correct!")
    end
    
end