USE HowKteam
GO

-- tìm ra mã giáo viên có lương cao nhất
SELECT * FROM dbo.GIAOVIEN WHERE LUONG = (SELECT min(LUONG) FROM dbo.GIAOVIEN)

--- lấy tuổi của giáo viên 001
SELECT YEAR(GETDATE()) - YEAR(NGSINH) FROM dbo.GIAOVIEN 
WHERE MAGV = (SELECT MAGV FROM dbo.GIAOVIEN WHERE LUONG = (SELECT min(LUONG) FROM dbo.GIAOVIEN))

----------------------------------------------------------------------------------------------

--- tạo mọt biến kiểu char lưu trữ mã gv của người có lương cao nhất

DECLARE @MaxSalaryMaGV CHAR(10)
SELECT @MaxSalaryMaGV = MAGV FROM dbo.GIAOVIEN WHERE LUONG = (SELECT min(LUONG) FROM dbo.GIAOVIEN)

SELECT (YEAR(GETDATE()) - YEAR(NGSINH)) FROM dbo.GIAOVIEN 
WHERE MAGV = @MaxSalaryMaGV

------------------------------------------------------------

---- khởi tạo kiểu dữ liệu
-- biến bắt đầu = giá trị @
DECLARE @z INT

--- khởi tạo với giá trị mặc định
DECLARE @j INT = 1

-- set giá trị cho biến
SET @j = 1
SET @z = @j + 1
SET @z *= @j


---SET thông qua câu select
DECLARE @MaxLuong int
SELECT @MaxLuong = MAX(LUONG) FROM dbo.GIAOVIEN

-----------------------------------------------------------------------------------------
-- 1. Xuất ra số lượng người thân của giáo viên 001
-- lưu mã giáo viên 001 lại
-- tìm ra số lượng người thân tương ứng
DECLARE @MaGV CHAR(10) = '001'

SELECT COUNT(*) FROM dbo.NGUOITHAN
WHERE MAGV = @MaGV

-- 2. Xuất ra tên của giáo viên có lương cao nhất

DECLARE @MinGVLuong INT
DECLARE @TenGV NVARCHAR(100)

SELECT @MinGVLuong = Min(LUONG) FROM dbo.GIAOVIEN

SELECT @TenGV = HOTEN FROM dbo.GIAOVIEN WHERE LUONG = @MinGVLuong

-- xuất ra màn hình
-- không thể xuất ra màn hình cả 1 câu truy vấn
-- xuất ra theo dạng text
PRINT @TenGV