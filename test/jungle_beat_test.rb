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
    assert_equal "deep doo ditt", @jb.all
    assert_equal "deep", @jb.list.head.data
    assert_equal "doo", @jb.list.head.next_node.data
    @jb.append("woo hoo shu")
    assert_equal 6, @jb.count
  end

  def test_append_invalid_words
    assert_equal (['tee','dee','deep','bop','boop','la','na','ditt','woo','hoo','shu','doo','dop']), @jb.valid_words
    @jb.append("deep boop")
    assert_equal "deep boop", @jb.all
    @jb.append("Mississippi")
    assert_equal "deep boop", @jb.all
    assert_equal 0, @jb.append("Mississippi")
    assert_equal 3, @jb.append("tee tee tee Mississippi")
    assert_equal "deep boop tee tee tee", @jb.all
  end

  def test_prepend_invalid_words
    jb_2 = JungleBeat.new('deep')
    assert_equal 'deep', jb_2.all
    assert_equal 3, jb_2.prepend("tee tee tee Mississippi")
    assert_equal "tee tee tee deep", jb_2.all
  end

  def test_change_voice_rate
    assert_equal 'Samantha', @jb.voice
    @jb.voice = 'Alex'
    assert_equal 'Alex', @jb.voice
    @jb.reset_voice
    assert_equal 'Samantha', @jb.voice

    assert_equal 500, @jb.rate
    @jb.rate = 100
    assert_equal 100, @jb.rate
    @jb.reset_rate
    assert_equal 500, @jb.rate
  end
end
