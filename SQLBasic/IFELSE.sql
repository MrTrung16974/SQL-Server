USE HowKteam
GO

--- vidu 1 Kiểm tra lương giáo viên nhập vào có lớn hơn lương trung bình hay ko

--- tính lương trung bình của giáo viên
DECLARE @LuongTrungBinh INT
DECLARE @SoLuongGiaoVien INT
SELECT @SoLuongGiaoVien = count(*) FROM dbo.GIAOVIEN
SELECT @LuongTrungBinh = SUM(LUONG) / @SoLuongGiaoVien  FROM dbo.GIAOVIEN

--- lây lương của giáo viên nhập vào
DECLARE @MaGV CHAR(10) = '006'
DECLARE @LuongMaGV INT = 0
SELECT @LuongMaGV = LUONG FROM dbo.GIAOVIEN WHERE MAGV = @MaGV

-- kiểm tra xem lương giáo viên nhập vào có lớn hơn lương trung bình của giáo viên
-- nếu lớn hơn thì in ra lớn hơn
-- nều nhỏ hơn thì in ra nhỏ hơn
IF (@LuongMaGV > @LuongTrungBinh)
	BEGIN
		PRINT @LuongMaGV
		PRINT @LuongTrungBinh
		PRINT N'Lơn hơn'
	END
ELSE
    BEGIN
		PRINT @LuongMaGV
		PRINT @LuongTrungBinh
		PRINT N'Nhỏ hơn'
	END

--- ví dụ 2 Updete lương toàn bộ giáo viên nếu lương nhập vào lớn hơn lương trung bình
--- ngượi lại chỉ update lương giáo viên nữ

--- tính lương trung bình của giáo viên
DECLARE @LuongTrungBinh INT
DECLARE @SoLuongGiaoVien INT
SELECT @SoLuongGiaoVien = count(*) FROM dbo.GIAOVIEN
SELECT @LuongTrungBinh = SUM(LUONG) / @SoLuongGiaoVien  FROM dbo.GIAOVIEN

--- lây lương của giáo viên nhập vào
DECLARE @luong INT = '1000'

-- kiểm tra xem lương nhập vào có lớn hơn lương trung bình của giáo viên
-- nếu lớn hơn thì updete lương của tất cả giáo viên
-- nều nhỏ hơn thì chỉ updete lương của tất cả giáo viên nữ
IF (@LuongMaGV > @LuongTrungBinh)
	BEGIN
		UPDATE dbo.GIAOVIEN SET LUONG = @luong
	END
ELSE
    BEGIN
		UPDATE dbo.GIAOVIEN SET LUONG = @luong
		WHERE PHAI = N'Nữ'
	END