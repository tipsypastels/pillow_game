class Mob
  def initialize(image)
    @image = Gosu::Image.new(image)
    @x = @y = 0
    @score = 0
  end

  def set_area(world_width, world_height)
    @world_width = world_width
    @world_height = world_height

    self
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
    unless (dir = DIRECTIONS[dir])
      raise ArgumentError, "Must be :left, :up, :right, or :down"
    end

    @x += TILE_SIZE * dir.first
    @y += TILE_SIZE * dir.last

    @x %= @world_width if @world_width
    @y %= @world_height if @world_height
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0)
  end
end