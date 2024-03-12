/*
 * space: O(n)
 * binary search: O(logn)
 *
 * usage: search in sorted array
 */

#include <vector>

template <typename T> int binary_search(const std::vector<T> &arr, int n, T x) {
  int l = 0;
  int r = n - 1;

  while (l <= r) {
  int m = l + (r - l) / 2;

    if (arr[m] == x)
      return m;
    else if (arr[m] < x)
      l = m + 1;
    else
      r = m - 1;
  }

  return -1;
}
