CREATE DATABASE [TunaDemo]
go
use TunaDemo
go

CREATE TABLE [Account](
	[Id] [bigint] primary key IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Password] [nvarchar](32) NULL,
	[Email] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[ResetPasswordCode] [nvarchar](250) NULL,
	[GroupId] [varchar](20) NULL,
	[Status] [bit] NOT NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nvarchar](50) NULL
)
CREATE TABLE [Rate](
	[Content] [nvarchar](500) NULL,
	[Star] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Id] [bigint] IDENTITY(1,1) primary key NOT NULL,
	FOREIGN KEY (UserID) REFERENCES Account(Id)
 )
 CREATE TABLE [Category](
	[Id] [bigint] IDENTITY(1,1) primary key NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [nvarchar](250) NULL,
	[ParentId] [bigint] NULL,
	[DisplayOrder] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [bit] NOT NULL
)
CREATE TABLE [ProductCategory](
	[Id] [bigint] IDENTITY(1,1) primary key NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[MetaTitle] [varchar](50) NULL,
	[ParentId] [bigint] NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
	FOREIGN KEY (ParentId) REFERENCES Category(Id)
)
CREATE TABLE [Gallery](
	[Id] [bigint] IDENTITY(1,1) primary key NOT NULL,
	[Image1] [nvarchar](250) NULL,
	[Image2] [nvarchar](250) NULL,
	[Image3] [nvarchar](250) NULL,
	[ProductId] [bigint] NULL
)
 CREATE TABLE [Product](
	[Id] [bigint] IDENTITY(1,1) primary key NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](250) NULL,
	[Price] [decimal](18, 0) NULL,
	[Promotion] [int] NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[CategoryId] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[GalleryId] [bigint] NULL,
	[Details] [nvarchar](max) NULL,
	[OriginalPrice] [decimal](18, 0) NULL,
	[RateId] [bigint] NOT NULL,
	FOREIGN KEY (RateId) REFERENCES Rate(Id),
	FOREIGN KEY (CategoryId) REFERENCES ProductCategory(Id),
	FOREIGN KEY (GalleryId) REFERENCES Gallery(Id)
)
CREATE TABLE [Size](
	[Id] [bigint] IDENTITY(1,1) primary key NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NULL
)
CREATE TABLE [ProductSize](
	[ProductId] [bigint] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	[Stock] [int] NOT NULL,
	Primary key(ProductId, SizeId),
	FOREIGN KEY (ProductId) REFERENCES Product(Id),
	FOREIGN KEY (SizeId) REFERENCES Size(Id)
)
CREATE TABLE [Order](
	[PaymentMethod] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[DeliveryDate] [datetime] NULL,
	[DeliveryAddress] [nvarchar](200) NULL,
	[CustomerId] [bigint] NOT NULL,
	[Id] [bigint] IDENTITY(1,1) primary key NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL
)
CREATE TABLE [OrderDetail](
	[Id] [bigint] IDENTITY(1,1) primary key NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[TotalQuantity] [int] NOT NULL,
	[TotalPrice] [decimal](18, 2) NULL,
	[Status] [int] NOT NULL,
	[SizeId] [bigint] NOT NULL,
	FOREIGN KEY (OrderId) REFERENCES [Order](Id),
	FOREIGN KEY (ProductId) REFERENCES Product(Id),
	FOREIGN KEY (SizeId) REFERENCES Size(Id)
)
CREATE TABLE [Content](
	[Id] [bigint] IDENTITY(1,1) primary key NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[Tags] [nvarchar](500) NULL,
	[CategoryId] [bigint] NULL,
	[Detail] [nvarchar](max) NULL,
	FOREIGN KEY (CategoryId) REFERENCES ProductCategory(Id)
)
CREATE TABLE [Tag](
	[Id] [varchar](50) primary key NOT NULL,
	[Name] [nvarchar](50) NULL
)
CREATE TABLE [ContentTag](
	[ContentId] [bigint] NOT NULL,
	[TagId] [varchar](50) NOT NULL,
	primary key(ContentId, TagId),
	FOREIGN KEY (ContentId) REFERENCES Content(Id),
	FOREIGN KEY (TagId) REFERENCES Tag(Id)
)
CREATE TABLE [Menu](
	[Id] [int] IDENTITY(1,1) primary key NOT NULL,
	[Text] [nvarchar](50) NULL,
	[Link] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[Target] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL
)
CREATE TABLE [Slide](
	[Id] [bigint] IDENTITY(1,1) primary key NOT NULL,
	[Image] [nvarchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[Link] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL
)
CREATE TABLE [Feedback](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[Address] [nvarchar](200) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Name] [nvarchar](150) NULL
)