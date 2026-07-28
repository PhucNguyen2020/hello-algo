/**
 * File: hash_map.java
 * Created Time: 2022-12-04
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.*;
import utils.*;

public class hash_map {
    public static void main(String[] args) {
        /* Khởi tạo bảng băm */
        Map<Integer, String> map = new HashMap<>();

        /* Thao tác thêm */
        // Thêm cặp khóa-giá trị (key, value) vào bảng băm
        map.put(12836, "Xiao Ha");
        map.put(15937, "Xiao Luo");
        map.put(16750, "Xiao Suan");
        map.put(13276, "Xiao Fa");
        map.put(10583, "Xiao Ya");
        System.out.println("\nAfter adding is complete, hash table is\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* Thao tác truy vấn */
        // Nhập khóa vào bảng băm để lấy giá trị
        String name = map.get(15937);
        System.out.println("\nInput student ID 15937, query name " + name);

        /* Thao tác xóa */
        // Xóa cặp khóa-giá trị (key, value) khỏi bảng băm
        map.remove(10583);
        System.out.println("\nAfter removing 10583, hash table is\nKey -> Value");
        PrintUtil.printHashMap(map);

        /* Duyệt bảng băm */
        System.out.println("\nTraverse key-value pairs Key->Value");
        for (Map.Entry<Integer, String> kv : map.entrySet()) {
            System.out.println(kv.getKey() + " -> " + kv.getValue());
        }
        System.out.println("\nTraverse keys only Key");
        for (int key : map.keySet()) {
            System.out.println(key);
        }
        System.out.println("\nTraverse values only Value");
        for (String val : map.values()) {
            System.out.println(val);
        }
    }
}
