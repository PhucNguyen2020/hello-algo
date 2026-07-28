---
comments: true
icon: material/rocket-launch-outline
---

# Lời mở đầu

Vài năm trước, tôi từng chia sẻ lời giải cho bộ đề "Sword for Offer" trên LeetCode và nhận được sự động viên, ủng hộ từ rất nhiều độc giả. Trong quá trình trao đổi với độc giả, câu hỏi tôi gặp thường xuyên nhất là "làm thế nào để bắt đầu học giải thuật". Dần dần, tôi hình thành một mối quan tâm sâu sắc với câu hỏi này.

Lao thẳng vào giải bài tập dường như là cách tiếp cận phổ biến nhất — đơn giản, trực tiếp và hiệu quả. Tuy nhiên, việc giải bài tập cũng giống như chơi trò dò mìn: những ai có khả năng tự học tốt sẽ lần lượt gỡ được từng quả mìn một cách thành công, còn những ai có nền tảng chưa vững có thể sẽ "trầy da tróc vảy", lùi từng bước trong bất lực. Đọc giáo trình từ đầu đến cuối cũng là một cách làm phổ biến, nhưng với những người đang tìm việc, việc làm luận văn tốt nghiệp, nộp hồ sơ xin việc, cùng với việc ôn thi và chuẩn bị phỏng vấn đã chiếm gần hết thời gian và sức lực của họ, khiến việc "cày" hết một cuốn sách dày trở thành một thử thách gian nan.

Nếu bạn cũng đang gặp phải những khó khăn tương tự, thì thật may mắn khi cuốn sách này đã "tìm đến" bạn. Cuốn sách này là câu trả lời của tôi cho câu hỏi trên — dù có thể chưa phải là giải pháp tối ưu, nhưng ít nhất đây là một nỗ lực tích cực. Cuốn sách này không thể trực tiếp giúp bạn có được một lời mời làm việc, nhưng nó sẽ dẫn dắt bạn khám phá "toàn cảnh" của cấu trúc dữ liệu và giải thuật, giúp bạn hiểu được hình dạng, kích thước và sự phân bố của các loại "mìn" khác nhau, đồng thời giúp bạn nắm vững nhiều "phương pháp gỡ mìn". Với những kỹ năng này, tôi tin rằng bạn có thể giải quyết bài toán và đọc tài liệu kỹ thuật một cách tự tin hơn, từng bước xây dựng nên một hệ thống kiến thức hoàn chỉnh.

Tôi hoàn toàn đồng tình với câu nói của Giáo sư Feynman: "Kiến thức không miễn phí. Bạn phải trả giá bằng sự chú tâm." Theo nghĩa đó, cuốn sách này cũng không hoàn toàn "miễn phí". Để xứng đáng với "sự chú tâm" quý giá mà bạn dành cho cuốn sách này, tôi sẽ cố gắng hết sức và dồn toàn bộ "sự chú tâm" của mình để hoàn thành tác phẩm này.

Tôi ý thức rõ giới hạn về kiến thức và kinh nghiệm của bản thân. Mặc dù nội dung cuốn sách đã được chỉnh sửa, trau chuốt qua một thời gian dài, chắc chắn vẫn còn không ít sai sót, và tôi chân thành mong nhận được những góp ý, chỉnh sửa từ quý thầy cô và các bạn đồng môn.

![Hello Algorithms](../assets/covers/chapter_hello_algo.jpg){ class="cover-image" }

<div style="text-align: center;">
    <h2 style="margin-top: 0.8em; margin-bottom: 0.8em;">Xin chào, Giải thuật!</h2>
</div>

Sự ra đời của máy tính đã mang lại những thay đổi to lớn cho thế giới. Với khả năng tính toán tốc độ cao và tính khả trình vượt trội, máy tính đã trở thành phương tiện lý tưởng để thực thi giải thuật và xử lý dữ liệu. Dù là hình ảnh chân thực trong các trò chơi điện tử, những quyết định thông minh trong xe tự lái, những ván cờ vây xuất sắc của AlphaGo, hay những cuộc trò chuyện tự nhiên của ChatGPT, tất cả những ứng dụng này đều là minh chứng ấn tượng cho sức mạnh của giải thuật khi vận hành trên máy tính.

Thực tế, trước khi máy tính ra đời, giải thuật và cấu trúc dữ liệu đã hiện diện ở khắp mọi ngóc ngách của thế giới. Những giải thuật sơ khai tương đối đơn giản, chẳng hạn như các phương pháp đếm cổ xưa hay quy trình chế tác công cụ. Cùng với sự phát triển của văn minh nhân loại, giải thuật dần trở nên tinh vi và phức tạp hơn. Từ sự khéo léo tài hoa của các nghệ nhân bậc thầy, đến những sản phẩm công nghiệp giải phóng sức sản xuất, cho tới các quy luật khoa học chi phối sự vận hành của vũ trụ, đằng sau hầu hết mọi điều bình dị hay kỳ diệu đều ẩn chứa một tư duy giải thuật tinh tế.

Tương tự, cấu trúc dữ liệu cũng hiện diện ở khắp nơi: từ các mạng xã hội quy mô lớn cho đến hệ thống tàu điện ngầm nhỏ bé, rất nhiều hệ thống có thể được mô hình hóa dưới dạng "đồ thị"; từ một quốc gia cho đến một gia đình, các hình thức tổ chức xã hội chủ yếu đều mang đặc trưng của "cây"; quần áo mùa đông giống như một "ngăn xếp", món đồ mặc vào đầu tiên lại là món cởi ra sau cùng; ống đựng cầu lông giống như một "hàng đợi", các quả cầu được đưa vào từ một đầu và lấy ra từ đầu kia; một cuốn từ điển giống như một "bảng băm", cho phép tra cứu nhanh chóng mục từ cần tìm.

Cuốn sách này hướng đến việc giúp độc giả hiểu được những khái niệm cốt lõi của giải thuật và cấu trúc dữ liệu thông qua các hình minh họa động rõ ràng, dễ tiếp cận cùng những ví dụ mã nguồn có thể chạy được, và hiện thực hóa chúng bằng mã nguồn. Trên nền tảng đó, cuốn sách còn nỗ lực làm rõ những biểu hiện sinh động của giải thuật trong thế giới phức tạp và tôn vinh vẻ đẹp của giải thuật. Tôi hy vọng cuốn sách này sẽ giúp ích được cho bạn!
