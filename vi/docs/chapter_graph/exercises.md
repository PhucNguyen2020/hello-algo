# Bài tập

## Ôn tập khái niệm

### Biểu diễn cùng một đồ thị theo hai cách

Một đồ thị vô hướng có bốn đỉnh, `A, B, C, D`, và các cạnh
`A-B, A-C, B-C, C-D`.

<!-- numbered-subquestions -->

1. Viết danh sách kề của đồ thị này.
2. Điền ma trận kề của đồ thị này chỉ dùng các giá trị 0 và 1.
3. Để xác định xem `A` và `D` có kết nối trực tiếp hay không, cách biểu diễn đồ thị nào chỉ cần kiểm tra một mục lưu trữ duy nhất?
4. Nếu một đồ thị có nhiều đỉnh nhưng ít cạnh, cách biểu diễn nào thường sử dụng ít không gian hơn?

??? success "Đáp án"

    1. Danh sách kề là:

        ```text
        A: B, C
        B: A, C
        C: A, B, D
        D: C
        ```

    2. Ma trận kề là:

        | | A | B | C | D |
        | --- | --- | --- | --- | --- |
        | A | 0 | 1 | 1 | 0 |
        | B | 1 | 0 | 1 | 0 |
        | C | 1 | 1 | 0 | 1 |
        | D | 0 | 0 | 1 | 0 |

    3. Trong ma trận kề, ta có thể kiểm tra trực tiếp hàng `A`, cột `D`, nên nó rất phù hợp để xác định xem hai đỉnh bất kỳ có kết nối trực tiếp hay không.

    4. Khi một đồ thị có nhiều đỉnh nhưng ít cạnh, danh sách kề chỉ ghi lại những cạnh thực sự tồn tại. Nó thường sử dụng ít không gian hơn so với ma trận kề, vốn phải dành một vị trí cho mọi cặp đỉnh.

### Thứ tự duyệt theo chiều rộng và chiều sâu

Một đồ thị vô hướng có các đỉnh `A, B, C, D, E` và các cạnh
`A-B, A-C, B-D, C-D, D-E`.

Bắt đầu tại A. Bất cứ khi nào có nhiều đỉnh kề chưa được ghé thăm, hãy chọn chúng theo thứ tự bảng chữ cái:

<!-- numbered-subquestions -->

1. Viết thứ tự ghé thăm của duyệt theo chiều rộng (BFS).
2. Viết thứ tự ghé thăm của duyệt theo chiều sâu đệ quy (DFS).
3. Vì sao cả hai cách duyệt đều phải ghi lại những đỉnh đã được ghé thăm?

??? success "Đáp án"

    1. Thứ tự ghé thăm của BFS là `A, B, C, D, E`. Nó ghé thăm B và C trước, vì hai đỉnh này cách A một cạnh,
        sau đó mới ghé thăm D và E ở xa hơn.

    2. Thứ tự ghé thăm của DFS là `A, B, D, C, E`. Nó liên tục đi vào một đỉnh kề chưa được ghé thăm,
        trước tiên theo đường `A → B → D → C`. Khi C không còn đỉnh kề mới, nó quay lại D rồi ghé thăm E.

    3. Đồ thị chứa một chu trình, chẳng hạn `A-B-D-C-A`. Nếu không ghi lại các đỉnh đã ghé thăm,
        quá trình duyệt có thể lặp lại việc ghé thăm cùng các đỉnh quanh chu trình và không thể kết thúc bình thường.

### Một lần BFS có thể duyệt hết toàn bộ đồ thị không?

Một đồ thị vô hướng có các đỉnh `A, B, C, D, E, F` và chỉ có các cạnh
`A-B, B-C, D-E`.

<!-- numbered-subquestions -->

1. Một lần BFS bắt đầu tại A có thể ghé thăm những đỉnh nào?
2. Dựa trên câu hỏi 1, lần BFS này đã ghé thăm hết mọi đỉnh trong đồ thị chưa? Vì sao?
3. Giả sử bạn quét tất cả các đỉnh theo thứ tự bảng chữ cái và bắt đầu một lần BFS mới mỗi khi gặp một đỉnh chưa được ghé thăm.
    Đỉnh xuất phát của mỗi lần BFS là gì? Đồ thị được chia thành bao nhiêu phần không liên thông với nhau (thành phần liên thông)?

??? success "Đáp án"

    1. Xuất phát từ A, quá trình duyệt chỉ có thể ghé thăm `A, B, C`.

    2. Nó chưa ghé thăm hết mọi đỉnh. `D, E` tạo thành một phần liên thông khác, còn F là một đỉnh cô lập.
        Không đỉnh nào trong số đó có đường đi đến A, nên chúng không thể đến được từ A.

    3. Ba lần duyệt BFS bắt đầu tại `A, D, F`, và lần lượt ghé thăm
        `{A, B, C}`, `{D, E}`, và `{F}`. Do đó, đồ thị có 3 thành phần liên thông.

## Bài tập lập trình

### Xác định xem có tồn tại đường đi trong đồ thị vô hướng hay không

Cho một đồ thị vô hướng có $n$ đỉnh được đánh số từ $0$ đến $n-1$. Mỗi phần tử `[u, v]` trong mảng `edges` biểu diễn một cạnh vô hướng giữa đỉnh `u` và đỉnh `v`.

Bạn cũng được cho một đỉnh xuất phát `source` và một đỉnh đích `destination`. Trước tiên hãy xây dựng danh sách kề từ `edges`, sau đó dùng BFS hoặc DFS
để xác định xem có tồn tại đường đi từ `source` đến `destination` hay không. Trả về `true` nếu có, ngược lại trả về `false`.
Đồ thị có thể chứa chu trình và có thể không liên thông.

??? tip "Gợi ý"

    1. Thêm mỗi cạnh vô hướng theo cả hai chiều
    2. Đồ thị có thể chứa chu trình, nên bạn phải ghi lại những đỉnh đã được ghé thăm
    3. Xuất phát từ source, trả về true nếu gặp destination; nếu quá trình duyệt kết thúc mà không đến được đó, trả về false

[LeetCode](https://leetcode.com/problems/find-if-path-exists-in-graph/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
