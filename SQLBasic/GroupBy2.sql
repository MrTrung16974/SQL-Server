use HowKteam
GO
-- xuất ra sô lượng giáo giao vieentrng từng bộ môn mà lớn hơn 1
-- having => như where nhưng được dùng với group by
-- having là where của group by
SELECT BOMON.MABM, COUNT(*) FROM dbo.GIAOVIEN,dbo.BOMON
WHERE GIAOVIEN.MABM = BOMON.MABM
GROUP BY BOMON.MABM
-- having được dùng khi 
HAVING COUNT(*) > 1

-- xuất ra mức lương và tông số tuổi của giáo viên nhân mức lương đó
-- và có người thân
-- và tuổi phải lơn hơn số tuổi trung bình
SELECT GV.LUONG, SUM(YEAR(GETDATE()) - YEAR(GV.NGSINH)) FROM dbo.GIAOVIEN AS GV, dbo.NGUOITHAN AS NT
WHERE GV.MAGV = NT.MAGV
AND GV.MAGV IN (SELECT MAGV FROM dbo.NGUOITHAN)
GROUP BY GV.LUONG
-- KHI Dung having khi dung trường thì trường đó phải có trong phạm vị trong groud by (co trong group by)
HAVING YEAR(GETDATE()) - YEAR(GV.NGSINH) > 
(
	(SELECT YEAR(GETDATE()) - YEAR(GV.NGSINH) FROM dbo.GIAOVIEN)
	/(SELECT COUNT(*) FROM dbo.GIAOVIEN)
)
