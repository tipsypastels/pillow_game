module InputManager
  module_function

  def down?(input)
    if input.is_a?(Hash)
      gp = input[:gp]
      kb = input[:kb]

      kb_down?(kb) || gp_down?(gp)
    else
      kb_down?(input) || gp_down?(input)
    end
  end

  def kb_down?(name)
    button_down?("KB", name)
  end

  def gp_down?(name)
    button_down?("GP", name)
  end

  def button_down?(prefix, name)
    const = button(prefix, name)

    Gosu.button_down?(const)
  rescue NameError
    false
  end

  def kb(name)
    button("KB", name)
  end

  def gp(name)
    button("GP", name)
  end

  def button(prefix, name)
    name = name.to_s.upcase
    Gosu.const_get("#{prefix}_#{name}")
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