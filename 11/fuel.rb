SERIAL_NUMBER = 3613

def cell_power_level(x, y, serial=SERIAL_NUMBER)
  rack_id = x + 10
  power_level = (rack_id * y + serial) * rack_id

  hundreds_digit = power_level.digits[2] || 0
  hundreds_digit - 5
end

def calculate_grid
  power_levels = Hash.new(0)

  (1..300).each do |y|
    (1..300).each do |x|
      power_levels[[x,y]] = cell_power_level(x, y)
    end
  end

  power_levels
end

def calculate_squares(grid)
  squares = Hash.new(0)

  (1..297).each do |y|
    (1..297).each do |x|
      (0..2).each do|xx|
        (0..2).each do |yy|
          squares[[x,y]] += grid[[x + xx, y + yy]]
        end
      end
    end
  end

  squares
end


grid = calculate_grid()
squares = calculate_squares(grid)

p squares.max_by {|k,v| v }

