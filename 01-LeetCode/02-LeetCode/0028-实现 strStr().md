# 0028-实现 strStr()

## 说明
给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。

## 示例
```
输入: haystack = "hello", needle = "ll"
输出: 2

输入: haystack = "aaaaa", needle = "bba"
输出: -1
```

## 解1 字符串比较

### 思路
遍历+字符串比较

### 复杂度
1. 时间复杂度$O(N \times (M - N + 1))=O(N \times (M - N))$, M, N分别为haystack和needle的长度
2. 空间复杂度O(1)

```python
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        m, n = len(haystack), len(needle)
        for i in range(m - n + 1):
            # 全部比较
            if haystack[i: i + n] == needle:
                return i
        return -1
```

```python
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        if not needle:
            return 0
        m, n = len(haystack), len(needle)
        p = 0
        while fast < m - n + 1:
            if haystack[p] == needle[0]: # 第一个字符串相等, 才全部比较
                if haystack[p: p + n] == needle:
                    return p
            fast += 1
        return -1
```

## 解2 双指针

### 思路
1. 依次比较每个字符是否相等, 同时记录相等字符个数
2. 如果个数等于needle的长度, 直接返回p - curLen
3. 回溯p到p - curLen + 1

### 复杂度
1. 时间复杂度$O((M−N)N)$, 最坏时间复杂度为$O((M−N)N)$, 最优时间复杂度为$O(N)$
2. 空间复杂度$O(1)$

```python
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        if not needle:
            return 0
        m, n = len(haystack), len(needle)
        p = 0
        while p < m - n + 1:
            while p < m - n + 1 and haystack[p] != needle[0]:
                p += 1
            curLen, q = 0, 0
            while q < n and p < m and haystack[p] == needle[q]:
                p += 1
                q += 1
                curLen += 1
            if curLen == n:
                return p - curLen
            p = p - curLen + 1 # 回溯
        return -1
```