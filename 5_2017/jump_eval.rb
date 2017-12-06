@current_location = 0
@step = 0

def get_value
	@current_value = @array[@current_location]
	return @current_value
end

def iterate_value
  if @current_value > 2
    new_value = @current_value - 1
  else
	  new_value = @current_value + 1
  end
	@array[@current_location] = new_value
end

def move
	new_location = @current_value + @current_location
	@current_location = new_location
	# puts "New location is "+new_location.to_s
	# puts "Current location is "+@current_location.to_s	
	# puts "Array state: "+@array.to_s
	@step += 1
end

def is_out
	if @array[@current_location] == nil
		puts "Out of the array! The number of steps taken were :  "+@step.to_s
    # puts "Result array value: "+@array.to_s
		exit!
	end
end

def process_turn(input)
	10000000000000000.times {
	get_value
	iterate_value
	move
	is_out
}
end

def read_to_array(file)
  read_lines = File.readlines(file)

  @array = []
  read_lines.each do |line|
  @array << line.to_i
  end
end

process_turn(read_to_array('input_data.txt'))
# process_turn(read_to_array('test_example.txt'))