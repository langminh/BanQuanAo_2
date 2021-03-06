USE [databasequanao]
GO
/****** Object:  Table [dbo].[Counter]    Script Date: 21-Apr-18 11:38:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Counter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IPAddress] [nvarchar](250) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Counter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 21-Apr-18 11:39:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Src] [nvarchar](250) NULL,
	[ProductID] [int] NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 21-Apr-18 11:41:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 21-Apr-18 11:42:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slide]    Script Date: 21-Apr-18 11:44:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slide](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Content] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[CreateTime] [datetime] NOT NULL,
	[show] [bit] NOT NULL,
 CONSTRAINT [PK_Slide] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Account]    Script Date: 21-Apr-18 11:45:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Account](
	[AccountID] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Power] [nvarchar](50) NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Account] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Customer]    Script Date: 21-Apr-18 11:47:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Customer](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Usermame] [varchar](250) NOT NULL,
	[Password] [varchar](250) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Phone] [int] NULL,
	[IsLock] [bit] NOT NULL,
	[RoleID] [int] NOT NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_tbl_Customer_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Import]    Script Date: 21-Apr-18 11:48:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Import](
	[Import_ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Money] [float] NULL,
	[Supplier_ID] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Import] PRIMARY KEY CLUSTERED 
(
	[Import_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_ImportDetail]    Script Date: 21-Apr-18 11:48:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_ImportDetail](
	[Import_ID] [int] NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Price_Import] [float] NULL,
	[Amount] [int] NULL,
	[Money] [float] NULL,
 CONSTRAINT [PK_tbl_ImportDetail] PRIMARY KEY CLUSTERED 
(
	[Import_ID] ASC,
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Order]    Script Date: 21-Apr-18 11:48:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Order](
	[Order_ID] [nchar](10) NOT NULL,
	[UserID] [int] NULL,
	[Date] [datetime] NOT NULL,
	[Pay_ID] [int] NOT NULL,
	[Transport_ID] [int] NOT NULL,
	[Name_Received] [nvarchar](50) NOT NULL,
	[Address_Received] [nvarchar](50) NOT NULL,
	[Phone_Received] [int] NULL,
	[Name_Pay] [nvarchar](50) NOT NULL,
	[Address_Pay] [nvarchar](50) NOT NULL,
	[Phone_Pay] [int] NULL,
	[Mesage] [nvarchar](max) NULL,
	[VAT_Gift] [float] NULL,
	[SumWeight] [float] NULL,
	[VAT_Transport] [float] NULL,
	[SumMoney] [float] NULL,
	[State] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Order] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_OrderDetial]    Script Date: 21-Apr-18 11:48:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_OrderDetial](
	[Order_ID] [nchar](10) NOT NULL,
	[Product_ID] [int] NOT NULL,
	[Price_Export] [float] NULL,
	[Amount] [int] NULL,
	[Money] [float] NULL,
	[State] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_OrderDetial] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC,
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Payment]    Script Date: 21-Apr-18 11:48:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Payment](
	[Pay_ID] [int] IDENTITY(1,1) NOT NULL,
	[Pay_Name] [nvarchar](50) NOT NULL,
	[PhiTT] [float] NOT NULL,
 CONSTRAINT [PK_tbl_Payment] PRIMARY KEY CLUSTERED 
(
	[Pay_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Producer]    Script Date: 21-Apr-18 11:48:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Producer](
	[Producer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Producer_Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_Producer] PRIMARY KEY CLUSTERED 
(
	[Producer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 21-Apr-18 11:48:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](50) NOT NULL,
	[Type_ID] [int] NOT NULL,
	[Style_ID] [int] NOT NULL,
	[Producer_ID] [int] NOT NULL,
	[Supplier_ID] [int] NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Color] [nvarchar](50) NULL,
	[Material] [nvarchar](50) NULL,
	[Size] [nchar](10) NULL,
	[Price_Import] [float] NULL,
	[Price_Export] [float] NOT NULL,
	[Amount] [int] NULL,
	[Weight] [float] NOT NULL,
	[CreateDate] [datetime] NULL,
	[SizeID] [int] NULL,
	[Order] [int] NOT NULL,
	[Quantium] [int] NULL,
	[Description] [nvarchar](250) NULL,
	[Content] [ntext] NULL,
 CONSTRAINT [PK_tbl_Product] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Style]    Script Date: 21-Apr-18 11:48:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Style](
	[Style_ID] [int] IDENTITY(1,1) NOT NULL,
	[Style_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Style] PRIMARY KEY CLUSTERED 
(
	[Style_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Supplier]    Script Date: 21-Apr-18 11:48:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Supplier](
	[Supplier_ID] [int] IDENTITY(1,1) NOT NULL,
	[Supplier_Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Phone] [int] NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_Supplier] PRIMARY KEY CLUSTERED 
(
	[Supplier_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Transport]    Script Date: 21-Apr-18 11:48:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Transport](
	[Transport_ID] [int] IDENTITY(1,1) NOT NULL,
	[Transport_Name] [nvarchar](50) NOT NULL,
	[PhiVC] [float] NOT NULL,
 CONSTRAINT [PK_tbl_Transport] PRIMARY KEY CLUSTERED 
(
	[Transport_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Type]    Script Date: 21-Apr-18 11:48:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Type](
	[Type_ID] [int] IDENTITY(1,1) NOT NULL,
	[Type_Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](250) NULL,
 CONSTRAINT [PK_tbl_Type] PRIMARY KEY CLUSTERED 
(
	[Type_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Counter] ON 

INSERT [dbo].[Counter] ([ID], [IPAddress], [CreateTime]) VALUES (1, N'::1', CAST(N'2018-04-20T16:18:06.357' AS DateTime))
INSERT [dbo].[Counter] ([ID], [IPAddress], [CreateTime]) VALUES (2, N'::1', CAST(N'2018-04-21T06:36:07.637' AS DateTime))
SET IDENTITY_INSERT [dbo].[Counter] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([ID], [Src], [ProductID]) VALUES (5, N'Aokieu5.jpg', 4)
INSERT [dbo].[Images] ([ID], [Src], [ProductID]) VALUES (6, N'Aokieu6.jpg', 4)
INSERT [dbo].[Images] ([ID], [Src], [ProductID]) VALUES (7, N'Aokieu7.jpg', 4)
INSERT [dbo].[Images] ([ID], [Src], [ProductID]) VALUES (8, N'SoMi.jpg', 6)
INSERT [dbo].[Images] ([ID], [Src], [ProductID]) VALUES (9, N'Somi_CS1.jpg', 6)
INSERT [dbo].[Images] ([ID], [Src], [ProductID]) VALUES (10, N'Somi_CS3.jpg', 6)
INSERT [dbo].[Images] ([ID], [Src], [ProductID]) VALUES (11, N'Somi_CS4.jpg', 6)
INSERT [dbo].[Images] ([ID], [Src], [ProductID]) VALUES (12, N'Somi_CS5.jpg', 6)
INSERT [dbo].[Images] ([ID], [Src], [ProductID]) VALUES (13, N'10500 (2).jpg', 3)
INSERT [dbo].[Images] ([ID], [Src], [ProductID]) VALUES (14, N'10500 (3).jpg', 3)
INSERT [dbo].[Images] ([ID], [Src], [ProductID]) VALUES (15, N'10500 (4).jpg', 3)
INSERT [dbo].[Images] ([ID], [Src], [ProductID]) VALUES (16, N'10500 (5).jpg', 3)
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([SizeID], [Name]) VALUES (1, N'S')
INSERT [dbo].[Size] ([SizeID], [Name]) VALUES (2, N'M')
INSERT [dbo].[Size] ([SizeID], [Name]) VALUES (3, N'L')
INSERT [dbo].[Size] ([SizeID], [Name]) VALUES (4, N'XL')
SET IDENTITY_INSERT [dbo].[Size] OFF
SET IDENTITY_INSERT [dbo].[Slide] ON 

INSERT [dbo].[Slide] ([ID], [Title], [Content], [Image], [CreateTime], [show]) VALUES (3, N'Bộ sưu tập quần áo mùa hè năm 2018', N'Khuyến mại đến 30%', N'slider_1.jpg', CAST(N'2018-04-20T11:16:37.957' AS DateTime), 1)
INSERT [dbo].[Slide] ([ID], [Title], [Content], [Image], [CreateTime], [show]) VALUES (4, N'Khuyến mại mới', N'Giảm giá các mặt hàng trong tháng 4 đến 25%', N'banner_1.jpg', CAST(N'2018-04-20T12:15:46.250' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Slide] OFF
SET IDENTITY_INSERT [dbo].[tbl_Customer] ON 

INSERT [dbo].[tbl_Customer] ([UserID], [Usermame], [Password], [FullName], [Email], [Address], [Phone], [IsLock], [RoleID], [IsDelete]) VALUES (1, N'admin', N'21232f297a57a5a743894a0e4a801fc3', N'admin', N'admin', N'admin', NULL, 0, 1, 0)
INSERT [dbo].[tbl_Customer] ([UserID], [Usermame], [Password], [FullName], [Email], [Address], [Phone], [IsLock], [RoleID], [IsDelete]) VALUES (2, N'user', N'ee11cbb19052e40b07aac0ca060c23ee', N'user', N'user', N'user', NULL, 0, 2, 0)
SET IDENTITY_INSERT [dbo].[tbl_Customer] OFF
INSERT [dbo].[tbl_Order] ([Order_ID], [UserID], [Date], [Pay_ID], [Transport_ID], [Name_Received], [Address_Received], [Phone_Received], [Name_Pay], [Address_Pay], [Phone_Pay], [Mesage], [VAT_Gift], [SumWeight], [VAT_Transport], [SumMoney], [State]) VALUES (N'1         ', NULL, CAST(N'2018-03-16T11:35:07.867' AS DateTime), 1, 1, N'admin', N'admin', 1666476535, N'admin', N'admin', 1666476535, N'', 0, 150, 20000, 105000, N'Chưa xử lý')
INSERT [dbo].[tbl_Order] ([Order_ID], [UserID], [Date], [Pay_ID], [Transport_ID], [Name_Received], [Address_Received], [Phone_Received], [Name_Pay], [Address_Pay], [Phone_Pay], [Mesage], [VAT_Gift], [SumWeight], [VAT_Transport], [SumMoney], [State]) VALUES (N'2         ', NULL, CAST(N'2018-03-18T23:42:29.630' AS DateTime), 1, 1, N'admin', N'admin', 0, N'admin', N'admin', 0, N'', 0, 1, 20000, 120000, N'Chưa xử lý')
INSERT [dbo].[tbl_Order] ([Order_ID], [UserID], [Date], [Pay_ID], [Transport_ID], [Name_Received], [Address_Received], [Phone_Received], [Name_Pay], [Address_Pay], [Phone_Pay], [Mesage], [VAT_Gift], [SumWeight], [VAT_Transport], [SumMoney], [State]) VALUES (N'3         ', NULL, CAST(N'2018-04-19T07:12:26.670' AS DateTime), 1, 1, N'a', N'a', 123456789, N'a', N'a', 123456789, N'', 0, 150, 20000, 105000, N'Chưa xử lý')
INSERT [dbo].[tbl_Order] ([Order_ID], [UserID], [Date], [Pay_ID], [Transport_ID], [Name_Received], [Address_Received], [Phone_Received], [Name_Pay], [Address_Pay], [Phone_Pay], [Mesage], [VAT_Gift], [SumWeight], [VAT_Transport], [SumMoney], [State]) VALUES (N'4         ', 1, CAST(N'2018-04-21T08:10:08.877' AS DateTime), 1, 1, N'admin', N'admin', NULL, N'admin', N'admin', NULL, N'', 0, NULL, 20000, 120000, N'Chưa xử lý')
INSERT [dbo].[tbl_Order] ([Order_ID], [UserID], [Date], [Pay_ID], [Transport_ID], [Name_Received], [Address_Received], [Phone_Received], [Name_Pay], [Address_Pay], [Phone_Pay], [Mesage], [VAT_Gift], [SumWeight], [VAT_Transport], [SumMoney], [State]) VALUES (N'5         ', 1, CAST(N'2018-04-21T08:15:28.107' AS DateTime), 1, 1, N'admin', N'admin', NULL, N'admin', N'admin', NULL, N'', 0, NULL, 20000, 120000, N'Chưa xử lý')
INSERT [dbo].[tbl_OrderDetial] ([Order_ID], [Product_ID], [Price_Export], [Amount], [Money], [State]) VALUES (N'1         ', 4, 105000, 1, 105000, N'Đã xử lý')
INSERT [dbo].[tbl_OrderDetial] ([Order_ID], [Product_ID], [Price_Export], [Amount], [Money], [State]) VALUES (N'2         ', 6, 120000, 45, 5400000, N'chưa xử lý')
INSERT [dbo].[tbl_OrderDetial] ([Order_ID], [Product_ID], [Price_Export], [Amount], [Money], [State]) VALUES (N'3         ', 3, 105000, 1, 105000, N'chưa xử lý')
INSERT [dbo].[tbl_OrderDetial] ([Order_ID], [Product_ID], [Price_Export], [Amount], [Money], [State]) VALUES (N'4         ', 6, 120000, 1, 726000, N'chưa xử lý')
INSERT [dbo].[tbl_OrderDetial] ([Order_ID], [Product_ID], [Price_Export], [Amount], [Money], [State]) VALUES (N'5         ', 6, 120000, 1, 132000, N'chưa xử lý')
SET IDENTITY_INSERT [dbo].[tbl_Payment] ON 

INSERT [dbo].[tbl_Payment] ([Pay_ID], [Pay_Name], [PhiTT]) VALUES (1, N'Chuyển khoản', 5)
INSERT [dbo].[tbl_Payment] ([Pay_ID], [Pay_Name], [PhiTT]) VALUES (2, N'Trực tiếp', 0)
SET IDENTITY_INSERT [dbo].[tbl_Payment] OFF
SET IDENTITY_INSERT [dbo].[tbl_Producer] ON 

INSERT [dbo].[tbl_Producer] ([Producer_ID], [Producer_Name]) VALUES (1, N'Hãng thứ nhất')
INSERT [dbo].[tbl_Producer] ([Producer_ID], [Producer_Name]) VALUES (2, N'Hãng thứ 2')
SET IDENTITY_INSERT [dbo].[tbl_Producer] OFF
SET IDENTITY_INSERT [dbo].[tbl_Product] ON 

INSERT [dbo].[tbl_Product] ([Product_ID], [Product_Name], [Type_ID], [Style_ID], [Producer_ID], [Supplier_ID], [Image], [Color], [Material], [Size], [Price_Import], [Price_Export], [Amount], [Weight], [CreateDate], [SizeID], [Order], [Quantium], [Description], [Content]) VALUES (3, N'Sản phẩm 2', 1, 1, 2, 2, N'20180419150443_37424.jpg', N'Tím', N'Nhung', N'M         ', 90000, 105000, 1, 150, CAST(N'2018-02-15T00:00:00.000' AS DateTime), 2, 1, 1, N'Đầm suông in chữ mới đẹp duyên dáng xinh xắn đáng yêu hè năm 2018 trị giá 270.000 VNĐ nay chỉ còn 160.000 VNĐ', N'&lt;p&gt;&lt;strong&gt;Đầm dạo phố&lt;/strong&gt;&amp;nbsp;với những mẫu mới nhất, độc đ&#225;o nhất v&#224; quyến rũ nhất đ&#227; được l&#234;n kệ phục vụ c&#225;c bạn nữ trong m&#249;a thu đ&#244;ng n&#224;y. Chắc chắn c&#225;c n&#224;ng cũng đang ng&#243;ng chờ những mẫu mới nhất ra đời để sắm diện ch&#224;o m&#249;a&amp;nbsp;xu&#226;n sắp đến đ&#250;ng kh&#244;ng? Vậy đừng chờ nữa, h&#227;y tham khảo ngay mẫu đầm v&#244; c&#249;ng độc đ&#225;o dưới đ&#226;y, Remoingay tin rằng, bạn sẽ c&#243; ngay sự lựa chọn tốt nhất, sỡ hữu một chiếc đầm ph&#249; hợp. Đầm dạo phố xu&#226;n h&#232;&amp;nbsp;với kiểu d&#225;ng đa dạng, m&#224;u sắc phong ph&#250; v&#224; đặc biệt chất liệu v&#244; c&#249;ng tho&#225;ng m&#225;t, n&#224;ng sẽ thực sự cảm thấy thoải m&#225;i diện trong ng&#224;y thời tiết se lạnh n&#224;y.&lt;/p&gt;

&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;/Images/images/10500%20(2).jpg&quot; style=&quot;height:1183px; width:900px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Images/images/10500%20(3).jpg&quot; style=&quot;height:1143px; width:900px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Images/images/10500%20(4).jpg&quot; style=&quot;height:1200px; width:900px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Images/images/10500%20(5).jpg&quot; style=&quot;height:1200px; width:900px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Images/images/10500%20(6).jpg&quot; style=&quot;height:1200px; width:900px&quot; /&gt;&lt;img alt=&quot;&quot; src=&quot;/Images/images/20180419150443_37424.jpg&quot; style=&quot;height:575px; width:385px&quot; /&gt;&lt;/p&gt;
')
INSERT [dbo].[tbl_Product] ([Product_ID], [Product_Name], [Type_ID], [Style_ID], [Producer_ID], [Supplier_ID], [Image], [Color], [Material], [Size], [Price_Import], [Price_Export], [Amount], [Weight], [CreateDate], [SizeID], [Order], [Quantium], [Description], [Content]) VALUES (4, N'Sản phẩm 3', 4, 2, 1, 1, N'Aokieu4.jpg', N'Nâu', N'Len', N'S         ', 90000, 105000, 1, 150, CAST(N'2018-03-05T00:00:00.000' AS DateTime), 3, 2, 1, NULL, NULL)
INSERT [dbo].[tbl_Product] ([Product_ID], [Product_Name], [Type_ID], [Style_ID], [Producer_ID], [Supplier_ID], [Image], [Color], [Material], [Size], [Price_Import], [Price_Export], [Amount], [Weight], [CreateDate], [SizeID], [Order], [Quantium], [Description], [Content]) VALUES (6, N'sản phẩm 5', 4, 2, 2, 1, N'Vest.jpg', N'Vàng', N'Tuyn', N'XL        ', 100000, 120000, 45, 1, CAST(N'2018-02-27T00:00:00.000' AS DateTime), 4, 2, 1, N'Nam tempus turpis at metus scelerisque placerat nulla deumantos solicitud felis. Pellentesque diam dolor, elementum etos lobortis des mollis ut...', NULL)
INSERT [dbo].[tbl_Product] ([Product_ID], [Product_Name], [Type_ID], [Style_ID], [Producer_ID], [Supplier_ID], [Image], [Color], [Material], [Size], [Price_Import], [Price_Export], [Amount], [Weight], [CreateDate], [SizeID], [Order], [Quantium], [Description], [Content]) VALUES (7, N'Sản phẩm 7', 1, 1, 1, 1, N'vay8.jpg', N'Xanh', N'Vải', N'S         ', 150000, 175000, 15, 1, NULL, 1, 1, 1, N'', NULL)
SET IDENTITY_INSERT [dbo].[tbl_Product] OFF
SET IDENTITY_INSERT [dbo].[tbl_Style] ON 

INSERT [dbo].[tbl_Style] ([Style_ID], [Style_Name]) VALUES (1, N'Style 1')
INSERT [dbo].[tbl_Style] ([Style_ID], [Style_Name]) VALUES (2, N'Style 2')
INSERT [dbo].[tbl_Style] ([Style_ID], [Style_Name]) VALUES (3, N'Style 3')
SET IDENTITY_INSERT [dbo].[tbl_Style] OFF
SET IDENTITY_INSERT [dbo].[tbl_Supplier] ON 

INSERT [dbo].[tbl_Supplier] ([Supplier_ID], [Supplier_Name], [Address], [Phone], [Email]) VALUES (1, N'Nhà cung cấp 1', N'Hà nội', 977206532, N'nhacungcap1@gmail.com')
INSERT [dbo].[tbl_Supplier] ([Supplier_ID], [Supplier_Name], [Address], [Phone], [Email]) VALUES (2, N'Nhà cung cấp 2', N'Bắc Ninh', 1666476535, N'nhacungcap2@gmail.com')
SET IDENTITY_INSERT [dbo].[tbl_Supplier] OFF
SET IDENTITY_INSERT [dbo].[tbl_Transport] ON 

INSERT [dbo].[tbl_Transport] ([Transport_ID], [Transport_Name], [PhiVC]) VALUES (1, N'Xe máy', 5)
INSERT [dbo].[tbl_Transport] ([Transport_ID], [Transport_Name], [PhiVC]) VALUES (2, N'Chuyển phát nhanh', 7)
INSERT [dbo].[tbl_Transport] ([Transport_ID], [Transport_Name], [PhiVC]) VALUES (3, N'Máy Bay', 15)
INSERT [dbo].[tbl_Transport] ([Transport_ID], [Transport_Name], [PhiVC]) VALUES (4, N'Tàu Thủy', 10)
INSERT [dbo].[tbl_Transport] ([Transport_ID], [Transport_Name], [PhiVC]) VALUES (5, N'Tàu Hỏa', 8)
INSERT [dbo].[tbl_Transport] ([Transport_ID], [Transport_Name], [PhiVC]) VALUES (6, N'Oto', 7)
SET IDENTITY_INSERT [dbo].[tbl_Transport] OFF
SET IDENTITY_INSERT [dbo].[tbl_Type] ON 

INSERT [dbo].[tbl_Type] ([Type_ID], [Type_Name], [Image]) VALUES (1, N'Quần áo nữ', N'banner_1.jpg')
INSERT [dbo].[tbl_Type] ([Type_ID], [Type_Name], [Image]) VALUES (4, N'Quần áo nam', N'banner_3.jpg')
INSERT [dbo].[tbl_Type] ([Type_ID], [Type_Name], [Image]) VALUES (5, N'Phụ kiện', N'banner_2.jpg')
SET IDENTITY_INSERT [dbo].[tbl_Type] OFF
ALTER TABLE [dbo].[Slide] ADD  CONSTRAINT [DF_Slide_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[tbl_Product] ADD  CONSTRAINT [DF_tbl_Product_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tbl_Product] ADD  CONSTRAINT [DF_tbl_Product_Order]  DEFAULT ((0)) FOR [Order]
GO
ALTER TABLE [dbo].[tbl_Product] ADD  CONSTRAINT [DF_tbl_Product_Quantium]  DEFAULT ((1)) FOR [Quantium]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_tbl_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[tbl_Product] ([Product_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_tbl_Product]
GO
ALTER TABLE [dbo].[tbl_Account]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Account_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Account] CHECK CONSTRAINT [FK_tbl_Account_Role]
GO
ALTER TABLE [dbo].[tbl_Customer]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Customer_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Customer] CHECK CONSTRAINT [FK_tbl_Customer_Role]
GO
ALTER TABLE [dbo].[tbl_Import]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Import_tbl_Supplier] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[tbl_Supplier] ([Supplier_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Import] CHECK CONSTRAINT [FK_tbl_Import_tbl_Supplier]
GO
ALTER TABLE [dbo].[tbl_ImportDetail]  WITH CHECK ADD  CONSTRAINT [FK_tbl_ImportDetail_tbl_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[tbl_Product] ([Product_ID])
GO
ALTER TABLE [dbo].[tbl_ImportDetail] CHECK CONSTRAINT [FK_tbl_ImportDetail_tbl_Product]
GO
ALTER TABLE [dbo].[tbl_Order]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Order_tbl_Payment] FOREIGN KEY([Pay_ID])
REFERENCES [dbo].[tbl_Payment] ([Pay_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Order] CHECK CONSTRAINT [FK_tbl_Order_tbl_Payment]
GO
ALTER TABLE [dbo].[tbl_Order]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Order_tbl_Transport] FOREIGN KEY([Transport_ID])
REFERENCES [dbo].[tbl_Transport] ([Transport_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Order] CHECK CONSTRAINT [FK_tbl_Order_tbl_Transport]
GO
ALTER TABLE [dbo].[tbl_OrderDetial]  WITH CHECK ADD  CONSTRAINT [FK_tbl_OrderDetial_tbl_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[tbl_Order] ([Order_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_OrderDetial] CHECK CONSTRAINT [FK_tbl_OrderDetial_tbl_Order]
GO
ALTER TABLE [dbo].[tbl_OrderDetial]  WITH CHECK ADD  CONSTRAINT [FK_tbl_OrderDetial_tbl_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[tbl_Product] ([Product_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_OrderDetial] CHECK CONSTRAINT [FK_tbl_OrderDetial_tbl_Product]
GO
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Product_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Size] ([SizeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Product] CHECK CONSTRAINT [FK_tbl_Product_Size]
GO
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Product_tbl_Producer1] FOREIGN KEY([Producer_ID])
REFERENCES [dbo].[tbl_Producer] ([Producer_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Product] CHECK CONSTRAINT [FK_tbl_Product_tbl_Producer1]
GO
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Product_tbl_Style] FOREIGN KEY([Style_ID])
REFERENCES [dbo].[tbl_Style] ([Style_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Product] CHECK CONSTRAINT [FK_tbl_Product_tbl_Style]
GO
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Product_tbl_Supplier1] FOREIGN KEY([Supplier_ID])
REFERENCES [dbo].[tbl_Supplier] ([Supplier_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Product] CHECK CONSTRAINT [FK_tbl_Product_tbl_Supplier1]
GO
ALTER TABLE [dbo].[tbl_Product]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Product_tbl_Type] FOREIGN KEY([Type_ID])
REFERENCES [dbo].[tbl_Type] ([Type_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_Product] CHECK CONSTRAINT [FK_tbl_Product_tbl_Type]
GO
