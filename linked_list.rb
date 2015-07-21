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
  #internal method
  def find_tail(node = @handle)
    return node if node.next_node.nil?
    find_tail(node.next_node)
  end

  def tail
    find_tail.data
  end

  def append(data)
    new_node = Node.new(data)
    find_tail.next_node = new_node
  end
#####THINGS TO DO#####
  def insert(data, position)
    new_node = Node.new(data)
    #at position, store node.next_node
    #pass position's node.next_node into new node.next_node w/ inserted data
    #change position's node.next_node to inserted node
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
    counter = 0
    while current_node != position
      current_node = current_node.next_node
      counter += 1
    end
    current_node
    #count from the handle (handle is 0)
    #loop using until, += counter value each loop
    #take position value, move up to next_node until position == counter
  end


  #.....etc......

# insert an element at an arbitrary position in the list
# pop an element from the end of the list
# count the number of elements in the list
# return the tail value at the end of the list
# find_by_index find the value at a numeric position
# find_by_value finds the position of the first occurrence of a value
# remove_by_index removes the value at the specified index
# remove_by_value removes the first occurrence of the specified value
end
