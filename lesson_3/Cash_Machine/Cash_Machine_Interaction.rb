require_relative "Cash_Machine.rb"
require_relative "../FileManager"

ABSOLUTE_PATH = "balance.txt"
BUFFER = "buffer"
cash_machine = Cash_Machine.new(FileManager.new(ABSOLUTE_PATH, BUFFER))

unless File.exist?(ABSOLUTE_PATH)
  File.write(ABSOLUTE_PATH, 100.0)
end

while true
  puts "\nВыберите одну из нижеуказанных команд:"
  puts "D: deposit; W: withdraw; B: balance; Q: quit;"
  cmd = gets.chomp
  cmd = cmd.downcase
  case cmd
  when 'd'
    puts "Введите депозит:"
    dep = gets.to_f
    cash_machine.deposite(dep)
    puts "Вы успешно ввели депозит"
  when 'w'
    puts "Введите сумму, которую вы хотите снять:"
    wd = gets.to_f
    begin
      cash_machine.withdraw(wd)
    
      puts "Деньги успешно сняты!"
    end
    when 'b'
      puts "Ваш баланс:"
      puts cash_machine.balance
    when 'q'
      break
  else
    puts "Невозможная команда, повторите снова\n"
  end
end