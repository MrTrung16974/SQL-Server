-- Truy Vấn Có Điều Kiện --
USE HowKteam
GO
-- lấy tất cacr các giáo viên có lương lớn hơn 2000
SELECT * FROM dbo.GIAOVIEN
WHERE LUONG > 2000

-- lấy tất cả các giáo viên nữ và có lương lớn hơn 2000
SELECT * FROM dbo.GIAOVIEN
WHERE PHAI = N'Nữ' AND LUONG > 2000

-- lấy tất cả các giáo viên lớn hon 40 tuổi
--  year là lấy năm
-- getdate là lấy ngày tháng năm hiện tại trong máy

SELECT * FROM dbo.GIAOVIEN
WHERE YEAR(GETDATE()) - YEAR(NGSINH) > 40

-- lấy họ mã giáo viên, tên giáo viên, năm sinh, tuổi của giáo viên nhỏ hơn 40
SELECT MAGV, HOTEN, YEAR(NGSINH), YEAR(GETDATE()) - YEAR(NGSINH) FROM dbo.GIAOVIEN
WHERE YEAR(GETDATE()) - YEAR(NGSINH) < 40

-- lấy ra Mã GV, Tên GV, tên Khoa của giáo viên đó
SELECT Gv.MAGV, Gv.HOTEN, k.TENKHOA FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM, dbo.KHOA AS K
WHERE GV.MABM = Bm.MABM AND bm.MAKHOA = k.MAKHOA

-- lấy giáo viên là trưởng bộ môn
SELECT GV.* FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
WHERE GV.MAGV = bm.TRUONGBM


-- đếm số giáo viên trong bảng giáo viên
-- hàm tính tổng COUNT(*) => đếm tất cả số lưởng của record
--- COUNT (tên trường nào dó) => đếm tất cả của trường đó
SELECT COUNT(*) AS N'Sô lượng giáo viên' FROM dbo.GIAOVIEN


-- dếm số lượng giáo viên mà có mã GV là 007
SELECT COUNT(*) AS N'Số Lượng người thân' FROM dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS NT
WHERE Gv.MAGV = '007' AND gv.MAGV = NT.MAGV


-- lấy ra tên giáo viên và tên đề tài người đó tham gia
SELECT gv.HOTEN, DT.TENDT FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TGDT, dbo.DETAI AS DT
WHERE gv.MAGV = TGDT.MAGV  AND TGDT.MADT = DT.MADT


-- lấy ra thông tin giáo viên và giáo viên quản lý chủ nhiểm của người đó
SELECT gv1.HOTEN, gv2.HOTEN FROM dbo.GIAOVIEN AS GV1, dbo.GIAOVIEN AS GV2
WHERE GV1.GVQLCM = GV2.MAGV

-- xuất ra số lượng giáo vien của khoa công nghệ thông tin
SELECT COUNT(*) 
FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM, dbo.KHOA AS K
WHERE gv.MABM = bm.MABM
AND BM.MAKHOA = k.MAKHOA
AND k.MAKHOA = 'CNTT'

-- xuất ra thông tin giáo viên khi người đó tham gia đề tài đạt
SELECT gv.*, TGDT.KETQUA FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TGDT
WHERE gv.MAGV = TGDT.MAGV
AND TGDT.KETQUA = N'Đạt'
