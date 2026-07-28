// File: list_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// ListNode nút của danh sách liên kết
type ListNode struct {
	Next *ListNode
	Val  int
}

// NewListNode hàm khởi tạo nút của danh sách liên kết
func NewListNode(v int) *ListNode {
	return &ListNode{
		Next: nil,
		Val:  v,
	}
}

// ArrayToLinkedList chuyển đổi mảng thành danh sách liên kết
func ArrayToLinkedList(arr []int) *ListNode {
	// nút giả (dummy) đầu danh sách liên kết
	dummy := NewListNode(0)
	node := dummy
	for _, val := range arr {
		node.Next = NewListNode(val)
		node = node.Next
	}
	return dummy.Next
}
