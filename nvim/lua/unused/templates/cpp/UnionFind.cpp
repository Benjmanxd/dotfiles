class UnionFind {
public:
  UnionFind(int length) {
    parent = new int[length];
    for (int i = 0; i < length; ++i) {
      parent[i] = i;
    }
    count = length;
  }

  ~UnionFind() { delete[] parent; }

  int get_count() const { return count; }

  int find_op(int val) {
    if (parent[val] != val)
      parent[val] = find_op(parent[val]);
    return parent[val];
  }

  void union_op(int l, int r) {
    int parent_l = find_op(l);
    int parent_r = find_op(r);

    if (parent_l == parent_r)
      return;
    parent[parent_r] = parent_l;
    --count;
  }

private:
  int *parent;
  int count;
};
