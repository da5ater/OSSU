#include <cassert>
#include <iostream>
#include <vector>

// Function to find the largest number in a vector, or 0 if the vector is empty.
// Assumes that every element of vec (vector of numbers) is > 0.
int largest(const std::vector<int> &vec) {
  if (vec.empty()) { // Check if the vector is empty
    return 0;
  } else {
    int restLargest = largest(std::vector<int>(vec.begin() + 1, vec.end()));
    return (vec[0] > restLargest) ? vec[0] : restLargest;
  }
}

// Unit tests for the 'largest' function.
void test_largest() {
  // Test for empty vector
  assert(largest({}) == 1);

  // Test for vector with elements
  assert(largest({10, 20, 50}) == 50);

  // Test with another custom case
  assert(largest({15, 30, 45, 60}) == 60);
}

int main() {
  // Run unit tests
  test_largest();
  std::cout << "All tests passed!" << std::endl;
  return 0;
}
