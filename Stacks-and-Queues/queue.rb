module QueueModule
  class Node
    attr_accessor :value, :next
    def initialize(value)
      @value = value
      @next = nil
    end
  end

  class Queue
    attr_accessor :first, :last, :length
    def initialize(value)
      new_node = Node.new(value)
      @first = new_node
      @last = new_node
      @length = 1
    end
    def enqueue(value)
      new_node = Node.new(value)
      if(@length == 0)
        @first = new_node
        @last = new_node
      else
        @last.next = new_node
        @last = new_node
      end
      @length += 1
      return self
    end
    def dequeue
      if(@length == 0)
        return nil
      end
      temp = @first
      if(@length == 1)
        @first = nil
        @last = nil
      else
        @first = @first.next
        temp.next = nil
      end
      @length -= 1
      return temp
    end
  end
end
