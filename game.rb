require './settings'
require './mob'
require './player'
require './inputmanager'

class Game < Gosu::Window
  def initialize(tiles_x, tiles_y)
    @width  = tiles_x * TILE_SIZE
    @height = tiles_y * TILE_SIZE

    super(@width, @height)
    self.caption = GAME_NAME

    @player = Player
      .new('media/starfighter.bmp')
      .set_area(@width, @height)
  end

  def update
    InputManager.directional_movement do |direction|
      @player.move(direction)
    end
  end

  def draw
    @player.draw
  end

  def button_down(id)
    if id == InputManager.kb(:escape)
      close
    else
      super
    end
  end
end