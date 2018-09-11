require './settings'
require './mob'
require './player'
require './inputmanager'
require './dkt_window'
require './dsl_helpers'

class Game < DKT_Window
  def initialize
    super(WIDTH, HEIGHT)
    self.caption = GAME_NAME

    @player = Player.new('starfighter')
  end

  def update
    InputManager.directional_movement do |dir|
      @player.move(dir)
    end
  end

  def draw
    @player.draw
  end

  def button_down(id)
    id == InputManager.kb(:escape) ? close : super
  end
end