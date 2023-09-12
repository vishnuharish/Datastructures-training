class Node():
    def __init__(self, value):
        self.value = value
        self.next = None
        self.prev = None

class DoubllyLinkedList():
    def __init__(self,value):
        node = Node(value)
        self.head = node
        self.tail = self.head
        self.length = 1
    
    def push(self, value):
        node = Node(value)
        if self.head == None:
            self.head = node
            self.tail = self.head
        else:
            self.tail.next = node
            node.prev =self.tail
            self.tail = node
        self.length += 1
        return self
