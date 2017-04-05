-----------------------------------------------------------------------------------------------
------------------------------------- [INSERT] ------------------------------------------------
-----------------------------------------------------------------------------------------------

INSERT INTO dbo.tblDM ( tenDM )
VALUES  ( N'Văn học - tiểu thuyết'),  -- tenDM - nvarchar(100)
	( N'Khoa học - tự nhiên'),  -- tenDM - nvarchar(100)
	( N'Kinh tế - xã hội'),  -- tenDM - nvarchar(100)
	( N'Sách thiếu nhi'),  -- tenDM - nvarchar(100)
	( N'Tác phẩm đạt giải')  -- tenDM - nvarchar(100)
-----------------------------------------------------------------------------------------------
EXEC dbo.sp_insert_tg @ten = N'Milie Marotta', -- nvarchar(100)
    @img = N'\img\tg1.jpg', -- nvarchar(100)
    @tgVN = 0, -- bit
    @tgDG = N'', -- nvarchar(100)
    @mota = N'', -- ntext
    @tt = 1 -- bit
--EXEC dbo.sp_insert_tg @ten = N'Susie Morgensiern', -- nvarchar(100)
--    @img = N'\img\tg2.jpg', -- nvarchar(100)
--    @tgVN = 0, -- bit
--    @tgDG = N'', -- nvarchar(100)
--    @mota = N"Susie Morgenstern est née le 18 mars 1945 à Newark dans le New Jersey. Elle fait ses études aux États-Unis, puis en Israël pour terminer en France avec une thèse de doctorat en littérature comparée sur Les fantasmes chez l'écrivain juif contemporain. Elle a commencé sa carrière en tant qu'auteure et illustratrice pour la jeunesse. Elle enseigne maintenant l'anglais à l'université de Nice.", -- ntext
--    @tt = 1 -- bit

-----------------------------------------------------------------------------------------------
EXEC dbo.sp_insert_sach @ten = N'Vương Quốc Muôn Loài', -- nvarchar(100)
    @img = N'/img/sp1.png', -- nvarchar(100)
    @gia = 68000, -- int
    @mota = N'<p><b>THE SUNDAY TIMES BESTSELLER</b></p>
<p>Cuốn sách tô màu được ưa chuộng nhất và bán chạy nhất tại Anh quốc !</p>
<p>Lớn lên nơi miền quê xứ Wales giữa muôn loài động thực vật, từ một xưởng vẽ bên bờ biển, Millie Marotta đã sáng tác vô vàn bức vẽ lấy cảm hứng từ cuộc sống hoang dã diệu kỳ xung quanh mình.</p>
<p>Giờ đây ta có thể biến những bức vẽ tuyệt đẹp ấy thành của riêng và sáng tạo ra một vương quốc muôn loài độc nhất vô nhị. Từ con bọ tha thiết đợi một bộ cánh óng ánh sặc sỡ đến chú cá voi khắc khoải chờ một ngôi nhà đại dương tráng lệ, cả một thế giới động thực vật cho ta thỏa sức khám phá. Hãy dùng bút màu trí tưởng tượng để đánh thức người nghệ sĩ trong bạn nhé!</p>', -- ntext
    @dm = 4, -- int
    @tt = 1 -- bit

EXEC dbo.sp_insert_sach @ten = N'Bà ngoại thời @', -- nvarchar(100)
    @img = N'/img/sp2.jpg', -- nvarchar(100)
    @gia = 54000, -- int
    @mota = N'Không ti vi, không máy tính, không điện thoại di động. Đó là giải pháp của bố mẹ để đối phó với 1 kẻ nghiện đủ các thể lại màn hình như Sam, khi quyết định gửi nó về sống ở nhà bà ngoại tại Nice. Địa ngục là đây chứ còn đâu nữa! Nhưng địa ngục ấy không chỉ dành cho Sam, bởi bà ngoại Martha từ giờ trở đi sẽ phải sống với cuộc sống độc thân yêu thích của mình, lại suốt ngày vất vả nấu nướng, chăm sóc và kèm cặp thằng cháu ngoại 16 tuổi lộc ngộc đang độ ương bướng. Nhưng có ai học được chữ ngờ. Biết đâu chừng cuộc sống chung cưỡng ép ấy lại là cơ hội cho cả hai bà cháu  để thay đổi những thói quen của mình và nhìn thế giới dưới một góc độ khác? Nhất là khi, bà ngoại bỗng chốc biến thành một con người không ai hình dung nổi.', -- ntext
    @dm = 1, -- int
    @tt = 1 -- bit
----------------------------------------------------------------------------------
EXEC dbo.sp_insert_lh @ten = N'Công ty Cổ phần Văn hóa và Truyền thông Cheshire', -- nvarchar(100)
    @mota = N'<p>Địa chỉ: Số 4 Chùa Bộc, Đống Đa, Hà Nội</p>
        <p>Điện thoại: (+84) 123.456.789</p>
        <p>Fax: (84-4) 36789789</p>', -- ntext
    @tinhtrang = 1 -- bit
EXEC dbo.sp_insert_lh @ten = N'Văn phòng đại diện miền Trung', -- nvarchar(100)
    @mota = N'<p>Địa chỉ: Số 4 Bạch Đằng, Đà Nẵng</p>
                        <p>Điện thoại: (+84) 123.456.788</p>
                        <p>Fax: (84-511) 36.789.788</p>', -- ntext
    @tinhtrang = 1 -- bit
EXEC dbo.sp_insert_lh @ten = N'Văn phòng đại diện miền Nam', -- nvarchar(100)
    @mota = N'<p>Địa chỉ: Số 4 Hàm Nghi, Quận 1, Tp. Hồ Chí Minh</p>
                        <p>Điện thoại: (+84) 123.456.787</p>
                        <p>Fax: (84-8) 36789787</p>', -- ntext
    @tinhtrang = 1 -- bit
EXEC dbo.sp_insert_lh @ten = N'Các thông tin chung về Cheshire', -- nvarchar(100)
    @mota = N'<p>cheshire@cheshire.vn</p>', -- ntext
    @tinhtrang = 1 -- bit
EXEC dbo.sp_insert_lh @ten = N'Liên hệ bản quyền và tác quyền', -- nvarchar(100)
    @mota = N'<p>mipham@gmail.com</p>', -- ntext
    @tinhtrang = 1 -- bit
EXEC dbo.sp_insert_lh @ten = N'Liên hệ kinh doanh và xuất bản', -- nvarchar(100)
    @mota = N'<p>storybrooke@gmail.com</p>', -- ntext
    @tinhtrang = 1 -- bit
EXEC dbo.sp_insert_lh @ten = N'Liên hệ về bản thảo', -- nvarchar(100)
    @mota = N'<p>darkone@gmail.com</p>', -- ntext
    @tinhtrang = 1 -- bit
EXEC dbo.sp_insert_lh @ten = N'Liên hệ PR/Marketing', -- nvarchar(100)
    @mota = N'<p>quasimodo@gmailcom</p>', -- ntext
    @tinhtrang = 1 -- bit
EXEC dbo.sp_insert_lh @ten = N'Nhận phản hồi của tác giả', -- nvarchar(100)
    @mota = N'<p>cinlderella@gmail.com</p>', -- ntext
    @tinhtrang = 1 -- bit
