USE HowKteam
GO

-- inner join là gộp hai bảng lại với nhau

--- Đấy là một inner Join => kiểu cũ sau này có thể ko được hỗ trợ nữa
-- mọi inner đều đi theo ít nhất một điều kiên
SELECT * FROM 
dbo.GIAOVIEN,dbo.BOMON
WHERE BOMON.MABM = GIAOVIEN.MABM


-- Đầy cũng là inner Join => kiều mỗi được khuyên dùng

SELECT * FROM 
dbo.GIAOVIEN JOIN dbo.BOMON
ON  BOMON.MABM = GIAOVIEN.MABM