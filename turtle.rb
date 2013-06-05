class Turtle

	attr_reader :board

	def initialize(board_size)
		@board = Board.new(self, board_size)
		@y = board_size/2
		@x = board_size/2
		@orientation = 0
		@board.visit(@y, @x)
	end

	def FD (steps)

		if @orientation == 0 || @orientation == 360
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

		else @orientation == 315
			steps.times do
				@y = @y - 1
				@x = @x - 1
				@board.visit(@y, @x)
			end
		end
	end

	def BK (steps)
		if @orientation == 0 || @orientation == 360
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

		else @orientation == 315
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
		if @orientation >= 360
			@orientation = @orientation - 360
		end
	end

	def REPEAT(some_method, iterations)
		iterations.times do
			some_method
		end
	end
end

class Board

	def initialize (turtle, board_size)
		@turtle = turtle
		@board_size = board_size
		@board_array = Array.new(@board_size, " .") {Array.new(@board_size, " .")}
	end

	def visit(y, x)
		@board_array[y][x] = " X"
	end

	def draw_board
		@board_array.each do |line|
			print line
			print "\n"
		end
	end
end

f = File.open('simple.logo')
f_lines = f.readlines
board_size = f_lines[0].to_i
f_lines.shift(2)
f_string = f_lines.to_s
if f_string.include?("REPEAT")
	n = f_string[/REPEAT ([0-9]*)/][$1].to_i
	y_string = f_string[/\[([A-Z0-9 ]*)\]/]
	y_string = y_string[$1].lstrip.to_s * n
end

f_string = f_string.gsub(/^REPEAT \d* \[[a-zA-Z0-9 ]*\]$/, y_string)
f_string = f_string.gsub(/\n/, " ")
f_string = f_string.split(' ')


f_pairs = []
f_string.each_slice(2) do |x,y|
	f_pairs << [x,y]
end

turtle = Turtle.new(board_size)

f_pairs.each do |cmd_pair|
	cmd, arg = cmd_pair
	turtle.send(cmd, arg.to_i)
end

	# turtle.to_s.each_slice(board_size) {|x|
	# 	print x
	# 	print "\n"
	# }

out_file = File.open("simple_out.txt", "w")
out_file.write turtle.board.draw_board