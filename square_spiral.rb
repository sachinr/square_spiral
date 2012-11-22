#!/usr/bin/env ruby

class SquareSpiral
  CLOCKWISE = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  ANTI_CLOCKWISE = [[0, -1], [-1, 0], [0, 1], [1, 0]]

  def initialize(number)
    @number = number.to_i
  end

  def create
    if is_valid_input?
      start_spiral
    else
      puts 'Input is not a square number'
    end
  end

  def is_valid_input?
    @number > 0 && Math.sqrt(@number).to_i**2 == @number
  end

  private
  def start_spiral
    movement_count = 0
    grid = Grid.new(sqrt)
    value = @number
    steps(sqrt).each do |step|
      step.times do |move|
        grid.move_and_insert_number(movement[movement_count], value)
        value -= 1
      end
      movement_count == 3 ? movement_count = 0 : movement_count += 1
    end

    grid.formatted_print(@number.to_s.size)
  end

  # returns the number of steps required
  # to walk a spiral (when combined with direction)
  # 4x4 = [4,3,3,2,2,1,1]
  def steps(n)
    steps_array = [n]
    (n-1).downto(1).each { |i| steps_array.concat([i, i]) }

    steps_array
  end

  def sqrt
    @sqrt ||= Math.sqrt(@number).to_i
  end

  def movement
    @movement ||= sqrt.even? ? CLOCKWISE : ANTI_CLOCKWISE
  end

end

class Grid
  def initialize(width)
    @grid = Array.new(width) { Array.new(width) }
    @row_position = width.even? ? 0 : (width - 1)
    @column_position = width.even? ? -1 : width
  end

  def move_and_insert_number(position_adjust, number)
    @row_position += position_adjust[0]
    @column_position += position_adjust[1]
    @grid[@row_position][@column_position] = number
  end

  def formatted_print(column_width)
    print "\n"
    @grid.each do |row|
      row.each do |cell|
        print "%-#{column_width}d " % cell
      end
      print "\n"
    end
  end
end

app = SquareSpiral.new(ARGV.first)
app.create
