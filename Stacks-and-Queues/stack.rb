module Stack

class Node
  attr_accessor :value, :next
  def initialize(value)
    @value = value 
    @next = nil
  end
end

class Stack
  attr_accessor :top, :length
  def initialize(value)
    new_node = Node.new(value)
    @top = new_node
    @length = 1
  end

  def push(value)
    new_node = Node.new(value)
    if @top == nil
      @top = new_node
    else
      new_node.next = @top
      @top = new_node
    end
    @length += 1
    return self 
  end
  
  def pop()
    if @top == nil
      return nil
    end
    temp = @top
    @top = @top.next
    temp.next = nil
    @length -= 1
    return temp
  end
end
end

