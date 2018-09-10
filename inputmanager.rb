module InputManager
  module_function

  def down?(name)
    kb_down?(name) || gp_down?(name)
  end

  def kb_down?(name)
    button_down?("KB", name)
  end

  def gp_down?(name)
    button_down?("GP", name)
  end

  def button_down?(prefix, name)
    name = name.to_s.upcase
    const = Gosu.const_get("#{prefix}_#{name}")

    Gosu.button_down?(const)
  rescue
    false
  end

  def kb(name)
    name = name.to_s.upcase
    Gosu.const_get("KB_#{name}")
  end

  def directional_movement(dirs = [:left, :up, :right, :down])
    current_dir = dirs.detect do |dir|
      down?(dir)
    end

    return unless current_dir
    yield current_dir if block_given?
    current_dir
  end
end