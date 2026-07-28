# Biên tìm kiếm nhị phân

## Tìm biên trái

!!! question

    Cho một mảng đã sắp xếp `nums` có độ dài $n$ có thể chứa các phần tử trùng lặp, trả về chỉ số của vị trí xuất hiện bên trái nhất của `target`. Nếu mảng không chứa `target`, trả về $-1$.

Nhớ lại phương pháp tìm điểm chèn bằng tìm kiếm nhị phân. Sau khi tìm kiếm hoàn tất, $i$ trỏ đến `target` bên trái nhất, **vì vậy tìm điểm chèn về bản chất chính là tìm chỉ số của `target` bên trái nhất**.

Hãy xem xét việc triển khai tìm biên trái bằng hàm tìm điểm chèn. Lưu ý rằng mảng có thể không chứa `target`, điều này có thể dẫn đến hai trường hợp sau:

- Chỉ số điểm chèn $i$ nằm ngoài phạm vi mảng.
- Phần tử `nums[i]` không bằng `target`.

Khi một trong hai tình huống này xảy ra, chỉ cần trả về $-1$. Đoạn mã được trình bày dưới đây:

```src
[file]{binary_search_edge}-[class]{}-[func]{binary_search_left_edge}
```

## Tìm biên phải

Vậy làm thế nào để tìm `target` bên phải nhất? Cách trực tiếp nhất là sửa đổi đoạn mã và thay thế thao tác thu hẹp con trỏ trong trường hợp `nums[m] == target`. Đoạn mã này được lược bỏ ở đây; bạn đọc quan tâm có thể tự triển khai.

Dưới đây, ta giới thiệu thêm hai phương pháp khéo léo hơn.

### Tái sử dụng hàm tìm biên trái

Trên thực tế, ta có thể dùng hàm tìm `target` bên trái nhất để tìm `target` bên phải nhất. Phương pháp cụ thể là: **chuyển việc tìm `target` bên phải nhất thành tìm `target + 1` bên trái nhất**.

Như hình minh họa dưới đây, sau khi tìm kiếm hoàn tất, con trỏ $i$ trỏ đến `target + 1` bên trái nhất (nếu tồn tại), còn $j$ trỏ đến `target` bên phải nhất, **do đó ta có thể trả về $j$**.

![Chuyển đổi tìm biên phải thành tìm biên trái](binary_search_edge.assets/binary_search_right_edge_by_left_edge.png)

Lưu ý rằng điểm chèn được trả về là $i$, nên ta cần trừ đi $1$ để có được $j$:

```src
[file]{binary_search_edge}-[class]{}-[func]{binary_search_right_edge}
```

### Chuyển đổi thành tìm kiếm phần tử

Ta biết rằng khi mảng không chứa `target`, $i$ và $j$ cuối cùng sẽ trỏ lần lượt đến phần tử đầu tiên lớn hơn và phần tử đầu tiên nhỏ hơn `target`.

Do đó, như hình minh họa dưới đây, ta có thể dựng ra một phần tử không tồn tại trong mảng để tìm biên trái và biên phải.

- Tìm `target` bên trái nhất: Có thể chuyển thành tìm `target - 0.5` và trả về con trỏ $i$.
- Tìm `target` bên phải nhất: Có thể chuyển thành tìm `target + 0.5` và trả về con trỏ $j$.

![Chuyển đổi tìm biên thành tìm kiếm phần tử](binary_search_edge.assets/binary_search_edge_by_element.png)

Đoạn mã được lược bỏ ở đây, nhưng có hai điểm sau đáng lưu ý:

- Vì mảng đã cho không chứa giá trị thập phân, ta không cần lo lắng về cách xử lý trường hợp bằng nhau.
- Vì phương pháp này đưa vào số thập phân, biến `target` trong hàm cần được đổi sang kiểu số thực (Python không cần thay đổi này).
