require_relative 'code'

class Game
    
    def initialize(code)
        @code = code
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
            result = "Correct!"
        else
            if nil != @last_guess
                n = @code.correctly_placed_numbers(@last_guess)
                m = @code.almost_correct(@last_guess)
                result = "#{n} numbers are correctly placed"
                if 0 == m
                    result += "."
                else
                    result += "; #{m} almost correct."
                end
            end
        end
        result
    end
    
end
