gem 'simplecov', :require => false, :group => :test
require 'simplecov'
SimpleCov.start

gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/recursive_linked_list'

class LinkedListTest < Minitest::Test

  def test_that_nodes_are_connected
    list = LinkedList.new
    list.append('travis')
    list.append('lani')
    list.append('bret')
    assert_equal 'bret', list.find_tail.data
  end

  def test_to_append_node_when_empty
    list = LinkedList.new
    list.append('jeff')
    assert_equal 'jeff', list.tail
  end

  def test_to_append_node_when_not_empty
    list = LinkedList.new
    list.append('jeff')
    list.append('bridgette')
    assert_equal 'bridgette', list.tail
  end

  def test_head_call_when_empty
    list = LinkedList.new
    refute list.head
  end

  def test_to_find_tail_value_when_empty
    list = LinkedList.new
    refute list.tail
  end

  def test_to_find_tail_value_for_longer_list
    list = LinkedList.new
    list.append('travis')
    list.append('lani')
    list.append('bridgette')
    list.append('jeff')
    assert_equal 'jeff', list.tail
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

  def test_that_popping_on_empty_list
    skip
    list = LinkedList.new
    assert_equal nil, list.pop
  end

  def test_that_popping_pops
    list = LinkedList.new
    list.append('travis')
    list.append('lani')
    list.append('bridgette')
    assert_equal 'bridgette', list.pop.data
  end


end
