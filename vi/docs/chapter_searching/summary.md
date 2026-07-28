# Tổng kết

### Ôn tập trọng tâm

- Tìm kiếm nhị phân dựa vào dữ liệu có thứ tự và tìm kiếm bằng cách liên tục thu hẹp khoảng tìm kiếm còn một nửa. Nó đòi hỏi dữ liệu đầu vào phải được sắp xếp và chỉ áp dụng cho mảng hoặc các cấu trúc dữ liệu dựa trên mảng.
- Tìm kiếm vét cạn xác định vị trí dữ liệu bằng cách duyệt qua cấu trúc dữ liệu. Tìm kiếm tuyến tính áp dụng cho mảng và danh sách liên kết, trong khi tìm kiếm theo chiều rộng và tìm kiếm theo chiều sâu áp dụng cho đồ thị và cây. Các thuật toán này có tính áp dụng rộng rãi và không đòi hỏi tiền xử lý dữ liệu, nhưng độ phức tạp thời gian tương đối cao, ở mức $O(n)$.
- Tìm kiếm dựa trên bảng băm, tìm kiếm trên cây và tìm kiếm nhị phân là các phương pháp tìm kiếm hiệu quả, có thể nhanh chóng xác định vị trí phần tử mục tiêu trong các cấu trúc dữ liệu cụ thể. Các thuật toán này có hiệu suất cao với độ phức tạp thời gian đạt $O(\log n)$ hoặc thậm chí $O(1)$, nhưng thường đòi hỏi thêm cấu trúc dữ liệu bổ sung.
- Trong thực tế, chúng ta cần phân tích các yếu tố như quy mô dữ liệu, yêu cầu về hiệu suất tìm kiếm, tần suất truy vấn và cập nhật dữ liệu để chọn phương pháp tìm kiếm phù hợp.
- Tìm kiếm tuyến tính phù hợp với tập dữ liệu nhỏ hoặc dữ liệu được cập nhật thường xuyên; tìm kiếm nhị phân phù hợp với tập dữ liệu lớn đã được sắp xếp; tìm kiếm dựa trên bảng băm phù hợp khi yêu cầu hiệu suất truy vấn cao và không cần truy vấn theo khoảng; tìm kiếm trên cây phù hợp với tập dữ liệu động lớn cần duy trì thứ tự và hỗ trợ truy vấn theo khoảng.
- Thay thế tìm kiếm tuyến tính bằng tìm kiếm dựa trên bảng băm là một chiến lược thường dùng để tối ưu hóa thời gian chạy, giúp giảm độ phức tạp thời gian từ $O(n)$ xuống $O(1)$.
