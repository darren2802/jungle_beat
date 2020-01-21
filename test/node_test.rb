require 'minitest/autorun'
require_relative '../lib/node'

class TestNode < Minitest::Test
  def setup
    @node = Node.new("plop")
  end

  def test_node_initialized
    assert_instance_of Node, @node
    assert_equal "plop", @node.data
    assert_nil @node.next_node
  end
end
