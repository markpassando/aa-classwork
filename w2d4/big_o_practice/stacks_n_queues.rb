require 'byebug'
class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end
end

class MyStack
  attr_reader :current_max

  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(el)
    if el.is_a?(Hash)
      @store << el
    elsif empty?
      @store << {min: el, value: el, max: el}
    elsif el > max
      @store << {min: min, value: el, max: el}
    elsif el < min
      @store << {min: el, value: el, max: max}
    else
      @store << {min: min, value: el, max: max}
    end
  end

  def peek
    @store.last[:value]
  end

  def min
    @store.last[:min]
  end

  def max
    @store.last[:max]
  end

  def size
    @store.length
  end

  def empty?
    size == 0
  end
end

class StackQueue
  def initialize
    @in_store = MyStack.new
    @out_store = MyStack.new
  end

  def enqueue(el)
    @in_store.push(el)
  end

  def dequeue
    # debuggerdisp
    if @out_store.empty?
      until @in_store.empty?
        # debugger
        mover = @in_store.pop
        @out_store.push(mover[:value])
      end
      @out_store.pop
    else
      @out_store.pop
    end
  end

  def size
    @in_store.size + @out_store.size
  end

  def empty?
    size == 0
  end

  def min
    if @out_store.empty?
      @in_store.min
    else
      @out_store.min
    end
  end

  def max
    if @out_store.empty?
      @in_store.max
    else
      @out_store.max
    end
  end
  #native method that checks min and max of entire thing
  #how you look up the min and maxa
end
