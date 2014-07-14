USE [NationalAustraliaBank]
GO
/****** Object:  Table [dbo].[Payee]    Script Date: 7/14/2014 10:22:11 PM ******/
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
