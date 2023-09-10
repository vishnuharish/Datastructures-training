class Node {
  constructor(value) {
    this.value = value;
    this.next = null;
  }
}

class LinkedList {
  constructor(value) {
    const newNode = new Node(value);
    this.head = newNode;
    this.tail = this.head;
    this.length = 1;
  }

  push(value) {
    const newNode = new Node(value);
    if (!this.head) {
      this.head = newNode;
      this.tail = newNode;
    } else {
      this.tail.next = newNode;
      this.tail = newNode;
    }
    this.length++;
    return this;
  }

  pop() {
    if (!this.head) return undefined;
    let temp = this.head;
    let pre = this.head;
    while (temp.next) {
      pre = temp;
      temp = temp.next;
    }
    this.tail = pre;
    this.tail.next = null;
    temp.next = null;
    this.length--;
    if (this.length === 0) {
      this.head = null;
      this.tail = null;
    }
    return this;
  }

  unshift(value) {
    const newNode = new Node(value);
    if (!this.head) {
      this.head = newNode;
      this.tail = newNode;
    } else {
      let temp = this.head;
      newNode.next = temp;
      this.head = newNode;
    }
    this.length++;
    return this;
  }

  shift() {
    if (!this.head) {
      return undefined;
    }
    let temp = this.head;
    this.head = temp.next;
    temp.next = null;
    this.length--;
    if (this.length === 0) {
      this.head = null;
      this.tail == null;
    }
    return temp;
  }

  get(index) {
    if (index < 0 || index >= this.length) return undefined;
    let temp = this.head;
    for (let i = 0; i < index; i++) {
      temp = temp.next;
    }
    return temp;
  }

  set(index, value) {
    const node = this.get(index);
    if (node) {
      node.value = value;
    }
    return this;
  }

  insert(index, value) {
    if (index < 0 || index >= this.length) return undefined;
    if (index === 0) return unshift(value);
    if (index === this.length - 1) return push(value);
    const newNode = new Node(value);
    let temp = this.get(index - 1);
    newNode.next = temp.next;
    temp.next = newNode;
    this.length++;
    return this;
  }

  remove(index) {
    if (index < 0 || index <= this.length) return undefined;
    if (index === 0) return shift();
    if (index === this.length - 1) return pop();
    let before = this.get(index - 1);
    let temp = before.next;
    before.next = temp.next;
    temp.next = null;
    this.length--;
    return temp;
  }
}
