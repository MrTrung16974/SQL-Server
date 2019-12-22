-- tạo database 
CREATE DATABASE DTTruongHoc
GO

USE DTTruongHoc
GO

-- TẠO BẢNG HỌC SINH
CREATE TABLE HocSinh 
(
	MaHS INT PRIMARY KEY,
	HOTEN NVARCHAR(100) NOT NULL,
	NGAYSINH DATE,
	NOISINH NVARCHAR(100),
	MAMH INT,
	MAL INT,
)
GO

-- TẠO BẢNG MÔN HỌC
 CREATE TABLE MonHoc
 (
	MAMH INT PRIMARY KEY,
	TENMH NVARCHAR(100),
 )
 GO

-- TẠO BẢNG LƠP
CREATE TABLE Lop
(
	MAL INT PRIMARY KEY,
	TENLOP NVARCHAR(100),
	MAK INT,
)
GO

-- TẠO BẢN GIÁO VIÊN
CREATE TABLE GiaoVien 
(
	MAGV INT PRIMARY KEY,
	TENGV NVARCHAR(100),
	HOCVI NVARCHAR(20),
	CHUYENNGANH NVARCHAR(100),
	MAK INT,
	MAL INT,
	MAMH INT,
)
GO
-- TẠO BẢNG KHOA
CREATE TABLE Khoa
(
	MAK INT PRIMARY KEY,
	TENKHOA NVARCHAR(100)
)
GO

-- TẠO KHÓA NGOẠI

-- Tạo khóa ngoại cho bảng học sinh
ALTER TABLE dbo.HocSinh ADD CONSTRAINT HS_MH FOREIGN KEY(MAMH) REFERENCES dbo.MonHoc(MAMH)
ALTER TABLE dbo.HocSinh ADD CONSTRAINT HS_L FOREIGN KEY(MAL) REFERENCES dbo.Lop(MAL) 

--Tạo khóa ngoại cho bảng lớp
ALTER TABLE dbo.Lop ADD CONSTRAINT L_K FOREIGN KEY(MAK) REFERENCES dbo.Khoa(MAK)

-- tạo khóa ngoại cho bảng giáo viên
ALTER TABLE dbo.GiaoVien ADD CONSTRAINT GV_K FOREIGN KEY(MAK) REFERENCES dbo.Khoa(MAK)
ALTER TABLE dbo.GiaoVien ADD CONSTRAINT GV_L FOREIGN KEY(MAL) REFERENCES dbo.Lop(MAL)
ALTER TABLE dbo.GiaoVien ADD CONSTRAINT GV_MH FOREIGN KEY(MAMH) REFERENCES dbo.MonHoc(MAMH)




--- intsert data into database
--( MaHS , HOTEN ,NGAYSINH ,NOISINH ,MAMH , MAL )
-- intsert data into table HocSinh
INSERT dbo.HocSinh VALUES  ( 101 ,N'Nguyễn Tiến Trung' ,'20000401' ,N'Hà Nội' ,  201 , 301  )
INSERT dbo.HocSinh VALUES  ( 102 ,N'Nguyễn Tiến Long' ,'20000323' ,N'Hà Nội' ,  202 , 303  )
INSERT dbo.HocSinh VALUES  ( 103 ,N'Nguyễn Dức Huy' ,'20000915' ,N'Hà Nội' ,  202 , 302  )
INSERT dbo.HocSinh VALUES  ( 104 ,N'Đặng Thị Tuyết' ,'20000721' ,N'Yên Bái' ,  203 , 302  )
INSERT dbo.HocSinh VALUES  ( 105 ,N'Nguyễn Văn Thỏa' ,'19990813' ,N'Hà Nội' ,  201 , 303  )
INSERT dbo.HocSinh VALUES  ( 106 ,N'Đinh Xuân Thăng' ,'20000521' ,N'Sóc Sơn' ,  203 , 303  )
INSERT dbo.HocSinh VALUES  ( 107 ,N'Nguyễn Tiến Hiếu' ,'20001102' ,N'Hà Nội' ,  204 , 304  )
INSERT dbo.HocSinh VALUES  ( 108 ,N'Nguyễn Văn Ngọc' ,'20000315' ,N'Ninh Bình' ,  204 , 301  )
INSERT dbo.HocSinh VALUES  ( 109 ,N'Nguyễn Thị Hiền' ,'20001103' ,N'Hà Nội' ,  203 , 304  )
INSERT dbo.HocSinh VALUES  ( 110 ,N'Đặng Thanh Thảo' ,'20000411' ,N'Hải Phòng' ,  201 , 301  )

-- insert data into table MonHoc
-- ( MAMH, TENMH )
INSERT dbo.MonHoc VALUES  ( 201, N'Cơ Sở Dữ Liệu' )
INSERT dbo.MonHoc VALUES  ( 202, N'Thuật Toán' )
INSERT dbo.MonHoc VALUES  ( 203, N'Java Web' )
INSERT dbo.MonHoc VALUES  ( 204, N'HTML CSS' )

-- insert data into table Lop
--( MAL, TENLOP, MAK )

INSERT dbo.Lop  VALUES  ( 301,  N'10K1', 401 )
INSERT dbo.Lop  VALUES  ( 302,  N'10K2', 402 )
INSERT dbo.Lop  VALUES  ( 303,  N'10K3', 403 )
INSERT dbo.Lop  VALUES  ( 304,  N'10K4', 404 )

--insert data into table GiaoVien
--( MAGV , TENGV , HOCVI , CHUYENNGANH , MAK , MAL , MAMH )

INSERT dbo.GiaoVien VALUES  ( 501 , N'Nguyễn Văn Công' , N'Đại Học' ,  N'Toán Học' , 401 , 301 , 201)
INSERT dbo.GiaoVien VALUES  ( 502 , N'Nguyễn Thị Thanh' , N'Đại Học' ,  N'Vặt Lí' , 402, 302 , 202 )
INSERT dbo.GiaoVien VALUES  ( 503 , N'Trăn Văn Học' , N'Cao Đảng' ,  N'Công Nghệ Thông Tin' , 403 , 301 , 202 )
INSERT dbo.GiaoVien VALUES  ( 504 , N'Tô Thanh Hiền' , N'Đại Học' ,  N'Thiên Văn' , 404 , 303 , 201 )
INSERT dbo.GiaoVien VALUES  ( 505 , N'Nguyễn Thái Học' , N'Cao Đảng' ,  N'Công Nghệ Thông Tin' , 403 , 303 , 203 )
INSERT dbo.GiaoVien VALUES  ( 506 , N'Albert Einstein' , N'Giáo Sư' ,  N'Vật lí lí thuyết' , 402 , 304 , 204 )
INSERT dbo.GiaoVien VALUES  ( 507 , N'Isaac Newton' , N'Giáo Sư' ,  N'Vặt lí', 402 , 304 , 204 )
INSERT dbo.GiaoVien VALUES  ( 508 , N'Stephen Hawking' , N'Giáo Sư' ,  N'Vật lí lí thuyết', 401 , 301 , 201 )

-- insert dât into table Khoa
-- ( MAK, TENKHOA )

INSERT dbo.Khoa VALUES  ( 401, N'Công Nghệ Thông Tin' )
INSERT dbo.Khoa VALUES  ( 402, N'Vặt Lí' )
INSERT dbo.Khoa VALUES  ( 403, N'Cơ Điệi Tử' )
INSERT dbo.Khoa VALUES  ( 404, N'Cơ Khí Chế Tạo' )