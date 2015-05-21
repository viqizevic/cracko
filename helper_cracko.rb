require_relative 'solver'
require_relative 'code'

greeting = "Welcome! Here is your Helper!"
puts greeting

s = Solver.new
loop do
    puts "\nEnter your guessed code? ('quit' to exit)"
    guessed = gets.chomp.downcase
    case guessed
    when /^\d+$/
        c = Code.new(guessed)
        if not c.valid?
            puts "You should enter valid code! 4 digits from {1, 2, ... , 9} and varying."
        else
            puts "\nHow many are correct?"
            correct = gets.chomp.downcase
            case correct
            when /^\d$/
                puts "\nHow many are almost?"
                almost = gets.chomp.downcase
                case almost
                when /^\d$/
                    s.add(c, correct.to_i, almost.to_i)
                    s.check
                else
                    puts "Please enter one digit"
                end
            else
                puts "Please enter one digit"
            end
        end
    when 'quit', 'exit', 'q'
        break
    else
        puts "Please enter a number or 'quit'"
    end
end
