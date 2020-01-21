require_relative "./node"

class LinkedList
  attr_reader :head

  def initialize(head=nil)
    @head = head
  end

  def append(data)
    if @head
      @head.next_node = Node.new(data)
    else
      @head = Node.new(data)
    end
  end

  def count
    count = 0
    current_node = @head
    loop do
      break if !current_node
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def to_string
    list_str = ''
    current_node = @head
    loop do
      break if !current_node
      list_str += current_node.data + ' '
      current_node = current_node.next_node
    end
    list_str.strip
  end
end
