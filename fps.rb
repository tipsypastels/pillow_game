module Frames
  module_function

  def per_second
    60
  end

  def sleep(num)
    Kernel.sleep(num / per_second)
    After.new
  end

  def each(num, delay: 1, &block)
    num.times do 
      block.call
      self.sleep(delay)
    end
  end
end