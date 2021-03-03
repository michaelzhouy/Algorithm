# 0171-Excel表列序号

## 说明
给定一个Excel表格中的列名称，返回其相应的列序号。
```
    A -> 1
    B -> 2
    C -> 3
    ...
    Z -> 26
    AA -> 27
    AB -> 28 
    ...
```

## 示例
```
输入: "A"
输出: 1

输入: "AB"
输出: 28
```

## 解1 字典映射

### 思路
将Excel列名称与数值对应起来, 然后累加

### 思路
1. 时间复杂度O(N), N为s的长度
2. 空间复杂度O(1), title和number占用常数空间

```python
class Solution:
    def titleToNumber(self, s: str) -> int:
        n = len(s)
        title = [chr(i) for i in range(65, 91)] # chr()将ASCII码转换为字符
        number = list(range(1, 27))
        dic = dict(zip(title, number))
        res = 0
        for i in range(n):
            res = res * 26 + dic[s[i]]
        return res
```

## 解2

### 思路
通过 ord(s[i]) - 64 将字符转换为对应的数值

### 复杂度
1. 时间复杂度O(N)
2. 空间复杂度O(1)

```python
class Solution:
    def titleToNumber(self, s: str) -> int:
        res = 0
        for i in range(len(s)):
            res = res * 26 + ord(s[i]) - 64 # ord()将字符转换为ASCII码
        return res
```