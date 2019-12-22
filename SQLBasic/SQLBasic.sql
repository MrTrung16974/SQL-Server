-- tạo một DataBase --
CREATE DATABASE SQLDTQuery

GO
-- danh dấu là mã sql này thực thị với database SQLDTQuery --
USE SQLDTQuery

--tạo bảng Hocsinh ---
CREATE TABLE Hocsinh 
(
	MaHS NVARCHAR(10),
	Name NVARCHAR(100)
)
GO
-- tao bảng Giaovien --
CREATE TABLE Giaovien
(
	MaGV NVARCHAR(10),
	Name NVARCHAR(100)
)
GO

-- thêm môt côt vào database --
ALTER TABLE dbo.Hocsinh ADD Ngaysinh DATE

GO

-- xóa dữ liệu bên trong bảng --
TRUNCATE TABLE dbo.Hocsinh

-- xoa một bảng, xóa bảng sinh vien --
DROP TABLE dbo.Giaovien

--xóa database --
DROP DATABASE SQLDTUI