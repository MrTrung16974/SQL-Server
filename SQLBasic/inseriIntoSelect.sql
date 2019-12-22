USE HowKteam
GO

--- insert into select là insert từ một bảng hoặc nhiều bảng vào một bảng đã tồn tại
-- insert vào bảng với với điều kiện là trường ta insert có tồn tại trong bảng mới rồi
SELECT MAGV ,HOTEN INTO NewGV
FROM dbo.GIAOVIEN
WHERE 9=1

INSERT INTO NewGV 
SELECT MAGV,HOTEN  FROM dbo.GIAOVIEN