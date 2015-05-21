require_relative 'code'

class Solver

    def initialize
    	@tried = Array.new
    	@possibles = Solver.initially_possibles
    end

    def add(code, correct, almost)
    	h = {:code => code, :correct => correct, :almost => almost}
    	@tried << h
    end

    def print
    	puts @tried
    end

    def self.initially_possibles
        initials = Array.new
        0.upto(9999) do |n|
            c = Code.new(n)
            if c.valid?
                initials << c
            end
        end
        initials
    end

    def check
    	new_possibles = Array.new
    	@possibles.each do |c|
			possible = true
    		@tried.each do |h|
    			if not c.same_evaluation?(h[:code], h[:correct], h[:almost])
    				possible = false
    			end
    		end
    		if possible
    			new_possibles << c
    		end
    	end
    	puts "#{new_possibles.length} possibles"
        @possibles = new_possibles
    end

end


if __FILE__ == $0
    s = Solver.new
    s.add(Code.new(1234), 0, 2)
    s.add(Code.new(5678), 2, 0)
    s.add(Code.new(7812), 0, 3)
    s.add(Code.new(5723), 0, 1)
    s.check
end
