require_relative '../FileManager.rb'

ABSOLUTE_PATH = "students.txt"
BUFFER = "buffer.txt"
RESULT_PATH = "result.txt"
flManager = FileManager.new(ABSOLUTE_PATH, BUFFER)
resultManager = FileManager.new(RESULT_PATH, BUFFER)
File.truncate(RESULT_PATH, 0)

while true
  puts "О студентах какого возраста вы хотите узнать? Внесите -1, если хотите закончить!"
  age = gets.to_i
  break if age==-1
  students = flManager.where(age.to_s)
  students.each do |student|
    resultManager.create(student)
  end
end
puts"\nРезлуьтат:"
resultManager.index