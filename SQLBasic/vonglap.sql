USE HowKteam
GO

--Vòng lặp tron T-SQL
DECLARE @i INT = 0;
DECLARE @j INT = 100;

WHILE(@i < @j) 
BEGIN
	PRINT @i;
	SET @i += 1;
END

-- Insert 1000 trường cho bảng bộ môn
-- mà ko trung ID
-- Tên bộ môn tăng đần
DECLARE @i INT = 10;
DECLARE @j INT = 1000;

WHILE(@i < @j) 
BEGIN
	INSERT dbo.BOMON
	        ( MABM ,
	          TENBM ,
	          PHONG ,
	          DIENTHOAI ,
	          TRUONGBM ,
	          MAKHOA ,
	          NGAYNHANCHUC
	        )
	VALUES  ( @i , -- MABM - nchar(4)
	           @i , -- TENBM - nchar(50)
	          'B15' , -- PHONG - char(3)
	          '0376213798' , -- DIENTHOAI - char(11)
	          NULL , -- TRUONGBM - nchar(3)
	          N'CNTT' , -- MAKHOA - nchar(4)
	          GETDATE()  -- NGAYNHANCHUC - date
	        )
	SET @i += 1;
END

SELECT * FROM dbo.BOMON