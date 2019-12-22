USE HowKteam
GO

--- Khi ta có nhu cầu duyệt qua từng reocrd của bảng. Với mỗi record có kết quả xử lý riêng thì dùng cursor

--- Declare <Tên con trỏ> cursor for <câu select>
-- open <Tên con trỏ>

-- FETCH NEXT FROM <tên con trỏ> INTO <Danh sách các biến tương ứng kết quả truy vấn>

-- While @@FETCH_TATUS = 0
-- BEGIN
-- Câu lệnh thực hiện
-- FETCH NEXT lại lần nữa
-- FETCH NEXT FORM <tên con trỏ> INTO <Danh sách các biến tương ứng kết quả truy vấn>
-- END

-- CLOSE <tên con trỏ>
-- DEALLOCATE <ten con trỏ>

--------------------------------------------------------------------
-- VD Từ tuổi của giáo viên 
-- Nếu lương lớn hơn 40 thì cho lương 2500
-- nếu lương nhỏ hơn 30 thì cho lương 2000
-- ngược lại thì cho là 1000

SELECT * FROM dbo.GIAOVIEN

-- khai báo con trỏ
DECLARE GiaoVienCurser  CURSOR FOR 
SELECT MAGV, YEAR(GETDATE()) - YEAR(NGSINH) FROM dbo.GIAOVIEN
-- mở con trỏ
OPEN GiaoVienCurser

-- khai báo biến để lưu dữ liệu con trỏ
DECLARE @MaGV CHAR(10)
DECLARE @Tuoi INT

-- into data từ con trỏ vừa khai báo ở trên
FETCH NEXT FROM GiaoVienCurser INTO  @MaGV, @Tuoi
-- lặp qua từng phần tử và gán giá trị cho nó
WHILE @@FETCH_STATUS = 0
	BEGIN
		-- Điều kiên mà đề bài cho
		IF @Tuoi > 40
			BEGIN
				UPDATE dbo.GIAOVIEN SET LUONG = 2500 WHERE MAGV = MAGV
			END
        ELSE 
		IF @Tuoi > 30
			BEGIN
				UPDATE dbo.GIAOVIEN SET LUONG = 2000 WHERE MAGV = MAGV
			END
		ELSE
			BEGIN
				UPDATE dbo.GIAOVIEN SET LUONG = 1000 WHERE MAGV = MAGV
			END
		FETCH NEXT FROM GiaoVienCurser INTO  @MaGV, @Tuoi
	END
	
-- thoát khỏi con trỏ
CLOSE GiaoVienCurser
-- hủy con trỏ
DEALLOCATE GiaoVienCurser