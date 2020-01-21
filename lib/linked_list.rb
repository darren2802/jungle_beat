require_relative "./node"

class LinkedList
  attr_reader :head

  def initialize(head=nil)
    @head = head
  end

  def append(data)
    if @head
      last_node = @head
      loop do
        break if !last_node.next_node
        last_node = last_node.next_node
      end
      last_node.next_node = Node.new(data)
    else
      @head = Node.new(data)
    end
  end

  def prepend(data)
    if @head
      new_head = Node.new(data)
      new_head.next_node = @head
      @head = new_head
    else
      append(data)
    end
  end

  def insert(position, data)
    if @head
      return prepend(data) if position == 0
      return append(data) if position >= count
      index = 0
      current_node = @head
      loop do
        index += 1
        if index == position
          new_node = Node.new(data)
          new_node.next_node = current_node.next_node
          current_node.next_node = new_node
          break
        end
        current_node = current_node.next_node
      end
    else
      append(data)
    end
  end

  def find(position, count)
    index = 0
    tally = 0
    current_node = @head
    data_str = ''
    loop do
      if index == position || tally > 0
        data_str += current_node.data + ' '
        tally += 1
        return data_str.strip if tally == count
      end
      current_node = current_node.next_node
      index += 1
    end
  end

  def includes?(data)
    current_node = @head
    loop do
      return true if current_node.data == data
      return false if !current_node.next_node
      current_node = current_node.next_node
    end
  end

  def pop
    return nil if count < 2
    current_node = @head
    counter = 1
    loop do
      if counter == count - 1
        data = current_node.next_node.data
        current_node.next_node = nil
        return data
      end
      counter += 1
      current_node = current_node.next_node
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
