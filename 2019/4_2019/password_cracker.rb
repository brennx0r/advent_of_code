@other_match_results = []
@match_results = []
@array = []

def check_length
    puts "Checking the length!"
    if @array.length >  6 or  @string.to_i > @end_number.to_i
        puts "End of list - exiting"
        puts "Total number of first pass matches: "+@match_results.length.to_s
        puts "Total number of second pass matches: "+@other_match_results.length.to_s
        final_match_results = @match_results.length - @other_match_results.length
        puts "Match results list: "+final_match_results.to_s
        puts @other_match_results.to_s
        exit
    end
end

def adjacent_digit_match
    puts "Running adjacent match check!"
    if @string.match('((0{2}|0{4})|(1{2}|1{4})|(2{2}|2{4})|(3{2}|3{4})|(4{2}|4{4})|(5{2}|5{4})|(6{2}|6{4})|(7{2}|7{4})|(8{2}|8{4})|(9{2}|9{4}))')
    puts "Match!"
        @match_results.push(@string)
    end
end

def other_adjacent_digit_match
    puts "Running OTHER adjacent match check!"
    if @string.match('(00|11|22|33|44|55|66|77|88|99)(00|11|22|33|44|55|66|77|88|99)(00|11|22|33|44|55|66|77|88|99)')
        puts "Match!"
        @other_match_results.push(@string)
    else
        iterate
    end

end

def increase_check
    puts "Checking the increase rule!"
    # Going from left to right, the digits never decrease; they only ever increase or stay the same (like 111123 or 135679).
    element = 0

    6.times {
    check_length      
    if @array[element+1] == nil
        next
    end    

    if @array[element] > @array[element+1]
        puts "This is not a good number - jumping the number and moving on."
        jump_number = @array[element].to_i
        @array.delete_at(element+1)
        @array.insert(element+1, jump_number.to_s)
        puts "Array updated: "+@array.to_s
        convert_to_string
        puts "String updated: "+@string
    end
    element += 1
    }
end 

def run_checks
    puts "Running the checks!"
    increase_check
    adjacent_digit_match
    other_adjacent_digit_match
    check_length
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

def process_incoming
    convert_to_array
    new_integer = @array[0].to_i
 
    6.times {
        @array.delete_at(1)
        @array.push(new_integer.to_s)
        puts @array.to_s 
    }  

    convert_to_string 
    crack      
end

# puts "Let's crack some passwords!\n\nWhat is the beginning range for the crack?"
@start_number = "402328"
# puts "Excellent! Now, what is the end of the range?\n"
@end_number = "864247"  
#@end_number = "444457"
process_incoming

