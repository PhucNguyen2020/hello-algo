// File: hash_map_open_addressing.go
// Created Time: 2023-06-23
// Author: Reanon (793584285@qq.com)

package chapter_hashing

import (
	"fmt"
)

/* Bảng băm giải quyết đụng độ bằng phương pháp địa chỉ mở (open addressing) */
type hashMapOpenAddressing struct {
	size        int     // Số lượng cặp khóa-giá trị
	capacity    int     // Dung lượng bảng băm
	loadThres   float64 // Ngưỡng hệ số tải để kích hoạt mở rộng
	extendRatio int     // Hệ số nhân khi mở rộng
	buckets     []*pair // Mảng các bucket
	TOMBSTONE   *pair   // Dấu hiệu đánh dấu đã xóa
}

/* Hàm khởi tạo */
func newHashMapOpenAddressing() *hashMapOpenAddressing {
	return &hashMapOpenAddressing{
		size:        0,
		capacity:    4,
		loadThres:   2.0 / 3.0,
		extendRatio: 2,
		buckets:     make([]*pair, 4),
		TOMBSTONE:   &pair{-1, "-1"},
	}
}

/* Hàm băm */
func (h *hashMapOpenAddressing) hashFunc(key int) int {
	return key % h.capacity // Tính giá trị băm dựa trên key
}

/* Hệ số tải */
func (h *hashMapOpenAddressing) loadFactor() float64 {
	return float64(h.size) / float64(h.capacity) // Tính hệ số tải hiện tại
}

/* Tìm chỉ số bucket tương ứng với key */
func (h *hashMapOpenAddressing) findBucket(key int) int {
	index := h.hashFunc(key) // Lấy chỉ số ban đầu
	firstTombstone := -1     // Ghi lại vị trí TOMBSTONE đầu tiên gặp được
	for h.buckets[index] != nil {
		if h.buckets[index].key == key {
			if firstTombstone != -1 {
				// Nếu trước đó đã gặp một dấu hiệu đã xóa, di chuyển cặp khóa-giá trị đến vị trí đó
				h.buckets[firstTombstone] = h.buckets[index]
				h.buckets[index] = h.TOMBSTONE
				return firstTombstone // Trả về chỉ số bucket đã di chuyển
			}
			return index // Trả về chỉ số tìm thấy
		}
		if firstTombstone == -1 && h.buckets[index] == h.TOMBSTONE {
			firstTombstone = index // Ghi lại vị trí dấu hiệu xóa đầu tiên gặp được
		}
		index = (index + 1) % h.capacity // Dò tuyến tính, quay về đầu nếu vượt quá cuối
	}
	// Nếu key không tồn tại, trả về chỉ số để chèn vào
	if firstTombstone != -1 {
		return firstTombstone
	}
	return index
}

/* Thao tác truy vấn */
func (h *hashMapOpenAddressing) get(key int) string {
	index := h.findBucket(key) // Tìm chỉ số bucket tương ứng với key
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		return h.buckets[index].val // Nếu tìm thấy cặp khóa-giá trị, trả về val tương ứng
	}
	return "" // Trả về "" nếu cặp khóa-giá trị không tồn tại
}

/* Thao tác thêm */
func (h *hashMapOpenAddressing) put(key int, val string) {
	if h.loadFactor() > h.loadThres {
		h.extend() // Khi hệ số tải vượt ngưỡng, thực hiện mở rộng
	}
	index := h.findBucket(key) // Tìm chỉ số bucket tương ứng với key
	if h.buckets[index] == nil || h.buckets[index] == h.TOMBSTONE {
		h.buckets[index] = &pair{key, val} // Nếu cặp khóa-giá trị chưa tồn tại, thêm cặp khóa-giá trị
		h.size++
	} else {
		h.buckets[index].val = val // Nếu tìm thấy cặp khóa-giá trị, ghi đè val
	}
}

/* Thao tác xóa */
func (h *hashMapOpenAddressing) remove(key int) {
	index := h.findBucket(key) // Tìm chỉ số bucket tương ứng với key
	if h.buckets[index] != nil && h.buckets[index] != h.TOMBSTONE {
		h.buckets[index] = h.TOMBSTONE // Nếu tìm thấy cặp khóa-giá trị, ghi đè bằng dấu hiệu đã xóa
		h.size--
	}
}

/* Mở rộng bảng băm */
func (h *hashMapOpenAddressing) extend() {
	oldBuckets := h.buckets               // Lưu tạm bảng băm gốc
	h.capacity *= h.extendRatio           // Cập nhật dung lượng
	h.buckets = make([]*pair, h.capacity) // Khởi tạo bảng băm mới đã được mở rộng
	h.size = 0                            // Đặt lại size
	// Di chuyển các cặp khóa-giá trị từ bảng băm gốc sang bảng băm mới
	for _, pair := range oldBuckets {
		if pair != nil && pair != h.TOMBSTONE {
			h.put(pair.key, pair.val)
		}
	}
}

/* In bảng băm */
func (h *hashMapOpenAddressing) print() {
	for _, pair := range h.buckets {
		if pair == nil {
			fmt.Println("nil")
		} else if pair == h.TOMBSTONE {
			fmt.Println("TOMBSTONE")
		} else {
			fmt.Printf("%d -> %s\n", pair.key, pair.val)
		}
	}
}
