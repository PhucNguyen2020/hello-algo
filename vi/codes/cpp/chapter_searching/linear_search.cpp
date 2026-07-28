/**
 * File: linear_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Tìm kiếm tuyến tính (mảng) */
int linearSearchArray(vector<int> &nums, int target) {
    // Duyệt mảng
    for (int i = 0; i < nums.size(); i++) {
        // Tìm thấy phần tử mục tiêu, trả về chỉ số của nó
        if (nums[i] == target)
            return i;
    }
    // Không tìm thấy phần tử mục tiêu, trả về -1
    return -1;
}

/* Tìm kiếm tuyến tính (danh sách liên kết) */
ListNode *linearSearchLinkedList(ListNode *head, int target) {
    // Duyệt danh sách liên kết
    while (head != nullptr) {
        // Tìm thấy nút mục tiêu, trả về nó
        if (head->val == target)
            return head;
        head = head->next;
    }
    // Không tìm thấy nút mục tiêu, trả về nullptr
    return nullptr;
}

/* Mã chạy chương trình */
int main() {
    int target = 3;

    /* Thực hiện tìm kiếm tuyến tính trong mảng */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    int index = linearSearchArray(nums, target);
    cout << "Index of target element 3 = " << index << endl;

    /* Thực hiện tìm kiếm tuyến tính trong danh sách liên kết */
    ListNode *head = vecToLinkedList(nums);
    ListNode *node = linearSearchLinkedList(head, target);
    cout << "Node object corresponding to target node value 3 is " << node << endl;

    return 0;
}
