
@module_fuel = []
@fuel_agg = [] 

def input(file) 
    @file_arr = File.readlines(file)
end

def fuel_of_fuel 
    @module_fuel.each do |num|
        fuel_of_fuel = (num.to_i / 3).round - 2

        if fuel_of_fuel < 0
            fuel_of_fuel == 0
            next
        end

        @module_fuel.push(fuel_of_fuel)
        @fuel_agg.push(fuel_of_fuel)
        puts @module_fuel.to_s
        puts @module_agg.to_s
    end
end



def required_fuel(file_arr)
    file_arr.each do |mass|
        required_fuel = (mass.to_i / 3).round - 2
        @module_fuel.push(required_fuel)
    end
    fuel_sum = @module_fuel.inject(0){|sum,x| sum + x }
    @fuel_agg.push(fuel_sum)
    fuel_of_fuel
end

def run_tests
    required_fuel(input('input-test.txt'))
end

required_fuel(input('input.txt'))
#run_tests

puts "Total in agg: "+@fuel_agg.inject(0){|sum,x| sum + x }.to_s