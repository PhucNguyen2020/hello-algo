// File: tree_node.go
// Created Time: 2022-11-25
// Author: Reanon (793584285@qq.com)

package pkg

// TreeNode nút của cây nhị phân
type TreeNode struct {
	Val    any       // Giá trị nút
	Height int       // Chiều cao nút
	Left   *TreeNode // Tham chiếu đến nút con trái
	Right  *TreeNode // Tham chiếu đến nút con phải
}

// NewTreeNode hàm khởi tạo nút của cây nhị phân
func NewTreeNode(v any) *TreeNode {
	return &TreeNode{
		Val:    v,
		Height: 0,
		Left:   nil,
		Right:  nil,
	}
}

// Về quy tắc mã hóa tuần tự hóa, vui lòng tham khảo:
// https://www.hello-algo.com/chapter_tree/array_representation_of_tree/
// Biểu diễn mảng của cây nhị phân:
// [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
// Biểu diễn danh sách liên kết của cây nhị phân:
//
//	         /——— 15
//	     /——— 7
//	 /——— 3
//	|    \——— 6
//	|        \——— 12
//
// ——— 1
//
//	\——— 2
//	   |    /——— 9
//	    \——— 4
//	        \——— 8

// SliceToTreeDFS chuyển đổi danh sách thành cây nhị phân: đệ quy
func SliceToTreeDFS(arr []any, i int) *TreeNode {
	if i < 0 || i >= len(arr) || arr[i] == nil {
		return nil
	}
	root := NewTreeNode(arr[i])
	root.Left = SliceToTreeDFS(arr, 2*i+1)
	root.Right = SliceToTreeDFS(arr, 2*i+2)
	return root
}

// SliceToTree chuyển đổi slice thành cây nhị phân
func SliceToTree(arr []any) *TreeNode {
	return SliceToTreeDFS(arr, 0)
}

// TreeToSliceDFS chuyển đổi cây nhị phân thành slice: đệ quy
func TreeToSliceDFS(root *TreeNode, i int, res *[]any) {
	if root == nil {
		return
	}
	for i >= len(*res) {
		*res = append(*res, nil)
	}
	(*res)[i] = root.Val
	TreeToSliceDFS(root.Left, 2*i+1, res)
	TreeToSliceDFS(root.Right, 2*i+2, res)
}

// TreeToSlice chuyển đổi cây nhị phân thành slice
func TreeToSlice(root *TreeNode) []any {
	var res []any
	TreeToSliceDFS(root, 0, &res)
	return res
}
