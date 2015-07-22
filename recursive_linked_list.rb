class LinkedList

  def initialize
    @handle = Node.new
  end

  def head
    @handle.next_node && @handle.next_node.data
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
