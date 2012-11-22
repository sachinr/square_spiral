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

app = SquareSpiral.new(ARGV.first)
app.create
