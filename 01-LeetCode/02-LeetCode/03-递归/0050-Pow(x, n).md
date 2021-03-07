# 0050-Pow(x, n)

## 说明
实现 $pow(x, n)$ , 即计算 x 的 n 次幂函数（即 $x^n$）。

## 解

### 思路
$$
x ^ n=
\begin{cases}
(x ^ 2)^{n // 2}& \text{n为偶数}\\
x * (x ^ 2) ^ {n // 2}& \text{n为奇数}
\end{cases}
$$

### 复杂度
1. 时间复杂度$O(logn)$
2. 空间复杂度$O(logn)$, 递归调用栈需要$O(logn)$的额外空间

```python
class Solution:
    def myPow(self, x: float, n: int) -> float:
        if n < 0:
            x = 1 / x
            n = -n
        if n == 0:
            return 1
        elif n == 1:
            return x
        if n & 1 == 1: # 奇数
            return x * self.myPow(x ** 2, n >> 1)
        elif n & 1 == 0: # 偶数
            return self.myPow(x ** 2, n >> 1)
```