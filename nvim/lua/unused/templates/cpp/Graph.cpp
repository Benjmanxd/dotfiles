#include <iostream>
#include <queue>
#include <set>
#include <stack>
#include <unordered_map>
#include <vector>

template <typename T>
void DFS(std::unordered_map<T, std::vector<T>> graph, T st) {
  std::set<T> visited;
  std::stack<T> s;
  s.push(st);
  while (!s.empty()) {
    T val = s.top();
    s.pop();
    if (visited.count(val)) {
      continue;
    } else {
      visited.insert(val);
    }
    std::cout << val << " ";

    auto &v = graph[val];
    if (v.empty())
      continue;
    for (auto it = v.rbegin(); it != v.rend(); ++it) {
      s.push(*it);
    }
  }
  std::cout << std::endl;
}

template <typename T>
void BFS(std::unordered_map<T, std::vector<T>> graph, T st) {
  std::set<T> visited;
  std::queue<T> q;
  q.push(st);
  while (!q.empty()) {
    T val = q.front();
    q.pop();
    if (visited.count(val)) {
      continue;
    } else {
      visited.insert(val);
    }
    std::cout << val << " ";

    auto &v = graph[val];
    if (v.empty())
      continue;
    for (auto it = v.begin(); it != v.end(); ++it) {
      q.push(*it);
    }
  }
  std::cout << std::endl;
}
