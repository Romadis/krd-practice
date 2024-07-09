require_relative "../FileManager.rb"
require_relative "../Cash_Machine/Cash_Machine.rb"
require "rspec"

RSpec.describe FileManager, "CRUD in files. FileManager class test" do
  subject do 
    FileManager.new("students_test.txt", "buffer_test.txt")
  end
  before do
    subject.create("Романов Владислав")
    subject.create("Гринев Кирилл")
    subject.create("Черненко Оксана")
    subject.create("Ольховой Даниил")
  end

  it "find" do
    expect(subject.find(1)).to eq("Гринев Кирилл")
  end

  it "where" do
    expect(subject.where("Владислав")).to eq(["Романов Владислав"])
  end

  it "update" do 
    subject.update(0, "Романов Владислав")
    expect(subject.find(0)).to eq("Романов Владислав")
  end

  it "delete" do
    subject.delete(0)
    expect(subject.find(0)).to eq("Гринев Кирилл")
  end

  it "create" do
    subject.create("Парфинцов Егор")
    expect(subject.find(4)).to eq("Парфинцов Егор")
  end

  after{File.delete("students_test.txt")}
end 

RSpec.describe Cash_Machine, "ATM machine" do
  subject do
    Cash_Machine.new(FileManager.new("balance.txt", "buffer.txt"))
  end

  before do
    file = File.open("balance.txt", "w")
    file.puts("100.0")
    file.close()
  end

  it "balance" do
    expect(subject.balance).to eq("100.0")
  end

  it "deposite" do
    subject.deposite(150)
    expect(subject.balance).to eq("250.0")
  end

  it "withdraw" do
    subject.withdraw(50)
    expect(subject.balance).to eq("50.0")
  end
  
  after do
    File.delete("balance.txt")
  end
end