
require 'byebug'
class PolyTreeNode
  attr_accessor :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if node.nil?
      @parent = nil
    else
      if self.parent.nil?
        @parent = node
        node.children << self
      else
        self.parent.children.delete(self)
        @parent = node
        node.children << self
      end
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "error: node is not a child" unless child_node.parent == self
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value
    return nil if self.children.empty?

    self.children.each do |child|
      result = child.dfs(target_value)
      unless result.nil?
        return result
      end
    end
    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?
      queue.each do |node|
        first = queue.shift
        return first if first.value == target_value
        queue.concat(first.children)
      end
    end

    nil
  end

end
