class Racecar
    attr_accessor :number, :model, :color, :engine
    attr_reader :races, :races_won
    def initialize(number, model, color = white, engine)
        @Digit = number
        @Model = model
        @Color = color
        @Block = engine
        @@races = 0
        @races_won = 0
    end
    def announce 
        puts "Hello  Number #{@Digit}"
    end
    def display_all
        puts "Number: #{@Digit}"
        puts "Model: #{@Model}"
        puts "Color: #{@Color}"
        puts "Engine: #{@Block}"
        puts "Races competed in so far #{@@races}"
        puts "Races won: #{@races_won}"
    end

    def race (win = 0)
        @@races += 1
            if win == "win"
                @races_won += 1
            end
    end

end
Yoshi = Racecar.new(1, "GoKartTurbo", "Green and Yellow", "150cc")
Yoshi.display_all
Yoshi.announce
Yoshi.race
Yoshi.race("win")
Yoshi.display_all