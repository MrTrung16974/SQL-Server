USE HowKteam
GO

-- tạo function ko co parameter
CREATE FUNCTION UF_SelectAllGiaoVien() 
-- trả về gì phải returns kiểu đấy
RETURNS TABLE
AS RETURN SELECT * FROM dbo.GIAOVIEN
GO

-- sử dụng function
SELECT * FROM  UF_SelectAllGiaoVien() 

-- tạo function có parameter
CREATE FUNCTION UF_SelectLuongGiaoVien(@MaGV char(10))
RETURNS int
AS
BEGIN
	DECLARE @Luong INT
	SELECT @Luong = LUONG FROM dbo.GIAOVIEN WHERE MAGV = @MaGV
	RETURN @Luong
END
GO

-- Sửa function s
ALTER FUNCTION UF_SelectLuongGiaoVien(@MaGV char(10))
RETURNS int
AS
BEGIN
	DECLARE @Luong INT
	SELECT @Luong = LUONG FROM dbo.GIAOVIEN WHERE MAGV = @MaGV
	RETURN @Luong
END
GO
--lưu ý khi khái báo select function kiểu này thì nên cho dbo. trước mỗi tên function 
-- sử dụng function
SELECT dbo.UF_SelectLuongGiaoVien(MaGV) FROM dbo.GIAOVIEN

-- xóa function
DROP FUNCTION dbo.UF_SelectAllGiaoVien
-- xóa Store
DROP PROC dbo.USP_SelectAllGiaoVien
-------------------------------------------------------------------
-- 1. Tạo một function tính một số truyền vào có phải là 1 số chẵn hay ko
CREATE FUNCTION UF_IsOdd(@number int)
RETURNS nvarchar(20)
AS
BEGIN
	IF(@number % 2 = 0)
		RETURN N'Số chẵn'
	ELSE
		RETURN N'Số lẻ'
	RETURN N'Không xác đinh' 
END
GO

CREATE FUNCTION UF_AgeOfYear(@Year date)
RETURNS INT
AS
BEGIN
	RETURN YEAR(GETDATE()) - YEAR(@Year)
end 
GO


SELECT dbo.UF_AgeOfYear(NGSINH), dbo.UF_IsOdd(dbo.UF_AgeOfYear(NGSINH)) FROM dbo.GIAOVIEN
 

SELECT year(NGSINH)%400  FROM dbo.GIAOVIEN


CREATE FUNCTION UF_CheckGVInNamNhuan(@MaGV char(10))
RETURNS nvarchar(100)
AS
BEGIN
	DECLARE @NamSinh INT
	SELECT @NamSinh = YEAR(NGSINH) FROM dbo.GIAOVIEN WHERE MAGV = @MaGV
	IF(@NamSinh % 400 = 0)
		RETURN N'Người này sinh năm nhuận'
	ELSE IF(@NamSinh % 4 = 0 AND @NamSinh % 100 != 0)
		RETURN N'Người này sinh năm nhuận'
	ELSE 
		RETURN N'Người này ko phải sinh năm nhuận' 
	RETURN N'NUll'
END
GO

-- kiểm tra giáo viên có phải sinh năm nhuận ko
SELECT MAGV, HOTEN, dbo.UF_CheckGVInNamNhuan(MAGV) as[KẾT QUẢ KIỂM TRA NĂM SINH CỦA GIÁO VIÊN] from dbo.GIAOVIEN