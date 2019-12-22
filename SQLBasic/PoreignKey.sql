CREATE DATABASE Primary_Foreign
GO

USE Primary_Foreign
GO

CREATE TABLE BoMon 
(
	MaBM CHAR(10) PRIMARY KEY,
	Name NVARCHAR(100)
)
GO

CREATE TABLE Lop 
(
	MaL CHAR(10) NOT NULL,
	Name NVARCHAR(100) DEFAULT N'Tên Lớp',

	PRIMARY KEY(MaL)
)
GO

-- tạo khóa ngoại cần những điều kiện
-- tham chiếu đến khóa chính 
-- unique, not null 
-- cùng kiểu dữ liệu
-- cùng số lượng trường có sắp sếp

-- lợi ích
-- dảm bảo toàn ven dữ liệu. không có trường hợp tham chiếu tới dữ liệu ko tồn tại

CREATE TABLE GiaoVien 
(
	MaGV CHAR(10) NOT NULL,
	Name NVARCHAR(100) DEFAULT N'Tên giáo viên',
	BrithDay DATE,
	Diachi NVARCHAR(100),
	Sex BIT,
	-- tạo khóa ngoại khi khởi tạo dữ liệu
	MaBM CHAR(10) FOREIGN KEY(MaBM) REFERENCES dbo.BoMon(MaBM) 
)
GO

CREATE TABLE HocSinh
(
	MaHS CHAR(10) PRIMARY KEY,
	Name NVARCHAR(100),
	BrithDay DATE,
	Diachi NVARCHAR(100),
	Sex BIT,
	MaL CHAR(10) 
)
-- tạo khóa ngoại sau khi tạo bảng
ALTER TABLE dbo.Hocsinh ADD CONSTRAINT FK_HS FOREIGN KEY(MaL) REFERENCES dbo.Lop(MaL)

-- xóa khóa ngoại --
-- ALTER TABLE dbo.Hocsinh DROP CONSTRAINT FK_HS

-- insert dữ liệu vào bảng Bộ Môn

INSERT dbo.BoMon
        ( MaBM, Name )
VALUES  ( 'B1', -- MaBM - char(10)
          N'CSS'  -- Name - nvarchar(100)
          )
INSERT dbo.BoMon
        ( MaBM, Name )
VALUES  ( 'B2', -- MaBM - char(10)
          N'JAVASCRIPT'  -- Name - nvarchar(100)
          )
INSERT dbo.BoMon
        ( MaBM, Name )
VALUES  ( 'B3', -- MaBM - char(10)
          N'HTML'  -- Name - nvarchar(100)
          )




INSERT dbo.GiaoVien
        ( MaGV, Name, BrithDay, Diachi, Sex, MaBM )
VALUES  ( 'G1', -- MaGV - char(10)
          N'Giao Viên 1', -- Name - nvarchar(100)
          GETDATE(), -- BrithDay - date
          N'Hà Nội', -- Diachi - nvarchar(100)
          1, -- Sex - bit
          'B1'  -- MaBM - char(10)
          )
INSERT dbo.GiaoVien
        ( MaGV, Name, BrithDay, Diachi, Sex, MaBM )
VALUES  ( 'G2', -- MaGV - char(10)
          N'Giao Viên 2', -- Name - nvarchar(100)
          GETDATE(), -- BrithDay - date
          N'Hà Nội', -- Diachi - nvarchar(100)
          0, -- Sex - bit
          'B1'  -- MaBM - char(10)
          )
		  INSERT dbo.GiaoVien
        ( MaGV, Name, BrithDay, Diachi, Sex, MaBM )
VALUES  ( 'G3', -- MaGV - char(10)
          N'Giao Viên 3', -- Name - nvarchar(100)
          GETDATE(), -- BrithDay - date
          N'Hà Nội', -- Diachi - nvarchar(100)
          0, -- Sex - bit
          'B2'  -- MaBM - char(10)
          )
INSERT dbo.GiaoVien
        ( MaGV, Name, BrithDay, Diachi, Sex, MaBM )
VALUES  ( 'G4', -- MaGV - char(10)
          N'Giao Viên 4', -- Name - nvarchar(100)
          GETDATE(), -- BrithDay - date
          N'Hà Nội', -- Diachi - nvarchar(100)
          1, -- Sex - bit
          'B3'  -- MaBM - char(10)
          )
INSERT dbo.GiaoVien
        ( MaGV, Name, BrithDay, Diachi, Sex, MaBM )
VALUES  ( 'G5', -- MaGV - char(10)
          N'Giao Viên 5', -- Name - nvarchar(100)
          GETDATE(), -- BrithDay - date
          N'Hà Nội', -- Diachi - nvarchar(100)
          0, -- Sex - bit
          'B3'  -- MaBM - char(10)
          )