class Node:
    def __init__(self, data):  # Fixed typo here
        self.data = data
        self.next = None

class LinkedList:
    def __init__(self):
        self.head = None

    def traverse(self):
        temp = self.head
        while temp:
            print(temp.data, end=' ')
            temp = temp.next
        print("NULL")

def insert(self,new_data):
    new_node=Node(new_data)
    new_node.next=self.head
    self.head=new_node
def insert_at_begining(self,value,pos):
    if pos==0:
        self.insert(value)
        return
    new_node=Node(value)
    new_node.next=

    def sort(self):
        current=self.head
        while swapped:
            swapped=True
            while current:
                if current.data>current.next.data:
                    current.next=self.head
                    current=current.next.next
                    swapped=False


if __name__ == "__main__":
    ll = LinkedList()
    for value in [1, 2, 3, 4, 5]:
        ll.insert(value)
    ll.traverse()