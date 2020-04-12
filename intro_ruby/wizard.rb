require_relative 'human'
class Wizard < Human
    def initialize
        @health = 50
        @strength = 3
        @intelligence = 25
        @stealth = 3
    end
    def heal
        if @health < 50
            if @health <= 40
                @health += 10
            else
                @health = 50
            end
            true
        else
            false
        end
    end
    def fireball person
        # if person.class == Human
            puts "Fireball Activated!!!!!!!"
            person.health -= 20
            self
        # end
    end
end

class Ninja < Human
    attr_reader :count
    @count = 0
    def initialize
        @health = 100
        @strength = 3
        @stealth = 175
        @intelligence = 3
        # @count + 1
    end
    def steal person
        # if person.class == Human
            puts "Ninja is attempting stick up"
            @health += 10
            true
        # else
        #     false
        # end
    end
    def get_away
        @health -= 15
    end
end

class Samurai < Human
    @@count = 0
    def initialize
        @health = 200
        @strength = 3
        @intelligence = 3
        @stealth = 3
        @@count += 1
    end
    def death_blow person
        # if person.class == Human
            person.health = 0
        #     true
        # else
        #     false
        # end
    end
    def meditate
        @health = 200
    end
    def how_many
        puts @@count
        @@count
    end
end

wizard = Wizard.new
puts "This wizards health is"
puts wizard.health

puts "This wizards intelligence is"
puts wizard.intelligence

ninja = Ninja.new
puts "This ninja's health is"
puts ninja.health
wizard.fireball(ninja)
puts "This ninja's health is now at"
puts ninja.health
puts "This ninja stealth is"
puts ninja.stealth
ninja.steal(wizard)
puts "Wizard just got jacked and ninja's health is now at"
puts ninja.health
ninja.get_away
puts "Ninja manages to escape but lost some health his health is now at"
puts ninja.health
jack = Samurai.new
puts "Samurai Jack's health is"
puts jack.health
puts "Samurai Jack has stepped onto the battle field and deals a death blow to wizard"
jack.death_blow(wizard)
puts "Wizard has lost all his health his health is now at"
puts wizard.health
puts "Wizard survives by healing his self and his health is now at"
wizard.heal
puts wizard.health
wizard.fireball(jack).fireball(jack).fireball(jack).fireball(jack).fireball(jack).fireball(jack)
puts "Wizard counter attacks Samurai Jack with multiple fireballs Jack's health is now at"
puts jack.health
puts "Samurai Jack sustained heavy damage but manages to heal himself by meditating and his health is now at"
jack.meditate
puts jack.health
kenshin = Samurai.new
jack.how_many
