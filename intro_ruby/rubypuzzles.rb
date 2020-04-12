1) 
x = [3,5,1,2,7,9,8,13,25,32]
sum = 0
x.each { |i| sum += i }
x.find_all {|i| i > 10}
puts sum

2) 
x = ['John', 'KB', 'Oliver', 'Cory', 'Matthew', 'Christopher']
x.shuffle!
puts x
x.reject {|i| i.length < 6}

3) z = ("a".."z")
y = z.to_a.shuffle!
if y.first == "a" || y.first == "e" || y.first == "i" || y.first == "o" || y.first == "u"
    puts "It is a vowel!"
end
puts y.first
puts y.last

4)
x = (55..100)
x.to_a.shuffle!
i = 0
y = []
while i < 11 do
    y.push(x[i])
    i += 1
end

numbers_array = []
10.times do
    numbers_array.push(rand(55..100))
end
puts numbers_array

5) numbers_array = []
10.times do
    numbers_array.push(rand(55..100))
end
puts numbers_array
numbers_array.sort!{|a, b| a <=> b }
puts "smallest number in array *******"
puts numbers_array.min
puts "largest number in array *******"
puts numbers_array.max

6) 
(1..5).map { ('a'..'z').to_a[rand(26)] }.join

(1..5).map { (65 + rand(26)).chr }.join

7)
def GenerateRandomStrings
    for i in 0..9
        puts (1..5).map { (65 + rand(26)).chr }.join
    end
end
Array.new.GenerateRandomStrings.to_a

randomStrings = Array.new(10, (1..5).map { (65 + rand(26)).chr }.join)