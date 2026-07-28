# Tổng kết

### Ôn tập trọng tâm

- Cấu trúc dữ liệu có thể được phân loại theo hai góc độ: cấu trúc logic và cấu trúc vật lý. Cấu trúc logic mô tả mối quan hệ logic giữa các phần tử dữ liệu, còn cấu trúc vật lý mô tả cách dữ liệu được lưu trữ trong bộ nhớ máy tính.
- Các cấu trúc logic phổ biến bao gồm cấu trúc tuyến tính, cấu trúc dạng cây và cấu trúc dạng mạng. Ta thường phân loại cấu trúc dữ liệu thành tuyến tính (mảng, danh sách liên kết, ngăn xếp, hàng đợi) và phi tuyến tính (cây, đồ thị, heap) dựa trên cấu trúc logic của chúng. Việc hiện thực bảng băm có thể liên quan đến cả cấu trúc dữ liệu tuyến tính lẫn phi tuyến tính.
- Khi một chương trình chạy, dữ liệu được lưu trữ trong bộ nhớ máy tính. Mỗi không gian bộ nhớ có một địa chỉ bộ nhớ tương ứng, và chương trình truy cập dữ liệu thông qua các địa chỉ bộ nhớ này.
- Cấu trúc vật lý chủ yếu được chia thành lưu trữ không gian liên tục (mảng) và lưu trữ không gian phân tán (danh sách liên kết). Mọi cấu trúc dữ liệu đều được hiện thực bằng mảng, danh sách liên kết, hoặc sự kết hợp của cả hai.
- Các kiểu dữ liệu cơ bản trong máy tính bao gồm số nguyên `byte`, `short`, `int`, `long`, số thực dấu phẩy động `float`, `double`, ký tự `char`, và luận lý `bool`. Phạm vi giá trị của chúng phụ thuộc vào kích thước không gian mà chúng chiếm dụng và phương pháp biểu diễn.
- Mã thuận, mã ngược và mã bù là ba phương pháp mã hóa số trong máy tính, và chúng có thể chuyển đổi qua lại lẫn nhau. Bit cao nhất của mã thuận là bit dấu, còn các bit còn lại biểu diễn giá trị của số đó.
- Số nguyên được lưu trữ trong máy tính dưới dạng mã bù. Với biểu diễn mã bù, máy tính có thể xử lý thống nhất phép cộng của cả số dương lẫn số âm, mà không cần thiết kế mạch phần cứng riêng cho phép trừ, và không còn sự mập mờ giữa số không dương và số không âm.
- Mã hóa số thực dấu phẩy động gồm 1 bit dấu, 8 bit mũ và 23 bit phần định trị. Nhờ có bit mũ, phạm vi của số thực dấu phẩy động lớn hơn nhiều so với số nguyên, đổi lại phải hy sinh độ chính xác.
- ASCII là bộ ký tự tiếng Anh ra đời sớm nhất, có độ dài 1 byte, chứa tổng cộng 128 ký tự. GBK là bộ ký tự tiếng Trung thông dụng, chứa hơn 20.000 chữ Hán. Unicode hướng đến việc cung cấp một chuẩn bộ ký tự hoàn chỉnh, thu thập ký tự từ nhiều ngôn ngữ khác nhau trên thế giới, từ đó giải quyết vấn đề lỗi phông chữ do các phương pháp mã hóa ký tự không nhất quán gây ra.
- UTF-8 là phương pháp mã hóa Unicode phổ biến nhất và có khả năng tương thích xuất sắc. Đây là một phương pháp mã hóa có độ dài thay đổi với khả năng mở rộng tốt, giúp nâng cao hiệu quả sử dụng không gian lưu trữ. UTF-16 và UTF-32 cũng là các phương pháp mã hóa Unicode phổ biến. Khi mã hóa chữ Hán, UTF-16 chiếm ít không gian hơn UTF-8. Các ngôn ngữ lập trình như Java và C# mặc định dùng mã hóa UTF-16.

### Hỏi & Đáp

**Hỏi**: Vì sao bảng băm lại chứa cả cấu trúc dữ liệu tuyến tính lẫn phi tuyến tính?

Cấu trúc bên dưới của bảng băm là một mảng. Để giải quyết xung đột băm, ta có thể dùng phương pháp "nối chuỗi" (sẽ được thảo luận trong phần "Xung đột băm" ở sau): mỗi ngăn (bucket) trong mảng trỏ đến một danh sách liên kết, và danh sách này có thể được chuyển đổi thành cây (thường là cây đỏ-đen) khi độ dài danh sách vượt quá một ngưỡng nhất định.

Xét từ góc độ lưu trữ, cấu trúc bên dưới của bảng băm là một mảng, trong đó mỗi ngăn có thể chứa một giá trị, một danh sách liên kết, hoặc một cây. Do đó, bảng băm có thể chứa cả cấu trúc dữ liệu tuyến tính (mảng, danh sách liên kết) lẫn cấu trúc dữ liệu phi tuyến tính (cây).

**Hỏi**: Độ dài của kiểu `char` có phải luôn là 1 byte không?

Độ dài của kiểu `char` được quyết định bởi phương pháp mã hóa mà ngôn ngữ lập trình sử dụng. Ví dụ, Java, JavaScript, TypeScript và C# đều dùng mã hóa UTF-16 (để lưu trữ điểm mã Unicode), nên kiểu `char` có độ dài 2 byte.

**Hỏi**: Việc gọi các cấu trúc dữ liệu dựa trên mảng là "cấu trúc dữ liệu tĩnh" có gây mập mờ không? Ngăn xếp vẫn có thể thực hiện các thao tác "động" như đẩy vào (push) và lấy ra (pop).

Ngăn xếp thực sự có thể thực hiện các thao tác dữ liệu động, nhưng cấu trúc dữ liệu vẫn là "tĩnh" (độ dài cố định). Mặc dù các cấu trúc dữ liệu dựa trên mảng có thể thêm hoặc xóa phần tử một cách động, nhưng dung lượng của chúng là cố định. Nếu khối lượng dữ liệu vượt quá kích thước đã cấp phát trước, cần tạo một mảng mới lớn hơn, và nội dung của mảng cũ phải được sao chép sang mảng mới.

**Hỏi**: Khi khởi tạo một ngăn xếp (hàng đợi), kích thước của nó không được chỉ định. Vậy tại sao chúng vẫn là "cấu trúc dữ liệu tĩnh"?

Trong các ngôn ngữ lập trình bậc cao, ta không cần phải chỉ định thủ công dung lượng ban đầu của ngăn xếp (hàng đợi); lớp (class) sẽ tự động xử lý việc này. Ví dụ, dung lượng ban đầu của `ArrayList` trong Java thường là 10. Ngoài ra, thao tác mở rộng cũng được tự động hiện thực. Xem chi tiết ở phần "Danh sách" (List) sau này.

**Hỏi**: Phương pháp chuyển đổi từ mã thuận sang mã bù là "đảo bit rồi cộng 1". Vậy chuyển từ mã bù sang mã thuận lẽ ra phải là phép nghịch đảo "trừ 1 rồi đảo bit". Tuy nhiên, mã bù cũng có thể được chuyển thành mã thuận bằng cách "đảo bit rồi cộng 1". Vì sao lại như vậy?

Đó là vì việc chuyển đổi qua lại giữa mã thuận và mã bù thực chất là quá trình tính "phần bù". Trước tiên, hãy định nghĩa phần bù: giả sử $a + b = c$, thì ta nói $a$ là phần bù của $b$ đối với $c$, và ngược lại, $b$ là phần bù của $a$ đối với $c$.

Cho một số nhị phân $n = 4$ bit là $0010$, nếu ta coi số này là mã thuận (bỏ qua bit dấu), thì mã bù của nó có thể thu được bằng cách "đảo bit rồi cộng 1":

$$
0010 \rightarrow 1101 \rightarrow 1110
$$

Ta thấy rằng tổng của mã thuận và mã bù là $0010 + 1110 = 10000$, nghĩa là mã bù $1110$ là "phần bù" của mã thuận $0010$ đối với $10000$. **Điều này có nghĩa là thao tác "đảo bit rồi cộng 1" nêu trên thực chất là quá trình tính phần bù đối với $10000$**.

Vậy, "phần bù" của mã bù $1110$ đối với $10000$ là gì? Ta vẫn có thể dùng cách "đảo bit rồi cộng 1" để tính:

$$
1110 \rightarrow 0001 \rightarrow 0010
$$

Nói cách khác, mã thuận và mã bù là "phần bù" của nhau đối với $10000$, do đó "chuyển từ mã thuận sang mã bù" và "chuyển từ mã bù sang mã thuận" có thể được thực hiện bằng cùng một phép toán (đảo bit rồi cộng 1).

Dĩ nhiên, ta cũng có thể dùng phép nghịch đảo để tìm mã thuận của mã bù $1110$, tức là "trừ 1 rồi đảo bit":

$$
1110 \rightarrow 1101 \rightarrow 0010
$$

Tóm lại, cả "đảo bit rồi cộng 1" lẫn "trừ 1 rồi đảo bit" đều đang tính phần bù đối với $10000$, và chúng tương đương nhau.

Về bản chất, thao tác "đảo bit" thực chất là tìm phần bù đối với $1111$ (vì "mã thuận + mã ngược = 1111" luôn đúng); và việc cộng thêm 1 vào mã ngược sẽ cho ra mã bù, chính là phần bù đối với $10000$.

Ở trên dùng $n = 4$ làm ví dụ, và có thể tổng quát hóa cho số nhị phân với bất kỳ số bit nào.
