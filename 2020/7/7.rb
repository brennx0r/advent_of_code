@bags_result_list_array = []
@values_to_process = []
@bag_counts = []
@bag_count = 0
@formulas_to_process = []

def read_to_array(file)
    read_lines = File.readlines(file)
    @bag_rules_array  = []

    read_lines.each do |line|
        # part_one(line)
        part_two(line)
    end
end

def process_array
    rule_match("shiny gold bag")
    send_next_rule_match
end

def rule_match(value)
    @bag_rules_array.each { |rule|
        if rule[0].include?(value)
            rule = []
        elsif rule[1..10].include?(value)
            @bags_result_list_array.push(rule[0])
            @values_to_process.push(rule[0])
            rule = []
        end
    }    
end

def send_next_rule_match
    while @values_to_process.length != 0
        next_value = @values_to_process[0]
        @values_to_process.delete_at(0)
        rule_match(next_value)
    end
end

def part_one(line)
    scrubbed_line = line.scan(/\w+\s\w+\sbag/)
    @bag_rules_array << scrubbed_line
end

def part_two(line)
    key_bag = line.scan(/^\w+\s\w+/)
    scrubbed_line = line.scan(/\d\s\w+\s\w+/)
    @bag_counts << key_bag+scrubbed_line
end

def find_current_formula(bag_type, number_value)
    puts " --------------- "
    puts "Bag_type is #{bag_type}"
    puts "Number is "+number_value.to_s

    @bag_counts.each { |rule|
        # puts rule.to_s
        if rule[0].include?(bag_type)
            number_value.times{
                @formulas_to_process.push(rule[1..rule.length]).flatten!
            }  

        end   
        
    }   
    # puts "Number of formulas to process: "+@formulas_to_process.to_s

    if @formulas_to_process.length == 0
        puts "no more formulas to find - exiting..."
        puts "GRAND TOTAL of bags: "+@bag_count.to_s
        exit
    else
        assess_next_formula
    end
end

def assess_next_formula
    formula = @formulas_to_process[0]
    bag_type = formula.to_s.gsub(/\d+/, '').strip
    number_bags = formula.to_s.gsub(/[a-z]+/, '').to_i
    @formulas_to_process.delete_at(0)
    @bag_count += number_bags
    puts "Total number of bags so far: "+@bag_count.to_s

    find_current_formula(bag_type, number_bags)
end

read_to_array('test_data.txt')
find_current_formula("shiny gold", 1)
