# Biểu diễn cây bằng mảng

Trong cách biểu diễn bằng danh sách liên kết, đơn vị lưu trữ của cây nhị phân là nút `TreeNode`, các nút được kết nối với nhau bằng con trỏ. Phần trước đã giới thiệu các thao tác cơ bản của cây nhị phân theo cách biểu diễn này.

Vậy liệu chúng ta có thể dùng một mảng để biểu diễn cây nhị phân hay không? Câu trả lời là có thể.

## Biểu diễn cây nhị phân đầy đủ

Trước tiên, hãy phân tích một trường hợp đơn giản. Cho một cây nhị phân đầy đủ, ta lưu trữ tất cả các nút vào một mảng theo thứ tự duyệt theo tầng, trong đó mỗi nút tương ứng với một chỉ số duy nhất trong mảng.

Dựa trên đặc điểm của duyệt theo tầng, ta có thể suy ra một "công thức ánh xạ" giữa chỉ số của nút cha và chỉ số của các nút con: **Nếu chỉ số của một nút là $i$ thì chỉ số nút con trái của nó là $2i + 1$ và chỉ số nút con phải là $2i + 2$**. Hình dưới đây minh họa mối quan hệ ánh xạ giữa chỉ số của các nút.

![Biểu diễn mảng của cây nhị phân đầy đủ](array_representation_of_tree.assets/array_representation_binary_tree.png)

**Công thức ánh xạ đóng vai trò tương tự như các tham chiếu (con trỏ) nút trong danh sách liên kết**. Với bất kỳ nút nào trong mảng, ta đều có thể truy cập nút con trái (phải) của nó bằng công thức ánh xạ này.

## Biểu diễn cây nhị phân bất kỳ

Cây nhị phân đầy đủ chỉ là một trường hợp đặc biệt; ở các tầng giữa của một cây nhị phân, thường tồn tại rất nhiều giá trị `None`. Vì chuỗi duyệt theo tầng không bao gồm các giá trị `None` này, ta không thể suy ra số lượng và vị trí phân bố của chúng chỉ dựa vào chuỗi đó. **Điều này có nghĩa là nhiều cấu trúc cây nhị phân khác nhau có thể tương ứng với cùng một chuỗi duyệt theo tầng**.

Như hình minh họa dưới đây, với một cây nhị phân không đầy đủ, phương pháp biểu diễn bằng mảng nêu trên sẽ không còn hiệu quả.

![Một chuỗi duyệt theo tầng tương ứng với nhiều khả năng cây nhị phân](array_representation_of_tree.assets/array_representation_without_empty.png)

Để giải quyết vấn đề này, **ta có thể ghi rõ tất cả các giá trị `None` trong chuỗi duyệt theo tầng**. Như hình minh họa dưới đây, sau khi làm như vậy, chuỗi duyệt theo tầng có thể biểu diễn một cách duy nhất cho một cây nhị phân. Mã ví dụ như sau:

=== "Python"

    ```python title=""
    # Biểu diễn mảng của cây nhị phân
    # Dùng None để biểu diễn vị trí rỗng
    tree = [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
    ```

=== "C++"

    ```cpp title=""
    /* Biểu diễn mảng của cây nhị phân */
    // Dùng giá trị số nguyên lớn nhất INT_MAX để đánh dấu vị trí rỗng
    vector<int> tree = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Java"

    ```java title=""
    /* Biểu diễn mảng của cây nhị phân */
    // Dùng lớp bọc Integer để có thể dùng null đánh dấu vị trí rỗng
    Integer[] tree = { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };
    ```

=== "C#"

    ```csharp title=""
    /* Biểu diễn mảng của cây nhị phân */
    // Dùng kiểu int có thể null (int?) để có thể dùng null đánh dấu vị trí rỗng
    int?[] tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Go"

    ```go title=""
    /* Biểu diễn mảng của cây nhị phân */
    // Dùng slice kiểu any, cho phép dùng nil để đánh dấu vị trí rỗng
    tree := []any{1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15}
    ```

=== "Swift"

    ```swift title=""
    /* Biểu diễn mảng của cây nhị phân */
    // Dùng kiểu Int tùy chọn (Int?) để có thể dùng nil đánh dấu vị trí rỗng
    let tree: [Int?] = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

=== "JS"

    ```javascript title=""
    /* Biểu diễn mảng của cây nhị phân */
    // Dùng null để biểu diễn vị trí rỗng
    let tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "TS"

    ```typescript title=""
    /* Biểu diễn mảng của cây nhị phân */
    // Dùng null để biểu diễn vị trí rỗng
    let tree: (number | null)[] = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Dart"

    ```dart title=""
    /* Biểu diễn mảng của cây nhị phân */
    // Dùng kiểu int có thể null (int?) để có thể dùng null đánh dấu vị trí rỗng
    List<int?> tree = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
    ```

=== "Rust"

    ```rust title=""
    /* Biểu diễn mảng của cây nhị phân */
    // Dùng None để đánh dấu vị trí rỗng
    let tree = [Some(1), Some(2), Some(3), Some(4), None, Some(6), Some(7), Some(8), Some(9), None, None, Some(12), None, None, Some(15)];
    ```

=== "C"

    ```c title=""
    /* Biểu diễn mảng của cây nhị phân */
    // Dùng giá trị int lớn nhất để đánh dấu vị trí rỗng, do đó giá trị nút không được phép bằng INT_MAX
    int tree[] = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Biểu diễn mảng của cây nhị phân */
    // Dùng null để biểu diễn vị trí rỗng
    val tree = arrayOf( 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 )
    ```

=== "Ruby"

    ```ruby title=""
    ### Biểu diễn mảng của cây nhị phân ###
    # Dùng nil để biểu diễn vị trí rỗng
    tree = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
    ```

![Biểu diễn mảng của một cây nhị phân bất kỳ](array_representation_of_tree.assets/array_representation_with_empty.png)

Đáng chú ý là **cây nhị phân hoàn chỉnh rất phù hợp để biểu diễn bằng mảng**. Nhớ lại định nghĩa của cây nhị phân hoàn chỉnh, giá trị `None` chỉ xuất hiện ở tầng dưới cùng và lệch về phía bên phải, **nghĩa là mọi giá trị `None` chắc chắn nằm ở cuối chuỗi duyệt theo tầng**.

Điều này có nghĩa là khi dùng mảng để biểu diễn một cây nhị phân hoàn chỉnh, ta hoàn toàn có thể bỏ qua việc lưu trữ tất cả các giá trị `None`, điều này rất thuận tiện. Hình dưới đây minh họa một ví dụ.

![Biểu diễn mảng của cây nhị phân hoàn chỉnh](array_representation_of_tree.assets/array_representation_complete_binary_tree.png)

Đoạn mã dưới đây cài đặt một cây nhị phân bằng cách biểu diễn mảng, bao gồm các thao tác sau:

- Với một nút cho trước, lấy giá trị của nó, nút con trái (phải) và nút cha.
- Lấy chuỗi duyệt trước, duyệt giữa, duyệt sau và duyệt theo tầng.

```src
[file]{array_binary_tree}-[class]{array_binary_tree}-[func]{}
```

## Ưu điểm và hạn chế

Cách biểu diễn cây nhị phân bằng mảng có những ưu điểm sau:

- Mảng được lưu trữ trong vùng bộ nhớ liên tục, thân thiện với bộ nhớ đệm (cache), cho phép truy cập và duyệt nhanh hơn.
- Không cần lưu trữ con trỏ, giúp tiết kiệm không gian.
- Cho phép truy cập ngẫu nhiên đến các nút.

Tuy nhiên, cách biểu diễn bằng mảng cũng có một số hạn chế:

- Việc lưu trữ mảng đòi hỏi vùng bộ nhớ liên tục, nên không phù hợp để lưu trữ các cây có lượng dữ liệu lớn.
- Việc thêm hoặc xóa nút đòi hỏi các thao tác chèn và xóa trên mảng, có hiệu suất thấp hơn.
- Khi cây nhị phân có nhiều giá trị `None`, tỷ lệ dữ liệu nút thực sự chứa trong mảng sẽ thấp, dẫn đến hiệu suất sử dụng không gian kém.
