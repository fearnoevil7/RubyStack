require_relative 'mammal'
class Dog < Mammal
    def pet times=1
        @health += 5 * times
        self
    end
    def walk times=1
        @health -= 1 * times
        self
    end
    def run times=1
        @health -= 10 * times
        self
    end
end
dog = Dog.new
dog.walk(3).run(2).pet.display_health