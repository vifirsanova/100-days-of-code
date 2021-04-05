class Stack:

    def __init__(self):
        self.stack = []

    def push_s(self, data):
        if data not in self.stack:
            self.stack.append(data)
        else:
            pass

    def pop_s(self):
        if len(self.stack) <= 0:
            print("The stack is empty")
        else:
            self.stack.pop()

    def peek(self):
        return self.stack[-1]

    def show_all(self):
        return self.stack


stack1 = Stack()
stack1.push_s(1)
stack1.push_s(2)
stack1.push_s(3)
stack1.push_s(1)
print(stack1.show_all())
# [1, 2, 3]
print(stack1.peek())
# 3
stack1.pop_s()
print(stack1.show_all())
# [1, 2]
stack1.pop_s()
stack1.pop_s()
stack1.pop_s()
# The stack is empty
print(stack1.show_all())
# []
