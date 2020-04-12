
def guess_number guess
    number = 25
    unless guess != number
        puts "You got it!"
    else
        unless guess < number
            puts "Guess was too high!"
        else
            puts "Guess was too low!"
        end
    end
end

guess_number 21