// File: build_tree.go
// Created Time: 2023-07-20
// Author: hongyun-robot (1836017030@qq.com)

package chapter_divide_and_conquer

import . "github.com/krahets/hello-algo/pkg"

/* Xây dựng cây nhị phân: chia để trị */
func dfsBuildTree(preorder []int, inorderMap map[int]int, i, l, r int) *TreeNode {
	// Kết thúc khi khoảng của cây con là rỗng
	if r-l < 0 {
		return nil
	}
	// Khởi tạo nút gốc
	root := NewTreeNode(preorder[i])
	// Truy vấn m để chia cây con trái và cây con phải
	m := inorderMap[preorder[i]]
	// Bài toán con: xây dựng cây con trái
	root.Left = dfsBuildTree(preorder, inorderMap, i+1, l, m-1)
	// Bài toán con: xây dựng cây con phải
	root.Right = dfsBuildTree(preorder, inorderMap, i+1+m-l, m+1, r)
	// Trả về nút gốc
	return root
}

/* Xây dựng cây nhị phân */
func buildTree(preorder, inorder []int) *TreeNode {
	// Khởi tạo bảng băm, lưu trữ ánh xạ từ phần tử của duyệt giữa (inorder) đến chỉ số
	inorderMap := make(map[int]int, len(inorder))
	for i := 0; i < len(inorder); i++ {
		inorderMap[inorder[i]] = i
	}

	root := dfsBuildTree(preorder, inorderMap, 0, 0, len(inorder)-1)
	return root
}
