@bags_result_list_array = []
@values_to_process = []

def read_to_array(file)
    read_lines = File.readlines(file)
    @bag_rules_array  = []

    read_lines.each do |line|
        scrubbed_line = line.scan(/\w+\s\w+\sbag/)
        @bag_rules_array << scrubbed_line
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
        elsif rule[1].include?(value)
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

read_to_array('test_data_sample.txt')
process_array

puts @bags_result_list_array.to_s