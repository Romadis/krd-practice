require 'rspec'
require_relative 'main_2.rb' 

RSpec.describe "check_word" do

    it "returns 2 to the power of word length if the word ends with 'cs'" do
        expect{check_word("RubyCS")}.to output("64\n").to_stdout
    end
    
    it "returns the reverse of the word if it does not end with 'cs'" do
        expect{check_word("Hello")}.to output("olleH\n").to_stdout 
    end

    it "pocemons" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Pikachu', 'Yellow')
        expect(init_pocemons(1)).to eq([{name: "Pikachu", color: "Yellow"}])
    end

end