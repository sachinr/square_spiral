#!/usr/bin/env ruby

class SquareSpiral
  def initialize(number)
    @number = number.to_i
  end

  def create
    if is_valid_input?
      print_grid(start_spiral)
    else
      puts 'Input is not a square number'
    end
  end

  def is_valid_input?
    @number > 0 && Math.sqrt(@number)**2 == @number
  end

  private

  # returns the number of steps required to walk a spiral (when combined with direction)
  # 4x4 = [4,3,3,2,2,1,1]
  def steps(n)
    n = n.to_i
    steps_array = [n]
    (n-1).downto(1).each { |i| steps_array << [i, i] }

    steps_array.flatten
  end

  def start_spiral
    sqrt = Math.sqrt(@number).to_i
    if sqrt.even?
      movement = [[0, 1], [1, 0], [0, -1], [-1, 0]]
      row_pos = 0
      col_pos = -1
    else
      movement = [[0, -1], [-1, 0], [0, 1], [1, 0]]
      row_pos = sqrt - 1
      col_pos = sqrt
    end

    move_through_spiral(row_pos, col_pos, movement, sqrt)
  end

  def move_through_spiral(row_pos, col_pos, movement, sqrt)
    value = @number
    movement_count = 0
    grid = Array.new(sqrt) { Array.new(sqrt) }
    steps(sqrt).each do |step|
      step.times do |move|
        row_pos += movement[movement_count][0]
        col_pos += movement[movement_count][1]

        grid[row_pos][col_pos] = value
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

app = SquareSpiral.new(ARGV.first)
app.create
