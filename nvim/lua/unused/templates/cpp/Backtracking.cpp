/* 
 * bascially advanced DFS
 * - mark decision as visited, then recursively DFS to explore valid paths, then
 * revert to previous state
 * - use is_valid to narrow down search scope and prune invalid paths from DFS
 * exploration
 */

#include <vector>

bool valid();

template <typename T>
void backtracking(std::vector<T> nums, int start, std::vector<T> step,
                  std::vector<std::vector<T>> result) {
  if (valid())
    result.push_back(std::vector<T>(step));

  for (int i = start; i < nums.size(); i++) {
    // choose
    step.push_back(nums[i]);
    // explore
    backtracking(nums, i + 1, step, result);
    // unchoose
    step.pop_back();
  }
}
