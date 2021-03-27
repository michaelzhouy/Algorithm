# 30-包含min函数的栈

## 说明
定义栈的数据结构, 请在该类型中实现一个能够得到栈的最小元素的 `min` 函数在该栈中, 调用 `min`, `push` 及 `pop` 的时间复杂度都是 $O(1)$

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
1. 时间复杂度$O(1)$, `push(), pop(), top(), min()` 四个函数的时间复杂度均为常数级别。
2. 空间复杂度$O(N)$, 共有`N`个待入栈元素, 辅助栈 `stack2` 需存储 `N` 个元素, 使用$O(N)$额外空间。

```python
class MinStack:

    def __init__(self):
        """
        initialize your data structure here.
        """
        self.stack1 = []
        self.stack2 = []

    def push(self, x: int) -> None:
        self.stack1.append(x)
        # 如果栈stack2为空, 或x小于等于栈stack2的栈顶元素
        if not self.stack2 or x <= self.stack2[-1]:
            self.stack2.append(x)
        # 如果x大于栈stack2中的栈顶元素, 将栈顶元素入栈
        else:
            self.stack2.append(self.stack2[-1])

    def pop(self) -> None:
        self.stack1.pop()
        self.stack2.pop()

    def top(self) -> int:
        return self.stack1[-1]

    def min(self) -> int:
        return self.stack2[-1]
```