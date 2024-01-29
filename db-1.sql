USE [master]
GO
/****** Object:  Database [SWP391_Project_SQLShoes2]    Script Date: 1/28/2024 9:26:32 PM ******/
CREATE DATABASE [SWP391_Project_SQLShoes2]
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391_Project_SQLShoes2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET RECOVERY FULL 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET QUERY_STORE = OFF
GO
USE [SWP391_Project_SQLShoes2]
GO
/****** Object:  Table [dbo].[AccountRoles]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountRoles](
	[accountId] [int] NULL,
	[roleId] [int] NULL,
	[startDate] [date] NULL,
	[endDate] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[accountId] [int] IDENTITY(1,1) NOT NULL,
	[fullName] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](500) NOT NULL,
	[gender] [bit] NULL,
	[address] [nvarchar](255) NULL,
	[phone] [varchar](10) NULL,
	[userImage] [varchar](max) NULL,
	[lastLogin] [date] NULL,
	[createDate] [date] NOT NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[blogId] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[blogContent] [nvarchar](255) NOT NULL,
	[blogImage] [nvarchar](max) NULL,
	[createDate] [date] NOT NULL,
	[lastUpdate] [date] NULL,
	[employeeId] [int] NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[blogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[brandId] [int] IDENTITY(1,1) NOT NULL,
	[brandName] [nvarchar](50) NULL,
	[brandDescription] [nvarchar](255) NULL,
	[createDate] [date] NOT NULL,
	[lastUpdate] [date] NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[brandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
	[categoryDescription] [nvarchar](255) NULL,
	[createDate] [date] NOT NULL,
	[lastUpdate] [date] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[colorId] [int] IDENTITY(1,1) NOT NULL,
	[color] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[colorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[productId] [int] NOT NULL,
	[feedbackDescription] [nvarchar](255) NOT NULL,
	[customerId] [int] NOT NULL,
	[rating] [float] NULL,
	[createDate] [date] NOT NULL,
	[feedbackImage] [nvarchar](max) NULL,
	[feedbackId] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[feedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportBillDetails]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportBillDetails](
	[importDetailId] [int] IDENTITY(1,1) NOT NULL,
	[importId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [nchar](10) NOT NULL,
	[unitPrice] [nchar](10) NOT NULL,
 CONSTRAINT [PK_ImportBillDetails] PRIMARY KEY CLUSTERED 
(
	[importDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportBills]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportBills](
	[importId] [int] IDENTITY(1,1) NOT NULL,
	[employeeId] [int] NOT NULL,
	[deliveryName] [nvarchar](50) NOT NULL,
	[deliveryPhone] [varchar](10) NOT NULL,
	[totalMoney] [int] NOT NULL,
	[deliverDate] [date] NOT NULL,
	[providerId] [int] NOT NULL,
	[note] [nvarchar](255) NULL,
 CONSTRAINT [PK_ImportBills] PRIMARY KEY CLUSTERED 
(
	[importId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[employeeId] [int] NOT NULL,
	[status] [int] NOT NULL,
	[orderDate] [date] NOT NULL,
	[acceptedDate] [date] NULL,
	[shippedDate] [date] NULL,
	[address] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetails](
	[orderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[unitPrice] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[productId] [int] NOT NULL,
	[sizeId] [int] NOT NULL,
	[colorId] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NOT NULL,
	[brandId] [int] NOT NULL,
	[productName] [nvarchar](255) NOT NULL,
	[productDescription] [nvarchar](255) NOT NULL,
	[unitPrice] [int] NOT NULL,
	[productImage] [varchar](max) NOT NULL,
	[totalQuantity] [int] NOT NULL,
	[quantitySold] [int] NOT NULL,
	[discountPercentage] [int] NOT NULL,
	[status] [int] NOT NULL,
	[createDate] [date] NOT NULL,
	[lastUpdate] [date] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Providers](
	[providerId] [int] IDENTITY(1,1) NOT NULL,
	[providerName] [nvarchar](50) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[note] [nvarchar](255) NULL,
	[createDate] [date] NOT NULL,
 CONSTRAINT [PK_Providers] PRIMARY KEY CLUSTERED 
(
	[providerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Replies]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Replies](
	[replyId] [int] IDENTITY(1,1) NOT NULL,
	[feedbackId] [int] NOT NULL,
	[employeeId] [int] NOT NULL,
	[reply] [nvarchar](255) NOT NULL,
	[createDate] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[sizeId] [int] IDENTITY(1,1) NOT NULL,
	[size] [int] NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[sizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (1, N'customer1', N'customer1@gmail.com', N'123', 1, N'Hoai Duc, Hanoi', N'0967760888', NULL, CAST(N'2024-01-28' AS Date), CAST(N'2024-01-16' AS Date), 0)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (2, N'customer2', N'customer2@gmail.com', N'123', 0, N'Cai Lay, Tien Giang', N'0123456789', NULL, NULL, CAST(N'2024-01-16' AS Date), NULL)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (3, N'customer3', N'customer3@gmail.com', N'123', 1, N'Cu Chi, Thanh pho Ho Chi Minh', N'0967760897', NULL, NULL, CAST(N'2024-01-16' AS Date), NULL)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (4, N'admin', N'admin@gmail.com', N'123', 1, N'Hoai Duc, Hanoi', N'0967760888', NULL, NULL, CAST(N'2024-01-16' AS Date), NULL)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (5, N'marketingstaff', N'marketingstaff@gmail.com', N'123', 1, N'Hoa Lac, Hanoi', N'0967780687', NULL, NULL, CAST(N'2024-01-16' AS Date), NULL)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (6, N'seller', N'seller@gmail.com', N'123', 0, N'Ha Long, Quang Ninh', N'0852273857', NULL, NULL, CAST(N'2024-01-16' AS Date), NULL)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (7, N'shipper', N'shipper@gmail.com', N'123', 0, N'Thach That, Hanoi', N'0852273235', NULL, NULL, CAST(N'2024-01-16' AS Date), NULL)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (8, N'ad', N'customer143@gmail.com', N'123456', 1, N'9', N'9999999999', NULL, CAST(N'2024-01-28' AS Date), CAST(N'2024-01-28' AS Date), 1)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (9, N'ad', N'customer1433@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, N'9', N'9999999999', NULL, CAST(N'2024-01-28' AS Date), CAST(N'2024-01-28' AS Date), 1)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (10, N'j', N'a@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12', 1, N'9', N'0000000000', NULL, CAST(N'2024-01-28' AS Date), CAST(N'2024-01-28' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (1, N'Customers')
GO
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (2, N'Admin')
GO
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (3, N'Seller')
GO
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (4, N'Marketing Staff')
GO
INSERT [dbo].[Roles] ([roleId], [roleName]) VALUES (5, N'Shipper')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
ALTER TABLE [dbo].[AccountRoles]  WITH CHECK ADD  CONSTRAINT [FK_AccountRoles_Accounts] FOREIGN KEY([accountId])
REFERENCES [dbo].[Accounts] ([accountId])
GO
ALTER TABLE [dbo].[AccountRoles] CHECK CONSTRAINT [FK_AccountRoles_Accounts]
GO
ALTER TABLE [dbo].[AccountRoles]  WITH CHECK ADD  CONSTRAINT [FK_AccountRoles_Roles] FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([roleId])
GO
ALTER TABLE [dbo].[AccountRoles] CHECK CONSTRAINT [FK_AccountRoles_Roles]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Accounts] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Accounts] ([accountId])
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Accounts]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Accounts] FOREIGN KEY([customerId])
REFERENCES [dbo].[Accounts] ([accountId])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Accounts]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([productId])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Products]
GO
ALTER TABLE [dbo].[ImportBillDetails]  WITH CHECK ADD  CONSTRAINT [FK_ImportBillDetails_ImportBills] FOREIGN KEY([importId])
REFERENCES [dbo].[ImportBills] ([importId])
GO
ALTER TABLE [dbo].[ImportBillDetails] CHECK CONSTRAINT [FK_ImportBillDetails_ImportBills]
GO
ALTER TABLE [dbo].[ImportBillDetails]  WITH CHECK ADD  CONSTRAINT [FK_ImportBillDetails_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([productId])
GO
ALTER TABLE [dbo].[ImportBillDetails] CHECK CONSTRAINT [FK_ImportBillDetails_Products]
GO
ALTER TABLE [dbo].[ImportBills]  WITH CHECK ADD  CONSTRAINT [FK_ImportBills_Accounts] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Accounts] ([accountId])
GO
ALTER TABLE [dbo].[ImportBills] CHECK CONSTRAINT [FK_ImportBills_Accounts]
GO
ALTER TABLE [dbo].[ImportBills]  WITH CHECK ADD  CONSTRAINT [FK_ImportBills_Providers] FOREIGN KEY([providerId])
REFERENCES [dbo].[Providers] ([providerId])
GO
ALTER TABLE [dbo].[ImportBills] CHECK CONSTRAINT [FK_ImportBills_Providers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([customerId])
REFERENCES [dbo].[Accounts] ([accountId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts1] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Accounts] ([accountId])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts1]
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetails_Orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([orderId])
GO
ALTER TABLE [dbo].[OrdersDetails] CHECK CONSTRAINT [FK_OrdersDetails_Orders]
GO
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetails_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([productId])
GO
ALTER TABLE [dbo].[OrdersDetails] CHECK CONSTRAINT [FK_OrdersDetails_Products]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetails_Colors] FOREIGN KEY([colorId])
REFERENCES [dbo].[Colors] ([colorId])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_ProductDetails_Colors]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductSize_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([productId])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_ProductSize_Products]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductSize_Size] FOREIGN KEY([sizeId])
REFERENCES [dbo].[Size] ([sizeId])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_ProductSize_Size]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([brandId])
REFERENCES [dbo].[Brands] ([brandId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([categoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Replies]  WITH CHECK ADD  CONSTRAINT [FK_Replies_Accounts] FOREIGN KEY([employeeId])
REFERENCES [dbo].[Accounts] ([accountId])
GO
ALTER TABLE [dbo].[Replies] CHECK CONSTRAINT [FK_Replies_Accounts]
GO
ALTER TABLE [dbo].[Replies]  WITH CHECK ADD  CONSTRAINT [FK_Replies_Feedbacks] FOREIGN KEY([feedbackId])
REFERENCES [dbo].[Feedbacks] ([feedbackId])
GO
ALTER TABLE [dbo].[Replies] CHECK CONSTRAINT [FK_Replies_Feedbacks]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAccount]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Delete Procedure
CREATE PROCEDURE [dbo].[sp_DeleteAccount]
    @accountId INT
AS
BEGIN
    DELETE FROM Accounts WHERE accountId = @accountId
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAccountByEmail]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAccountByEmail]
    @email NVARCHAR(100)
AS
BEGIN
    SELECT * FROM Accounts WHERE email = @email
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAccountById]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Read Procedure
CREATE PROCEDURE [dbo].[sp_GetAccountById]
    @accountId INT
AS
BEGIN
    SELECT * FROM Accounts WHERE accountId = @accountId
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllAccounts]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAllAccounts]
AS
BEGIN
    SELECT * FROM Accounts
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAccount]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertAccount]
    @fullName NVARCHAR(100),
    @email NVARCHAR(100),
    @password NVARCHAR(50),
    @gender BIT,
    @address NVARCHAR(255),
    @phone VARCHAR(10),
    @userImage VARCHAR(MAX),
	@lastLogin DATE,
    @createDate DATE,
    @status INT
AS
BEGIN
    INSERT INTO Accounts (fullName, email, password, gender, address, phone, userImage, createDate, [status])
    VALUES (@fullName, @email, @password, @gender, @address, @phone, @userImage, @createDate, @status);

	DECLARE @AccountId INT = SCOPE_IDENTITY();

    -- Assuming the RoleId for 'User' is 1
    INSERT INTO AccountRoles (accountId, roleId, startDate, endDate)
    VALUES (@AccountId, 1, @createDate, NULL);
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAccount]    Script Date: 1/28/2024 9:26:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Update Procedure
CREATE PROCEDURE [dbo].[sp_UpdateAccount]
    @accountId INT,
    @fullName NVARCHAR(100),
    @email NVARCHAR(100),
    @password NVARCHAR(50),
    @gender BIT,
    @address NVARCHAR(255),
    @phone VARCHAR(10),
    @userImage VARCHAR(MAX),
    @lastLogin DATE,
    @createDate DATE,
    @status INT
AS
BEGIN
    UPDATE Accounts
    SET
        fullName = @fullName,
        email = @email,
        password = @password,
        gender = @gender,
        address = @address,
        phone = @phone,
        userImage = @userImage,
        lastLogin = @lastLogin,
        createDate = @createDate,
        [status] = @status
    WHERE
        accountId = @accountId
END

GO
USE [master]
GO
ALTER DATABASE [SWP391_Project_SQLShoes2] SET  READ_WRITE 
GO