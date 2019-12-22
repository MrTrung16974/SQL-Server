use HowKteam
GO

--- khiểu dữ liệu tự định nghĩa--
-- EXEC sp_addtype 'Name', 'kiểu dữ liệu thực tế', 'not null (có hay ko đều được)' 
EXEC sp_addtype 'NNAME' , 'nvarchar(100)' , 'not null'

CREATE TABLE testType1 (
	NAME NNAME,
	DIACHI NVARCHAR(500)
)

EXEC sp_addtype 'NADDRESS', 'nvarchar(500)'

-- xóa kiểu dữ liệu tự định nghĩa --
EXEC sp_droptype 'NADDRESS'