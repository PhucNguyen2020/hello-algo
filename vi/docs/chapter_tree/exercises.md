# Bài tập

## Ôn tập khái niệm

### Cây nhị phân hoàn chỉnh, đầy đủ và hoàn hảo

Hai mảng dưới đây biểu diễn các cây nhị phân theo thứ tự duyệt theo tầng, trong đó `None` đánh dấu vị trí trống:

- Cây A: `[1, 2, 3, 4, 5, 6]`
- Cây B: `[1, 2, 3, None, None, 6, 7]`

<!-- numbered-subquestions -->

1. Cây nào là cây nhị phân hoàn chỉnh?
2. Cây nào là cây nhị phân đầy đủ, tức là mọi nút không phải lá đều có hai con?
3. Có cây nào trong hai cây trên là cây nhị phân hoàn hảo không? Giải thích lý do cho từng cây.

??? success "Đáp án"

    1. Cây A là cây nhị phân hoàn chỉnh. Chỉ có tầng thấp nhất của nó chưa đầy, và các nút ở tầng đó chiếm các vị trí liên tiếp từ trái sang phải.
        Cây B không hoàn chỉnh vì có các vị trí trống ở bên trái của tầng thấp nhất trong khi các nút vẫn xuất hiện ở bên phải.

    2. Cây B là cây nhị phân đầy đủ: các nút 1 và 3 đều có hai con, và tất cả các nút còn lại đều là lá.
        Cây A không đầy đủ vì nút 3 chỉ có một con, là con trái 6.

    3. Không cây nào là cây nhị phân hoàn hảo vì tầng thấp nhất của mỗi cây chưa được lấp đầy hoàn toàn.

### Ba thứ tự duyệt cho cùng một cây

Lưu mảng `[1, 2, 3, 4, 5, 6, 7]` theo thứ tự duyệt theo tầng vào một cây nhị phân hoàn chỉnh.

<!-- numbered-subquestions -->

1. Vẽ cây.
2. Viết dãy duyệt trước, duyệt giữa và duyệt sau của cây.
3. Trong dãy duyệt giữa, những phần nào của cây tương ứng với các dãy con ở bên trái và bên phải nút gốc 1?

??? success "Đáp án"

    1. Cây là:

        ```text
              1
            /   \
           2     3
          / \   / \
         4   5 6   7
        ```

    2. Dãy duyệt trước là `1, 2, 4, 5, 3, 6, 7`;
        dãy duyệt giữa là `4, 2, 5, 1, 6, 3, 7`;
        dãy duyệt sau là `4, 5, 2, 6, 7, 3, 1`.

    3. Dãy `4, 2, 5` ở bên trái nút gốc 1 là dãy duyệt giữa của cây con trái;
        dãy `6, 3, 7` ở bên phải nó là dãy duyệt giữa của cây con phải.

### So sánh hai cây tìm kiếm nhị phân

Chèn từng dãy dưới đây từ trái sang phải vào một cây tìm kiếm nhị phân rỗng:

- Dãy A: `[4, 2, 6, 1, 3, 5, 7]`
- Dãy B: `[1, 2, 3, 4, 5, 6, 7]`

<!-- numbered-subquestions -->

1. Với mỗi cây, viết ra các nút được thăm khi tìm kiếm số 7.
2. Nếu chiều cao được đo bằng số lượng cạnh từ nút gốc đến nút lá xa nhất, chiều cao của mỗi cây là bao nhiêu?
3. Dựa trên hai câu hỏi trên, việc tìm kiếm số 7 có hiệu quả như nhau ở hai cây không? Giải thích bằng hình dạng của cây và đường đi tìm kiếm.

??? success "Đáp án"

    1. Trong cây được xây dựng từ Dãy A, đường đi tìm kiếm là `4 → 6 → 7`.
        Trong cây được xây dựng từ Dãy B, đường đi tìm kiếm là `1 → 2 → 3 → 4 → 5 → 6 → 7`.

    2. Mọi tầng của cây thứ nhất đều đầy, và chiều cao của nó là 2. Cây thứ hai chỉ có các con phải, và chiều cao của nó là 6.

    3. Việc tìm kiếm số 7 không hiệu quả như nhau ở hai cây. Thứ tự chèn làm thay đổi hình dạng và chiều cao của cây tìm kiếm nhị phân. Việc tìm kiếm chỉ thăm 3 nút trong cây thứ nhất
        nhưng thăm cả 7 nút trong cây thứ hai. Cây càng cao, càng có nhiều nút có thể cần so sánh trên một đường đi trong trường hợp xấu nhất.

## Bài tập lập trình

### Độ sâu tối đa của cây nhị phân

Bạn được cho nút gốc `root` của một cây nhị phân. Mỗi nút chứa một giá trị nguyên và các tham chiếu đến con trái và con phải của nó.

Độ sâu tối đa là **số lượng nút** trên đường đi từ nút gốc đến nút lá xa nhất. Trả về độ sâu tối đa của cây; độ sâu tối đa của cây rỗng là 0.
Sử dụng đệ quy.

??? tip "Gợi ý"

    1. Độ sâu được đo bằng số lượng nút trong bài tập này, nên một cây chỉ chứa nút gốc có độ sâu tối đa là 1
    2. Cho hàm đệ quy trả về độ sâu tối đa của cây con có gốc là nút hiện tại
    3. Trả về 0 cho nút rỗng; đối với nút không rỗng, trả về max(depth(trái), depth(phải)) + 1

[LeetCode](https://leetcode.com/problems/maximum-depth-of-binary-tree/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### Duyệt cây nhị phân theo từng tầng

Cho nút gốc `root` của một cây nhị phân, sử dụng hàng đợi để thăm tất cả các nút theo từng tầng từ trên xuống dưới và từ trái sang phải trong mỗi tầng.

Trả về một mảng hai chiều: mảng con đầu tiên lưu các giá trị ở tầng của nút gốc, mảng con thứ hai lưu các giá trị ở tầng tiếp theo, và cứ thế tiếp tục.
Nếu cây rỗng, trả về một mảng rỗng.

??? tip "Gợi ý"

    1. Duyệt theo tầng thăm các nút được đưa vào hàng đợi trước, nên sử dụng hàng đợi
    2. Vào đầu mỗi vòng, tất cả các nút hiện có trong hàng đợi đều thuộc cùng một tầng
    3. Trước tiên ghi lại độ dài của hàng đợi, sau đó loại bỏ đúng số lượng đó nút và đưa các con của chúng vào hàng đợi

[LeetCode](https://leetcode.com/problems/binary-tree-level-order-traversal/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }

### Phần tử nhỏ thứ k trong cây tìm kiếm nhị phân

Một cây tìm kiếm nhị phân chứa `n` nút với các giá trị khác nhau.
Nếu tất cả các giá trị nút được sắp xếp từ nhỏ đến lớn, vị trí của chúng được đánh số bắt đầu từ 1.

Cho nút gốc `root` và một số nguyên `k` thỏa mãn `1 <= k <= n`, trả về giá trị ở vị trí `k`.
Tìm đáp án trực tiếp trong quá trình duyệt giữa thay vì thu thập tất cả giá trị nút trước.

??? tip "Gợi ý"

    1. Duyệt giữa của cây tìm kiếm nhị phân thăm các giá trị nút từ nhỏ đến lớn
    2. Duyệt giữa xử lý cây con trái, nút hiện tại, rồi cây con phải; tăng bộ đếm khi thăm nút hiện tại
    3. Khi bộ đếm lần đầu bằng k, giá trị của nút hiện tại chính là đáp án, nên không cần duyệt thêm nữa

[LeetCode](https://leetcode.com/problems/kth-smallest-element-in-a-bst/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
