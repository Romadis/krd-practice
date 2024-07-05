def greeting 
    puts "Введите ваше имя:"
    name = gets.chomp

    puts "Введите вашу фамилию:"
    surname = gets.chomp

    puts "Введите ваш возраст:"
    age = gets.chomp.to_i

    if age < 18
        puts "Привет, #{name} #{surname}. Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
    
    else
        puts "Привет, #{name} #{surname}. Самое время заняться делом"
    end
end

def foobar(num1, num2)
    if num1 == 20 || num2 == 20
        return num1 == 20 ? num2: num1
    else
        return num1 + num2
    end
end