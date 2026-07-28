# Bài tập

## Ôn tập khái niệm

### Chọn đồng xu lớn nhất có luôn là tốt nhất?

Các mệnh giá xu là `[1, 7, 10]`, và số tiền mục tiêu là 14.

<!-- numbered-subquestions -->

1. Áp dụng quy tắc "luôn chọn mệnh giá lớn nhất không vượt quá số tiền còn lại," và viết ra các đồng xu được chọn.
2. Có lời giải nào sử dụng ít đồng xu hơn không? Nếu có, hãy đưa ra một lời giải; nếu không, hãy giải thích lý do.
3. Ví dụ này có cho thấy chiến lược tham lam đúng với mọi tập mệnh giá xu hay không?

??? success "Đáp án"

    1. Chiến lược tham lam chọn `10 + 1 + 1 + 1 + 1`, sử dụng tổng cộng 5 đồng xu.

    2. Có lời giải sử dụng ít đồng xu hơn: `7 + 7`, chỉ sử dụng 2 đồng xu.

    3. Không. Phản ví dụ này cho thấy rằng, với các mệnh giá xu tùy ý, việc liên tục chọn mệnh giá lớn nhất hiện có không nhất thiết sẽ tối thiểu hóa số lượng đồng xu.
        Lựa chọn lớn nhất ngay lập tức có thể ngăn cản một tổ hợp tốt hơn về sau.

### Vật phẩm nào nên đưa vào túi trước?

Một cái túi có dung tích 4 kilôgam có thể chứa các vật phẩm sau. Có thể lấy một phần của vật phẩm,
và giá trị thu được tỷ lệ thuận với trọng lượng của nó:

- Vật phẩm A: trọng lượng 4 kilôgam, giá trị 20.
- Vật phẩm B: trọng lượng 3 kilôgam, giá trị 18.

<!-- numbered-subquestions -->

1. Giá trị trên mỗi kilôgam của mỗi vật phẩm là bao nhiêu? Vật phẩm nào nên được đặt vào túi trước?
2. Hãy lấp đầy túi bằng chiến lược tham lam cho bài toán cái túi phân số. Giá trị cuối cùng là bao nhiêu?
3. Khi các vật phẩm có thể chia nhỏ và túi giới hạn tổng trọng lượng, các vật phẩm nên được so sánh theo tổng giá trị hay theo giá trị trên mỗi kilôgam? Vì sao?

??? success "Đáp án"

    1. A có giá trị `20 ÷ 4 = 5` trên mỗi kilôgam, trong khi B có giá trị `18 ÷ 3 = 6` trên mỗi kilôgam,
        vì vậy B, với giá trị trên mỗi đơn vị trọng lượng cao hơn, nên được đặt vào túi trước.

    2. Trước tiên lấy toàn bộ B, sử dụng 3 kilôgam dung tích và thu được giá trị 18. Với 1 kilôgam dung tích còn lại,
        lấy 1 kilôgam của A, thu được giá trị 5. Giá trị cuối cùng là `18 + 5 = 23`.

    3. Túi giới hạn tổng trọng lượng, và các vật phẩm có thể chia nhỏ, nên chúng cần được so sánh theo giá trị trên mỗi đơn vị trọng lượng.
        Mặc dù A có tổng giá trị cao hơn, nhưng giá trị trên mỗi kilôgam của nó lại thấp hơn B. Nếu lấp đầy túi bằng A trước thì chỉ thu được giá trị 20.

### Con trỏ nào nên di chuyển tiếp theo?

Chiều cao các vách ngăn là `[1, 8, 6, 2, 5]`. Sử dụng hai con trỏ, mỗi con trỏ đặt ở một đầu, để tìm dung tích lớn nhất.
Dung tích bằng "chiều cao của vách ngăn thấp hơn × khoảng cách giữa chỉ số của các vách ngăn."

<!-- numbered-subquestions -->

1. Ban đầu, con trỏ trái ở chỉ số 0 và con trỏ phải ở chỉ số 4. Dung tích hiện tại là bao nhiêu? Con trỏ nào nên di chuyển tiếp theo?
2. Sau khi thực hiện bước di chuyển được chọn ở Câu 1, hai con trỏ nằm ở chỉ số nào? Dung tích bây giờ là bao nhiêu? Con trỏ nào nên di chuyển tiếp theo?
3. Với cặp vách ngăn hiện tại, bạn có thể di chuyển con trỏ ở vách ngăn thấp hơn hoặc con trỏ ở vách ngăn cao hơn. Bước di chuyển nào vẫn có thể cho ra dung tích lớn hơn, và vì sao?

??? success "Đáp án"

    1. Dung tích hiện tại là `min(1, 5) × (4 - 0) = 4`. Vách ngăn bên trái thấp hơn, nên di chuyển con trỏ trái.

    2. Sau khi con trỏ trái di chuyển, các con trỏ nằm ở chỉ số 1 và 4. Dung tích hiện tại là
        `min(8, 5) × (4 - 1) = 15`. Vách ngăn bên phải thấp hơn, nên di chuyển con trỏ phải tiếp theo.

    3. Di chuyển con trỏ ở vách ngăn thấp hơn là bước di chuyển duy nhất vẫn có thể cho ra dung tích lớn hơn. Nếu con trỏ của vách ngăn cao hơn di chuyển, khoảng cách chắc chắn giảm trong khi chiều cao vẫn bị giới hạn bởi vách ngăn thấp hơn không di chuyển,
        nên dung tích chỉ có thể giữ nguyên hoặc giảm. Chỉ khi di chuyển vách ngăn thấp hơn mới có khả năng tìm được một vách ngăn cao hơn.

## Bài tập lập trình

### Cái túi phân số

Cho hai mảng `wgt` và `val` có cùng độ dài, trong đó `wgt[i] > 0` và `val[i] >= 0`. Túi có dung tích `cap >= 0`.
Mỗi vật phẩm chỉ có một cái, nhưng có thể đặt bất kỳ phần nào của vật phẩm vào túi.
Giá trị thu được tỷ lệ thuận với phần trọng lượng của vật phẩm được đưa vào. Sử dụng giải thuật tham lam
và trả về tổng giá trị lớn nhất mà túi có thể chứa dưới dạng một số thực.

??? tip "Gợi ý"

    1. Trước tiên tính giá trị trên mỗi đơn vị trọng lượng của mỗi vật phẩm là val[i] / wgt[i], giữ lại phần thập phân của phép chia
    2. Đặt các vật phẩm có giá trị trên mỗi đơn vị trọng lượng cao hơn vào túi trước
    3. Nếu dung tích còn lại nhỏ hơn trọng lượng của vật phẩm hiện tại, lấy đúng phần lấp đầy túi rồi dừng lại
