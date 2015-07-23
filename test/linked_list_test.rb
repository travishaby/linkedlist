gem 'simplecov', :require => false, :group => :test
require 'simplecov'
SimpleCov.start

gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/linked_list'
require './lib/node'
require './test/node_test.rb'

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

  def test_insertion_into_empty_list
    list = LinkedList.new
    assert_equal 'mike', list.insert('mike', 0).data
  end

  def test_insertion_at_zero
    list = LinkedList.new
    list.append('travis')
    list.append('lani')
    list.append('bridgette')
    list.append('jeff')
    assert_equal 'travis', list.insert('mike', 0).next_node.data
  end

  def test_insertion_at_end
    list = LinkedList.new
    list.append('travis')
    list.append('lani')
    list.append('bridgette')
    list.append('jeff')
    assert_equal 'jeff', list.insert('mike', 3).next_node.data
  end

  def test_insertion_at_some_position
    list = LinkedList.new
    list.append('travis')
    list.append('lani')
    list.append('bridgette')
    list.append('jeff')
    assert_equal 'bridgette', list.insert('mike', 2).next_node.data
  end

  def test_what_data_is_at_a_given_index
    list = LinkedList.new
    list.append('travis')
    list.append('lani')
    list.append('bridgette')
    list.append('jeff')
    list.append('nate')
    list.append('tucker')
    list.append('sam')
    list.append('danika')
    assert_equal 'bridgette', list.find_by_index(2).data
  end

  def test_that_shifting_empty_list_raises_error
    list = LinkedList.new
    assert_raises StandardError, list.shift
  end

  def test_that_shifting_returns_popped_node
    list = LinkedList.new
    list.append('travis')
    list.append('lani') #DEAR BRET, THIS IS MY GF YOU DICK -Travis
    list.append('bridgette')
    assert_equal 'travis', list.shift.data
  end

  def test_that_popping_on_empty_list
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

  def test_how_many_nodes_when_zero_nodes
    list = LinkedList.new
    assert_equal 0, list.count
  end

  def test_how_many_nodes_are_in_the_list
    list = LinkedList.new
    list.append('travis')
    list.append('lani')
    list.append('bridgette')
    assert_equal 3, list.count
  end

  def test_find_by_value_with_no_nodes_in_list
    list = LinkedList.new
    refute list.find_by_value('lani')
  end

  def test_find_by_value_in_middle_with_many_nodes_in_list
    list = LinkedList.new
    list.append('travis')
    list.append('lani')
    list.append('bridgette')
    list.append('val')
    list.append('nate')
    list.append('kaycee')
    assert_equal true, list.find_by_value('val')
  end

  def test_find_by_value_for_node_at_end
    list = LinkedList.new
    list.append('travis')
    list.append('lani')
    list.append('bridgette')
    list.append('val')
    list.append('nate')
    list.append('kaycee')
    assert_equal true, list.find_by_value('kaycee')
  end

  def test_remove_by_index_for_empty_list
    list = LinkedList.new
    refute list.remove_by_index(0)
  end

  def test_remove_by_index_in_middle
    list = LinkedList.new
    list.append('travis')
    list.append('lani')
    list.append('bridgette')
    list.remove_by_index(1)
    assert_equal 'bridgette', list.find_by_index(1).data
  end

  def test_for_removing_by_index_at_end_of_list
    list = LinkedList.new
    list.append('travis')
    list.append('lani')
    list.append('bridgette')
    list.remove_by_index(2)
    assert_equal 'lani', list.tail
  end

  def test_for_removing_node_by_value_with_empty_list
    list = LinkedList.new
    refute list.remove_by_value('travis')
  end

  def test_for_removing_node_by_value_with_populated_list
    list = LinkedList.new
    list.append('travis')
    list.append('lani')
    list.append('bridgette')
    list.remove_by_value('lani')
    assert_equal 'bridgette', list.find_by_index(1).data
  end

  def test_finding_the_distance_between_different_nodes
    list = LinkedList.new
    list.append('travis')
    list.append('lani')
    list.append('bridgette')
    list.append('val')
    list.append('nate')
    list.append('kaycee')
    assert_equal 3, list.distance_between_two('bridgette', 'kaycee')
  end

end
