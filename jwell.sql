USE [master]
GO
/****** Object:  Database [Jwell]    Script Date: 31/03/2017 17:53:25 ******/
CREATE DATABASE [Jwell] ON  PRIMARY 
( NAME = N'JwellShop', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\JwellShop.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JwellShop_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\JwellShop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Jwell] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Jwell].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Jwell] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Jwell] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Jwell] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Jwell] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Jwell] SET ARITHABORT OFF 
GO
ALTER DATABASE [Jwell] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Jwell] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Jwell] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Jwell] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Jwell] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Jwell] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Jwell] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Jwell] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Jwell] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Jwell] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Jwell] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Jwell] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Jwell] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Jwell] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Jwell] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Jwell] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Jwell] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Jwell] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Jwell] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Jwell] SET  MULTI_USER 
GO
ALTER DATABASE [Jwell] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Jwell] SET DB_CHAINING OFF 
GO
USE [Jwell]
GO
/****** Object:  StoredProcedure [dbo].[Insert_Customer]    Script Date: 31/03/2017 17:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,ATUL BHABAL>
-- Create date: <Create Date,,3 MARCH 2017>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_Customer]
      @name NVARCHAR(20),
      @address NVARCHAR(20),
      @mobile NVARCHAR(30),
	  @distributorid NVARCHAR(10),
	  @flag NVARCHAR(20),
	  @id NVARCHAR(20)=null
AS 
BEGIN
      SET NOCOUNT ON;

	 IF @flag='INSERT'
		BEGIN
			IF EXISTS(SELECT id FROM mst_customer WHERE name = @name)
				BEGIN
					SELECT  -1 -- customer exists.
				END
			ELSE
				BEGIN
					INSERT INTO [mst_customer]
								([name]
								,[address]
								,[mobile]
								,[distributor_id]
								,[sts]
								,[createdate])
						VALUES
								(@name
								,@address
								,@mobile
								,@distributorid
								,1
								,GETDATE())
           
					SELECT SCOPE_IDENTITY() -- UserId   
				END
		END
	ELSE
		BEGIN
			IF EXISTS(SELECT id FROM mst_distributor WHERE name = @name)
				BEGIN
					SELECT -1 -- customer exists.
				END
			ELSE
				BEGIN
					UPDATE [mst_customer]
								SET [name]=@name
								,[address]=@address
								,[mobile]=@mobile
								,[distributor_id]=@distributorid
								,[sts]=1
								,[createdate]=GETDATE()
								WHERE id= @id

					SELECT 1
				END
		END

      
END

GO
/****** Object:  StoredProcedure [dbo].[Insert_Distributor]    Script Date: 31/03/2017 17:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,ATUL BHABAL>
-- Create date: <Create Date,,3 MARCH 2017>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_Distributor]
      @name NVARCHAR(20),
      @address NVARCHAR(20),
      @mobile NVARCHAR(30),
	  @flag NVARCHAR(20),
	  @id NVARCHAR(20)=null
AS 
BEGIN
      SET NOCOUNT ON;

	 IF @flag='INSERT'
		BEGIN
			IF EXISTS(SELECT id FROM mst_distributor WHERE name = @name)
				BEGIN
					SELECT  -1 -- distributor exists.
				END
			ELSE
				BEGIN
					INSERT INTO [mst_distributor]
								([name]
								,[address]
								,[mobile]
								,[sts]
								,[createdate])
						VALUES
								(@name
								,@address
								,@mobile
								,1
								,GETDATE())
           
					SELECT SCOPE_IDENTITY() -- UserId   
				END
		END
	ELSE
		BEGIN
			IF EXISTS(SELECT id FROM mst_distributor WHERE name = @name)
				BEGIN
					SELECT -1 -- distributor exists.
				END
			ELSE
				BEGIN
					UPDATE [mst_distributor]
								SET [name]=@name
								,[address]=@address
								,[mobile]=@mobile
								,[sts]=1
								,[createdate]=GETDATE()
								WHERE id= @id

					SELECT 1
				END
		END

      
END

GO
/****** Object:  StoredProcedure [dbo].[Insert_Order]    Script Date: 31/03/2017 17:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_Order] 
	-- Add the parameters for the stored procedure here
		   @userid varchar(100),
           @given_by varchar(100),
           @orderid varchar(50),
           @c_orderid varchar(50),
           @design_number varchar(50),
           @melting varchar(50),
           @pcs numeric(18,0),
           @weight decimal(18,0),
           @size numeric(18,0),
           @format varchar(50),
           @rhodium nvarchar(50),
           @anyother varchar(500),
           @dilivery_date date ,
           @img varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Order]
           ([userid]
           ,[given_by]
           ,[orderid]
           ,[c_orderid]
           ,[design_number]
           ,[melting]
           ,[pcs]
           ,[weight]
           ,[size]
           ,[format]
           ,[rhodium]
           ,[anyother]
           ,[dilivery_date]
           ,[img]
		   ,[CreateDate])
     VALUES
           (@userid, 
           @given_by, 
           @orderid, 
           @c_orderid, 
           @design_number, 
           @melting, 
           @pcs, 
           @weight, 
           @size, 
           @format, 
           @rhodium, 
           @anyother,
           @dilivery_date, 
           @img,
		   GETDATE())

		   SELECT SCOPE_IDENTITY() -- Order id   
END

GO
/****** Object:  StoredProcedure [dbo].[Insert_User]    Script Date: 31/03/2017 17:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,ATUL BHABAL>
-- Create date: <Create Date,,3 MARCH 2017>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Insert_User]
      @username NVARCHAR(20),
      @password NVARCHAR(20),
      @orderid NVARCHAR(30),
	  @role NVARCHAR(30),
	  @status NVARCHAR(30)
AS 
BEGIN
      SET NOCOUNT ON;
      IF EXISTS(SELECT id FROM login WHERE username = @username)
      BEGIN
            SELECT -1 -- Username exists.
      END
      ELSE IF EXISTS(SELECT id FROM login WHERE orderid = @orderid)
      BEGIN
            SELECT -2 -- order id exists.
      END
      ELSE
      BEGIN
            INSERT INTO [login]
                     ([username]
                     ,[password]
                     ,[orderid]
					 ,[role]
                     ,[status]
                     ,[createddate])
            VALUES
                     (@username
                     ,@password
                     ,@orderid
					 ,@role
					 ,@status
                     ,GETDATE())
           
            SELECT SCOPE_IDENTITY() -- UserId                 
     END
END

GO
/****** Object:  Table [dbo].[login]    Script Date: 31/03/2017 17:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](200) NULL,
	[password] [nvarchar](100) NULL,
	[orderid] [nchar](10) NULL,
	[role] [nchar](10) NULL,
	[status] [nchar](10) NULL,
	[distributorid] [numeric](18, 0) NULL,
	[createddate] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[mst_customer]    Script Date: 31/03/2017 17:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mst_customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[address] [varchar](200) NULL,
	[mobile] [numeric](18, 0) NULL,
	[distributor_id] [numeric](18, 0) NULL,
	[sts] [nchar](10) NULL,
	[createdate] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mst_distributor]    Script Date: 31/03/2017 17:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mst_distributor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[address] [varchar](200) NULL,
	[mobile] [numeric](18, 0) NULL,
	[sts] [nchar](10) NULL,
	[createdate] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 31/03/2017 17:53:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [varchar](100) NULL,
	[given_by] [varchar](100) NULL,
	[orderid] [varchar](50) NULL,
	[c_orderid] [varchar](50) NULL,
	[design_number] [varchar](50) NULL,
	[melting] [varchar](50) NULL,
	[pcs] [numeric](18, 0) NULL,
	[weight] [decimal](18, 0) NULL,
	[size] [numeric](18, 0) NULL,
	[format] [varchar](50) NULL,
	[rhodium] [nvarchar](50) NULL,
	[anyother] [varchar](500) NULL,
	[dilivery_date] [date] NULL,
	[img] [varchar](50) NULL,
	[CreateDate] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[login] ON 

INSERT [dbo].[login] ([id], [username], [password], [orderid], [role], [status], [distributorid], [createddate]) VALUES (CAST(1 AS Numeric(18, 0)), N'Trediant pvt ltd', N'1234', N'TN        ', N'client    ', N'Y         ', NULL, CAST(0x8B3C0B00 AS Date))
INSERT [dbo].[login] ([id], [username], [password], [orderid], [role], [status], [distributorid], [createddate]) VALUES (CAST(2 AS Numeric(18, 0)), N'bitcon pvt ltd.', N'1234', N'BT        ', N'client    ', N'Y         ', NULL, CAST(0x943C0B00 AS Date))
INSERT [dbo].[login] ([id], [username], [password], [orderid], [role], [status], [distributorid], [createddate]) VALUES (CAST(3 AS Numeric(18, 0)), N'Suraj', N'1234', N'AD        ', N'admin     ', N'Y         ', NULL, CAST(0x943C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[login] OFF
SET IDENTITY_INSERT [dbo].[mst_customer] ON 

INSERT [dbo].[mst_customer] ([id], [name], [address], [mobile], [distributor_id], [sts], [createdate]) VALUES (1, N'MANSA JEW1', N'Mulund', CAST(9664597377 AS Numeric(18, 0)), CAST(1 AS Numeric(18, 0)), N'1         ', CAST(0xA13C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[mst_customer] OFF
SET IDENTITY_INSERT [dbo].[mst_distributor] ON 

INSERT [dbo].[mst_distributor] ([id], [name], [address], [mobile], [sts], [createdate]) VALUES (1, N'JN JEW', N'Mulund', CAST(9664597377 AS Numeric(18, 0)), N'1         ', CAST(0xA13C0B00 AS Date))
INSERT [dbo].[mst_distributor] ([id], [name], [address], [mobile], [sts], [createdate]) VALUES (2, N'ABHISHEK C', N'Mulund', CAST(9664597377 AS Numeric(18, 0)), N'1         ', CAST(0xA03C0B00 AS Date))
INSERT [dbo].[mst_distributor] ([id], [name], [address], [mobile], [sts], [createdate]) VALUES (3, N'SACHI', N'Malad', CAST(9664597377 AS Numeric(18, 0)), N'1         ', CAST(0xA03C0B00 AS Date))
INSERT [dbo].[mst_distributor] ([id], [name], [address], [mobile], [sts], [createdate]) VALUES (4, N'EXIHIBITION A', N'Mala', CAST(9664597377 AS Numeric(18, 0)), N'1         ', CAST(0xA13C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[mst_distributor] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [userid], [given_by], [orderid], [c_orderid], [design_number], [melting], [pcs], [weight], [size], [format], [rhodium], [anyother], [dilivery_date], [img], [CreateDate]) VALUES (1, N'Trediant pvt ltd', N'Atul', N'TN1', N'7476', N'687', N'75', CAST(2 AS Numeric(18, 0)), CAST(8758 AS Decimal(18, 0)), CAST(76 AS Numeric(18, 0)), N'OSCAR', N'YES', N'gfxn', CAST(0x9A3C0B00 AS Date), N'article-img-eleven-plus-01.jpg', CAST(0x923C0B00 AS Date))
INSERT [dbo].[Order] ([id], [userid], [given_by], [orderid], [c_orderid], [design_number], [melting], [pcs], [weight], [size], [format], [rhodium], [anyother], [dilivery_date], [img], [CreateDate]) VALUES (2, N'Trediant pvt ltd', N'Chirag', N'TN2', N'3462', N'32324', N'8350', CAST(4 AS Numeric(18, 0)), CAST(3434 AS Decimal(18, 0)), CAST(34 AS Numeric(18, 0)), N'NA', N'YES', N'235 gs fdsg', CAST(0xA23C0B00 AS Date), N'article-img-spanish-01.jpg', CAST(0x923C0B00 AS Date))
INSERT [dbo].[Order] ([id], [userid], [given_by], [orderid], [c_orderid], [design_number], [melting], [pcs], [weight], [size], [format], [rhodium], [anyother], [dilivery_date], [img], [CreateDate]) VALUES (3, N'bitcon pvt ltd.', N'Parag', N'BT1', N'3462', N'32324', N'8350', CAST(234 AS Numeric(18, 0)), CAST(8758 AS Decimal(18, 0)), CAST(76 AS Numeric(18, 0)), N'PN BUDH', N'YES', N'gfxn', CAST(0x9A3C0B00 AS Date), N'noimage.jpg', CAST(0x973C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Order] OFF
USE [master]
GO
ALTER DATABASE [Jwell] SET  READ_WRITE 
GO
