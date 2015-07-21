class LinkedList

  attr_accessor :head

  include Enumerable

  def prepend(data)
    @head = Node.new(data, head)
  end

  def push

  end

#find all the nodes beyond this node

#####THINGS TO DO#####

  #append items to the end of the list

  #prepend items to the beginning of the list

  #insert an item into the middle of the list

  #includes? gives back true or false for
    #whether a given value is in the list

  #.....etc......

end
