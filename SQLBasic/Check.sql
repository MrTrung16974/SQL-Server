USE HowKteam
GO
 
-- check là tạo điều kiệu cho trường mình mong muốn trong khoảng điều kiện mình đưa ra
CREATE TABLE TestCheck 
(
	ID INT PRIMARY KEY IDENTITY,
	LUONG INT CHECK(LUONG > 200 AND LUONG < 1000)
)
GO

--- lương phải insert trong khoảng 200 - 1000 
INSERT dbo.TestCheck(LUONG) VALUES  (201)

-- các cách khai báo check
-- các kiểu khai báo giống như khai báo khóa chính
CREATE TABLE TestCheck1
(
	ID INT PRIMARY KEY IDENTITY,
	LUONG INT, 
	CHECK(LUONG > 200 AND LUONG < 1000)
)
GO


CREATE TABLE TestCheck2
(
	ID INT PRIMARY KEY IDENTITY,
	LUONG INT,
	CONSTRAINT CK_Luong CHECK(LUONG > 200 AND LUONG < 1000)
)
GO


CREATE TABLE TestCheck3
(
	ID INT PRIMARY KEY IDENTITY,
	LUONG INT
)
GO

ALTER TABLE dbo.TestCheck3 ADD CONSTRAINT CK_Luong
CHECK(LUONG > 200 AND LUONG < 1000)
GO

