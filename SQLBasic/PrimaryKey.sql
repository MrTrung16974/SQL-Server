-- unique: duy nhất => trong toàn bộ bảng. trường nào có unique thì không thể trung nhau
-- Not null: trường đó ko được phép null
-- Default:	Giá trị mặc định của trường đó nếu ko gán giá trị insert

-- tạo khóa PrimaryKey trong bảng --
CREATE TABLE TestPrimaryKey1 
(
	ID INT NOT NULL,
	Name NVARCHAR(100),
)

GO

-- khi đã tạo bảng. Muốn sửa cột thành PrimaryKey --
ALTER TABLE dbo.TestPrimaryKey1 ADD PRIMARY KEY(ID)

GO

-- Tạo PrimaryKey trong bảng không phải khi khai báo
CREATE TABLE TestPrimaryKey2 
(
	ID INT NOT NULL,
	Name NVARCHAR(100),

	PRIMARY KEY (ID)
)

GO

-- Tạo PrimaryKey ngay trong bảng mà đặt tên cho key đó
CREATE TABLE TestPrimaryKey3 
(
	ID INT NOT NULL,
	Name NVARCHAR(100),

	CONSTRAINT PR_Test3 -- sau này xóa key cho dễ
	PRIMARY KEY (ID)
)
GO

-- Default mặc định cho name
CREATE TABLE TestPrimaryKey4 
(
	ID INT NOT NULL,
	Name NVARCHAR(100) DEFAULT N'Nguyên Tiến Trung',
)
ALTER TABLE dbo.TestPrimaryKey4 
ADD CONSTRAINT PR_Test4 
PRIMARY KEY(ID)

-- insert vào bản TestPrimary Key4 name default name = N'Nguyễn Tiến Trung' --
INSERT dbo.TestPrimaryKey4
        ( ID )
VALUES  ( 1 -- ID - int
          )

INSERT dbo.TestPrimaryKey4
        ( ID )
VALUES  ( 2 -- ID - int
          )

INSERT dbo.TestPrimaryKey4
        ( ID )
VALUES  ( 3 -- ID - int
          )