require_relative 'code'

describe Code do
    
    before do
        $stdout = StringIO.new
        @code1 = Code.new(1234)
        @code2 = Code.new(1234)
        @code3 = Code.new(4321)
    end
    
    it "has a string representation" do
        expect(@code1.to_s).to eq("Code is: 1234")
    end
    
    it "has a correct eql method" do
        expect(@code1.eql?(@code2)).to be_truthy
        expect(@code1.eql?(@code3)).to be_falsey
    end
    
    it "has a correct method to check numbers diversity" do
        expect(@code1.has_varying_numbers?).to be_truthy
        expect(Code.new(1123).has_varying_numbers?).to be_falsey
    end
    
    it "has a correct method to count correctly placed numbers" do
        expect(@code1.correctly_placed_numbers(@code2)).to eq(4)
        expect(@code1.correctly_placed_numbers(@code3)).to eq(0)
        expect(@code1.correctly_placed_numbers(Code.new(1257))).to eq(2)
        expect(@code1.correctly_placed_numbers(Code.new(5731))).to eq(1)
    end
    
    it "has a correct method to count same numbers" do
        expect(@code1.same_numbers(@code2)).to eq(4)
        expect(@code1.same_numbers(@code3)).to eq(4)
        expect(@code1.same_numbers(Code.new(5712))).to eq(2)
        expect(@code1.same_numbers(Code.new(5719))).to eq(1)
    end

    it "has a correct method for validity" do
        expect(@code1.valid?).to be_truthy
        code4 = Code.new("0123")
        expect(code4.valid?).to be_falsey
        code5 = Code.new(1123)
        expect(code5.valid?).to be_falsey
        code6 = Code.new(12345)
        expect(code6.valid?).to be_falsey
    end

    it "has a correct method to check if code meet the same evaluation" do
        guess = Code.new(1234)
        code = Code.new(1235)
        correct = code.correctly_placed_numbers(guess)
        almost = code.almost_correct(guess)
        code2 = Code.new(1236)
        expect(code2.same_evaluation?(guess, correct, almost)).to be_truthy
    end

end