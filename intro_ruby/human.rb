class Human
    attr_accessor :strength, :intelligence, :stealth, :health
    def initialize
        @health = 100
        @strength = 3
        @intelligence = 3
        @stealth = 3
    end
    def attack person
        if person.class == Human
            puts "Commencing attack!!!!!!!"
            person.health -= 10
        end
    end
    def display
        puts "This person's health is #{@health}"
    end
end
# sugar_ray = Human.new
# duran = Human.new

# sugar_ray.attack(duran)
# puts duran.display
# puts sugar_ray.display
# puts duran.class
