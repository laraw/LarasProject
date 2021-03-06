USE [master]
GO
/****** Object:  Database [NationalAustraliaBank]    Script Date: 7/19/2014 7:58:26 PM ******/
CREATE DATABASE [NationalAustraliaBank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BankDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BankDB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BankDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BankDB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NationalAustraliaBank] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NationalAustraliaBank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NationalAustraliaBank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET ARITHABORT OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [NationalAustraliaBank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NationalAustraliaBank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NationalAustraliaBank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NationalAustraliaBank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NationalAustraliaBank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET RECOVERY FULL 
GO
ALTER DATABASE [NationalAustraliaBank] SET  MULTI_USER 
GO
ALTER DATABASE [NationalAustraliaBank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NationalAustraliaBank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NationalAustraliaBank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NationalAustraliaBank] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NationalAustraliaBank', N'ON'
GO
USE [NationalAustraliaBank]
GO
/****** Object:  Table [dbo].[account]    Script Date: 7/19/2014 7:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[accountNumber] [int] IDENTITY(1000,1) NOT NULL,
	[accountTypeCode] [nvarchar](1) NOT NULL,
	[custID] [int] NOT NULL,
	[modifyDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[accountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[accountTypeLookup]    Script Date: 7/19/2014 7:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accountTypeLookup](
	[accountTypeCode] [nvarchar](1) NOT NULL,
	[Description] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[accountTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[addressTypeLookup]    Script Date: 7/19/2014 7:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[addressTypeLookup](
	[addressTypeCode] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_addressTypeLookup] PRIMARY KEY CLUSTERED 
(
	[addressTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[billPay]    Script Date: 7/19/2014 7:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[billPay](
	[billPayID] [int] IDENTITY(1000,1) NOT NULL,
	[accountNum] [int] NOT NULL,
	[payeeID] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[scheduleDate] [datetime] NOT NULL,
	[periodCode] [nvarchar](1) NOT NULL,
	[modifyDate] [datetime] NOT NULL,
 CONSTRAINT [PK_billPay] PRIMARY KEY CLUSTERED 
(
	[billPayID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer]    Script Date: 7/19/2014 7:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[custID] [int] IDENTITY(1001,1) NOT NULL,
	[custName] [nvarchar](50) NOT NULL,
	[TFN] [nvarchar](11) NULL,
	[dateCreated] [date] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[custID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customerAddress]    Script Date: 7/19/2014 7:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customerAddress](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[custID] [int] NOT NULL,
	[addressline1] [nvarchar](50) NOT NULL,
	[addressline2] [nvarchar](50) NOT NULL,
	[city] [nvarchar](40) NOT NULL,
	[state] [nvarchar](3) NOT NULL,
	[country] [nvarchar](50) NOT NULL,
	[postcode] [nvarchar](15) NOT NULL,
	[addressTypeCode] [int] NOT NULL,
 CONSTRAINT [PK_customerAddress] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customerPhoneNumber]    Script Date: 7/19/2014 7:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customerPhoneNumber](
	[pkID] [int] IDENTITY(1,1) NOT NULL,
	[custID] [int] NOT NULL,
	[phoneNumber] [nvarchar](15) NOT NULL,
	[phoneTypeCode] [int] NOT NULL,
	[silent] [bit] NOT NULL,
 CONSTRAINT [PK_customerPhoneNumber] PRIMARY KEY CLUSTERED 
(
	[pkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[login]    Script Date: 7/19/2014 7:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[login](
	[custID] [int] NOT NULL,
	[userid] [nvarchar](50) NOT NULL,
	[pass] [nvarchar](15) NOT NULL,
	[modifydate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[custID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payee]    Script Date: 7/19/2014 7:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payee](
	[payeeID] [int] IDENTITY(1000,1) NOT NULL,
	[payeeName] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[state] [nvarchar](3) NOT NULL,
	[bPayCode] [int] NOT NULL,
	[phone] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_Payee] PRIMARY KEY CLUSTERED 
(
	[payeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[periodLookup]    Script Date: 7/19/2014 7:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[periodLookup](
	[periodCode] [nvarchar](1) NOT NULL,
	[Description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[periodCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[phoneTypeLookup]    Script Date: 7/19/2014 7:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[phoneTypeLookup](
	[phoneTypeCode] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_phoneTypeLookup] PRIMARY KEY CLUSTERED 
(
	[phoneTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StateLookup]    Script Date: 7/19/2014 7:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateLookup](
	[StateCode] [nvarchar](3) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_StateLookup] PRIMARY KEY CLUSTERED 
(
	[StateCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[transactionTypeLookup]    Script Date: 7/19/2014 7:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactionTypeLookup](
	[transactionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[fee] [float] NOT NULL,
	[typeCode] [nvarchar](1) NULL,
 CONSTRAINT [PK_transactionTypeLookup] PRIMARY KEY CLUSTERED 
(
	[transactionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[accountTypeLookup] ([accountTypeCode], [Description]) VALUES (N'C', N'Cheque')
INSERT [dbo].[accountTypeLookup] ([accountTypeCode], [Description]) VALUES (N'S', N'Savings')
SET IDENTITY_INSERT [dbo].[addressTypeLookup] ON 

INSERT [dbo].[addressTypeLookup] ([addressTypeCode], [Description]) VALUES (1, N'Mailing')
INSERT [dbo].[addressTypeLookup] ([addressTypeCode], [Description]) VALUES (2, N'Billing')
SET IDENTITY_INSERT [dbo].[addressTypeLookup] OFF
INSERT [dbo].[periodLookup] ([periodCode], [Description]) VALUES (N'A', N'Annually')
INSERT [dbo].[periodLookup] ([periodCode], [Description]) VALUES (N'M', N'Monthly')
INSERT [dbo].[periodLookup] ([periodCode], [Description]) VALUES (N'O', N'Once Off')
INSERT [dbo].[periodLookup] ([periodCode], [Description]) VALUES (N'Q', N'Quarterly')
SET IDENTITY_INSERT [dbo].[phoneTypeLookup] ON 

INSERT [dbo].[phoneTypeLookup] ([phoneTypeCode], [Description]) VALUES (1, N'Home')
INSERT [dbo].[phoneTypeLookup] ([phoneTypeCode], [Description]) VALUES (2, N'Work')
INSERT [dbo].[phoneTypeLookup] ([phoneTypeCode], [Description]) VALUES (3, N'Mobile')
INSERT [dbo].[phoneTypeLookup] ([phoneTypeCode], [Description]) VALUES (4, N'Fax')
INSERT [dbo].[phoneTypeLookup] ([phoneTypeCode], [Description]) VALUES (5, N'Email')
SET IDENTITY_INSERT [dbo].[phoneTypeLookup] OFF
INSERT [dbo].[StateLookup] ([StateCode], [Description]) VALUES (N'ACT', N'Australian Capital Territory')
INSERT [dbo].[StateLookup] ([StateCode], [Description]) VALUES (N'NSW', N'New South Wales')
INSERT [dbo].[StateLookup] ([StateCode], [Description]) VALUES (N'NT', N'Northern Territory')
INSERT [dbo].[StateLookup] ([StateCode], [Description]) VALUES (N'QLD', N'Queensland')
INSERT [dbo].[StateLookup] ([StateCode], [Description]) VALUES (N'SA', N'South Australia')
INSERT [dbo].[StateLookup] ([StateCode], [Description]) VALUES (N'TAS', N'Tasmania')
INSERT [dbo].[StateLookup] ([StateCode], [Description]) VALUES (N'VIC', N'Victoria')
INSERT [dbo].[StateLookup] ([StateCode], [Description]) VALUES (N'WA', N'Western Australia')
SET IDENTITY_INSERT [dbo].[transactionTypeLookup] ON 

INSERT [dbo].[transactionTypeLookup] ([transactionTypeID], [Description], [fee], [typeCode]) VALUES (1, N'Credit - Deposit', 0, N'D')
INSERT [dbo].[transactionTypeLookup] ([transactionTypeID], [Description], [fee], [typeCode]) VALUES (2, N'Debit - Withdrawal', 0, N'W')
INSERT [dbo].[transactionTypeLookup] ([transactionTypeID], [Description], [fee], [typeCode]) VALUES (3, N'Debit - Transfer', 0, N'T')
INSERT [dbo].[transactionTypeLookup] ([transactionTypeID], [Description], [fee], [typeCode]) VALUES (5, N'Service - Internet Transaction History', 0.2, N'S')
INSERT [dbo].[transactionTypeLookup] ([transactionTypeID], [Description], [fee], [typeCode]) VALUES (6, N'Service - Funds Transfer', 0.2, N'S')
INSERT [dbo].[transactionTypeLookup] ([transactionTypeID], [Description], [fee], [typeCode]) VALUES (7, N'Service - Internet BPAY', 0.3, N'S')
INSERT [dbo].[transactionTypeLookup] ([transactionTypeID], [Description], [fee], [typeCode]) VALUES (9, N'Service - ATM', 0.2, N'S')
INSERT [dbo].[transactionTypeLookup] ([transactionTypeID], [Description], [fee], [typeCode]) VALUES (10, N'BillPay', 0, N'B')
SET IDENTITY_INSERT [dbo].[transactionTypeLookup] OFF
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_custID] FOREIGN KEY([custID])
REFERENCES [dbo].[customer] ([custID])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_custID]
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_typelookup] FOREIGN KEY([accountTypeCode])
REFERENCES [dbo].[accountTypeLookup] ([accountTypeCode])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_typelookup]
GO
ALTER TABLE [dbo].[billPay]  WITH CHECK ADD  CONSTRAINT [fk_Payee_BPAY] FOREIGN KEY([payeeID])
REFERENCES [dbo].[Payee] ([payeeID])
GO
ALTER TABLE [dbo].[billPay] CHECK CONSTRAINT [fk_Payee_BPAY]
GO
ALTER TABLE [dbo].[billPay]  WITH CHECK ADD  CONSTRAINT [fk_PeriodCode_BPAy] FOREIGN KEY([periodCode])
REFERENCES [dbo].[periodLookup] ([periodCode])
GO
ALTER TABLE [dbo].[billPay] CHECK CONSTRAINT [fk_PeriodCode_BPAy]
GO
ALTER TABLE [dbo].[customerAddress]  WITH CHECK ADD  CONSTRAINT [FK_customerAddress_addressTypeLookup] FOREIGN KEY([addressTypeCode])
REFERENCES [dbo].[addressTypeLookup] ([addressTypeCode])
GO
ALTER TABLE [dbo].[customerAddress] CHECK CONSTRAINT [FK_customerAddress_addressTypeLookup]
GO
ALTER TABLE [dbo].[customerAddress]  WITH CHECK ADD  CONSTRAINT [FK_customerAddress_customer] FOREIGN KEY([custID])
REFERENCES [dbo].[customer] ([custID])
GO
ALTER TABLE [dbo].[customerAddress] CHECK CONSTRAINT [FK_customerAddress_customer]
GO
ALTER TABLE [dbo].[customerAddress]  WITH CHECK ADD  CONSTRAINT [FK_customerAddress_StateLookup] FOREIGN KEY([state])
REFERENCES [dbo].[StateLookup] ([StateCode])
GO
ALTER TABLE [dbo].[customerAddress] CHECK CONSTRAINT [FK_customerAddress_StateLookup]
GO
ALTER TABLE [dbo].[customerPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_customerPhoneNumber_customerID] FOREIGN KEY([custID])
REFERENCES [dbo].[customer] ([custID])
GO
ALTER TABLE [dbo].[customerPhoneNumber] CHECK CONSTRAINT [FK_customerPhoneNumber_customerID]
GO
ALTER TABLE [dbo].[customerPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_customerPhoneNumber_phoneTypeLookup] FOREIGN KEY([phoneTypeCode])
REFERENCES [dbo].[phoneTypeLookup] ([phoneTypeCode])
GO
ALTER TABLE [dbo].[customerPhoneNumber] CHECK CONSTRAINT [FK_customerPhoneNumber_phoneTypeLookup]
GO
ALTER TABLE [dbo].[login]  WITH CHECK ADD  CONSTRAINT [FK_login_customerID] FOREIGN KEY([custID])
REFERENCES [dbo].[customer] ([custID])
GO
ALTER TABLE [dbo].[login] CHECK CONSTRAINT [FK_login_customerID]
GO
/****** Object:  Trigger [dbo].[TR_Customer_insert_Modified]    Script Date: 7/19/2014 7:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lara Wilkinson
-- Create date: 14/7/2014
-- Description: Updates last modified date to the current date when the row is changed.
-- =============================================
CREATE TRIGGER [dbo].[TR_Customer_insert_Modified]
   ON  [dbo].[customer]
   AFTER INSERT
AS 
BEGIN
	UPDATE [customer]
	SET datecreated = getdate()
	FROM [customer] c
	INNER JOIN inserted i 
		ON c.custID = i.custID

END

GO
/****** Object:  Trigger [dbo].[TR_Login_Update_Modified]    Script Date: 7/19/2014 7:58:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lara Wilkinson
-- Create date: 14/7/2014
-- Description: Updates last modified date to the current date when the row is changed.
-- =============================================
CREATE TRIGGER [dbo].[TR_Login_Update_Modified]
   ON  [dbo].[login]
   AFTER INSERT,UPDATE
AS 
BEGIN
	UPDATE [login]
	SET modifydate = getdate()
	FROM [login] t
	INNER JOIN inserted i 
		ON t.custID = i.custID

END

GO
USE [master]
GO
ALTER DATABASE [NationalAustraliaBank] SET  READ_WRITE 
GO
