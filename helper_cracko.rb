require_relative 'solver'
require_relative 'code'


def add_guessed(solver, guessed)
    c = Code.new(guessed)
    if not c.valid?
        puts "You should enter valid code! 4 digits from {1, 2, ... , 9} and varying."
    else
        ask_correct(solver, c)
    end
end

def ask_correct(solver, code)
    puts "How many are correct?"
    correct = gets.chomp.downcase
    case correct
    when ""
        ask_almost(solver, code, 0)
    when /^\d$/
        ask_almost(solver, code, correct)
    when /^\d \d$/
        solver.add(code, correct[0].to_i, correct[2].to_i)
        check(solver)
    else
        puts "Please enter one digit"
    end
end

def ask_almost(solver, code, correct)
    puts "How many are almost correct?"
    almost = gets.chomp.downcase
    case almost
    when ""
        solver.add(code, correct.to_i, 0)
        check(solver)
    when /^\d$/
        solver.add(code, correct.to_i, almost.to_i)
        check(solver)
    else
        puts "Please enter one digit"
    end
end

def check(solver)
    p = solver.check
    if p.length <= 10
        p.each do |c|
            puts c
        end
    end
end


greeting = "Welcome! Here is your Helper!"
puts greeting

s = Solver.new
loop do
    puts "\nEnter your guessed code? ('quit' to exit, 'r' to reset)"
    guessed = gets.chomp.downcase
    case guessed
    when /^\d+$/
        add_guessed(s, guessed)
    when 'reset', 'r'
        s = Solver.new
        puts "Reset done."
    when 'quit', 'exit', 'q'
        puts "Ciao!"
        break
    else
        puts "Please enter a number or 'quit'"
    end
end
