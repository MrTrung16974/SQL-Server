USE HowKteam
GO

--- inner join
SELECT * FROM dbo.BOMON JOIN dbo.GIAOVIEN
ON GIAOVIEN.MABM = BOMON.MABM

-- left join
-- Bảng bên phải nhập vào bảng bên trái 
-- record nào bảng bên phải ko có thì để null
-- record nào bảng bên trái ko có thì ko điền vào
SELECT * FROM dbo.BOMON  left JOIN dbo.GIAOVIEN
ON GIAOVIEN.MABM = BOMON.MABM

-- right join
SELECT * FROM dbo.BOMON RIGHT JOIN dbo.GIAOVIEN
ON GIAOVIEN.MABM = BOMON.MABM