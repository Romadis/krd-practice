require "rspec"
require_relative "../Cash_Machine/CashMachine.rb"

RSpec.describe CashMachine, "ATM machine" do
  subject do
    CashMachine.new("balance.txt")
  end

  before do
    file = File.open("balance.txt", "w")
    file.write("100.0")
    file.close()
  end

  it "init with deposite" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('d', '200', 'q')
    subject.init
    expect(File.read("balance.txt").strip).to eq("300.0")
  end

  it "init with withdraw" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('d', '200', 'w', '150', 'q')
    subject.init
    expect(File.read("balance.txt").strip).to eq("150.0")
  end

  it "init" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return('s', 'd', '200', 's', 'Q')
    subject.init
    expect(File.read("balance.txt").strip).to eq("300.0")
  end

  after do
    File.delete("balance.txt")
  end
end