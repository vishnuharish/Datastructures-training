class Node {
    constructor(value){
        this.value = value;
        this.next = null;
        this.prev = null;
    }
}

class DoubllyLinkedList {
    constructor(value){
        const newNode = new Node(value);
        this.head = newNode;
        this.tail = newNode;
        this.length = 1;
    }

    push(value){
        const newNode = new Node(value);
        if(!this.head){
            this.head = newNode;
            this.tail = this.head;
        } else {
            this.tail.next = newNode;
            newNode.prev = this.tail;
            this.tail = newNode;
        }
        this.length += 1;
        return this;
    }

    pop(){
        if(!this.length === 0){
            return undefined;
        }
        let temp = this.tail
        if(this.length === 1){
            this.head = null;
            this.tail = null
        } else {
            this.tail = this.tail.prev;
            this.tail.next = null;
            temp.prev = null;
        }
        this.length --;
        return temp
    }

    unshift(value){
        const node = new Node(value);
        if(!this.head){
            this.head = node;
            this.tail = node;
        } else {
            node.next = this.head;
            this.head.prev = node;
            this.head = node
        }
        this.length += 1;
        return this;
        
    }
}