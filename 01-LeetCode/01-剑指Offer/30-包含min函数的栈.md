# 30-包含min函数的栈

## 说明

定义栈的数据结构，请在该类型中实现一个能够得到栈的最小元素的 min 函数在该栈中，调用 min、push 及 pop 的时间复杂度都是 O(1)。

## 示例

```
MinStack minStack = new MinStack();
minStack.push(-2);
minStack.push(0);
minStack.push(-3);
minStack.min();   --> 返回 -3.
minStack.pop();
minStack.top();      --> 返回 0.
minStack.min();   --> 返回 -2.
```

## 解

### 思路

### 复杂度
1. 时间复杂度O(1)，push(), pop(), top(), min() 四个函数的时间复杂度均为常数级别。
2. 空间复杂度O(N)，共有N个待入栈元素，辅助栈B需存储N个元素，使用O(N)额外空间。

```python
class MinStack:
    def __init__(self):
        """
        initialize your data structure here.
        """
        self.A = []
        self.B = []

    def push(self, x: int) -> None:
        self.A.append(x)
        # 当栈B为空，或栈B的最后一个元素大于等于x
        if not self.B or self.B[-1] >= x:
            self.B.append(x)
        else:
            self.B.append(self.B[-1])

    def pop(self) -> None:
        self.A.pop()
        self.B.pop()

    def top(self) -> int:
        return self.A[-1]

    def min(self) -> int:
        return self.B[-1]

# Your MinStack object will be instantiated and called as such:
# obj = MinStack()
# obj.push(x)
# obj.pop()
# param_3 = obj.top()
# param_4 = obj.min()
```