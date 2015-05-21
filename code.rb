class Code
    attr_reader :code
    
    def initialize(code)
        @code = code.to_s.split('').map {|x| x.to_i}
    end
    
    def to_s
        "Code is: #{@code.join}"
    end
    
    def eql?(other)
        @code.eql?(other.code)
    end

    def valid?
        size_is_four? and not has_zero? and has_varying_numbers?
    end

    def size_is_four?
        4 == @code.length
    end

    def has_zero?
        n = @code.length-1
        has_zero = false
        0.upto(n) do |i|
            if 0 == @code[i]
                has_zero = true
            end
        end
        has_zero
    end
    
    def same_numbers(other)
        n = @code.length-1
        m = 0;
        0.upto(n) do |i|
            0.upto(n) do |j|
                m = m+1 if @code[i] == other.code[j]
            end
        end
        m
    end
    
    def correctly_placed_numbers(other)
        n = 0;
        0.upto(@code.length-1) do |i|
            n = n+1 if @code[i] == other.code[i]
        end
        n
    end

    def almost_correct(other)
        same_numbers(other) - correctly_placed_numbers(other)
    end
    
    def has_varying_numbers?
        varying_numbers = true
        n = @code.length-1
        0.upto(n) do |i|
            (i+1).upto(n) do |j|
                varying_numbers = false if @code[i] == @code[j]
            end
        end
        varying_numbers
    end

    def same_evaluation?(code, correct, almost)
        c = correctly_placed_numbers(code) == correct
        d = almost_correct(code) == almost
        c and d
    end

end

if __FILE__ == $0
    c = Code.new("5432")
    puts c
    
    d = Code.new("5236")
    puts d
    
    puts c.same_numbers(d)
    
    puts c.has_varying_numbers?
end
