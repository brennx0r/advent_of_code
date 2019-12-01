def input(file) 
    @file_arr = File.readlines(file)
end

def required_fuel(file_arr)
    module_fuel = []
    file_arr.each do |mass|
        required_fuel = (mass.to_i / 3).round - 2
        module_fuel.push(required_fuel)
    end
    puts module_fuel.inject(0){|sum,x| sum + x }
end

def run_tests
    required_fuel(input('input-test.txt'))
end

required_fuel(input('input.txt'))
#run_tests