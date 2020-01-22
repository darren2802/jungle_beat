require_relative './linked_list'

class JungleBeat
  attr_reader :list, :valid_words
  attr_accessor :rate, :voice

  def initialize(head_data=nil)
    @valid_words = ['tee','dee','deep','bop','boop','la','na','ditt','woo','hoo','shu','doo','dop']
    @list = LinkedList.new
    append(head_data) if head_data
    @rate = 500
    @voice = 'Samantha'
  end

  def append(data)
    items = data.split
    counter = 0
    items.each do |item|
      if @valid_words.include?(item)
        @list.append(item)
        counter += 1
      end
    end
    counter
  end

  def prepend(data)
    items = data.split
    counter = 0
    items.each do |item|
      if @valid_words.include?(item)
        @list.prepend(item)
        counter += 1
      end
    end
    counter
  end

  def count
    @list.count
  end

  def play
    `say -r #{@rate} -v #{@voice} "#{@list.to_string}"`
  end

  def all
    @list.to_string
  end

  def reset_rate
    @rate = 500
  end

  def reset_voice
    @voice = 'Samantha'
  end
end
