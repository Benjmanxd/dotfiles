#include <unordered_map>
#include <vector>

int longestSubarraySumK_Map(const std::vector<int> array_name, long long k) {
  long long n = array_name.size(), sum = 0;
  int max_len = 0;
  std::unordered_map<int, int> sumMap;

  for (int i = 0; i < n; i++) {
    sum += array_name[i];

    if (sumMap.find(sum) != sumMap.end()) {
      sumMap[sum] = std::min(sumMap[sum], i); // to handle zeros
    } else {
      sumMap[sum] = i;
    }

    int req_sum = sum - k;

    if (req_sum == 0) {
      max_len = std::max(max_len, i + 1);
    }

    if (sumMap.find(req_sum) != sumMap.end()) {
      max_len = std::max(max_len, i - sumMap[req_sum]);
    }
  }
  return max_len;
}

int longestSubarraySumK_TwoPointer(const std::vector<int> array_name, long long k) {
  long long n = array_name.size(), sum = 0;
  int max_len = 0;
  int l = 0;

  for (int r = 0; r < n; r++) {

    long long possible_sum = sum + array_name[r];

    while (possible_sum > k) {
      possible_sum -= array_name[l];
      l++;
    }

    if (possible_sum == k) {
      max_len = std::max(max_len, r - l + 1);
    }

    sum = possible_sum;
  }
  return max_len;
}
