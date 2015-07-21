gem 'simplecov', :require => false, :group => :test
require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './node'
require './linked_list'

class NodeTest < Minitest::Test

  def test_that_nodes_have_names_and_default_link_of_nil
    node1 = Node.new('travis')
    assert_equal 'travis', node1.data
    assert_equal nil, node1.next_node
  end

  def test_that_a_node_knows_its_the_tail
    node1 = Node.new('travis')
    assert_equal nil, node1.next_node
  end

  def test_that_a_node_can_be_the_head
    node1 = Node.new
    assert_equal nil, node1.data
  end

end
