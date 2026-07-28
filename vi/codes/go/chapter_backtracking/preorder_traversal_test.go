// File: preorder_traversal_i_compact_test.go
// Created Time: 2023-05-09
// Author: Reanon (793584285@qq.com)

package chapter_backtracking

import (
	"fmt"
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestPreorderTraversalICompact(t *testing.T) {
	/* Khởi tạo cây nhị phân */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\nInitialize binary tree")
	PrintTree(root)

	// Duyệt trước
	res := make([]*TreeNode, 0)
	preOrderI(root, &res)

	fmt.Println("\nOutput all nodes with value 7")
	for _, node := range res {
		fmt.Printf("%v ", node.Val)
	}
	fmt.Println()
}

func TestPreorderTraversalIICompact(t *testing.T) {
	/* Khởi tạo cây nhị phân */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\nInitialize binary tree")
	PrintTree(root)

	// Duyệt trước
	path := make([]*TreeNode, 0)
	res := make([][]*TreeNode, 0)
	preOrderII(root, &res, &path)

	fmt.Println("\nOutput all paths from root node to node 7")
	for _, path := range res {
		for _, node := range path {
			fmt.Printf("%v ", node.Val)
		}
		fmt.Println()
	}
}

func TestPreorderTraversalIIICompact(t *testing.T) {
	/* Khởi tạo cây nhị phân */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\nInitialize binary tree")
	PrintTree(root)

	// Duyệt trước
	path := make([]*TreeNode, 0)
	res := make([][]*TreeNode, 0)
	preOrderIII(root, &res, &path)

	fmt.Println("\nOutput all paths from root node to node 7, paths do not include nodes with value 3")
	for _, path := range res {
		for _, node := range path {
			fmt.Printf("%v ", node.Val)
		}
		fmt.Println()
	}
}

func TestPreorderTraversalIIITemplate(t *testing.T) {
	/* Khởi tạo cây nhị phân */
	root := SliceToTree([]any{1, 7, 3, 4, 5, 6, 7})
	fmt.Println("\nInitialize binary tree")
	PrintTree(root)

	// Giải thuật quay lui
	res := make([][]*TreeNode, 0)
	state := make([]*TreeNode, 0)
	choices := make([]*TreeNode, 0)
	choices = append(choices, root)
	backtrackIII(&state, &choices, &res)

	fmt.Println("\nOutput all paths from root node to node 7, paths do not include nodes with value 3")
	for _, path := range res {
		for _, node := range path {
			fmt.Printf("%v ", node.Val)
		}
		fmt.Println()
	}
}
