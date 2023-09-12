module DoubllyLinkedListModule
    class Node
        attr_accessor :value, :next, :prev
        
        def initialize(value)
            @value = value
            @next = nil
            @prev = nil
        end
    end

    class DoubllyLinkedList
        attr_accessor :head, :tail, :length
        def initialize(value)
           node = Node.new(value)
           @head = node
           @tail = @head
           @length = 1 
        end

        def push(value)
            node = Node.new(value)
            if is_empty?
                @head = node
                @tail = @head
            else
                @tail.next = node
                node.prev = @tail
                @tail = node
            end
            @length += 1
            return self
        end

        private
        def is_empty?
            if(@head == nil)
                return true
            else
                return false
            end
        end
    end
end