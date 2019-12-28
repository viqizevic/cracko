require_relative 'game'

greeting = "Welcome to Cracko game!"
puts greeting
puts Time.now.strftime("Game starts on %A %m/%d/%Y at %I:%M%p")

g = Game.new

loop do
    puts "\nEnter your guess code? ('quit' to exit)"
    answer = gets.chomp.downcase
    case answer
    when /^\d+$/
        c = Code.new(answer)
        if not c.valid?
            puts "You should enter valid code! 4 digits from {1, 2, ... , 9} and varying."
        else
            g.pass_guess(c)
            puts g.progress
            break if g.finish?
        end
    when 'quit', 'exit', 'q'
        break
    else
        puts "Please enter a number or 'quit'"
    end
end
