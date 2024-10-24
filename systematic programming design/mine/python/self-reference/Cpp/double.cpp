#include <cassert>
#include <iostream>
#include <vector>

// Function to double all elements in a list (vector)
std::vector<int> doubleList(const std::vector<int> &lon) {
  if (lon.empty()) {
    return {};
  } else {
    std::vector<int> result = {lon[0] * 2};
    std::vector<int> rest = doubleList({lon.begin() + 1, lon.end()});
    result.insert(result.end(), rest.begin(), rest.end());
    return result;
  }
}

int main() {
  // Equivalent to the check-expect tests
  assert(doubleList({}) == std::vector<int>{});   // empty case
  assert(doubleList({1}) == std::vector<int>{2}); // (cons 1 empty)
  assert(doubleList({1, 2}) ==
         std::vector<int>{2, 4}); // (cons 1 (cons 2 empty))

  std::cout << "All tests passed!" << std::endl;
  return 0;
}
