// File: vertex.go
// Created Time: 2023-02-18
// Author: Reanon (793584285@qq.com)

package pkg

// Vertex lớp đỉnh
type Vertex struct {
	Val int
}

// NewVertex hàm khởi tạo đỉnh
func NewVertex(val int) Vertex {
	return Vertex{
		Val: val,
	}
}

// ValsToVets chuyển đổi danh sách giá trị thành danh sách đỉnh
func ValsToVets(vals []int) []Vertex {
	vets := make([]Vertex, len(vals))
	for i := 0; i < len(vals); i++ {
		vets[i] = NewVertex(vals[i])
	}
	return vets
}

// VetsToVals chuyển đổi danh sách đỉnh thành danh sách giá trị
func VetsToVals(vets []Vertex) []int {
	vals := make([]int, len(vets))
	for i := range vets {
		vals[i] = vets[i].Val
	}
	return vals
}

// DeleteSliceElms xóa các phần tử được chỉ định khỏi slice
func DeleteSliceElms[T any](a []T, elms ...T) []T {
	if len(a) == 0 || len(elms) == 0 {
		return a
	}
	// Trước tiên chuyển đổi các phần tử thành tập hợp (set)
	m := make(map[any]struct{})
	for _, v := range elms {
		m[v] = struct{}{}
	}
	// Lọc bỏ các phần tử được chỉ định
	res := make([]T, 0, len(a))
	for _, v := range a {
		if _, ok := m[v]; !ok {
			res = append(res, v)
		}
	}
	return res
}
