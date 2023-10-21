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
        attr_reader :head, :tail, :length
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
        
        def pop()
            if is_empty?
                return nil
            end
            if self.length == 1
                @head = nil
                @tail = nil
            else
                temp = @tail
                @tail = @tail.prev
                @tail.next = nil
                temp.prev = nil
            end
            @length -= 1
            return temp
        end

        def unshift(value)
            node = Node.new(value)
            if is_empty?
                @head = node
                @tail = node
            else
                node.next = @head
                @head.prev = node
                @head = node
            end
            @length += 1
            return self
        end

        def shift()
            if is_empty?
                return nil
            end
            temp = @head
            if @length == 1
                @head = null
                @tail = null
            else
                @head = @head.next
                @head.prev = nil
                temp.next = nil
            end
            @length -= 1
            return temp
        end
        
        def find(index)
            if(index < 0 or index > @length)
                return nil
            end
            temp = @head
            if(index < @length/2)
                count = 0
                while(count < index)
                    temp = temp.next
                    count += 1
                end
            end
            if(index > @length/2)
                temp = @tail
                count = @length - 1
                while (count > index)
                    temp = temp.prev
                    count -= 1
                end
            end
            return temp
        end

        def setValue(index, value)
          node = find(index)
          if(node != nil)
            node.value = value
            return true
          end
          return false
        end
        def insert(index, value)
            if(index == 0)
                return unshift(value)
            end
            if(index == @length)
                return push(value)
            end
            if(index < 0 or index > @length)
                return nil
            end

            new_node = Node.new(value)

            before = find(index - 1)
            after = before.next
            before.next = new_node
            new_node.prev = before
            after.prev = new_node
            new_node.next = after
            @length += 1
            return self
        end

        def remove(index)
            if(index == 0)
                return shift()
            end
            if(index == @length)
                return pop()
            end
            if(index < 0 or index > length)
                return nil
            end
            node = find(index)
            node.prev.next = node.next
            node.next.prev = node.prev
            node.next = nil
            node.prev = nil
            @length -= 1
            return nil
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
