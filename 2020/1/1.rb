
def read_to_array(file)
  read_lines = File.readlines(file)
  @array = []
  
  read_lines.each do |line|
    @array << line.to_i
  end
end

def add_hop_values(array)
  array_length = array.length
  times_headroom = array_length * array_length * array_length
  array_setting = 0
  array_setting_jump = 1
  array_setting_jump_two = 2

  times_headroom.times {
    puts "Combination: "+array_setting.to_s+" "+array_setting_jump.to_s+" "+array_setting_jump_two.to_s
    addition_result = array[array_setting] + array[array_setting_jump] + array[array_setting_jump_two]

    puts "Addition result is: " +addition_result.to_s

    if addition_result == 2020
      puts "we have 2020"
      multiply_nums(array[array_setting], array[array_setting_jump], array[array_setting_jump_two])
      break
    else
      puts "we don't have 2020"
      array_setting_jump_two += 1
    end

    if array_setting_jump_two == array_length 
      array_setting_jump_two = array_setting_jump + 2
      array_setting_jump = array_setting_jump + 1
    end

    if array_setting_jump == array_length - 1
      array_setting += 1
      array_setting_jump = array_setting + 1
      array_setting_jump_two = array_setting + 2
    end

  }
end

def multiply_nums(num1, num2, num3)
  puts "num1 is: " + num1.to_s
  puts "num2 is: " + num2.to_s
  puts "num3 is: " + num3.to_s
  @num_result = num1 * num2 * num3
end
  
read_to_array('test_data_1.txt')
add_hop_values(@array)

puts "The added number is: " + @num_result.to_s
