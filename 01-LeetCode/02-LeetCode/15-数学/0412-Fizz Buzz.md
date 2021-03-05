# 0412-Fizz Buzz

## 说明
写一个程序, 输出从 1 到 n 数字的字符串表示
1. 如果 n 是3的倍数, 输出“Fizz”;
2. 如果 n 是5的倍数, 输出“Buzz”;
3. 如果 n 同时是3和5的倍数, 输出 “FizzBuzz”

## 示例
```
n = 15
返回:
[
    "1",
    "2",
    "Fizz",
    "4",
    "Buzz",
    "Fizz",
    "7",
    "8",
    "Fizz",
    "Buzz",
    "11",
    "Fizz",
    "13",
    "14",
    "FizzBuzz"
]
```

## 解 数学

### 思路
见代码

### 复杂度
1. 时间复杂度$O(N)$
2. 空间复杂度$O(1)$

```python
class Solution:
    def fizzBuzz(self, n: int) -> List[str]:
        res = []
        for i in range(1, n + 1):
            if i % 15 == 0:
                res.append('FizzBuzz')
            elif i % 3 == 0:
                res.append('Fizz')
            elif i % 5 == 0:
                res.append('Buzz')
            else:
                res.append(str(i))
        return res
```