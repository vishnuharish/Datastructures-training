class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None


class BST:
    def __init__(self):
        self.root = None

    def insert(self, value):
        new_node = Node(value)
        if self.root == None:
            self.root = new_node
            return self
        temp = self.root
        while True:
            if new_node.value == temp.value:
                return None
            if new_node.value < temp.value:
                if temp.left == None:
                    temp.left = new_node
                    return self
                temp = temp.left
            else:
                if temp.right == None:
                    temp.right = new_node
                    return self
                temp = temp.right

    def contains(self, value):
        if(self.root == None):
            return False
        temp = self.root
        while(temp):
            if(value < temp.value):
                temp = temp.left
            elif value > temp.value:
                temp = temp.right
            else:
                return True
        return False

    def min_value_node(self, current_node):
        while current_node.left != None:
            current_node = current_node.left
        return current_node
        
