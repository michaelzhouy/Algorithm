# 广度优先搜索 BFS

```python
queue = [起始点]    # 队列实现BFS
visited = set()    # 记录访问过的元素点，避免“回头”访问，陷入循环
visited.add(起始点)
step = 0
while queue:
    # 将所有节点同时向前扩散一步
    for _ in range(len(queue)):
        cur = queue.popleft()
        if 找到目标:
            return 结果
        # 将cur的【所有相邻且没被访问过的节点】加入队列
        for near in cur的邻近节点:
            if near not in visited:
                queue.append(near)
                visited.add(near)
    step += 1    # 记录路径长度
```

## 模板1 不需要确定当前遍历到了哪一层

```python
while queue 不空:
    cur = queue.pop()
    for 节点 in cur的所有相邻节点:
        if 该节点有效且未访问过:
            queue.append(该节点)
```

## 模板2 要确定当前遍历到了哪一层

```python
step = 0
while queue 不空:
    for_ in range(len(queue)):
        cur = queue.pop()
        for 节点 in cur的所有相邻节点:
            if 该节点有效且未被访问过:
                queue.append(该节点)
    step += 1
```