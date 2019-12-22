USE HowKteam
GO

-- lấy hết dữ liệu ở bản giáo viên cho vào một bảng mới là bảng TableA
-- bảng này có cá record tương ứng với bảng giáo viên
SELECT * INTO TableA
FROM dbo.GIAOVIEN


-- Tạo ra một bảng tableB mới. Có cột HOTEN tương ứng với bảng giáo viên
-- dữ liệu bảng TableB tương ứng với bảng giáo viên
SELECT HOTEN INTO TableB
FROM dbo.GIAOVIEN

--- Tạo ra bảng TableC mới với cột HoTen và lương lớn (>) hơn 2000
-- dữ liệu bảng TableC tương ứng với bảng giáo viên
SELECT HOTEN INTO TableC
FROM dbo.GIAOVIEN
WHERE LUONG > 2000

-- tạo một bảng từ nhiều bảng
SELECT MAGV, HOTEN, TENBM INTO GVBackup
FROM dbo.GIAOVIEN,dbo.BOMON
WHERE BOMON.MABM = GIAOVIEN.MABM

--tao một bảng GVBK y trang bảng cũ nhưng ko có dữ liệu
SELECT * INTO GVBK
FROM dbo.GIAOVIEN
WHERE 6>9


