USE HowKteam
GO

-- trigger sễ dược gọi mỗi khi có thao tác thay đthoong tin ban
-- inserted chứa các trường đã insert | update vào bảng
-- Deleted: chứa các trường đã bị xóa khỏi bảng
CREATE TRIGGER UTG_InsertGiaoVien ON
dbo.GIAOVIEN FOR INSERT , UPDATE
AS
BEGIN
	-- ROLLBACK TRAN LÀ hủy bỏ thay đổi cập nhật bảng
	--ROLLBACK TRAN
	PRINT 'Trigger2';
END
GO

SELECT * FROM dbo.GIAOVIEN

INSERT dbo.GIAOVIEN
        ( MAGV ,
          HOTEN ,
          LUONG ,
          PHAI ,
          NGSINH ,
          DIACHI ,
          GVQLCM ,
          MABM
        )
VALUES  ( N'013' , -- MAGV - nchar(3)
          N'Buồn ngủ quá' , -- HOTEN - nvarchar(50)
          750 , -- LUONG - float
          N'Nữ' , -- PHAI - nchar(3)
          GETDATE() , -- NGSINH - date
          N'Giường' , -- DIACHI - nchar(50)
          null , -- GVQLCM - nchar(3)
          N'MMT'  -- MABM - nchar(4)
        )
GO
        
---------------------------------------------------------------------------------
-- 1. Không cho phép xóa thông tin giáo viên có tuổi lớn 40
CREATE TRIGGER UTG_DeleteGvOlderThan40 
ON dbo.GIAOVIEN FOR DELETE
AS
BEGIN
	DECLARE @Count int = 0
	SELECT @Count = COUNT(*) FROM Deleted
	WHERE YEAR(GETDATE()) - YEAR(Deleted.NGSINH) < 1
	IF (@Count > 0)
		BEGIN
		PRINT 'Không được xóa người nhỏ hơn 1 tuổi'
		ROLLBACK TRAN
		END
END
GO

SELECT * FROM dbo.GIAOVIEN
GO

DELETE dbo.GIAOVIEN WHERE MAGV = '013'
GO


INSERT dbo.GIAOVIEN
        ( MAGV ,
          HOTEN ,
          LUONG ,
          PHAI ,
          NGSINH ,
          DIACHI ,
          GVQLCM ,
          MABM
        )
VALUES  ( N'013' , -- MAGV - nchar(3)
          N'Buồn ngủ quá' , -- HOTEN - nvarchar(50)
          750 , -- LUONG - float
          N'Nữ' , -- PHAI - nchar(3)
          '19940102' , -- NGSINH - date
          N'Giường' , -- DIACHI - nchar(50)
          null , -- GVQLCM - nchar(3)
          N'MMT'  -- MABM - nchar(4)
        )
GO