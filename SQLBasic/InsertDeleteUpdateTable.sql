-- thêm dữ liệu 

-- kiểu Int -> nhập bình thường
-- kiểu kí tự -> nhập trong dâu nháy đơn
-- kiểu kí tự có unicode -> viết trong nháy đơn và trước viết chữ N VD: N'Nguyễn Tiến Trung'


USE SQLDTQuery
GO

-- thêm cột cho bảng học sinh--
ALTER TABLE dbo.Hocsinh ADD Diachi NVARCHAR(100), Lop NCHAR(20)
GO 

-- thêm dữ liệu vào bảng học sinh
INSERT dbo.Hocsinh
		-- cài này có cũng được nếu ko có thì sẽ insert theo thừ tự ta nhập nhập dữ liệu vào --
        ( MaHS, Name, Ngaysinh, Diachi, Lop )
VALUES  ( N'A1', -- MaHS - nvarchar(10)
          N'Nguyễn Tiến Trung', -- Name - nvarchar(100)
          '20000401',  -- Ngaysinh - date
		  N'Hà Nội', -- Diachi -- nvarchar(100)
		  N'10C'  -- Lop -- nchar
          )
GO

INSERT dbo.Hocsinh
		-- cài này có cũng được nếu ko có thì sẽ insert theo thừ tự ta nhập nhập dữ liệu vào --
        ( MaHS, Name, Ngaysinh, Diachi, Lop )
VALUES  ( N'A2', -- MaHS - nvarchar(10)
          N'Nguyễn Tiến Long', -- Name - nvarchar(100)
          '20000323',  -- Ngaysinh - date
		  N'Hà Nội', -- Diachi -- nvarchar(100)
		  N'10C'  -- Lop -- nchar
          )
GO

INSERT dbo.Hocsinh
		-- cài này có cũng được nếu ko có thì sẽ insert theo thừ tự ta nhập nhập dữ liệu vào --
        ( MaHS, Name, Ngaysinh, Diachi, Lop )
VALUES  ( N'A3', -- MaHS - nvarchar(10)
          N'Nguyễn Đức Huy', -- Name - nvarchar(100)
          '20000915',  -- Ngaysinh - date
		  N'Hà Nội', -- Diachi -- nvarchar(100)
		  N'10C'  -- Lop -- nchar
          )
GO

INSERT dbo.Hocsinh
		-- cài này có cũng được nếu ko có thì sẽ insert theo thừ tự ta nhập nhập dữ liệu vào --
        ( MaHS, Name, Ngaysinh, Lop )
VALUES  ( N'A4', -- MaHS - nvarchar(10)
          N'Đăng Thị Tuyết', -- Name - nvarchar(100)
          '20000721',  -- Ngaysinh - date
		  N'10C'  -- Lop -- nchar
          )
GO

-- xóa dữ liệu
-- nếu chỉ Delete <tên bảng => xóa toàn dữ liệu trong bảng
-- xóa trường mong muốn thêm where
-- các toán tử:
-- <, > , >=, <=, <>, =

-- xoa toàn bộ bảng
DELETE dbo.Hocsinh

-- xóa trường mong muốn
DELETE dbo.Hocsinh WHERE MaHS = 'A3'

-- xóa trường mong muốn với nhiều điêu kiện
DELETE dbo.Hocsinh WHERE MaHS = N'A2' AND Lop = '10C'

-- update dự liệu --

--update dữ liệu toàn bộ bảng
UPDATE dbo.Hocsinh SET Ngaysinh = '20000101'

-- update dữ liệu toàn bộ bảng với nhiều trường
UPDATE dbo.Hocsinh SET Ngaysinh = '20001101', Lop = N'10A'


-- update dữ liệu trường mong muôn với điều kiên
 UPDATE dbo.Hocsinh SET Diachi = N'Nam Hồng' WHERE MaHS = N'A1'

