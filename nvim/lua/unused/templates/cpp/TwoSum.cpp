/*
 * Two Pointer approach:
 * time: O(nlogn)
 * space: O(1)
 *
 * Unordered map approach:
 * time: O(n)
 * space: O(n)
 */

#include <algorithm>
#include <unordered_map>
#include <vector>

int TwoSum_TwoPointer(std::vector<int> &nums, int k) {
  std::sort(nums.begin(), nums.end());
  int counter = 0;
  int st = 0;
  int end = nums.size() - 1;

  while (st < end) {
    int sum = nums[st] + nums[end];
    if (sum == k) {
      ++counter;
      ++st;
      --end;
    } else if (sum < k)
      ++st;
    else
      --end;
  }
  return counter;
}

int TwoSum_UnorderedMap(std::vector<int> &nums, int k) {
  std::unordered_map<int, int> m;
  int count = 0;

  for (int i = 0; i < nums.size(); ++i) {
    int diff = k - nums[i];
    if (m[diff] == 0) {
      ++m[nums[i]];
    } else {
      --m[diff];
      ++count;
    }
  }
}
