USE [master]
GO
/****** Object:  Database [SWP391_Project_SQLShoes3]    Script Date: 3/9/2024 7:21:33 PM ******/
CREATE DATABASE [SWP391_Project_SQLShoes3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391_Project_SQLShoes3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP391_Project_SQLShoes3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_Project_SQLShoes3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SWP391_Project_SQLShoes3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391_Project_SQLShoes3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET RECOVERY FULL 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP391_Project_SQLShoes3] SET QUERY_STORE = OFF
GO
USE [SWP391_Project_SQLShoes3]
GO
/****** Object:  Table [dbo].[AccountRoles]    Script Date: 3/9/2024 7:21:33 PM ******/
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
/****** Object:  Table [dbo].[Accounts]    Script Date: 3/9/2024 7:21:34 PM ******/
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
/****** Object:  Table [dbo].[Blogs]    Script Date: 3/9/2024 7:21:34 PM ******/
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
/****** Object:  Table [dbo].[Brands]    Script Date: 3/9/2024 7:21:34 PM ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 3/9/2024 7:21:34 PM ******/
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
/****** Object:  Table [dbo].[Colors]    Script Date: 3/9/2024 7:21:34 PM ******/
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
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 3/9/2024 7:21:34 PM ******/
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
/****** Object:  Table [dbo].[ImportBillDetails]    Script Date: 3/9/2024 7:21:34 PM ******/
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
/****** Object:  Table [dbo].[ImportBills]    Script Date: 3/9/2024 7:21:34 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 3/9/2024 7:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NOT NULL,
	[employeeId] [int] NOT NULL,
	[status] [int] NOT NULL,
	[orderDate] [datetime] NOT NULL,
	[acceptedDate] [datetime] NULL,
	[shippedDate] [datetime] NULL,
	[address] [nchar](1000) NOT NULL,
	[totalMoney] money not null
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetails]    Script Date: 3/9/2024 7:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetails](
	[orderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[unitPrice] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[colorId] [int] NOT NULL,
	[sizeId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 3/9/2024 7:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[productId] [int] NOT NULL,
	[sizeId] [int] NOT NULL,
	[colorId] [int] NOT NULL,
	[productImage] [nvarchar](max) NULL,
	[quantity] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productId] ASC,
	[sizeId] ASC,
	[colorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/9/2024 7:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NOT NULL,
	[brandId] [int] NOT NULL,
	[productName] [nvarchar](255) NOT NULL,
	[productDescription] [nvarchar](max) NOT NULL,
	[productImage] [nvarchar](max) NULL,
	[unitPrice] [int] NOT NULL,
	[totalQuantity] [int] NOT NULL,
	[quantitySold] [int] NOT NULL,
	[status] [int] NOT NULL,
	[createDate] [date] NOT NULL,
	[lastUpdate] [date] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 3/9/2024 7:21:34 PM ******/
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
/****** Object:  Table [dbo].[Replies]    Script Date: 3/9/2024 7:21:34 PM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 3/9/2024 7:21:34 PM ******/
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
/****** Object:  Table [dbo].[SalePrograms]    Script Date: 3/9/2024 7:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalePrograms](
	[salePrgmId] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [nchar](10) NULL,
 CONSTRAINT [PK_SalePrograms] PRIMARY KEY CLUSTERED 
(
	[salePrgmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 3/9/2024 7:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[saleId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[salePrgmId] [int] NOT NULL,
	[salePrcnt] [int] NOT NULL,
 CONSTRAINT [PK_Sales] PRIMARY KEY CLUSTERED 
(
	[saleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 3/9/2024 7:21:34 PM ******/
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
INSERT [dbo].[AccountRoles] ([accountId], [roleId], [startDate], [endDate]) VALUES (11, 1, CAST(N'2024-01-29' AS Date), NULL)
GO
INSERT [dbo].[AccountRoles] ([accountId], [roleId], [startDate], [endDate]) VALUES (NULL, 1, CAST(N'2024-01-30' AS Date), NULL)
GO
INSERT [dbo].[AccountRoles] ([accountId], [roleId], [startDate], [endDate]) VALUES (15, 1, CAST(N'2024-01-30' AS Date), NULL)
GO
INSERT [dbo].[AccountRoles] ([accountId], [roleId], [startDate], [endDate]) VALUES (16, 1, CAST(N'2024-01-30' AS Date), NULL)
GO
INSERT [dbo].[AccountRoles] ([accountId], [roleId], [startDate], [endDate]) VALUES (18, 1, CAST(N'2024-02-18' AS Date), NULL)
GO
INSERT [dbo].[AccountRoles] ([accountId], [roleId], [startDate], [endDate]) VALUES (19, 1, CAST(N'2024-02-18' AS Date), NULL)
GO
INSERT [dbo].[AccountRoles] ([accountId], [roleId], [startDate], [endDate]) VALUES (20, 1, CAST(N'2024-02-18' AS Date), NULL)
GO
INSERT [dbo].[AccountRoles] ([accountId], [roleId], [startDate], [endDate]) VALUES (21, 1, CAST(N'2024-02-18' AS Date), NULL)
GO
INSERT [dbo].[AccountRoles] ([accountId], [roleId], [startDate], [endDate]) VALUES (23, 1, CAST(N'2024-02-25' AS Date), NULL)
GO
INSERT [dbo].[AccountRoles] ([accountId], [roleId], [startDate], [endDate]) VALUES (24, 1, CAST(N'2024-02-25' AS Date), NULL)
GO
INSERT [dbo].[AccountRoles] ([accountId], [roleId], [startDate], [endDate]) VALUES (17, 1, CAST(N'2024-01-30' AS Date), NULL)
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
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (9, N'ad', N'customer1433@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, N'9', N'9999999999', NULL, CAST(N'2024-03-09' AS Date), CAST(N'2024-01-28' AS Date), 1)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (10, N'j', N'a@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12', 1, N'9', N'0000000000', NULL, CAST(N'2024-01-28' AS Date), CAST(N'2024-01-28' AS Date), 1)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (11, N'TacticalRimjob', N'a@fpt.edu.vn', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12', 1, N'd', N'1234567890', NULL, CAST(N'2024-01-29' AS Date), CAST(N'2024-01-29' AS Date), 1)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (15, N'Nguyen Tien Tu', N'tunthe160856@fpt.edu.vn', N'ed02457b5c41d964dbd2f2a609d63fe1bb7528dbe55e1abf5b', 0, N'Don''t wanna say', N'0967768788', NULL, CAST(N'2024-01-30' AS Date), CAST(N'2024-01-30' AS Date), 1)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (16, N'Nguyen Tien Tu', N'owwl@gmail.com', N'0a1b086f072513ebb1d3d715166583135b706781ce4948cb1e', 1, N'Don''t wanna say', N'0967768788', NULL, NULL, CAST(N'2024-01-30' AS Date), 1)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (17, N'Tu Tien Nguyen', N'b@gmail.com', N'91b4d142823f7d20c5f08df69122de43f35f057a988d9619f6', 1, N'Don''t wanna sa', N'0967760897', NULL, CAST(N'2024-02-18' AS Date), CAST(N'2024-01-30' AS Date), 1)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (18, N'Nguyen Tien Tu', N'johntheweebo@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12', 1, N'Newaddress', N'0967760897', NULL, NULL, CAST(N'2024-02-18' AS Date), 1)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (19, N'1', N'anhduc1c@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12', 1, N'', N'', NULL, NULL, CAST(N'2024-02-18' AS Date), 1)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (20, N'New Tu', N'nguyentientu1562002@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12', 1, N'', N'', NULL, NULL, CAST(N'2024-02-18' AS Date), 1)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (21, N'2', N'fajrogame@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, N'', N'', NULL, CAST(N'2024-02-21' AS Date), CAST(N'2024-02-18' AS Date), 1)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (22, N'Duc Thien', N'thien123@gmail.com', N'123', 1, N'VN', N'123456789', N'https://icons.iconarchive.com/icons/papirus-team/papirus-status/512/avatar-default-icon.png', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date), 1)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (23, N'a', N'anhduc18c@gmail.com', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, N'', N'', NULL, NULL, CAST(N'2024-02-25' AS Date), 1)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (24, N'Nguyen Tien Tu', N'johntheweeboo@gmail.com', N'481f6cc0511143ccdd7e2d1b1b94faf0a700a8b49cd13922a70b5ae28acaa8c5', 1, N'', N'', NULL, NULL, CAST(N'2024-02-25' AS Date), 1)
GO
INSERT [dbo].[Accounts] ([accountId], [fullName], [email], [password], [gender], [address], [phone], [userImage], [lastLogin], [createDate], [status]) VALUES (25, N'Duc Thien', N'thien123@gmail.com', N'123', 1, N'VN', N'123456789', N'https://icons.iconarchive.com/icons/papirus-team/papirus-status/512/avatar-default-icon.png', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 
GO
INSERT [dbo].[Blogs] ([blogId], [title], [blogContent], [blogImage], [createDate], [lastUpdate], [employeeId]) VALUES (1, N'Title 1, Today is Monday', N'Li K Ba Ca Na Mg Al', N'https://images.pexels.com/photos/36478/amazing-beautiful-beauty-blue.jpg?cs=srgb&dl=pexels-pixabay-36478.jpg&fm=jpg', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date), 1)
GO
INSERT [dbo].[Blogs] ([blogId], [title], [blogContent], [blogImage], [createDate], [lastUpdate], [employeeId]) VALUES (2, N'Title 2, Today is Monday', N'Li K Ba Ca Na Mg Al', N'https://images.pexels.com/photos/36478/amazing-beautiful-beauty-blue.jpg?cs=srgb&dl=pexels-pixabay-36478.jpg&fm=jpg', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date), 1)
GO
INSERT [dbo].[Blogs] ([blogId], [title], [blogContent], [blogImage], [createDate], [lastUpdate], [employeeId]) VALUES (3, N'Title 3, Today is Monday', N'Li K Ba Ca Na Mg Al', N'https://images.pexels.com/photos/36478/amazing-beautiful-beauty-blue.jpg?cs=srgb&dl=pexels-pixabay-36478.jpg&fm=jpg', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date), 1)
GO
INSERT [dbo].[Blogs] ([blogId], [title], [blogContent], [blogImage], [createDate], [lastUpdate], [employeeId]) VALUES (4, N'Title 1, Today is Monday', N'Li K Ba Ca Na Mg Al', N'https://images.pexels.com/photos/36478/amazing-beautiful-beauty-blue.jpg?cs=srgb&dl=pexels-pixabay-36478.jpg&fm=jpg', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date), 1)
GO
INSERT [dbo].[Blogs] ([blogId], [title], [blogContent], [blogImage], [createDate], [lastUpdate], [employeeId]) VALUES (5, N'Title 2, Today is Monday', N'Li K Ba Ca Na Mg Al', N'https://images.pexels.com/photos/36478/amazing-beautiful-beauty-blue.jpg?cs=srgb&dl=pexels-pixabay-36478.jpg&fm=jpg', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date), 1)
GO
INSERT [dbo].[Blogs] ([blogId], [title], [blogContent], [blogImage], [createDate], [lastUpdate], [employeeId]) VALUES (6, N'Title 3, Today is Monday', N'Li K Ba Ca Na Mg Al', N'https://images.pexels.com/photos/36478/amazing-beautiful-beauty-blue.jpg?cs=srgb&dl=pexels-pixabay-36478.jpg&fm=jpg', CAST(N'2024-01-01' AS Date), CAST(N'2024-01-01' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 
GO
INSERT [dbo].[Brands] ([brandId], [brandName], [brandDescription], [createDate], [lastUpdate]) VALUES (1, N'Adidas', NULL, CAST(N'2024-01-14' AS Date), CAST(N'2024-02-01' AS Date))
GO
INSERT [dbo].[Brands] ([brandId], [brandName], [brandDescription], [createDate], [lastUpdate]) VALUES (2, N'Converse', NULL, CAST(N'2024-01-14' AS Date), CAST(N'2024-02-01' AS Date))
GO
INSERT [dbo].[Brands] ([brandId], [brandName], [brandDescription], [createDate], [lastUpdate]) VALUES (3, N'Nike', NULL, CAST(N'2024-01-14' AS Date), CAST(N'2024-02-01' AS Date))
GO
INSERT [dbo].[Brands] ([brandId], [brandName], [brandDescription], [createDate], [lastUpdate]) VALUES (4, N'Vans', NULL, CAST(N'2024-01-14' AS Date), CAST(N'2024-02-01' AS Date))
GO
INSERT [dbo].[Brands] ([brandId], [brandName], [brandDescription], [createDate], [lastUpdate]) VALUES (5, N'Timberland', NULL, CAST(N'2024-01-14' AS Date), CAST(N'2024-02-01' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([categoryId], [categoryName], [categoryDescription], [createDate], [lastUpdate]) VALUES (1, N'1', N'Giày thể thao', CAST(N'2024-01-14' AS Date), CAST(N'2024-01-14' AS Date))
GO
INSERT [dbo].[Categories] ([categoryId], [categoryName], [categoryDescription], [createDate], [lastUpdate]) VALUES (2, N'2', N'Giày chạy bộ', CAST(N'2024-01-14' AS Date), CAST(N'2024-01-14' AS Date))
GO
INSERT [dbo].[Categories] ([categoryId], [categoryName], [categoryDescription], [createDate], [lastUpdate]) VALUES (3, N'3', N'Giày dã ngoại', CAST(N'2024-01-14' AS Date), CAST(N'2024-01-14' AS Date))
GO
INSERT [dbo].[Categories] ([categoryId], [categoryName], [categoryDescription], [createDate], [lastUpdate]) VALUES (4, N'4', N'Giày thời trang', CAST(N'2024-01-14' AS Date), CAST(N'2024-01-14' AS Date))
GO
INSERT [dbo].[Categories] ([categoryId], [categoryName], [categoryDescription], [createDate], [lastUpdate]) VALUES (5, N'5', N'Giày tennis', CAST(N'2024-01-14' AS Date), CAST(N'2024-01-14' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 
GO
INSERT [dbo].[Colors] ([colorId], [color]) VALUES (1, N'Black')
GO
INSERT [dbo].[Colors] ([colorId], [color]) VALUES (2, N'Blue')
GO
INSERT [dbo].[Colors] ([colorId], [color]) VALUES (3, N'Red')
GO
INSERT [dbo].[Colors] ([colorId], [color]) VALUES (4, N'White')
GO
INSERT [dbo].[Colors] ([colorId], [color]) VALUES (5, N'Silver')
GO
INSERT [dbo].[Colors] ([colorId], [color]) VALUES (6, N'Brown')
GO
INSERT [dbo].[Colors] ([colorId], [color]) VALUES (7, N'Yellow')
GO
INSERT [dbo].[Colors] ([colorId], [color]) VALUES (8, N'Green')
GO
INSERT [dbo].[Colors] ([colorId], [color]) VALUES (9, N'Grey')
GO
INSERT [dbo].[Colors] ([colorId], [color]) VALUES (10, N'Gold')
GO
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetails] ON 
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (1, 1, 1, N'https://drake.vn/image/catalog/H%C3%ACnh%20content/gi%C3%A0y-Converse-n%E1%BB%AF-m%C3%A0u-%C4%91en/giay-converse-nu-mau-den-111.jpg', 11, 1)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (1, 2, 1, N'https://drake.vn/image/catalog/H%C3%ACnh%20content/gi%C3%A0y-Converse-n%E1%BB%AF-m%C3%A0u-%C4%91en/giay-converse-nu-mau-den-111.jpg', 11, 2)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (1, 3, 1, N'https://drake.vn/image/catalog/H%C3%ACnh%20content/gi%C3%A0y-Converse-n%E1%BB%AF-m%C3%A0u-%C4%91en/giay-converse-nu-mau-den-111.jpg', 11, 3)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (1, 4, 1, N'https://drake.vn/image/catalog/H%C3%ACnh%20content/gi%C3%A0y-Converse-n%E1%BB%AF-m%C3%A0u-%C4%91en/giay-converse-nu-mau-den-111.jpg', 11, 4)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (1, 5, 9, N'https://www.gitana.vn/image/cache/catalog/san-pham/8053%20SVN/giay-dr-martens-nam-thai-lan-8053-sap-vuong-mau-nau-01-1000x667.jpg', 11, 5)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (1, 6, 9, N'https://www.gitana.vn/image/cache/catalog/san-pham/8053%20SVN/giay-dr-martens-nam-thai-lan-8053-sap-vuong-mau-nau-01-1000x667.jpg', 11, 6)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (1, 7, 9, N'https://www.gitana.vn/image/cache/catalog/san-pham/8053%20SVN/giay-dr-martens-nam-thai-lan-8053-sap-vuong-mau-nau-01-1000x667.jpg', 11, 7)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (1, 8, 9, N'https://www.gitana.vn/image/cache/catalog/san-pham/8053%20SVN/giay-dr-martens-nam-thai-lan-8053-sap-vuong-mau-nau-01-1000x667.jpg', 11, 8)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (1, 9, 1, N'https://drake.vn/image/catalog/H%C3%ACnh%20content/gi%C3%A0y-Converse-n%E1%BB%AF-m%C3%A0u-%C4%91en/giay-converse-nu-mau-den-111.jpg', 11, 9)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (2, 1, 1, N'', 11, 10)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (2, 2, 2, N'https://badmintonw.com/uploads/gallery/Lefus%20L010%20-%20Xanh.png', 11, 11)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (2, 3, 4, N'', 11, 12)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (2, 4, 7, N'', 11, 13)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (2, 5, 9, N'', 11, 14)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (2, 6, 1, N'', 11, 15)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (2, 7, 2, N'https://badmintonw.com/uploads/gallery/Lefus%20L010%20-%20Xanh.png', 11, 16)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (2, 8, 4, N'', 11, 17)
GO
INSERT [dbo].[ProductDetails] ([productId], [sizeId], [colorId], [productImage], [quantity], [id]) VALUES (2, 9, 9, N'', 11, 18)
GO
SET IDENTITY_INSERT [dbo].[ProductDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([productId], [categoryId], [brandId], [productName], [productDescription], [productImage], [unitPrice], [totalQuantity], [quantitySold], [status], [createDate], [lastUpdate]) VALUES (1, 1, 1, N'GIÀY HIKING TERREX FREE HIKER 2.0 LOW GORE-TEX', N'Thân giày bằng vải lưới chống mài mòn với các chi tiết phủ ngoài không đường may và lớp màng GORE-TEX cùng với ẹp gót bên ngoài và khung ổn định bằng chất liệu EVA', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/d63aa4322cbe43b1a02a306d618c4087_9366/Giay_Hiking_TERREX_Free_Hiker_2.0_Low_GORE-TEX_Xam_IF6658_01_standard.jpg', 4400000, 99, 1, 1, CAST(N'2024-01-14' AS Date), CAST(N'2024-01-14' AS Date))
GO
INSERT [dbo].[Products] ([productId], [categoryId], [brandId], [productName], [productDescription], [productImage], [unitPrice], [totalQuantity], [quantitySold], [status], [createDate], [lastUpdate]) VALUES (2, 2, 1, N'GIÀY PUREBOOST 23', N'Làm từ một loạt chất liệu tái chế, thân giày có chứa tối thiểu 50% thành phần tái chế. Sản phẩm này đại diện cho một trong số rất nhiều các giải pháp của chúng tôi hướng tới chấm dứt rác thải nhựa.', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b21a897034754050ac76376f9b113405_9366/Giay_Pureboost_23_Be_IF1547_01_standard.jpg', 3650000, 99, 1, 1, CAST(N'2024-01-14' AS Date), CAST(N'2024-01-14' AS Date))
GO
INSERT [dbo].[Products] ([productId], [categoryId], [brandId], [productName], [productDescription], [productImage], [unitPrice], [totalQuantity], [quantitySold], [status], [createDate], [lastUpdate]) VALUES (3, 3, 1, N'GIÀY HYPERTURF', N'Làm từ một loạt chất liệu tái chế, thân giày có chứa tối thiểu 50% thành phần tái chế. Sản phẩm này đại diện cho một trong số rất nhiều các giải pháp của chúng tôi hướng tới chấm dứt rác thải nhựa.', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7629590df3db4b229362ae9701289a0e_9366/Giay_Hyperturf_DJen_GX2022_01_standard.jpg', 3650000, 99, 1, 1, CAST(N'2024-01-14' AS Date), CAST(N'2024-01-14' AS Date))
GO
INSERT [dbo].[Products] ([productId], [categoryId], [brandId], [productName], [productDescription], [productImage], [unitPrice], [totalQuantity], [quantitySold], [status], [createDate], [lastUpdate]) VALUES (4, 4, 1, N'GIÀY SUPERSTAR XLG', N'Tỷ lệ thiết kế oversize và cá tính mạnh mẽ không kém thể hiện rõ ràng qua 3 Sọc răng cưa biểu tượng. Thân giày hoàn toàn bằng da trung thành với chất vintage, đồng thời biến hóa kiểu dáng cho phong cách mới mẻ', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/81c4e7e639bc46858f26b7291d9ec5b0_9366/Giay_Superstar_XLG_DJen_IG9777.jpg', 3000000, 99, 1, 1, CAST(N'2024-01-14' AS Date), CAST(N'2024-01-14' AS Date))
GO
INSERT [dbo].[Products] ([productId], [categoryId], [brandId], [productName], [productDescription], [productImage], [unitPrice], [totalQuantity], [quantitySold], [status], [createDate], [lastUpdate]) VALUES (5, 5, 1, N'GIÀY TENNIS COURT SPEC 2', N'Với đế ngoài bằng cao su phù hợp mọi kiểu sân và đế giữa Bounce linh hoạt, đôi giày siêu nhẹ này đảm bảo hiệu năng trên mọi bề mặt sân.', N'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/da8d07d3313a4784b0c9578461a577bf_9366/Giay_Tennis_Court_Spec_2_DJen_ID2471_01_standard.jpg', 1600000, 99, 1, 1, CAST(N'2024-01-14' AS Date), CAST(N'2024-01-14' AS Date))
GO
INSERT [dbo].[Products] ([productId], [categoryId], [brandId], [productName], [productDescription], [productImage], [unitPrice], [totalQuantity], [quantitySold], [status], [createDate], [lastUpdate]) VALUES (6, 4, 2, N'GIÀY CHUCK 70', N'Giày cổ thấp có thân trên bằng vải canvas theo màu sắc theo mùa.Khâu lưỡi có cánh giúp khóa nó đúng vị trí', N'https://www.converse.vn/media/catalog/product/cache/e81e4f913a1cad058ef66fea8e95c839/0/8/0882-CON162058C000007-1.jpg', 1900000, 99, 1, 1, CAST(N'2024-01-14' AS Date), CAST(N'2024-01-14' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
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
SET IDENTITY_INSERT [dbo].[SalePrograms] ON 
GO
INSERT [dbo].[SalePrograms] ([salePrgmId], [title], [startDate], [endDate]) VALUES (1, N'Year End Sale', CAST(N'2024-02-25' AS Date), N'2024-03-03')
GO
INSERT [dbo].[SalePrograms] ([salePrgmId], [title], [startDate], [endDate]) VALUES (3, N'New Year', CAST(N'2024-03-03' AS Date), N'2024-03-10')
GO
SET IDENTITY_INSERT [dbo].[SalePrograms] OFF
GO
SET IDENTITY_INSERT [dbo].[Sales] ON 
GO
INSERT [dbo].[Sales] ([saleId], [productId], [salePrgmId], [salePrcnt]) VALUES (2, 1, 1, 14)
GO
INSERT [dbo].[Sales] ([saleId], [productId], [salePrgmId], [salePrcnt]) VALUES (8, 3, 1, 25)
GO
SET IDENTITY_INSERT [dbo].[Sales] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 
GO
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (1, 36)
GO
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (2, 37)
GO
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (3, 38)
GO
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (4, 39)
GO
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (5, 40)
GO
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (6, 41)
GO
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (7, 42)
GO
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (8, 43)
GO
INSERT [dbo].[Size] ([sizeId], [size]) VALUES (9, 44)
GO
SET IDENTITY_INSERT [dbo].[Size] OFF
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
ALTER TABLE [dbo].[OrdersDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetails_ProductDetails] FOREIGN KEY([productId], [sizeId], [colorId])
REFERENCES [dbo].[ProductDetails] ([productId], [sizeId], [colorId])
GO
ALTER TABLE [dbo].[OrdersDetails] CHECK CONSTRAINT [FK_OrdersDetails_ProductDetails]
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
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([productId])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_Products]
GO
ALTER TABLE [dbo].[Sales]  WITH CHECK ADD  CONSTRAINT [FK_Sales_SalePrograms] FOREIGN KEY([productId])
REFERENCES [dbo].[SalePrograms] ([salePrgmId])
GO
ALTER TABLE [dbo].[Sales] CHECK CONSTRAINT [FK_Sales_SalePrograms]
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAccount]    Script Date: 3/9/2024 7:21:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetAccountByEmail]    Script Date: 3/9/2024 7:21:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetAccountById]    Script Date: 3/9/2024 7:21:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetAllAccounts]    Script Date: 3/9/2024 7:21:34 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_InsertAccount]    Script Date: 3/9/2024 7:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertAccount]
    @fullName NVARCHAR(100),
    @email NVARCHAR(100),
    @password NVARCHAR(500),
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
/****** Object:  StoredProcedure [dbo].[sp_UpdateAccount]    Script Date: 3/9/2024 7:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Update Procedure
CREATE PROCEDURE [dbo].[sp_UpdateAccount]
    @accountId INT,
    @fullName NVARCHAR(100),
    @email NVARCHAR(100),
    @password NVARCHAR(500),
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
ALTER DATABASE [SWP391_Project_SQLShoes3] SET  READ_WRITE 
GO
