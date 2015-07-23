class Node

  attr_accessor :data, :next_node

  def initialize(data = nil, next_node = nil)
    @data = data
    @next_node = next_node
  end

  def empty?
    data.nil?
  end

  def tail?
    next_node.nil?
  end

end
