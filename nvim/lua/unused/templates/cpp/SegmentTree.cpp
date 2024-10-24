/*
 * space: O(n)
 * build: O(n)
 * query: O(logn)
 * update: O(logn)
 *
 * number of nodes: 2*n-1 (full tree with n leaves)
 * usage: ranged sum
 */

#include <cmath>
#include <vector>

template <typename T>
T build(std::vector<T> &st, const std::vector<T> &nums, int i, int l, int r) {
  if (l == r) {
    st[i] = nums[l];
  } else {
    int m = l + (r - l) / 2;
    st[i] =
        build(st, nums, 2 * i + 1, l, m) + build(st, nums, 2 * i + 2, m + 1, r);
  }
  return st[i];
}

template <typename T>
T query(const std::vector<T> &st, int i, int l, int r, int qL, int qR) {
  if (l >= qL && r <= qR) {
    return st[i];
  } else if (r < qL || l > qR) {
    return 0;
  }

  int m = l + (r - l) / 2;
  return query(st, 2 * i + 1, l, m, qL, qR) +
         query(st, 2 * i + 2, m + 1, r, qL, qR);
}

template <typename T>
void update(const std::vector<T> &st, int i, int l, int r, int idx, int diff) {
  if (idx > r || idx < l) {
    return;
  }

  st[i] += diff;
  int m = l + (r - l) / 2;
  update(st, 2 * i + 1, l, m, idx, diff);
  update(st, 2 * i + 2, m + 1, r, idx, diff);
}

template <typename T> std::vector<T> &init(const std::vector<T> &nums) {
  int sz = exp2(ceil(log2(nums.size()))) * 2 - 1;
  std::vector<T> st(sz, 0);
  build(st, nums, 0, 0, nums.size() - 1);
  return st;
}
