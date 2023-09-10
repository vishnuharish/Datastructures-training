module LinkedListModule
  class Node
    attr_accessor :value, :next
    def initialize(value)
      @value = value
      @next = nil
    end
  end

  class LinkedList
    attr_accessor :head, :tail, :length
    def initialize(value=nil)
      if value
        node = Node.new(value)
        @head = node
        @tail = @head
        @length = 1
      end
    end

    def push(value)
      new_node = Node.new(value)
      if self.is_empty?
        @head = new_node
        @tail = @head
      else
        @tail.next = new_node
        @tail = new_node
      end
      @length += 1
      return self
    end

    def pop
      if is_empty?
        return nil
      end
        temp = @head
        pre = @head
        while temp.next != nil
          pre = temp
          temp = temp.next
        end
        @tail = pre
        @tail.next = nil
        @length -= 1
        if @length == 0
          @head = nil
          @tail = nil
        end
        temp.next = nil
        return temp

    end

    def unshift(value)
      new_node = Node.new(value)
      if is_empty?
        @head = new_node
        @tail = @head
      else
        new_node.next = @head
        @head = new_node
      end
      @length += 1
      return self
    end

    def shift
      if is_empty?
        @head = nil
        @tail = nil
      else
        temp = @head
        @head = temp.next
        temp.next = nil
      end
      @length -= 1
      if @length == 0
        @head = nil
      end
      return temp
    end

    def get(index)
      if index < 0 or index >= @length
        return nil
      else
        temp = @head
        (index - 1).times do 
          temp = temp.next
        end
        return temp
      end
    end

    def set_node_value(index, value)
      node = get(index)
      if node != nil
        node.value = value
      end
      return self
    end

    def insert_on_index(index, value)
      if(index < 0 or index >= @length)
        return nil
      elsif index == 0
        unshift(value)
      elsif index === @length
        push(value)
      else
        new_node = Node.new(value)
        temp = get(index - 1)
        new_node.next = temp.next
        temp.next = new_node
      end
      return self
    end
    
    def remove_from_index(index)
      if index < 0 or index >= @length
        return nil
      elsif index == 0
        shift()
      elsif index == @length - 1
        pop()
      else
        before = get(index - 1)
        temp = before.next
        before.next = temp.next
        temp.next = nil
      end
      @length -= 1
      return self
    end


    def to_list
        array = []
        current_node = @head
        if is_empty?
            return array
        else
            while current_node.next != nil
                array << current_node.value
                current_node = current_node.next
            end
            array << current_node.value
       end
       array
    end

    private
    def is_empty?
      if @head == nil
        return true
      else
        return false
      end
    end
  end
end

