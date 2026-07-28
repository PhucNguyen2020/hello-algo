# Bài tập

## Ôn tập khái niệm

### Khi nào quy hoạch động phù hợp?

Một sinh viên nói: "Bất cứ khi nào có thể viết được một công thức truy hồi, nên sử dụng quy hoạch động."
Với mỗi nhiệm vụ dưới đây, hãy quyết định xem quy hoạch động, quay lui, hay một vòng lặp/công thức toán học không cần bảng `dp` là phù hợp hơn. Nêu một lý do chính.

<!-- numbered-subquestions -->

1. Sử dụng các mệnh giá xu `[1, 3, 4]`, tạo ra số tiền 6 với số lượng xu ít nhất. Mỗi mệnh giá có thể được sử dụng nhiều lần.
2. Xuất ra tất cả các hoán vị của `[1, 2, 3]`.
3. Tính $1 + 2 + \dots + n$.

    Với nhiệm vụ mà bạn cho là phù hợp với quy hoạch động, hãy nêu rõ `dp[i]` biểu diễn điều gì.

??? success "Đáp án"

    1. Quy hoạch động phù hợp. Cho `dp[i]` là số lượng xu ít nhất cần thiết để tạo ra số tiền `i`.
        Với mỗi đồng xu `c` không vượt quá `i`, `dp[i-c] + 1` là một đáp án ứng cử,
        và giá trị nhỏ nhất trong số các ứng cử này được chọn. Các lựa chọn khác nhau liên tục gặp lại cùng những số tiền, và lời giải tối ưu cho số tiền lớn hơn có thể được xây dựng từ lời giải tối ưu của các số tiền nhỏ hơn.
        Đáp án cho số tiền 6 là 2, sử dụng `3 + 3`.

    2. Quay lui phù hợp. Nhiệm vụ yêu cầu tạo ra lần lượt tất cả 6 hoán vị. Quay lui có thể thực hiện một lựa chọn một cách có hệ thống, tiếp tục tìm kiếm,
        hoàn tác lựa chọn, rồi thử nhánh khác. Bất kể phương pháp nào, việc thực sự xuất ra từng hoán vị đòi hỏi phải liệt kê chúng.

    3. Một vòng lặp hoặc công thức tổng cấp số cộng là đủ. Mặc dù công thức truy hồi `S(i) = S(i-1) + i` có thể viết được, việc tính `S(i)` chỉ phụ thuộc vào một giá trị nhỏ hơn duy nhất, `S(i-1)`.
        Mỗi tổng riêng phần chỉ cần tính một lần, nên không có bài toán con lặp lại và không cần bảng `dp`. "Có thể viết được công thức truy hồi" không có nghĩa là "cần quy hoạch động".

### Tính một ô trong bảng cái túi

Xét bài toán cái túi 0-1 sau: trọng lượng vật phẩm `wgt = [1, 2, 3]`, giá trị `val = [5, 11, 15]`, và dung lượng túi là 4.
`dp[i][c]` là giá trị lớn nhất đạt được khi chỉ sử dụng $i$ vật phẩm đầu tiên với giới hạn dung lượng túi là $c$;
túi không cần phải được lấp đầy hoàn toàn.

Chỉ tính trạng thái `dp[3][4]`. Bạn được cho `dp[2][4] = 16` và `dp[2][1] = 5`:

<!-- numbered-subquestions -->

1. Nếu vật phẩm thứ ba không được chọn, giá trị ứng cử là bao nhiêu?
2. Nếu vật phẩm thứ ba được chọn, còn lại bao nhiêu dung lượng, và giá trị ứng cử là bao nhiêu?
3. `dp[3][4]` nên là bao nhiêu? Giá trị này tương ứng với việc chọn những vật phẩm nào?

??? success "Đáp án"

    1. Nếu vật phẩm thứ ba không được chọn, giữ nguyên kết quả từ hai vật phẩm đầu tiên. Giá trị ứng cử là `dp[2][4] = 16`.

    2. Vật phẩm thứ ba có trọng lượng 3, nên dung lượng $4-3=1$ còn lại sau khi nó được đặt vào túi. Giá trị ứng cử là
        `dp[2][1] + 15 = 5 + 15 = 20`.

    3. So sánh 16 và 20 cho `dp[3][4] = 20`. Điều này tương ứng với việc chọn vật phẩm thứ nhất và thứ ba,
        có tổng trọng lượng $1+3=4$ và tổng giá trị $5+15=20$.

        Việc tính trạng thái này minh họa một lần so sánh "chọn hoặc không chọn" trong bài toán cái túi 0-1.

### Nên cập nhật dung lượng túi theo thứ tự nào?

Một bài toán cái túi 0-1 chỉ có một vật phẩm, với trọng lượng 2 và giá trị 5, và túi có dung lượng 4.
Vật phẩm này có thể được chọn tối đa một lần. Mảng một chiều ban đầu là `dp = [0, 0, 0, 0, 0]`.

Một sinh viên xử lý vật phẩm bằng cách cập nhật các dung lượng từ 2 đến 4:

- Sau khi cập nhật `dp[2]`, giá trị của nó là 5.
- Sau khi cập nhật `dp[3]`, giá trị của nó cũng là 5.
- Khi cập nhật `dp[4]`, sinh viên này sử dụng giá trị `dp[2]` vừa thu được, tạo ra `dp[4] = 10`.

<!-- numbered-subquestions -->

1. `dp[4] = 10` có đúng không? Tại sao có hoặc tại sao không?
2. Vì mỗi vật phẩm chỉ có thể được chọn tối đa một lần, `dp[4]` nên là bao nhiêu?
3. Khi xử lý mỗi vật phẩm, dung lượng nên được cập nhật từ lớn đến nhỏ hay từ nhỏ đến lớn? Điều này tránh được vấn đề gì?

??? success "Đáp án"

    1. Kết quả là sai. Giá trị 10 tương đương với việc đặt vật phẩm có giá trị 5 vào túi hai lần,
        vi phạm điều kiện rằng mỗi vật phẩm chỉ có thể được chọn tối đa một lần.

    2. Túi chỉ có thể chứa nhiều nhất một vật phẩm này, nên giá trị đúng của `dp[4]` là 5.

    3. Dung lượng nên được cập nhật từ lớn đến nhỏ, theo thứ tự 4, 3, 2.
        Khi đó, khi tính `dp[c]`, giá trị đọc từ `dp[c-2]` vẫn đến từ trước khi vật phẩm hiện tại được xử lý,
        ngăn việc vật phẩm hiện tại bị sử dụng lại nhiều lần trong cùng một vòng.

## Bài tập lập trình

### Số cách leo cầu thang

Một cầu thang có `n` bậc. Mỗi bước di chuyển có thể leo 1 hoặc 2 bậc, và bạn phải dừng chính xác ở bậc `n`.
Tính số cách khác nhau để lên đến đỉnh. Giả sử `n >= 1`; các cách chỉ được phân biệt bởi dãy các bước di chuyển 1 bậc và 2 bậc.
Sử dụng một mảng quy hoạch động một chiều. Hiện tại chưa cần dùng tối ưu hóa không gian chỉ giữ lại hai trạng thái.

??? tip "Gợi ý"

    1. Bước di chuyển cuối cùng đến bậc i chỉ có thể vượt qua 1 hoặc 2 bậc
    2. Do đó, dp[i] = dp[i-1] + dp[i-2]
    3. Xử lý các trường hợp n bằng 1 hoặc 2 trước, sau đó điền vào bảng bắt đầu từ bậc 3

[LeetCode](https://leetcode.com/problems/climbing-stairs/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### Cái túi 0-1

Bạn được cho các mảng `wgt` và `val` có cùng độ dài. Vật phẩm `i` có trọng lượng số nguyên dương `wgt[i]` và giá trị không âm `val[i]`.
Dung lượng túi `cap` là một số nguyên không âm. Mỗi vật phẩm có thể được chọn tối đa một lần. Tìm tổng giá trị lớn nhất có thể đặt vào túi
mà không vượt quá `cap`. Sử dụng quy hoạch động một chiều.

??? tip "Gợi ý"

    1. Khởi tạo một mảng dp có độ dài cap + 1, trong đó dp[c] là giá trị lớn nhất với giới hạn dung lượng c
    2. Khi xử lý vật phẩm i, so sánh dp[c], không chọn nó, với dp[c-wgt[i]] + val[i], có chọn nó
    3. Cập nhật dung lượng từ lớn đến nhỏ để tránh chọn lại vật phẩm hiện tại nhiều lần trong cùng một vòng
