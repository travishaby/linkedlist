gem 'simplecov', :require => false, :group => :test
require 'simplecov'
SimpleCov.start

gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './linked_list'
require './node'

class LinkedListTest < Minitest::Test

  def test_that_nodes_are_connected
    list = LinkedList.new
    node3 = Node.new('travis')
    node2 = Node.new('lani', node3)
    node1 = Node.new('brett', node2)
    assert_equal 'travis', list.find_tail(node1).data
  end

  def test_to_append_node
    list = LinkedList.new
    list.append('jeff')
    assert_equal 'jeff', list.tail
  end

  def test_head_call_when_empty
    list = LinkedList.new
    assert_equal nil, list.head
  end

  def test_to_prepend_node_if_head_is_empty
    list = LinkedList.new
    list.prepend('bret')
    assert_equal 'bret', list.head
  end

  def test_to_prepend_node_when_not_empty
    list = LinkedList.new
    list.prepend('travis')
    list.prepend('lani')
    list.prepend('brett')
    assert_equal 'brett', list.head
  end

  # def test_to_insert_at_arbitrary_position
  #   #if counter can decrease down to 0, raise StandardError
  # end

  def test_that_list_returns_false_if_node_not_included
    list = LinkedList.new
    list.prepend('travis')
    list.prepend('lani')
    list.prepend('bridgette')
    refute list.includes?('sam')
  end

  def test_that_a_node_is_included_in_a_list
    list = LinkedList.new
    list.prepend('travis')
    list.prepend('lani')
    list.prepend('bridgette')
    list.prepend('jeff')
    list.prepend('david')
    list.prepend('sam')
    assert list.includes?('jeff')
  end

  def test_insertion_at_an_arbitrary_position
    skip
    list = LinkedList.new
    list.prepend('travis')
    list.prepend('lani')
    list.prepend('bridgette')
    list.prepend('jeff')
    assert_equal
  end

  def test_a_node_is_at_a_given_index
    skip
    list = LinkedList.new
    list.prepend('travis')
    list.prepend('lani')
    list.prepend('bridgette')
    list.prepend('jeff')
    assert_equal 'bridgette', list.find_by_index
  end





end
