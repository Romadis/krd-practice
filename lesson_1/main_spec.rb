require 'rspec'
require_relative 'main.rb'

RSpec.describe "main.rb" do 
    it "foobar with two digits unequal 20" do
        expect(foobar(12,18)).to eq(30)
    end 

    it "foobar with digits, which one of them 20" do
        expect(foobar(7,20)).to eq(7)
    end


    it "#greeting more 18" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Владислав', 'Романов', 21)
        expect(greeting).to eq("Привет, Владислав Романов. Самое время заняться делом")
    end

    it "#greeting less 18" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Владислав', 'Романов', 17)
        expect(greeting).to eq("Привет, Владислав Романов. Тебе меньше 18 лет, но начать учиться программировать никогда не рано")
    end

    it "#greeting equal 18" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Владислав', 'Романов', 18)
        expect(greeting).to eq("Привет, Владислав Романов. Самое время заняться делом")
    end
end