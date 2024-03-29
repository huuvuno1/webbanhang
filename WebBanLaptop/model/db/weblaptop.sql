USE [weblaptop]
GO
/****** Object:  Table [dbo].[tbl_category]    Script Date: 4/18/2023 2:24:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_image]    Script Date: 4/18/2023 2:24:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_image](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[path] [varchar](500) NOT NULL,
	[product_id] [int] NULL,
 CONSTRAINT [PK_tbl_image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order]    Script Date: 4/18/2023 2:24:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[phone_number] [nchar](10) NOT NULL,
	[customer_name] [nvarchar](200) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[delivery_status] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbl_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order_detail]    Script Date: 4/18/2023 2:24:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[order_id] [int] NOT NULL,
 CONSTRAINT [PK_tbl_order_detail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 4/18/2023 2:24:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[slug] [nchar](100) NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[description] [text] NULL,
	[status] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbl_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 4/18/2023 2:24:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[fullname] [nvarchar](70) NULL,
	[password] [varchar](50) NOT NULL,
	[role] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbl_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_order_detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_order_detail_tbl_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbl_order] ([id])
GO
ALTER TABLE [dbo].[tbl_order_detail] CHECK CONSTRAINT [FK_tbl_order_detail_tbl_order]
GO
ALTER TABLE [dbo].[tbl_order_detail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_order_detail_tbl_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[tbl_product] ([id])
GO
ALTER TABLE [dbo].[tbl_order_detail] CHECK CONSTRAINT [FK_tbl_order_detail_tbl_product]
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_product_tbl_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[tbl_category] ([id])
GO
ALTER TABLE [dbo].[tbl_product] CHECK CONSTRAINT [FK_tbl_product_tbl_category]
GO


-- update product columns

ALTER TABLE weblaptop.dbo.tbl_product ADD brand nvarchar(100) NULL;
ALTER TABLE weblaptop.dbo.tbl_product ADD oldPrice float NULL;
ALTER TABLE weblaptop.dbo.tbl_product ADD cpu varchar(100) NULL;
ALTER TABLE weblaptop.dbo.tbl_product ADD ram varchar(100) NULL;
ALTER TABLE weblaptop.dbo.tbl_product ADD hardDrive varchar(100) NULL;
ALTER TABLE weblaptop.dbo.tbl_product ADD weight float NULL;
ALTER TABLE weblaptop.dbo.tbl_product ADD screen varchar(100) NULL;
ALTER TABLE weblaptop.dbo.tbl_product ADD type varchar(100) NULL;
ALTER TABLE weblaptop.dbo.tbl_product ADD img varchar(100) NULL;


ALTER TABLE weblaptop.dbo.tbl_order ADD note varchar(100) NULL;
ALTER TABLE weblaptop.dbo.tbl_order ADD email varchar(100) NULL;
ALTER TABLE weblaptop.dbo.tbl_order ADD createdAt datetime DEFAULT GETDATE() NULL;
ALTER TABLE weblaptop.dbo.tbl_order ADD updatedAt datetime DEFAULT GETDATE() NULL;
ALTER TABLE weblaptop.dbo.tbl_order ALTER COLUMN phone_number nchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL;

ALTER PROC [dbo].[GetProcductCategoryData]
AS
BEGIN
	select * from [dbo].[tbl_product] order by id desc
END

update tbl_product set oldPrice = 0, weight = 0;

ALTER PROC [dbo].[UpdateProductByID]
@id int,
@name nvarchar(200),
@price int,
@quantity int,
@description text,
@brand nvarchar(100),
@oldPrice int,
@cpu varchar(100),
@ram varchar(100),
@hardDrive varchar(100),
@weight float,
@screen varchar(100),
@type varchar(100),
@img varchar(100)
AS
BEGIN
	update [dbo].[tbl_product]
	set name = @name, price = @price,
	quantity = @quantity, description = @description,
	brand = @brand, oldPrice = @oldPrice, cpu = @cpu,
	ram = @ram, hardDrive = @hardDrive, weight = @weight,
	screen = @screen, type = @type, img = @img
	where id = @id
END

CREATE PROC [dbo].[getOrderDetail]
@order_id int
AS
BEGIN
	SELECT od.*, p.name as name_product, p.price as price_product, p.quantity as quantity_product FROM [dbo].[tbl_order_detail] od inner join [dbo].[tbl_product] p 
	ON od.product_id = p.id WHERE order_id = @order_id
END

ALTER TABLE [dbo].[tbl_product] ADD DEFAULT 0 FOR weight
ALTER TABLE [dbo].[tbl_product] ADD DEFAULT 0 FOR oldPrice

ALTER TABLE [dbo].[tbl_product]
DROP CONSTRAINT FK_tbl_product_tbl_category;

ALTER TABLE [dbo].[tbl_product]
DROP COLUMN category_id;

CREATE PROC [dbo].[getOrdersByNamOrPhone]
@input nvarchar(200)
AS
BEGIN
	SELECT * FROM [dbo].[tbl_order] WHERE customer_name LIKE '%' + ISNULL(@input, customer_name) + '%'
	OR phone_number LIKE '%' + ISNULL(@input, phone_number) + '%'
END

ALTER PROC [dbo].[sumPriceOrder]
@order_id int
AS
BEGIN
	SELECT SUM(price * quantity) FROM [dbo].[tbl_order_detail] WHERE order_id = @order_id GROUP BY order_id;
END