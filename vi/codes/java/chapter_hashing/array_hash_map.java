/**
 * File: array_hash_map.java
 * Created Time: 2022-12-04
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.*;

/* Cặp khóa-giá trị */
class Pair {
    public int key;
    public String val;

    public Pair(int key, String val) {
        this.key = key;
        this.val = val;
    }
}

/* Bảng băm dựa trên cách hiện thực bằng mảng */
class ArrayHashMap {
    private List<Pair> buckets;

    public ArrayHashMap() {
        // Khởi tạo mảng với 100 bucket (ngăn chứa)
        buckets = new ArrayList<>();
        for (int i = 0; i < 100; i++) {
            buckets.add(null);
        }
    }

    /* Hàm băm */
    private int hashFunc(int key) {
        int index = key % 100;
        return index;
    }

    /* Thao tác truy vấn */
    public String get(int key) {
        int index = hashFunc(key);
        Pair pair = buckets.get(index);
        if (pair == null)
            return null;
        return pair.val;
    }

    /* Thao tác thêm */
    public void put(int key, String val) {
        Pair pair = new Pair(key, val);
        int index = hashFunc(key);
        buckets.set(index, pair);
    }

    /* Thao tác xóa */
    public void remove(int key) {
        int index = hashFunc(key);
        // Đặt thành null để biểu thị việc xóa
        buckets.set(index, null);
    }

    /* Lấy tất cả cặp khóa-giá trị */
    public List<Pair> pairSet() {
        List<Pair> pairSet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                pairSet.add(pair);
        }
        return pairSet;
    }

    /* Lấy tất cả khóa */
    public List<Integer> keySet() {
        List<Integer> keySet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                keySet.add(pair.key);
        }
        return keySet;
    }

    /* Lấy tất cả giá trị */
    public List<String> valueSet() {
        List<String> valueSet = new ArrayList<>();
        for (Pair pair : buckets) {
            if (pair != null)
                valueSet.add(pair.val);
        }
        return valueSet;
    }

    /* In bảng băm */
    public void print() {
        for (Pair kv : pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
    }
}

public class array_hash_map {
    public static void main(String[] args) {
        /* Khởi tạo bảng băm */
        ArrayHashMap map = new ArrayHashMap();

        /* Thao tác thêm */
        // Thêm cặp khóa-giá trị (key, value) vào bảng băm
        map.put(12836, "Xiao Ha");
        map.put(15937, "Xiao Luo");
        map.put(16750, "Xiao Suan");
        map.put(13276, "Xiao Fa");
        map.put(10583, "Xiao Ya");
        System.out.println("\nAfter adding is complete, hash table is\nKey -> Value");
        map.print();

        /* Thao tác truy vấn */
        // Nhập khóa vào bảng băm để lấy giá trị
        String name = map.get(15937);
        System.out.println("\nInput student ID 15937, query name " + name);

        /* Thao tác xóa */
        // Xóa cặp khóa-giá trị (key, value) khỏi bảng băm
        map.remove(10583);
        System.out.println("\nAfter removing 10583, hash table is\nKey -> Value");
        map.print();

        /* Duyệt bảng băm */
        System.out.println("\nTraverse key-value pairs Key->Value");
        for (Pair kv : map.pairSet()) {
            System.out.println(kv.key + " -> " + kv.val);
        }
        System.out.println("\nTraverse keys only Key");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\nTraverse values only Value");
        for (String val : map.valueSet()) {
            System.out.println(val);
        }
    }
}
