@passport_values = []
@valid_passport_count = 0
@processed_passport_count = 0
@file_length = 0
@final_total = 0

def read_to_array(file)
    read_lines = File.readlines(file)
    @array = []

    read_lines.each do |line|

        @array << line.gsub("\n",'')
        @file_length += 1

    end
end


def process_array_element

    # # look at the current line
    # # push the value to new arr if not empty
    # # delete element

    while @array[0].length != 0
        @passport_string = @array[0].scan(/\w+\W+\w+/)
        @passport_values.push(@passport_string)
        @passport_values = @passport_values.flatten
        @array.delete_at(0)

        if @array.empty? == true 
            output = File.open( "all_lines.txt", "a" )
            output << @passport_values.sort
            output << "\n"
            output.close
            process_rules
        end

    end

    @array.delete_at(0)

    puts "Leaving process_array_element."
    # puts "OG array members: "+@array.to_s
    puts "Password values array: "+@passport_values.to_s

    output = File.open( "all_lines.txt", "a" )
    output << @passport_values.sort
    output << "\n"
    output.close

    process_rules
end

def overview_length_check
    length = @passport_values.length

    if length == 7
        rule_all_types_present
    end

    if length != 8 
        @processed_passport_count += 1
        puts "This passport does not contain 7 or 8 values - not valid. Moving on..."
        puts "Count of valid passports: "+@valid_passport_count.to_s
        puts "Count of total passports: "+@processed_passport_count.to_s
        puts "-----------"

        output = File.open( "wrong_count_output.txt", "a" )
        output << @passport_values.sort
        output << "\n"
        output.close

        @passport_values = []
        cleanup_check 
    end

end 

def process_rules
    overview_length_check
    rule_all_types_present
end

def rule_all_types_present

    # byr (Birth Year) - four digits; at least 1920 and at most 2002.
    # iyr (Issue Year) - four digits; at least 2010 and at most 2020.
    # eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
    # hgt (Height) - a number followed by either cm or in:
    #     If cm, the number must be at least 150 and at most 193.
    #     If in, the number must be at least 59 and at most 76.
    # hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
    # ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
    # pid (Passport ID) - a nine-digit number, including leading zeroes.
    # cid (Country ID) - ignored, missing or not.

    # Instead of having many small methods, let's do this thing
    # using REGULAR EXPRESSIONS 😈 😈 😈 😈 😈 😈 😈 😈
    passport_types = {
        "byr"  => 'byr:(19[2-9]\d|200[0-2])"',
        "iyr" => 'iyr:20(1[0-9]|20)"',
        "eyr" => 'eyr:20(2[0-9]|30)"',
        "hgt" => 'hgt:(1[5-8][0-9]cm|19[0-3]cm|59in|6[0-9]in|7[0-6]in)"',
        "hcl" => 'hcl:#(\d|[abcdef]){6}"',
        "ecl" => 'ecl:(amb|blu|brn|gry|grn|hzl|oth)"',
        # "cid", We don't actually care about cid, turns out :((
        "pid" => 'pid:\d{9}"'
    }

    passport_types.each { |type, regex|

        passport_string_raw = @passport_values.to_s
        passport_string_match = passport_string_raw.scan(/"#{regex}/)
        @passport_string_length = passport_string_match.length
        @passport_string = passport_string_match.to_s
        
        if @passport_string_length == 0
            puts "No match on passport type - moving on..."
            @processed_passport_count += 1
            puts "Count of valid passports: "+@valid_passport_count.to_s
            puts "Count of total passports: "+@processed_passport_count.to_s
            puts "-----------"

            output = File.open( "wrong_type_output.txt", "a" )
            output << "Invalid char: #{type}"
            output << @passport_values.sort
            output << "\n"
            output.close

            @passport_values = []
            cleanup_check
        else
            puts "Required type #{type} found!"
        end

    }

    puts "Valid passport found - all types found and password has 8 members."
    @processed_passport_count += 1
    @valid_passport_count += 1
    puts "Count of valid passports: "+@valid_passport_count.to_s
    puts "Count of total passports: "+@processed_passport_count.to_s
    puts "-----------"
    output = File.open( "output.txt", "a" )
    output << @passport_values.sort
    output << "\n"
    output.close

    @passport_values = []
    cleanup_check

end

def cleanup_check

    # You arrive here in two ways:
    # the overview length check, or rules_all_types_present
    #
    # this method should check if the original array has anything else to process
    # and if so send off to next step (process_array_element)
    

    if @array.empty? == true
        puts "No more data to process, exiting..."
        puts "Count of TOTAL valid passports: "+@valid_passport_count.to_s
        puts "Count of TOTAL passports: "+@processed_passport_count.to_s
        exit
    else
        process_array_element
    end

end

def cleanup_output_files
    output = File.open( "all_lines.txt", "w" )
    output << ""
    output.close
    output = File.open( "output.txt", "w" )
    output << ""
    output.close
    output = File.open( "wrong_count_output.txt", "w" )
    output << ""
    output.close
    output = File.open( "wrong_type_output.txt", "w" )
    output << ""
    output.close
    
end

cleanup_output_files
read_to_array('test_data.txt')
process_array_element
