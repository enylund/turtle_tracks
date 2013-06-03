# # What is a proc?
# toast = Proc.new do
# 	puts "cheers!"
# end

# say_hello = Proc.new do
# 	puts "Hello!"
# end

# # Procs can take args
# doYouLike = Proc.new do |some_thing|
# 	puts "I really like #{some_thing}"
# end

# # doYouLike.call('pandas')
# # doYouLike.call('cheese')

# # methods can take procs as args (eg maybe, twice)
# def maybeDo (a_proc)
# 	if rand(2) == 1
# 		a_proc.call
# 	end
# end

# def twiceDo (a_proc)
# 	a_proc.call
# 	a_proc.call
# end

# def twiceDoWithArg (a_proc, arg)
# 	a_proc.call(arg)
# 	a_proc.call(arg)
# end

# # maybeDo toast
# # maybeDo toast
# # maybeDo toast
# # twiceDoWithArg doYouLike, 'pandas'

# # methods can return procs
# def compose(proc1, proc2)
# 	Proc.new do |x|
# 		proc2.call(proc1.call)
# 	end
# end

# double = Proc.new do |x|
# 	2 * x
# end

# square = Proc.new do |x|
# 	x * x
# end

# puts double.call(10)
# puts square.call(100)

# doubleThenSquare = compose(double, square)
# squareThenDouble = compose(square, double)

# puts doubleThenSquare.call(4)
# puts squareThenDouble.call(4)

# profile

# def profile(a_proc)
# 	start_time = Time.now
# 	a_proc.call
# 	end_time = Time.now
# 	duration = end_time - start_time

# 	puts "Elapsed Time: #{duration} seconds"
# end

# count_to_a_million = Proc.new do
# 	(1..10000).each do |i|
# 		puts i
# 	end
# end

# count_to_a_million.call

# profile(count_to_a_million)


colors = ["red", "blue", "green", "yellow"]

class Array
	def each_even(&code)
		self.each_with_index do |item, index|
			if index%2 == 0
				code.call(item)
			end
		end	
   	 # yield(self.values_at(* self.each_index.select {|i| i.even?}))
	end
end

colors.each_even { |element| puts element}


# def each_even(colors)

# colors.each_even do |item|
# 	puts item
