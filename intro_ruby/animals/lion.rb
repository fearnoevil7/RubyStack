require_relative 'mammal'
class Lion < Mammal
    def initialize
        @health = 170
    end
    def fly times=1
        @health -= 10 * times
        self
    end
    def attack_town times=1
        @health -= 50 * times
        self
    end
    def eat_humans times=1
        @health += 20 * times
        self
    end
    def display
        puts "This is a lion!!!!!!"
        display_health
    end
end
lion = Lion.new
lion.fly.attack_town(3).eat_humans(2).fly(2).display