USE HowKteam
GO

-- union dùng để gộp hai bảng lại với nhau
-- phải có số trường bằng nhau
-- thêm all để lấy tất cả phẩn từ kể cải phần tử giống nhau
-- 
SELECT MAGV FROM dbo.GIAOVIEN
WHERE LUONG >= 2500
UNION ALL 
SELECT MAGV FROM dbo.NGUOITHAN
WHERE PHAI = N'Nữ'

SELECT gv.MAGV FROM dbo.GIAOVIEN AS gv, dbo.NGUOITHAN AS nt
WHERE gv.LUONG >= 2500
or nt.PHAI = N'Nữ'

SELECT * FROM dbo.NGUOITHAN