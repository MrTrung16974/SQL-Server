USE HowKteam
GO

SELECT * FROM dbo.NGUOITHAN

INSERT dbo.NGUOITHAN
        ( MAGV, TEN, NGSINH, PHAI )
VALUES  ( N'010', -- MAGV - nchar(3)
          N'Test102', -- TEN - nchar(12)
          GETDATE(), -- NGSINH - datetime
          N''  -- PHAI - nchar(3)
          )
INSERT dbo.NGUOITHAN
        ( MAGV, TEN, NGSINH, PHAI )
VALUES  ( N'012', -- MAGV - nchar(3)
          N'Test101', -- TEN - nchar(12)
          GETDATE(), -- NGSINH - datetime
          N'Nam'  -- PHAI - nchar(3)
          )
SELECT * FROM dbo.NGUOITHAN WHERE TEN = 'Test101'

BEGIN TRANSACTION
DELETE dbo.NGUOITHAN WHERE TEN = 'Test101'
-- chuỗi thao tác loằng ngoằng phức tạp
ROLLBACK --hủy hỏ trans
----------------------------------------------------
BEGIN TRANSACTION
DELETE dbo.NGUOITHAN WHERE TEN = 'Test101'
-- chuỗi thao tác loằng ngoằng phức tạp
COMMIT ---chấp nhận trans
------------------------------------------
-- đặt tên cho transaction
DECLARE @trans VARCHAR(20)
SELECT @trans = 'trans'
BEGIN TRANSACTION @trans
DELETE dbo.NGUOITHAN WHERE TEN = 'Test102'
-- chuỗi thao tác loằng ngoằng phức tạp
COMMIT TRANSACTION @trans -- chập nhận trans

-------------------------------------------------
-- đặt từng mốc thời gian để quay lại
-- commit và rollback tương đương với kết thúc trans 


-- quay lại trans1 thì cả hai ko bị xóa
BEGIN TRANSACTION
SAVE TRANSACTION trans1
DELETE dbo.NGUOITHAN WHERE TEN = 'Test102'

SAVE TRANSACTION trans2
DELETE dbo.NGUOITHAN WHERE TEN = 'Test101'
ROLLBACK TRANSACTION trans1

-- quay lại trans2 thì cả trans1 bị xóa
BEGIN TRANSACTION
SAVE TRANSACTION trans1
DELETE dbo.NGUOITHAN WHERE TEN = 'Test102'

SAVE TRANSACTION trans2
DELETE dbo.NGUOITHAN WHERE TEN = 'Test101'
ROLLBACK TRANSACTION trans2