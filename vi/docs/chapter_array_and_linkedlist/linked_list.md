# Danh sách liên kết

Bộ nhớ là tài nguyên dùng chung cho tất cả các chương trình. Trong một môi trường thực thi phức tạp, các vùng nhớ trống có thể nằm rải rác khắp không gian địa chỉ. Ta biết rằng mảng yêu cầu vùng nhớ liên tục, và khi một mảng rất lớn, hệ thống có thể không thể cung cấp một khối nhớ liên tục lớn như vậy. Đây chính là lúc tính linh hoạt của danh sách liên kết phát huy tác dụng.

<u>Danh sách liên kết</u> là một cấu trúc dữ liệu tuyến tính trong đó mỗi phần tử là một đối tượng nút, và các nút được nối với nhau thông qua các "tham chiếu". Một tham chiếu ghi lại địa chỉ bộ nhớ của nút tiếp theo, nhờ đó ta có thể truy cập nút tiếp theo từ nút hiện tại.

Thiết kế này cho phép các nút của danh sách liên kết được lưu ở nhiều vị trí khác nhau trong bộ nhớ, và địa chỉ của chúng không cần phải liên tục.

![Định nghĩa danh sách liên kết và cách lưu trữ](linked_list.assets/linkedlist_definition.png)

Quan sát hình trên, đơn vị cơ bản của danh sách liên kết là một đối tượng <u>nút</u>. Mỗi nút chứa hai thành phần dữ liệu: "giá trị" của nút và "tham chiếu" đến nút tiếp theo.

- Nút đầu tiên của danh sách liên kết được gọi là "nút đầu", và nút cuối cùng được gọi là "nút cuối".
- Nút cuối trỏ đến "null", được ký hiệu lần lượt là `null`, `nullptr`, và `None` trong Java, C++ và Python.
- Trong các ngôn ngữ hỗ trợ con trỏ như C, C++, Go và Rust, "tham chiếu" nói trên nên được hiểu là "con trỏ".

Như trong đoạn mã dưới đây, một nút danh sách liên kết `ListNode` không chỉ chứa một giá trị mà còn chứa thêm một tham chiếu (con trỏ). Do đó, **danh sách liên kết chiếm nhiều bộ nhớ hơn mảng khi lưu trữ cùng một lượng dữ liệu**.

=== "Python"

    ```python title=""
    class ListNode:
        """Lớp nút của danh sách liên kết"""
        def __init__(self, val: int):
            self.val: int = val               # Giá trị của nút
            self.next: ListNode | None = None # Tham chiếu đến nút tiếp theo
    ```

=== "C++"

    ```cpp title=""
    /* Cấu trúc nút của danh sách liên kết */
    struct ListNode {
        int val;         // Giá trị của nút
        ListNode *next;  // Con trỏ đến nút tiếp theo
        ListNode(int x) : val(x), next(nullptr) {}  // Hàm khởi tạo
    };
    ```

=== "Java"

    ```java title=""
    /* Lớp nút của danh sách liên kết */
    class ListNode {
        int val;        // Giá trị của nút
        ListNode next;  // Tham chiếu đến nút tiếp theo
        ListNode(int x) { val = x; }  // Hàm khởi tạo
    }
    ```

=== "C#"

    ```csharp title=""
    /* Lớp nút của danh sách liên kết */
    class ListNode(int x) {  // Hàm khởi tạo
        int val = x;         // Giá trị của nút
        ListNode? next;      // Tham chiếu đến nút tiếp theo
    }
    ```

=== "Go"

    ```go title=""
    /* Cấu trúc nút của danh sách liên kết */
    type ListNode struct {
        Val  int       // Giá trị của nút
        Next *ListNode // Con trỏ đến nút tiếp theo
    }

    // NewListNode Hàm khởi tạo, tạo một danh sách liên kết mới
    func NewListNode(val int) *ListNode {
        return &ListNode{
            Val:  val,
            Next: nil,
        }
    }
    ```

=== "Swift"

    ```swift title=""
    /* Lớp nút của danh sách liên kết */
    class ListNode {
        var val: Int // Giá trị của nút
        var next: ListNode? // Tham chiếu đến nút tiếp theo

        init(x: Int) { // Hàm khởi tạo
            val = x
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* Lớp nút của danh sách liên kết */
    class ListNode {
        constructor(val, next) {
            this.val = (val === undefined ? 0 : val);       // Giá trị của nút
            this.next = (next === undefined ? null : next); // Tham chiếu đến nút tiếp theo
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* Lớp nút của danh sách liên kết */
    class ListNode {
        val: number;
        next: ListNode | null;
        constructor(val?: number, next?: ListNode | null) {
            this.val = val === undefined ? 0 : val;        // Giá trị của nút
            this.next = next === undefined ? null : next;  // Tham chiếu đến nút tiếp theo
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* Lớp nút của danh sách liên kết */
    class ListNode {
      int val; // Giá trị của nút
      ListNode? next; // Tham chiếu đến nút tiếp theo
      ListNode(this.val, [this.next]); // Hàm khởi tạo
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;
    /* Lớp nút của danh sách liên kết */
    #[derive(Debug)]
    struct ListNode {
        val: i32, // Giá trị của nút
        next: Option<Rc<RefCell<ListNode>>>, // Con trỏ đến nút tiếp theo
    }
    ```

=== "C"

    ```c title=""
    /* Cấu trúc nút của danh sách liên kết */
    typedef struct ListNode {
        int val;               // Giá trị của nút
        struct ListNode *next; // Con trỏ đến nút tiếp theo
    } ListNode;

    /* Hàm khởi tạo */
    ListNode *newListNode(int val) {
        ListNode *node;
        node = (ListNode *) malloc(sizeof(ListNode));
        node->val = val;
        node->next = NULL;
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Lớp nút của danh sách liên kết */
    // Hàm khởi tạo
    class ListNode(x: Int) {
        val _val: Int = x          // Giá trị của nút
        val next: ListNode? = null // Tham chiếu đến nút tiếp theo
    }
    ```

=== "Ruby"

    ```ruby title=""
    # Lớp nút của danh sách liên kết
    class ListNode
      attr_accessor :val  # Giá trị của nút
      attr_accessor :next # Tham chiếu đến nút tiếp theo

      def initialize(val=0, next_node=nil)
        @val = val
        @next = next_node
      end
    end
    ```

## Các thao tác thường gặp trên danh sách liên kết

### Khởi tạo danh sách liên kết

Việc xây dựng một danh sách liên kết gồm hai bước: thứ nhất, khởi tạo từng đối tượng nút; thứ hai, xây dựng các mối quan hệ tham chiếu giữa các nút. Sau khi khởi tạo xong, ta có thể duyệt qua tất cả các nút bắt đầu từ nút đầu của danh sách liên kết thông qua tham chiếu `next`.

=== "Python"

    ```python title="linked_list.py"
    # Khởi tạo danh sách liên kết 1 -> 3 -> 2 -> 5 -> 4
    # Khởi tạo từng nút
    n0 = ListNode(1)
    n1 = ListNode(3)
    n2 = ListNode(2)
    n3 = ListNode(5)
    n4 = ListNode(4)
    # Xây dựng tham chiếu giữa các nút
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    ```

=== "C++"

    ```cpp title="linked_list.cpp"
    /* Khởi tạo danh sách liên kết 1 -> 3 -> 2 -> 5 -> 4 */
    // Khởi tạo từng nút
    ListNode* n0 = new ListNode(1);
    ListNode* n1 = new ListNode(3);
    ListNode* n2 = new ListNode(2);
    ListNode* n3 = new ListNode(5);
    ListNode* n4 = new ListNode(4);
    // Xây dựng tham chiếu giữa các nút
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    ```

=== "Java"

    ```java title="linked_list.java"
    /* Khởi tạo danh sách liên kết 1 -> 3 -> 2 -> 5 -> 4 */
    // Khởi tạo từng nút
    ListNode n0 = new ListNode(1);
    ListNode n1 = new ListNode(3);
    ListNode n2 = new ListNode(2);
    ListNode n3 = new ListNode(5);
    ListNode n4 = new ListNode(4);
    // Xây dựng tham chiếu giữa các nút
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "C#"

    ```csharp title="linked_list.cs"
    /* Khởi tạo danh sách liên kết 1 -> 3 -> 2 -> 5 -> 4 */
    // Khởi tạo từng nút
    ListNode n0 = new(1);
    ListNode n1 = new(3);
    ListNode n2 = new(2);
    ListNode n3 = new(5);
    ListNode n4 = new(4);
    // Xây dựng tham chiếu giữa các nút
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "Go"

    ```go title="linked_list.go"
    /* Khởi tạo danh sách liên kết 1 -> 3 -> 2 -> 5 -> 4 */
    // Khởi tạo từng nút
    n0 := NewListNode(1)
    n1 := NewListNode(3)
    n2 := NewListNode(2)
    n3 := NewListNode(5)
    n4 := NewListNode(4)
    // Xây dựng tham chiếu giữa các nút
    n0.Next = n1
    n1.Next = n2
    n2.Next = n3
    n3.Next = n4
    ```

=== "Swift"

    ```swift title="linked_list.swift"
    /* Khởi tạo danh sách liên kết 1 -> 3 -> 2 -> 5 -> 4 */
    // Khởi tạo từng nút
    let n0 = ListNode(x: 1)
    let n1 = ListNode(x: 3)
    let n2 = ListNode(x: 2)
    let n3 = ListNode(x: 5)
    let n4 = ListNode(x: 4)
    // Xây dựng tham chiếu giữa các nút
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    ```

=== "JS"

    ```javascript title="linked_list.js"
    /* Khởi tạo danh sách liên kết 1 -> 3 -> 2 -> 5 -> 4 */
    // Khởi tạo từng nút
    const n0 = new ListNode(1);
    const n1 = new ListNode(3);
    const n2 = new ListNode(2);
    const n3 = new ListNode(5);
    const n4 = new ListNode(4);
    // Xây dựng tham chiếu giữa các nút
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "TS"

    ```typescript title="linked_list.ts"
    /* Khởi tạo danh sách liên kết 1 -> 3 -> 2 -> 5 -> 4 */
    // Khởi tạo từng nút
    const n0 = new ListNode(1);
    const n1 = new ListNode(3);
    const n2 = new ListNode(2);
    const n3 = new ListNode(5);
    const n4 = new ListNode(4);
    // Xây dựng tham chiếu giữa các nút
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "Dart"

    ```dart title="linked_list.dart"
    /* Khởi tạo danh sách liên kết 1 -> 3 -> 2 -> 5 -> 4 */\
    // Khởi tạo từng nút
    ListNode n0 = ListNode(1);
    ListNode n1 = ListNode(3);
    ListNode n2 = ListNode(2);
    ListNode n3 = ListNode(5);
    ListNode n4 = ListNode(4);
    // Xây dựng tham chiếu giữa các nút
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "Rust"

    ```rust title="linked_list.rs"
    /* Khởi tạo danh sách liên kết 1 -> 3 -> 2 -> 5 -> 4 */
    // Khởi tạo từng nút
    let n0 = Rc::new(RefCell::new(ListNode { val: 1, next: None }));
    let n1 = Rc::new(RefCell::new(ListNode { val: 3, next: None }));
    let n2 = Rc::new(RefCell::new(ListNode { val: 2, next: None }));
    let n3 = Rc::new(RefCell::new(ListNode { val: 5, next: None }));
    let n4 = Rc::new(RefCell::new(ListNode { val: 4, next: None }));

    // Xây dựng tham chiếu giữa các nút
    n0.borrow_mut().next = Some(n1.clone());
    n1.borrow_mut().next = Some(n2.clone());
    n2.borrow_mut().next = Some(n3.clone());
    n3.borrow_mut().next = Some(n4.clone());
    ```

=== "C"

    ```c title="linked_list.c"
    /* Khởi tạo danh sách liên kết 1 -> 3 -> 2 -> 5 -> 4 */
    // Khởi tạo từng nút
    ListNode* n0 = newListNode(1);
    ListNode* n1 = newListNode(3);
    ListNode* n2 = newListNode(2);
    ListNode* n3 = newListNode(5);
    ListNode* n4 = newListNode(4);
    // Xây dựng tham chiếu giữa các nút
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    ```

=== "Kotlin"

    ```kotlin title="linked_list.kt"
    /* Khởi tạo danh sách liên kết 1 -> 3 -> 2 -> 5 -> 4 */
    // Khởi tạo từng nút
    val n0 = ListNode(1)
    val n1 = ListNode(3)
    val n2 = ListNode(2)
    val n3 = ListNode(5)
    val n4 = ListNode(4)
    // Xây dựng tham chiếu giữa các nút
    n0.next = n1;
    n1.next = n2;
    n2.next = n3;
    n3.next = n4;
    ```

=== "Ruby"

    ```ruby title="linked_list.rb"
    # Khởi tạo danh sách liên kết 1 -> 3 -> 2 -> 5 -> 4
    # Khởi tạo từng nút
    n0 = ListNode.new(1)
    n1 = ListNode.new(3)
    n2 = ListNode.new(2)
    n3 = ListNode.new(5)
    n4 = ListNode.new(4)
    # Xây dựng tham chiếu giữa các nút
    n0.next = n1
    n1.next = n2
    n2.next = n3
    n3.next = n4
    ```

??? pythontutor "Minh họa mã nguồn"

    https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%93%BE%E8%A1%A8%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%90%8E%E7%BB%A7%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E9%93%BE%E8%A1%A8%201%20-%3E%203%20-%3E%202%20-%3E%205%20-%3E%204%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%90%84%E4%B8%AA%E8%8A%82%E7%82%B9%0A%20%20%20%20n0%20%3D%20ListNode%281%29%0A%20%20%20%20n1%20%3D%20ListNode%283%29%0A%20%20%20%20n2%20%3D%20ListNode%282%29%0A%20%20%20%20n3%20%3D%20ListNode%285%29%0A%20%20%20%20n4%20%3D%20ListNode%284%29%0A%20%20%20%20%23%20%E6%9E%84%E5%BB%BA%E8%8A%82%E7%82%B9%E4%B9%8B%E9%97%B4%E7%9A%84%E5%BC%95%E7%94%A8%0A%20%20%20%20n0.next%20%3D%20n1%0A%20%20%20%20n1.next%20%3D%20n2%0A%20%20%20%20n2.next%20%3D%20n3%0A%20%20%20%20n3.next%20%3D%20n4&cumulative=false&curInstr=3&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

Mảng là một biến duy nhất; ví dụ, một mảng `nums` chứa các phần tử `nums[0]`, `nums[1]`, v.v. Ngược lại, danh sách liên kết được cấu thành từ nhiều đối tượng nút độc lập. **Chúng ta thường dùng nút đầu để đại diện cho toàn bộ danh sách liên kết**; ví dụ, danh sách liên kết trong đoạn mã trên có thể được gọi là danh sách liên kết `n0`.

### Chèn nút

Việc chèn một nút vào danh sách liên kết rất đơn giản. Như hình dưới đây, giả sử ta muốn chèn một nút mới `P` vào giữa hai nút liền kề `n0` và `n1`. **Ta chỉ cần thay đổi hai tham chiếu (con trỏ) của nút**, với độ phức tạp thời gian là $O(1)$.

Ngược lại, độ phức tạp thời gian của việc chèn một phần tử vào mảng là $O(n)$, kém hiệu quả khi xử lý lượng dữ liệu lớn.

![Ví dụ chèn một nút vào danh sách liên kết](linked_list.assets/linkedlist_insert_node.png)

```src
[file]{linked_list}-[class]{}-[func]{insert}
```

### Xóa nút

Như hình dưới đây, việc xóa một nút trong danh sách liên kết cũng rất thuận tiện. **Ta chỉ cần thay đổi tham chiếu (con trỏ) của một nút**.

Lưu ý rằng mặc dù nút `P` vẫn trỏ đến `n1` sau khi thao tác xóa hoàn tất, danh sách liên kết sẽ không còn truy cập được `P` khi duyệt, nghĩa là `P` không còn thuộc về danh sách liên kết này nữa.

![Xóa một nút khỏi danh sách liên kết](linked_list.assets/linkedlist_remove_node.png)

```src
[file]{linked_list}-[class]{}-[func]{remove}
```

### Truy cập nút

**Việc truy cập các nút trong danh sách liên kết kém hiệu quả hơn**. Như đã đề cập ở phần trước, ta có thể truy cập bất kỳ phần tử nào trong mảng với thời gian $O(1)$. Điều này không đúng với danh sách liên kết. Chương trình cần bắt đầu từ nút đầu và duyệt lần lượt cho đến khi tìm thấy nút mục tiêu. Nghĩa là, để truy cập nút thứ $i$ trong danh sách liên kết, ta cần $i - 1$ lượt lặp, với độ phức tạp thời gian là $O(n)$.

```src
[file]{linked_list}-[class]{}-[func]{access}
```

### Tìm nút

Duyệt danh sách liên kết để tìm một nút có giá trị `target`, rồi xuất ra chỉ số của nút đó trong danh sách liên kết. Quá trình này cũng là một dạng tìm kiếm tuyến tính. Đoạn mã dưới đây minh họa điều này:

```src
[file]{linked_list}-[class]{}-[func]{find}
```

## Mảng so với danh sách liên kết

Bảng dưới đây tóm tắt đặc điểm của mảng và danh sách liên kết, đồng thời so sánh hiệu quả các thao tác của chúng. Vì hai cấu trúc này sử dụng hai chiến lược lưu trữ đối lập nhau, các đặc tính và hiệu quả thao tác của chúng cũng thể hiện những khác biệt tương phản.

<p align="center"> Bảng <id> &nbsp; So sánh hiệu quả giữa mảng và danh sách liên kết </p>

|                        | Mảng                                           | Danh sách liên kết          |
| ---------------------- | ----------------------------------------------- | ---------------------------- |
| Cách lưu trữ           | Vùng nhớ liên tục                                | Vùng nhớ rải rác             |
| Mở rộng dung lượng     | Độ dài bất biến                                  | Mở rộng linh hoạt            |
| Hiệu quả bộ nhớ        | Phần tử chiếm ít bộ nhớ hơn, nhưng có thể lãng phí không gian | Phần tử chiếm nhiều bộ nhớ hơn |
| Truy cập một phần tử   | $O(1)$                                          | $O(n)$                        |
| Thêm một phần tử       | $O(n)$                                          | $O(1)$                        |
| Xóa một phần tử        | $O(n)$                                          | $O(1)$                        |

## Các loại danh sách liên kết phổ biến

Như hình dưới đây, có ba loại danh sách liên kết phổ biến:

- **Danh sách liên kết đơn**: Đây là danh sách liên kết thông thường đã giới thiệu ở trên. Các nút của danh sách liên kết đơn chứa một giá trị và một tham chiếu đến nút tiếp theo. Ta gọi nút đầu tiên là nút đầu và nút cuối cùng là nút cuối; nút cuối trỏ đến `None`.
- **Danh sách liên kết vòng**: Nếu ta cho nút cuối của một danh sách liên kết đơn trỏ ngược về nút đầu (nối đuôi vào đầu), ta sẽ có một danh sách liên kết vòng. Trong danh sách liên kết vòng, bất kỳ nút nào cũng có thể được xem là nút đầu.
- **Danh sách liên kết đôi**: So với danh sách liên kết đơn, danh sách liên kết đôi ghi lại tham chiếu theo cả hai hướng. Định nghĩa nút của danh sách liên kết đôi bao gồm cả tham chiếu đến nút kế tiếp (nút sau) lẫn nút đứng trước (nút trước). So với danh sách liên kết đơn, danh sách liên kết đôi linh hoạt hơn và có thể duyệt theo cả hai chiều, nhưng cũng cần nhiều bộ nhớ hơn.

=== "Python"

    ```python title=""
    class ListNode:
        """Lớp nút của danh sách liên kết đôi"""
        def __init__(self, val: int):
            self.val: int = val                # Giá trị của nút
            self.next: ListNode | None = None  # Tham chiếu đến nút kế tiếp
            self.prev: ListNode | None = None  # Tham chiếu đến nút đứng trước
    ```

=== "C++"

    ```cpp title=""
    /* Cấu trúc nút của danh sách liên kết đôi */
    struct ListNode {
        int val;         // Giá trị của nút
        ListNode *next;  // Con trỏ đến nút kế tiếp
        ListNode *prev;  // Con trỏ đến nút đứng trước
        ListNode(int x) : val(x), next(nullptr), prev(nullptr) {}  // Hàm khởi tạo
    };
    ```

=== "Java"

    ```java title=""
    /* Lớp nút của danh sách liên kết đôi */
    class ListNode {
        int val;        // Giá trị của nút
        ListNode next;  // Tham chiếu đến nút kế tiếp
        ListNode prev;  // Tham chiếu đến nút đứng trước
        ListNode(int x) { val = x; }  // Hàm khởi tạo
    }
    ```

=== "C#"

    ```csharp title=""
    /* Lớp nút của danh sách liên kết đôi */
    class ListNode(int x) {  // Hàm khởi tạo
        int val = x;    // Giá trị của nút
        ListNode next;  // Tham chiếu đến nút kế tiếp
        ListNode prev;  // Tham chiếu đến nút đứng trước
    }
    ```

=== "Go"

    ```go title=""
    /* Cấu trúc nút của danh sách liên kết đôi */
    type DoublyListNode struct {
        Val  int             // Giá trị của nút
        Next *DoublyListNode // Con trỏ đến nút kế tiếp
        Prev *DoublyListNode // Con trỏ đến nút đứng trước
    }

    // NewDoublyListNode Khởi tạo
    func NewDoublyListNode(val int) *DoublyListNode {
        return &DoublyListNode{
            Val:  val,
            Next: nil,
            Prev: nil,
        }
    }
    ```

=== "Swift"

    ```swift title=""
    /* Lớp nút của danh sách liên kết đôi */
    class ListNode {
        var val: Int // Giá trị của nút
        var next: ListNode? // Tham chiếu đến nút kế tiếp
        var prev: ListNode? // Tham chiếu đến nút đứng trước

        init(x: Int) { // Hàm khởi tạo
            val = x
        }
    }
    ```

=== "JS"

    ```javascript title=""
    /* Lớp nút của danh sách liên kết đôi */
    class ListNode {
        constructor(val, next, prev) {
            this.val = val  ===  undefined ? 0 : val;        // Giá trị của nút
            this.next = next  ===  undefined ? null : next;  // Tham chiếu đến nút kế tiếp
            this.prev = prev  ===  undefined ? null : prev;  // Tham chiếu đến nút đứng trước
        }
    }
    ```

=== "TS"

    ```typescript title=""
    /* Lớp nút của danh sách liên kết đôi */
    class ListNode {
        val: number;
        next: ListNode | null;
        prev: ListNode | null;
        constructor(val?: number, next?: ListNode | null, prev?: ListNode | null) {
            this.val = val  ===  undefined ? 0 : val;        // Giá trị của nút
            this.next = next  ===  undefined ? null : next;  // Tham chiếu đến nút kế tiếp
            this.prev = prev  ===  undefined ? null : prev;  // Tham chiếu đến nút đứng trước
        }
    }
    ```

=== "Dart"

    ```dart title=""
    /* Lớp nút của danh sách liên kết đôi */
    class ListNode {
        int val;        // Giá trị của nút
        ListNode? next;  // Tham chiếu đến nút kế tiếp
        ListNode? prev;  // Tham chiếu đến nút đứng trước
        ListNode(this.val, [this.next, this.prev]);  // Hàm khởi tạo
    }
    ```

=== "Rust"

    ```rust title=""
    use std::rc::Rc;
    use std::cell::RefCell;

    /* Kiểu nút của danh sách liên kết đôi */
    #[derive(Debug)]
    struct ListNode {
        val: i32, // Giá trị của nút
        next: Option<Rc<RefCell<ListNode>>>, // Con trỏ đến nút kế tiếp
        prev: Option<Rc<RefCell<ListNode>>>, // Con trỏ đến nút đứng trước
    }

    /* Hàm khởi tạo */
    impl ListNode {
        fn new(val: i32) -> Self {
            ListNode {
                val,
                next: None,
                prev: None,
            }
        }
    }
    ```

=== "C"

    ```c title=""
    /* Cấu trúc nút của danh sách liên kết đôi */
    typedef struct ListNode {
        int val;               // Giá trị của nút
        struct ListNode *next; // Con trỏ đến nút kế tiếp
        struct ListNode *prev; // Con trỏ đến nút đứng trước
    } ListNode;

    /* Hàm khởi tạo */
    ListNode *newListNode(int val) {
        ListNode *node;
        node = (ListNode *) malloc(sizeof(ListNode));
        node->val = val;
        node->next = NULL;
        node->prev = NULL;
        return node;
    }
    ```

=== "Kotlin"

    ```kotlin title=""
    /* Lớp nút của danh sách liên kết đôi */
    // Hàm khởi tạo
    class ListNode(x: Int) {
        val _val: Int = x           // Giá trị của nút
        val next: ListNode? = null  // Tham chiếu đến nút kế tiếp
        val prev: ListNode? = null  // Tham chiếu đến nút đứng trước
    }
    ```

=== "Ruby"

    ```ruby title=""
    # Lớp nút của danh sách liên kết đôi
    class ListNode
      attr_accessor :val    # Giá trị của nút
      attr_accessor :next   # Tham chiếu đến nút kế tiếp
      attr_accessor :prev   # Tham chiếu đến nút đứng trước

      def initialize(val=0, next_node=nil, prev_node=nil)
        @val = val
        @next = next_node
        @prev = prev_node
      end
    end
    ```

![Các loại danh sách liên kết phổ biến](linked_list.assets/linkedlist_common_types.png)

## Các ứng dụng tiêu biểu của danh sách liên kết

Danh sách liên kết đơn thường được dùng để cài đặt ngăn xếp, hàng đợi, bảng băm và đồ thị.

- **Ngăn xếp và hàng đợi**: Khi các thao tác chèn và xóa đều xảy ra tại một đầu của danh sách liên kết, nó thể hiện đặc tính vào sau ra trước, tương ứng với ngăn xếp. Khi thao tác chèn xảy ra ở một đầu và thao tác xóa xảy ra ở đầu còn lại của danh sách liên kết, nó thể hiện đặc tính vào trước ra trước, tương ứng với hàng đợi.
- **Bảng băm**: Phương pháp nối chuỗi (separate chaining) là một trong những giải pháp phổ biến để xử lý xung đột băm. Trong cách tiếp cận này, tất cả các phần tử bị xung đột được đặt vào một danh sách liên kết.
- **Đồ thị**: Danh sách kề là một cách phổ biến để biểu diễn đồ thị, trong đó mỗi đỉnh của đồ thị được gắn với một danh sách liên kết, và mỗi phần tử trong danh sách liên kết đại diện cho một đỉnh khác được nối với đỉnh đó.

Danh sách liên kết đôi thường được dùng trong các tình huống cần truy cập nhanh đến phần tử trước và sau.

- **Cấu trúc dữ liệu nâng cao**: Ví dụ, trong cây đỏ-đen và cây B, ta cần truy cập nút cha của một nút, điều này có thể thực hiện được bằng cách lưu một tham chiếu đến nút cha trong nút đó, tương tự như danh sách liên kết đôi.
- **Lịch sử duyệt web**: Trong trình duyệt web, khi người dùng nhấn nút tiến hoặc lùi, trình duyệt cần biết trang web trước đó và trang web tiếp theo mà người dùng đã truy cập. Đặc tính của danh sách liên kết đôi giúp thao tác này trở nên đơn giản.
- **Thuật toán LRU**: Trong các thuật toán loại bỏ bộ nhớ đệm (LRU), ta cần nhanh chóng tìm ra dữ liệu được sử dụng ít gần đây nhất và hỗ trợ thêm, xóa nút một cách nhanh chóng. Sử dụng danh sách liên kết đôi rất phù hợp cho việc này.

Danh sách liên kết vòng thường được dùng trong các tình huống cần thực hiện các thao tác có tính chu kỳ, chẳng hạn như lập lịch tài nguyên trong hệ điều hành.

- **Thuật toán lập lịch xoay vòng (round-robin)**: Trong hệ điều hành, lập lịch xoay vòng là một thuật toán lập lịch CPU phổ biến, cần luân phiên xử lý một tập hợp các tiến trình. Mỗi tiến trình được cấp một khoảng thời gian (time slice), và khi khoảng thời gian đó hết hạn, CPU sẽ chuyển sang tiến trình tiếp theo. Thao tác luân phiên này có thể được cài đặt bằng một danh sách liên kết vòng.
- **Bộ đệm dữ liệu**: Trong một số cách cài đặt bộ đệm dữ liệu, danh sách liên kết vòng cũng có thể được sử dụng. Ví dụ, trong các trình phát âm thanh và video, luồng dữ liệu có thể được chia thành nhiều khối đệm và đặt vào một danh sách liên kết vòng để đạt được khả năng phát liền mạch.
