class AppleTree
    attr_accessor :age
    attr_reader :height, :count
    def initialize
        @age = 0
        @height = 10
        @count = 0
    end
    def years_gone_by
        @age += 1
        @height *= 1.1
        # puts "height is #{@height}"
        if  @age <= 10 && @age > 3
            @count += 2
        end
        # puts "age is #{@age}"
        # puts "apple count is #{@count}"
    end
    def pickApples
        @count = 0
        # puts "apples have been picked and apple count is now #{@count}"
    end
end
tree = AppleTree.new
puts tree.height
puts tree.years_gone_by
puts tree.years_gone_by
puts tree.years_gone_by
puts tree.years_gone_by
puts tree.years_gone_by
puts tree.years_gone_by
puts tree.years_gone_by
puts tree.years_gone_by
puts tree.years_gone_by
puts tree.years_gone_by
puts tree.years_gone_by
puts tree.pickApples
