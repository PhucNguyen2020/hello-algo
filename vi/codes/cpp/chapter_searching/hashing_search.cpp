/**
 * File: hashing_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Tìm kiếm băm (mảng) */
int hashingSearchArray(unordered_map<int, int> map, int target) {
    // Khóa của bảng băm: phần tử mục tiêu, giá trị: chỉ số
    // Nếu khóa này không tồn tại trong bảng băm, trả về -1
    if (map.find(target) == map.end())
        return -1;
    return map[target];
}

/* Tìm kiếm băm (danh sách liên kết) */
ListNode *hashingSearchLinkedList(unordered_map<int, ListNode *> map, int target) {
    // Khóa của bảng băm: giá trị nút mục tiêu, giá trị: đối tượng nút
    // Trả về nullptr nếu khóa không tồn tại trong bảng băm
    if (map.find(target) == map.end())
        return nullptr;
    return map[target];
}

/* Mã chạy chương trình */
int main() {
    int target = 3;

    /* Tìm kiếm băm (mảng) */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    // Khởi tạo bảng băm
    unordered_map<int, int> map;
    for (int i = 0; i < nums.size(); i++) {
        map[nums[i]] = i; // khóa: phần tử, giá trị: chỉ số
    }
    int index = hashingSearchArray(map, target);
    cout << "Index of target element 3 = " << index << endl;

    /* Tìm kiếm băm (danh sách liên kết) */
    ListNode *head = vecToLinkedList(nums);
    // Khởi tạo bảng băm
    unordered_map<int, ListNode *> map1;
    while (head != nullptr) {
        map1[head->val] = head; // khóa: giá trị nút, giá trị: nút
        head = head->next;
    }
    ListNode *node = hashingSearchLinkedList(map1, target);
    cout << "Node object corresponding to target node value 3 is " << node << endl;

    return 0;
}
