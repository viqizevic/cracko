require_relative 'code'

class Game
    
    def initialize
        @code = Code.new(rand(1234..9876))
        while not @code.valid?
            @code = Code.new(rand(1234..9876))
        end
        @last_guess = nil
    end
    
    def finish?
        f = false
        if nil != @last_guess
            f = true if @code.eql? @last_guess
        end
        f
    end
    
    def pass_guess(code)
        @last_guess = code
    end
    
    def progress
        result = "Ready for a guess."
        if finish?
            result = "Correct! Well done! You found it!"
        else
            if nil != @last_guess
                n = @code.correctly_placed_numbers(@last_guess)
                m = @code.almost_correct(@last_guess)
                result = "Perfectly placed: #{n}"
                if 0 == m
                    result += "."
                else
                    result += "\nAlmost correct (wrongly placed): #{m}."
                end
            end
        end
        result
    end
    
end
