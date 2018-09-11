require './movement'

class Mob
  attr_accessor :x, :y, :move_speed

  def initialize(image_folder, move_speed: DEFAULT_MOVE_SPEED)
    @image_folder = image_folder
    @dir = :down
    @x = @y = 0
    @score = 0

    @move_speed = move_speed
    @move_state = :standing
  end

  def warp(x, y)
    @x, @y = x, y
  end
  
  DIRECTIONS = {
    left: [-1, 0],
    up: [0, -1],
    right: [1, 0],
    down: [0, 1]
  }

  def move(dir)
    @dir = dir

    unless (dir = DIRECTIONS[dir])
      raise ArgumentError, "Must be :left, :up, :right, or :down"
    end

    Movement.new(self).move!(dir)
  end

  def draw
    @image = Gosu::Image.new("media/#{@image_folder}/#{@dir}-#{@move_state}.bmp")
    @image.draw_rot(@x, @y, 1, 0)
  end
end