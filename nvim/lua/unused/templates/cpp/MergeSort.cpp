/*
 * - recursively split array into half until single element
 * - do sorting and combine
 *
 * sort: O(nlogn)
 */

template <typename T>
void merge(T array[], const int l, const int m, const int r) {
  const int lArrEnd = m - l + 1;
  const int rArrEnd = r - m;

  auto *lArr = new T[lArrEnd], *rArr = new T[rArrEnd];
  for (auto i = 0; i < lArrEnd; i++)
    lArr[i] = array[l + i];
  for (auto j = 0; j < rArrEnd; j++)
    rArr[j] = array[m + 1 + j];

  auto lArrIdx = 0, rArrIdx = 0;
  int mergedArrIdx = l;

  // Merge the temp arrays back into array[l..r]
  while (lArrIdx < lArrEnd && rArrIdx < rArrEnd) {
    if (lArr[lArrIdx] <= rArr[rArrIdx]) {
      array[mergedArrIdx] = lArr[lArrIdx];
      lArrIdx++;
    } else {
      array[mergedArrIdx] = rArr[rArrIdx];
      rArrIdx++;
    }
    mergedArrIdx++;
  }

  // Copy the remaining elements of l[], if there are any
  while (lArrIdx < lArrEnd) {
    array[mergedArrIdx] = lArr[lArrIdx];
    lArrIdx++;
    mergedArrIdx++;
  }

  // Copy the remaining elements of r[], if there are any
  while (rArrIdx < rArrEnd) {
    array[mergedArrIdx] = rArr[rArrIdx];
    rArrIdx++;
    mergedArrIdx++;
  }

  delete[] lArr;
  delete[] rArr;
}

template <typename T>
void mergeSort(T array[], const int l, const int r) {
  if (l >= r)
    return;

  int m = l + (r - l) / 2;
  mergeSort(array, l, m);
  mergeSort(array, m + 1, r);
  merge(array, l, m, r);
}
