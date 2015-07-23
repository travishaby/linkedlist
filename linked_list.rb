require './node'

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

  def find_tail
    current_node = @handle
    until current_node.tail?
      current_node = current_node.next_node
    end
    current_node
  end

  def tail
    find_tail.data
  end

  def append(data)
    new_node = Node.new(data)
    find_tail.next_node = new_node
  end

  def insert(data, position)
    if @handle.tail?
      append(data)
    else
      new_node = Node.new(data)
      node_before_index = find_by_index(position - 1)
      node_in_front = node_before_index.next_node
      node_before_index.next_node = new_node
      new_node.next_node = node_in_front
      new_node
    end
  end

  def includes?(target_data)
    node = @handle
    while node.data != target_data && node.next_node
      node = node.next_node
    end
    node.data == target_data
  end

  def find_by_index(position)
    current_node = @handle
    counter = -1
    while counter != position
      current_node = current_node.next_node
      counter += 1
    end
    current_node
  end

  def shift #oops, thought pop was shift when i wrote it
    if @handle.tail?
      StandardError
    else
      popping_node = @handle.next_node
      @handle.next_node = popping_node.next_node
      popping_node
    end
  end

  def pop
    if @handle.tail?
      nil
    else
      node = @handle
      until node.next_node.tail?
        node = node.next_node
      end
      popped = node.next_node
      node.next_node = nil; popped
    end
  end

  def count
    current_node = @handle
    counter = 0
    while current_node.next_node != nil
      current_node = current_node.next_node
      counter += 1
    end
    counter
  end

  def find_by_value(data)
    if @handle.tail?
      false
    else
      current_node = @handle.next_node
      while current_node.data != data
        current_node = current_node.next_node
      end
      current_node.data == data
    end
  end

  def remove_by_index(position)
    return false if @handle.tail?
    node_before_index = find_by_index(position - 1)
    node_at_index = node_before_index.next_node
    node_after_index = node_at_index.next_node
    node_before_index.next_node = node_after_index
    node_at_index
  end

  def remove_by_value(data)
    return false if @handle.tail?
    current_node = @handle
    while current_node.next_node.data != data
      current_node = current_node.next_node
    end
    new_next_node = current_node.next_node.next_node
    current_node.next_node
    current_node.next_node = new_next_node
  end

  #Find the distance between two nodes
  def distance_between_two(data1, data2)
    node1 = @handle
    node2 = @handle
    counter1 = 0
    counter2 = 0
    until node1.data == data1
      node1 = node1.next_node
      counter1 += 1
    end
    until node2.data == data2
      node2 = node2.next_node
      counter2 += 1
    end
    counter = counter1 - counter2
    counter.abs
  end

end
