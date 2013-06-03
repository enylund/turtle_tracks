
def initialize (grid_size)
	total_grid_size = grid_size * grid_size
	grid = Array.new(total_grid_size," .")
	initial_position = total_grid_size/2
	grid[initial_position]=" X"
	grid.each_slice(grid_size) { |x|
	  puts x.join
	}
end




def draw_canvas (grid_size)
	grid = Array.new((grid_size * grid_size)," .")
	grid.each_slice(grid_size) { |x|
	  puts x.join
	}
end

initialize (11)

# draw_canvas (11)

# FD x

# RT x

# LT x

# BK x

# REPEAT x

# out_file = File.open("simple_out.txt", "w")
# out_file.puts draw_canvas
# out_file.close