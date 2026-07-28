# Tổng kết

### Điểm cần ghi nhớ

- Quy hoạch động phân rã bài toán và tránh việc tính toán lặp lại bằng cách lưu trữ lời giải của các bài toán con, nhờ đó cải thiện đáng kể hiệu quả tính toán.
- Nếu không xét đến ràng buộc thời gian, tất cả các bài toán quy hoạch động đều có thể được giải bằng quay lui (tìm kiếm vét cạn), nhưng cây đệ quy chứa một lượng lớn các bài toán con chồng lấp, dẫn đến hiệu quả cực kỳ thấp. Bằng cách đưa vào một bảng ghi nhớ, ta có thể lưu trữ lời giải của tất cả các bài toán con đã tính, đảm bảo rằng các bài toán con chồng lấp chỉ được tính một lần.
- Ghi nhớ (memoization) là lời giải đệ quy từ trên xuống, còn quy hoạch động tương ứng là lời giải lặp từ dưới lên, tương tự như "điền vào bảng". Vì trạng thái hiện tại chỉ phụ thuộc vào một số trạng thái cục bộ nhất định, ta có thể loại bỏ một chiều của bảng $dp$ để giảm độ phức tạp không gian.
- Phân rã bài toán con là một phương pháp thuật toán tổng quát, với các đặc tính khác nhau trong chia để trị, quy hoạch động và quay lui.
- Các bài toán quy hoạch động có ba đặc điểm lớn: bài toán con chồng lấp, cấu trúc con tối ưu, và không có hiệu ứng lề (no aftereffects).
- Nếu lời giải tối ưu của bài toán gốc có thể được xây dựng từ lời giải tối ưu của các bài toán con, thì bài toán đó có cấu trúc con tối ưu.
- Không có hiệu ứng lề nghĩa là đối với một trạng thái nhất định, diễn biến tương lai của nó chỉ liên quan đến trạng thái đó và không liên quan đến tất cả các trạng thái trong quá khứ. Nhiều bài toán tối ưu hóa tổ hợp không thỏa mãn tính chất này và không thể giải hiệu quả bằng quy hoạch động.

**Bài toán cái túi**

- Bài toán cái túi là một trong những bài toán quy hoạch động điển hình nhất, với các biến thể như cái túi 0-1, cái túi không giới hạn và cái túi nhiều bản sao.
- Định nghĩa trạng thái cho cái túi 0-1 là giá trị lớn nhất đạt được khi sử dụng $i$ vật phẩm đầu tiên với dung lượng túi là $c$. Dựa trên hai quyết định là không đặt vật phẩm vào túi và đặt vào túi, ta có thể xác định cấu trúc con tối ưu và xây dựng phương trình chuyển trạng thái. Trong tối ưu hóa không gian, vì mỗi trạng thái phụ thuộc vào trạng thái ngay phía trên và phía trên bên trái, danh sách cần được duyệt theo thứ tự ngược lại để tránh ghi đè lên trạng thái phía trên bên trái.
- Bài toán cái túi không giới hạn không giới hạn số lượng lựa chọn của mỗi loại vật phẩm, nên việc chuyển trạng thái khi chọn đặt một vật phẩm vào khác với bài toán cái túi 0-1. Vì trạng thái phụ thuộc vào trạng thái ngay phía trên và ngay bên trái, việc tối ưu hóa không gian nên sử dụng duyệt theo thứ tự xuôi.
- Bài toán đổi tiền xu là một biến thể của bài toán cái túi không giới hạn. Nó thay đổi từ việc tìm giá trị "lớn nhất" sang tìm số lượng đồng xu "nhỏ nhất", nên $\max()$ trong phương trình chuyển trạng thái cần được đổi thành $\min()$. Nó thay đổi từ việc tìm giá trị "không vượt quá" dung lượng túi sang tìm giá trị "vừa đúng bằng" số tiền mục tiêu, nên $amt + 1$ được dùng để biểu diễn lời giải không hợp lệ của trường hợp "không thể tạo ra số tiền mục tiêu".
- Bài toán đổi tiền xu II thay đổi từ việc tìm "số lượng đồng xu nhỏ nhất" sang tìm "số cách tổ hợp đồng xu", nên phương trình chuyển trạng thái tương ứng thay đổi từ $\min()$ thành toán tử tổng.

**Bài toán khoảng cách chỉnh sửa**

- Khoảng cách chỉnh sửa (khoảng cách Levenshtein) được dùng để đo độ tương đồng giữa hai chuỗi, được định nghĩa là số bước chỉnh sửa tối thiểu để biến một chuỗi thành chuỗi khác, với các thao tác chỉnh sửa bao gồm chèn, xóa và thay thế.
- Định nghĩa trạng thái cho bài toán khoảng cách chỉnh sửa là số bước chỉnh sửa tối thiểu cần thiết để biến $i$ ký tự đầu tiên của $s$ thành $j$ ký tự đầu tiên của $t$. Khi $s[i] \ne t[j]$, có ba quyết định: chèn, xóa, thay thế, mỗi quyết định có bài toán con còn lại tương ứng. Từ đó, ta có thể xác định cấu trúc con tối ưu và xây dựng phương trình chuyển trạng thái. Khi $s[i] = t[j]$, không cần chỉnh sửa ký tự hiện tại.
- Trong khoảng cách chỉnh sửa, trạng thái phụ thuộc vào trạng thái ngay phía trên, ngay bên trái, và phía trên bên trái, nên sau khi tối ưu hóa không gian, cả duyệt xuôi lẫn duyệt ngược đều không thể thực hiện chuyển trạng thái một cách chính xác. Vì lý do này, ta dùng một biến để tạm thời lưu trạng thái phía trên bên trái, từ đó biến đổi thành tình huống tương đương với bài toán cái túi không giới hạn, cho phép duyệt theo thứ tự xuôi sau khi tối ưu hóa không gian.
