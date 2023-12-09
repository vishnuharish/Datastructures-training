class Tree:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None


class BST:
    def __init__(self):
        self.root = null

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
                if temp.right === None:
                    temp.right = new_node
                    return self
                temp = temp.right
