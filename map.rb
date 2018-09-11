class Map < Gosu::Window
  def self.build!(**data, &block)
    Map::Builder.new(**data, &block).build!
  end

  attr_reader :width, :height

  def initialize(builder)

  end

  private

  class Builder

  end
end