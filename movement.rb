require './dsl_helpers'

class Movement
  def initialize(mob)
    @mob = mob
  end

  def move!(dir, screen_loop: true)
    x = TILE_SIZE * dir.first
    y = TILE_SIZE * dir.last

    speed = Frames.per_second / @mob.move_speed
    p x

    x_per_frame = x / speed
    y_per_frame = y / speed

    p x_per_frame

    Frames.each([x % speed, y % speed].max) do
      @mob.x += x_per_frame
      @mob.y += y_per_frame
    end

    if screen_loop
      @mob.x %= WIDTH
      @mob.y %= HEIGHT
    end

    After.new
  end
end