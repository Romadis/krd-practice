def check_word(word)
    if word.downcase.end_with?("cs")
        puts 2**word.length
    else
        puts word.reverse
    end
end
print "Введите слово: "
input_word = gets.chomp
check_word(input_word)

class Pocemon
    def initialize(name,color)
        @name = name 
        @color = color
    end

    def to_str
        "{name: #{@name}, color: #{@color}}"
    end
end

def init_pocemons(count)
    pocemons = []
    count.times do
        puts "Enter the name of pocemon"
        name = gets.chomp
        puts "Enter the color of pocemon"
        color = gets.chomp
        #pocemons << Pocemon.new(name, color)
        pocemons<< {name: name, color: color}
    end
    pocemons
end

def pocemons_to_str(pocemons)
    "["+pocemons.join(", ")+"]"
end

puts "How much pocemons do you want?"
count = gets.to_i
pocemons = init_pocemons(count) 
puts pocemons

puts pocemons_to_str(pocemons)

