f = File.open("complex.logo")
f_lines = f.readlines
board_size = f_lines[0]
f_lines.shift(2)
f_string = f_lines.to_s
if f_string.include?("REPEAT")
  n = f_string[/REPEAT ([0-9]*)/][$1]
  n = n.to_i
  n.times do
   y_string = f_string[/\[([A-Z0-9 _]*)\]/]
   y_string[$1].to_a
  end
end
