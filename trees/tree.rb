module BinarySearchTree

  class Node
    attr_accessor :value, :left, :right
    def initialize(value)
      @value = value
      @left = nil
      @right = nil
    end
    
  end

  class BST
    attr_accessor :root
    def initialize()
      @root = nil
    end

    def insert(value)
      new_node = Node.new(value)
      if(@root.nil?)
        @root = new_node
      end
      temp = @root
      while(true)
        if new_node.value == temp.value
          return nil
        end
        if new_node.value < temp.value
          if temp.left.nil?
            temp.left = new_node
            return self
          end
          temp = temp.left
        else
          if temp.right.nil?
            temp.right = new_node
            return self
          end
          temp = temp.right
        end
      end
    end
  end
  
end
