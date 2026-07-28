# Bài tập

## Ôn tập khái niệm

### Cách tìm kiếm nhị phân thu hẹp khoảng tìm kiếm

Tìm số 16 trong mảng đã sắp xếp `[2, 5, 8, 12, 16, 23, 38]`.
Sử dụng khoảng đóng `[i, j]` và tính điểm giữa theo công thức
$m=i+(j-i)/2$, làm tròn xuống.

Với mỗi vòng, hãy ghi lại `(i, j, m)`, phần tử ở giữa, và cách khoảng được thu hẹp tiếp theo,
cho đến khi tìm thấy mục tiêu.

??? success "Đáp án"

    Quá trình tìm kiếm diễn ra như sau:

    | Vòng | `(i, j, m)` | Phần tử giữa | Bước tiếp theo |
    | --- | --- | --- | --- |
    | 1 | `(0, 6, 3)` | 12 | `12 < 16`, đặt `i = 4` |
    | 2 | `(4, 6, 5)` | 23 | `23 > 16`, đặt `j = 4` |
    | 3 | `(4, 4, 4)` | 16 | Tìm thấy mục tiêu; trả về chỉ số 4 |

    Vì mảng đã được sắp xếp, khi giá trị giữa nhỏ hơn mục tiêu, giá trị giữa và mọi phần tử bên trái nó đều có thể loại bỏ.
    Khi giá trị giữa lớn hơn mục tiêu, giá trị giữa và mọi phần tử bên phải nó đều có thể loại bỏ.

### Biên trái và biên phải của các phần tử trùng lặp

Tìm số 2 trong mảng `[1, 2, 2, 2, 4, 6]`.
Một bạn học sử dụng tìm kiếm nhị phân, trả về ngay khi tìm thấy mục tiêu tại chỉ số 2, và nói rằng:
"Chỉ số 2 là biên trái của số 2."

<!-- numbered-subquestions -->

1. Nhận định của bạn học đó có đúng không? Biên trái và biên phải của số 2 là gì? Giải thích tại sao.
2. Khi tìm kiếm biên trái, nếu phần tử ở giữa bằng mục tiêu, nên tiếp tục tìm kiếm ở bên nào?
3. Khi tìm kiếm biên phải, nên tiếp tục tìm kiếm ở bên nào? Chỉ cần nêu hướng tìm kiếm, không cần viết đầy đủ quá trình tìm kiếm.

??? success "Đáp án"

    1. Nhận định của bạn học đó không đúng. Việc trả về ngay khi tìm thấy số 2 chỉ đảm bảo rằng đã tìm thấy một lần xuất hiện nào đó của số 2, chứ không phải lần xuất hiện ngoài cùng bên trái hay bên phải.
        Ở đây, biên trái là chỉ số 1 và biên phải là chỉ số 3.

    2. Khi tìm kiếm biên trái, hãy tiếp tục tìm kiếm ở bên trái ngay cả khi phần tử ở giữa bằng 2.
        Ví dụ, với khoảng đóng, đặt `j = m - 1`.

    3. Khi tìm kiếm biên phải, hãy tiếp tục tìm kiếm ở bên phải sau khi phần tử ở giữa bằng 2.
        Ví dụ, đặt `i = m + 1`.

### Lựa chọn phương pháp tìm kiếm cho các loại dữ liệu khác nhau

Với mỗi tình huống dưới đây, hãy chọn một phương pháp phù hợp trong số "tìm kiếm tuyến tính", "tìm kiếm nhị phân" và "bảng băm", và giải thích tại sao:

<!-- numbered-subquestions -->

1. Tìm kiếm nhiều lần trong $10^7$ số nguyên đã được sắp xếp và không bao giờ thay đổi, mà không xây dựng thêm bất kỳ cấu trúc dữ liệu nào.
2. Kiểm tra nhiều lần xem một khóa có tồn tại trong một tập hợp có tần suất chèn và xóa cao hay không. Tập hợp không cần giữ thứ tự sắp xếp, và không cần tìm kiếm theo khoảng.
3. Tìm kiếm một giá trị trong mảng chưa sắp xếp chỉ một lần duy nhất.

??? success "Đáp án"

    1. Tìm kiếm nhị phân: dữ liệu đã được sắp xếp và tĩnh, nên việc tìm kiếm chỉ tốn thời gian $O(\log n)$ mà không cần thêm không gian.
    2. Bảng băm: khi hàm băm phân bố các khóa tương đối đều vào các bucket, thao tác chèn, xóa và tra cứu theo khóa đều mất trung bình $O(1)$ thời gian.
    3. Duyệt trực tiếp từ đầu đến cuối. Khi chỉ tìm kiếm một lần, việc sắp xếp mảng hay xây dựng bảng băm vẫn đòi hỏi xử lý toàn bộ mảng trước,
        nên cả hai cách đều không giảm được tổng khối lượng công việc cho tác vụ đơn lẻ này.

        Việc lựa chọn phụ thuộc vào việc dữ liệu đã được sắp xếp hay chưa, có được phép dùng thêm cấu trúc hay không, cần tìm kiếm bao nhiêu lần, và những thao tác nào cần được hỗ trợ.

## Bài tập lập trình

### Tìm kiếm nhị phân trong mảng đã sắp xếp

Cho một mảng số nguyên `nums` được sắp xếp tăng dần nghiêm ngặt và một giá trị mục tiêu `target`, hãy sử dụng tìm kiếm nhị phân để tìm `target`. Nếu tồn tại, trả về chỉ số của nó trong mảng; nếu không, trả về -1.

??? tip "Gợi ý"

    1. Khoảng ban đầu là left = 0 và right = n - 1; khoảng này khác rỗng khi left <= right
    2. Tính điểm giữa bằng công thức mid = left + (right - left) // 2
    3. Nếu `nums[mid]` nhỏ hơn `target`, dịch biên trái sang `mid + 1`; nếu `nums[mid]` lớn hơn `target`, dịch biên phải sang `mid - 1`; nếu bằng nhau, trả về ngay lập tức

[LeetCode](https://leetcode.com/problems/binary-search/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### Điểm chèn trong mảng đã sắp xếp

Cho một mảng số nguyên `nums` được sắp xếp tăng dần nghiêm ngặt và một giá trị mục tiêu `target`.

Trả về chỉ số của `target` nếu nó đã có trong mảng. Nếu không, trả về điểm chèn tại đó `target` có thể được chèn vào trong khi vẫn giữ mảng tăng dần nghiêm ngặt.
Điểm chèn có thể là 0 hoặc bằng độ dài mảng. Hãy sử dụng tìm kiếm nhị phân.

??? tip "Gợi ý"

    1. Đáp án có thể là 0 hoặc độ dài mảng n
    2. Với khoảng đóng, nếu `nums[mid]` lớn hơn hoặc bằng `target`, đặt `right = mid - 1` và tiếp tục kiểm tra xa hơn về bên trái; nếu không, đặt `left = mid + 1`
    3. Khi vòng lặp kết thúc, left chính là điểm chèn

[LeetCode](https://leetcode.com/problems/search-insert-position/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
