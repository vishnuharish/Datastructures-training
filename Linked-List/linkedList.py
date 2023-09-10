class Node:
    def __init__(self,value):
        self.value = value
        self.next = None

    def __repr__(self):
        return "|{value}| -> {ref}".format(value = self.value, ref=self.next)
class LinkedList:
    def __init__(self, value):
        new_node = Node(value)
        self.head = new_node
        self.tail = self.head
        self.length = 1

    def push(self,value):
        new_node = Node(value)
        if self.head == None:
            self.head = new_node
            self.tail = new_node
        else:
            self.tail.next = new_node
            self.tail = new_node
        self.length += 1
        return self

    def pop(self):
        if self.head == None:
            return None
        temp = self.head
        pre = self.head
        while temp.next != None:
            pre = temp
            temp= temp.next
        self.tail = pre
        self.tail.next = None
        temp.next = None
        self.length -= 1
        if self.length == 0:
            self.head = None
            self.tail = None
        return temp
    
    def unshift(self, value):
        new_node = Node(value)
        if(self.head == None):
            self.head = new_node
            self.tail = new_node
        else:
            new_node.next = self.head
            self.head = new_node
        self.length += 1
        return self

    def shift(self):
        if self.head == None:
            return None
        temp = self.head
        self.head = temp.next
        self.length -= 1
        if self.length == 0:
            self.tail = None
        temp.next = None
        return temp

    def getNode(self, index):
        count = 0
        temp = self.head
        while count < index:
            temp = temp.next
            count += 1
        return temp
        

    def setValue(self, index, value):
        node = self.getNode(index)
        if node != None:
            node.value = value
            return True
        return False


    def insertValue(self, index, value):
        if index < 0 or index > self.length:
            return None
        if index == 0:
            return unshift(value)
        if index == self.length:
            return self.push(value)
        new_node = Node(value)
        temp = self.getNode(index - 1)
        new_node.next = temp.next
        temp.next = new_node
        self.length += 1
        return self

    def removeNode(self, index):
        if index < 0 or index >= self.length :
            return None
        if index == 0:
            return self.shift()
        if index == self.length - 1:
            return self.pop()
        before = self.getNode(index - 1)
        temp = before.next
        before.next = temp.next
        temp.next = None
        self.length -= 1
        return temp

    def printList(self):
        temp = self.head
        while temp:
            print("|", temp.value, "|", " -> ", end="")
            temp = temp.next
        print("None")




