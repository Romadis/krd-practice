require 'rspec'
require_relative 'main.rb'

RSpec.describe "main.rb" do 
    it "foobar with two digits unequal 20" do
        expect(foobar(12,18)).to eq(30)
    end 

    it "foobar with digits, which one of them 20" do
        expect(foobar(7,20)).to eq(7)
    end
end 


    