# Bài tập

## Ôn tập khái niệm

### Mối quan hệ dữ liệu trong các tình huống đời thường

Dựa trên mối quan hệ giữa các dữ liệu, hãy chọn một trong "cấu trúc tuyến tính," "cấu trúc cây," và "cấu trúc mạng" cho mỗi tình huống dưới đây, và giải thích vì sao:

<!-- numbered-subquestions -->

1. Học sinh xếp thành hàng; ta chỉ quan tâm đến người đứng ngay trước và ngay sau mỗi học sinh.
2. Một trường học được tổ chức theo các cấp: "trường → khối → lớp."
3. Đường phố trong thành phố nối nhiều giao lộ với nhau. Một giao lộ có thể dẫn đến nhiều giao lộ khác, và các con đường có thể tạo thành vòng lặp.

??? success "Đáp án"

    1. Đây là cấu trúc tuyến tính. Ngoại trừ học sinh đầu tiên và cuối cùng, mỗi người đều kề với đúng một người phía trước và một người phía sau, nên các mối quan hệ nối dài theo một đường thẳng duy nhất.

    2. Đây là cấu trúc cây. Mỗi lớp thuộc về một khối, và mỗi khối thuộc về trường, nên các mối quan hệ tạo thành các cấp từ trên xuống dưới.

    3. Đây là cấu trúc mạng. Một giao lộ có thể nối với nhiều giao lộ khác, và các tuyến đường có thể tạo thành vòng lặp, nên chúng không thể được sắp xếp theo một thứ tự duy nhất hay một hệ cấp bậc chặt chẽ.

        Để xác định một cấu trúc, trước tiên hãy xem xét mối quan hệ giữa các phần tử chứ không phải nó chiếm bao nhiêu không gian trong bộ nhớ.

### Lưu trữ một thứ tự logic trong bộ nhớ

Xét hai cách bố trí bộ nhớ đơn giản hóa để lưu thứ tự logic `A → B → C`:

- Cách bố trí A: `A, B, C` được lưu trong các ô nhớ có số hiệu lần lượt là `20, 21, 22`.
- Cách bố trí B: `A, B, C` được lưu trong các ô nhớ có số hiệu lần lượt là `20, 7, 31`. `A` ghi lại vị trí của `B`, và `B` ghi lại vị trí của `C`.

<!-- numbered-subquestions -->

1. Cách bố trí nào dùng kiểu lưu trữ không gian liền kề, và cách nào dùng kiểu lưu trữ không gian phân tán?
2. Cách bố trí nào giống mảng hơn, và cách nào giống danh sách liên kết hơn?
3. Số hiệu ô nhớ trong cách bố trí B không tăng dần. Tại sao nó vẫn có thể biểu diễn thứ tự logic `A → B → C`?

??? success "Đáp án"

    1. Cách bố trí A dùng các ô nhớ liên tiếp nhau, nên nó dùng kiểu lưu trữ không gian liền kề. Các nút trong cách bố trí B nằm rải rác ở các vị trí khác nhau, nên nó dùng kiểu lưu trữ không gian phân tán.

    2. Cách bố trí A giống mảng hơn, và cách bố trí B giống danh sách liên kết hơn.

    3. Thứ tự logic được xác định bởi các liên kết được ghi lại giữa các nút, chứ không phải bởi thứ tự số hiệu ô nhớ.
        Vị trí mà `A` lưu dẫn đến `B`, và vị trí mà `B` lưu sau đó dẫn đến `C`, nên `A, B, C` vẫn có thể được ghé thăm theo đúng thứ tự.

        Điều này cũng cho thấy cấu trúc logic và cấu trúc vật lý là hai cách nhìn khác nhau về cùng một dữ liệu.

### Kiểu dữ liệu và cấu trúc trong bản ghi bài tập về nhà

Một nhóm học tập ghi lại, theo thứ tự chỗ ngồi, việc mỗi trong bốn học sinh có nộp bài tập về nhà hay không:

`[true, false, true, true]`

<!-- numbered-subquestions -->

1. Kiểu dữ liệu cơ bản nào phù hợp cho mỗi phần tử?
2. Bốn phần tử được sắp thành một hàng theo thứ tự chỗ ngồi. Đây là cấu trúc logic nào?
3. Giả sử sau đó nhóm ghi lại điểm bài tập về nhà của mỗi học sinh là `[90, 0, 85, 100]`. Điều này có làm thay đổi "loại nội dung" của dữ liệu hay "cách tổ chức" của nó không? Giải thích vì sao.

??? success "Đáp án"

    1. Mỗi phần tử chỉ thể hiện "có" hoặc "không," nên kiểu Boolean `bool` là phù hợp.

    2. Các phần tử được sắp theo thứ tự chỗ ngồi, tạo thành một cấu trúc tuyến tính có thể lưu trong một mảng.

    3. Loại nội dung thay đổi: các phần tử chuyển từ giá trị Boolean sang số nguyên. Cách tổ chức không thay đổi.
        Dữ liệu vẫn được sắp thành một hàng theo thứ tự chỗ ngồi và vẫn có thể lưu trong một mảng, đó là một cấu trúc tuyến tính.

        Một kiểu dữ liệu cơ bản mô tả "cái gì được lưu trữ," trong khi một cấu trúc dữ liệu mô tả "dữ liệu được tổ chức như thế nào."

## Bài tập lập trình

### Đếm số bit 1 trong biểu diễn nhị phân

Cho một số nguyên không âm `n`, hãy đếm số bit 1 trong biểu diễn nhị phân của nó.

Hãy dùng các phép toán bit. Không chuyển biểu diễn nhị phân thành chuỗi, cũng không dùng hàm dựng sẵn đếm trực tiếp số bit 1.

??? tip "Gợi ý"

    1. n & 1 trích ra bit ngoài cùng bên phải của n, cho biết bit đó có bằng 1 hay không
    2. Dịch phải một bit sẽ loại bỏ bit ngoài cùng bên phải hiện tại; hầu hết ngôn ngữ dùng toán tử >>
    3. Sau khi cài đặt phương pháp kiểm tra và dịch từng bit một, hãy quan sát rằng n & (n - 1) biến bit 1 ngoài cùng bên phải của n thành 0

[LeetCode](https://leetcode.com/problems/number-of-1-bits/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
