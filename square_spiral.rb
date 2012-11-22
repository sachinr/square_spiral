class SquareSpiral
  def initialize(number)
    @number = number
  end

  def create
    if is_valid_input?
      print_grid(start_spiral)
    else
      puts 'Input is not a square number'
    end
  end

  def is_valid_input?
    (@number.is_a?(Fixnum) || @number.is_a?(Float)) &&
      @number > 0 && is_perfect_square?
  end

  private
  def is_perfect_square?
    Math.sqrt(@number)**2 == @number
  end

  def steps(n)
    n = n.to_i
    steps_array = [n]
    (n-1).downto(1).each { |i| steps_array << [i, i] }

    steps_array.flatten
  end

  def start_spiral
    sqrt = Math.sqrt(@number)
    grid = Array.new(sqrt) { Array.new(sqrt) }
    movement = [[0, 1], [1, 0], [0, -1], [-1, 0]]

    x_pos = 0
    y_pos = -1
    movement_count = 0
    value = @number

    steps(sqrt).each do |step| #4
      step.times do |move|
        x_pos += movement[movement_count][0]
        y_pos += movement[movement_count][1]

        grid[x_pos][y_pos] = value
        value -= 1
      end
      movement_count == 3 ? movement_count = 0 : movement_count += 1
    end

    grid
  end

  def print_grid(grid)
    max_width = @number.to_s.size
    puts
    grid.each do |row|
      row.each do |cell|
        print "%-#{max_width}d " % cell
      end
      puts
    end

  end

end
