class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  public
    def append(value)
      node = Node.new(value)
      if @tail.nil?
        @head = node
        @tail = node
      else
        @tail.next = node
        @tail = node
      end
    end

    def prepend(value)
      node = Node.new(value)
      if @head.nil
        @head = node
        @tail = node
      else
        node.next = node
        @head = node
      end
    end

    def size
      count = 0
      current = @head
      while current
        count += 1
        current = current.next
      end
      count
    end

    def head
      @head.data
    end

    def tail
      @tail.data
    end

    def at(index)
      current = @head
      count = 0
      while current
        return current if count == index
        current = current.next
        count += 1
      end

      nil
    end

    def pop
      if head.nil?
        return nil
      end

      value = @head.data
      @head = @head.next
      value
    end

    def contains?(data)
      current = @head
      while current
        return true if current.data == data
        current = current.next
      end
      false
    end

    def index(value)
      current = @head
      count = 0
      while current
        return count if current.data == value
        count += 1
        current = current.next
      end

      nil
    end

    def to_s
      current = @head
      string = ""

      while current
        string += "(#{current.data}) -> "
        string += "nil" if current.nil?
        current = current.next
      end

      string
    end
end

list = LinkedList.new

list.append(1)
list.append(2)
list.append(3)
p list.pop
p list.to_s
list.append(4)
list.append(5)

p list.to_s
