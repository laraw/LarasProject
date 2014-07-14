USE [NationalAustraliaBank]
GO
/****** Object:  Table [dbo].[transactionTypeLookup]    Script Date: 7/14/2014 10:22:11 PM ******/
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
