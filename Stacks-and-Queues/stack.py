class Node:
    def __init__(self, value):
        self.value = value
        self.next = None


class Stack:
    def __init__(self, value):
        new_node = Node(value)
        self.top = new_node
        self.length = 1

    def push(self, value):
        new_node = Node(value);
        if self.top == None:
            self.top = new_node
        else:
            new_node.next = self.top
            self.top = new_node

        self.length += 1
        return self

    def pop(self): 
        if self.top == None:
            return None
        temp = self.top
        self.top = self.top.next
        temp.next = None
        self.length -= 1
        return temp


