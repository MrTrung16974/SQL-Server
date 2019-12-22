USE HowKteam
GO

--- indexes là để tăng tốc độ truy xuât dự liệu
--- dùng để đánh key cho bảng(Cột)
-- Tăng tốc độ tìm kiếm <> chậm tốc độ thêm, sủa, xóa
-- Cho phép tìm kiếm các trường trùng nhau
CREATE INDEX IndexName ON dbo.NGUOITHAN

-- Không cho phép tìm kiếm các trường trùng nhau
CREATE UNIQUE INDEX IndexName ON dbo.NGUOITHAN


SELECT * FROM dbo.NGUOITHAN
WHERE MAGV= '001' AND TEN = N'thủy' 
