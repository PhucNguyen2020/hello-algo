# Giải thuật băm

Hai phần trước đã giới thiệu nguyên lý hoạt động của bảng băm và các phương pháp xử lý xung đột băm. Tuy nhiên, cả dò địa chỉ mở lẫn nối dây chuyền **chỉ có thể đảm bảo bảng băm hoạt động bình thường khi xảy ra xung đột băm, chứ không thể làm giảm tần suất xảy ra xung đột băm**.

Nếu xung đột băm xảy ra quá thường xuyên, hiệu năng của bảng băm sẽ suy giảm nghiêm trọng. Như minh họa trong hình dưới đây, đối với bảng băm nối dây chuyền, trong trường hợp lý tưởng, các cặp khóa-giá trị được phân bố đều trên các bucket, đạt hiệu quả tra cứu tối ưu; còn trong trường hợp xấu nhất, toàn bộ cặp khóa-giá trị đều được lưu trong cùng một bucket, khiến độ phức tạp thời gian suy giảm xuống $O(n)$.

![Trường hợp lý tưởng và xấu nhất của xung đột băm](hash_algorithm.assets/hash_collision_best_worst_condition.png)

**Sự phân bố của các cặp khóa-giá trị được quyết định bởi hàm băm**. Hãy nhớ lại các bước của hàm băm: trước tiên tính giá trị băm, sau đó lấy modulo với độ dài mảng:

```shell
index = hash(key) % capacity
```

Quan sát công thức trên, khi dung lượng bảng băm `capacity` đã cố định, **giải thuật băm `hash()` quyết định giá trị đầu ra**, từ đó quyết định sự phân bố của các cặp khóa-giá trị trong bảng băm.

Điều này có nghĩa là, để giảm xác suất xảy ra xung đột băm, ta nên tập trung vào việc thiết kế giải thuật băm `hash()`.

## Mục tiêu của giải thuật băm

Để xây dựng một bảng băm vừa nhanh vừa ổn định, một giải thuật băm cần có các tính chất sau:

- **Tính xác định**: Với cùng một đầu vào, giải thuật băm phải luôn cho ra cùng một đầu ra. Chỉ khi đó bảng băm mới đáng tin cậy.
- **Hiệu suất cao**: Quá trình tính giá trị băm cần phải đủ nhanh. Chi phí tính toán càng nhỏ thì bảng băm càng thực tế.
- **Phân bố đều**: Giải thuật băm cần đảm bảo các cặp khóa-giá trị được phân bố đều trong bảng băm. Sự phân bố càng đồng đều thì xác suất xảy ra xung đột băm càng thấp.

Trên thực tế, giải thuật băm không chỉ được dùng để cài đặt bảng băm mà còn được ứng dụng rộng rãi trong nhiều lĩnh vực khác.

- **Lưu trữ mật khẩu**: Để bảo vệ tính an toàn của mật khẩu người dùng, hệ thống thường không lưu mật khẩu dạng văn bản gốc mà lưu giá trị băm của mật khẩu đó. Khi người dùng nhập mật khẩu, hệ thống tính giá trị băm của đầu vào rồi so sánh với giá trị băm đã lưu. Nếu trùng khớp, mật khẩu được coi là chính xác.
- **Kiểm tra tính toàn vẹn dữ liệu**: Bên gửi dữ liệu có thể tính giá trị băm của dữ liệu và gửi kèm theo; bên nhận có thể tính lại giá trị băm của dữ liệu nhận được rồi so sánh với giá trị băm đã nhận. Nếu trùng khớp, dữ liệu được coi là toàn vẹn.

Đối với các ứng dụng mật mã học, giải thuật băm cần có các tính chất bảo mật mạnh hơn để ngăn chặn việc suy ngược lại thông tin, chẳng hạn như suy ra mật khẩu gốc từ giá trị băm.

- **Tính một chiều**: Không thể suy ra bất kỳ thông tin nào về dữ liệu đầu vào từ giá trị băm.
- **Khả năng chống xung đột**: Cực kỳ khó để tìm ra hai đầu vào khác nhau cho cùng một giá trị băm.
- **Hiệu ứng lan truyền (avalanche effect)**: Những thay đổi nhỏ ở đầu vào phải dẫn đến những thay đổi lớn và không thể dự đoán được ở đầu ra.

Lưu ý rằng **"phân bố đều" và "khả năng chống xung đột" là hai khái niệm độc lập với nhau**. Thỏa mãn tính phân bố đều không có nghĩa là chống được xung đột. Ví dụ, với đầu vào `key` ngẫu nhiên, hàm băm `key % 100` có thể cho ra kết quả phân bố đều. Tuy nhiên, giải thuật băm này quá đơn giản, mọi `key` có cùng hai chữ số cuối sẽ cho cùng một kết quả, khiến việc suy ra một `key` khả dụng từ giá trị băm trở nên dễ dàng, từ đó có thể phá được mật khẩu.

## Thiết kế giải thuật băm

Việc thiết kế giải thuật băm là một vấn đề phức tạp, đòi hỏi phải cân nhắc nhiều yếu tố. Tuy nhiên, với một số tình huống ít khắt khe hơn, ta cũng có thể thiết kế một vài giải thuật băm đơn giản.

- **Băm cộng (additive hash)**: Cộng dồn mã ASCII của từng ký tự trong đầu vào và lấy tổng làm giá trị băm.
- **Băm nhân (multiplicative hash)**: Tận dụng tính tương quan thấp mà phép nhân mang lại: nhân với một hằng số ở mỗi bước và cộng dồn mã ASCII của các ký tự vào giá trị băm.
- **Băm XOR (XOR hash)**: Cộng dồn giá trị băm bằng cách XOR từng phần tử của dữ liệu đầu vào.
- **Băm xoay (rotating hash)**: Cộng dồn mã ASCII của từng ký tự vào giá trị băm, thực hiện phép xoay trên giá trị băm trước mỗi lần cộng dồn.

```src
[file]{simple_hash}-[class]{}-[func]{rot_hash}
```

Ta có thể nhận thấy bước cuối cùng của mỗi giải thuật băm là lấy kết quả modulo với số nguyên tố lớn $1000000007$, nhằm đảm bảo giá trị băm nằm trong phạm vi phù hợp. Điều này tự nhiên đặt ra một câu hỏi: tại sao lại nhấn mạnh việc dùng một số nguyên tố làm modulo, và việc dùng một hợp số làm modulo có nhược điểm gì?

Nói ngắn gọn: **dùng một số nguyên tố lớn làm modulo giúp tối đa hóa tính đồng đều của giá trị băm**. Vì số nguyên tố không có ước số chung với các số khác, nó có thể giảm bớt các quy luật tuần hoàn phát sinh từ phép modulo, nhờ đó giảm xung đột băm.

Ví dụ, giả sử ta chọn hợp số $9$ làm modulo, số này chia hết cho $3$, khi đó mọi `key` chia hết cho $3$ sẽ được ánh xạ về các giá trị băm $0$, $3$, $6$.

$$
\begin{aligned}
\text{modulus} & = 9 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 0, 3, 6, 0, 3, 6, 0, 3, 6,\dots \}
\end{aligned}
$$

Nếu các giá trị `key` đầu vào tình cờ tuân theo một cấp số cộng như vậy, các giá trị băm sẽ bị dồn cụm, làm xung đột băm tệ hơn. Bây giờ giả sử ta thay `modulus` bằng số nguyên tố $13$. Vì `key` và `modulus` không có ước số chung, các giá trị băm đầu ra trở nên đồng đều hơn nhiều.

$$
\begin{aligned}
\text{modulus} & = 13 \newline
\text{key} & = \{ 0, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, \dots \} \newline
\text{hash} & = \{ 0, 3, 6, 9, 12, 2, 5, 8, 11, 1, 4, 7, \dots \}
\end{aligned}
$$

Đáng chú ý là nếu `key` được đảm bảo phân bố ngẫu nhiên và đồng đều, thì việc chọn số nguyên tố hay hợp số làm modulo đều có thể tạo ra giá trị băm phân bố đều. Tuy nhiên, khi sự phân bố của `key` mang tính tuần hoàn nào đó, việc lấy modulo với hợp số dễ dẫn đến hiện tượng dồn cụm hơn.

Tóm lại, ta thường chọn một số nguyên tố làm modulo, và số nguyên tố này cần đủ lớn để loại bỏ tối đa các quy luật tuần hoàn, tăng cường tính ổn định của giải thuật băm.

## Các giải thuật băm phổ biến

Dễ thấy rằng các giải thuật băm đơn giản được giới thiệu ở trên khá "mong manh" và còn kém xa so với mục tiêu thiết kế của giải thuật băm. Ví dụ, vì phép cộng và phép XOR có tính giao hoán, băm cộng và băm XOR không thể phân biệt các chuỗi có cùng tập ký tự nhưng khác thứ tự, điều này có thể làm trầm trọng thêm xung đột băm và gây ra rủi ro bảo mật.

Trong thực tế, ta thường dùng một số giải thuật băm tiêu chuẩn, như MD5, SHA-1, SHA-2 và SHA-3. Chúng có thể ánh xạ dữ liệu đầu vào có độ dài bất kỳ thành một giá trị băm có độ dài cố định.

Trong suốt thế kỷ qua, các giải thuật băm đã trải qua quá trình liên tục được nâng cấp và tối ưu hóa. Một số nhà nghiên cứu nỗ lực cải thiện hiệu năng của giải thuật băm, trong khi những người khác, bao gồm cả hacker, lại chuyên tâm tìm kiếm các lỗ hổng bảo mật trong giải thuật băm. Bảng dưới đây trình bày các giải thuật băm thường được dùng trong thực tế.

- MD5 và SHA-1 đã nhiều lần bị tấn công thành công nên đã bị loại bỏ trong nhiều ứng dụng bảo mật.
- Dòng SHA-2, đặc biệt là SHA-256, là một trong những giải thuật băm an toàn nhất hiện nay, chưa ghi nhận cuộc tấn công thành công nào, do đó được dùng phổ biến trong nhiều ứng dụng và giao thức bảo mật.
- SHA-3 có chi phí cài đặt thấp hơn và hiệu suất tính toán cao hơn so với SHA-2, nhưng hiện mức độ sử dụng vẫn chưa rộng rãi bằng dòng SHA-2.

<p align="center"> Bảng <id> &nbsp; Các giải thuật băm phổ biến </p>

|                    | MD5                                                    | SHA-1                            | SHA-2                                                         | SHA-3                          |
| ------------------ | ------------------------------------------------------- | --------------------------------- | -------------------------------------------------------------- | -------------------------------- |
| Năm phát hành       | 1992                                                     | 1995                               | 2002                                                             | 2008                              |
| Độ dài đầu ra       | 128 bit                                                  | 160 bit                            | 256/512 bit                                                      | 224/256/384/512 bit               |
| Xung đột băm        | Thường xuyên                                             | Thường xuyên                       | Hiếm                                                             | Hiếm                              |
| Mức độ an toàn      | Thấp, đã từng bị tấn công thành công                      | Thấp, đã từng bị tấn công thành công | Cao                                                              | Cao                               |
| Ứng dụng            | Đã bị loại bỏ, vẫn dùng để kiểm tra tính toàn vẹn dữ liệu | Đã bị loại bỏ                     | Xác thực giao dịch tiền mã hóa, chữ ký số, v.v.                   | Có thể dùng thay thế cho SHA-2   |

## Giá trị băm trong cấu trúc dữ liệu

Chúng ta biết rằng khóa của bảng băm có thể là số nguyên, số thực, chuỗi và các kiểu dữ liệu khác. Các ngôn ngữ lập trình thường cung cấp sẵn giải thuật băm cho các kiểu dữ liệu này để tính chỉ số bucket trong bảng băm. Lấy Python làm ví dụ, ta có thể gọi hàm `hash()` để tính giá trị băm cho nhiều kiểu dữ liệu khác nhau.

- Giá trị băm của số nguyên và giá trị boolean chính là giá trị của chúng.
- Việc tính giá trị băm cho số thực và chuỗi phức tạp hơn, bạn đọc quan tâm có thể tự tìm hiểu thêm.
- Giá trị băm của một tuple được tính bằng cách băm từng phần tử của nó rồi kết hợp các kết quả đó thành một giá trị băm duy nhất.
- Giá trị băm của một đối tượng thường được sinh ra từ địa chỉ bộ nhớ của nó. Bằng cách ghi đè phương thức băm của đối tượng, ta có thể khiến nó được sinh ra từ nội dung của đối tượng thay vì địa chỉ bộ nhớ.

!!! tip

    Lưu ý rằng định nghĩa và cách tính giá trị băm dựng sẵn ở các ngôn ngữ lập trình khác nhau là khác nhau.

=== "Python"

    ```python title="built_in_hash.py"
    num = 3
    hash_num = hash(num)
    # Giá trị băm của số nguyên 3 là 3

    bol = True
    hash_bol = hash(bol)
    # Giá trị băm của boolean True là 1

    dec = 3.14159
    hash_dec = hash(dec)
    # Giá trị băm của số thực 3.14159 là 326484311674566659

    str = "Hello 算法"
    hash_str = hash(str)
    # Giá trị băm của chuỗi "Hello 算法" là 4617003410720528961

    tup = (12836, "小哈")
    hash_tup = hash(tup)
    # Giá trị băm của tuple (12836, '小哈') là 1029005403108185979

    obj = ListNode(0)
    hash_obj = hash(obj)
    # Giá trị băm của đối tượng ListNode tại 0x1058fd810 là 274267521
    ```

=== "C++"

    ```cpp title="built_in_hash.cpp"
    int num = 3;
    size_t hashNum = hash<int>()(num);
    // Giá trị băm của số nguyên 3 là 3

    bool bol = true;
    size_t hashBol = hash<bool>()(bol);
    // Giá trị băm của boolean 1 là 1

    double dec = 3.14159;
    size_t hashDec = hash<double>()(dec);
    // Giá trị băm của số thực 3.14159 là 4614256650576692846

    string str = "Hello 算法";
    size_t hashStr = hash<string>()(str);
    // Giá trị băm của chuỗi "Hello 算法" là 15466937326284535026

    // Trong C++, std::hash() dựng sẵn chỉ cung cấp giá trị băm cho các kiểu dữ liệu cơ bản
    // Giá trị băm cho mảng và đối tượng cần được cài đặt riêng
    ```

=== "Java"

    ```java title="built_in_hash.java"
    int num = 3;
    int hashNum = Integer.hashCode(num);
    // Giá trị băm của số nguyên 3 là 3

    boolean bol = true;
    int hashBol = Boolean.hashCode(bol);
    // Giá trị băm của boolean true là 1231

    double dec = 3.14159;
    int hashDec = Double.hashCode(dec);
    // Giá trị băm của số thực 3.14159 là -1340954729

    String str = "Hello 算法";
    int hashStr = str.hashCode();
    // Giá trị băm của chuỗi "Hello 算法" là -727081396

    Object[] arr = { 12836, "小哈" };
    int hashTup = Arrays.hashCode(arr);
    // Giá trị băm của mảng [12836, 小哈] là 1151158

    ListNode obj = new ListNode(0);
    int hashObj = obj.hashCode();
    // Giá trị băm của đối tượng ListNode utils.ListNode@7dc5e7b4 là 2110121908
    ```

=== "C#"

    ```csharp title="built_in_hash.cs"
    int num = 3;
    int hashNum = num.GetHashCode();
    // Giá trị băm của số nguyên 3 là 3;

    bool bol = true;
    int hashBol = bol.GetHashCode();
    // Giá trị băm của boolean true là 1;

    double dec = 3.14159;
    int hashDec = dec.GetHashCode();
    // Giá trị băm của số thực 3.14159 là -1340954729;

    string str = "Hello 算法";
    int hashStr = str.GetHashCode();
    // Giá trị băm của chuỗi "Hello 算法" là -586107568;

    object[] arr = [12836, "小哈"];
    int hashTup = arr.GetHashCode();
    // Giá trị băm của mảng [12836, 小哈] là 42931033;

    ListNode obj = new(0);
    int hashObj = obj.GetHashCode();
    // Giá trị băm của đối tượng ListNode 0 là 39053774;
    ```

=== "Go"

    ```go title="built_in_hash.go"
    // Go không cung cấp sẵn hàm tính mã băm
    ```

=== "Swift"

    ```swift title="built_in_hash.swift"
    let num = 3
    let hashNum = num.hashValue
    // Giá trị băm của số nguyên 3 là 9047044699613009734

    let bol = true
    let hashBol = bol.hashValue
    // Giá trị băm của boolean true là -4431640247352757451

    let dec = 3.14159
    let hashDec = dec.hashValue
    // Giá trị băm của số thực 3.14159 là -2465384235396674631

    let str = "Hello 算法"
    let hashStr = str.hashValue
    // Giá trị băm của chuỗi "Hello 算法" là -7850626797806988787

    let arr = [AnyHashable(12836), AnyHashable("小哈")]
    let hashTup = arr.hashValue
    // Giá trị băm của mảng [AnyHashable(12836), AnyHashable("小哈")] là -2308633508154532996

    let obj = ListNode(x: 0)
    let hashObj = obj.hashValue
    // Giá trị băm của đối tượng ListNode utils.ListNode là -2434780518035996159
    ```

=== "JS"

    ```javascript title="built_in_hash.js"
    // JavaScript không cung cấp sẵn hàm tính mã băm
    ```

=== "TS"

    ```typescript title="built_in_hash.ts"
    // TypeScript không cung cấp sẵn hàm tính mã băm
    ```

=== "Dart"

    ```dart title="built_in_hash.dart"
    int num = 3;
    int hashNum = num.hashCode;
    // Giá trị băm của số nguyên 3 là 34803

    bool bol = true;
    int hashBol = bol.hashCode;
    // Giá trị băm của boolean true là 1231

    double dec = 3.14159;
    int hashDec = dec.hashCode;
    // Giá trị băm của số thực 3.14159 là 2570631074981783

    String str = "Hello 算法";
    int hashStr = str.hashCode;
    // Giá trị băm của chuỗi "Hello 算法" là 468167534

    List arr = [12836, "小哈"];
    int hashArr = arr.hashCode;
    // Giá trị băm của mảng [12836, 小哈] là 976512528

    ListNode obj = new ListNode(0);
    int hashObj = obj.hashCode;
    // Giá trị băm của đối tượng ListNode Instance of 'ListNode' là 1033450432
    ```

=== "Rust"

    ```rust title="built_in_hash.rs"
    use std::collections::hash_map::DefaultHasher;
    use std::hash::{Hash, Hasher};

    let num = 3;
    let mut num_hasher = DefaultHasher::new();
    num.hash(&mut num_hasher);
    let hash_num = num_hasher.finish();
    // Giá trị băm của số nguyên 3 là 568126464209439262

    let bol = true;
    let mut bol_hasher = DefaultHasher::new();
    bol.hash(&mut bol_hasher);
    let hash_bol = bol_hasher.finish();
    // Giá trị băm của boolean true là 4952851536318644461

    let dec: f32 = 3.14159;
    let mut dec_hasher = DefaultHasher::new();
    dec.to_bits().hash(&mut dec_hasher);
    let hash_dec = dec_hasher.finish();
    // Giá trị băm của số thực 3.14159 là 2566941990314602357

    let str = "Hello 算法";
    let mut str_hasher = DefaultHasher::new();
    str.hash(&mut str_hasher);
    let hash_str = str_hasher.finish();
    // Giá trị băm của chuỗi "Hello 算法" là 16092673739211250988

    let arr = (&12836, &"小哈");
    let mut tup_hasher = DefaultHasher::new();
    arr.hash(&mut tup_hasher);
    let hash_tup = tup_hasher.finish();
    // Giá trị băm của tuple (12836, "小哈") là 1885128010422702749

    let node = ListNode::new(42);
    let mut hasher = DefaultHasher::new();
    node.borrow().val.hash(&mut hasher);
    let hash = hasher.finish();
    // Giá trị băm của đối tượng ListNode RefCell { value: ListNode { val: 42, next: None } } là 15387811073369036852
    ```

=== "C"

    ```c title="built_in_hash.c"
    // C không cung cấp sẵn hàm tính mã băm
    ```

=== "Kotlin"

    ```kotlin title="built_in_hash.kt"
    val num = 3
    val hashNum = num.hashCode()
    // Giá trị băm của số nguyên 3 là 3

    val bol = true
    val hashBol = bol.hashCode()
    // Giá trị băm của boolean true là 1231

    val dec = 3.14159
    val hashDec = dec.hashCode()
    // Giá trị băm của số thực 3.14159 là -1340954729

    val str = "Hello 算法"
    val hashStr = str.hashCode()
    // Giá trị băm của chuỗi "Hello 算法" là -727081396

    val arr = arrayOf<Any>(12836, "小哈")
    val hashTup = arr.hashCode()
    // Giá trị băm của mảng [12836, 小哈] là 189568618

    val obj = ListNode(0)
    val hashObj = obj.hashCode()
    // Giá trị băm của đối tượng ListNode utils.ListNode@1d81eb93 là 495053715
    ```

=== "Ruby"

    ```ruby title="built_in_hash.rb"
    num = 3
    hash_num = num.hash
    # Giá trị băm của số nguyên 3 là -4385856518450339636

    bol = true
    hash_bol = bol.hash
    # Giá trị băm của boolean true là -1617938112149317027

    dec = 3.14159
    hash_dec = dec.hash
    # Giá trị băm của số thực 3.14159 là -1479186995943067893

    str = "Hello 算法"
    hash_str = str.hash
    # Giá trị băm của chuỗi "Hello 算法" là -4075943250025831763

    tup = [12836, '小哈']
    hash_tup = tup.hash
    # Giá trị băm của tuple (12836, '小哈') là 1999544809202288822

    obj = ListNode.new(0)
    hash_obj = obj.hash
    # Giá trị băm của đối tượng ListNode #<ListNode:0x000078133140ab70> là 4302940560806366381
    ```

??? pythontutor "Chạy trực quan"

    https://pythontutor.com/render.html#code=class%20ListNode%3A%0A%20%20%20%20%22%22%22%E9%93%BE%E8%A1%A8%E8%8A%82%E7%82%B9%E7%B1%BB%22%22%22%0A%20%20%20%20def%20__init__%28self,%20val%3A%20int%29%3A%0A%20%20%20%20%20%20%20%20self.val%3A%20int%20%3D%20val%20%20%23%20%E8%8A%82%E7%82%B9%E5%80%BC%0A%20%20%20%20%20%20%20%20self.next%3A%20ListNode%20%7C%20None%20%3D%20None%20%20%23%20%E5%90%8E%E7%BB%A7%E8%8A%82%E7%82%B9%E5%BC%95%E7%94%A8%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20num%20%3D%203%0A%20%20%20%20hash_num%20%3D%20hash%28num%29%0A%20%20%20%20%23%20%E6%95%B4%E6%95%B0%203%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%203%0A%0A%20%20%20%20bol%20%3D%20True%0A%20%20%20%20hash_bol%20%3D%20hash%28bol%29%0A%20%20%20%20%23%20%E5%B8%83%E5%B0%94%E9%87%8F%20True%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%201%0A%0A%20%20%20%20dec%20%3D%203.14159%0A%20%20%20%20hash_dec%20%3D%20hash%28dec%29%0A%20%20%20%20%23%20%E5%B0%8F%E6%95%B0%203.14159%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20326484311674566659%0A%0A%20%20%20%20str%20%3D%20%22Hello%20%E7%AE%97%E6%B3%95%22%0A%20%20%20%20hash_str%20%3D%20hash%28str%29%0A%20%20%20%20%23%20%E5%AD%97%E7%AC%A6%E4%B8%B2%E2%80%9CHello%20%E7%AE%97%E6%B3%95%E2%80%9D%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%204617003410720528961%0A%0A%20%20%20%20tup%20%3D%20%2812836,%20%22%E5%B0%8F%E5%93%88%22%29%0A%20%20%20%20hash_tup%20%3D%20hash%28tup%29%0A%20%20%20%20%23%20%E5%85%83%E7%BB%84%20%2812836,%20'%E5%B0%8F%E5%93%88'%29%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%201029005403108185979%0A%0A%20%20%20%20obj%20%3D%20ListNode%280%29%0A%20%20%20%20hash_obj%20%3D%20hash%28obj%29%0A%20%20%20%20%23%20%E8%8A%82%E7%82%B9%E5%AF%B9%E8%B1%A1%20%3CListNode%20object%20at%200x1058fd810%3E%20%E7%9A%84%E5%93%88%E5%B8%8C%E5%80%BC%E4%B8%BA%20274267521&cumulative=false&curInstr=19&heapPrimitives=nevernest&mode=display&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false

Trong nhiều ngôn ngữ lập trình, **chỉ những đối tượng bất biến mới có thể làm `key` trong bảng băm**. Nếu ta dùng một danh sách (mảng động) làm `key`, khi nội dung của danh sách thay đổi, giá trị băm của nó cũng thay đổi theo, và ta sẽ không còn tìm được `value` gốc trong bảng băm nữa.

Mặc dù các biến thành viên của một đối tượng tự định nghĩa (chẳng hạn như nút của danh sách liên kết) là có thể thay đổi được, nó vẫn có thể băm được. **Đó là vì giá trị băm của một đối tượng thường được sinh ra dựa trên địa chỉ bộ nhớ của nó**, và ngay cả khi nội dung của đối tượng thay đổi, địa chỉ bộ nhớ vẫn không đổi, nên giá trị băm vẫn giữ nguyên.

Bạn có thể đã nhận thấy rằng giá trị băm hiển thị ở các console khác nhau lại khác nhau. **Đó là vì trình thông dịch Python thêm một "muối" (salt) ngẫu nhiên vào hàm băm chuỗi mỗi khi khởi động**. Cách làm này giúp ngăn chặn hiệu quả các cuộc tấn công HashDoS và tăng cường tính bảo mật của giải thuật băm.
