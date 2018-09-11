class After
  def after(&block)
    block.call
  end
end