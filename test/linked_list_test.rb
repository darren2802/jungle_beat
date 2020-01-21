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

  def test_append_node_to_head
    @list.append("doop")
    assert_nil @list.head.next_node
    @list.append("deep")
    assert_instance_of Node, @list.head.next_node
    assert_equal 2, @list.count
  end

  def test_string_2_nodes
    @list.append("doop")
    @list.append("deep")
    assert_equal "doop deep", @list.to_string
  end

  def test_prepend_without_head
    assert_nil @list.head
    @list.prepend("dop")
    assert_instance_of Node, @list.head
  end

  def test_prepend_with_head
    @list.append("plop")
    @list.append("suu")
    @list.prepend("dop")
    assert_equal "dop plop suu", @list.to_string
    assert_equal 3, @list.count
  end

  def test_insert_without_head
    assert_nil @list.head
    @list.insert(1, "woo")
    assert_instance_of Node, @list.head
  end

  def test_insert_with_head
    @list.append("plop")
    @list.append("suu")
    @list.prepend("dop")
    assert_equal "dop plop suu", @list.to_string
    assert_equal 3, @list.count
    @list.insert(1, "woo")
    assert_equal "dop woo plop suu", @list.to_string
    assert_equal 4, @list.count
  end

  def test_insert_with_head_at_0_position
    @list.append("plop")
    @list.append("suu")
    @list.prepend("dop")
    @list.insert(0, "woo")
    assert_equal "woo dop plop suu", @list.to_string
    assert_equal 4, @list.count
  end
end
