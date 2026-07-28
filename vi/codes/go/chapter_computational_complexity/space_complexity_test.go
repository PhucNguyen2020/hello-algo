// File: space_complexity_test.go
// Created Time: 2022-12-15
// Author: cathay (cathaycchen@gmail.com)

package chapter_computational_complexity

import (
	"testing"

	. "github.com/krahets/hello-algo/pkg"
)

func TestSpaceComplexity(t *testing.T) {
	n := 5
	// Độ phức tạp không gian hằng số
	spaceConstant(n)
	// Độ phức tạp không gian tuyến tính
	spaceLinear(n)
	spaceLinearRecur(n)
	// Độ phức tạp không gian bậc hai
	spaceQuadratic(n)
	spaceQuadraticRecur(n)
	// Độ phức tạp không gian theo cấp số mũ
	root := buildTree(n)
	PrintTree(root)
}
