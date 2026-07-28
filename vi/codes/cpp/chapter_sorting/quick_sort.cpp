/**
 * File: quick_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Lớp sắp xếp nhanh */
class QuickSort {
  private:
    /* Phân vùng bằng phần tử chuẩn (sentinel) */
    static int partition(vector<int> &nums, int left, int right) {
        // Dùng nums[left] làm điểm chốt (pivot)
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Tìm từ phải sang trái phần tử đầu tiên nhỏ hơn điểm chốt
            while (i < j && nums[i] <= nums[left])
                i++;                // Tìm từ trái sang phải phần tử đầu tiên lớn hơn điểm chốt
            swap(nums[i], nums[j]); // Hoán đổi hai phần tử này
        }
        swap(nums[i], nums[left]);  // Hoán đổi điểm chốt về ranh giới giữa hai mảng con
        return i;                   // Trả về chỉ số của điểm chốt
    }

  public:
    /* Sắp xếp nhanh */
    static void quickSort(vector<int> &nums, int left, int right) {
        // Kết thúc đệ quy khi độ dài mảng con là 1
        if (left >= right)
            return;
        // Phân vùng bằng phần tử chuẩn
        int pivot = partition(nums, left, right);
        // Xử lý đệ quy mảng con bên trái và mảng con bên phải
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* Lớp sắp xếp nhanh (tối ưu chọn điểm chốt trung vị) */
class QuickSortMedian {
  private:
    /* Chọn trung vị của ba phần tử ứng viên */
    static int medianThree(vector<int> &nums, int left, int mid, int right) {
        int l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l))
            return mid; // m nằm giữa l và r
        if ((m <= l && l <= r) || (r <= l && l <= m))
            return left; // l nằm giữa m và r
        return right;
    }

    /* Phân vùng bằng phần tử chuẩn (trung vị của ba) */
    static int partition(vector<int> &nums, int left, int right) {
        // Chọn trung vị của ba phần tử ứng viên
        int med = medianThree(nums, left, (left + right) / 2, right);
        // Hoán đổi trung vị về vị trí ngoài cùng bên trái của mảng
        swap(nums[left], nums[med]);
        // Dùng nums[left] làm điểm chốt (pivot)
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Tìm từ phải sang trái phần tử đầu tiên nhỏ hơn điểm chốt
            while (i < j && nums[i] <= nums[left])
                i++;                // Tìm từ trái sang phải phần tử đầu tiên lớn hơn điểm chốt
            swap(nums[i], nums[j]); // Hoán đổi hai phần tử này
        }
        swap(nums[i], nums[left]);  // Hoán đổi điểm chốt về ranh giới giữa hai mảng con
        return i;                   // Trả về chỉ số của điểm chốt
    }

  public:
    /* Sắp xếp nhanh */
    static void quickSort(vector<int> &nums, int left, int right) {
        // Kết thúc đệ quy khi độ dài mảng con là 1
        if (left >= right)
            return;
        // Phân vùng bằng phần tử chuẩn
        int pivot = partition(nums, left, right);
        // Xử lý đệ quy mảng con bên trái và mảng con bên phải
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }
};

/* Lớp sắp xếp nhanh (tối ưu độ sâu đệ quy) */
class QuickSortTailCall {
  private:
    /* Phân vùng bằng phần tử chuẩn (sentinel) */
    static int partition(vector<int> &nums, int left, int right) {
        // Dùng nums[left] làm điểm chốt (pivot)
        int i = left, j = right;
        while (i < j) {
            while (i < j && nums[j] >= nums[left])
                j--;                // Tìm từ phải sang trái phần tử đầu tiên nhỏ hơn điểm chốt
            while (i < j && nums[i] <= nums[left])
                i++;                // Tìm từ trái sang phải phần tử đầu tiên lớn hơn điểm chốt
            swap(nums[i], nums[j]); // Hoán đổi hai phần tử này
        }
        swap(nums[i], nums[left]);  // Hoán đổi điểm chốt về ranh giới giữa hai mảng con
        return i;                   // Trả về chỉ số của điểm chốt
    }

  public:
    /* Sắp xếp nhanh (tối ưu độ sâu đệ quy) */
    static void quickSort(vector<int> &nums, int left, int right) {
        // Kết thúc khi độ dài mảng con là 1
        while (left < right) {
            // Thao tác phân vùng bằng phần tử chuẩn
            int pivot = partition(nums, left, right);
            // Thực hiện sắp xếp nhanh trên mảng con ngắn hơn trong hai mảng con
            if (pivot - left < right - pivot) {
                quickSort(nums, left, pivot - 1); // Đệ quy sắp xếp mảng con bên trái
                left = pivot + 1;                 // Khoảng chưa sắp xếp còn lại là [pivot + 1, right]
            } else {
                quickSort(nums, pivot + 1, right); // Đệ quy sắp xếp mảng con bên phải
                right = pivot - 1;                 // Khoảng chưa sắp xếp còn lại là [left, pivot - 1]
            }
        }
    }
};

/* Mã chạy chương trình */
int main() {
    /* Sắp xếp nhanh */
    vector<int> nums{2, 4, 1, 0, 3, 5};
    QuickSort::quickSort(nums, 0, nums.size() - 1);
    cout << "After quick sort completes, nums = ";
    printVector(nums);

    /* Sắp xếp nhanh (tối ưu độ sâu đệ quy) */
    vector<int> nums1 = {2, 4, 1, 0, 3, 5};
    QuickSortMedian::quickSort(nums1, 0, nums1.size() - 1);
    cout << "After quick sort (median pivot optimization), nums = ";
    printVector(nums1);

    /* Sắp xếp nhanh (tối ưu độ sâu đệ quy) */
    vector<int> nums2 = {2, 4, 1, 0, 3, 5};
    QuickSortTailCall::quickSort(nums2, 0, nums2.size() - 1);
    cout << "After quick sort (recursion depth optimization), nums = ";
    printVector(nums2);

    return 0;
}
