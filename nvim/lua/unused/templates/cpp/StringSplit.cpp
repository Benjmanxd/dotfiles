#include <string>
#include <vector>

std::vector<std::string_view> StringSplit_without_copy(const std::string& s, char delimiter) {
  std::vector<std::string_view> result;

  int delimLeft = 0;
  int delimRight = -1;

  for (int i = 0; i < static_cast<int>(s.size()); i++) {
    if (s[i] == delimiter) {
      delimLeft = delimRight;
      delimRight = i;
      int index = delimLeft + 1;
      int length = delimRight - index;
      std::string_view column(s.data() + index, length);
      result.push_back(column);
    }
  }
  const std::string_view finalColumn(s.data() + delimRight + 1, s.size() - delimRight - 1);
  result.push_back(finalColumn);

  return result;
}
