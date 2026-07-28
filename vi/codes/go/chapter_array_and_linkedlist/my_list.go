// File: my_list.go
// Created Time: 2022-12-18
// Author: msk397 (machangxinq@gmail.com)

package chapter_array_and_linkedlist

/* Lớp danh sách */
type myList struct {
	arrCapacity int
	arr         []int
	arrSize     int
	extendRatio int
}

/* Hàm khởi tạo */
func newMyList() *myList {
	return &myList{
		arrCapacity: 10,              // Dung lượng danh sách
		arr:         make([]int, 10), // Mảng (lưu trữ các phần tử của danh sách)
		arrSize:     0,               // Độ dài danh sách (số lượng phần tử hiện tại)
		extendRatio: 2,               // Hệ số mở rộng dung lượng danh sách mỗi lần
	}
}

/* Lấy độ dài danh sách (số lượng phần tử hiện tại) */
func (l *myList) size() int {
	return l.arrSize
}

/* Lấy dung lượng danh sách */
func (l *myList) capacity() int {
	return l.arrCapacity
}

/* Truy cập phần tử */
func (l *myList) get(index int) int {
	// Nếu chỉ số vượt giới hạn, ném ra ngoại lệ như bên dưới
	if index < 0 || index >= l.arrSize {
		panic("Index out of bounds")
	}
	return l.arr[index]
}

/* Cập nhật phần tử */
func (l *myList) set(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("Index out of bounds")
	}
	l.arr[index] = num
}

/* Thêm phần tử vào cuối danh sách */
func (l *myList) add(num int) {
	// Khi số lượng phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	l.arr[l.arrSize] = num
	// Cập nhật số lượng phần tử
	l.arrSize++
}

/* Chèn phần tử vào giữa danh sách */
func (l *myList) insert(num, index int) {
	if index < 0 || index >= l.arrSize {
		panic("Index out of bounds")
	}
	// Khi số lượng phần tử vượt quá dung lượng, kích hoạt cơ chế mở rộng
	if l.arrSize == l.arrCapacity {
		l.extendCapacity()
	}
	// Dịch chuyển tất cả các phần tử sau chỉ số index về sau một vị trí
	for j := l.arrSize - 1; j >= index; j-- {
		l.arr[j+1] = l.arr[j]
	}
	l.arr[index] = num
	// Cập nhật số lượng phần tử
	l.arrSize++
}

/* Xóa phần tử */
func (l *myList) remove(index int) int {
	if index < 0 || index >= l.arrSize {
		panic("Index out of bounds")
	}
	num := l.arr[index]
	// Dịch chuyển tất cả các phần tử sau chỉ số index về trước một vị trí
	for j := index; j < l.arrSize-1; j++ {
		l.arr[j] = l.arr[j+1]
	}
	// Cập nhật số lượng phần tử
	l.arrSize--
	// Trả về phần tử vừa bị xóa
	return num
}

/* Mở rộng danh sách */
func (l *myList) extendCapacity() {
	// Tạo một mảng mới có độ dài gấp extendRatio lần mảng gốc, rồi sao chép mảng gốc sang mảng mới
	l.arr = append(l.arr, make([]int, l.arrCapacity*(l.extendRatio-1))...)
	// Cập nhật dung lượng danh sách
	l.arrCapacity = len(l.arr)
}

/* Chuyển danh sách thành mảng có độ dài hợp lệ */
func (l *myList) toArray() []int {
	// Chỉ trả về phần mảng hợp lệ
	return l.arr[:l.arrSize]
}
