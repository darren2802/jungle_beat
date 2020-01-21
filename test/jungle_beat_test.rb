require 'minitest/autorun'
require_relative '../lib/jungle_beat'
require_relative '../lib/linked_list'

class TestJungleBeat < Minitest::Test
  def setup
    @jb = JungleBeat.new
  end

  def test_jb_intialized
    assert_instance_of JungleBeat, @jb
    assert_instance_of LinkedList, @jb.list
    assert_nil @jb.list.head
  end

  def test_jb_append
    @jb.append("deep doo ditt")
    assert_equal "deep doo ditt", @jb.list.to_string
    assert_equal "deep", @jb.list.head.data
    assert_equal "doo", @jb.list.head.next_node.data
    @jb.append("woo hoo shu")
    assert_equal 6, @jb.count
  end
end
