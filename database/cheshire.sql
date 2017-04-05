USE master
IF DB_ID('cheshire') IS NOT NULL
	DROP DATABASE cheshire
GO
CREATE DATABASE cheshire
GO
USE cheshire

CREATE TABLE tblDM
(
	idDM INT IDENTITY(1,1) PRIMARY KEY,
	tenDM NVARCHAR(100)
)
GO

CREATE TABLE tblTG
(
	idTG INT IDENTITY(1,1) PRIMARY KEY,
	tenTG NVARCHAR(100),
	imgTG NVARCHAR(100),
	tgVN BIT DEFAULT 1, -- tác giả việt nam = 1
	tgDG NVARCHAR(100) DEFAULT N'', -- tác giả đạt giải
	motaTG NTEXT,
	tinhtrang BIT DEFAULT 1,
	ngaytao DATE
)
GO

CREATE TABLE tblSach
(
	idSach INT IDENTITY(1,1) PRIMARY KEY,
	tenSach NVARCHAR(100),
	imgSach NVARCHAR(100),
	giaSach INT DEFAULT 0,
	motaSach NTEXT,
	daban INT DEFAULT 0,
	daxem INT DEFAULT 0,
	idDM INT FOREIGN KEY REFERENCES dbo.tblDM(idDM),
	tinhtrang BIT DEFAULT (1), -- còn hàng = 1
	ngaytao DATE
)
GO
CREATE TABLE tbl_TG_Sach
(
	idTG INT REFERENCES dbo.tblTG(idTG) NOT NULL,
	idSach INT REFERENCES dbo.tblSach(idSach) NOT NULL,
	PRIMARY KEY(idTG,idSach)
)
GO
CREATE TABLE tblTK (
	idTK INT IDENTITY(1,1) PRIMARY KEY,
	nickname NVARCHAR(50),
	emailTK VARCHAR(50) UNIQUE,
	passwordTK VARCHAR(100) NOT NULL,
	quyen int DEFAULT(0) NOT NULL,
	ngaytao DATE,
	imgTK NVARCHAR(100)
)
GO

CREATE TABLE tblLH (
	idLH INT IDENTITY(1,1) PRIMARY KEY,
	tenLH NVARCHAR(100),
	mota NTEXT,
	tinhtrang BIT DEFAULT(1),
	ngaytao DATE
)
GO
CREATE TABLE tblHoaDon (
	idHD INT IDENTITY(1,1) PRIMARY KEY,
	ngaytao datetime,
	chuthich NVARCHAR(100),
	diachi NVARCHAR(100),
	sdt varchar(15),
	tongtien float,
	idTK int FOREIGN KEY REFERENCES dbo.tblTK,
	trangthai int DEFAULT(0),-- Chua xac nhan don hang thi la 0 xacnhan da nhan la 1 xac nhan da thanh toan la 2
)
GO

create table tbl_CTHD(
	idHD int  REFERENCES dbo.tblHoaDon ,
	idSach int  REFERENCES dbo.tblSach,
	giaSach INT,
	Soluong int,
	primary key (idHD,idSach),
)
GO
