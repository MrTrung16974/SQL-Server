USE HowKteam
GO

-- Xuất ra Danh sách tên bộ môn và số lượng giáo viên trong bộ môn đó
SELECT BM.MABM, BM.TENBM, Count(*) FROM dbo.BOMON AS BM, dbo.GIAOVIEN AS GV
WHERE BM.MABM = GV.MABM
GROUP BY BM.MABM, BM.TENBM 

-- dù thay đổi thứ tự như thế nào thì kết quả cũng ko thay đổi
SELECT BM.TENBM, BM.PHONG, Count(*) FROM dbo.BOMON AS BM, dbo.GIAOVIEN AS GV
WHERE BM.MABM = GV.MABM
GROUP BY BM.TENBM, BM.PHONG


-- lấy ra danh sách giáo viên có lương > lương trung bình của giáo viên
SELECT * FROM dbo.GIAOVIEN
WHERE LUONG >
(SELECT SUM(LUONG) FROM dbo.GIAOVIEN)/(SELECT COUNT(*) FROM dbo.GIAOVIEN)


-- xuất ra tên giáo viên và số lượng đề tài mà giáo viên đó đã làm
SELECT GV.HOTEN, COUNT(*) FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TGDT
WHERE GV.MAGV = TGDT.MAGV
GROUP BY GV.MAGV, GV.HOTEN

/* bài tập 
 1. Xuất ra tên giáo viên và số lượng người thân của giáo viên đó
 2. Xuấn ra tên giáo viên và số lường đề tài đã hoàn thành mà người đó đã tham gia
 3. Xuất ra tên khoa mà khoa có tổng số lượng giáo viên trong khoa là lớn nhất
*/
--bài 1.
SELECT GV.MAGV,GV.HOTEN, COUNT(*) FROM dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS NT
WHERE GV.MAGV = NT.MAGV
GROUP BY GV.MAGV, GV.HOTEN

-- bài 2
SELECT GV.HOTEN, COUNT(*) FROM dbo.GIAOVIEN AS GV, dbo.THAMGIADT AS TGDT
WHERE GV.MAGV = TGDT.MAGV
AND TGDT.KETQUA = N'Đạt'
GROUP BY GV.MAGV, GV.HOTEN

-- bài 3
SELECT TOP(1) K.TENKHOA, COUNT(*) AS SLUONG FROM dbo.KHOA AS K,dbo.BOMON AS BM, dbo.GIAOVIEN AS GV
where BM.MAKHOA = k.MAKHOA
AND BM.MABM = gv.MABM
GROUP BY k.MAKHOA, k.TENKHOA
ORDER BY SLUONG DESC


/* Agreeate Function
	AVG() :tính trung bình
	COUNT() : Đếm số dòng
	FIRST() : Lấy phần tử đầu tiên 
	LAST() : lấy phần tử cuối cùng
	MAX() : Lấy giá trị lớn nhất
	MIN(): lấy giá trị nhỏ nhất
	ROUND() : Làm tròn
	SUM() : Tính tông 
	

	String Function
	CHARINDEX : Tìm một phần tử có tồn tại trong chuỗi hay ko
	CONCAT() :  Cắt chuỗi
	LEFT() : cắt bên trái bao nhiêu phần tử
	LEN() /LENGTH() : lấy ra độ dài
	LOWER() / LCASE() :  cho chuỗi thành vietet thường
	LTRIM() : Cắt khoảng trắng bên trái
	SUBSTRING() / MID() :Lấy ra chuỗi phụ
	PATINDEX() : 
	REPLACE() : thay thê
	RIGHT() : cắt phần tử bên phải
	RTRIM() căt khoảng trắng bên phải
	UPPER() / UCASE()
 */