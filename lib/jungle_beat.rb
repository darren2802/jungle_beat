require_relative './linked_list'

class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(data)
    items = data.split
    items.each { |item| @list.append(item) }
  end

  def count
    @list.count
  end
end
