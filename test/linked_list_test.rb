require 'minitest/autorun'
require_relative '../lib/node'
require_relative '../lib/linked_list'

class TestLinkedList < Minitest::Test
  def setup
    @list = LinkedList.new
  end

  def test_linked_list_initialized
    assert_instance_of LinkedList, @list
    assert_nil @list.head
  end

  def test_append_node_to_list
    @list.append("doop")
    assert_instance_of Node, @list.head
  end

  def test_list_count
    @list.append("doop")
    assert_equal 1, @list.count
  end

  def test_list_to_string
    @list.append("doop")
    assert_equal "doop", @list.to_string
  end
end
