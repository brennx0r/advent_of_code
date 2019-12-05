
@array = []

def check_length
    puts "Checking the length!"
    if @array.length > 6 or @array.join == @end_number
        exit
    end
end

def adjacent_digit_match
    puts "Running adjacent match check!"
    if @string.match('.*(00|11|22|33|44|55|66|77|88|99).*')
        puts "Match!"
        puts "Resulting number: "+@string
        exit
    end
end

def increase_check
    puts "Checking the increase rule!"
    # Going from left to right, the digits never decrease; they only ever increase or stay the same (like 111123 or 135679).
    element = 0
    7.times
    if @array[element] > @array[element+1]
        puts "increase check failed - bailing."
        exit
        element += 1
    end
end 

def run_checks
    puts "Running the checks!"
    check_length
    adjacent_digit_match
    increase_check
end

def iterate
    puts "Iterating the number!"
    number = @string.to_i
    number += 1
    @string = number.to_s
    crack
end


def convert_to_array
    puts "Converting input to an array!"
    if @array == []
        @array = @start_number.chars
    else
        @array = @string.chars
    end
    puts "Array created: "+@array.to_s
end

def convert_to_string
    puts "Converting array to string!"
    @string = @array.join
    puts "String created: "+@string
end



def crack
    convert_to_array
    convert_to_string
    run_checks
    iterate
end

puts "Let's crack some passwords!\n\nWhat is the beginning range for the crack?"
@start_number = gets.strip
puts "Excellent! Now, what is the end of the range?\n"
@end_number = gets.strip

crack