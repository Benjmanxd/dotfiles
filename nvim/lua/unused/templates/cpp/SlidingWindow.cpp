/*
 * space: O(1)
 * time: O(n)
 */

#include <vector>

bool invalid();

int SlidingWindow_Shrinkable(const std::vector<int> &nums) {
  int r = 0, l = 0, ans = 0, N = nums.size();
  for (; r < N; ++r) {
    // CODE: use A[j] to update state which might make the window invalid
    for (; invalid(); ++l) { // when invalid, keep shrinking the left edge until
                             // it's valid again
      // CODE: update state using A[i]
    }
    // the window [i, j] is the maximum window we've found thus far
    ans = std::max(ans, r - l + 1);
  }
  return ans;
}

int SlidingWindow_NonShrinkable(const std::vector<int> &nums) {
  int r = 0, l = 0, N = nums.size();
  for (; r < N; ++r) {
    // CODE: use A[j] to update state which might make the window invalid
    if (invalid()) { // Increment the left edge ONLY when the window is invalid.
                     // In this way, the window GROWs when it's valid, and
                     // SHIFTs when it's invalid
      // CODE: update state using A[i]
      ++l;
    }
    // after `++j` in the for loop, this window `[i, j)` of length `j - i` MIGHT
    // be valid.
  }
  return r - l; // There must be a maximum window of size `j - i`.
}
