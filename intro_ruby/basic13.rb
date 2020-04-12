1)
a = (1..255)
puts a.to_a.to_s

# 2)
# a = (1..255)
# puts a.find_all {|i| i % 2 != 0}
# 3) 
# x = [1,3,5,7,9,13]
# sum = 0
# x.each {|i| sum += i}
# puts sum

# 4) 
# x = [1,3,5,7,9,13]
# x.each {|i| print i, "--"}

# 5) 
# x = [1,3,5,7,9,13]
# puts x.max.to_s

# 6) 
# x = [1,3,5,7,9,13]
# puts x.max.to_s

# 7)
# x = [1,3,5,7,9,13]
# sum = 0 
# x.each { |i| sum += i}
# puts avg = sum/x.length

# 8) 
# x = (1..255)
# y = x.reject {|i| i %  2 == 0 }
# puts y.to_a.to_s
# 9)
# x = [1,3,5,7]
# y = 3
# z = x.find_all {|i| i > y}
# puts z.length

# 10)
# x = [1,5,10,-2]
# x.collect {|i| i * i}

# 11)
# x = [1,5,10,-2]
# for i in 0.. x.length - 1
#     if x[i] < 0 
#         x[i] = 0
#     end
# end
# puts x

# 13) 
# x = [1,5,10,7,-2]
# x.delete_at(0)
# x.push(0)
# puts x.to_s

14) 
x = [-1, -3, 2]
for i in 0...x.length
    if x[i] < 0
        x[i] = 'Dojo'
    end
end
puts x