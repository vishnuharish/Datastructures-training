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
    
    def pop(self):
        if self.head == None:
            return None
        if self.length == 1:
            self.head = None
            self.tail = None
        else:
            temp = self.tail
            self.tail = self.tail.prev
            self.tail.next = None
            temp.prev = None
        self.length -= 1
        return temp
    
    def unshift(self, value):
        node = Node(value)
        if self.head == None:
            self.head = node
            self.tail = node
        else:
            node.next = self.head
            self.head.prev = node
            self.head = node
        self.length += 1
        return self
    
    def shift(self):
        if(self.length == 0):
            return None
        temp = self.head
        if(self.length == 1):
            self.head = None
            self.tail = None
        else:
            self.head = self.head.next
            self.head.prev = None
            temp.next = None
        self.length -= 1
        return temp

    def find(self, index):
        if(index < 0 or index > self.length):
            return None
        temp = self.head
        if(index < self.length / 2):
            count = 0
            while count < index:
                temp = temp.next
                count += 1
        if(index > self.length / 2):
            temp = self.tail
            count = self.length - 1
            while count > index:
                temp = temp.prev
                count -= 1
        return temp
    
    def setValue(self, index, value):
        node = self.find(index)
        if(node):
            node.value = value
            return True
        return False
