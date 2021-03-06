USE [ShoesShop]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/14/2020 5:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeyWords] [nvarchar](250) NULL,
	[MetaDiscriptions] [varchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 5/14/2020 5:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Display] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 5/14/2020 5:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [ntext] NULL,
	[Type] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 5/14/2020 5:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[ExpirationDate] [datetime] NULL,
	[Status] [int] NULL,
	[Value] [int] NULL,
 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedBack]    Script Date: 5/14/2020 5:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedBack](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Content] [ntext] NULL,
	[CreateDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Footer]    Script Date: 5/14/2020 5:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footer](
	[ID] [nvarchar](50) NOT NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Footer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 5/14/2020 5:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Link] [nvarchar](500) NULL,
	[IsAvatar] [bit] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 5/14/2020 5:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ProductID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Order_1] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 5/14/2020 5:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CreateDate] [datetime] NULL,
	[CouponID] [int] NULL,
	[CustomerID] [int] NULL,
	[ShipName] [nvarchar](500) NULL,
	[ShipMobile] [varchar](50) NULL,
	[ShipAddress] [nvarchar](500) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[AccessCode] [nchar](10) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_OrderDetail_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 5/14/2020 5:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Image] [nvarchar](500) NULL,
	[Size] [int] NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [ntext] NULL,
	[Price] [decimal](18, 0) NULL,
	[PromotionPrice] [decimal](18, 0) NULL,
	[Quantity] [int] NULL,
	[Color] [int] NULL,
	[CategoryID] [int] NULL,
	[TypeID] [int] NULL,
	[Detail] [ntext] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [int] NULL,
	[MetaKeyWords] [nvarchar](250) NULL,
	[MetaDiscriptions] [varchar](50) NULL,
	[ViewCount] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 5/14/2020 5:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[DisplayOrder] [int] NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[MetaKeyWords] [nvarchar](250) NULL,
	[MetaDiscriptions] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 5/14/2020 5:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Images] [nvarchar](50) NULL,
	[DisplayOrder] [int] NULL,
	[Link] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 5/14/2020 5:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/14/2020 5:14:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[Type] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDiscriptions], [Status]) VALUES (1, N'Nike', N'nike', 1, CAST(N'2020-03-31T19:53:28.110' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDiscriptions], [Status]) VALUES (2, N'Adidas', N'adidas', 2, CAST(N'2020-03-31T19:53:46.833' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDiscriptions], [Status]) VALUES (3, N'Merrel', N'merrel', 3, CAST(N'2020-03-31T19:53:56.663' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDiscriptions], [Status]) VALUES (4, N'Gucci', N'gucci', 4, CAST(N'2020-03-31T19:54:04.010' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDiscriptions], [Status]) VALUES (5, N'Skechers', N'skechers', 5, CAST(N'2020-03-31T19:54:15.477' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Category] ([ID], [Name], [MetaTitle], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDiscriptions], [Status]) VALUES (6, N'Converse', N'converse', 6, CAST(N'2020-03-31T19:54:38.363' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([ID], [Name], [Display]) VALUES (1, N'Black', 1)
INSERT [dbo].[Color] ([ID], [Name], [Display]) VALUES (2, N'White', 2)
INSERT [dbo].[Color] ([ID], [Name], [Display]) VALUES (3, N'Blue', 3)
INSERT [dbo].[Color] ([ID], [Name], [Display]) VALUES (4, N'Red', 4)
INSERT [dbo].[Color] ([ID], [Name], [Display]) VALUES (5, N'Green', 5)
INSERT [dbo].[Color] ([ID], [Name], [Display]) VALUES (6, N'Grey', 6)
INSERT [dbo].[Color] ([ID], [Name], [Display]) VALUES (7, N'Orange', 7)
INSERT [dbo].[Color] ([ID], [Name], [Display]) VALUES (8, N'Cream', 8)
INSERT [dbo].[Color] ([ID], [Name], [Display]) VALUES (9, N'Brown', 9)
SET IDENTITY_INSERT [dbo].[Color] OFF
SET IDENTITY_INSERT [dbo].[Contact] ON 

INSERT [dbo].[Contact] ([ID], [Content], [Type], [Status]) VALUES (1, N'198 West 21th Street, <br> Suite 721 New York NY 10016', 1, 1)
INSERT [dbo].[Contact] ([ID], [Content], [Type], [Status]) VALUES (2, N'0365469543', 2, 1)
INSERT [dbo].[Contact] ([ID], [Content], [Type], [Status]) VALUES (3, N'viettqhe130524@fpt.edu.vn', 3, 1)
INSERT [dbo].[Contact] ([ID], [Content], [Type], [Status]) VALUES (4, N'facebock.com', 4, 1)
SET IDENTITY_INSERT [dbo].[Contact] OFF
SET IDENTITY_INSERT [dbo].[Coupon] ON 

INSERT [dbo].[Coupon] ([ID], [Code], [CreateDate], [ExpirationDate], [Status], [Value]) VALUES (1, N'vietdz                                                                                              ', CAST(N'2020-03-23T05:56:51.557' AS DateTime), CAST(N'2020-06-05T00:00:00.000' AS DateTime), 1, 20)
INSERT [dbo].[Coupon] ([ID], [Code], [CreateDate], [ExpirationDate], [Status], [Value]) VALUES (2, N'yeuduong                                                                                            ', CAST(N'2020-03-23T05:57:21.730' AS DateTime), CAST(N'2020-10-10T00:00:00.000' AS DateTime), 1, 70)
SET IDENTITY_INSERT [dbo].[Coupon] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([ID], [ProductID], [Link], [IsAvatar], [Status]) VALUES (1, 1, N'item-1.jpg', 1, 1)
INSERT [dbo].[Images] ([ID], [ProductID], [Link], [IsAvatar], [Status]) VALUES (2, 2, N'item-2.jpg', 1, 1)
INSERT [dbo].[Images] ([ID], [ProductID], [Link], [IsAvatar], [Status]) VALUES (3, 3, N'item-3.jpg', 1, 1)
INSERT [dbo].[Images] ([ID], [ProductID], [Link], [IsAvatar], [Status]) VALUES (4, 4, N'item-4.jpg', 1, 1)
INSERT [dbo].[Images] ([ID], [ProductID], [Link], [IsAvatar], [Status]) VALUES (5, 5, N'item-5.jpg', 1, 1)
INSERT [dbo].[Images] ([ID], [ProductID], [Link], [IsAvatar], [Status]) VALUES (6, 6, N'item-6.jpg', 1, 1)
INSERT [dbo].[Images] ([ID], [ProductID], [Link], [IsAvatar], [Status]) VALUES (7, 7, N'item-7.jpg', 1, 1)
INSERT [dbo].[Images] ([ID], [ProductID], [Link], [IsAvatar], [Status]) VALUES (8, 8, N'item-8.jpg', 1, 1)
INSERT [dbo].[Images] ([ID], [ProductID], [Link], [IsAvatar], [Status]) VALUES (9, 9, N'item-9.jpg', 1, 1)
INSERT [dbo].[Images] ([ID], [ProductID], [Link], [IsAvatar], [Status]) VALUES (10, 10, N'item-10.jpg', 1, 1)
INSERT [dbo].[Images] ([ID], [ProductID], [Link], [IsAvatar], [Status]) VALUES (11, 11, N'item-11.jpg', 1, 1)
INSERT [dbo].[Images] ([ID], [ProductID], [Link], [IsAvatar], [Status]) VALUES (12, 12, N'item-12.jpg', 1, 1)
INSERT [dbo].[Images] ([ID], [ProductID], [Link], [IsAvatar], [Status]) VALUES (13, 13, N'item-13.jpg', 1, 1)
INSERT [dbo].[Images] ([ID], [ProductID], [Link], [IsAvatar], [Status]) VALUES (14, 14, N'item-14.jpg', 1, 1)
INSERT [dbo].[Images] ([ID], [ProductID], [Link], [IsAvatar], [Status]) VALUES (15, 15, N'item-15.jpg', 1, 1)
INSERT [dbo].[Images] ([ID], [ProductID], [Link], [IsAvatar], [Status]) VALUES (16, 16, N'item-16.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[Images] OFF
INSERT [dbo].[Order] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (7, 1, 1, CAST(86 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (13, 4, 1, CAST(117 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (16, 1, 1, CAST(116 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (16, 2, 4, CAST(116 AS Decimal(18, 0)))
INSERT [dbo].[Order] ([ProductID], [OrderID], [Quantity], [Price]) VALUES (16, 5, 2, CAST(116 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([ID], [CreateDate], [CouponID], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [AccessCode], [Status]) VALUES (1, NULL, NULL, 1, N'Minh Dương', N'0365469543', N'Hưng Yên', N'mv.taikhoanmoi@gmail.com', N'MK00      ', 1)
INSERT [dbo].[OrderDetail] ([ID], [CreateDate], [CouponID], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [AccessCode], [Status]) VALUES (2, CAST(N'2020-04-02T16:51:11.563' AS DateTime), 1, 1, N'Minh Dương', N'0365469543', N'Hưng Yên', N'mv.taikhoanmoi@gmail.com', N'MK00      ', 0)
INSERT [dbo].[OrderDetail] ([ID], [CreateDate], [CouponID], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [AccessCode], [Status]) VALUES (3, CAST(N'2020-04-02T16:51:11.947' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, N'MK00      ', 3)
INSERT [dbo].[OrderDetail] ([ID], [CreateDate], [CouponID], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [AccessCode], [Status]) VALUES (4, CAST(N'2020-04-02T16:53:52.987' AS DateTime), NULL, 2, N'Trần Việt', NULL, N'Hưng Yên', N'viettqhe130524@fpt.edu.vn', N'MK00      ', 2)
INSERT [dbo].[OrderDetail] ([ID], [CreateDate], [CouponID], [CustomerID], [ShipName], [ShipMobile], [ShipAddress], [ShipEmail], [AccessCode], [Status]) VALUES (5, CAST(N'2020-04-02T18:14:32.203' AS DateTime), NULL, 1, N'Minh Dương', N'0365469543', N'Hưng Yên', N'mv.taikhoanmoi@gmail.com', N'MK00      ', 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [Image], [Size], [MetaTitle], [Description], [Price], [PromotionPrice], [Quantity], [Color], [CategoryID], [TypeID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [MetaKeyWords], [MetaDiscriptions], [ViewCount]) VALUES (1, N'Women''s Boots Shoes Maca', N'item-1.jpg', 37, NULL, N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', CAST(139 AS Decimal(18, 0)), CAST(10 AS Decimal(18, 0)), 3, 1, 1, 1, N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>', CAST(N'2020-03-14T00:00:00.000' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [Image], [Size], [MetaTitle], [Description], [Price], [PromotionPrice], [Quantity], [Color], [CategoryID], [TypeID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [MetaKeyWords], [MetaDiscriptions], [ViewCount]) VALUES (2, N'Women''s Minam Meaghan', N'item-2.jpg', 38, NULL, N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', CAST(139 AS Decimal(18, 0)), CAST(17 AS Decimal(18, 0)), 2, 2, 6, 2, N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>', CAST(N'2020-03-14T15:42:38.160' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, CAST(14 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [Image], [Size], [MetaTitle], [Description], [Price], [PromotionPrice], [Quantity], [Color], [CategoryID], [TypeID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [MetaKeyWords], [MetaDiscriptions], [ViewCount]) VALUES (3, N'Men''s Taja Commissioner', N'item-3.jpg', 39, NULL, N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life', CAST(139 AS Decimal(18, 0)), NULL, 2, 3, 2, 4, N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>', CAST(N'2020-03-14T15:43:38.050' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, CAST(231 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [Image], [Size], [MetaTitle], [Description], [Price], [PromotionPrice], [Quantity], [Color], [CategoryID], [TypeID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [MetaKeyWords], [MetaDiscriptions], [ViewCount]) VALUES (4, N'Russ Men''s Sneakers', N'item-4.jpg', 37, NULL, N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', CAST(123 AS Decimal(18, 0)), NULL, 7, 4, 2, 4, N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>', CAST(N'2020-03-14T15:44:00.080' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, CAST(32 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [Image], [Size], [MetaTitle], [Description], [Price], [PromotionPrice], [Quantity], [Color], [CategoryID], [TypeID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [MetaKeyWords], [MetaDiscriptions], [ViewCount]) VALUES (5, N'Women''s Boots Shoes Maca', N'item-5.jpg', 38, NULL, N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', CAST(126 AS Decimal(18, 0)), CAST(3 AS Decimal(18, 0)), 3, 5, 1, 1, N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>', CAST(N'2020-03-14T15:44:40.793' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, CAST(42 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [Image], [Size], [MetaTitle], [Description], [Price], [PromotionPrice], [Quantity], [Color], [CategoryID], [TypeID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [MetaKeyWords], [MetaDiscriptions], [ViewCount]) VALUES (6, N'Russ Men''s Sneakers', N'item-6.jpg', 37, NULL, N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', CAST(123 AS Decimal(18, 0)), NULL, 2, 1, 3, 2, N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>', CAST(N'2020-03-14T15:44:54.570' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [Image], [Size], [MetaTitle], [Description], [Price], [PromotionPrice], [Quantity], [Color], [CategoryID], [TypeID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [MetaKeyWords], [MetaDiscriptions], [ViewCount]) VALUES (7, N'Men''s Taja Commissioner', N'item-7.jpg', 38, NULL, N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', CAST(124 AS Decimal(18, 0)), CAST(31 AS Decimal(18, 0)), 4, 2, 5, 3, N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>', CAST(N'2020-03-14T15:45:57.790' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, CAST(32 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [Image], [Size], [MetaTitle], [Description], [Price], [PromotionPrice], [Quantity], [Color], [CategoryID], [TypeID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [MetaKeyWords], [MetaDiscriptions], [ViewCount]) VALUES (8, N'Men''s Taja Commissioner', N'item-8.jpg', 38, NULL, N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', CAST(41 AS Decimal(18, 0)), NULL, 4, 3, 4, 3, N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>', CAST(N'2020-03-14T15:46:25.993' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, CAST(32 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [Image], [Size], [MetaTitle], [Description], [Price], [PromotionPrice], [Quantity], [Color], [CategoryID], [TypeID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [MetaKeyWords], [MetaDiscriptions], [ViewCount]) VALUES (9, N'Russ Men''s Sneakers', N'item-9.jpg', 40, NULL, N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', CAST(321 AS Decimal(18, 0)), NULL, 2, 4, 4, 4, N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>', CAST(N'2020-03-14T15:46:27.977' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, CAST(421 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [Image], [Size], [MetaTitle], [Description], [Price], [PromotionPrice], [Quantity], [Color], [CategoryID], [TypeID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [MetaKeyWords], [MetaDiscriptions], [ViewCount]) VALUES (10, N'Women''s Boots Shoes Maca', N'item-10.jpg', 38, NULL, N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', CAST(234 AS Decimal(18, 0)), CAST(43 AS Decimal(18, 0)), 7, 2, 1, 3, N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>', CAST(N'2020-03-14T15:46:32.103' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, CAST(42 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [Image], [Size], [MetaTitle], [Description], [Price], [PromotionPrice], [Quantity], [Color], [CategoryID], [TypeID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [MetaKeyWords], [MetaDiscriptions], [ViewCount]) VALUES (11, N'Russ Men''s Sneakers', N'item-11.jpg', 40, NULL, N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', CAST(131 AS Decimal(18, 0)), NULL, 3, 4, 2, 3, N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>', CAST(N'2020-03-14T15:54:02.310' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, CAST(423 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [Image], [Size], [MetaTitle], [Description], [Price], [PromotionPrice], [Quantity], [Color], [CategoryID], [TypeID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [MetaKeyWords], [MetaDiscriptions], [ViewCount]) VALUES (12, N'Russ Men''s Sneakers', N'item-12.jpg', 40, NULL, N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', CAST(213 AS Decimal(18, 0)), NULL, 5, 5, 1, 2, N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>', CAST(N'2020-03-14T15:54:08.760' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, CAST(24 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [Image], [Size], [MetaTitle], [Description], [Price], [PromotionPrice], [Quantity], [Color], [CategoryID], [TypeID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [MetaKeyWords], [MetaDiscriptions], [ViewCount]) VALUES (13, N'Men''s Taja Commissioner', N'item-13.jpg', 39, NULL, N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', CAST(123 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), 2, 6, 3, 4, N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>', CAST(N'2020-03-14T15:54:11.157' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, CAST(1234 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [Image], [Size], [MetaTitle], [Description], [Price], [PromotionPrice], [Quantity], [Color], [CategoryID], [TypeID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [MetaKeyWords], [MetaDiscriptions], [ViewCount]) VALUES (14, N'Men''s Taja Commissioner', N'item-14.jpg', 40, NULL, N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', CAST(413 AS Decimal(18, 0)), NULL, 4, 6, 1, 4, N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>', CAST(N'2020-03-14T15:54:15.540' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, CAST(23 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [Image], [Size], [MetaTitle], [Description], [Price], [PromotionPrice], [Quantity], [Color], [CategoryID], [TypeID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [MetaKeyWords], [MetaDiscriptions], [ViewCount]) VALUES (15, N'Russ Men''s Sneakers', N'item-15.jpg', 41, NULL, N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', CAST(124 AS Decimal(18, 0)), NULL, 6, 4, 2, 2, N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>', CAST(N'2020-03-14T15:54:18.353' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, CAST(12 AS Decimal(18, 0)))
INSERT [dbo].[Product] ([ID], [Name], [Image], [Size], [MetaTitle], [Description], [Price], [PromotionPrice], [Quantity], [Color], [CategoryID], [TypeID], [Detail], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status], [MetaKeyWords], [MetaDiscriptions], [ViewCount]) VALUES (16, N'Men''s Taja Commissioner', N'item-16.jpg', 41, NULL, N'Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.', CAST(123 AS Decimal(18, 0)), CAST(6 AS Decimal(18, 0)), 7, 2, 1, 3, N'<p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
                                    <p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
                                    <ul>
                                        <li>The Big Oxmox advised her not to do so</li>
                                        <li>Because there were thousands of bad Commas</li>
                                        <li>Wild Question Marks and devious Semikoli</li>
                                        <li>She packed her seven versalia</li>
                                        <li>tial into the belt and made herself on the way.</li>
                                    </ul>', CAST(N'2020-03-14T15:54:20.013' AS DateTime), NULL, NULL, NULL, 1, NULL, NULL, CAST(3213 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDiscriptions], [Status]) VALUES (1, N'Boots', N'boots', 1, CAST(N'2020-03-31T20:09:29.337' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDiscriptions], [Status]) VALUES (2, N'Sandals', N'Sandals', 2, CAST(N'2020-03-31T20:09:39.733' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDiscriptions], [Status]) VALUES (3, N'Oxfords', N'Oxfords', 4, CAST(N'2020-03-31T20:09:47.880' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDiscriptions], [Status]) VALUES (4, N'Slip Ons', N'slip-ons', 3, CAST(N'2020-03-31T20:10:13.497' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[ProductCategory] ([ID], [Name], [MetaTitle], [DisplayOrder], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [MetaDiscriptions], [Status]) VALUES (5, N'Lace Ups', N'lace-ups', 5, CAST(N'2020-03-31T20:10:30.457' AS DateTime), NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Images], [DisplayOrder], [Link], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'img_bg_1.jpg', 1, N'#', N'<h1 class="head-1">Men''s</h1>
                                    <h2 class="head-2">Shoes</h2>
                                    <h2 class="head-3">Collection</h2>
                                    <p class="category"><span>New trending shoes</span></p>', CAST(N'2020-03-17T16:11:21.473' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Slide] ([ID], [Images], [DisplayOrder], [Link], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, N'img_bg_2.jpg', 2, N'#', N'<h1 class="head-1">Huge</h1>
                                    <h2 class="head-2">Sale</h2>
                                    <h2 class="head-3"><strong class="font-weight-bold">50%</strong> Off</h2>
                                    <p class="category"><span>Big sale sandals</span></p>', CAST(N'2020-03-17T16:14:36.270' AS DateTime), NULL, NULL, NULL, NULL)
INSERT [dbo].[Slide] ([ID], [Images], [DisplayOrder], [Link], [Description], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N'img_bg_3.jpg', 3, N'#', N'<h1 class="head-1">New</h1>
                                    <h2 class="head-2">Arrival</h2>
                                    <h2 class="head-3">up to <strong class="font-weight-bold">30%</strong> off</h2>
                                    <p class="category"><span>New stylish shoes for men</span></p>', CAST(N'2020-03-17T16:15:08.990' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [Type], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'duong', N'202CB962AC59075B964B07152D234B70', 0, N'Minh Dương', N'Hưng Yên', N'mv.taikhoanmoi@gmail.com', N'0365469543', CAST(N'2020-03-28T21:20:41.330' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Type], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'viet', N'202CB962AC59075B964B07152D234B70', 1, N'Trần Việt', N'Hưng Yên', N'viettqhe130524@fpt.edu.vn', NULL, CAST(N'2020-03-28T21:22:28.613' AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Type], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'viet1', N'123456', 2, N'trần việt', N'doan dao', N'viet@gmail.com', N'123', CAST(N'2020-04-02T14:35:47.430' AS DateTime), N'viet1', NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [Type], [Name], [Address], [Email], [Phone], [CreateDate], [CreateBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'viet12', N'E10ADC3949BA59ABBE56E057F20F883E', 2, N'trần việt', N'đoàn đào', N'viet1@gmail.com', N'123456', CAST(N'2020-04-02T14:43:37.977' AS DateTime), N'viet12', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Coupon] ADD  CONSTRAINT [DF_Coupon_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Coupon] ADD  CONSTRAINT [DF_Coupon_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Coupon] ADD  CONSTRAINT [DF_Coupon_Value]  DEFAULT ((10)) FOR [Value]
GO
ALTER TABLE [dbo].[FeedBack] ADD  CONSTRAINT [DF_FeedBack_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
