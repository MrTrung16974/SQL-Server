USE HowKteam
GO

--- lấy ra giáo viên mã giáo viên là 001 nếu là giáo viên quản lý giáo viên quan lí chuyên môn hay ko
-- lấy ra danh sách các giáo viên quản lý
-- In là kiểm tra mã giáo vien 001 có tồn tại trong dang sách đó hay ko
SELECT * FROM dbo.GIAOVIEN
WHERE MAGV = '001'
AND MAGV IN 
(
	SELECT GVQLCM FROM dbo.GIAOVIEN
)

-- gộp 2 bảng bằng truy vấn lồng 
SELECT * FROM dbo.GIAOVIEN,
(
	SELECT * FROM dbo.DETAI
)AS DT

-- lấy ra giáo viên đã tham gia đề tai hai lần trở lên

-- lấy ra tất cả thông tin giáo viên
SELECT * FROM dbo.GIAOVIEN AS GV
-- khi mà số lượng đề tài giáo viên lớn hơn( > ) một
WHERE 1 < 
(
	SELECT COUNT(*) FROM dbo.THAMGIADT
	WHERE MAGV = GV.MAGV
)

-- xuất ra thông tin khoa mà co nhiều hơn 2 giáo viên
-- lấy ra danh sách bộ môn năm trong khoa hiện tại
SELECT * FROM dbo.KHOA AS k
WHERE 2 < 
(
	SELECT COUNT(*) FROM dbo.GIAOVIEN AS GV, dbo.BOMON AS BM
	WHERE gv.MABM = BM.MABM 
	AND BM.MAKHOA = k.MAKHOA
)

-- sắp xếp theo số lượng giảm dần 
-- tằng là ASC
-- giảm DESC

SELECT MAGV FROM dbo.GIAOVIEN
ORDER BY MAGV DESC

-- lấy ra top 5 phần tử
SELECT top(5) * FROM dbo.GIAOVIEN

/* bài tập 
1. Xuất ra thông tin giáo viên mà có hơn 2 người thần
2. Xuất ra danh sách giáo viên lớn tuổi hơn ít nhất 5 giáo viên trong trường
-- lấy ra danh sách (MAGV, Tuổi) as GVT
-- sắp xếp giảm dần => order by desc
-- lấy ra danh sách GVT2 với số lượng phần tử = 5
-- kiểm tra Mã GV tồn tại trong GVT2 là đúng
*/

-- bài 1 
SELECT * FROM dbo.GIAOVIEN AS GV
WHERE 1 < 
(
	SELECT COUNT(*) FROM dbo.NGUOITHAN
	WHERE MAGV =  GV.MAGV
)

-- bài 2
SELECT TOP(5)  GV1.MAGV, (YEAR(GETDATE()) - YEAR(NGSINH)) AS TUOI FROM dbo.GIAOVIEN AS GV1
WHERE GV1.MAGV = 
(	
	SELECT GV2.MAGV FROM dbo.GIAOVIEN AS GV2
	ORDER BY GV2.NGSINH DESC
)

SELECT TOP((SELECT COUNT(*) FROM DBO.GIAOVIEN AS GV2)/2) *FROM DBO.GIAOVIEN
ORDER BY NGSINH ASC