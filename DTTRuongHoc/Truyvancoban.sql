/****** Script for SelectTopNRows command from SSMS  ******/
-- Truy Vấn dữ Liệu --

-- Truy vấn tất cả dữ liệu trong bảng Học Sinh
-- dấu * là lấy tất cả dữ liệu trong bảng
SELECT * FROM dbo.HocSinh

USE DTTruongHoc
GO
SELECT  MaHS, HOTEN  FROM dbo.HocSinh

-- đổi tên cột 
SELECT MAGV AS N'Mã Giáo Viên', TENGV AS N'Tên Giáo Viên' FROM dbo.GiaoVien

-- lấy cả hai bảng một lúc xuất ra mã giáo viên + tên + tên bộ môn
SELECT MAGV, TENGV, TENMH FROM dbo.GiaoVien, dbo.MonHoc

-- chỉ đích danh cốt của bảng nào bằng cách đặt biệt danh cho trường đó
-- giải quyết vấn đề các bảng có tên trường trùng nhau
SELECT GV.MAGV, GV.TENGV, MH.TENMH FROM dbo.GiaoVien AS GV, dbo.MonHoc AS MH

-- lấy mã khoa và tên khoa tương ưng
SELECT MAK, TENKHOA FROM dbo.Khoa

--lấy mã mã giáo viên và tên giáo viên và lấy ra tên khoa và giáo viên đấy làm việc
SELECT GV.MAGV, GV.TENGV ,K.TENKHOA FROM dbo.GiaoVien AS GV, dbo.Khoa AS K
WHERE GV.MAK = K.MAK