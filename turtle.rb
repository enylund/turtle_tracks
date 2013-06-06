class Parser

  def initialize(file_name)

    # Open the input file
    f = File.open(file_name)

    # After opening the file put each line into an array
    f_array_of_lines = f.readlines
    @board_size = f_array_of_lines[0].to_i
    
    # Shift down two lines to work with the files commands
    f_array_of_lines.shift(2)
    f_string = f_array_of_lines.to_s

    # Run a check to see if the word "REPEAT" is present
    # If present, isolate the number of times to repeat 
    # clone the commands that need to be repeated
    if f_string.include?("REPEAT")
	    n = f_string[/REPEAT ([0-9]*)/][$1].to_i
	    repeat_commands_string = f_string[/\[([A-Z0-9 ]*)\]/]
	    repeat_commands_string = repeat_commands_string[$1].lstrip.to_s * n
      f_string = f_string.gsub(/^REPEAT \d* \[[a-zA-Z0-9 ]*\]$/, repeat_commands_string)
    end
  
    # Remove line breaks and split the string into an array around breaks
    f_string = f_string.gsub(/\n/, ' ')
    f_array = f_string.split(' ')
  
    # Create a multi-dim array so that each element is a command
    @f_pairs = []
    f_array.each_slice(2) do |x,y|
	  @f_pairs << [x,y]
    end
  end

  def get_board_size
    @board_size
  end

  def get_command_pairs
    @f_pairs
  end

end

class Turtle

	attr_reader :board

	def initialize(board_size)
		@board = Board.new(self, board_size)
		@y = board_size/2
		@x = board_size/2
		@orientation = 0
		@board.visit(@y, @x)
	end

  def receive_commands(command_pairs)
    command_pairs.each do |cmd_pair|
	  cmd, arg = cmd_pair
	  self.send(cmd, arg.to_i)
    end
  end

	def FD (steps)

		if (@orientation == 0 || @orientation == 360)
			steps.times do
				@y = @y - 1
				@board.visit(@y, @x)
			end

		elsif @orientation == 45
			steps.times do
				@y = @y - 1
				@x = @x + 1
				@board.visit(@y, @x)
			end

		elsif @orientation == 90
			steps.times do
				@x = @x + 1
				@board.visit(@y, @x)
			end

		elsif @orientation == 135
			steps.times do
				@y = @y + 1
				@x = @x + 1
				@board.visit(@y, @x)
			end

		elsif @orientation == 180
			steps.times do
				@y = @y + 1
				@board.visit(@y, @x)
			end

		elsif @orientation == 225
			steps.times do
				@y = @y + 1
				@x = @x - 1
				@board.visit(@y, @x)
			end

		elsif @orientation == 270
			steps.times do
				@x = @x - 1
				@board.visit(@y, @x)
			end

    elsif @orientation == 315
			steps.times do
				@y = @y - 1
				@x = @x - 1
				@board.visit(@y, @x)
			end
		end
	end

	def BK (steps)
		if (@orientation == 0 || @orientation == 360)
			steps.times do
				@y = @y + 1
				@board.visit(@y, @x)
			end

		elsif @orientation == 45
			steps.times do
				@y = @y + 1
				@x = @x - 1
				@board.visit(@y, @x)
			end

		elsif @orientation == 90
			steps.times do
				@x = @x - 1
				@board.visit(@y, @x)
			end

		elsif @orientation == 135
			steps.times do
				@y = @y - 1
				@x = @x - 1
				@board.visit(@y, @x)
			end

		elsif @orientation == 180
			steps.times do
				@y = @y - 1
				@board.visit(@y, @x)
			end

		elsif @orientation == 225
			steps.times do
				@y = @y - 1
				@x = @x + 1
				@board.visit(@y, @x)
			end

		elsif @orientation == 270
			steps.times do
				@x = @x + 1
				@board.visit(@y, @x)
			end

    elsif @orientation == 315
			steps.times do
				@y = @y + 1
				@x = @x + 1
				@board.visit(@y, @x)
			end
		end
	end

	def RT(degrees)
		if degrees%45 == 0
			@orientation = @orientation + degrees
		end
		if @orientation >= 360
			@orientation = @orientation - 360
		end
	end

	def LT(degrees)
		if degrees%45 == 0
			@orientation = @orientation - degrees
		end
		if @orientation <= 0
			@orientation = @orientation + 360
		end
	end

end

class Board

	def initialize (turtle, board_size)
		@turtle = turtle
		@board_size = board_size
		@board_array = Array.new(@board_size, ". ") {Array.new(@board_size, ". ")}
	end

	def visit(y, x)
		@board_array[y][x] = "X "
	end

  def write_board(file_name)
    out_file = File.open(file_name, "w")
    @board_array.each do |line|
      out_file.write line
      out_file.write "\n"
    end
  end
end

class Parser

  def initialize(file_name)

    # Open the input file
    f = File.open(file_name)

    # After opening the file put each line into an array
    f_array_of_lines = f.readlines
    @board_size = f_array_of_lines[0].to_i
    
    # Shift down two lines to work with the files commands
    f_array_of_lines.shift(2)
    f_string = f_array_of_lines.to_s

    # Run a check to see if the word "REPEAT" is present
    # If present, isolate the number of times to repeat 
    # clone the commands that need to be repeated
    if f_string.include?("REPEAT")
	    n = f_string[/REPEAT ([0-9]*)/][$1].to_i
	    repeat_commands_string = f_string[/\[([A-Z0-9 ]*)\]/]
	    repeat_commands_string = repeat_commands_string[$1].lstrip.to_s * n
      f_string = f_string.gsub(/^REPEAT \d* \[[a-zA-Z0-9 ]*\]$/, repeat_commands_string)
    end
  
    # Remove line breaks and split the string into an array around breaks
    f_string = f_string.gsub(/\n/, ' ')
    f_array = f_string.split(' ')
  
    # Create a multi-dim array so that each element is a command
    @f_pairs = []
    f_array.each_slice(2) do |x,y|
	  @f_pairs << [x,y]
    end
  end

  def get_board_size
    @board_size
  end

  def get_command_pairs
    @f_pairs
  end

end


parsed_file = Parser.new("complex.logo")
board_size = parsed_file.get_board_size
command_pairs = parsed_file.get_command_pairs

turtle = Turtle.new(board_size)
turtle.receive_commands(command_pairs)
turtle.board.write_board("complex_out.txt")
