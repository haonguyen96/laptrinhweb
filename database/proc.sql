-----------------------------------------------------------------------------------------------
---------------------------------- [STORE PROCEDURE] ------------------------------------------
-----------------------------------------------------------------------------------------------

CREATE PROC dangky
@tk varchar(50), @mk varchar(100), @name nvarchar(50)
AS
INSERT INTO dbo.tblTK
        ( emailTK ,
          passwordTK ,
          quyen ,
          nickname,
          ngaytao,
          imgTK
        )
VALUES  ( @tk , -- emailTK - varchar(50)
          @mk , -- passwordTK - varchar(100)
          0 , -- quyen - int
          @name,  -- nickname - nvarchar(50)
          GETDATE(),
          '\img\tkdefault.jpg'
        )
GO

CREATE PROC dangnhap
@tk varchar(50), @mk varchar(100)
AS
SELECT idTK,nickname,quyen, imgTK
FROM dbo.tblTK
WHERE emailTK = @tk
AND passwordTK = @mk
GO

CREATE PROC sp_insert_tg
@ten NVARCHAR(100), @img NVARCHAR(100), @tgVN BIT, @tgDG NVARCHAR(100), @mota NTEXT, @tt BIT
AS
INSERT INTO dbo.tblTG
        ( tenTG, imgTG, tgVN, tgDG, motaTG, tinhtrang, ngaytao )
VALUES  ( @ten, -- tenTG - nvarchar(100)
          @img, -- imgTG - nvarchar(100)
          @tgVN, -- tgVN - bit
          @tgDG, -- tgDG - nvarchar(100)
          @mota,  -- motaTG - ntext
          @tt,
          GETDATE()
          )
GO



CREATE PROC sp_update_tg
@id INT, @ten NVARCHAR(100), @img NVARCHAR(100), @tgVN BIT, @tgDG NVARCHAR(100), @mota NTEXT, @tt BIT
AS
UPDATE dbo.tblTG
SET tenTG = @ten, imgTG = @img, tgVN = @tgVN, tgDG = @tgDG, motaTG = @mota, tinhtrang = @tt
WHERE idTG = @id
GO

CREATE PROC sp_insert_sach
@ten NVARCHAR(100), @img NVARCHAR(100), @gia INT, @mota NTEXT, @dm INT, @tt BIT
AS
INSERT INTO dbo.tblSach
        ( tenSach ,
          imgSach ,
          giaSach ,
          motaSach ,
          daban ,
          daxem ,
          idDM ,
          tinhtrang,
          ngaytao
        )
VALUES  ( @ten , -- tenSach - nvarchar(100)
          @img , -- imgSach - nvarchar(100)
          @gia , -- giaSach - int
          @mota , -- motaSach - ntext
          0 , -- daban - int
          0 , -- daxem - int
          @dm , -- idDM - int
          @tt,  -- tinhtrang - bit
          GETDATE()
        )
GO

CREATE PROC sp_insert_lh
@ten NVARCHAR(100), @mota NTEXT, @tinhtrang BIT
AS
INSERT INTO dbo.tblLH
        ( tenLH, mota, tinhtrang, ngaytao )
VALUES  ( @ten, -- tenLH - nvarchar(100)
          @mota,  -- mota - ntext
          @tinhtrang,
		  GETDATE()
          )
GO
CREATE PROC sp_dm_sach
@madm int
AS
SELECT tenDM, idSach,tenSach, imgSach, giaSach
FROM dbo.tblSach INNER JOIN dbo.tblDM ON tblDM.idDM = tblSach.idDM
WHERE tinhtrang = 1
AND dbo.tblDM.idDM = @madm
GO

