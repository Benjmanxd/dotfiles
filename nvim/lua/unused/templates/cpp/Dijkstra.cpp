#include <iostream>
#include <queue>
#include <set>

#define V 9

template <typename T> void dijkstra(T g[V][V], int src) {
  std::set<T> s;
  int dist[V];
  for (int i = 0; i < V; ++i) {
    dist[i] = INT32_MAX;
  }
  dist[src] = 0;

  std::queue<T> q;
  q.push(src);

  while (!q.empty()) {
    int sz = q.size();
    while (sz--) {
      T val = q.front();
      q.pop();
      if (s.count(val)) {
        continue;
      } else {
        s.insert(val);
      }

      for (int i = 0; i < V; ++i) {
        if (g[val][i] == 0)
          continue;

        if (g[val][i] + dist[val] < dist[i])
          dist[i] = g[val][i] + dist[val];
        q.push(i);
      }
    }
  }

  for (int i = 0; i < V; ++i) {
    std::cout << src << " -> " << i << ": " << dist[i] << std::endl;
  }
}
