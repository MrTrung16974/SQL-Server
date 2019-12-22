USE HowKteam
GO
-- auto increament là khi ta muôn ID (khóa chính)(và ko qua tâm nó la gì) tự tăng dần thì ta thêm IDENTITY vào sau khóa chính(và là số)
CREATE TABLE TESTAUTO (
	ID INT PRIMARY KEY IDENTITY, 
	-- tự đông tăng, phải là số, bắt đầu từ 1 mỗi lần tăng thêm 1 đơn vị, mặc định là vậy
	Name NVARCHAR(100)
)
GO

INSERT dbo.TESTAUTO ( Name )VALUES ( N'')
INSERT dbo.TESTAUTO ( Name )VALUES ( N'')
INSERT dbo.TESTAUTO ( Name )VALUES ( N'')
INSERT dbo.TESTAUTO ( Name )VALUES ( N'')
INSERT dbo.TESTAUTO ( Name )VALUES ( N'')
INSERT dbo.TESTAUTO ( Name )VALUES ( N'')
GO

SELECT * FROM dbo.TESTAUTO2
CREATE TABLE TESTAUTO2 (
	ID INT PRIMARY KEY IDENTITY(4,3), 
	--bắng đầu từ 4 và mỗi lần tăng lên 3 đơn vị
	Name NVARCHAR(100)
)
GO

INSERT dbo.TESTAUTO2 ( Name )VALUES ( N'')
INSERT dbo.TESTAUTO2 ( Name )VALUES ( N'')
INSERT dbo.TESTAUTO2 ( Name )VALUES ( N'')
INSERT dbo.TESTAUTO2 ( Name )VALUES ( N'')
INSERT dbo.TESTAUTO2 ( Name )VALUES ( N'')
INSERT dbo.TESTAUTO2 ( Name )VALUES ( N'')
GO

DROP TABLE dbo.TESTAUTO2