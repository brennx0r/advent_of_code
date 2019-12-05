
@array = []

def check_length
    puts "Checking the length!"
    if @number.length > 6 or @number.join = @end_number
        exit
    end
end

def run_checks
    puts "Running the checks!"
end

def iterate
    puts "Iterating the number!"
end


def convert_to_array
    puts "Converting input to an array!"
    @array = @start_number.chars
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
    iterate
    run_checks
end

puts "Let's crack some passwords!\n\nWhat is the beginning range for the crack?"
@start_number = gets.strip
puts "Excellent! Now, what is the end of the range?\n"
@end_number = gets.strip

crack