USE HowKteam
GO

-- full outer join là gom hai bảng lại với nhau với điều kiện và những thằng nào ko có dữ liệu thì để null
SELECT * FROM dbo.GIAOVIEN FULL OUTER JOIN dbo.BOMON
ON BOMON.MABM = GIAOVIEN.MABM

-- các sắp xếp khác nhau nhưng kết quả vẫn giống nhau
SELECT * FROM dbo.BOMON FULL OUTER JOIN dbo.GIAOVIEN
ON BOMON.MABM = GIAOVIEN.MABM

-- cross join là tổ hợp mỗi record của bảng A với all record của bảng B
SELECT * FROM dbo.GIAOVIEN CROSS JOIN dbo.KHOA

