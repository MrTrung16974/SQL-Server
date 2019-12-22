USE HowKteam
GO

-- tim kiếm thông tin giáo viên bắt đầu bằng chứ l
SELECT gv.HOTEN FROM dbo.GIAOVIEN AS GV
WHERE gv.HOTEN LIKE 'l%'

-- tim kiếm thông tin giáo viên kết thúc bằng chứ n
SELECT gv.HOTEN FROM dbo.GIAOVIEN AS GV
WHERE gv.HOTEN LIKE '%n'

-- tim kiếm thông tin giáo viên có  tồn tại bằng chứ n
SELECT gv.HOTEN FROM dbo.GIAOVIEN AS GV
WHERE gv.HOTEN LIKE '%n%'

-- tim kiếm thông tin giáo viên bắt đầu bằng chứ ế
SELECT gv.HOTEN FROM dbo.GIAOVIEN AS GV
WHERE gv.HOTEN LIKE N'%ế%'