class Turtle

  def board
    @board
  end

  def initialize(board_size)
    @board = Board.new(self, board_size)
    @y = board_size/2
    @x = board_size/2
    @orientation = 0
    @board.visit(@y, @x)
  end

  def rt(degree)
    @orientation = @orientation + degree
  end

  def lt(degree)
    @orientation = @orientation - degree
  end

  def fd (steps)

    if (@orientation == 0 || @orientation == 360)
      steps.times do
        @y = @y - 1
        @board.visit(@y, @x)
      end

    elsif @orientation == 45
      steps.times do
        @x = @x + 1
        @y = @y + 1
        board.visit(@y,@x)
      end
    elsif @orientation == 90
      steps.times do
        @x = @x + 1
        board.visit(@y, @x)
      end
    elsif @orientation == 135
        steps.times do
        @x = @x + 1
        @y = @y - 1
        board.visit(@y,@x)
        end
    elsif @orientation == 180
        steps.times do
        @y = @y - 1
        board.visit(@y,@x)
        end
    elsif @orientation == 225
        steps.times do
        @x = @x - 1
        @y = @y - 1
        board.visit(@y,@x)
        end
    elsif @orientation == 270
        steps.times do
        @x = @x - 1
        board.visit(@y,@x)
        end
    elsif @orientation == 315
        steps.times do
        @x = @x - 1
        @y = @y + 1
        board.visit(@y,@x)
        end
    end

  end

  def bk

    if (@orientation == 0 || @orientation == 360)
      steps.times do
        @y = @y + 1
        @board.visit(@y, @x)
      end

    elsif @orientation == 45
      steps.times do
        @x = @x - 1
        @y = @y - 1
        board.visit(@y,@x)
      end
    elsif @orientation == 90
      steps.times do
        @x = @x - 1
        board.visit(@y, @x)
      end
    elsif @orientation == 135
        steps.times do
        @x = @x - 1
        @y = @y + 1
        board.visit(@y,@x)
        end
    elsif @orientation == 180
        steps.times do
        @y = @y + 1
        board.visit(@y,@x)
        end
    elsif @orientation == 225
        steps.times do
        @x = @x + 1
        @y = @y + 1
        board.visit(@y,@x)
        end
    elsif @orientation == 270
        steps.times do
        @x = @x + 1
        board.visit(@y,@x)
        end
    elsif @orientation == 315
        steps.times do
        @x = @x + 1
        @y = @y - 1
        board.visit(@y,@x)
        end
    end
  end
end

class Board

  def initialize(turtle, board_size)
    @turtle = turtle
    @board_size = board_size
    @board_array = Array.new(@board_size, " .") {Array.new(@board_size, " .")}
  end

  def visit(y,x)
    @board_array[y][x] = " X"
  end

  def draw_board
    @board_array.each do |line|
      print line
      print "\n"
    end
  end
end

my_turtle = Turtle.new(11)
my_turtle.fd(5)
my_turtle.board.draw_board
