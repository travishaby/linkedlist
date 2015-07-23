require './node'

class LinkedList

  def initialize
    @handle = Node.new
  end

  def head
    @handle.next_node && @handle.next_node.data
  end

  def tail
    find_tail.data
  end

  def find_tail(node = @handle)
    return node if node.next_node.nil?
    find_tail(node.next_node)
  end

  def append(data)
    new_node = Node.new(data)
    find_tail.next_node = new_node
  end

  def prepend(data)
    node = Node.new(data)
    first_element = @handle.next_node
    @handle.next_node = node
    node.next_node = first_element
  end

  def pop (node = @handle)
    return node if node.next_node.next_node.nil?
    find_tail(node.next_node)
  end

end
