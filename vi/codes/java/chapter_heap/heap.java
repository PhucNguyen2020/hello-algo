/**
 * File: heap.java
 * Created Time: 2023-01-07
 * Author: krahets (krahets@163.com)
 */

package chapter_heap;

import utils.*;
import java.util.*;

public class heap {
    public static void testPush(Queue<Integer> heap, int val) {
        heap.offer(val); // Phần tử đi vào đống (heap)
        System.out.format("\nAfter element %d enters heap\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void testPop(Queue<Integer> heap) {
        int val = heap.poll(); // Độ phức tạp thời gian là O(n), không phải O(nlogn)
        System.out.format("\nAfter heap top element %d exits heap\n", val);
        PrintUtil.printHeap(heap);
    }

    public static void main(String[] args) {
        /* Khởi tạo đống (heap) */
        // Mô-đun heapq của Python mặc định hiện thực đống nhỏ nhất (min heap)
        Queue<Integer> minHeap = new PriorityQueue<>();
        // Khởi tạo đống lớn nhất (max heap) (sửa Comparator bằng biểu thức lambda)
        Queue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

        System.out.println("\nThe following test cases are for max heap");

        /* Phần tử đi vào đống */
        testPush(maxHeap, 1);
        testPush(maxHeap, 3);
        testPush(maxHeap, 2);
        testPush(maxHeap, 5);
        testPush(maxHeap, 4);

        /* Lấy phần tử đỉnh đống */
        int peek = maxHeap.peek();
        System.out.format("\nHeap top element is %d\n", peek);

        /* Phần tử đỉnh đống rời khỏi đống */
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);
        testPop(maxHeap);

        /* Lấy kích thước đống */
        int size = maxHeap.size();
        System.out.format("\nHeap element count is %d\n", size);

        /* Kiểm tra đống có rỗng hay không */
        boolean isEmpty = maxHeap.isEmpty();
        System.out.format("\nHeap is empty %b\n", isEmpty);

        /* Nhập danh sách và xây dựng đống */
        // Độ phức tạp thời gian là O(n), không phải O(nlogn)
        minHeap = new PriorityQueue<>(Arrays.asList(1, 3, 2, 5, 4));
        System.out.println("\nAfter inputting list and building min heap");
        PrintUtil.printHeap(minHeap);
    }
}
