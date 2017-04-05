-----------------------------------------------------------------------------------------------
------------------------------------- [VIEW] --------------------------------------------------
-----------------------------------------------------------------------------------------------

CREATE VIEW sachbanchay
AS
SELECT TOP 4 idSach, tenSach, imgSach, giaSach
FROM dbo.tblSach
WHERE tinhtrang = 1
ORDER BY daban DESC
GO

CREATE VIEW sachmoi
AS
SELECT TOP 4 idSach, tenSach, imgSach, giaSach
FROM dbo.tblSach
WHERE tinhtrang = 1
ORDER BY idSach DESC
GO

CREATE VIEW sachnoibat
AS
SELECT TOP 4 idSach, tenSach, imgSach, giaSach
FROM dbo.tblSach
WHERE tinhtrang = 1
ORDER BY daxem DESC
GO