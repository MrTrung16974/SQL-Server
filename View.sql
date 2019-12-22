USE HowKteam
GO

-- tạo ra một bảng lưu họ tên, tên bộ môn , lương của giáo viên đó
SELECT HOTEN, TENBM, LUONG INTO LUONGGIAOVIEN FROM dbo.GIAOVIEN, dbo.BOMON
WHERE BOMON.MABM = GIAOVIEN.MABM

SELECT * FROM LUONGGIAOVIEN

UPDATE dbo.GIAOVIEN SET LUONG = 2000
WHERE MAGV = '003'						 

SELECT * FROM dbo.GIAOVIEN
-- view là bảng ảo
-- cập nhập dữ liệu theo bảng mà view tham chiếu tới mỗi khi lấy view ra sài

-- dùng view khi ta thay đổi đữ liệu của bảng gốc
-- bảng nó thiếu tới mà vẫn muốn bảng mới tạo ra từ bảng gốc đó thay đổi dữ liệu theo


-- tạo ra view  test view từ câu truy vấn
CREATE VIEW TestView AS
SELECT * FROM dbo.GIAOVIEN

SELECT * FROM dbo.GIAOVIEN

UPDATE dbo.GIAOVIEN SET LUONG = 2000
WHERE MAGV = '003'

SELECT * FROM TestView

-- Xóa view 
DROP VIEW  TestView

-- update cách sủa lại bảng view
ALTER VIEW TestView AS 
SELECT HOTEN FROM dbo.GIAOVIEN

-- tạo tên view bằng tiếng việt ta cho tên view vào trong dấu ngoặc vuông []
-- và muôn select thì cũng như vây cho tên view vào dấu ngoặc
CREATE VIEW [Con gà công nghiệp] AS
SELECT * FROM dbo.CONGVIEC

SELECT * FROM [Con gà công nghiệp]


