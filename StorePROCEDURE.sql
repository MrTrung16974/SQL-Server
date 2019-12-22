USE HowKteam
GO

/*
	Store PROCEDURE
	là chưng trình hay thủ tục
	Ta có thể dùng Transact-SQL EXCUTE (EXEC) để thực thi các stored procedure
	Stored procedure khác với các hàm sử lý là giá trị trả về của chúng
	Không chứ trong tên và chùng không được sử dụng trực tiếp trong biểu thức
*/
/*
	Động: có thể chỉnh sử khối lện tái sử dụng nhiều lần
	Nhanh hơn: Tự phân tích cú pháp cho tối ưu. Và tạo bản sao để lần chạy sau khôn cần thực thi ại từ đầu
	Bảo mật: Giới ạn quyền cho user nào sử dụng user nào không
	Giải bandwidth: Với các gói transaction lớn. Vài ngàn dòng lệnh một lúc thì dùng sotre sẻ đảm bảo
*/

/*
	CREATE PROC <Tên store>
	[Paramter nếu có]
	AS
	BEGIN
		<code xử lý>
	END
	
	Nếu chỉ là câu truy vấn thì có thể không cần BEGIN và END
*/

-- tạo một store
CREATE PROC USP_Test
-- thêm paramter 
@MaGV NVARCHAR(10), @Luong INT
AS
BEGIN
	-- câu lệnh select
	SELECT * FROM dbo.GIAOVIEN WHERE MAGV = @MaGV AND LUONG = @Luong
END
GO
-- khai báo theo kiểu tắt (EXEC)
-- khai báo theo thứ ko theo tự
EXEC dbo.USP_Test @MaGV = N'', @Luong = 0

-- kkai báo theo thứ tự
EXEC dbo.USP_Test N'', 0

-- khai báo theo kiểu ko tắt (EXECUTE)
-- khai báo theo thứ ko theo tự
EXECUTE dbo.USP_Test @MaGV = N'',  @Luong = 0

-- khai báo theo thứ tự
EXECUTE dbo.USP_Test N'', 0
GO

CREATE PROCEDURE USP_SelectAllGiaoVien
AS SELECT * FROM dbo.GIAOVIEN
GO

-- Dùng store
EXEC dbo.USP_SelectAllGiaoVien
GO
